program MemoText;

uses
  Forms,
  MDIFrame in 'MDIFrame.pas' {FrameForm},
  MDIEdit in 'MDIEdit.pas' {EditForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'MemoText';
  Application.CreateForm(TFrameForm, FrameForm);
  Application.Run;
end.
