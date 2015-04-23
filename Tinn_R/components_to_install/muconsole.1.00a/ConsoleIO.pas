
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN UNSAFE_CODE OFF}

unit ConsoleIO platform;

interface

uses Messages, Windows, SysUtils, Classes, Forms;

const
  MIO_OFFSET             = $1911;
  MIO_RECEIVE_OUTPUT     = WM_USER + MIO_OFFSET + 0;
  MIO_RECEIVE_ERROR      = WM_USER + MIO_OFFSET + 1;
  MIO_ERROR              = WM_USER + MIO_OFFSET + 2;
  MIO_PROCESS_TERMINATED = WM_USER + MIO_OFFSET + 3;

type
  TReceiveEvent             = procedure(Sender: TObject; const Cmd: string) of object;
  TProcessStatusChangeEvent = procedure(Sender: TObject; IsRunning: Boolean) of object;
  TSplitMode                = (smNone, sm0D0A, smSplitchar);

  TConsoleIO = class(TComponent)
  private
    FWindowHandle: HWND;
    InputReadPipe, InputWritePipe: THandle;
    OutputReadPipe, OutputWritePipe: THandle;
    ErrorReadPipe, ErrorWritePipe: THandle;
    FProcessHandle: THandle;
    FTerminateCommand: string;
    FEnableKill: Boolean;
    FWaitTimeout: Integer;
    FStopProcessOnFree: Boolean;
    FOnReceiveError: TReceiveEvent;
    FOnReceiveOutput: TReceiveEvent;
    FOnError: TReceiveEvent;
    FOnProcessStatusChange: TProcessStatusChangeEvent;
    FOutputBuffer: string;
    FSplitReceive: Boolean;
    FSplitSend: Boolean;
    FSplitChar: Char;
    FSplitMode: TSplitMode;
    function GetIsRunning: Boolean;
    procedure SetProcessHandle(const Value: THandle);
    procedure ReceiveOutput(Buf: Pointer; Size: Integer);
    procedure ReceiveError(Buf: Pointer; Size: Integer);
    procedure Error(const Msg: string);
    procedure ReaderProc(Handle: THandle; MessageCode: Integer);
    procedure ProcessTerminated;
    procedure CloseProcessHandle;
    function SplitSendAvail: string;
    property ProcessHandle: THandle read FProcessHAndle write SetProcessHandle;
    property OutputBuffer: string read FOutputBuffer write FOutputBuffer;
  protected
    procedure WndProc(var Msg: TMessage);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ClosePipes;
    procedure SendInput(Msg: string);
    procedure RunProcess(const CmdLine: string; CurrentDir: string = ''; ShowWindow: Boolean = False);
    procedure StopProcess;
  published
    property IsRunning: Boolean read GetIsRunning;
    property OnReceiveOutput: TReceiveEvent read FOnReceiveOutput write FOnReceiveOutput;
    property OnReceiveError: TReceiveEvent read FOnReceiveError write FOnReceiveError;
    property OnError: TReceiveEvent read FOnError write FOnError;
    property OnProcessStatusChange: TProcessStatusChangeEvent read FOnProcessStatusChange write FOnProcessStatusChange;
    property TerminateCommand: string read FTerminateCommand write FTerminateCommand;
    property StopProcessOnFree: Boolean read FStopProcessOnFree write FStopProcessOnFree default True;
    property EnableKill: Boolean read FEnableKill write FEnableKill default False;
    property WaitTimeout: Integer read FWaitTimeout write FWaitTimeout default 1000;
    property SplitMode: TSplitMode read FSplitMode write FSplitMode default sm0D0A;
    property SplitChar: Char read FSplitChar write FSplitChar default #10;
    property SplitReceive: Boolean read FSplitReceive write FSplitReceive default True;
    property SplitSend: Boolean read FSplitSend write FSplitSend default True;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Mustits', [TConsoleIO]);
end;

{ Win API wrappers }
procedure WinCheck(Result: Boolean);
begin
  if not Result then RaiseLastOSError;
end;

procedure InprocessDuplicateHandle(Source: THandle; var Destination: THandle);
var
  CurrentProcess: THandle;

begin
  CurrentProcess:= GetCurrentProcess;
  WinCheck(DuplicateHandle(
    CurrentProcess,
    Source,
    CurrentProcess,
    @Destination,
    0, False, DUPLICATE_SAME_ACCESS));
end;

procedure CloseAndZeroHandle(var Handle: THandle);
var
  SaveHandle: THandle;

begin
  SaveHandle:= Handle;
  Handle:= 0;
  WinCheck(CloseHandle(SaveHandle));
end;

function ToPChar(const St: string): PChar;
begin
  if (St = '') then Result:= nil
               else Result:= PChar(St);
end;

function ToShowWindowArg(ShowWindow: Boolean): Integer;
begin
  if ShowWindow then Result:= SW_SHOW
                else Result:= SW_HIDE
end;

{ Thread functions }
procedure IOReadOutput(Handler: TConsoleIO);
begin
  Handler.ReaderProc(Handler.OutputReadPipe, MIO_RECEIVE_OUTPUT);
end;

procedure IOReadError(Handler: TConsoleIO);
begin
  Handler.ReaderProc(Handler.ErrorReadPipe, MIO_RECEIVE_ERROR);
end;

procedure WaitProcess(Handler: TConsoleIO);
begin
  if WaitForSingleObject(Handler.ProcessHandle, INFINITE) = WAIT_OBJECT_0 then
    SendMessage(Handler.FWindowHandle, MIO_PROCESS_TERMINATED, 0, 0);
end;

{ TConsoleIO }
procedure TConsoleIO.ClosePipes;
begin
  CloseAndZeroHandle(InputReadPipe);
  CloseAndZeroHandle(OutputWritePipe);
  CloseAndZeroHandle(ErrorWritePipe);
  CloseAndZeroHandle(InputWritePipe);
  CloseAndZeroHandle(OutputReadPipe);
  CloseAndZeroHandle(ErrorReadPipe);
end;

constructor TConsoleIO.Create(AOwner: TComponent);
begin
  inherited;
  FTerminateCommand := 'quit';
  FSplitChar        := #10;
  FSplitMode        := sm0D0A;
  FSplitReceive     := True;
  FSplitSend        := True;
  FStopProcessOnFree:= True;
  FWaitTimeout      := 1000;
  FWindowHandle     := Classes.AllocateHWnd(WndProc);
end;

destructor TConsoleIO.Destroy;
begin
  if StopProcessOnFree then StopProcess;
  CloseProcessHandle;
  Classes.DeallocateHWnd(FWindowHandle);
  FWindowHandle:= 0;
  inherited;
end;

(* //Original
procedure TConsoleIO.ReceiveOutput(Buf: Pointer; Size: Integer);
var
  Cmd: string;
  TastyStrPos: Integer;
begin
  if (Size <= 0) then Exit;
  SetLength(Cmd, Size);
  Move(Buf^, Cmd[1], Size);
  OutputBuffer := OutputBuffer + Cmd;
  if not Assigned(FOnReceiveOutput) then Exit;

  if not SplitReceive or (SplitMode = smNone) then
  begin
    FOnReceiveOutput(Self, OutputBuffer);
    OutputBuffer := '';
  end
  else if SplitMode = sm0D0A then
    repeat
      TastyStrPos := Pos(#13#10, OutputBuffer);
      if TastyStrPos = 0 then Break;
      FOnReceiveOutput(Self, Copy(OutputBuffer, 1, TastyStrPos-1));
      OutputBuffer := Copy(OutputBuffer, TastyStrPos+2, Length(OutputBuffer));
    until False
  else if SplitMode = smSplitChar then
    repeat
      TastyStrPos := Pos(SplitChar, OutputBuffer);
      if TastyStrPos = 0 then Break;
      FOnReceiveOutput(Self, Copy(OutputBuffer, 1, TastyStrPos-1));
      OutputBuffer := Copy(OutputBuffer, TastyStrPos+1, Length(OutputBuffer));
    until False;
end;
*)

// Adapted by JCFaria To Tinn-R project
procedure TConsoleIO.ReceiveOutput(Buf: Pointer; Size: Integer);

  procedure TinnRCheck_1;
  var
    iPos: integer;

  begin
    iPos:= Pos(']:', OutputBuffer);
    if (iPos <> 0) then  begin
      OutputBuffer:= '';
      FOnReceiveOutput(Self, 'Please, stop the process from ''Rterm (close)'' option!');
      SendInput('' + #10);
    end;
    if (Length(Trim(OutputBuffer)) >= 1) then // Imcomplete intructions
      if (OutputBuffer[Length(OutputBuffer) - 1] = '+') then OutputBuffer:= OutputBuffer + #10;

    if (Length(Trim(OutputBuffer)) > 1) and   // 'cat' intructions JCFaria
      (OutputBuffer[Length(OutputBuffer) - 1] = '>') then OutputBuffer:= OutputBuffer + #10;
  end;

  procedure TinnRCheck_2;
  begin
    if (Trim(OutputBuffer) = '>') then begin
        FOnReceiveOutput(Self, '> ');
        OutputBuffer:= '';
    end;
  end;

var
  Cmd        : string;
  TastyStrPos: Integer;

begin
  if (Size <= 0) then Exit;
  SetLength(Cmd, Size);
  Move(Buf^, Cmd[1], Size);
  OutputBuffer:= OutputBuffer + Cmd;

  if not Assigned(FOnReceiveOutput) or
     (OutputBuffer = '') or
     (OutputBuffer = ' ') then Exit;
  (*
  JCFaria
  The below it is important due that the R package Matrix
  when loaded changes all messages received form R:
   - Matrix not loaded: string#13#10 (Windows default)
   - Matrix loaded    : strng#10     (Linux default)
  *)
  if (Pos(#13#10, OutputBuffer) > 0) then SplitMode:= sm0D0A
                                     else SplitMode:= smSplitChar;
  if not SplitReceive or
     (SplitMode = smNone) then begin
    FOnReceiveOutput(Self, OutputBuffer);
    OutputBuffer := '';
  end
  else if (SplitMode = sm0D0A) then begin
    TinnRCheck_1;
    repeat
      TinnRCheck_2;
      TastyStrPos:= Pos(#13#10, OutputBuffer);
      if (TastyStrPos = 0) then Break;
      FOnReceiveOutput(Self, Copy(OutputBuffer, 1, TastyStrPos - 1));
      OutputBuffer:= Copy(OutputBuffer, TastyStrPos + 2, Length(OutputBuffer));
    until False
  end
  else if (SplitMode = smSplitChar) then
    TinnRCheck_1;
    repeat
      TinnRCheck_2;
      TastyStrPos:= Pos(SplitChar, OutputBuffer);
      if (TastyStrPos = 0) then Break;
      FOnReceiveOutput(Self, Copy(OutputBuffer, 1, TastyStrPos - 1));
      OutputBuffer:= Copy(OutputBuffer, TastyStrPos + 1, Length(OutputBuffer));
    until False;
end;

(* //Original
procedure TConsoleIO.ReceiveError(Buf: Pointer; Size: Integer);
var
  Cmd: string;
begin
  if (Size <= 0) then Exit;
  if not Assigned(FOnReceiveOutput) then Exit;
  SetLength(Cmd, Size);
  Move(Buf^, Cmd[1], Size);
  FOnReceiveError(Self, Cmd);
end;
*)

// Adapted by JCFaria To Tinn-R project
procedure TConsoleIO.ReceiveError(Buf: Pointer; Size: Integer);
var
  iPos: integer;
  Cmd,
   sSplit : string;

begin
  if (Size <= 0) then Exit;
  if not Assigned(FOnReceiveOutput) then Exit;
  SetLength(Cmd, Size);
  Move(Buf^, Cmd[1], Size);
  if (Pos(#13#10, Cmd) > 0) then sSplit:= #13#10
                            else sSplit:= #10;
  repeat
    Cmd:= OutputBuffer + Cmd;
    OutputBuffer:= '';
    iPos:= Pos(sSplit, Cmd);
    if (iPos = 0) then Break;
    FOnReceiveError(Self, Copy(Cmd, 1, iPos - 1));
    Cmd:= Copy(Cmd, iPos + 2, Length(Cmd));
  until False;
end;

procedure TConsoleIO.RunProcess(const CmdLine: string; CurrentDir: string = ''; ShowWindow: Boolean = False);
var
  SA: TSecurityAttributes;
  SI: TStartupInfo;
  PI: TProcessInformation;

  InputWriteTmp: THandle;
  OutputReadTmp: THandle;
  ErrorReadTmp:  THandle;

  ThreadId: Cardinal;

begin
  SA.nLength             := SizeOf(SA);
  SA.lpSecurityDescriptor:= nil;
  SA.bInheritHandle      := True;

  WinCheck(CreatePipe(InputReadPipe, InputWriteTmp, @SA, 0));
  WinCheck(CreatePipe(OutputReadTmp, OutputWritePipe, @SA, 0));
  WinCheck(CreatePipe(ErrorReadTmp, ErrorWritePipe, @SA, 0));

  InprocessDuplicateHandle(InputWriteTmp, InputWritePipe);
  InprocessDuplicateHandle(OutputReadTmp, OutputReadPipe);
  InprocessDuplicateHandle(ErrorReadTmp, ErrorReadPipe);

  CloseAndZeroHandle(InputWriteTmp);
  CloseAndZeroHandle(OutputReadTmp);
  CloseAndZeroHandle(ErrorReadTmp);

  FillChar(SI, SizeOf(SI), $00);
  SI.cb         := SizeOf(SI);
  SI.dwFlags    := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
  SI.hStdInput  := InputReadPipe;
  SI.hStdOutput := OutputWritePipe;
  SI.hStdError  := ErrorWritePipe;
  SI.wShowWindow:= ToShowWindowArg(ShowWindow);

  WinCheck(CreateProcess(
    nil,
    PChar(CmdLine),
    @SA,
    nil,
    True,
    CREATE_NEW_CONSOLE,
    nil,
    ToPChar(CurrentDir),
    SI,
    PI));

  CloseAndZeroHandle(PI.hThread);
  ProcessHandle:= PI.hProcess;
  BeginThread(nil, 0, @IOReadOutput, Self, 0, ThreadId);
  BeginThread(nil, 0, @IOReadError,  Self, 0, ThreadId);
  BeginThread(nil, 0, @WaitProcess,  Self, 0, ThreadId);
end;

procedure TConsoleIO.SendInput(Msg: string);
var
  BytesWritten: Cardinal;

begin
  Msg:= Msg + SplitSendAvail;
  WinCheck(WriteFile(InputWritePipe, Msg[1], Length(Msg), BytesWritten, nil));
end;

procedure TConsoleIO.WndProc(var Msg: TMessage);
var
  Unhandled: Boolean;

begin
  with Msg do begin
    Unhandled:= False;
    try
      case Msg of
        MIO_RECEIVE_OUTPUT:     ReceiveOutput(Pointer(wParam), LParam);
        MIO_RECEIVE_ERROR:      ReceiveError(Pointer(wParam), LParam);
        MIO_PROCESS_TERMINATED: ProcessTerminated;
        MIO_ERROR:              Error(AnsiString(Pointer(wParam)))
        else Unhandled:= True;
      end;
    except
      Application.HandleException(Self);
    end;
    if Unhandled then
      Result:= DefWindowProc(FWindowHandle, Msg, wParam, lParam);
  end;
end;

procedure TConsoleIO.Error(const Msg: string);
begin
  if Assigned(FOnError) then FOnError(Self, Msg);
end;

procedure TConsoleIO.ReaderProc(Handle: THandle; MessageCode: Integer);
var
  Buf:       array[0..1024] of Char;
  BytesRead: Cardinal;
  Err:       string;

begin
  repeat
    if not ReadFile(Handle, Buf, SizeOf(Buf), BytesRead, nil) then
      try
        if not IsRunning then Exit;
        RaiseLastOSError;
      except
        on E: Exception do begin
          Err:= E.Message;
          Windows.SendMessage(FWindowHandle, MIO_ERROR, Integer(PChar(Err)), Length(Err) + 1);
        end;
      end;
    if (BytesRead > 0) then Windows.SendMessage(FWindowHandle, MessageCode, Integer(@Buf), BytesRead);
  until False;
end;

procedure TConsoleIO.ProcessTerminated;
begin
  if Assigned(FOnReceiveOutput) then FOnReceiveOutput(Self, OutputBuffer);
  OutputBuffer:= '';
  CloseProcessHandle;
  ClosePipes;
end;

function TConsoleIO.GetIsRunning: Boolean;
begin
  Result:= (ProcessHandle <> 0);
end;

procedure TConsoleIO.SetProcessHandle(const Value: THandle);
begin
  if (FProcessHandle = Value) then Exit;
  Assert((ProcessHandle = 0) or (Value = 0));
  FProcessHandle:= Value;
  if Assigned(FOnProcessStatusChange) then FOnProcessStatusChange(Self, IsRunning);
end;

procedure TConsoleIO.CloseProcessHandle;
begin
  if (ProcessHandle = 0) then Exit;
  WinCheck(CloseHandle(ProcessHandle));
  ProcessHandle:= 0;
end;

procedure TConsoleIO.StopProcess;
begin
  if not IsRunning then Exit;
  if (TerminateCommand <> '') then SendInput(TerminateCommand{, False});
  Windows.TerminateProcess(ProcessHandle, 4);  //JCFaria
  if not EnableKill then Exit;
  if (TerminateCommand <> '') then
    if (WaitForSingleObject(ProcessHandle, WaitTimeout) = WAIT_OBJECT_0) then Exit;
  //Windows.TerminateProcess(ProcessHandle, 4);  //JCFaria
end;

function TConsoleIO.SplitSendAvail: string;
begin
  Result:= '';
  if not SplitSend then Exit;
  if (SplitMode = smNone) then Exit;
  if (SplitMode = sm0D0A) then Result:= #$0D#$0A
                          else Result:= SplitChar
end;

end.