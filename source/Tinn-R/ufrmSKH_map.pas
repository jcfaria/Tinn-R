unit ufrmSKH_map;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Db, DBTables, Menus,
  Dialogs, ExtCtrls, Grids, JvgPage, EditAlign, StdCtrls, ComCtrls, DBGrids, JvExComCtrls, JvHotKey, DBCtrls, Mask,
  JvComCtrls, Buttons, JvDBControls, ufrmSKH_Manager;

type
  TfrmSKH_Map_Dlg = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    pgSH: TJvgPageControl;
    tbsAppShortcuts: TTabSheet;
    tbsEditorKeystrokes: TTabSheet;
    tbsRHotkeys: TTabSheet;
    GroupBox2: TGroupBox;
    edHotkey: TEditAlign;
    rdgTinnRHotKeys: TRadioGroup;
    btnOK: TButton;
    btnRemove: TButton;
    btnClearAllHotKeys: TButton;
    btnAddHotKey: TButton;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    JvDBNavigator2: TJvDBNavigator;
    gbKeystrokes: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    imgShortcut: TImage;
    dbeCaption: TDBEdit;
    edtCaptionSearch: TEdit;
    dbeGroup: TDBEdit;
    dbmHint: TDBMemo;
    edtGroupSearch: TEdit;
    bbtShortcuts_Load: TBitBtn;
    bbtShortcuts_SaveDefault: TBitBtn;
    bbtShortcuts_Edit: TBitBtn;
    bbtShortcuts_Cancel: TBitBtn;
    bbtShortcuts_Save: TBitBtn;
    dbgShortcuts: TDBGrid;
    bbtShortcuts_Manager: TBitBtn;
    bbtShortcuts_CancelAll: TBitBtn;
    bbtShortcuts_RestoreDefault: TBitBtn;
    bbtShortcut_Help: TBitBtn;
    btnUpdateKey: TButton;
    Label20: TLabel;
    Label24: TLabel;
    pnlCommands: TPanel;
    lvKeystrokes: TListView;
    pgRhotkeys: TJvgPageControl;
    tbsSend_Control: TTabSheet;
    tbsCustom: TTabSheet;
    strgHK_Send: TStringGrid;
    strgHK_CU: TStringGrid;
    stbShortcuts: TStatusBar;
    BitBtn2: TBitBtn;
    edFilter_Group: TEdit;
    edFilter_Caption: TEdit;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbgShortcutsDblClick(Sender: TObject);
    procedure lvKeystrokesDblClick(Sender: TObject);
    procedure strgHK_SendDblClick(Sender: TObject);
    procedure strgHK_ControlDblClick(Sender: TObject);
    procedure strgHK_CUDblClick(Sender: TObject);
    procedure strgHK_CU2DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtShortcuts_RestoreDefaultClick(Sender: TObject);
    procedure bbtShortcuts_CancelAllClick(Sender: TObject);
    procedure bbtShortcut_HelpClick(Sender: TObject);
    procedure bbtShortcuts_SaveDefaultClick(Sender: TObject);
    procedure bbtShortcuts_SaveClick(Sender: TObject);
    procedure bbtShortcuts_CancelClick(Sender: TObject);
    procedure bbtShortcuts_EditClick(Sender: TObject);
    procedure bbtShortcuts_LoadClick(Sender: TObject);
    procedure dbgShortcutsTitleClick(Column: TColumn);
    procedure dbgShortcutsEnter(Sender: TObject);
    procedure dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
    procedure edtCaptionSearchChange(Sender: TObject);
    procedure edtCaptionSearchEnter(Sender: TObject);
    procedure edtGroupSearchChange(Sender: TObject);
    procedure edtGroupSearchEnter(Sender: TObject);
    procedure edFilter_CaptionChange(Sender: TObject);
    procedure edFilter_GroupChange(Sender: TObject);
    procedure bbtShortcuts_ManagerClick(Sender: TObject);

  private
    { Private declarations }

    procedure pClearWarnings;

  public
    { Public declarations }
    dlgSKH_Manager: TfrmSKH_Manager_Dlg;

  end;

var
  frmSKH_Map_Dlg: TfrmSKH_Map_Dlg;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools;

{$R *.dfm}


procedure TfrmSKH_Map_Dlg.pClearWarnings;
begin
  with stbShortcuts do begin
    Panels[3].Text:= '';
    Panels[4].Text:= '';
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_CancelAllClick(Sender: TObject);
begin
  pClearWarnings;

  with modDados do begin
    cdShortcuts.SavePoint:= frmMain.iShortcutsBeforeChanges;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_CancelClick(Sender: TObject);
begin
  pClearWarnings;

  with modDados do begin
    cdShortcuts.Cancel;
    cdShortcutsAfterScroll(nil);
  end;
  with stbShortcuts do
    Panels[0].Text:= 'Browse mode';
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_ManagerClick(Sender: TObject);
var
  sTmp,
   sBy: string;

  bShortcut_InUse,
    bShortcut_NotRemove: boolean;

begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);

    if (dlgSKH_Manager.ShowModal = mrOK) then begin
      with dlgSKH_Manager do begin
        bShortcut_InUse:= (lbInUse_Check.Caption = 'In use: YES');
        bShortcut_NotRemove:= (rgRemove_Current.ItemIndex = 0);

        if bShortcut_InUse and
           bShortcut_NotRemove then Exit; {Nothing todo!}
      end;

      sTmp:= ShortcutToText(dlgSKH_Manager.eKeyShort.HotKey);

      with modDados do begin
        fCheck_Shortcut_Use_App(sTmp,
                                sBy,
                                True);

        if bShortcut_InUse then
          ShowMessage('The shortcut associated to [' +
                      sBy +
                      '] was emptied!');

        with cdShortcuts do begin
          Edit;
          FieldByName('Shortcut').Value:= sTmp;
          Post;
        end;  // with cdShortcuts
      end;  // with modDados
    end;  // if (dlgSH_Manager.ShowModal = mrOK)
  finally
    FreeAndNil(dlgSKH_Manager.eKeyShort);
    FreeAndNil(dlgSKH_Manager);
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_EditClick(Sender: TObject);
begin
  pClearWarnings;
  with modDados.cdShortcuts do
    Edit;
  dbeGroup.SetFocus;
  with stbShortcuts do
    Panels[0].Text:= 'Edit mode';
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_LoadClick(Sender: TObject);
var
  od: TOpenDialog;

  sFile,
   sOldFile: string;

begin
  pClearWarnings;
  bbtShortcuts_CancelAllClick(nil);
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

procedure TfrmSKH_Map_Dlg.bbtShortcuts_RestoreDefaultClick(Sender: TObject);
begin
  pClearWarnings;
  bbtShortcuts_CancelAllClick(nil);
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
    // TODO!
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_SaveClick(Sender: TObject);
begin
  pClearWarnings;

  with modDados.cdShortcuts do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      with frmMain do
        iShortcutsBeforeChanges:= SavePoint;
    except
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_SaveDefaultClick(Sender: TObject);
var
  sFile: string;

  sd: TSaveDialog;

begin
  pClearWarnings;
  bbtShortcuts_SaveClick(nil);
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
          bbtShortcuts_SaveClick(nil);
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

procedure TfrmSKH_Map_Dlg.bbtShortcut_HelpClick(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"Shortcuts"');
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
begin
  pClearWarnings;
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsTitleClick(Column: TColumn);
begin
  pClearWarnings;

  with modDados do begin
    cdShortcuts.IndexFieldNames:= Column.FieldName;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmSKH_Map_Dlg.edFilter_CaptionChange(Sender: TObject);
begin
  try
    with modDados.cdShortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + edFilter_Group.Text + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edFilter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edFilter_GroupChange(Sender: TObject);
begin
  try
    with modDados.cdShortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + edFilter_Group.Text + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edFilter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edtCaptionSearchChange(Sender: TObject);
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

procedure TfrmSKH_Map_Dlg.edtCaptionSearchEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmSKH_Map_Dlg.edtGroupSearchChange(Sender: TObject);
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

procedure TfrmSKH_Map_Dlg.edtGroupSearchEnter(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmSKH_Map_Dlg.FormActivate(Sender: TObject);
var
  pTmp: pointer;

begin
  with frmMain do begin
    pgSH.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
    pgRHotkeys.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
  end;

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
end;

procedure TfrmSKH_Map_Dlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with frmMain do begin
    frmTools.lbShortcuts.ItemIndex:= iShortcutsFilter;
    frmTools.lbShortcutsClick(Self);
  end;
end;

procedure TfrmSKH_Map_Dlg.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmSKH_Map_Dlg.lvKeystrokesDblClick(Sender: TObject);
begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);
    dlgSKH_Manager.ShowModal;
  finally
    FreeAndNil(dlgSKH_Manager);
  end;
end;

procedure TfrmSKH_Map_Dlg.strgHK_ControlDblClick(Sender: TObject);
begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);
    dlgSKH_Manager.ShowModal;
  finally
    FreeAndNil(dlgSKH_Manager);
  end;
end;

procedure TfrmSKH_Map_Dlg.strgHK_CUDblClick(Sender: TObject);
begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);
    dlgSKH_Manager.ShowModal;
  finally
    FreeAndNil(dlgSKH_Manager);
  end;
end;

procedure TfrmSKH_Map_Dlg.strgHK_CU2DblClick(Sender: TObject);
begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);
    dlgSKH_Manager.ShowModal;
  finally
    FreeAndNil(dlgSKH_Manager);
  end;
end;

procedure TfrmSKH_Map_Dlg.strgHK_SendDblClick(Sender: TObject);
begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);
    dlgSKH_Manager.ShowModal;
  finally
    FreeAndNil(dlgSKH_Manager);
  end;
end;

//  with modDados.cdShortcuts do
//    SavePoint:= frmMain.iShortcutsBeforeChanges;
//
//  Close;
//  frmMain.Refresh;

end.
