unit MDIEdit;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ComCtrls;

type
  TEditForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Edit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N3: TMenuItem;
    Selectall1: TMenuItem;
    Character1: TMenuItem;
    Wordwrap1: TMenuItem;
    N5: TMenuItem;
    Font1: TMenuItem;
    PopupMenu1: TPopupMenu;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    SaveFileDialog: TSaveDialog;
    FontDialog1: TFontDialog;
    Close1: TMenuItem;
    Editor: TMemo;
    procedure Exit1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Wordwrap1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure Selectall1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Open1Click(Sender: TObject);
  private
    { Private declarations }
    PathName: string;
  public
    { Public declarations }
    procedure Open(const AFileName: string);
  end;

var
  EditForm: TEditForm;

const
  DefaultFileName = 'Untitled';

implementation

uses Clipbrd, Printers, MDIFrame;

{$R *.dfm}

procedure TEditForm.Exit1Click(Sender: TObject);
begin
  FrameForm.Exit1Click(Sender);
end;

procedure TEditForm.New1Click(Sender: TObject);
begin
  FrameForm.New1Click(Sender);
end;

procedure TEditForm.Open1Click(Sender: TObject);
begin
  FrameForm.Open1Click(Sender);
end;

procedure TEditForm.Wordwrap1Click(Sender: TObject);
begin
  with Editor do
  begin
    WordWrap := not WordWrap; { toggle word wrapping }
    if WordWrap then
      ScrollBars := ssVertical
    else
      ScrollBars := ssBoth;
    WordWrap1.Checked := WordWrap; { set menu item check }
  end;
end;

procedure TEditForm.Cut1Click(Sender: TObject);
begin
  Editor.CutToClipboard;
end;

procedure TEditForm.Copy1Click(Sender: TObject);
begin
  Editor.CopyToClipboard;
end;

procedure TEditForm.Paste1Click(Sender: TObject);
begin
  Editor.PasteFromClipboard;
end;

procedure TEditForm.Selectall1Click(Sender: TObject);
begin
  Editor.SelectAll;
end;

procedure TEditForm.Delete1Click(Sender: TObject);
begin
  Editor.ClearSelection;
end;

procedure TEditForm.Edit1Click(Sender: TObject);
var
  HasSelection: Boolean;
begin
  Paste1.Enabled := Clipboard.HasFormat(CF_TEXT);
  Paste2.Enabled := Paste1.Enabled;
  HasSelection := Editor.SelLength > 0;
  Cut1.Enabled := HasSelection;
  Cut2.Enabled := HasSelection;
  Copy1.Enabled := HasSelection;
  Copy2.Enabled := HasSelection;
  Delete1.Enabled := HasSelection;
end;

procedure TEditForm.Open(const AFileName: string);
begin
  PathName := AFileName;
  Caption := ExtractFileName(AFileName);
  with Editor do
  begin
    Lines.LoadFromFile(PathName);
    SelStart := 0;
    Modified := False;
  end;
end;

procedure TEditForm.Saveas1Click(Sender: TObject);
begin
  SaveFileDialog.FileName := PathName;
  if SaveFileDialog.Execute then
  begin
    PathName := SaveFileDialog.FileName;
    Caption := ExtractFileName(PathName);
    Save1Click(Sender);
  end;
end;

procedure TEditForm.Save1Click(Sender: TObject);
begin
  if PathName = DefaultFileName then
    SaveAs1Click(Sender)
  else
  begin
    Editor.Lines.SaveToFile(PathName);
    Editor.Modified := False;
  end;
end;

procedure TEditForm.Font1Click(Sender: TObject);
begin
  FontDialog1.Font := Editor.Font;
  if FontDialog1.Execute then
    Editor.Font.Assign(FontDialog1.Font);
end;

procedure TEditForm.Close1Click(Sender: TObject);
begin
  Close;
end;

procedure TEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TEditForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
  SWarningText = 'Save changes to %s?';
begin
  if Editor.Modified then
  begin
    case MessageDlg(Format(SWarningText, [PathName]), mtConfirmation,
      [mbYes, mbNo, mbCancel], 0) of
      idYes: Save1Click(Self);
      idCancel: CanClose := False;
    end;
  end;
end;

procedure TEditForm.FormCreate(Sender: TObject);
begin
  PathName := DefaultFileName;
end;

end.
