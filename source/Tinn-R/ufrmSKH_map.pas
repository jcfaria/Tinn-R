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
    btnClear: TButton;
    btnClearAllHotKeys: TButton;
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
    btnUpdateKey: TButton;
    Label20: TLabel;
    Label24: TLabel;
    pnlCommands: TPanel;
    lvKeystrokes: TListView;
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
    procedure edApp_Search_CaptionChange(Sender: TObject);
    procedure edApp_Search_CaptionEnter(Sender: TObject);
    procedure edApp_Search_GroupChange(Sender: TObject);
    procedure edApp_Search_GroupEnter(Sender: TObject);
    procedure edApp_Filter_CaptionChange(Sender: TObject);
    procedure edApp_Filter_GroupChange(Sender: TObject);
    procedure bbtShortcuts_ManagerClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rdgTinnRHotKeysClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnClearAllHotKeysClick(Sender: TObject);
    procedure strgHK_CustomSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure pgRHChange(Sender: TObject);
    procedure pgSKHChange(Sender: TObject);
    procedure edRH_Send_Filter_CaptionChange(Sender: TObject);
    procedure edRH_Control_Filter_CaptionChange(Sender: TObject);
    procedure edRH_Custom_Filter_CaptionChange(Sender: TObject);
    procedure edRH_Send_Search_CaptionChange(Sender: TObject);
    procedure edRH_Control_Search_CaptionChange(Sender: TObject);
    procedure edRH_Custom_Search_CaptionChange(Sender: TObject);
    procedure btnNew_RH_CustomClick(Sender: TObject);
    procedure dbgRH_CustomEnter(Sender: TObject);
    procedure dbgRH_CustomKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }

    procedure pAppMessage(var Msg: TMSG; var bHandled: Boolean);
    procedure pClear_Warnings;
    procedure pCreateHotkey_Send(i: integer; sTmp: string);
    procedure pCreateHotkey_Control(i: integer; sTmp: string);
    procedure pDoHotKey_Custom(Sender: TObject);
    procedure pDoHotKey_Send(Sender: TObject);
    procedure pDoHotKey_Control(Sender: TObject);
    procedure pSKR_Clear_From(iSKH_Used_By: integer; sSHK: string);
    procedure pSKR_Assign_To(iSKH_Assign_To, iDx: integer; sSHK: string);

  public
    { Public declarations }
    dlgSKH_Manager   : TfrmSKH_Manager_Dlg;
    eKeyShort        : TSynHotKey;
    iSKH_Used_By     : integer;
    iSKH_Assign_To   : integer;
    iDx              : integer;  // índice of the editor keystrokes/R hotkey in their respective stringGrid

    procedure pCreateHotkey_Custom(i: integer; sTmp: string);
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
  sRH_Custom: string;

begin
  sRH_Custom:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // RH Custom
  with modDados.cdRH_Custom do begin
    DisableControls;

    Locate('Shortcut',
           sRH_Custom,
           []);

    frmMain.pSendRCustom(Fields[2].AsString);

    EnableControls;
  end;
end;

procedure TfrmSKH_Map_Dlg.pDoHotKey_Send(Sender: TObject);
var
  sRH_Send: string;

  i: integer;

begin
  //SetForegroundWindow(Application.Handle);
  sRH_Send:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // RH Send
  with modDados.cdRH_Send do begin
    DisableControls;

    Locate('Shortcut',
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
      <ROW Index="2" Group="Send" Caption="Clipboard" Shortcut="Ctrl+;"/>
      <ROW Index="3" Group="Send" Caption="Marked block" Shortcut="Ctrl+["/>
      <ROW Index="4" Group="Send" Caption="Contiguous" Shortcut="Ctrl+]"/>
      <ROW Index="5" Group="Send" Caption="Smart" Shortcut="Shift+Ctrl+\"/>
      <ROW Index="6" Group="Send" Caption="Line" Shortcut="Ctrl+\"/>
      <ROW Index="7" Group="Send" Caption="Current line to top" Shortcut="Ctrl+D"/>
      <ROW Index="8" Group="Send" Caption="Lines to end page" Shortcut="Ctrl+D"/>
      <ROW Index="9" Group="Send" Caption="Cursor to beggining line" Shortcut="Ctrl+D"/>
      <ROW Index="10" Group="Send" Caption="Cursor to end line" Shortcut="Ctrl+D"/>
      <ROW Index="11" Group="Send" Caption="Sweave (.Rnw)" Shortcut="Ctrl+D"/>
      <ROW Index="12" Group="Send" Caption="Knit to LaTeX (.Rnw)" Shortcut="Ctrl+D"/>
      <ROW Index="13" Group="Send" Caption="Knit to HTML (.Rmd, Rhtml)" Shortcut="Ctrl+D"/>
    </ROWDATA>
    *)

    case i of
        0: if actRSendFile.Enabled                   then actRSendFileExecute(nil);
        1: if actRSendSelection.Enabled              then actRSendSelectionExecute(nil);
        2: if actRSendClipboard.Enabled              then actRSendClipboardExecute(nil);
        3: if actRSendBlockMarked.Enabled            then actRSendBlockMarkedExecute(nil);
        4: if actRSendContiguous.Enabled             then actRSendContiguousExecute(nil);
        5: if actRSendSmart.Enabled                  then actRSendSmartExecute(nil);
        6: if actRSendLine.Enabled                   then actRSendLineExecute(nil);
        7: if actRCurrentLineToTop.Enabled           then actRCurrentLineToTopExecute(nil);
        8: if actRSendLinesToEndPage.Enabled         then actRSendLinesToEndPageExecute(nil);
        9: if actRSendCursorToBeginningLine.Enabled  then actRSendCursorToBeginningLineExecute(nil);
       10: if actRSendCursorToEndLine.Enabled        then actRSendCursorToEndLineExecute(nil);
       11: if actRSendSweave.Enabled                 then actRSendSweaveExecute(nil);
       12: if actRSendKnitPdf.Enabled                then actRSendKnitPdfExecute(nil);
       13: if actRSendKnitHtml.Enabled               then actRSendKnitHtmlExecute(nil);
    end;
end;

procedure TfrmSKH_Map_Dlg.pDoHotKey_Control(Sender: TObject);
var
  sRH_Control: string;

  i: integer;

begin
  //SetForegroundWindow(Application.Handle);
  sRH_Control:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // RH Control
  with modDados.cdRH_Control do begin
    DisableControls;

    Locate('Shortcut',
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
        0: if actRContSetWorkDirectory.Enabled        then actRContSetWorkDirectoryExecute(nil);
        1: if actRContListAllObjects.Enabled          then actRContListAllObjectsExecute(nil);
        2: if actRContPrintVariableContent.Enabled    then actRContPrintVariableContentExecute(nil);
        3: if actRContPlotVariable.Enabled            then actRContPlotVariableExecute(nil);
        4: if actRContListVariableNames.Enabled       then actRContListVariableNamesExecute(nil);
        5: if actRContListVariableStructure.Enabled   then actRContListVariableStructureExecute(nil);
        6: if actRContEditVariable.Enabled            then actRContEditVariableExecute(nil);
        7: if actRContFixVariable.Enabled             then actRContFixVariableExecute(nil);
        8: if actRContClearConsole.Enabled            then actRContClearConsoleExecute(nil);
        9: if actRContCloseAllGraphics.Enabled        then actRContCloseAllGraphicsExecute(nil);
       10: if actRContHelpSelectedWord.Enabled        then actRContHelpSelectedWordExecute(nil);
       11: if actRContExampleSelectedWord.Enabled     then actRContExampleSelectedWordExecute(nil);
       12: if actRContOpenExampleSelectedWord.Enabled then actRContOpenExampleSelectedWordExecute(nil);
       13: if actRContHelp.Enabled                    then actRContHelpExecute(nil);
       14: if actRContGuiPuTTYStartClose.Enabled      then actRContGuiPuTTYStartCloseExecute(nil);
       15: if actRContTermStartClose.Enabled          then actRContTermStartCloseExecute(nil);
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

procedure TfrmSKH_Map_Dlg.pCreateHotkey_Send(i: integer;
                                             sTmp: string);
begin
  with frmMain do begin
    ajavHK_Send[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Send[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKey_Send;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.pCreateHotkey_Control(i: integer;
                                                sTmp: string);
begin
  with frmMain do begin
    ajavHK_Control[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_Control[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKey_Control;
    end;
  end;
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
    cdShortcuts.SavePoint:= frmMain.iShortcuts_SavePoint;
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

    // RH Send
    3: with modDados do
         with cdRH_Send do begin
           Edit;
           FieldByName('Shortcut').Value:= sSHK;
           Post;
         end;

    // RH Control
    4: with modDados do
         with cdRH_Control do begin
           Edit;
           FieldByName('Shortcut').Value:= sSHK;
           Post;
         end;

    // RH Custom
    5: with modDados do
         with cdRH_Custom do begin
           Edit;
           FieldByName('Shortcut').Value:= sSHK;
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
       // TODO
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
  with modDados.cdShortcuts do
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
          iShortcuts_SavePoint:= modDados.cdShortcuts.SavePoint;
          sShortcutsInUse     := sFile;
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
      iShortcuts_SavePoint:= modDados.cdShortcuts.SavePoint;
      sShortcutsInUse     := frmMain.sPath_Data + '\Shortcuts.xml';
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
        iShortcuts_SavePoint:= SavePoint;
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

procedure TfrmSKH_Map_Dlg.btnNew_RH_CustomClick(Sender: TObject);
begin
  with modDados.cdRH_Custom do
    Insert;
end;

procedure TfrmSKH_Map_Dlg.btnClearAllHotKeysClick(Sender: TObject);
var
  i: Integer;

begin
  pClear_Warnings;

  case pgRH.TabIndex of
    // RH Send
    0: begin
         with modDados.cdRH_Send do begin
           DisableControls;
           First;

           for i:=1 to RecordCount do begin
             Edit;
             FieldByName('Shortcut').Value:= '';
             Post;
             Next;
           end;

           EnableControls;
         end;
    end;

    // RH Control
    1: begin
         with modDados.cdRH_Control do begin
           DisableControls;
           First;

           for i:=1 to RecordCount do begin
             Edit;
             FieldByName('Shortcut').Value:= '';
             Post;
             Next;
           end;

           EnableControls;
         end;
    end;

    // RH Custom
    2: begin
         with modDados.cdRH_Custom do begin
           DisableControls;
           First;

           for i:=1 to RecordCount do begin
             Edit;
             FieldByName('Shortcut').Value:= '';
             Post;
             Next;
           end;

           EnableControls;
         end;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.btnClearClick(Sender: TObject);
begin
  pClear_Warnings;

  case pgRH.TabIndex of
    // RH Send
    0: begin
         with modDados.cdRH_Send do begin
           Edit;
           FieldByName('Shortcut').Value:= '';
           Post;
         end;
    end;

    // RH Control
    1: begin
         with modDados.cdRH_Control do begin
           Edit;
           FieldByName('Shortcut').Value:= '';
           Post;
         end;
    end;

    // RH Custom
    2: begin
         with modDados.cdRH_Custom do begin
           Edit;
           FieldByName('Shortcut').Value:= '';
           Post;
         end;
    end;
  end;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_CustomEnter(Sender: TObject);
begin
  pClear_Warnings;
end;

procedure TfrmSKH_Map_Dlg.dbgRH_CustomKeyPress(Sender: TObject; var Key: Char);
begin
  pClear_Warnings;
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

procedure TfrmSKH_Map_Dlg.edApp_Filter_CaptionChange(Sender: TObject);
begin
  try
    with modDados.cdShortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + edApp_Filter_Group.Text + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edApp_Filter_Caption.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmSKH_Map_Dlg.edApp_Filter_GroupChange(Sender: TObject);
begin
  try
    with modDados.cdShortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + edApp_Filter_Group.Text + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edApp_Filter_Caption.Text + '%'));
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
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + 'Send' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edRH_Send_Filter_Caption.Text + '%'));
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
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + 'Control' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edRH_Control_Filter_Caption.Text + '%'));
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
      Filter:= 'UPPER(Group) Like ' + UpperCase(QuotedStr('%' + 'Custom' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' + UpperCase(QuotedStr('%' + edRH_Custom_Filter_Caption.Text + '%'));
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

procedure TfrmSKH_Map_Dlg.edApp_Search_GroupEnter(Sender: TObject);
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
  i: integer;

begin
  pgRH.TabIndex:= 0;
  Application.OnMessage:= pAppMessage;

  // RH Send
  with modDados.cdRH_Send do begin
    SetLength(frmMain.ajavHK_Send,
              RecordCount);
    DisableControls;
    First;
    for i:= 0 to (RecordCount - 1) do begin
      pCreateHotkey_Send(i,
                         Fields[3].AsString);
      Next;
    end;
    First;
    EnableControls;
  end;

  // RH Control
  with modDados.cdRH_Control do begin
    SetLength(frmMain.ajavHK_Control,
              RecordCount);
    DisableControls;
    First;
    for i:= 0 to (RecordCount - 1) do begin
      pCreateHotkey_Control(i,
                            Fields[3].AsString);
      Next;
    end;
    First;
    EnableControls;
  end;

  // RH Custom
  with modDados.cdRH_Custom do begin
    SetLength(frmMain.ajavHK_Custom,
              RecordCount);
    DisableControls;
    First;
    for i:= 0 to (RecordCount - 1) do begin
      pCreateHotkey_Custom(i,
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

end.
