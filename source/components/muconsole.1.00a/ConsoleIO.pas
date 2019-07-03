{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN UNSAFE_CODE OFF}

unit ConsoleIO platform;

interface

uses Messages, Windows, SysUtils, Classes, Forms,
     Controls{J.C.Faria}, trUtils{J.C.Faria, we needs of RegEx in this class}, Dialogs;

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
    ErrorReadPipe,
     ErrorWritePipe: THandle;
    FEnableKill: Boolean;
    FOnError: TReceiveEvent;
    FOnProcessStatusChange: TProcessStatusChangeEvent;
    FOnReceiveError: TReceiveEvent;
    FOnReceiveOutput: TReceiveEvent;
    FOutputBuffer: string;
    FProcessHandle: THandle;
    FSplitChar: Char;
    FSplitMode: TSplitMode;
    FSplitReceive: Boolean;
    FSplitSend: Boolean;
    FStopProcessOnFree: Boolean;
    FTerminateCommand: string;
    FWaitTimeout: Integer;
    FWindowHandle: HWND;
    InputReadPipe,
     InputWritePipe: THandle;
    OutputReadPipe,
     OutputWritePipe: THandle;

    function GetIsRunning: Boolean;
    function SplitSendAvail: string;

    procedure CloseProcessHandle;
    procedure Error(const Msg: string);
    procedure ProcessTerminated;
    procedure ReaderProc(Handle: THandle; MessageCode: Integer);
    procedure ReceiveError(Buf: Pointer; Size: Integer);
    procedure ReceiveOutput(Buf: Pointer; Size: Integer);
    procedure SetProcessHandle(const Value: THandle);

    property OutputBuffer: string read FOutputBuffer
                                  write FOutputBuffer;

    property ProcessHandle: THandle read FProcessHAndle
                                    write SetProcessHandle;

  protected
    procedure WndProc(var Msg: TMessage);

  public
    bRterm_Ready: boolean;  // J.C.Faria

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ClosePipes;
    procedure RunProcess(const CmdLine: string; CurrentDir: string = ''; ShowWindow: Boolean = False);
    procedure SendInput(Msg: string);
    procedure StopProcess;

  published
    property EnableKill: Boolean read FEnableKill
                                 write FEnableKill default False;

    property IsRunning: Boolean read GetIsRunning;

    property OnError: TReceiveEvent read FOnError
                                    write FOnError;

    property OnProcessStatusChange: TProcessStatusChangeEvent read FOnProcessStatusChange
                                                              write FOnProcessStatusChange;

    property OnReceiveError: TReceiveEvent read FOnReceiveError
                                           write FOnReceiveError;

    property OnReceiveOutput: TReceiveEvent read FOnReceiveOutput
                                            write FOnReceiveOutput;

    property SplitChar: Char read FSplitChar
                             write FSplitChar default #10;

    property SplitMode: TSplitMode read FSplitMode
                                   write FSplitMode default sm0D0A;

    property SplitReceive: Boolean read FSplitReceive
                                   write FSplitReceive default True;

    property SplitSend: Boolean read FSplitSend
                                write FSplitSend default True;

    property StopProcessOnFree: Boolean read FStopProcessOnFree
                                        write FStopProcessOnFree default True;

    property TerminateCommand: string read FTerminateCommand
                                      write FTerminateCommand;

    property WaitTimeout: Integer read FWaitTimeout
                                  write FWaitTimeout default 1000;
  end;

procedure Register;

implementation
uses
  ufrmMain,
  ufrmRterm;

procedure Register;
begin
  RegisterComponents('Mustits',
                     [TConsoleIO]);
end;

{ Win API wrappers }
procedure WinCheck(Result: Boolean);
begin
  if not Result then RaiseLastOSError;
end;

procedure InprocessDuplicateHandle(Source: THandle;
                                   var Destination: THandle);
var
  CurrentProcess: THandle;

begin
  CurrentProcess:= GetCurrentProcess;

  WinCheck(DuplicateHandle(CurrentProcess,
                           Source,
                           CurrentProcess,
                           @Destination,
                           0,
                           False,
                           DUPLICATE_SAME_ACCESS));
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
  Handler.ReaderProc(Handler.OutputReadPipe,
                     MIO_RECEIVE_OUTPUT);
end;

procedure IOReadError(Handler: TConsoleIO);
begin
  Handler.ReaderProc(Handler.ErrorReadPipe,
                     MIO_RECEIVE_ERROR);
end;

procedure WaitProcess(Handler: TConsoleIO);
begin
  if WaitForSingleObject(Handler.ProcessHandle,
                        INFINITE) = WAIT_OBJECT_0 then
    SendMessage(Handler.FWindowHandle,
                MIO_PROCESS_TERMINATED,
                0,
                0);
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

  Screen.Cursor:= crDefault;  // J.C.Faria
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

// Adapted by J.C.Faria To Tinn-R project
// It is now very fast and more robust due to use of RegEX (from 4.1.0.0)
procedure TConsoleIO.ReceiveOutput(Buf: Pointer;
                                   Size: Integer);

  procedure Tinn_R_Check;
  begin
    // Case: user closing Rterm by 'q()' -> [y,n,c]:
    // https://regex101.com/r/cY1hG2/1
    // by J.C.Faria
    if (fRegEx(OutputBuffer,
               '(?<= )\[[a-z\/]{5}\]:(?= )',
               False) <> '') then  begin
      OutputBuffer:= '';

      FOnReceiveOutput(Self,
                       'Please, stop the Rterm process from ''Rterm (close)'' option!');

      SendInput('' + #10);
      Exit;
    end;

    // Case: imcomplete intructions
    // https://regex101.com/r/aT7nX9/1
    // by J.C.Faria
    if (fRegEx(OutputBuffer,
               '[+]{1}[ ]{1}$',
               False) <> '') then begin
      OutputBuffer:= OutputBuffer + #10;
      Exit;
    end;

    // Case: 'specifyModel()' and 'specifyEquations()' functions of the package 'sem: Structural Equation Models'
    // https://regex101.com/r/zX7bT4/1
    // by J.C.Faria
    if (fRegEx(OutputBuffer,
               '[0-9]+:[ ]$',
               False) <> '') then begin
      OutputBuffer:= OutputBuffer + #10;
      Exit;
    end;

    // Case: use of 'txtProgressBar' function
    if (fRegEx(OutputBuffer,
               '^[=]+',              // style=1, it was possible to detect the pattern only using show message in the output
               False) <> '') or

       (fRegEx(OutputBuffer,
               '^(\r){1,3}[=]+',     // style=2, idem
               False) <> '') or

       (fRegEx(OutputBuffer,
               '^(\r)[ ]{2}\|[ ]+',  // style=3, idem
               False) <> '') then begin
      FOnReceiveOutput(Self,
                       OutputBuffer);

      OutputBuffer:= '';

      Exit;
    end;
  end;

var
  Cmd,
   sOutput: string;

  iPos: Integer;

  bUnderDebug: boolean;

begin
  bUnderDebug:= False;

  if (Size <= 0) then Exit;
  Screen.Cursor:= crHourglass;  // J.C.Faria

  sOutput:= '';

  SetLength(Cmd,
            Size);

  Move(Buf^,
       Cmd[1],
       Size);

  //ShowMessage(Cmd);  // To debug only

  OutputBuffer:= OutputBuffer +
                 Cmd;

  if not Assigned(FOnReceiveOutput) or
     (OutputBuffer = '') or
     (OutputBuffer = ' ') then Exit;

  (*
  J.C.Faria
  The below it is important due that some times,
  according with the packages loaded,
  R changes all pathern of the messages received:
  - from the default Windows -> string#13#10
  - to default Linux         -> string#10

  The pacakes are:
  - car
  - rms
  *)

  if (Pos(#13#10,
          OutputBuffer) > 0) then SplitMode:= sm0D0A
                             else SplitMode:= smSplitChar;

  if not SplitReceive or
     (SplitMode = smNone) then begin
    FOnReceiveOutput(Self,
                     OutputBuffer);

    OutputBuffer := '';
  end
  else if (SplitMode = sm0D0A) then begin
    //ShowMessage(OutputBuffer);  // To debug only
    Tinn_R_Check;

    repeat
      iPos:= Pos(#13#10,
                 OutputBuffer);

      if (iPos = 0) then Break;

      sOutput:= sOutput +
                Copy(OutputBuffer,
                     1,
                     iPos+1);

      OutputBuffer:= Copy(OutputBuffer,
                          iPos + 2,
                          Length(OutputBuffer));
    until False
  end
  else if (SplitMode = smSplitChar) then begin
    //ShowMessage(OutputBuffer);    // To debug only
    Tinn_R_Check;

    repeat
      iPos:= Pos(SplitChar,
                 OutputBuffer);

      if (iPos = 0) then Break;

      sOutput:= sOutput +
                Copy(OutputBuffer,
                     1,
                     iPos);  // Before Tinn version 4.0.2.1 it was wrong: iPos + 1

      OutputBuffer:= Copy(OutputBuffer,
                          iPos + 1,
                          Length(OutputBuffer));
    until False;
  end;

  FOnReceiveOutput(Self,
                   TrimRight(sOutput));

  // Checks if the request finished
  // https://regex101.com/r/jH2iA9/2
  // by J.C.Faria
  if (fRegEx(OutputBuffer,
             '^Browse\[[0-9]+\]>',  // STDin and STDout of IO are under the function debug
             False) <> '') or

     // https://regex101.com/r/sT5eI9/1
     // by J.C.Faria
     (fRegEx(OutputBuffer,
             '^D[\(\)0-9]*>',       // STDin and STDout of IO are under the package debug
             False) <> '') then bUnderDebug:= True;

  if (length(OutputBuffer) >=2) then
    if (OutputBuffer = '> ') or
       (Pos('> ',
            OutputBuffer) = length(OutputBuffer) - 1) or  //cat('x')
       bUnderDebug then begin
      FOnReceiveOutput(Self,
                       OutputBuffer);

      OutputBuffer:= '';

      bRterm_Ready:= True;

      Screen.Cursor:= crDefault
    end;

  // J.C.Faria
  // Check if it was sent an incomplete instruction and R return '+ '.
  // If yes, and R return '+ ',
  // it will send the next line of the script until to coomplete the R code block.
  with frmRterm do
    if bIO_Keyed then begin  // Set True in synIOKeyDown event
      bIO_Keyed:= False;  // Restart the control variable
      Exit;
    end;

  if (Cmd = '+ ') then
    with frmMain do
      if bRtermSend_Plus then actRSendLineExecute(nil);
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

// Adapted by J.C.Faria To Tinn-R project
procedure TConsoleIO.ReceiveError(Buf: Pointer;
                                  Size: Integer);
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

    iPos:= Pos(sSplit,
               Cmd);

    if (iPos = 0) then Break;

    FOnReceiveError(Self,
                    Copy(Cmd,
                         1,
                         iPos - 1));
{
    Cmd:= Copy(Cmd,
               iPos + 2,
               Length(Cmd));
}
    Cmd:= Copy(Cmd,
               iPos + length(sSplit),
               Length(Cmd));

  until False;
end;

procedure TConsoleIO.RunProcess(const CmdLine: string;
                                CurrentDir: string = '';
                                ShowWindow: Boolean = False);
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

  WinCheck(CreatePipe(InputReadPipe,
                      InputWriteTmp,
                      @SA,
                      0));

  WinCheck(CreatePipe(OutputReadTmp,
                      OutputWritePipe,
                      @SA,
                      0));

  WinCheck(CreatePipe(ErrorReadTmp,
                      ErrorWritePipe,
                      @SA,
                      0));

  InprocessDuplicateHandle(InputWriteTmp,
                           InputWritePipe);

  InprocessDuplicateHandle(OutputReadTmp,
                           OutputReadPipe);

  InprocessDuplicateHandle(ErrorReadTmp,
                           ErrorReadPipe);

  CloseAndZeroHandle(InputWriteTmp);

  CloseAndZeroHandle(OutputReadTmp);

  CloseAndZeroHandle(ErrorReadTmp);

  FillChar(SI,
           SizeOf(SI),
           $00);

  SI.cb         := SizeOf(SI);

  SI.dwFlags    := STARTF_USESTDHANDLES or
                   STARTF_USESHOWWINDOW;

  SI.hStdInput  := InputReadPipe;

  SI.hStdOutput := OutputWritePipe;

  SI.hStdError  := ErrorWritePipe;

  SI.wShowWindow:= ToShowWindowArg(ShowWindow);

  WinCheck(CreateProcess(nil,
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

  BeginThread(nil,
              0,
              @IOReadOutput,
              Self,
              0,
              ThreadId);

  BeginThread(nil,
              0,
              @IOReadError,
              Self,
              0,
              ThreadId);

  BeginThread(nil,
              0,
              @WaitProcess,
              Self,
              0,
              ThreadId);
end;

procedure TConsoleIO.SendInput(Msg: string);
var
  BytesWritten: Cardinal;

begin
  Msg:= Msg + SplitSendAvail;

  WinCheck(WriteFile(InputWritePipe,
                     Msg[1],
                     Length(Msg),
                     BytesWritten,
                     nil));
end;

procedure TConsoleIO.WndProc(var Msg: TMessage);
var
  Unhandled: Boolean;

begin
  with Msg do begin
    Unhandled:= False;

    try
      case Msg of
        MIO_RECEIVE_OUTPUT: ReceiveOutput(Pointer(wParam),
                                          LParam);

        MIO_RECEIVE_ERROR: ReceiveError(Pointer(wParam),
                                        LParam);

        MIO_PROCESS_TERMINATED: ProcessTerminated;

        MIO_ERROR: Error(AnsiString(Pointer(wParam)))
        else Unhandled:= True;
      end;
    except
      Application.HandleException(Self);
    end;

    if Unhandled then
      Result:= DefWindowProc(FWindowHandle,
                             Msg,
                             wParam,
                             lParam);
  end;
end;

procedure TConsoleIO.Error(const Msg: string);
begin
  if Assigned(FOnError) then FOnError(Self, Msg);
end;

procedure TConsoleIO.ReaderProc(Handle: THandle;
                                MessageCode: Integer);
const
  //CBytesToRead = 1024; // J.C.Faria
  //CBytesToRead = 2048; // J.C.Faria
  //CBytesToRead = 3072; // J.C.Faria
  CBytesToRead = 4096; // J.C.Faria -> the best velocity
  //CBytesToRead = 5120; // J.C.Faria
  //CBytesToRead = 6144; // J.C.Faria

var
  Buf: array[0..CBytesToRead] of Char;

  BytesRead: Cardinal;

  Err: string;

begin
  repeat
    if not ReadFile(Handle,
                    Buf,
                    SizeOf(Buf),
                    BytesRead,
                    nil) then
      try
        if not IsRunning then Exit;
        RaiseLastOSError;
      except
        on E: Exception do begin
          Err:= E.Message;

          Windows.SendMessage(FWindowHandle,
                              MIO_ERROR,
                              Integer(PChar(Err)),
                              Length(Err) + 1);
        end;
      end;
    if (BytesRead > 0) then Windows.SendMessage(FWindowHandle,
                                                MessageCode,
                                                Integer(@Buf),
                                                BytesRead);
//    ShowMessage(Buf);  // To debug only
  until False;
end;

procedure TConsoleIO.ProcessTerminated;
begin
  if Assigned(FOnReceiveOutput) then FOnReceiveOutput(Self,
                                                      OutputBuffer);
  bRterm_Ready:= False;  // J.C.Faria
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

  if Assigned(FOnProcessStatusChange) then FOnProcessStatusChange(Self,
                                                                  IsRunning);
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

  if (TerminateCommand <> '') then SendInput(TerminateCommand);

  Windows.TerminateProcess(ProcessHandle,
                           4);  // J.C.Faria

  if not EnableKill then Exit;

  if (TerminateCommand <> '') then
    if (WaitForSingleObject(ProcessHandle,
                            WaitTimeout) = WAIT_OBJECT_0) then Exit;

  //Windows.TerminateProcess(ProcessHandle, 4);  // J.C.Faria
  Screen.Cursor:= crDefault;  // J.C.Faria
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