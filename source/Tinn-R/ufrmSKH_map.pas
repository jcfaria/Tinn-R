unit ufrmSKH_map;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Db, DBTables, Menus,
  Dialogs, ExtCtrls, Grids, JvgPage, EditAlign, StdCtrls, ComCtrls, DBGrids, JvExComCtrls, JvHotKey, DBCtrls, Mask,
  JvComCtrls, Buttons, JvAppHotKey, JvDBControls, SynEditMiscClasses, inifiles, ufrmSKH_Manager, DBClient;

type
  TfrmSKH_Map_Dlg = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    pgSKH: TJvgPageControl;
    tbsAppShortcuts: TTabSheet;
    tbsEditorKeystrokes: TTabSheet;
    tbsRHotkeys: TTabSheet;
    rdgTinnRHotKeys: TRadioGroup;
    btnRH_Clear: TButton;
    Panel2: TPanel;
    JvDBNavigator2: TJvDBNavigator;
    gbKeystrokes: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    imgShortcut: TImage;
    dbeApp_Caption: TDBEdit;
    edApp_Search_Caption: TEdit;
    dbeApp_Group: TDBEdit;
    dbmHint: TDBMemo;
    edApp_Search_Group: TEdit;
    bbtShortcuts_Load: TBitBtn;
    bbtShortcuts_SaveDefault: TBitBtn;
    bbtShortcuts_Edit: TBitBtn;
    bbtShortcuts_Cancel: TBitBtn;
    bbtShortcuts_Save: TBitBtn;
    dbgShortcuts: TDBGrid;
    bbtShortcuts_CancelAll: TBitBtn;
    bbtShortcuts_RestoreDefault: TBitBtn;
    Label20: TLabel;
    Label24: TLabel;
    pgRH: TJvgPageControl;
    tbsRH_Send: TTabSheet;
    tbsRH_Custom: TTabSheet;
    stbShortcuts: TStatusBar;
    BitBtn2: TBitBtn;
    edApp_Filter_Group: TEdit;
    edApp_Filter_Caption: TEdit;
    Label1: TLabel;
    bbtShortcuts_Manager: TBitBtn;
    tbsRH_Control: TTabSheet;
    lblCustom: TLabel;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbeRH_Send_Caption: TDBEdit;
    edRH_Send_Search_Caption: TEdit;
    dbeRH_Send_Group: TDBEdit;
    edRH_Send_Filter_Caption: TEdit;
    JvDBNavigator1: TJvDBNavigator;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    dbeRH_Control_Caption: TDBEdit;
    edRH_Control_Search_Caption: TEdit;
    dbeRH_Control_Group: TDBEdit;
    edRH_Control_Filter_Caption: TEdit;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    dbeRH_Custom_Caption: TDBEdit;
    edRH_Custom_Search_Caption: TEdit;
    dbeRH_Custom_Group: TDBEdit;
    edRH_Custom_Filter_Caption: TEdit;
    JvDBNavigator3: TJvDBNavigator;
    JvDBNavigator4: TJvDBNavigator;
    dbgRH_Send: TDBGrid;
    dbgRH_Control: TDBGrid;
    dbgRH_Custom: TDBGrid;
    Label15: TLabel;
    Label11: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    Label17: TLabel;
    btnEditor_Keystrokes_Clear: TButton;
    bbtEditor_Keystrokes_RestoreDefault: TBitBtn;
    bbtHotkeys_RestoreDefault: TBitBtn;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbeEditor_Keystrokes_Command: TDBEdit;
    edEditor_Keystrokes_Search: TEdit;
    dbeEditor_Keystrokes_Group: TDBEdit;
    edEditor_Keystrokes_Filter: TEdit;
    JvDBNavigator5: TJvDBNavigator;
    dbgEditor_Keystrokes: TDBGrid;

    procedure bbtHotkeys_RestoreDefaultClick(Sender: TObject);
    procedure bbtEditor_Keystrokes_RestoreDefaultClick(Sender: TObject);
    procedure bbtShortcut_HelpClick(Sender: TObject);
    procedure bbtShortcuts_CancelAllClick(Sender: TObject);
    procedure bbtShortcuts_CancelClick(Sender: TObject);
    procedure bbtShortcuts_EditClick(Sender: TObject);
    procedure bbtShortcuts_LoadClick(Sender: TObject);
    procedure bbtShortcuts_ManagerClick(Sender: TObject);
    procedure bbtShortcuts_RestoreDefaultClick(Sender: TObject);
    procedure bbtShortcuts_SaveClick(Sender: TObject);
    procedure bbtShortcuts_SaveDefaultClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEditor_Keystrokes_ClearClick(Sender: TObject);
    procedure btnNew_RH_CustomClick(Sender: TObject);
    procedure btnRH_ClearClick(Sender: TObject);
    procedure dbgEditor_KeystrokesDblClick(Sender: TObject);
    procedure dbgEditor_KeystrokesEnter(Sender: TObject);
    procedure dbgEditor_KeystrokesTitleClick(Column: TColumn);
    procedure dbgRH_ControlDblClick(Sender: TObject);
    procedure dbgRH_ControlTitleClick(Column: TColumn);
    procedure dbgRH_CustomDblClick(Sender: TObject);
    procedure dbgRH_CustomEnter(Sender: TObject);
    procedure dbgRH_CustomKeyPress(Sender: TObject; var Key: Char);
    procedure dbgRH_CustomTitleClick(Column: TColumn);
    procedure dbgRH_SendDblClick(Sender: TObject);
    procedure dbgRH_SendTitleClick(Column: TColumn);
    procedure dbgShortcutsDblClick(Sender: TObject);
    procedure dbgShortcutsEnter(Sender: TObject);
    procedure dbgShortcutsKeyPress(Sender: TObject; var Key: Char);
    procedure dbgShortcutsTitleClick(Column: TColumn);
    procedure edApp_Filter_CaptionChange(Sender: TObject);
    procedure edApp_Filter_GroupChange(Sender: TObject);
    procedure edApp_Search_CaptionChange(Sender: TObject);
    procedure edApp_Search_CaptionEnter(Sender: TObject);
    procedure edApp_Search_GroupChange(Sender: TObject);
    procedure edApp_Search_GroupEnter(Sender: TObject);
    procedure edEditor_Keystrokes_FilterChange(Sender: TObject);
    procedure edEditor_Keystrokes_SearchChange(Sender: TObject);
    procedure edRH_Control_Filter_CaptionChange(Sender: TObject);
    procedure edRH_Control_Search_CaptionChange(Sender: TObject);
    procedure edRH_Custom_Filter_CaptionChange(Sender: TObject);
    procedure edRH_Custom_Search_CaptionChange(Sender: TObject);
    procedure edRH_Send_Filter_CaptionChange(Sender: TObject);
    procedure edRH_Send_Search_CaptionChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvKeystrokesDblClick(Sender: TObject);
    procedure pgRHChange(Sender: TObject);
    procedure pgSKHChange(Sender: TObject);
    procedure rdgTinnRHotKeysClick(Sender: TObject);
    procedure strgHK_ControlDblClick(Sender: TObject);
    procedure strgHK_CU2DblClick(Sender: TObject);
    procedure strgHK_CustomDblClick(Sender: TObject);
    procedure strgHK_CustomSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strgHK_SendDblClick(Sender: TObject);

  private
    { Private declarations }

    procedure pAppMessage(var Msg: TMSG; var bHandled: Boolean);
    procedure pClear_Warnings;
    procedure pCreate_Hotkey_Control(i: integer; sTmp: string);
    procedure pCreate_Hotkey_Send(i: integer; sTmp: string);
    procedure pDo_HotKey_Control(Sender: TObject);
    procedure pDo_HotKey_Custom(Sender: TObject);
    procedure pDo_HotKey_Send(Sender: TObject);
    procedure pSKR_Assign_To(iSKH_Assign_To, iDx: integer; sSHK: string);
    procedure pSKR_Clear_From(iSKH_Used_By: integer; sSHK: string);

  public
    { Public declarations }
    dlgSKH_Manager   : TfrmSKH_Manager_Dlg;
    eKeyShort        : TSynHotKey;
    iDx              : integer;  // índice of the editor keystrokes/R hotkey in their respective stringGrid
    iSKH_Assign_To   : integer;
    iSKH_Used_By     : integer;

    procedure pCreate_Hotkey_Custom(i: integer; sTmp: string);
  end;

var
  frmSKH_Map_Dlg: TfrmSKH_Map_Dlg;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools,
  trUtils;

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

procedure TfrmSKH_Map_Dlg.pDo_HotKey_Custom(Sender: TObject);
var
  sRH_Custom: string;

begin
  sRH_Custom:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // RH_Custom
  with modDados.cdRH_Custom do begin
    DisableControls;

    Locate('HotKey',
           sRH_Custom,
           []);

    frmMain.pSend_Rcustom(Fields[2].AsString);

    EnableControls;
  end;
end;

procedure TfrmSKH_Map_Dlg.pDo_HotKey_Send(Sender: TObject);
var
  sRH_Send: string;

  i: integer;

begin
  //SetForegroundWindow(Application.Handle);
  sRH_Send:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // RH_Send
  with modDados.cdRH_Send do begin
    DisableControls;

    Locate('HotKey',
           sRH_Send,
           []);

    i:= Fields[0].AsInteger;

    EnableControls;
  end;

  with frmMain do
    (* The below is to see only
    <ROWDATA>
      <ROW Index="0" Group="Send" Caption="File" Shortcut="Ctrl+."/>
      <ROW Index="1" Group="Send" Caption="Selection" Shortcut="Ctrl+,"/>
      <ROW Index="2" Group="Send" Caption="Marked block" Shortcut="Ctrl+["/>
      <ROW Index="3" Group="Send" Caption="Contiguous" Shortcut="Ctrl+]"/>
      <ROW Index="4" Group="Send" Caption="Smart" Shortcut="Shift+Ctrl+\"/>
      <ROW Index="5" Group="Send" Caption="Line" Shortcut="Ctrl+\"/>
      <ROW Index="6" Group="Send" Caption="Current line to top" Shortcut="Ctrl+D"/>
      <ROW Index="7" Group="Send" Caption="Lines to end page" Shortcut="Ctrl+D"/>
      <ROW Index="8" Group="Send" Caption="Cursor to beggining line" Shortcut="Ctrl+D"/>
      <ROW Index="9" Group="Send" Caption="Cursor to end line" Shortcut="Ctrl+D"/>
      <ROW Index="10" Group="Send" Caption="Sweave (.Rnw)" Shortcut="Ctrl+D"/>
      <ROW Index="11" Group="Send" Caption="Knit to LaTeX (.Rnw)" Shortcut="Ctrl+D"/>
      <ROW Index="12" Group="Send" Caption="Knit to HTML (.Rmd, Rhtml)" Shortcut="Ctrl+D"/>
    </ROWDATA>
    *)

    case i of
        0: if actRSend_File.Enabled                   then actRSend_FileExecute(nil);
        1: if actRSend_Selection.Enabled              then actRSend_SelectionExecute(nil);
        2: if actRSend_BlockMarked.Enabled            then actRSend_BlockMarkedExecute(nil);
        3: if actRSend_Contiguous.Enabled             then actRSend_ContiguousExecute(nil);
        4: if actRSend_Smart.Enabled                  then actRSend_SmartExecute(nil);
        5: if actRSend_Line.Enabled                   then actRSend_LineExecute(nil);
        6: if actRSend_CurrentLineToTop.Enabled       then actRSend_CurrentLineToTopExecute(nil);
        7: if actRSend_LinesToEndPage.Enabled         then actRSend_LinesToEndPageExecute(nil);
        8: if actRSend_CursorToBeginningLine.Enabled  then actRSend_CursorToBeginningLineExecute(nil);
        9: if actRSend_CursorToEndLine.Enabled        then actRSend_CursorToEndLineExecute(nil);
       10: if actRSend_Sweave.Enabled                 then actRSend_SweaveExecute(nil);
       11: if actRSend_KnitPdf.Enabled                then actRSend_KnitPdfExecute(nil);
       12: if actRSend_KnitHtml.Enabled               then actRSend_KnitHtmlExecute(nil);
    end;
end;

procedure TfrmSKH_Map_Dlg.pDo_HotKey_Control(Sender: TObject);
var
  sRH_Control: string;

  i: integer;

begin
  //SetForegroundWindow(Application.Handle);
  sRH_Control:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // RH_Control
  with modDados.cdRH_Control do begin
    DisableControls;

    Locate('HotKey',
           sRH_Control,
           []);

    i:= Fields[0].AsInteger;

    EnableControls;
  end;

  with frmMain do
    (* The below is to see only
     <ROWDATA>
       <ROW Index="0" Group="Control" Caption="Set work directory (curretn file path)" Shortcut=""/>
       <ROW Index="1" Group="Control" Caption="List all objetcs" Shortcut="Alt+S"/>
       <ROW Index="2" Group="Control" Caption="Print content (selected)" Shortcut="Alt+P"/>
       <ROW Index="3" Group="Control" Caption="Plot (selected)" Shortcut=""/>
       <ROW Index="4" Group="Control" Caption="List names (selected)" Shortcut=""/>
       <ROW Index="5" Group="Control" Caption="List structure (selected)" Shortcut="Alt+T"/>
       <ROW Index="6" Group="Control" Caption="Edit (selected)" Shortcut=""/>
       <ROW Index="7" Group="Control" Caption="Fix (selected)" Shortcut=""/>
       <ROW Index="8" Group="Control" Caption="Clear console" Shortcut=""/>
       <ROW Index="9" Group="Control" Caption="Close all graphics devices" Shortcut=""/>
       <ROW Index="10" Group="Control" Caption="Help (selected)" Shortcut=""/>
       <ROW Index="11" Group="Control" Caption="Example (selected)" Shortcut=""/>
       <ROW Index="12" Group="Control" Caption="Open example (selected)" Shortcut=""/>
       <ROW Index="13" Group="Control" Caption="Help" Shortcut=""/>
       <ROW Index="14" Group="Control" Caption="Rgui|PuTTY (start/close)" Shortcut=""/>
       <ROW Index="15" Group="Control" Caption="Rterm (start/close)" Shortcut=""/>
     </ROWDATA>
      *)

    case i of
        0: if actRCont_SetWorkDirectory.Enabled        then actRCont_SetWorkDirectoryExecute(nil);
        1: if actRCont_ListAllObjects.Enabled          then actRCont_ListAllObjectsExecute(nil);
        2: if actRCont_PrintVariableContent.Enabled    then actRCont_PrintVariableContentExecute(nil);
        3: if actRCont_PlotVariable.Enabled            then actRCont_PlotVariableExecute(nil);
        4: if actRCont_ListVariableNames.Enabled       then actRCont_ListVariableNamesExecute(nil);
        5: if actRCont_ListVariableStructure.Enabled   then actRCont_ListVariableStructureExecute(nil);
        6: if actRCont_EditVariable.Enabled            then actRCont_EditVariableExecute(nil);
        7: if actRCont_FixVariable.Enabled             then actRCont_FixVariableExecute(nil);
        8: if actRCont_ClearConsole.Enabled            then actRCont_ClearConsoleExecute(nil);
        9: if actRCont_CloseAllGraphics.Enabled        then actRCont_CloseAllGraphicsExecute(nil);
       10: if actRCont_HelpSelectedWord.Enabled        then actRCont_HelpSelectedWordExecute(nil);
       11: if actRCont_ExampleSelectedWord.Enabled     then actRCont_ExampleSelectedWordExecute(nil);
       12: if actRCont_OpenExampleSelectedWord.Enabled then actRCont_OpenExampleSelectedWordExecute(nil);
       13: if actRCont_Help.Enabled                    then actRCont_HelpExecute(nil);
       14: if actRCont_GuiPuTTYStartClose.Enabled      then actRCont_GuiPuTTYStartCloseExecute(nil);
       15: if actRCont_TermStartClose.Enabled          then actRCont_TermStartCloseExecute(nil);
    end;
end;

procedure TfrmSKH_Map_Dlg.pgRHChange(Sender: TObject);
var
  bVisible: boolean;

begin
  with frmMain.dlgSKH_Map do begin
    bVisible:= (pgSKH.ActivePageIndex = 2) and
               (pgRH.ActivePageIndex = 2);

    lblCustom.Visible:= bVisible;
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

procedure TfrmSKH_Map_Dlg.pCreate_Hotkey_Send(i: integer;
                                              sTmp: string);
begin
  with frmMain do begin
    if not Assigned(ajavHK_Send[i]) then
      ajavHK_Send[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Send[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDo_HotKey_Send;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.pCreate_Hotkey_Control(i: integer;
                                                 sTmp: string);
begin
  with frmMain do begin
    if not Assigned(ajavHK_Control[i]) then
      ajavHK_Control[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Control[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDo_HotKey_Control;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.pCreate_Hotkey_Custom(i: integer;
                                                sTmp: string);
begin
  with frmMain do begin
    if not Assigned(ajavHK_Custom[i]) then
      ajavHK_Custom[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Custom[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDo_HotKey_Custom;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.pClear_Warnings;
begin
  with stbShortcuts do begin
    Panels[3].Text:= '';
    Panels[4].Text:= '';
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtHotkeys_RestoreDefaultClick(Sender: TObject);

  procedure pRestore_Hotkey(var cdRH: TClientDataSet;
                            sXML: string;
                            var iHotkeys_SavePoint: integer);
  begin
    pClear_Warnings;
    if not FileExists(frmMain.sFileDataOrigin) then Exit;

    try
      with cdRH do
        Active:= False;

      with frmMain.zipKit do begin
        FileName     := frmMain.sFileDataOrigin;
        BaseDirectory:= frmMain.sPath_Data;
        ExtractFiles(sXML);
        CloseArchive;
      end;

      with cdRH do begin
        FileName:= frmMain.sPath_Data +
                   '\' +
                   sXML;
        Active:= True;
      end;

      with frmMain do
        iHotkeys_SavePoint:= cdRH.SavePoint;

      MessageDlg('The original '+
                 sXML +
                 ' was successfully restored!',
                 mtInformation,
                 [MBOK],
                 0);
    except
      // TODO!
    end;
  end;

begin
  case pgRH.TabIndex of
    // RH_Send
    0: pRestore_Hotkey(modDados.cdRH_Send,
                       'RH_Send.xml',
                       frmMain.iRH_Send_SavePoint);

    // RH_Control
    1: pRestore_Hotkey(modDados.cdRH_Control,
                       'RH_Control.xml',
                       frmMain.iRH_Control_SavePoint);

    // RH_Custom
    2: pRestore_Hotkey(modDados.cdRH_Custom,
                       'RH_Custom.xml',
                       frmMain.iRH_Custom_SavePoint);
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtEditor_Keystrokes_RestoreDefaultClick(Sender: TObject);
begin
  pClear_Warnings;
  if not FileExists(frmMain.sFileDataOrigin) then Exit;

  try
    with modDados.cdEditor_Keystrokes do
      Active:= False;

    with frmMain.zipKit do begin
      FileName     := frmMain.sFileDataOrigin;
      BaseDirectory:= frmMain.sPath_Data;
      ExtractFiles('Editor_Keystrokes.xml');
      CloseArchive;
    end;

    with modDados.cdEditor_Keystrokes do begin
      FileName:= frmMain.sPath_Data + '\Editor_Keystrokes.xml';
      Active  := True;
    end;

    with frmMain do
      iEditor_Keystrokes_SavePoint:= modDados.cdEditor_Keystrokes.SavePoint;

    MessageDlg('The original ''Editor_Keystrokes.xml'' was successfully restored!',
               mtInformation,
               [MBOK],
               0);
  except
    // TODO!
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_CancelAllClick(Sender: TObject);
begin
  pClear_Warnings;

  with modDados do begin
    cdApp_Shortcuts.SavePoint:= frmMain.iApp_Shortcuts_SavePoint;
    cdApp_ShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmSKH_Map_Dlg.bbtShortcuts_CancelClick(Sender: TObject);
begin
  pClear_Warnings;

  with modDados do begin
    cdApp_Shortcuts.Cancel;
    cdApp_ShortcutsAfterScroll(nil);
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
         with cdApp_Shortcuts do begin
           Edit;
           FieldByName('Shortcut').Value:= sSHK;
           Post;
         end;

    // Editor_Keystrokes
    2: with modDados do
         with cdEditor_Keystrokes do begin
           Edit;
           FieldByName('Keystroke').Value:= sSHK;
           Post;
         end;

    // RH_Send
    3: with modDados do
         with cdRH_Send do begin
           Edit;
           FieldByName('HotKey').Value:= sSHK;
           Post;
         end;

    // RH_Control
    4: with modDados do
         with cdRH_Control do begin
           Edit;
           FieldByName('HotKey').Value:= sSHK;
           Post;
         end;

    // RH_Custom
    5: with modDados do
         with cdRH_Custom do begin
           Edit;
           FieldByName('HotKey').Value:= sSHK;
           Post;
         end;
  end;
end;

procedure TfrmSKH_Map_Dlg.pSKR_Clear_From(iSKH_Used_By: integer;
                                          sSHK: string);
var
  sBy: string;

begin
  case iSKH_Used_By of
    // Application
    1: begin
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
         with modDados do begin
           fCheck_keystroke_Editor(sSHK,
                                   sBy,
                                   True);
         end;  // with modDados

         ShowMessage('The S/K/H associated to [' +
                     sBy +
                     '] was emptied!');
    end;

    // RHK Send
    3: begin
         with modDados do begin
           fCheck_Hotkey_RH_Send(sSHK,
                                 sBy,
                                 True);
         end;  // with modDados

         ShowMessage('The S/K/H associated to [' +
                     sBy +
                     '] was emptied!');
    end;

    // RHK Control
    4: begin
         with modDados do begin
           fCheck_Hotkey_RH_Control(sSHK,
                                    sBy,
                                    True);
         end;  // with modDados

         ShowMessage('The S/K/H associated to [' +
                     sBy +
                     '] was emptied!');
    end;

    // RHK Custom
    5: begin
         with modDados do begin
           fCheck_Hotkey_RH_Custom(sSHK,
                                   sBy,
                                   True);
         end;  // with modDados

         ShowMessage('The S/K/H associated to [' +
                     sBy +
                     '] was emptied!');
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
  with modDados.cdApp_Shortcuts do
    Edit;
  dbeApp_Group.SetFocus;
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
          with modDados.cdApp_Shortcuts do begin
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
            with modDados.cdApp_Shortcuts do begin
              Active  := False;
              FileName:= sOldFile;
              Active  := True;
            end;
            Exit;
          end;
        end; 

        with frmMain do begin
          iApp_Shortcuts_SavePoint:= modDados.cdApp_Shortcuts.SavePoint;
          sShortcutsInUse         := sFile;
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
    with modDados.cdApp_Shortcuts do
      Active:= False;

    with frmMain.zipKit do begin
      FileName     := frmMain.sFileDataOrigin;
      BaseDirectory:= frmMain.sPath_Data;
      ExtractFiles('Shortcuts.xml');
      CloseArchive;
    end;

    with modDados.cdApp_Shortcuts do begin
      FileName:= frmMain.sPath_Data + '\Shortcuts.xml';
      Active  := True;
    end;

    with frmMain do begin
      iApp_Shortcuts_SavePoint:= modDados.cdApp_Shortcuts.SavePoint;
      sShortcutsInUse         := frmMain.sPath_Data + '\Shortcuts.xml';
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

  with modDados.cdApp_Shortcuts do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      with frmMain do
        iApp_Shortcuts_SavePoint:= SavePoint;
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

        with modDados.cdApp_Shortcuts do begin
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
  frmMain.pOpen_UserGuidePDF('"Shortcuts"');
end;

procedure TfrmSKH_Map_Dlg.BitBtn1Click(Sender: TObject);
begin
  frmMain.pOpen_UserGuidePDF('"3.5 Hotkeys (operational system)"');
end;

procedure TfrmSKH_Map_Dlg.btnEditor_Keystrokes_ClearClick(Sender: TObject);
begin
  pClear_Warnings;

  // Editor_Keystrokes
  with modDados.cdEditor_Keystrokes do begin
    Edit;
    FieldByName('Keystroke').Value:= '';
    Post;
  end;
end;

procedure TfrmSKH_Map_Dlg.btnNew_RH_CustomClick(Sender: TObject);
begin
  with modDados.cdRH_Custom do
    Insert;
end;

procedure TfrmSKH_Map_Dlg.btnRH_ClearClick(Sender: TObject);
begin
  pClear_Warnings;

  case pgRH.TabIndex of
    // RH_Send
    0: begin
         with modDados.cdRH_Send do begin
           Edit;
           FieldByName('HotKey').Value:= '';
           Post;
         end;
    end;

    // RH_Control
    1: begin
         with modDados.cdRH_Control do begin
           Edit;
           FieldByName('HotKey').Value:= '';
           Post;
         end;
    end;

    // RH_Custom
    2: begin
         with modDados.cdRH_Custom do begin
           Edit;
           FieldByName('HotKey').Value:= '';
           Post;
         end;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_ControlDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.dbgRH_ControlTitleClick(Column: TColumn);
begin
  pClear_Warnings;

  with modDados do begin
    cdRH_Control.IndexFieldNames:= Column.FieldName;
  end;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_CustomDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.dbgRH_CustomEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_CustomKeyPress(Sender: TObject; var Key: Char);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_CustomTitleClick(Column: TColumn);
begin
  pClear_Warnings;

  with modDados do begin
    cdRH_Custom.IndexFieldNames:= Column.FieldName;
  end;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_SendDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.dbgRH_SendTitleClick(Column: TColumn);
begin
  pClear_Warnings;

  with modDados do begin
    cdRH_Send.IndexFieldNames:= Column.FieldName;
  end;
end;

procedure TfrmSKH_Map_Dlg.dbgEditor_KeystrokesDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
end;

procedure TfrmSKH_Map_Dlg.dbgEditor_KeystrokesEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.dbgEditor_KeystrokesTitleClick(Column: TColumn);
begin
  pClear_Warnings;

  with modDados do begin
    cdEditor_Keystrokes.IndexFieldNames:= Column.FieldName;
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
    cdApp_Shortcuts.IndexFieldNames:= Column.FieldName;
    cdApp_ShortcutsAfterScroll(nil);
  end;
end;

procedure TfrmSKH_Map_Dlg.edApp_Filter_CaptionChange(Sender: TObject);
begin
  try
    with modDados.cdApp_Shortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + edApp_Filter_Group.Text + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edApp_Filter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edApp_Filter_GroupChange(Sender: TObject);
begin
  try
    with modDados.cdApp_Shortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + edApp_Filter_Group.Text + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edApp_Filter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edRH_Send_Search_CaptionChange(Sender: TObject);
begin
  pClear_Warnings;

  with edRH_Send_Search_Caption do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRH_Send.Locate('Caption',
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

procedure TfrmSKH_Map_Dlg.edRH_Send_Filter_CaptionChange(Sender: TObject);
begin
  try
    with modDados.cdRH_Send do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + 'Send' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edRH_Send_Filter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edRH_Control_Filter_CaptionChange(Sender: TObject);
begin
  try
    with modDados.cdRH_Control do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + 'Control' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edRH_Control_Filter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edRH_Control_Search_CaptionChange(Sender: TObject);
begin
  pClear_Warnings;

  with edRH_Control_Search_Caption do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRH_Control.Locate('Caption',
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

procedure TfrmSKH_Map_Dlg.edRH_Custom_Filter_CaptionChange(Sender: TObject);
begin
  try
    with modDados.cdRH_Custom do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + 'Custom' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edRH_Custom_Filter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edRH_Custom_Search_CaptionChange(Sender: TObject);
begin
  pClear_Warnings;

  with edRH_Custom_Search_Caption do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRH_Custom.Locate('Caption',
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

procedure TfrmSKH_Map_Dlg.edApp_Search_CaptionChange(Sender: TObject);
begin
  pClear_Warnings;

  with edApp_Search_Caption do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdApp_Shortcuts.Locate('Caption',
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

procedure TfrmSKH_Map_Dlg.edApp_Search_CaptionEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.edApp_Search_GroupChange(Sender: TObject);
begin
  pClear_Warnings;

  with edApp_Search_Group do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdApp_Shortcuts.Locate('Group',
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

procedure TfrmSKH_Map_Dlg.edApp_Search_GroupEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.edEditor_Keystrokes_FilterChange(Sender: TObject);
begin
  try
    with modDados.cdEditor_Keystrokes do begin
      Filtered:= False;
      Filter:= 'UPPER(Command) Like ' +
               UpperCase(QuotedStr('%' + edEditor_Keystrokes_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edEditor_Keystrokes_SearchChange(Sender: TObject);
begin
  pClear_Warnings;

  with edEditor_Keystrokes_Search do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdEditor_Keystrokes.Locate('Command',
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

procedure TfrmSKH_Map_Dlg.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    pgSKH.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
    pgRH.TabSelectedStyle.BackgrColor := clBGTabSelectedNew;
  end;

  pClear_Warnings;
  with frmMain do begin
    with dbeApp_Group do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeApp_Caption do begin
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

  // SKH_Map_Dlg called from main menu (menOption_SKH)
  if not frmTools.Visible then
    with frmMain.dlgSKH_Map do begin
      pgSKH.ActivePage:= tbsAppShortcuts;
      pgRH.ActivePage := tbsRH_Send;
    end
  else
    // SKH_Map_Dlg called from Tools interface
    with frmMain.dlgSKH_Map do begin
      case frmTools.pgDatabase.TabIndex of
        0: pgSKH.ActivePage:= tbsAppShortcuts;
        1: pgSKH.ActivePage:= tbsEditorKeystrokes;
        2: begin
             pgSKH.ActivePage    := tbsRHotkeys;
             pgRH.ActivePageIndex:= frmTools.pgRH.TabIndex;
        end;
      end;
    end;

  with stbShortcuts do begin
    Panels[0].Text:= 'Browse mode';
    Panels[2].Text:= ExtractFileName(frmMain.sShortcutsInUse);
  end;

  // The below set the active records to bookmarks
  with modDados do begin
    // App_Shortcuts
    with frmMain do
      cdApp_Shortcuts.Bookmark:= sApp_Shortcuts_BookMark;

    // Editor_Keystrokes
    with frmMain do
      cdEditor_Keystrokes.Bookmark:= sEditor_Keystrokes_BookMark;

    // RH_Send
    with frmMain do
      cdRH_Send.Bookmark:= sRH_Send_BookMark;

    // RH_Control
    with frmMain do
      cdRH_Control.Bookmark:= sRH_Control_BookMark;

    // RH_Custom
    with frmMain do
      cdRH_Custom.Bookmark:= sRH_Custom_BookMark;
  end;
end;

procedure TfrmSKH_Map_Dlg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with frmMain do begin
    frmTools.lbApp_Shortcuts.ItemIndex:= iApp_ShortcutsFilter;
    frmTools.lbApp_ShortcutsClick(Self);
  end;
end;

procedure TfrmSKH_Map_Dlg.FormCreate(Sender: TObject);
var
  i: integer;

begin
  Application.OnMessage:= pAppMessage;

  with modDados.cdRH_Send do begin
    SetLength(frmMain.ajavHK_Send,
              RecordCount);
    DisableControls;
    First;
    for i:= 0 to (RecordCount - 1) do begin
      pCreate_Hotkey_Send(i,
                          Fields[3].AsString);
      Next;
    end;
    First;
    EnableControls;
  end;

  // RH_Control
  with modDados.cdRH_Control do begin
    SetLength(frmMain.ajavHK_Control,
              RecordCount);
    DisableControls;
    First;
    for i:= 0 to (RecordCount - 1) do begin
      pCreate_Hotkey_Control(i,
                             Fields[3].AsString);
      Next;
    end;
    First;
    EnableControls;
  end;

  // RH_Custom
  with modDados.cdRH_Custom do begin
    SetLength(frmMain.ajavHK_Custom,
              RecordCount);
    DisableControls;
    First;
    for i:= 0 to (RecordCount - 1) do begin
      pCreate_Hotkey_Custom(i,
                            Fields[3].AsString);
      Next;
    end;
    First;
    EnableControls;
  end;
end;

procedure TfrmSKH_Map_Dlg.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
  rdgTinnRHotKeys.ItemIndex:= Integer(frmMain.bHotKeys_On);
  pClear_Edits(frmMain.dlgSKH_Map);
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

procedure TfrmSKH_Map_Dlg.strgHK_CustomDblClick(Sender: TObject);
begin
  bbtShortcuts_ManagerClick(nil);
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

{
procedure TfrmSKH_Map_Dlg.btnRH_ClearAllClick(Sender: TObject);
var
  i: Integer;

begin
  pClear_Warnings;

  case pgRH.TabIndex of
    // RH_Send
    0: begin
         with modDados.cdRH_Send do begin
           DisableControls;
           First;

           for i:=1 to RecordCount do begin
             Edit;
             FieldByName('HotKey').Value:= '';
             Post;
             Next;
           end;

           EnableControls;
         end;
    end;

    // RH_Control
    1: begin
         with modDados.cdRH_Control do begin
           DisableControls;
           First;

           for i:=1 to RecordCount do begin
             Edit;
             FieldByName('HotKey').Value:= '';
             Post;
             Next;
           end;

           EnableControls;
         end;
    end;

    // RH_Custom
    2: begin
         with modDados.cdRH_Custom do begin
           DisableControls;
           First;

           for i:=1 to RecordCount do begin
             Edit;
             FieldByName('HotKey').Value:= '';
             Post;
             Next;
           end;

           EnableControls;
         end;
    end;
  end;
end;
}
end.
