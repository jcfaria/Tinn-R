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
  Tinn-R team October/2005
  Tinn-R team October/2013

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
  Buttons, ComCtrls, JvExComCtrls, JvHotKey;

type
  TfrmShortcuts = class(TForm)
    bbtShortcutsCancel: TBitBtn;
    bbtShortcutsCancelAll: TBitBtn;
    bbtShortcutsClose: TBitBtn;
    bbtShortcutsSaveDefault: TBitBtn;
    bbtShortcutsEdit: TBitBtn;
    bbtShortcutsLoad: TBitBtn;
    bbtShortcutsRestoreDefault: TBitBtn;
    bbtShortcutsSave: TBitBtn;
    dbeCaption: TDBEdit;
    dbeGroup: TDBEdit;
    dbgShortcuts: TDBGrid;
    dbmHint: TDBMemo;
    DBNavigator1: TDBNavigator;
    edtCaptionSearch: TEdit;
    edtGroupSearch: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    stbShortcuts: TStatusBar;
    jvhkShortcutSearch: TJvHotKey;
    jvhkShortcut: TJvHotKey;
    imgShortcut: TImage;
    Label8: TLabel;
    bbHelp: TBitBtn;

    procedure bbtShortcutsCancelAllClick(Sender: TObject);
    procedure bbtShortcutsCancelClick(Sender: TObject);
    procedure bbtShortcutsCloseClick(Sender: TObject);
    procedure bbtShortcutsEditClick(Sender: TObject);
    procedure bbtShortcutsRestoreDefaultClick(Sender: TObject);
    procedure bbtShortcutsSaveClick(Sender: TObject);
    procedure dbgShortcutsTitleClick(Column: TColumn);
    procedure edtCaptionSearchChange(Sender: TObject);
    procedure edtGroupSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bbtShortcutsSaveDefaultClick(Sender: TObject);
    procedure bbtShortcutsLoadClick(Sender: TObject);
    procedure jvhkShortcutSearchChange(Sender: TObject);
    procedure jvhkShortcutEnter(Sender: TObject);
    procedure jvhkShortcutKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgShortcutsEnter(Sender: TObject);
    procedure edtGroupSearchEnter(Sender: TObject);
    procedure edtCaptionSearchEnter(Sender: TObject);
    procedure jvhkShortcutSearchEnter(Sender: TObject);
    procedure dbeGroupEnter(Sender: TObject);
    procedure dbeCaptionEnter(Sender: TObject);
    procedure dbmHintEnter(Sender: TObject);
    procedure jvhkShortcutKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure bbHelpClick(Sender: TObject);

  private
    { Private declarations }
    bShortcutInUse: boolean;
    bNothing      : boolean;
    
    procedure ActualizeGroups;
    procedure ClearWarnings;
    
  public
    { Public declarations }
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

procedure TfrmShortcuts.ClearWarnings;
begin
  with stbShortcuts do begin
    Panels[3].Text:= '';
    Panels[4].Text:= '';
  end;
end;

procedure TfrmShortcuts.edtGroupSearchChange(Sender: TObject);
begin
  ClearWarnings;
  with edtGroupSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdShortcuts.Locate('Group',
                                     Text,
                                     [loPartialKey]) = True) then begin
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
  ClearWarnings;
end;

procedure TfrmShortcuts.edtCaptionSearchChange(Sender: TObject);
begin
  ClearWarnings;
  with edtCaptionSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdShortcuts.Locate('Caption',
                                     Text,
                                     [loPartialKey]) = True) then begin
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
  ClearWarnings;
end;

procedure TfrmShortcuts.FormActivate(Sender: TObject);
var
  pTmp: pointer;

begin
  ClearWarnings;
  with frmTinnMain do begin
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

    with jvhkShortcut do begin
      //Color     := clBGApplication;
      //Font.Color:= clFGApplication;
    end;

    with dbgShortcuts do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  with stbShortcuts do begin
    Panels[0].Text:= 'Browse mode';
    Panels[2].Text:= ExtractFileName(frmTinnMain.sShortcutsInUse);
  end;

  with ModDados.cdShortcuts do begin
    pTmp:= GetBookmark;
    Filtered:= False;
  end;  

  frmTools.lbShortcuts.Selected[frmTinnMain.iShortcutsFilter]:= False;
  
  with modDados.cdShortcuts do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;

  edtGroupSearch.SetFocus;
end;

procedure TfrmShortcuts.ActualizeGroups;
begin
  ClearWarnings;
  //Actualize Groups in frmTinnMain
  with modDados do begin
    ShortcutsGroupsFilter(nil);

    with frmTinnMain do begin
      frmTools.lbShortcuts.Items:= slShortcuts_Groups;
      frmTools.lbShortcuts.Refresh;
    end;

    FreeAndNil(slShortcuts_Groups);
  end;
end;

procedure TfrmShortcuts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with frmTinnMain do begin
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
  ActualizeGroups;
end;

procedure TfrmShortcuts.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmShortcuts.jvhkShortcutKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_BACK)   or
     (Key = VK_DELETE) or 
     (Key = VK_SPACE) then begin
    Key:= 0;
    bNothing:= True
  end;
end;

procedure TfrmShortcuts.jvhkShortcutKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
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
    jvhkShortcut.HotKey:= TextToShortcut(modDados.cdShortcuts.FieldByName('Shortcut').Value);
    Exit;
  end;

  bShortcutInUse:= False;
  with modDados.cdShortcuts do begin
    pTmp:= GetBookmark;
  end;

  bLocating:= True;
  if (modDados.cdShortcuts.Locate('Shortcut',
                                   StringReplace(ShortcutToText(jvhkShortcut.Hotkey), ' ', '', []),
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
                                  StringReplace(ShortcutToText(jvhkShortcut.Hotkey), ' ', '', []) +
                                  '>';
    bLocating:= False;
  end
  else begin
    ClearWarnings;
    bLocating:= False;

    with modDados.cdShortcuts do begin
      Edit;
      if (Key = VK_ESCAPE) then FieldByName('Shortcut').Value:= 'None'
                           else FieldByName('Shortcut').Value:= ShortcutToText(jvhkShortcut.HotKey);
    end;
  end;
end;

procedure TfrmShortcuts.jvhkShortcutEnter(Sender: TObject);
begin
  ClearWarnings;
  with modDados.cdShortcuts do
    Edit;
end;

procedure TfrmShortcuts.jvhkShortcutSearchChange(Sender: TObject);
var
  sTmp: string;

begin
  ClearWarnings;
  with jvhkShortcutSearch do begin
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

procedure TfrmShortcuts.jvhkShortcutSearchEnter(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.bbtShortcutsEditClick(Sender: TObject);
begin
  ClearWarnings;
  with modDados.cdShortcuts do
    Edit;
  dbeGroup.SetFocus;
  with stbShortcuts do
    Panels[0].Text:= 'Edit mode';
end;

procedure TfrmShortcuts.bbtShortcutsLoadClick(Sender: TObject);
var
  od       : TOpenDialog;
  sFile,
   sOldFile: string;

begin
  ClearWarnings;
  bbtShortcutsCancelAllClick(nil);
  od:= TOpenDialog.Create(Self);

  try
    with od do begin
      InitialDir:= frmTinnMain.sPathData;
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

        with frmTinnMain do begin
          iShortcutsBeforeChanges:= modDados.cdShortcuts.SavePoint;
          sShortcutsInUse        := sFile;
        end;

        with stbShortcuts do
          Panels[2].Text:= ExtractFileName(frmTinnMain.sShortcutsInUse);
          
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
  ClearWarnings;

  with modDados do begin
    cdShortcuts.Cancel;
    cdShortcutsAfterScroll(nil);
  end;
  with stbShortcuts do
    Panels[0].Text:= 'Browse mode';
end;

procedure TfrmShortcuts.bbtShortcutsSaveClick(Sender: TObject);
begin
  ClearWarnings;

  with modDados.cdShortcuts do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      frmTinnMain.iShortcutsBeforeChanges:= SavePoint;
    except
    end;
  end;
end;

procedure TfrmShortcuts.bbtShortcutsSaveDefaultClick(Sender: TObject);
var
  sFile: string;
  sd   : TSaveDialog;

begin
  ClearWarnings;
  bbtShortcutsSaveClick(nil);
  sd:= TSaveDialog.Create(Self);
  try
    with sd do begin
      InitialDir:= frmTinnMain.sPathData;
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

        with frmTinnMain do begin
          sdMain.Filter  := slFilters.Text;
          sShortcutsInUse:= sFile;
        end;
        with stbShortcuts do
          Panels[2].Text:= ExtractFileName(frmTinnMain.sShortcutsInUse);
      end;
    end;
  finally
    FreeAndNil(sd);
  end;
end;

procedure TfrmShortcuts.bbtShortcutsCloseClick(Sender: TObject);
begin
  with modDados.cdShortcuts do
    SavePoint:= frmTinnMain.iShortcutsBeforeChanges;

  Close;
  frmTinnMain.Refresh;
end;

procedure TfrmShortcuts.dbeCaptionEnter(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.dbeGroupEnter(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.dbgShortcutsEnter(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.dbgShortcutsTitleClick(Column: TColumn);
begin
  ClearWarnings;

  with modDados do begin
    cdShortcuts.IndexFieldNames:= Column.FieldName;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmShortcuts.dbmHintEnter(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  ClearWarnings;
end;

procedure TfrmShortcuts.bbHelpClick(Sender: TObject);
begin
  frmTinnMain.OpenUserGuidePDF('"Shortcuts"');
end;

procedure TfrmShortcuts.bbtShortcutsCancelAllClick(Sender: TObject);
begin
  ClearWarnings;

  with modDados do begin
    cdShortcuts.SavePoint:= frmTinnMain.iShortcutsBeforeChanges;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmShortcuts.bbtShortcutsRestoreDefaultClick(Sender: TObject);
begin
  ClearWarnings;
  bbtShortcutsCancelAllClick(nil);
  if not FileExists(frmTinnMain.sFileDataOrigin) then Exit;

  try
    with modDados.cdShortcuts do
      Active:= False;

    with frmTinnMain.zipKit do begin
      FileName     := frmTinnMain.sFileDataOrigin;
      BaseDirectory:= frmTinnMain.sPathData;
      ExtractFiles('Shortcuts.xml');
      CloseArchive;
    end;

    with modDados.cdShortcuts do begin
      FileName:= frmTinnMain.sPathData + '\Shortcuts.xml';
      Active  := True;
    end;

    with frmTinnMain do begin
      iShortcutsBeforeChanges:= modDados.cdShortcuts.SavePoint;
      sShortcutsInUse        := frmTinnMain.sPathData + '\Shortcuts.xml';
    end;

    with stbShortcuts do
      Panels[2].Text:= ExtractFileName(frmTinnMain.sShortcutsInUse);

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
