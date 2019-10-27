unit ufrmSKH_map;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Db, DBTables, Menus,
  Dialogs, ExtCtrls, Grids, JvgPage, EditAlign, StdCtrls, ComCtrls, DBGrids, JvExComCtrls, JvHotKey, DBCtrls, Mask,
  JvComCtrls, Buttons, JvAppHotKey, JvDBControls, SynEditMiscClasses, inifiles, ufrmSKH_Manager;

type
  TfrmSKH_Map_Dlg = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    pgSKH: TJvgPageControl;
    tbsAppShortcuts: TTabSheet;
    tbsEditorKeystrokes: TTabSheet;
    tbsRHotkeys: TTabSheet;
    rdgTinnRHotKeys: TRadioGroup;
    btnRemove: TButton;
    btnClearAllHotKeys: TButton;
    btnAddHotKey: TButton;
    Panel2: TPanel;
    JvDBNavigator2: TJvDBNavigator;
    gbKeystrokes: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    imgShortcut: TImage;
    dbeCaption: TDBEdit;
    edtSearch_Caption: TEdit;
    dbeGroup: TDBEdit;
    dbmHint: TDBMemo;
    edtSearch_Group: TEdit;
    bbtShortcuts_Load: TBitBtn;
    bbtShortcuts_SaveDefault: TBitBtn;
    bbtShortcuts_Edit: TBitBtn;
    bbtShortcuts_Cancel: TBitBtn;
    bbtShortcuts_Save: TBitBtn;
    dbgShortcuts: TDBGrid;
    bbtShortcuts_CancelAll: TBitBtn;
    bbtShortcuts_RestoreDefault: TBitBtn;
    btnUpdateKey: TButton;
    Label20: TLabel;
    Label24: TLabel;
    pnlCommands: TPanel;
    lvKeystrokes: TListView;
    pgRH: TJvgPageControl;
    tbsRH_Send: TTabSheet;
    tbsRH_Custom: TTabSheet;
    strgHK_Send: TStringGrid;
    strgHK_Custom: TStringGrid;
    stbShortcuts: TStatusBar;
    BitBtn2: TBitBtn;
    edFilter_Group: TEdit;
    edFilter_Caption: TEdit;
    Label1: TLabel;
    bbtShortcuts_Manager: TBitBtn;
    tbsRH_Control: TTabSheet;
    strgHK_Control: TStringGrid;
    lblCustom: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbgShortcutsDblClick(Sender: TObject);
    procedure lvKeystrokesDblClick(Sender: TObject);
    procedure strgHK_SendDblClick(Sender: TObject);
    procedure strgHK_ControlDblClick(Sender: TObject);
    procedure strgHK_CustomDblClick(Sender: TObject);
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
    procedure edtSearch_CaptionChange(Sender: TObject);
    procedure edtSearch_CaptionEnter(Sender: TObject);
    procedure edtSearch_GroupChange(Sender: TObject);
    procedure edtSearch_GroupEnter(Sender: TObject);
    procedure edFilter_CaptionChange(Sender: TObject);
    procedure edFilter_GroupChange(Sender: TObject);
    procedure bbtShortcuts_ManagerClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnAddHotKeyClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgTinnRHotKeysClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnClearAllHotKeysClick(Sender: TObject);
    procedure strgHK_CustomSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strgHK_SendDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgHK_ControlDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgHK_CustomDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure pgRHChange(Sender: TObject);
    procedure pgSKHChange(Sender: TObject);
    procedure strgHK_SendSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);

  private
    { Private declarations }

    procedure pAppMessage(var Msg: TMSG; var bHandled: Boolean);
    procedure pClear_Warnings;
    procedure pCreateHotkey_Custom(i: integer; sTmp: string);
    procedure pCreateHotkey_Send(i: integer; sTmp: string);
    procedure pCreateHotkey_Control(i: integer; sTmp: string);
    procedure pCreateR_Custom(i: integer; sTmp: string);
    procedure pDoHotKey_Custom(Sender: TObject);
    procedure pDoHotKey_Default(Sender: TObject);
    procedure pSKR_Clear_From(iSKH_Used_By: integer; sSHK: string);
    procedure pSKR_Assign_To(iSKH_Assign_To, iDx: integer; sSHK: string);

  public
    { Public declarations }
    dlgSKH_Manager   : TfrmSKH_Manager_Dlg;
    eKeyShort        : TSynHotKey;
    iSKH_Used_By     : integer;
    iSKH_Assign_To   : integer;
    iDx              : integer  // índice of the editor keystrokes/R hotkey in their respective stringGrid
  end;

var
  frmSKH_Map_Dlg: TfrmSKH_Map_Dlg;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools;

{$R *.dfm}


procedure TfrmSKH_Map_Dlg.pAppMessage(var Msg: TMSG;
                                      var bHandled: Boolean);
begin
  bHandled:= False;
  case Msg.Message of
    WM_SYSKEYDOWN:
      if (Msg.wParam = VK_F4) then bHandled:= True; // don't allow ALT-F4
  end;
end;

procedure TfrmSKH_Map_Dlg.pDoHotKey_Custom(Sender: TObject);
var
  sHKC,
   sRC: string;

  i: integer;

begin
  sHKC:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // R Action Custom
  for i:= 1 to 10 do begin
    if (lowercase(strgHK_Custom.Cells[1,i]) = lowercase(sHKC)) then begin
      sRC:= trim(strgHK_Custom.Cells[0,i]);
      frmMain.pSendRCustom(sRC);
      Exit;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.pDoHotKey_Default(Sender: TObject);
var
  sTmp: string;

  i: integer;

begin
  //SetForegroundWindow(Application.Handle);
  sTmp:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  for i:= 1 to 10 do
    if (lowercase(strgHK_Send.Cells[1,i]) = lowercase(sTmp)) then
      with frmMain do
        (* The below is to see only
           Cells[0,1]:= 'Send: file';
           Cells[0,2]:= 'Send: selection';
           Cells[0,3]:= 'Send: clipboard';
           Cells[0,4]:= 'Send: marked block';
           Cells[0,5]:= 'Send: contiguous';
           Cells[0,6]:= 'Send: smart';
           Cells[0,7]:= 'Send: line';
           Cells[0,8]:= 'Send: lines to end page (echo=T)';
        *)
        case i of
           1: if actRSendFile.Enabled                  then actRSendFileExecute(nil);
           2: if actRSendSelection.Enabled             then actRSendSelectionExecute(nil);
           3: if actRSendClipboard.Enabled             then actRSendClipboardExecute(nil);
           4: if actRSendBlockMarked.Enabled           then actRSendBlockMarkedExecute(nil);
           5: if actRSendContiguous.Enabled            then actRSendContiguousExecute(nil);
           6: if actRSendSmart.Enabled                 then actRSendSmartExecute(nil);
           7: if actRSendLine.Enabled                  then actRSendLineExecute(nil);
           8: if actRSendLinesToEndPage.Enabled        then actRSendLinesToEndPageExecute(nil);
        end;

  for i:= 1 to 10 do
    if (lowercase(strgHK_Control.Cells[1,i]) = lowercase(sTmp)) then
      with frmMain do
        (* The below is to see only
           Cells[0,1]:= 'Controlling: print content (selected)';
           Cells[0,2]:= 'Control: list names (selected)';
           Cells[0,3]:= 'Control: list structure (selected)';
           Cells[0,4]:= 'Control: list all objects';
           Cells[0,5]:= 'Control: clear console';
           Cells[0,6]:= 'Control: close all graphic devices';
           Cells[0,7]:= 'Control: help (selected)';
        *)
        case i of
           1: if actRContPrintVariableContent.Enabled  then actRContPrintVariableContentExecute(nil);
           2: if actRContListVariableNames.Enabled     then actRContListVariableNamesExecute(nil);
           3: if actRContListVariableStructure.Enabled then actRContListVariableStructureExecute(nil);
           4: actRContListAllObjectsExecute(nil);
           5: actRContClearConsoleExecute(nil);
           6: actRContCloseAllGraphicsExecute(nil);
           7: if actRContHelpSelectedWord.Enabled      then actRContHelpSelectedWordExecute(nil);
        end;
end;

procedure TfrmSKH_Map_Dlg.pgRHChange(Sender: TObject);
begin
  with frmMain.dlgSKH_Map do begin
    lblCustom.Visible:= (pgSKH.ActivePageIndex = 2) and
                        (pgRH.ActivePageIndex = 2);

//    ShowMessage(IntToStr(strgHK_Send.Row));
  end;
end;

procedure TfrmSKH_Map_Dlg.pgSKHChange(Sender: TObject);
begin
  with frmMain.dlgSKH_Map do
    lblCustom.Visible:= (pgSKH.ActivePageIndex = 2) and
                        (pgRH.ActivePageIndex = 2)
end;

procedure TfrmSKH_Map_Dlg.rdgTinnRHotKeysClick(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.pCreateHotkey_Send(i: integer;
                                             sTmp: string);
begin
  with frmMain do begin
    ajavHK_Send[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Send[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKey_Default;
    end;
  end;
    strgHK_Send.Cells[1,i]:= sTmp;
end;

procedure TfrmSKH_Map_Dlg.pCreateHotkey_Control(i: integer;
                                                sTmp: string);
begin
  with frmMain do begin
    ajavHK_Control[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Control[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKey_Default;
    end;
  end;
    strgHK_Control.Cells[1,i]:= sTmp;
end;

procedure TfrmSKH_Map_Dlg.pCreateR_Custom(i: integer;
                                          sTmp: string);
begin
  with frmMain do
    aR_Custom[i]:= sTmp;
  strgHK_Custom.Cells[0,i]:= sTmp;
end;

procedure TfrmSKH_Map_Dlg.pCreateHotkey_Custom(i: integer;
                                               sTmp: string);
begin
  with frmMain do begin
    ajavHK_Custom[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Custom[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKey_Custom;
    end;
  end;
  strgHK_Custom.Cells[1,i]:= sTmp;
end;

procedure TfrmSKH_Map_Dlg.pClear_Warnings;
begin
  with stbShortcuts do begin
    Panels[3].Text:= '';
    Panels[4].Text:= '';
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_CancelAllClick(Sender: TObject);
begin
  pClear_Warnings;

  with modDados do begin
    cdShortcuts.SavePoint:= frmMain.iShortcutsBeforeChanges;
    cdShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_CancelClick(Sender: TObject);
begin
  pClear_Warnings;

  with modDados do begin
    cdShortcuts.Cancel;
    cdShortcutsAfterScroll(nil);
  end;
  with stbShortcuts do
    Panels[0].Text:= 'Browse mode';
end;

procedure TfrmSKH_Map_Dlg.pSKR_Assign_To(iSKH_Assign_To,
                                          iDx: integer;
                                         sSHK: string);
begin
  case iSKH_Assign_To of
    // Application
    1: with modDados do
         with cdShortcuts do begin
           Edit;
           FieldByName('Shortcut').Value:= sSHK;
           Post;
         end;

    // Editor
    2: begin
         //TODO
    end;

    // RHK Send
    3: strgHK_Send.Cells[1,iDx]:= sSHK;

    // RHK Control
    4: strgHK_Custom.Cells[1,iDx]:= sSHK;

    // RHK Custom
    5: strgHK_Custom.Cells[1,iDx]:= sSHK;
  end;
end;

procedure TfrmSKH_Map_Dlg.pSKR_Clear_From(iSKH_Used_By: integer;
                                          sSHK: string);
var
  sBy: string;

  i: integer;

begin
  case iSKH_Used_By of
    1: begin
      // Application
      with modDados do begin
        fCheck_Shortcut_App(sSHK,
                            sBy,
                            True);
      end;  // with modDados

      ShowMessage('The S/K/H associated to [' +
                  sBy +
                  '] was emptied!');
    end;

    // Editor
    2: begin
       // TODO
    end;

    // RHK Send
    3: begin
         with frmMain do begin
           for i:= 1 to 10 do
             if Assigned(ajavHK_Send[i]) then
               if (ajavHK_Send[i].HotKey = dlgSKH_Manager.eKeyShort.HotKey) then begin
                 dlgSKH_Map.strgHK_Send.Cells[1,i]:= '';
                 ajavHK_Send[i].HotKey := TextToShortCut('');

                 ShowMessage('The S/K/H associated to [' +
                             'RHK Send | ' + strgHK_Send.Cells[0,i] +
                             '] was emptied!');
               end;
         end;
    end;

    // RHK Control
    4: begin
         with frmMain do begin
           for i:= 1 to 10 do
             if Assigned(ajavHK_Control[i]) then
               if (ajavHK_Control[i].HotKey = dlgSKH_Manager.eKeyShort.HotKey) then begin
                 dlgSKH_Map.strgHK_Control.Cells[1,i]:= '';
                 ajavHK_Control[i].HotKey := TextToShortCut('');

                 ShowMessage('The S/K/H associated to [' +
                             'RHK Control | ' + strgHK_Control.Cells[0,i] +
                             '] was emptied!');
               end;
         end;
    end;

    // RHK Custom
    5: begin
         with frmMain do begin
           for i:= 1 to 10 do
             if Assigned(ajavHK_Custom[i]) then
               if (ajavHK_Custom[i].HotKey = dlgSKH_Manager.eKeyShort.HotKey) then begin
                 dlgSKH_Map.strgHK_Custom.Cells[1,i]:= '';
                 ajavHK_Custom[i].HotKey := TextToShortCut('');

                 ShowMessage('The S/K/H associated to [' +
                             'RHK Custom | ' + strgHK_Custom.Cells[0,i] +
                             '] was emptied!');
               end;
         end;
    end;
  end;  // case iWhere
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_ManagerClick(Sender: TObject);
var
  sSKH: string;

  bSKH_InUse,
    bSKH_NoRemove: boolean;

begin
  try
    dlgSKH_Manager:= TfrmSKH_Manager_Dlg.Create(Self);

    if (dlgSKH_Manager.ShowModal = mrOK) then begin
      with dlgSKH_Manager do begin
        bSKH_InUse   := (lbInUse_Check.Caption = 'YES');
        bSKH_NoRemove:= (rgRemove_Current.ItemIndex = 0);

        if bSKH_InUse and
           bSKH_NoRemove then Exit;  // Nothing todo!
      end;

      sSKH:= ShortcutToText(dlgSKH_Manager.eKeyShort.HotKey);

      // Clear
      pSKR_Clear_From(iSKH_Used_By,   // Identify the S|K|H
                      sSKH);          // The shorcut to be clean

      // Assign
      pSKR_Assign_To(iSKH_Assign_To,  // Identify the S|K|H
                     iDx,             // Index of K|H
                     sSKH);           // The shorcut to be assigned
    end;  // if (dlgSH_Manager.ShowModal = mrOK)

  finally
    FreeAndNil(dlgSKH_Manager.eKeyShort);
    FreeAndNil(dlgSKH_Manager);
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_EditClick(Sender: TObject);
begin
  pClear_Warnings;
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
  pClear_Warnings;
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
  pClear_Warnings;
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
  pClear_Warnings;

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
  pClear_Warnings;
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

procedure TfrmSKH_Map_Dlg.BitBtn1Click(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"3.5 Hotkeys (operational system)"');
end;

procedure TfrmSKH_Map_Dlg.btnAddHotKeyClick(Sender: TObject);
//var
//  sTmp: string;
//  iRow: integer;

begin
  pClear_Warnings;

//  case pgRHotkeys.TabIndex of
//    // Send
//    0: begin
//         iRow:= strgHK_Send.Row;
//         with frmMain do begin
//           if Assigned(ajavHK_S[iRow]) then begin
//             ajavHK_S[iRow].WindowsKey:= True;
//             FreeAndNil(ajavHK_S[iRow]);
//             strgHK_Send.Cells[1,iRow]:= '';
//           end;
//         end;
//         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
//         pCreateHotkey_Send(iRow,
//                            sTmp);
//       end;
//
//    // Control
//    1: begin
//         iRow:= strgHK_Control.Row;
//         with frmMain do begin
//           if Assigned(ajavHK_Control[iRow]) then begin
//             ajavHK_Control[iRow].WindowsKey:= True;
//             FreeAndNil(ajavHK_Control[iRow]);
//             strgHK_Control.Cells[1,iRow]:= '';
//           end;
//         end;
//         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
//         pCreateHotkey_Control(iRow,
//                               sTmp);
//       end;
//
//    // R Action Custom
//    2: begin
//         iRow:= strgHK_Custom.Row;
//         with frmMain do begin
//           if Assigned(ajavHK_Custom[iRow]) then begin
//             ajavHK_Custom[iRow].WindowsKey:= True;
//             FreeAndNil(ajavHK_Custom[iRow]);
//             strgHK_Custom.Cells[1,iRow]:= '';
//           end;
//         end;
//         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
//         pCreateR_Custom(iRow,
//                         edHotkey.Text);
//         pCreateHotkey_Custom(iRow,
//                              sTmp);
//       end;
//  end;
end;

procedure TfrmSKH_Map_Dlg.btnClearAllHotKeysClick(Sender: TObject);
var
  i: Integer;

begin
  pClear_Warnings;

  case pgRH.TabIndex of
    // Send
    0: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_Send[i]) then begin
               ajavHK_Send[i].WindowsKey:= True;
               FreeAndNil(ajavHK_Send[i]);
               strgHK_Send.Cells[1,i]:= '';
             end;
           end;
         end;
       end;

    // Control
    1: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_Control[i]) then begin
               ajavHK_Control[i].WindowsKey:= True;
               FreeAndNil(ajavHK_Control[i]);
               strgHK_Send.Cells[1,i]:= '';
             end;
           end;
         end;
       end;

    // R Action Custom
    2: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_Custom[i]) then begin
               ajavHK_Custom[i].WindowsKey:= True;
               FreeAndNil(ajavHK_Custom[i]);
               strgHK_Custom.Cells[1,i]:= '';
             end;
           end;
         end;
       end;
  end;
end;

procedure TfrmSKH_Map_Dlg.btnRemoveClick(Sender: TObject);
var
  iRow: integer;

begin
  pClear_Warnings;

  case pgRH.TabIndex of
    // Send
    0: begin
         iRow:= strgHK_Send.Row;
         try
           with frmMain do begin
             ajavHK_Send[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_Send[iRow]);
           end;
           strgHK_Send.Cells[1,iRow]:= '';
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;

    // Control
    1: begin
         iRow:= strgHK_Control.Row;
         try
           with frmMain do begin
             ajavHK_Control[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_Control[iRow]);
           end;
           strgHK_Control.Cells[1,iRow]:= '';
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;

    // R Action Custom
    2: begin
         iRow:= strgHK_Custom.Row;
         try
           strgHK_Custom.Cells[0,iRow]:= '';
           with frmMain do begin
             ajavHK_Custom[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_Custom[iRow]);
           end;
           strgHK_Custom.Cells[1,iRow]:= '';
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;
  end;
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.dbgShortcutsTitleClick(Column: TColumn);
begin
  pClear_Warnings;

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

procedure TfrmSKH_Map_Dlg.edtSearch_CaptionChange(Sender: TObject);
begin
  pClear_Warnings;
  with edtSearch_Caption do begin
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

procedure TfrmSKH_Map_Dlg.edtSearch_CaptionEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.edtSearch_GroupChange(Sender: TObject);
begin
  pClear_Warnings;
  with edtSearch_Group do begin
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

procedure TfrmSKH_Map_Dlg.edtSearch_GroupEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.FormActivate(Sender: TObject);
var
  pTmp: pointer;

begin
  with frmMain do begin
    pgSKH.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
    pgRH.TabSelectedStyle.BackgrColor := clBGTabSelectedNew;
  end;

  pClear_Warnings;
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

procedure TfrmSKH_Map_Dlg.FormCreate(Sender: TObject);
var
  ifHotKeys: TIniFile;
  sTmp     : string;
  aHK      : array[1..10] of string;
  i        : integer;

begin
  Application.OnMessage:= pAppMessage;
  // Send
  with strgHK_Send do begin
     Cells[0,0]:= 'Action';
     Cells[1,0]:= 'Hotkey';
     Cells[0,1]:= 'File';
     Cells[0,2]:= 'Selection';
     Cells[0,3]:= 'Clipboard';
     Cells[0,4]:= 'Marked block';
     Cells[0,5]:= 'Continguous';
     Cells[0,6]:= 'Smart';
     Cells[0,7]:= 'Line';
     Cells[0,8]:= 'Lines to end page';
   end;

  // Control
  with strgHK_Control do begin
    Cells[0,0]:= 'Action';
    Cells[1,0]:= 'Hotkey';
    Cells[0,1]:= 'Print content (selected)';
    Cells[0,2]:= 'List names (selected)';
    Cells[0,3]:= 'List structure (selected)';
    Cells[0,4]:= 'List all objects';
    Cells[0,5]:= 'Clear console';
    Cells[0,6]:= 'Close all graphic devices';
    Cells[0,7]:= 'Help (selected)';
  end;

  // R Action Custom
  with strgHK_Custom do begin
    Cells[0,0]:= 'Action*';
    Cells[1,0]:= 'Hotkey';
  end;

  // Read the ini file for settings
  ifHotKeys:= TIniFile.Create(frmMain.sPathIniTinn_File);

  // R Hotkeys Send
  with strgHK_Send do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Send',
                                    'RHK' + IntToStr(i),
                                    '');
      //if (aHK[i] <> '') then begin
      if (Cells[0,i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_Send(i,
                           sTmp);
      end;
    end;
  end;

  // R Hotkeys Send Control
  with strgHK_Control do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Control',
                                    'RHK' + IntToStr(i),
                                    '');
      //if (aHK[i] <> '') then begin
      if (Cells[0,i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_Control(i,
                              sTmp);
      end;
    end;
  end;

  // R Action Custom
  with strgHK_Custom do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Action Custom',
                                    'RAC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
//      if (Cells[0,i] <> '') then begin
        sTmp:= aHK[i];
        pCreateR_Custom(i,
                        sTmp);
      end;
    end;
  end;

  // R Action Custom Hotkeys
  with strgHK_Custom do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Custom',
                                    'RHKC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
//      if (Cells[0,i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_Custom(i,
                             sTmp);
      end;
    end;
  end;

  FreeAndNil(ifHotKeys);

//  Application.OnMessage:= pAppMessage;
//  // Send
//  with strgHK_Send do begin
//     Cells[0,0]:= 'Action';
//     Cells[1,0]:= 'Hotkey';
//     Cells[0,1]:= 'Send: file';
//     Cells[0,2]:= 'Send: selection';
//     Cells[0,3]:= 'Send: clipboard';
//     Cells[0,4]:= 'Send: marked block';
//     Cells[0,5]:= 'Send: continguous';
//     Cells[0,6]:= 'Send: smart';
//     Cells[0,7]:= 'Send: line';
//     Cells[0,8]:= 'Send: lines to end page';
//   end;
//
//  // Control
//  with strgHK_Control do begin
//    Cells[0,0]:= 'Action';
//    Cells[1,0]:= 'Hotkey';
//    Cells[0,1]:= 'Control: print content (selected)';
//    Cells[0,2]:= 'Control: list names (selected)';
//    Cells[0,3]:= 'Control: list structure (selected)';
//    Cells[0,4]:= 'Control: list all objects';
//    Cells[0,5]:= 'Control: clear console';
//    Cells[0,6]:= 'Control: close all graphic devices';
//    Cells[0,7]:= 'Control: help (selected)';
//  end;
//
//  // R Action Custom
//  with strgHK_Custom do begin
//    Cells[0,0]:= 'Action*';
//    Cells[1,0]:= 'Hotkey';
//  end;

  pgRH.TabIndex:= 0;
end;

procedure TfrmSKH_Map_Dlg.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
  rdgTinnRHotKeys.ItemIndex:= Integer(frmMain.bHotKeys_On);
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

procedure TfrmSKH_Map_Dlg.strgHK_ControlDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ARow >= strgHK_Control.FixedRows) then Exit;

  // Set font to bold
  strgHK_Control.Canvas.Font.Style := [fsBold];  // must come before the TextWidth & TextHeight

//  // Paint the cell background
//  if ACol = 1 then  // column 2 background is red - if you want that
//    strgHK_Control.Canvas.Brush.Color := clRed;

  strgHK_Control.Canvas.FillRect(Rect);

  // Draw the text
  strgHK_Control.Canvas.TextOut(Rect.Left,
                                Rect.Top,
                                strgHK_Control.Cells[ACol, ARow]);
end;

procedure TfrmSKH_Map_Dlg.strgHK_CustomDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.strgHK_CustomDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ARow >= strgHK_Custom.FixedRows) then Exit;

  // Set font to bold
  strgHK_Custom.Canvas.Font.Style := [fsBold];  // must come before the TextWidth & TextHeight

//  // Paint the cell background
//  if ACol = 1 then  // column 2 background is red - if you want that
//    strgHK_Custom.Canvas.Brush.Color := clRed;

  strgHK_Custom.Canvas.FillRect(Rect);

  // Draw the text
  strgHK_Custom.Canvas.TextOut(Rect.Left,
                               Rect.Top,
                               strgHK_Custom.Cells[ACol, ARow]);
end;

procedure TfrmSKH_Map_Dlg.strgHK_CustomSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  if (aCol <> 0) then begin
     CanSelect:= FALSE;
     Exit;
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
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.strgHK_SendDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ARow >= strgHK_Send.FixedRows) then Exit;

  // Set font to bold
  strgHK_Send.Canvas.Font.Style := [fsBold];  // must come before the TextWidth & TextHeight

//  // Paint the cell background
//  if ACol = 1 then  // column 2 background is red - if you want that
//    strgHK_Send.Canvas.Brush.Color := clRed;

  strgHK_Send.Canvas.FillRect(Rect);

  // Draw the text
  strgHK_Send.Canvas.TextOut(Rect.Left,
                             Rect.Top,
                             strgHK_Send.Cells[ACol, ARow]);
end;

procedure TfrmSKH_Map_Dlg.strgHK_SendSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
//  ShowMessage('RHK Send: ' + IntToStr(ARow));
end;

//  with modDados.cdShortcuts do
//    SavePoint:= frmMain.iShortcutsBeforeChanges;
//
//  Close;
//  frmMain.Refresh;

//  eKeyShort:= TSynHotKey.Create(Self);
//
//  with eKeyShort do
//  begin
//    Parent     := gbRhotkeys;
//    Left       := edHotkey.Width + 20;
//    Top        := edHotkey.Top;
//    Width      := 125;
//    Height     := edHotkey.Height;
//    HotKey     := 0;
//    InvalidKeys:= [];
//    Modifiers  := [];
//    TabOrder   := 1;
//    BorderStyle:= bsSingle;
//    //OnKeyUp    := pKeyUp;  {Not Working}
//  end;
//  pSet_LabelColor(clBlack);

end.
