{$WARN UNIT_PLATFORM OFF}
unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ConsoleIO;

type
  TMainForm = class(TForm)
    CommandLineEdit: TEdit;
    CommandEdit: TEdit;
    ApplicationLabel: TLabel;
    RunBtn: TButton;
    StopBtn: TButton;
    CommandLabel: TLabel;
    SendBtn: TButton;
    OutputMemo: TMemo;
    ErrorMemo: TMemo;
    OutputLabel: TLabel;
    ErrorLabel: TLabel;
    DebugMemo: TMemo;
    DebugLabel: TLabel;
    ConsoleIO: TConsoleIO;
    ExitBtn: TButton;
    EnableKillCheck: TCheckBox;
    StopOnFreeCheck: TCheckBox;
    SetTerminateCommandBtn: TButton;
    SetWaitTimeoutBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure RunBtnClick(Sender: TObject);
    procedure SendBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure ConsoleIOError(Sender: TObject; const Cmd: string);
    procedure ConsoleIOProcessStatusChange(Sender: TObject;
      IsRunning: Boolean);
    procedure ConsoleIOReceiveError(Sender: TObject; const Cmd: string);
    procedure ConsoleIOReceiveOutput(Sender: TObject; const Cmd: string);
    procedure ExitBtnClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure EnableKillCheckClick(Sender: TObject);
    procedure StopOnFreeCheckClick(Sender: TObject);
    procedure SetTerminateCommandBtnClick(Sender: TObject);
    procedure SetWaitTimeoutBtnClick(Sender: TObject);
  private
    procedure RefreshButtonState;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.DFM}

procedure TMainForm.FormShow(Sender: TObject);
begin
  OutputMemo.Clear;
  ErrorMemo.Clear;
  DebugMemo.Clear;
  RefreshButtonState;
end;

procedure TMainForm.RunBtnClick(Sender: TObject);
begin
  ConsoleIO.RunProcess(CommandLineEdit.Text);
end;

procedure TMainForm.SendBtnClick(Sender: TObject);
begin
  ConsoleIO.SendInput(CommandEdit.Text);
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
begin
  ConsoleIO.StopProcess;
end;

procedure TMainForm.ConsoleIOError(Sender: TObject; const Cmd: string);
begin
  DebugMemo.Lines.Add(Cmd);
end;

procedure TMainForm.ConsoleIOProcessStatusChange(Sender: TObject;
  IsRunning: Boolean);
begin
  RefreshButtonState;
end;

procedure TMainForm.ConsoleIOReceiveError(Sender: TObject;
  const Cmd: string);
begin
  ErrorMemo.Lines.Add(Cmd);
end;

procedure TMainForm.ConsoleIOReceiveOutput(Sender: TObject;
  const Cmd: string);
begin
  OutputMemo.Lines.Add(Cmd);
end;

procedure TMainForm.RefreshButtonState;
begin
  if Assigned(RunBtn) then
    RunBtn.Enabled := not ConsoleIO.IsRunning;
  if Assigned(StopBtn) then
    StopBtn.Enabled := ConsoleIO.IsRunning;
end;

procedure TMainForm.ExitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FormResize(Sender: TObject);
var
  MemoWidth: Integer;
begin
  MemoWidth := (ClientWidth - 32) div 3;
  OutputMemo.Width := MemoWidth;
  ErrorMemo.Width := MemoWidth;
  DebugMemo.Width := MemoWidth;
  OutputMemo.Left := 8;
  ErrorMemo.Left := OutputMemo.Left + OutputMemo.Width + 8;
  DebugMemo.Left := ErrorMemo.Left + ErrorMemo.Width + 8;
  OutputLabel.Left := OutputMemo.Left + 8;
  ErrorLabel.Left := ErrorMemo.Left + 8;
  DebugLabel.Left := DebugMemo.Left + 8;
end;

procedure TMainForm.EnableKillCheckClick(Sender: TObject);
begin
  ConsoleIO.EnableKill := EnableKillCheck.Checked;
end;

procedure TMainForm.StopOnFreeCheckClick(Sender: TObject);
begin
  ConsoleIO.StopProcessOnFree := StopOnFreeCheck.Checked;
end;

procedure TMainForm.SetTerminateCommandBtnClick(Sender: TObject);
begin
  ConsoleIO.TerminateCommand := InputBox('Input',
    'Set terminate command for process:', ConsoleIO.TerminateCommand);
end;

procedure TMainForm.SetWaitTimeoutBtnClick(Sender: TObject);
begin
  ConsoleIO.WaitTimeout := StrToInt(InputBox('Input',
    'Set wait process timeout:', IntToStr(ConsoleIO.WaitTimeout)));
end;

end.
