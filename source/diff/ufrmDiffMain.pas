unit ufrmDiffMain;

// -----------------------------------------------------------------------------
// Application:     TextDiff                                                   .
// Module:          Main                                                       .
// Version:         4.2                                                        .
// Date:            24-JAN-2004                                                .
// Target:          Win32, Delphi 7                                            .
// Author:          Angus Johnson - angusj-AT-myrealbox-DOT-com                .
// Copyright;       © 2003-2004 Angus Johnson                                  .
// -----------------------------------------------------------------------------

(*
 Changed/adapted by José Cláudio Faria: 05/05/2005
 for use in Tinn-R project
*)

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DiffUnit, ExtCtrls, Menus, ComCtrls, ShellApi,
  IniFiles, ToolWin, ImgList, Clipbrd;

type
  TfrmDiffMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    mnuOpen1: TMenuItem;
    mnuExit: TMenuItem;
    mnuOptions: TMenuItem;
    mnuIgnoreBlanks: TMenuItem;
    mnuIgnoreCase: TMenuItem;
    mnuCompare: TMenuItem;
    mnuFont: TMenuItem;
    Help1: TMenuItem;
    mnuOpen2: TMenuItem;
    mnuHorzSplit: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    mnuHighlightColors: TMenuItem;
    Added1: TMenuItem;
    Modified1: TMenuItem;
    Deleted1: TMenuItem;
    cdDifferences: TColorDialog;
    mnuCancel: TMenuItem;
    mnuActions: TMenuItem;
    N6: TMenuItem;
    Contents1: TMenuItem;
    mnuShowDiffsOnly: TMenuItem;
    StatusBar1: TStatusBar;
    mnuSave1: TMenuItem;
    N8: TMenuItem;
    mnuNext: TMenuItem;
    mnuPrev: TMenuItem;
    mnuSaveReport: TMenuItem;
    N9: TMenuItem;
    N2: TMenuItem;
    N1: TMenuItem;
    mnuCopyBlockRight: TMenuItem;
    mnuCopyBlockLeft: TMenuItem;
    mnuSave2: TMenuItem;
    N3: TMenuItem;
    mnuEdit: TMenuItem;
    mnuUndo: TMenuItem;
    mnuRedo: TMenuItem;
    N7: TMenuItem;
    mnuCut: TMenuItem;
    mnuCopy: TMenuItem;
    mnuPaste: TMenuItem;
    mnuSearch: TMenuItem;
    mnuFind: TMenuItem;
    mnuFindNext: TMenuItem;
    N10: TMenuItem;
    mnuReplace: TMenuItem;
    ToolBar1: TToolBar;
    tbFolder: TToolButton;
    ToolButton5: TToolButton;
    tbOpen1: TToolButton;
    tbOpen2: TToolButton;
    ToolButton3: TToolButton;
    tbSave1: TToolButton;
    tbSave2: TToolButton;
    ToolButton6: TToolButton;
    tbHorzSplit: TToolButton;
    ToolButton8: TToolButton;
    tbCompare: TToolButton;
    tbCancel: TToolButton;
    ToolButton11: TToolButton;
    tbNext: TToolButton;
    tbPrev: TToolButton;
    ToolButton14: TToolButton;
    tbFind: TToolButton;
    tbReplace: TToolButton;
    ToolButton2: TToolButton;
    tbHelp: TToolButton;
    ImageList1: TImageList;
    ImageList2: TImageList;
    N11: TMenuItem;
    mnuFolder: TMenuItem;
    mnuCompareFiles: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuIgnoreBlanksClick(Sender: TObject);
    procedure mnuIgnoreCaseClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure Added1Click(Sender: TObject);
    procedure Modified1Click(Sender: TObject);
    procedure Deleted1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Contents1Click(Sender: TObject);
    procedure mnuShowDiffsOnlyClick(Sender: TObject);
    procedure mnuFolderClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure LoadOptionsFromIni;
    procedure SaveOptionsToIni;
  public
    FilesFrame: TFrame;
    FoldersFrame: TFrame;
  end;

var
  frmDiffMain: TfrmDiffMain;
  addClr, delClr, modClr, fontClr: TColor;
  LastOpenedFolder1, LastOpenedFolder2: string;
const
  FILEVIEW = 12;
  FOLDERVIEW = 13;
  DESIGN_RESOLUTION = 96;

implementation

uses FileView, FolderView, ufrmMain, WinHelpViewer;

{$R *.DFM}

//---------------------------------------------------------------------
//---------------------------------------------------------------------

procedure TfrmDiffMain.FormCreate(Sender: TObject);
begin
  FilesFrame := TfrmFrame_Files.Create(self);
  FilesFrame.Parent := self;
  FilesFrame.Align := alClient;
  FilesFrame.ScaleBy(Screen.PixelsPerInch, DESIGN_RESOLUTION);

  FoldersFrame := TfrmFrame_Folders.Create(self);
  FoldersFrame.Parent := self;
  FoldersFrame.Align := alClient;
  FoldersFrame.ScaleBy(Screen.PixelsPerInch, DESIGN_RESOLUTION);


  //load ini settings before calling FileFrame.Setup ...
  LoadOptionsFromIni;
  TfrmFrame_Files(FilesFrame).Setup;
  TfrmFrame_Folders(FoldersFrame).Setup;

  Statusbar1.Panels[2].Text := #150;

  application.helpfile := changefileext(ParamStr(0), '.hlp');
  if paramcount = 2 then
  begin
    //load files or folders from the commandline ...
    if directoryExists(paramstr(1)) then
      with TfrmFrame_Folders(FoldersFrame) do
      begin
        mnuFolderClick(nil);
        DoOpenFolder(paramstr(1), true);
        DoOpenFolder(paramstr(2), false);
      end
    else
      with TfrmFrame_Files(FilesFrame) do
      begin
        mnuFolder.Checked := true; //trick the toggle
        mnuFolderClick(nil);
        DoOpenFile(paramstr(1), true);
        DoOpenFile(paramstr(2), false);
      end;
    mnuCompare.Click;
  end
  //nb: FoldersFrame.Visible set in LoadOptionsFromIni ...
  else if FoldersFrame.Visible then mnuFolderClick(nil)
  else TfrmFrame_Files(FilesFrame).SetMenuEventsToFileView;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.FormDestroy(Sender: TObject);
begin
  TfrmFrame_Files(FilesFrame).Cleanup;
  TfrmFrame_Folders(FoldersFrame).Cleanup;
end;
procedure TfrmDiffMain.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

//---------------------------------------------------------------------

procedure TfrmDiffMain.mnuExitClick(Sender: TObject);
begin
  close;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.LoadOptionsFromIni;
var
  l,t,w,h: integer;

begin
  with TIniFile.create(frmMain.sPath_App + '\Tinn.ini') do  //JCFaria
  try
    l := ReadInteger('Diff Options', 'iBounds.Left', 0);
    t := ReadInteger('Diff Options', 'iBounds.Top', 0);
    w := ReadInteger('Diff Options', 'iBounds.Width', -1);
    h := ReadInteger('Diff Options', 'iBounds.Height', -1);

    //set (Add, Del, Mod) colors...
    addClr := strtointdef(ReadString('Diff Options', 'sAddColor', ''), $F0CCA8);
    modClr := strtointdef(ReadString('Diff Options', 'sModColor', ''), $6FFB8A);
    delClr := strtointdef(ReadString('Diff Options', 'sDelColor', ''), $BB77FF);

    // set font
    with TfrmFrame_Files(FilesFrame).fdFiles.Font do begin
      Name  := ReadString('Diff Options', 'sFont.Name', 'Courier New');
      Size  := ReadInteger('Diff Options', 'iFont.Size', 10);
      Color := strtointdef(ReadString('Diff Options', 'sFont.Color', ''), $00000000);
    end;

    if ReadBool('Diff Options', 'bHorizontal',false) then mnuHorzSplit.Checked := true;

    LastOpenedFolder1    := ReadString('Diff Options', 'sFolder.1', '');
    LastOpenedFolder2    := ReadString('Diff Options', 'sFolder.2', '');
    FoldersFrame.Visible := ReadBool('Diff Options', 'bFolderView', false);
  finally
    free;
  end;
  //make sure the form is positioned on screen ...
  //ie: make sure nobody's done something silly with the INI file!
  if (w > 0) and (h > 0) and (l < screen.Width) and (t < screen.Height) and
      (l+w > 0) and (t+h > 0) then setbounds(l,t,w,h)
  else Position := poScreenCenter;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.SaveOptionsToIni;
begin
  //with TIniFile.create(changefileext(paramstr(0),'.ini')) do
  with TIniFile.create(frmMain.sPath_App + '\Tinn.ini') do  //JCFaria
  try
    EraseSection('Diff Options');
    if windowState = wsNormal then begin
      WriteInteger('Diff Options', 'iBounds.Left', self.Left);
      WriteInteger('Diff Options', 'iBounds.Top', self.Top);
      WriteInteger('Diff Options', 'iBounds.Width', self.Width);
      WriteInteger('Diff Options', 'iBounds.Height', self.Height);
    end;
    WriteString('Diff Options', 'sAddColor', '$' + inttohex(addClr, 8));
    WriteString('Diff Options', 'sModColor', '$' + inttohex(modClr, 8));
    WriteString('Diff Options', 'sDelColor', '$' + inttohex(delClr, 8));
    with TfrmFrame_Files(FilesFrame).fdFiles.Font do begin
      WriteString ('Diff Options', 'sFont.Name', Name);
      WriteInteger('Diff Options', 'iFont.Size', Size);
      WriteString('Diff Options', 'sFont.Color', '$' + inttohex(Color, 8));
    end;
    WriteBool  ('Diff Options', 'bHorizontal', mnuHorzSplit.Checked);
    WriteString('Diff Options', 'sFolder.1', LastOpenedFolder1);
    WriteString('Diff Options', 'sFolder.2', LastOpenedFolder2);
    WriteBool  ('Diff Options', 'bFolderView', FoldersFrame.Visible);
  finally
    free;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveOptionsToIni;
  Application.HelpCommand(HELP_QUIT, 0);
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.Contents1Click(Sender: TObject);
var
  pathHelp : string;

begin
  pathHelp := frmMain.sPath_TinnR + '\doc\TextDiff.hlp';
  if FileExists(pathHelp) then begin
    Application.HelpFile := pathHelp;
    Application.HelpCommand(HELP_CONTENTS, 0);
  end
  else
    MessageDlg(pathHelp + #13 + #13 +
               'The help file was not found.' + #13 +
               'Please, contact Tinn-R team!',
               mtWarning, [mbOK], 0);
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.mnuIgnoreBlanksClick(Sender: TObject);
begin
  mnuIgnoreBlanks.checked := not mnuIgnoreBlanks.checked;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.mnuIgnoreCaseClick(Sender: TObject);
begin
  mnuIgnoreCase.checked := not mnuIgnoreCase.checked;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.mnuShowDiffsOnlyClick(Sender: TObject);
begin
  mnuShowDiffsOnly.checked := not mnuShowDiffsOnly.checked;
  //if files have already been compared then refresh the changes
  with TfrmFrame_Files(FilesFrame) do
    if FilesCompared then DisplayDiffs;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.mnuAboutClick(Sender: TObject);
begin
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.Added1Click(Sender: TObject);
begin
  with cdDifferences do begin
    color := addClr;
    if not execute then exit;
    addClr := color;
  end;
  StatusBar1.Repaint;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.Modified1Click(Sender: TObject);
begin
  with cdDifferences do begin
    color := modClr;
    if not execute then exit;
    modClr := color;
  end;
  StatusBar1.Repaint;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.Deleted1Click(Sender: TObject);
begin
  with cdDifferences do begin
    color := delClr;
    if not execute then exit;
    delClr := color;
  end;
  StatusBar1.Repaint;
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  case Panel.Index of
    0: StatusBar1.Canvas.Brush.Color := addClr;
    1: StatusBar1.Canvas.Brush.Color := modClr;
    2: StatusBar1.Canvas.Brush.Color := delClr;
  else exit;
  end;
  StatusBar1.Canvas.FillRect(Rect);
  StatusBar1.Canvas.TextOut(Rect.Left+4,Rect.Top,Panel.Text);
end;
//---------------------------------------------------------------------

procedure TfrmDiffMain.mnuFolderClick(Sender: TObject);
begin
  //toggle file view vs folder view ...
  mnuFolder.Checked := not mnuFolder.Checked;

  if mnuFolder.Checked then begin
    TfrmFrame_Folders(FoldersFrame).Visible := true;
    TfrmFrame_Files(FilesFrame).Visible := false;
    TfrmFrame_Folders(FoldersFrame).SetMenuEventsToFolderView;
  end
  else begin
    TfrmFrame_Files(FilesFrame).Visible := true;
    TfrmFrame_Folders(FoldersFrame).Visible := false;
    TfrmFrame_Files(FilesFrame).SetMenuEventsToFileView;
  end;
end;
//------------------------------------------------------------------------------

end.
