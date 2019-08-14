(*
 Tinn is a ASCII file editor primarily intended as a better replacement
 of the default Notepad.exe under Windows.

 This software is distributed under the terms of the GNU General
 Public License, either Version 2, June 1991 or Version 3, June 2007.
 The terms of version 2 and of the license are in a folder called
 doc (licence_gpl2.txt and licence_gpl2.txt)
 which you should have received with this software.

 See http://www.opensource.org/licenses/gpl-license.html or
 http://www.fsf.org/copyleft/gpl.html for further information.

 Copyright
  Russell May - http://www.solarvoid.com

 Tinn-R is an extension of Tinn that provides additional tools to control R
 (http://cran.r-project.org). The project is coordened by José Cláudio Faria
 (joseclaudio.faria@gmail.com).

 As such, Tinn-R is a feature-rich replacement of the basic script editor
 provided with Rgui. It provides syntax-highlighting, submission of code in
 whole, or line-by-line, and many other useful tools to ease writting and
 debugging of R code.

 Copyright
  Tinn-R team - http://nbcgib.uesc.br/lec/software/editores/tinn-r/en

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 and 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

unit ufrmShortcuts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Mask, Db, DBTables,
  Buttons, ComCtrls, JvExComCtrls, JvHotKey, JvDBControls, SynEditMiscClasses;

type
  TfrmShortcuts = class(TForm)
    bbHelp: TBitBtn;
    bbtShortcutsCancel: TBitBtn;
    bbtShortcutsCancelAll: TBitBtn;
    bbtShortcutsClose: TBitBtn;
    bbtShortcutsEdit: TBitBtn;
    bbtShortcutsLoad: TBitBtn;
    bbtShortcutsRestoreDefault: TBitBtn;
    bbtShortcutsSave: TBitBtn;
    bbtShortcutsSaveDefault: TBitBtn;
    dbeCaption: TDBEdit;
    dbeGroup: TDBEdit;
    dbgShortcuts: TDBGrid;
    dbmHint: TDBMemo;
    edtCaptionSearch: TEdit;
    edtGroupSearch: TEdit;
    gbKeystrokes: TGroupBox;
    imgShortcut: TImage;
    eKeyShort: TJvHotKey;
    eKeyShortcut_Search: TJvHotKey;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    stbShortcuts: TStatusBar;
    JvDBNavigator2: TJvDBNavigator;

    procedure bbHelpClick(Sender: TObject);
    procedure bbtShortcutsCancelAllClick(Sender: TObject);
    procedure bbtShortcutsCancelClick(Sender: TObject);
    procedure bbtShortcutsCloseClick(Sender: TObject);
    procedure bbtShortcutsEditClick(Sender: TObject);
    procedure bbtShortcutsLoadClick(Sender: TObject);
    procedure bbtShortcutsRestoreDefaultClick(Sender: TObject);
    procedure bbtShortcutsSaveClick(Sender: TObject);
    procedure bbtShortcutsSaveDefaultClick(Sender: TObject);
    procedure dbeCaptionEnter(Sender: TObject);
    procedure dbeGroupEnter(Sender: TObject);
    procedure dbgShortcutsEnter(Sender: TObject);
    procedure dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgShortcutsTitleClick(Column: TColumn);
    procedure dbmHintEnter(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure edtCaptionSearchChange(Sender: TObject);
    procedure edtCaptionSearchEnter(Sender: TObject);
    procedure edtGroupSearchChange(Sender: TObject);
    procedure edtGroupSearchEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure eKeyShortEnter(Sender: TObject);
    procedure eKeyShortKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eKeyShortKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure eKeyShortcut_SearchChange(Sender: TObject);
    procedure eKeyShortcut_SearchEnter(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    bNothing      : boolean;
    bShortcutInUse: boolean;

    procedure pActualizeGroups;
    procedure pClearWarnings;

  public
    { Public declarations }
//    eKeyShort: TSynHotKey;
    bLocating: boolean;

  end;

var
  frmShortcuts: TfrmShortcuts;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools,
  Menus,
  //FMTBcd,
  SqlExpr;

{$R *.dfm}

procedure TfrmShortcuts.pClearWarnings;
begin
  with stbShortcuts do begin
    Panels[3].Text:= '';
    Panels[4].Text:= '';
  end;
end;

procedure TfrmShortcuts.edtGroupSearchChange(Sender: TObject);
begin
  pClearWarnings;
  with edtGroupSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdShortcuts.Locate('Group',
                                     Text,
                                     [loCaseInsensitive, loPartialKey]) = True) then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
    end
    else begin
      Color     := clRed;
      Font.Color:= clWhite;
      Font.Style:= [fsBold];
    end;
  end;
end;

procedure TfrmShortcuts.edtGroupSearchEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.edtCaptionSearchChange(Sender: TObject);
begin
  pClearWarnings;
  with edtCaptionSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdShortcuts.Locate('Caption',
                                     Text,
                                     [loCaseInsensitive, loPartialKey]) = True) then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
    end
    else begin
      Color     := clRed;
      Font.Color:= clWhite;
      Font.Style:= [fsBold];
    end;
  end;
end;

procedure TfrmShortcuts.edtCaptionSearchEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.FormActivate(Sender: TObject);
var
  pTmp: pointer;

begin
  pClearWarnings;
  with frmMain do begin
    with dbeGroup do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeCaption do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbmHint do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with eKeyShort do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbgShortcuts do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  with stbShortcuts do begin
    Panels[0].Text:= 'Browse mode';
    Panels[2].Text:= ExtractFileName(frmMain.sShortcutsInUse);
  end;

  with ModDados.cdShortcuts do begin
    pTmp:= GetBookmark;
    Filtered:= False;
  end;  

  frmTools.lbShortcuts.Selected[frmMain.iShortcutsFilter]:= False;
  
  with modDados.cdShortcuts do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;

  edtGroupSearch.SetFocus;
end;

procedure TfrmShortcuts.pActualizeGroups;
begin
  pClearWarnings;
  //Actualize Groups in frmMain
  with modDados do begin
    pShortcutsGroups_Filter(nil);

    with frmMain do begin
      frmTools.lbShortcuts.Items:= slShortcuts_Groups;
      frmTools.lbShortcuts.Refresh;
    end;

    FreeAndNil(slShortcuts_Groups);
  end;
end;

procedure TfrmShortcuts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with frmMain do begin
    frmTools.lbShortcuts.ItemIndex:= iShortcutsFilter;
    frmTools.lbShortcutsClick(Self);
  end;
end;

procedure TfrmShortcuts.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with modDados.cdShortcuts do begin
    IndexDefs.Clear;

    with IndexDefs.AddIndexDef do
    begin
      Name   := 'ShortcutsDefaultIndex';
      Fields := 'Index';
      Options:= [ixPrimary, ixUnique];
    end;

    IndexName:= 'ShortcutsDefaultIndex';
  end;
  pActualizeGroups;
end;

procedure TfrmShortcuts.FormCreate(Sender: TObject);
begin
//  eKeyShort:= TSynHotKey.Create(Self);
//  with eKeyShort do
//  begin
//    Parent     := gbKeystrokes;
//    Left       := jvhkShortcutSearch.Left;
//    Top        := jvhkShortcutSearch.Top +
//                  jvhkShortcutSearch.Height;
//    Width      := jvhkShortcutSearch.Width;
//    Height     := jvhkShortcutSearch.Height;
//    HotKey     := 0;
//    InvalidKeys:= [];
//    Modifiers  := [];
//    TabOrder   := 1;
//    BorderStyle:= bsSingle;
//  end;
end;

procedure TfrmShortcuts.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmShortcuts.eKeyShortKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_BACK)   or
     (Key = VK_DELETE) or
     (Key = VK_SPACE) then begin
    Key:= 0;
    bNothing:= True
  end;
end;

procedure TfrmShortcuts.eKeyShortKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  pTmp:  pointer;

begin
  if bNothing then begin
    bNothing:= False;
    Exit;
  end;

  if (Key = VK_CONTROL) or
     (Key = VK_MENU) or
     (Key = VK_SHIFT) or
     (Key = VK_SPACE) then begin
    eKeyShort.HotKey:= TextToShortcut(modDados.cdShortcuts.FieldByName('Shortcut').Value);
    Exit;
  end;

  bShortcutInUse:= False;
  with modDados.cdShortcuts do begin
    pTmp:= GetBookmark;
  end;

  bLocating:= True;
  if (modDados.cdShortcuts.Locate('Shortcut',
                                   StringReplace(ShortcutToText(eKeyShort.Hotkey), ' ', '', []),
                                   []) = True) then begin

    bShortcutInUse:= True;

    with modDados.cdShortcuts do begin
      if BookmarkValid(pTmp) then begin
        GoToBookmark(pTmp);
        FreeBookmark(pTmp);
      end;
      Cancel;
      Edit;
    end;

    stbShortcuts.Panels[3].Text:= 'Keyboard shortcut already in use';
    stbShortcuts.Panels[4].Text:= '<' +
                                  StringReplace(ShortcutToText(eKeyShort.Hotkey), ' ', '', []) +
                                  '>';
    bLocating:= False;
  end
  else begin
    pClearWarnings;
    bLocating:= False;

    with modDados.cdShortcuts do begin
      Edit;
      if (Key = VK_ESCAPE) then FieldByName('Shortcut').Value:= 'None'
                           else FieldByName('Shortcut').Value:= ShortcutToText(eKeyShort.HotKey);
    end;
  end;
end;

procedure TfrmShortcuts.eKeyShortEnter(Sender: TObject);
begin
  pClearWarnings;
  with modDados.cdShortcuts do
    Edit;
end;

procedure TfrmShortcuts.eKeyShortcut_SearchChange(Sender: TObject);
var
  sTmp: string;

begin
  pClearWarnings;
  with eKeyShortcut_Search do begin
    sTmp:= StringReplace(ShortcutToText(Hotkey), ' ', '', []);

    if (sTmp = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      //Font.Style:= [];
      Exit;
    end;

    if (modDados.cdShortcuts.Locate('Shortcut',
                                     sTmp,
                                     []) = True) then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      //Font.Style:= [];
    end
    else begin
      Color     := clRed;
      Font.Color:= clWhite;
      //Font.Style:= [fsBold];
    end;
  end;
end;

procedure TfrmShortcuts.eKeyShortcut_SearchEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.bbtShortcutsEditClick(Sender: TObject);
begin
  pClearWarnings;
  with modDados.cdShortcuts do
    Edit;
  dbeGroup.SetFocus;
  with stbShortcuts do
    Panels[0].Text:= 'Edit mode';
end;

procedure TfrmShortcuts.bbtShortcutsLoadClick(Sender: TObject);
var
  od: TOpenDialog;

  sFile,
   sOldFile: string;

begin
  pClearWarnings;
  bbtShortcutsCancelAllClick(nil);
  od:= TOpenDialog.Create(Self);

  try
    with od do begin
      InitialDir:= frmMain.sPath_Data;
      Filter    := 'XML (*.xml)|*.xml';

      if Execute then begin
        sFile:= od.FileName;

        try
          with modDados.cdShortcuts do begin
            sOldFile:= FileName;
            Active  := False;
            FileName:= sFile;
            Active  := True;
          end;
        except
          on EDatabaseError do begin
            MessageDlg(sFile + #13 + #13 +
                       'The above is not a valid file with Tinn-R shortcuts!',
                       mtError,
                       [MBOK],
                       0);
            with modDados.cdShortcuts do begin
              Active  := False;
              FileName:= sOldFile;
              Active  := True;
            end;
            Exit;
          end;
        end; 

        with frmMain do begin
          iShortcutsBeforeChanges:= modDados.cdShortcuts.SavePoint;
          sShortcutsInUse        := sFile;
        end;

        with stbShortcuts do
          Panels[2].Text:= ExtractFileName(frmMain.sShortcutsInUse);
          
        MessageDlg(sFile + #13 + #13 +
                   'The file above was successfully loaded.' + #13 +
                   'It will be, from now, the default shortcuts!',
                   mtInformation,
                   [MBOK],
                   0);
      end;
    end;
  finally
    FreeAndNil(od);
  end;
end;

procedure TfrmShortcuts.bbtShortcutsCancelClick(Sender: TObject);
begin
  pClearWarnings;

  with modDados do begin
    cdShortcuts.Cancel;
    cdShortcutsAfterScroll(nil);
  end;
  with stbShortcuts do
    Panels[0].Text:= 'Browse mode';
end;

procedure TfrmShortcuts.bbtShortcutsSaveClick(Sender: TObject);
begin
  pClearWarnings;

  with modDados.cdShortcuts do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      frmMain.iShortcutsBeforeChanges:= SavePoint;
    except
      //TODO
    end;
  end;
end;

procedure TfrmShortcuts.bbtShortcutsSaveDefaultClick(Sender: TObject);
var
  sFile: string;

  sd: TSaveDialog;

begin
  pClearWarnings;
  bbtShortcutsSaveClick(nil);
  sd:= TSaveDialog.Create(Self);
  try
    with sd do begin
      InitialDir:= frmMain.sPath_Data;
      Filter    := 'XML (*.xml)|*.xml';
      DefaultExt:= '*.xml';

      if Execute then begin
        sFile:= FileName;
        if FileExists(sFile) then
          if (MessageDlg(sFile + #13 + #13 +
                         'Do you want to overwrite this file?',
                         mtConfirmation,
                         [mbYES, mbCANCEL],
                         0) <> idYES) then Exit;
          DeleteFile(sFile);               

        with modDados.cdShortcuts do begin
          Edit;
          Post;
          MergeChangeLog;
          SaveToFile(sFile);
          bbtShortcutsSaveClick(nil);
        end;

        with frmMain do begin
          sdMain.Filter  := slFilters.Text;
          sShortcutsInUse:= sFile;
        end;
        with stbShortcuts do
          Panels[2].Text:= ExtractFileName(frmMain.sShortcutsInUse);
      end;
    end;
  finally
    FreeAndNil(sd);
  end;
end;

procedure TfrmShortcuts.bbtShortcutsCloseClick(Sender: TObject);
begin
  with modDados.cdShortcuts do
    SavePoint:= frmMain.iShortcutsBeforeChanges;

  Close;
  frmMain.Refresh;
end;

procedure TfrmShortcuts.dbeCaptionEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.dbeGroupEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.dbgShortcutsEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.dbgShortcutsTitleClick(Column: TColumn);
begin
  pClearWarnings;

  with modDados do begin
    cdShortcuts.IndexFieldNames:= Column.FieldName;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmShortcuts.dbmHintEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  pClearWarnings;
end;

procedure TfrmShortcuts.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"Shortcuts"');
end;

procedure TfrmShortcuts.bbtShortcutsCancelAllClick(Sender: TObject);
begin
  pClearWarnings;

  with modDados do begin
    cdShortcuts.SavePoint:= frmMain.iShortcutsBeforeChanges;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmShortcuts.bbtShortcutsRestoreDefaultClick(Sender: TObject);
begin
  pClearWarnings;
  bbtShortcutsCancelAllClick(nil);
  if not FileExists(frmMain.sFileDataOrigin) then Exit;

  try
    with modDados.cdShortcuts do
      Active:= False;

    with frmMain.zipKit do begin
      FileName     := frmMain.sFileDataOrigin;
      BaseDirectory:= frmMain.sPath_Data;
      ExtractFiles('Shortcuts.xml');
      CloseArchive;
    end;

    with modDados.cdShortcuts do begin
      FileName:= frmMain.sPath_Data + '\Shortcuts.xml';
      Active  := True;
    end;

    with frmMain do begin
      iShortcutsBeforeChanges:= modDados.cdShortcuts.SavePoint;
      sShortcutsInUse        := frmMain.sPath_Data + '\Shortcuts.xml';
    end;

    with stbShortcuts do
      Panels[2].Text:= ExtractFileName(frmMain.sShortcutsInUse);

    MessageDlg('The original ''Shortcuts.xml'' was successfully restored.' + #13 + #13 +
               'It will be, from now, the default shortcuts!',
               mtInformation,
               [MBOK],
               0);
  except
    // todo!
  end;
end;

end.
