(*
 string                    sMyString
 THandle                   hMyHandle
 Tproperty                 ptMyProperty
 Tboolean                  bMyBoolean
 Tchar                     cMyChar
 THWND                     whMyHWND
 TReceiveEvent             reMyReceiveEvent
 TProcessStatusChangeEvent pseMyProcessStatusChangeEvent
 Cardinal                  cdMyCardinal
 Pointer                   poMyPointer
 TMessage                  mMyMessage
 TSplitMode                smMySplitMode
*)

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CAST OFF}
{$WARN UNSAFE_CODE OFF}

unit ConsoleIO platform;

interface

uses Messages, Windows, SysUtils, Classes, Forms,
     Controls{J.C.Faria},
     trUtils{J.C.Faria, we needs of TRegEx in this class},
     Dialogs;

const
  MIO_OFFSET             = $1911;
  MIO_RECEIVE_OUTPUT     = WM_USER + MIO_OFFSET + 0;
  MIO_RECEIVE_ERROR      = WM_USER + MIO_OFFSET + 1;
  MIO_ERROR              = WM_USER + MIO_OFFSET + 2;
  MIO_PROCESS_TERMINATED = WM_USER + MIO_OFFSET + 3;

type
  TReceiveEvent             = procedure(Sender: TObject; const Cmd: string) of object;
  TProcessStatusChangeEvent = procedure(Sender: TObject; IsRunning: Boolean) of object;
  TSplitMode                = (smNone, sm0D0A, smChar);

  TConsoleIO = class(TComponent)
  private
    hErrorReadPipe,
     hErrorWritePipe: THandle;
    bEnableKill: Boolean;
    reOnError: TReceiveEvent;
    pseOnProcessStatusChange: TProcessStatusChangeEvent;
    reOnReceiveError: TReceiveEvent;
    reOnReceiveOutput: TReceiveEvent;
    sOutputBuffer: string;
    hProcessHandle: THandle;
    cSplitChar: Char;
    smSplitMode: TSplitMode;
    bSplitReceive,
     bSplitSend,
     bStopProcessOnFree: Boolean;
    sTerminateCommand: string;
    iWaitTimeout: Integer;
    whWindowHandle: HWND;
    hInputReadPipe,
     hInputWritePipe: THandle;
    hOutputReadPipe,
     hOutputWritePipe: THandle;

    function GetIsRunning: Boolean;
    function SplitSendAvail: string;

    procedure CloseProcessHandle;
    procedure Error(const Msg: string);
    procedure ProcessTerminated;
    procedure ReaderProc(Handle: THandle; MessageCode: Integer);
    procedure ReceiveError(Buf: Pointer; Size: Integer);
    procedure ReceiveOutput(poBuf: Pointer; iSize: Integer);
    procedure SetProcessHandle(const Value: THandle);

    property ptOutputBuffer: string read sOutputBuffer
                                    write sOutputBuffer;

    property ptProcessHandle: THandle read hProcessHandle
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
    property EnableKill: Boolean read bEnableKill
                                 write bEnableKill default False;

    property IsRunning: Boolean read GetIsRunning;

    property OnError: TReceiveEvent read reOnError
                                    write reOnError;

    property OnProcessStatusChange: TProcessStatusChangeEvent read pseOnProcessStatusChange
                                                              write pseOnProcessStatusChange;

    property OnReceiveError: TReceiveEvent read reOnReceiveError
                                           write reOnReceiveError;

    property OnReceiveOutput: TReceiveEvent read reOnReceiveOutput
                                            write reOnReceiveOutput;

    property SplitChar: Char read cSplitChar
                             write cSplitChar default #10;

    property SplitMode: TSplitMode read smSplitMode
                                   write smSplitMode default sm0D0A;

    property SplitReceive: Boolean read bSplitReceive
                                   write bSplitReceive default True;

    property SplitSend: Boolean read bSplitSend
                                write bSplitSend default True;

    property StopProcessOnFree: Boolean read bStopProcessOnFree
                                        write bStopProcessOnFree default True;

    property TerminateCommand: string read sTerminateCommand
                                      write sTerminateCommand;

    property WaitTimeout: Integer read iWaitTimeout
                                  write iWaitTimeout default 1000;
  end;

procedure Register;

implementation
uses
  ufrmMain,
  ufrmR_Term;

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
  hCurrentProcess: THandle;

begin
  hCurrentProcess:= GetCurrentProcess;

  WinCheck(DuplicateHandle(hCurrentProcess,
                           Source,
                           hCurrentProcess,
                           @Destination,
                           0,
                           False,
                           DUPLICATE_SAME_ACCESS));
end;

procedure CloseAndZeroHandle(var Handle: THandle);
var
  hSaveHandle: THandle;

begin
  hSaveHandle:= Handle;
  Handle:= 0;
  WinCheck(CloseHandle(hSaveHandle));
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
  Handler.ReaderProc(Handler.hOutputReadPipe,
                     MIO_RECEIVE_OUTPUT);
end;

procedure IOReadError(Handler: TConsoleIO);
begin
  Handler.ReaderProc(Handler.hErrorReadPipe,
                     MIO_RECEIVE_ERROR);
end;

procedure WaitProcess(Handler: TConsoleIO);
begin
  if WaitForSingleObject(Handler.ptProcessHandle,
                        INFINITE) = WAIT_OBJECT_0 then
    SendMessage(Handler.whWindowHandle,
                MIO_PROCESS_TERMINATED,
                0,
                0);
end;

{ TConsoleIO }
procedure TConsoleIO.ClosePipes;
begin
  CloseAndZeroHandle(hInputReadPipe);
  CloseAndZeroHandle(hOutputWritePipe);
  CloseAndZeroHandle(hErrorWritePipe);
  CloseAndZeroHandle(hInputWritePipe);
  CloseAndZeroHandle(hOutputReadPipe);
  CloseAndZeroHandle(hErrorReadPipe);

  Screen.Cursor:= crDefault;  // J.C.Faria
end;

constructor TConsoleIO.Create(AOwner: TComponent);
begin
  inherited;
  sTerminateCommand := 'quit';
  cSplitChar        := #10;
  smSplitMode       := sm0D0A;
  bSplitReceive     := True;
  bSplitSend        := True;
  bStopProcessOnFree:= True;
  iWaitTimeout      := 1000;
  whWindowHandle    := Classes.AllocateHWnd(WndProc);
end;

destructor TConsoleIO.Destroy;
begin
  if StopProcessOnFree then StopProcess;

  CloseProcessHandle;
  Classes.DeallocateHWnd(whWindowHandle);
  whWindowHandle:= 0;

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
procedure TConsoleIO.ReceiveOutput(poBuf: Pointer;
                                   iSize: Integer);

  procedure pReceive_ptOutputBuffer;
  begin
    reOnReceiveOutput(Self,
      ptOutputBuffer);
    ptOutputBuffer := '';
  end;

  procedure pQuit_Check;
  begin
    // Case: user closing Rterm by 'q()' -> [y,n,c]:
    // https://regex101.com/r/cY1hG2/1
    // by J.C.Faria
    if (fRegEx(ptOutputBuffer,
               '(?<= )\[[a-z\/]{5}\]:(?= )',
               False) <> '') then  begin
      ptOutputBuffer:= '';

      reOnReceiveOutput(Self,
                        'Please, stop the Rterm process from ''Rterm (close)'' option!');

      SendInput('' + #10);
      Exit;
    end;
  end;

  procedure pDemo_Check;
  begin
    if (fRegEx(Trim(ptOutputBuffer),
               'to start :$') <> '') then
      pReceive_ptOutputBuffer;

    // Plotrix demo: "Choose a group -"
    // Plotrix demo: "Choose a plot -"
    if (fRegEx(Trim(ptOutputBuffer),
               'Choose (a|an) (group|plot|enhancement) -$') <> '') then
      pReceive_ptOutputBuffer;
  end;

  procedure pCheck_Request_Finished(var bUnderDebug: boolean);
  begin
    // Checks if the request finished
    // https://regex101.com/r/jH2iA9/2
    // by J.C.Faria
    if (fRegEx(ptOutputBuffer,
               '^Browse\[[0-9]+\]>',  // STDin and STDout of IO are under the function debug
               False) <> '') or

       // https://regex101.com/r/sT5eI9/1
       // by J.C.Faria
       (fRegEx(ptOutputBuffer,
               '^D[\(\)0-9]*>',       // STDin and STDout of IO are under the package debug
               False) <> '') then bUnderDebug:= True;

    if (length(ptOutputBuffer) >=2) then
      if (ptOutputBuffer = '> ') or
         (Pos('> ',
              ptOutputBuffer) = length(ptOutputBuffer) - 1) or  //cat('x')
         bUnderDebug then
      begin
        pReceive_ptOutputBuffer;
        bRterm_Ready:= True;
        Screen.Cursor:= crDefault
      end;
    end;

  procedure pIncomplete_Check;
  begin
    // Case: imcomplete intructions
    // https://regex101.com/r/aT7nX9/1
    // by J.C.Faria
    if (fRegEx(ptOutputBuffer,
               '[+]{1}[ ]{1}$',
               False) <> '') then
      ptOutputBuffer:= ptOutputBuffer + #10;
  end;

  procedure psem_Package_Check;
  begin
    // Case: 'specifyModel()' and 'specifyEquations()' functions of the package 'sem: Structural Equation Models'
    // https://regex101.com/r/zX7bT4/1
    // by J.C.Faria
    if (fRegEx(ptOutputBuffer,
               '[0-9]+:[ ]$',
               False) <> '') then
      ptOutputBuffer:= ptOutputBuffer + #10;
  end;

  procedure ptxtProgressBar_Check;
  begin
    // Case: use of 'txtProgressBar' function
    if (fRegEx(ptOutputBuffer,
               '^[=]+',              // style=1, it was possible to detect the pattern only using show message in the output
               False) <> '') or
       (fRegEx(ptOutputBuffer,
               '^(\r){1,3}[=]+',     // style=2, idem
               False) <> '') or
       (fRegEx(ptOutputBuffer,
               '^(\r)[ ]{2}\|[ ]+',  // style=3, idem
               False) <> '') then
      pReceive_ptOutputBuffer;
  end;

  procedure pGrindReceived(sSplit: string; i: integer; var sOutput: string);
  var
    iPos: integer;

  begin
    repeat
      iPos:= Pos(sSplit,
                 ptOutputBuffer);

      if (iPos = 0) then Break;

      sOutput:= sOutput +
                Copy(ptOutputBuffer,
                     1,
                     iPos+1);

      ptOutputBuffer:= Copy(ptOutputBuffer,
                            iPos + i,
                            Length(ptOutputBuffer));
    until False
  end;

var
  sCmd,
   sOutput: string;

  bUnderDebug: boolean;

begin
  bUnderDebug:= False;

  if (iSize <= 0) then Exit;
  Screen.Cursor:= crHourglass;  // J.C.Faria

  sOutput:= '';

  SetLength(sCmd,
            iSize);

  Move(poBuf^,
       sCmd[1],
       iSize);

  ptOutputBuffer:= ptOutputBuffer +
                   sCmd;

  if not Assigned(reOnReceiveOutput) or
     (ptOutputBuffer = '') or
     (ptOutputBuffer = ' ') then Exit;

  pQuit_Check;
  pDemo_Check;
  pIncomplete_Check;
  psem_Package_Check;
  ptxtProgressBar_Check;

{
 The R package "semPlot" when loaded changes the default line separator (Line Feed) #13#10 (Windows)
 to #10 (Linux and Mac) in the messaging system of the Windows operating system. Even worse,
 even after detached - detach (packages: semPlot) - the change is persistent only returning to normal
 if the R section ends. So the best way is to guarantee the replacement of #10 to the standard #13#10.
}
  if (Pos(#13#10,
          ptOutputBuffer) = 0) and
     (Pos(#10,
          ptOutputBuffer) > 0) then
    ptOutputBuffer:= StringReplace(ptOutputBuffer,
                                   #10,
                                   #13#10,
                                   [rfReplaceAll]);

  if (Pos(#13#10,
          ptOutputBuffer) > 0) then SplitMode:= sm0D0A
                               else SplitMode:= smChar;

  if not SplitReceive or
     (SplitMode = smNone) then begin
    reOnReceiveOutput(Self,
                      ptOutputBuffer);

    ptOutputBuffer := '';
    Exit;
  end;

  sOutput := '';
  if (SplitMode = sm0D0A) then  //#13#10
    pGrindReceived(#13#10,
                   2,
                   sOutput)
  else  //Char...
    pGrindReceived(SplitChar,
                   1,
                   sOutput);

  if (sOutput <> '') then
    reOnReceiveOutput(Self,
                      TrimRight(sOutput));

  pCheck_Request_Finished(bUnderDebug);

  // J.C.Faria
  // Check if it was sent an incomplete instruction and R return '+ '.
  // If yes, and R return '+ ',
  // it will send the next line of the script until to coomplete the R code block.
  with frmR_Term do
    if bIO_Keyed then begin  // Set True in synIOKeyDown event
      bIO_Keyed:= False;     // Restart the control variable
      Exit;
    end;

  if (sCmd = '+ ') then
    with frmMain do
      if bRterm_Send_Plus then actRSend_LineExecute(nil);
end;

(*
// Adapted by J.C.Faria
procedure TConsoleIO.ReceiveOutput(poBuf: Pointer; iSize: integer);

  {It is important due that the some R packages
   (Matrix, car, rsm)
   when loaded changes all messages received form R:
    - Matrix not loaded: String#13#10 (Windows default)
    - Matrix loaded    : strng#10     (Linux default)}
  procedure pR_Split_Adequation;
  begin
    if (Pos(#13#10, ptOutputBuffer) > 0) then
      SplitMode := sm0D0A
    else
      SplitMode := smChar;
  end;

  procedure pReceive_Custom(sTmp: string);
  begin
    reOnReceiveOutput(Self,
      sTmp);
    ptOutputBuffer := '';
  end;

  procedure pReceive_sOutput(var sTmp: string);
  begin
    reOnReceiveOutput(Self,
      TrimRight(sTmp));
    sTmp := '';
  end;

  procedure pReceive_ptOutputBuffer;
  begin
    reOnReceiveOutput(Self,
      ptOutputBuffer);
    ptOutputBuffer := '';
  end;

  function fPrompt_or_Incomplete: boolean;
  begin
    Result := False;
    // Imcomplete intructions
    if (Trim(ptOutputBuffer) = '+') then
    begin
      pReceive_Custom('+ ');
      Result := True;
    end;

    //// Normal
    if (Trim(ptOutputBuffer) = '>') then
    begin
      pReceive_Custom('> ');
      Result := True;
    end;
  end;

  procedure pDoReceive(sSplit: string; i: integer; var sOutput: string);
  var
    iPos: integer;

  begin
    repeat
      // The below checks if under R debug
      // https://regex101.com/r/jH2iA9/2
      // by J.C.Faria
      //if (ptOutputBuffer <> '') then
      if (fRegEx(ptOutputBuffer,
        // STDin and STDout of IO are under the function debug
        '^Browse\[[0-9]+\]>') <> '') or
        // https://regex101.com/r/sT5eI9/1
        // by J.C.Faria
        (fRegEx(ptOutputBuffer,
        // STDin and STDout of IO are under the package debug
        '^D[\(\)0-9]*>') <> '') then
      begin
        if (sOutput <> '') then
          pReceive_sOutput(sOutput);
        pReceive_ptOutputBuffer;
      end;

      iPos := Pos(sSplit, ptOutputBuffer);
      // Condition to break the repeat loop
      if (iPos = 0) then
      begin
        if (sOutput <> '') then
          pReceive_sOutput(sOutput);

        // Request user option as: ':' and cat('something')
        // or '> '
        if (fRegEx(Trim(ptOutputBuffer), '[:>]$') <> '') then
          pReceive_ptOutputBuffer;

        bRterm_Ready:= True;
        Break;
      end;

      // Copy from ptOutputBuffer
      sOutput := sOutput + Copy(ptOutputBuffer,
        1, iPos + 1);

      // Remove from ptOutputBuffer
      ptOutputBuffer := Copy(ptOutputBuffer, iPos +
        i, Length(ptOutputBuffer));
    until False;
  end;

var
  sCmd, sOutput: string;

begin
  if (iSize <= 0) then
    Exit;

  SetLength(sCmd,
    iSize);

  Move(poBuf^,
    sCmd[1],
    iSize);

  ptOutputBuffer := ptOutputBuffer + sCmd;

  if not Assigned(reOnReceiveOutput) or (ptOutputBuffer = '') or
    (ptOutputBuffer = ' ') then
    Exit;

  if fPrompt_or_Incomplete then
    Exit;

  pR_Split_Adequation;

  if not SplitReceive or (SplitMode = smNone) then
  begin
    reOnReceiveOutput(Self,
      ptOutputBuffer);
    ptOutputBuffer := '';
    Exit;
  end;

  sOutput := '';
  if (SplitMode = sm0D0A) then  //#13#10
    pDoReceive(#13#10,
      2,
      sOutput)
  else  //Char...
    pDoReceive(SplitChar,
      1,
      sOutput);

  if (sOutput <> '') then
    pReceive_sOutput(sOutput);

  // J.C.Faria
  // Check if it was sent an incomplete instruction and R return '+ '.
  // If yes, and R return '+ ',
  // it will send the next line of the script until to coomplete the R code block.
  with frmR_Term do
    if bIO_Keyed then begin  // Set True in synIOKeyDown event
      bIO_Keyed:= False;     // Restart the control variable
      Exit;
    end;

  if (sCmd = '+ ') then
    with frmMain do
      if bRtermSend_Plus then actRSendLineExecute(nil);
end;
*)


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

  if not Assigned(reOnReceiveOutput) then Exit;

  SetLength(Cmd, Size);
  Move(Buf^, Cmd[1], Size);

  if (Pos(#13#10, Cmd) > 0) then sSplit:= #13#10
                            else sSplit:= #10;
  repeat
    Cmd:= ptOutputBuffer + Cmd;
    ptOutputBuffer:= '';

    iPos:= Pos(sSplit,
               Cmd);

    if (iPos = 0) then Break;

    reOnReceiveError(Self,
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

  WinCheck(CreatePipe(hInputReadPipe,
                      InputWriteTmp,
                      @SA,
                      0));

  WinCheck(CreatePipe(OutputReadTmp,
                      hOutputWritePipe,
                      @SA,
                      0));

  WinCheck(CreatePipe(ErrorReadTmp,
                      hErrorWritePipe,
                      @SA,
                      0));

  InprocessDuplicateHandle(InputWriteTmp,
                           hInputWritePipe);

  InprocessDuplicateHandle(OutputReadTmp,
                           hOutputReadPipe);

  InprocessDuplicateHandle(ErrorReadTmp,
                           hErrorReadPipe);

  CloseAndZeroHandle(InputWriteTmp);

  CloseAndZeroHandle(OutputReadTmp);

  CloseAndZeroHandle(ErrorReadTmp);

  FillChar(SI,
           SizeOf(SI),
           $00);

  SI.cb         := SizeOf(SI);

  SI.dwFlags    := STARTF_USESTDHANDLES or
                   STARTF_USESHOWWINDOW;

  SI.hStdInput  := hInputReadPipe;

  SI.hStdOutput := hOutputWritePipe;

  SI.hStdError  := hErrorWritePipe;

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

  ptProcessHandle:= PI.hProcess;

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
  cdBytesWritten: Cardinal;

begin
  Msg:= Msg + SplitSendAvail;

  WinCheck(WriteFile(hInputWritePipe,
                     Msg[1],
                     Length(Msg),
                     cdBytesWritten,
                     nil));
end;

procedure TConsoleIO.WndProc(var Msg: TMessage);
var
  bUnhandled: Boolean;

begin
  with Msg do begin
    bUnhandled:= False;

    try
      case Msg of
        MIO_RECEIVE_OUTPUT: ReceiveOutput(Pointer(wParam),
                                          LParam);

        MIO_RECEIVE_ERROR: ReceiveError(Pointer(wParam),
                                        LParam);

        MIO_PROCESS_TERMINATED: ProcessTerminated;

        MIO_ERROR: Error(AnsiString(Pointer(wParam)))
        else bUnhandled:= True;
      end;
    except
      Application.HandleException(Self);
    end;

    if bUnhandled then
      Result:= DefWindowProc(whWindowHandle,
                             Msg,
                             wParam,
                             lParam);
  end;
end;

procedure TConsoleIO.Error(const Msg: string);
begin
  if Assigned(reOnError) then reOnError(Self, Msg);
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

          Windows.SendMessage(whWindowHandle,
                              MIO_ERROR,
                              Integer(PChar(Err)),
                              Length(Err) + 1);
        end;
      end;
    if (BytesRead > 0) then Windows.SendMessage(whWindowHandle,
                                                MessageCode,
                                                Integer(@Buf),
                                                BytesRead);
//    ShowMessage(Buf);  // To debug only
  until False;
end;

procedure TConsoleIO.ProcessTerminated;
begin
  if Assigned(reOnReceiveOutput) then reOnReceiveOutput(Self,
                                                        ptOutputBuffer);
  bRterm_Ready:= False;  // J.C.Faria
  ptOutputBuffer:= '';

  CloseProcessHandle;
  ClosePipes;
end;

function TConsoleIO.GetIsRunning: Boolean;
begin
  Result:= (ptProcessHandle <> 0);
end;

procedure TConsoleIO.SetProcessHandle(const Value: THandle);
begin
  if (hProcessHandle = Value) then Exit;

  Assert((ptProcessHandle = 0) or (Value = 0));

  hProcessHandle:= Value;

  if Assigned(pseOnProcessStatusChange) then pseOnProcessStatusChange(Self,
                                                                      IsRunning);
end;

procedure TConsoleIO.CloseProcessHandle;
begin
  if (ptProcessHandle = 0) then Exit;

  WinCheck(CloseHandle(ptProcessHandle));
  ptProcessHandle:= 0;
end;

procedure TConsoleIO.StopProcess;
begin
  if not IsRunning then Exit;

  if (TerminateCommand <> '') then SendInput(TerminateCommand);

  Windows.TerminateProcess(ptProcessHandle,
                           4);  // J.C.Faria

  if not EnableKill then Exit;

  if (TerminateCommand <> '') then
    if (WaitForSingleObject(ptProcessHandle,
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