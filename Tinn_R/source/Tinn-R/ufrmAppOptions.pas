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

unit ufrmAppOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, CommCtrl, StdCtrls, Buttons, Spin, ExtCtrls, ImgList,
  Menus, EditAlign, ScktComp, trShape, JvExControls,
  JvColorTrackbar, JvgPage, JvExComCtrls, JvComCtrls,
  SynEdit, SynEditMiscClasses, SynEditKeyCmds, SynEditKeyConst,
  SynEditOC;

type
  TColorPopup = (cpGutter,
                 cpRightEdge);

  TSynEditorOptionsAllUserCommands = procedure(ACommands: TStrings) of object;

  TfrmAppOptions = class(TForm)
    ActiveBorder1: TMenuItem;
    ActiveCaption1: TMenuItem;
    ApplicationWorkspace1: TMenuItem;
    Background1: TMenuItem;
    bbtCancel: TBitBtn;
    bbtConPathDeplate: TBitBtn;
    bbtConPathTxt2tags: TBitBtn;
    bbtDVIParametersBibtex: TButton;
    bbtDVIParametersSingle: TButton;
    bbtIntPathDeplate: TBitBtn;
    bbtIntPathTxt2tags: TBitBtn;
    bbtOK: TBitBtn;
    bbtParDeplate: TButton;
    bbtParTxt2tags: TButton;
    bbtPathPandoc: TBitBtn;
    bbtPDFParBibtex: TButton;
    bbtPDFParSingle: TButton;
    bbtRGuiDefault: TButton;
    bbtRGuiPath: TBitBtn;
    bbtRTermDefault: TButton;
    bbtRTermPath: TBitBtn;
    btnFont: TButton;
    btnGutterColor: TPanel;
    btnGutterFont: TButton;
    btnMRUClear: TButton;
    btnRightEdge: TPanel;
    btnUpdateKey: TButton;
    ButtonFace1: TMenuItem;
    ButtonShadow1: TMenuItem;
    ButtonText1: TMenuItem;
    CaptionText1: TMenuItem;
    cbAllNames: TCheckBox;
    cbbTriggerRDataCompletion: TComboBox;
    cbbTriggerRTip: TComboBox;
    cbCloseDVIViewer: TCheckBox;
    cbClosePDFViewer: TCheckBox;
    cbComAutoDetect_Language: TCheckBox;
    cbCommands: TComboBox;
    cbComPriority_Line: TCheckBox;
    cbDOSMinimizedAlways: TCheckBox;
    cbDVIOpenAlways: TCheckBox;
    cbGutterFont: TCheckBox;
    cbHTMLOpenAlways: TCheckBox;
    cbLatexVisible: TCheckBox;
    cbMinimizeTinn: TCheckBox;
    cbPDFOpenAlways: TCheckBox;
    cbRClearAll: TCheckBox;
    cbRClearConsole: TCheckBox;
    cbRCloseAllGraphics: TCheckBox;
    cbRCurrentLineToTop: TCheckBox;
    cbREditVariable: TCheckBox;
    cbRememberFileState: TCheckBox;
    cbRememberSearchList: TCheckBox;
    cbRemoveExtension: TCheckBox;
    cbREscape: TCheckBox;
    cbRestoreIniDock: TCheckBox;
    cbRExampleSelectedWord: TCheckBox;
    cbRFixVariable: TCheckBox;
    cbRguiOrganizeAutomatically: TCheckBox;
    cbRguiReturnFocus: TCheckBox;
    cbRGuiStartClose: TCheckBox;
    cbRHelp: TCheckBox;
    cbRHelpSelectedWord: TCheckBox;
    cbRListAllObjects: TCheckBox;
    cbRListVariableNames: TCheckBox;
    cbRListVariableStructure: TCheckBox;
    cbRPackages: TCheckBox;
    cbRPlotVariable: TCheckBox;
    cbRPrintVariableContent: TCheckBox;
    cbRRemoveAllObjects: TCheckBox;
    cbRSendBlockMarked: TCheckBox;
    cbRSendClipboard: TCheckBox;
    cbRSendContiguous: TCheckBox;
    cbRSendCursorToBeginningLine: TCheckBox;
    cbRSendCursorToEndLine: TCheckBox;
    cbRSendFile: TCheckBox;
    cbRSendKnitr: TCheckBox;
    cbRSendLine: TCheckBox;
    cbRSendLinesToEndPage: TCheckBox;
    cbRSendSelection: TCheckBox;
    cbRSendSourceBlockMarked: TCheckBox;
    cbRSendSourceClipboard: TCheckBox;
    cbRSendSourceContiguous: TCheckBox;
    cbRSendSourceFile: TCheckBox;
    cbRSendSourceSelection: TCheckBox;
    cbRSendSweave: TCheckBox;
    cbRSetWorkDirectory: TCheckBox;
    cbRTCPConnection: TCheckBox;
    cbRTCPIPConsoleEcho: TCheckBox;
    cbRTCPIPConsoleUse: TCheckBox;
    cbRTermStartClose: TCheckBox;
    cbUndoAfterSave: TCheckBox;
    cInsertCaret: TComboBox;
    ckAltSetsColumnMode: TCheckBox;
    ckAutoIndent: TCheckBox;
    ckAutoSizeMaxWidth: TCheckBox;
    ckDisableScrollArrows: TCheckBox;
    ckDragAndDropEditing: TCheckBox;
    ckEnhanceEndKey: TCheckBox;
    ckEnhanceHomeKey: TCheckBox;
    ckGroupUndo: TCheckBox;
    ckGutterAutosize: TCheckBox;
    ckGutterShowLeaderZeros: TCheckBox;
    ckGutterShowLineNumbers: TCheckBox;
    ckGutterStartAtZero: TCheckBox;
    ckGutterVisible: TCheckBox;
    ckHalfPageScroll: TCheckBox;
    ckHideShowScrollbars: TCheckBox;
    ckKeepCaretX: TCheckBox;
    ckRightMouseMoves: TCheckBox;
    ckScrollByOneLess: TCheckBox;
    ckScrollHintFollows: TCheckBox;
    ckScrollPastEOF: TCheckBox;
    ckScrollPastEOL: TCheckBox;
    ckShowScrollHint: TCheckBox;
    ckShowSpecialChars: TCheckBox;
    ckSmartTabDelete: TCheckBox;
    ckSmartTabs: TCheckBox;
    ckTabsToSpaces: TCheckBox;
    ckTrimTrailingSpaces: TCheckBox;
    ckWantTabs: TCheckBox;
    cOverwriteCaret: TComboBox;
    edMaxDeparseLength: TEdit;
    edParDeplate: TEditAlign;
    edParDVIBibtex: TEditAlign;
    edParDVISingle: TEditAlign;
    edParPDFBibtex: TEditAlign;
    edParPDFSingle: TEditAlign;
    edParRGui: TEditAlign;
    edParRTerm: TEditAlign;
    edParTxt2tags: TEditAlign;
    edPath_Pandoc: TEditAlign;
    edPathDeplate_Converter: TEditAlign;
    edPathDeplate_Interpreter: TEditAlign;
    edPathR_Connected: TEditAlign;
    edPathRGui: TEditAlign;
    edPathRTerm: TEditAlign;
    edPathTinnRcom_Installed: TEditAlign;
    edPathTxt2tags_Converter: TEditAlign;
    edPathTxt2tags_Interpreter: TEditAlign;
    edReformatR: TEditAlign;
    edReformatRd: TEditAlign;
    edtIPHostLocal: TEdit;
    edtIPHostRemote: TEdit;
    edtIPPortLocal: TEdit;
    edtIPPortRemote: TEdit;
    edVersion_TinnRcomInstalled: TEdit;
    eLineSpacing: TEdit;
    eRightEdge: TEdit;
    eTabWidth: TEdit;
    fdAppOptions: TFontDialog;
    gbCaret: TGroupBox;
    gbControlling: TGroupBox;
    gbGutter: TGroupBox;
    gbKeyStrokes: TGroupBox;
    gbOptions: TGroupBox;
    gbpLatexCloseViewer: TGroupBox;
    gbpRguiTinnRProportion: TGroupBox;
    gbpRtermDisposition: TGroupBox;
    gbRightEdge: TGroupBox;
    gbRtermSyntax: TGroupBox;
    gbSendR: TGroupBox;
    gpbConPathDeplate: TGroupBox;
    gpbConPathTxt2tags: TGroupBox;
    gpbConversionMore: TGroupBox;
    gpbDelay: TGroupBox;
    gpbDOSOption: TGroupBox;
    gpbDVIParameters: TGroupBox;
    gpbDVIParametersBibtex: TGroupBox;
    gpbDVIParametersSingle: TGroupBox;
    gpbIntPathDeplate: TGroupBox;
    gpbIntPathTxt2tags: TGroupBox;
    gpbLatexOptions: TGroupBox;
    gpbMaxDeparseLength: TGroupBox;
    gpbParDeplate: TGroupBox;
    gpbParTxt2tags: TGroupBox;
    gpbPathPandoc: TGroupBox;
    gpbPathRGui: TGroupBox;
    gpbPathRTerm: TGroupBox;
    gpbPDFAfter: TGroupBox;
    gpbPDFParameters: TGroupBox;
    gpbPDFParametersBibtex: TGroupBox;
    gpbPDFParametersSingle: TGroupBox;
    gpbRExplorer: TGroupBox;
    gpbRguiReturnFocus: TGroupBox;
    gpbRServerTCPIP: TGroupBox;
    gpbRTCPIPConsoleUse: TGroupBox;
    gpbRTCPIPParameter: TGroupBox;
    gpbRTriggers: TGroupBox;
    GrayText1: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    Highlight1: TMenuItem;
    Highlight2: TMenuItem;
    HighlightText1: TMenuItem;
    imGeneral: TImage;
    imGutter: TImage;
    imlAppOptions: TImageList;
    InactiveBorder1: TMenuItem;
    InactiveCaption1: TMenuItem;
    InactiveCaptionText1: TMenuItem;
    InfoTipBackground1: TMenuItem;
    InfoTipText1: TMenuItem;
    jtvAppOptions: TJvTreeView;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    labFont: TLabel;
    lbDelay: TLabel;
    lblGutterFont: TLabel;
    lblLastFile: TLabel;
    lblLastSearch: TLabel;
    lblTinnRExpansion: TLabel;
    lbTransparency: TLabel;
    lvKeystrokes: TListView;
    Memo1: TMemo;
    memReformat: TMemo;
    Menu1: TMenuItem;
    MEnu2: TMenuItem;
    mFiles: TMemo;
    mRLibPaths: TMemo;
    N3dDarkShadow1: TMenuItem;
    N3DLight1: TMenuItem;
    None1: TMenuItem;
    odAppOptions: TOpenDialog;
    panAppOptions: TPanel;
    panGutterFont: TPanel;
    panLabFont: TPanel;
    panR: TPanel;
    panScreen: TPanel;
    panTinnR: TPanel;
    pgApp: TJvgPageControl;
    pgIP: TJvgPageControl;
    pGutterBack: TPanel;
    pmAppOptions: TPopupMenu;
    pnlCommands: TPanel;
    pRightEdgeBack: TPanel;
    rdgConnectionBeepOnError: TRadioGroup;
    rdgDataCompletion_Pattern: TRadioGroup;
    rdgLineWraping: TRadioGroup;
    rdgRArchitecture: TRadioGroup;
    rdgRComments: TRadioGroup;
    rdgReformatRSplit: TRadioGroup;
    rdgRget_Info: TRadioGroup;
    rdgRguiRecognitionCaption: TRadioGroup;
    rdgRguiRecognitionType: TRadioGroup;
    rdgRmirros_Update: TRadioGroup;
    rdgRScrollSendingLines: TRadioGroup;
    rdgRSmartSend: TRadioGroup;
    rdgRsvSocketConnect: TRadioGroup;
    rdgRTCPIPType: TRadioGroup;
    rdgRtermBeepOnError: TRadioGroup;
    rdgRtermClose: TRadioGroup;
    rdgRtermDisposition: TRadioGroup;
    rdgRtermFindError: TRadioGroup;
    rdgRtermIOSyntax: TRadioGroup;
    rdgRtermLogSyntax: TRadioGroup;
    rdgRtermType: TRadioGroup;
    rdgRTinnRcomInstall: TRadioGroup;
    rdgRTinnRcomLoad: TRadioGroup;
    rdgRUseLatest: TRadioGroup;
    rgRguiTinnRDisposition: TRadioGroup;
    Scrollbar1: TMenuItem;
    sGutterColor: TShape;
    shBGApplication: TtrShape;
    shBGTabSelected: TtrShape;
    shFGApplication: TtrShape;
    shSampleApplication: TtrShape;
    sRightEdgeColor: TShape;
    tbDelay: TJvColorTrackBar;
    tbLastFile: TTrackBar;
    tbLastSearch: TTrackBar;
    tbRguiTinnRProportion: TTrackBar;
    tbsAppBasicR: TTabSheet;
    tbsAppDeplate: TTabSheet;
    tbsAppDock: TTabSheet;
    tbsAppDviLatex: TTabSheet;
    tbsAppearance: TTabSheet;
    tbsAppErrorRterm: TTabSheet;
    tbsAppFilesExtensions: TTabSheet;
    tbsAppGeneral: TTabSheet;
    tbsAppMoreConversion: TTabSheet;
    tbsAppMoreLatex: TTabSheet;
    tbsAppOptionsRgui: TTabSheet;
    tbsAppOptionsRterm: TTabSheet;
    tbsAppPandoc: TTabSheet;
    tbsAppPathR: TTabSheet;
    tbsAppPdfLatex: TTabSheet;
    tbsAppRecognitionRgui: TTabSheet;
    tbsAppReformatR: TTabSheet;
    tbsAppReformatRd: TTabSheet;
    tbsAppResourcesR: TTabSheet;
    tbsAppRTinnRcom: TTabSheet;
    tbsAppServerR: TTabSheet;
    tbsAppTxt2tags: TTabSheet;
    tbsEditorAdvanced: TTabSheet;
    tbsEditorDisplay: TTabSheet;
    tbsEditorKeystrokes: TTabSheet;
    tbsIPLocal: TTabSheet;
    tbsIPRemote: TTabSheet;
    tbTransparency: TJvColorTrackBar;
    Window1: TMenuItem;
    WindowFrame1: TMenuItem;
    WindowText1: TMenuItem;
    Label25: TLabel;

    procedure bbtConPathDeplateClick(Sender: TObject);
    procedure bbtConPathTxt2tagsClick(Sender: TObject);
    procedure bbtDVIParametersBibtexClick(Sender: TObject);
    procedure bbtDVIParametersSingleClick(Sender: TObject);
    procedure bbtIntPathDeplateClick(Sender: TObject);
    procedure bbtIntPathTxt2tagsClick(Sender: TObject);
    procedure bbtParDeplateClick(Sender: TObject);
    procedure bbtParTxt2tagsClick(Sender: TObject);
    procedure bbtPathPandocClick(Sender: TObject);
    procedure bbtPDFParBibtexClick(Sender: TObject);
    procedure bbtPDFParSingleClick(Sender: TObject);
    procedure bbtRGuiDefaultClick(Sender: TObject);
    procedure bbtRGuiPathClick(Sender: TObject);
    procedure bbtRTermDefaultClick(Sender: TObject);
    procedure bbtRTermPathClick(Sender: TObject);
    procedure btnFontClick(Sender: TObject);
    procedure btnGutterFontClick(Sender: TObject);
    procedure btnMRUClearClick(Sender: TObject);
    procedure btnUpdateKeyClick(Sender: TObject);
    procedure cbCommandsExit(Sender: TObject);
    procedure cbCommandsKeyPress(Sender: TObject; var Key: Char);
    procedure cbCommandsKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbRResourcesVisibleClick(Sender: TObject);
    procedure edLineWidthKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edMaxDeparseLengthKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imGeneralMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure imGutterMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure jtvAppOptionsChange(Sender: TObject; Node: TTreeNode);
    procedure lvKeystrokesChanging(Sender: TObject; Item: TListItem; Change: TItemChange; var AllowChange: Boolean);
    procedure lvKeystrokesSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure pmColorClick(Sender: TObject);
    procedure rdgRArchitectureClick(Sender: TObject);
    procedure rdgRTCPIPTypeClick(Sender: TObject);
    procedure rdgRtermTypeClick(Sender: TObject);
    procedure rdgRUseLatestClick(Sender: TObject);
    procedure rgRguiTinnRDispositionClick(Sender: TObject);
    procedure sGutterColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGApplicationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGTabSelectedMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shFGApplicationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sRightEdgeColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbDelayPosChange(Sender: TObject);
    procedure tbLastFileChange(Sender: TObject);
    procedure tbLastSearchChange(Sender: TObject);
    procedure tbRguiTinnRProportionChange(Sender: TObject);
    procedure tbTransparencyPosChange(Sender: TObject);

  private
    { Private declarations }
    bRArchitecture64: boolean;  // It is necessary here due to automatic changes in path according with user option.
                                // The same variable name exists also as private in frmTinnMain.

    bFormVisible      : boolean;
    bExtended         : boolean;
    cpFrom            : TColorPopup;
    eKeyShort         : TSynHotKey;
    liOldSelected     : TListItem;
    seoAllUserCommands: TSynEditorOptionsAllUserCommands;
    seoUserCommand    : TSynEditorOptionsUserCommand;

    {$IFNDEF SYN_COMPILER_4_UP}
    //FOldWndProc: TWndMethod;
    //procedure OverridingWndProc(var Message: TMessage);
    {$ENDIF}

    function GetColor(Item: TMenuItem): TColor;
    function GetEmpty: boolean;
    procedure EditStrCallback(const S: string);
    procedure FillInKeystrokeInfo(seKeystroke: TSynEditKeystroke; liTmp: TListItem);
    procedure RemoveEmpty;
    procedure ShowAdjustedFont(lbl: TLabel; pan: TPanel);

  public
    { Public declarations }

    {$IFNDEF SYN_DELPHI_4_UP}
    FOnSelectItem: TLVSelectItemEvent;
    {$ENDIF}

    property GetUserCommandNames: TSynEditorOptionsUserCommand
      read seoUserCommand
      write seoUserCommand;

    property GetAllUserCommands: TSynEditorOptionsAllUserCommands
      read seoAllUserCommands
      write seoAllUserCommands;

    procedure NewStatus_Editor(var coTmp: TSynEditorOC);
    procedure Status_Editor(var coTmp: TSynEditorOC);
  end;

var
  frmAppOptions: TfrmAppOptions;

implementation

uses
  ufrmMain,
  ufrmEditor,
  trUtils;

{$R *.DFM}

// Adapted from: http://delphi.about.com/od/vclusing/l/aa010703a.htm
function GetNodeByText(tvTmp: TTreeView;
                       sTmp: string;
                       bVisible: Boolean): TTreeNode;
var
  nTmp: TTreeNode;

begin
  Result:= nil;
  if (tvTmp.Items.Count = 0) then Exit;
  nTmp:= tvTmp.Items[0];
  while nTmp <> nil do begin
    if (UpperCase(nTmp.Text) = UpperCase(sTmp)) then begin
      Result:= nTmp;
      if bVisible then Result.MakeVisible;
      tvTmp.SetFocus;
      nTmp.Selected:= True;
      Break;
    end;
    nTmp:= nTmp.GetNext;
  end;
end;


procedure TfrmAppOptions.RemoveEmpty;
var
  i: integer;

begin
  for i:= 0 to (lvKeystrokes.Items.Count - 1) do
    if (lvKeystrokes.Items[i].Caption = '') or
       (lvKeystrokes.Items[i].Caption = 'ecNone') then begin  // The empty!
      lvKeystrokes.Items[i].Selected:= True;
      TSynEditKeyStroke(lvKeystrokes.Selected.Data).Free;
      lvKeystrokes.Selected.Delete;
    end;
end;


function TfrmAppOptions.GetEmpty: boolean;
var
  i: integer;

begin
  Result:= False;

  for i:= (lvKeystrokes.Items.Count - 1) downto 0 do
    if (lvKeystrokes.Items[i].Caption = '') then begin  // The empty!
      lvKeystrokes.Items[i].Selected:= true;
      try
        lvKeystrokes.Scroll(0,
                            5000); // Force the latest to be visible
      except
        // TODO
      end;
      lvKeystrokes.SetFocus;
      Result:= True;
    end;
end;

procedure TfrmAppOptions.btnFontClick(Sender: TObject);
begin
  fdAppOptions.Font.Assign(labFont.Font);

  if fdAppOptions.Execute then
  begin
    labFont.Font.Assign(fdAppOptions.Font);

    labFont.Caption:= labFont.Font.Name;

    labFont.Caption:= labFont.Font.Name +
                      ' ' +
                      IntToStr(labFont.Font.Size);

    ShowAdjustedFont(labFont,
                     panLabFont);
  end;
end;

procedure TfrmAppOptions.btnGutterFontClick(Sender: TObject);
begin
  fdAppOptions.Font.Assign(lblGutterFont.Font);

  if fdAppOptions.Execute then
  begin
    lblGutterFont.Font.Assign(fdAppOptions.Font);

    lblGutterFont.Caption:= lblGutterFont.Font.Name +
                            ' ' +
                            IntToStr(lblGutterFont.Font.Size);

    ShowAdjustedFont(lblGutterFont,
                     panGutterFont);
  end;
end;

procedure TfrmAppOptions.btnMRUClearClick(Sender: TObject);
begin
  frmTinnMain.ClearMRU;
end;

procedure TfrmAppOptions.btnUpdateKeyClick(Sender: TObject);
var
  iCmd: Integer;

begin
  if (lvKeystrokes.Selected = nil) then Exit;

  if (cbCommands.ItemIndex < 0) then begin
    if (pgApp.ActivePage = tbsEditorKeystrokes) then GetEmpty;
    Exit;
  end;

  iCmd:= Integer(cbCommands.Items.Objects[cbCommands.ItemIndex]);

  TSynEditKeyStroke(liOldSelected.Data).Command:= iCmd;

  try  // After remove generate exception: I could not find the origin of (ocasional exception) yet!
    if (eKeyShort.HotKey <> 0) then
      TSynEditKeyStroke(liOldSelected.Data).ShortCut:= eKeyShort.HotKey;
  except
    // TODO
  end;


  FillInKeystrokeInfo(TSynEditKeyStroke(liOldSelected.Data),
                      lvKeystrokes.Selected);
end;

procedure TfrmAppOptions.edLineWidthKeyDown(Sender: TObject;
                                            var Key: Word;
                                            Shift: TShiftState);
begin
  // Only digits allowed
end;

procedure TfrmAppOptions.edMaxDeparseLengthKeyPress(Sender: TObject;
                                                    var Key: Char);
begin
  if not (Key in['0'..'9',
          Chr(8)]) then Key:= #0;
end;

procedure TfrmAppOptions.FormActivate(Sender: TObject);
begin
  with frmTinnMain do begin
    pgIP.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
    with jtvAppOptions do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  // Force both to be executed
  tbDelayPosChange(nil);
  tbTransparencyPosChange(nil);
end;

procedure TfrmAppOptions.FormCreate(Sender: TObject);
var
  i: Integer;
  C: TColor;
  B: TBitmap;

begin
  B:= TBitmap.Create;

  try
    B.Width:= 16;
    B.Height:= 16;

    //Loop through and create colored images
    for i:= 0 to pmAppOptions.Items.Count-1 do
    begin
      if (pmAppOptions.Items[i].Tag = -1) then Continue;
      C:= GetColor(pmAppOptions.Items[i]);
      B.Canvas.Brush.Color:= C;
      B.Canvas.Brush.Style:= bsSolid;
      B.Canvas.Pen.Style:= psSolid;
      B.Canvas.Pen.Color:= clBlack;
      B.Canvas.Rectangle(0, 0, 16, 16);
      imlAppOptions.Add(B,
                        nil);
      {$IFDEF SYN_COMPILER_4_UP}
      pmAppOptions.Items[i].ImageIndex:= pmAppOptions.Items[i].Tag;
      {$ENDIF}
    end;
  finally
    B.Free;
  end;

  eKeyShort:= TSynHotKey.Create(Self);
  with eKeyShort do
  begin
    Parent     := gbKeystrokes;
    Left       := cbCommands.Left;
    Top        := cbCommands.Top +
                  cbCommands.Height +
                  5;
    Width      := cbCommands.Width;
    Height     := cbCommands.Height;
    HotKey     := 0;
    InvalidKeys:= [];
    Modifiers  := [];
    TabOrder   := 1;
    BorderStyle:= bsNone;
  end;

  bFormVisible:= False;
end;

procedure TfrmAppOptions.FormClose(Sender: TObject;
                                   var Action: TCloseAction);
begin
  RemoveEmpty;         // Remove any empty entry
  //btnUpdateKey.Click;  // Update

  frmTinnMain.sAppSelected:= jtvAppOptions.Selected.Text;
end;

procedure TfrmAppOptions.FormShow(Sender: TObject);
var
  i         : Integer;
  slCommands: TStringList;

begin
  GetNodeByText(jtvAppOptions,
                frmTinnMain.sAppSelected,
                True);

  // Editor Keystrokes
  // We need to do this now because it will not have been assigned when create occurs
  cbCommands.Items.Clear;

  //Start the callback to add the strings
  if bExtended then GetEditorCommandExtended(EditStrCallback)
               else GetEditorCommandValues(EditStrCallBack);

  // Now add in the user defined ones if they have any
  if Assigned(seoAllUserCommands) then begin
    slCommands:= TStringList.Create;
    try
      seoAllUserCommands(slCommands);

      for i:= 0 to (slCommands.Count - 1) do
        if Assigned(slCommands.Objects[i]) then cbCommands.Items.AddObject(slCommands[i],
                                                                           slCommands.Objects[i]);
    finally
      FreeAndNil(slCommands);
    end;
  end;

  if (lvKeystrokes.Items.Count > 0) then lvKeystrokes.Items[0].Selected:= True;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;

  // To avoid the function GetRegistryValue runs many times
  bFormVisible:= True;
  rdgRUseLatestClick(nil);
end;

procedure TfrmAppOptions.jtvAppOptionsChange(Sender: TObject;
                                             Node: TTreeNode);
begin
  case StringToCaseSelect(Node.Text,
                          ['Main',    // All of them do not have an associated TabSheet!
                           'Editor',
                           'R',
                           'Rgui',
                           'Rterm',
                           'Reformat',
                           'Processing',
                           'Conversion',
                           'Latex']) of
    0..8: with jtvAppOptions do
            Selected:= Selected.GetNext;
  end;
end;

procedure TfrmAppOptions.bbtRGuiPathClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathRGui.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathRGui.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.bbtRTermPathClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathRTerm.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathRTerm.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.tbLastFileChange(Sender: TObject);
begin
  lblLastFile.Caption:= 'Files: last ' +
                        intToStr(tbLastFile.Position) +
                        ' file(s)';
end;

procedure TfrmAppOptions.tbLastSearchChange(Sender: TObject);
begin
  lblLastSearch.Caption:= 'Searches: last ' +
                          intToStr(tbLastSearch.Position) +
                          ' search(es)';
end;

procedure TfrmAppOptions.bbtParDeplateClick(Sender: TObject);
begin
  edParDeplate.Text:= '-f';
end;

procedure TfrmAppOptions.bbtParTxt2tagsClick(Sender: TObject);
begin
  edParTxt2tags.Text:= '-t';
end;

procedure TfrmAppOptions.bbtConPathDeplateClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathDeplate_Converter.Text);
    Filter    := 'Ruby script (*.*)|*.*';
    DefaultExt:= '';
    FileName  := '';
    if Execute then edPathDeplate_Converter.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.bbtConPathTxt2tagsClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathTxt2tags_Converter.Text);
    Filter    := 'Python script (*.*)|*.*';
    DefaultExt:= '';
    FileName  := '';
    if Execute then edPathTxt2tags_Converter.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.bbtIntPathDeplateClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathDeplate_Interpreter.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathDeplate_Interpreter.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.bbtPathPandocClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPath_Pandoc.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPath_Pandoc.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.bbtIntPathTxt2tagsClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathTxt2tags_Interpreter.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathTxt2tags_Interpreter.Text:= FileName;
  end;
end;

procedure TfrmAppOptions.tbRguiTinnRProportionChange(Sender: TObject);
begin
  lblTinnRExpansion.Caption:= 'Proportion: ' +
                              intToStr(tbRguiTinnRProportion.Position) +
                              '%';
  rgRguiTinnRDispositionClick(nil);
end;

procedure TfrmAppOptions.tbTransparencyPosChange(Sender: TObject);
begin
  lbTransparency.Caption:= IntToStr(tbTransparency.Position) +
                           ' %';

  AlphaBlendValue:= 255 - (255 * tbTransparency.Position) Div 100;
end;

procedure TfrmAppOptions.rdgRArchitectureClick(Sender: TObject);
var
  sPathR,
    sPathRterm,
    sPathRgui : string;

  procedure SetPathRTerm;
  begin
    if (AnsiCompareStr(frmTinnMain.sRversion,
                       '2.12.0') < 0) then sPathRterm:= sPathR +
                                                        '\bin\Rterm.exe'
    else
      if DirectoryExists(sPathR +
                         '\bin\x64') and
         bRArchitecture64 then sPathRterm:= sPathR +
                                            '\bin\x64\Rterm.exe'
                          else sPathRterm:= sPathR +
                                            '\bin\i386\Rterm.exe';
  end;

  procedure SetPathRgui;
  begin
    if (AnsiCompareStr(frmTinnMain.sRversion,
                       '2.12.0') < 0) then sPathRgui:= sPathR +
                                                       '\bin\Rgui.exe'
    else
      if DirectoryExists(sPathR + '\bin\x64') and
         bRArchitecture64 then sPathRgui:= sPathR +
                                           '\bin\x64\Rgui.exe'
                          else sPathRgui:= sPathR +
                                           '\bin\i386\Rgui.exe';
  end;

begin
  // To avoid the function GetRegistryValue runs many times
  if (not bFormVisible) then Exit;

  if (rdgRUseLatest.ItemIndex = 1) then Exit;  // In this case the user must set the path of both (Term and Rgui) manually!

  sPathR:= GetRegistryValue('SOFTWARE\R-core\R');

  if (rdgRArchitecture.ItemIndex = 1) then bRArchitecture64:= True
                                      else bRArchitecture64:= False;

  // Rterm
  SetPathRTerm;
  edPathRTerm.Text:= sPathRterm;

  // Rgui
  SetPathRgui;
  edPathRgui.Text := sPathRgui;
end;

procedure TfrmAppOptions.rdgRUseLatestClick(Sender: TObject);
begin
  // To avoid the function GetRegistryValue runs many times
  if (not bFormVisible) then Exit;

  bRArchitecture64:= frmTinnMain.bRArchitecture64;
  rdgRArchitecture.Enabled:= bRArchitecture64;

  case rdgRUseLatest.ItemIndex of
     0: begin
          if DirectoryExists(GetRegistryValue('SOFTWARE\R-core\R') +
                                              '\bin\x64') then
            rdgRArchitecture.Enabled:= True;
          rdgRArchitectureClick(Self);
        end;
     1: begin
          rdgRArchitecture.Enabled:= False;
        end;
  end;
end;

procedure TfrmAppOptions.rdgRtermTypeClick(Sender: TObject);
begin
  rdgRTermDisposition.Enabled:= rdgRTermType.ItemIndex = 0;
end;

procedure TfrmAppOptions.rgRguiTinnRDispositionClick(Sender: TObject);
begin
  //0: Tinn-R on top
  //1: Tinn-R on bottom
  //2: Tinn-R on left
  //3: Tinn-R on right
  case rgRguiTinnRDisposition.ItemIndex of
    0: begin  //0: Tinn-R on top
         panTinnR.Align := alTop;
         panTinnR.Height:= (tbRguiTinnRProportion.Position * panScreen.Height) div 100;
       end;
    1: begin  //1: Tinn-R on bottom
         panTinnR.Align := alBottom;
         panTinnR.Height:= (tbRguiTinnRProportion.Position * panScreen.Height) div 100;
       end;
    2: begin  //2: Tinn-R on left
         panTinnR.Align := alLeft;
         panTinnR.Width := (tbRguiTinnRProportion.Position * panScreen.Width) div 100;
       end;
    3: begin  //3: Tinn-R on right
         panTinnR.Align := alRight;
         panTinnR.Width := (tbRguiTinnRProportion.Position * panScreen.Width) div 100;
       end;
  end;
end;

procedure TfrmAppOptions.bbtRGuiDefaultClick(Sender: TObject);
begin
  edParRGui.Text:= '--sdi';
end;

procedure TfrmAppOptions.bbtRTermDefaultClick(Sender: TObject);
begin
  edParRTerm.Text:= '--ess';
end;

procedure TfrmAppOptions.cbRResourcesVisibleClick(Sender: TObject);
begin
  //tbsR.TabVisible:= cbRResourcesVisible.Checked;
end;

procedure TfrmAppOptions.cbCommandsExit(Sender: TObject);
var
  iTmp: Integer;

begin
  iTmp:= cbCommands.Items.IndexOf(cbCommands.Text);
  if (iTmp = -1) then begin
    if bExtended then cbCommands.ItemIndex:= cbCommands.Items.IndexOf(ConvertCodeStringToExtended('ecNone'))
                 else cbCommands.ItemIndex:= cbCommands.Items.IndexOf('ecNone');
  end
  else cbCommands.ItemIndex:= iTmp;  // Need to force it incase they just typed something in
end;

procedure TfrmAppOptions.cbCommandsKeyPress(Sender: TObject;
                                             var Key: Char);
var
  WorkStr: String;
  i      : Integer;

begin
  // This would be better if componentized, but oh well...
  WorkStr:= AnsiUppercase(Copy(cbCommands.Text,
                               1,
                               cbCommands.SelStart) +
                          Key);
  i:= 0;
  while i < cbCommands.Items.Count do begin
    if (pos(WorkStr,
            AnsiUppercase(cbCommands.Items[i])) = 1) then begin
      cbCommands.Text:= cbCommands.Items[i];
      cbCommands.SelStart:= length(WorkStr);
      cbCommands.SelLength:= Length(cbCommands.Text) -
                             cbCommands.SelStart;
      Key:= #0;
      break;
    end
    else inc(i);
  end;
end;

procedure TfrmAppOptions.cbCommandsKeyUp(Sender: TObject;
                                          var Key: Word;
                                          Shift: TShiftState);
begin
  if (Key = SYNEDIT_RETURN) then btnUpdateKey.Click;
end;

procedure TfrmAppOptions.bbtPDFParSingleClick(Sender: TObject);
begin
  edParPDFSingle.Text:= 'pdflatex -c-style-errors'
end;

procedure TfrmAppOptions.bbtPDFParBibtexClick(Sender: TObject);
begin
  edParPDFBibtex.Text:= 'bibtex'
end;

procedure TfrmAppOptions.bbtDVIParametersSingleClick(Sender: TObject);
begin
  edParDVISingle.Text:= 'latex -c-style-errors --src-specials'
end;

procedure TfrmAppOptions.bbtDVIParametersBibtexClick(Sender: TObject);
begin
  edParDVIBibtex.Text:= 'bibtex --src-specials'
end;

procedure TfrmAppOptions.sGutterColorMouseUp(Sender: TObject;
                                             Button: TMouseButton;
                                             Shift: TShiftState;
                                             X,
                                              Y: Integer);
begin
  with frmTinnMain do begin
    cdMain.Color:= sGutterColor.Brush.Color;
    if (cdMain.Execute) then sGutterColor.Brush.Color:= cdMain.Color;
  end;
end;

procedure TfrmAppOptions.shBGApplicationMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                Y: Integer);
var
  clTemp: TColor;

begin
  with frmTinnMain do begin
    cdMain.Color:= shBGApplication.Brush.Color;
    if (not cdMain.Execute) then Exit;
    clTemp:= cdMain.Color;
  end;

  with shBGApplication do begin
    Brush.Color:= clTemp;
    Font.Color := ContrastColor(clTemp);
    Refresh;
  end;

  with shSampleApplication do
    Brush.Color:= clTemp;
end;

procedure TfrmAppOptions.shFGApplicationMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                 Y: Integer);
var
  clTemp: TColor;

begin
  with frmTinnMain do begin
    cdMain.Color:= shFGApplication.Brush.Color;
    if (not cdMain.Execute) then Exit;
    clTemp:= cdMain.Color;
  end;

  with shFGApplication do begin
    Brush.Color:= clTemp;
    Font.Color := ContrastColor(clTemp);
    Refresh;
  end;

  with shSampleApplication do
    Font.Color:= clTemp;
end;

procedure TfrmAppOptions.sRightEdgeColorMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                 Y: Integer);
begin
  with frmTinnMain do begin
    cdMain.Color:= sRightEdgeColor.Brush.Color;
    if (cdMain.Execute) then sRightEdgeColor.Brush.Color:= cdMain.Color;
  end;
end;

procedure TfrmAppOptions.shBGTabSelectedMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                Y: Integer);
var
  clTemp: TColor;

begin
  with frmTinnMain do begin
    cdMain.Color:= shBGApplication.Brush.Color;
    if (not cdMain.Execute) then Exit;
    clTemp:= cdMain.Color;
  end;

  with shBGTabSelected do
    Brush.Color:= clTemp;
end;

procedure TfrmAppOptions.rdgRTCPIPTypeClick(Sender: TObject);
begin
  if (rdgRTCPIPType.ItemIndex = 0) then begin
    pgIP.ActivePage:= tbsIPLocal;
    cbRTCPIPConsoleUse.Enabled := False;
    cbRTCPIPConsoleEcho.Enabled:= False;
  end
  else begin
    pgIP.ActivePage:= tbsIPRemote;
    cbRTCPIPConsoleUse.Enabled := True;
    cbRTCPIPConsoleEcho.Enabled:= True;
  end;
end;

procedure TfrmAppOptions.tbDelayPosChange(Sender: TObject);
begin
  lbDelay.Caption:= IntToStr(tbDelay.Position) +
                    ' ms';
end;

procedure TfrmAppOptions.lvKeystrokesChanging(Sender: TObject;
                                              Item: TListItem;
                                              Change: TItemChange;
                                              var AllowChange: Boolean);
begin
  if Visible then
  begin
    if (Item = liOldSelected) and
       ((Item.Caption <> cbCommands.Text) or
       (TSynEditKeystroke(Item.Data).ShortCut <> eKeyShort.HotKey)) then begin
      btnUpdateKeyClick(btnUpdateKey);
    end;
  end;
end;

procedure TfrmAppOptions.lvKeystrokesSelectItem(Sender: TObject;
                                                Item: TListItem;
                                                Selected: Boolean);
begin
  if (lvKeystrokes.Selected = nil) then Exit;

  cbCommands.Text     := lvKeystrokes.Selected.Caption;
  cbCommands.ItemIndex:= cbCommands.Items.IndexOf(lvKeystrokes.Selected.Caption);

  eKeyShort.HotKey:= TSynEditKeyStroke(lvKeystrokes.Selected.Data).ShortCut;

  liOldSelected:= Item;
end;

procedure TfrmAppOptions.EditStrCallback(const S: string);
begin
  //Add the Item
  if bExtended then cbCommands.Items.AddObject(S,
                                               TObject(ConvertExtendedToCommand(S)))
               else cbCommands.Items.AddObject(S,
                                               TObject(ConvertCodeStringToCommand(S)));
end;

procedure TfrmAppOptions.Status_Editor(var coTmp: TSynEditorOC);
var
  i    : integer;
  liTmp: TListItem;

begin
  // Gutter
  ckGutterVisible.Checked        := coTmp.Gutter.Visible;
  ckGutterAutosize.Checked       := coTmp.Gutter.AutoSize;
  ckGutterShowLineNumbers.Checked:= coTmp.Gutter.ShowLineNumbers;
  ckGutterShowLeaderZeros.Checked:= coTmp.Gutter.LeadingZeros;
  ckGutterStartAtZero.Checked    := coTmp.Gutter.ZeroStart;
  cbGutterFont.Checked           := coTmp.Gutter.UseFontStyle;
  sGutterColor.Brush.Color       := coTmp.Gutter.Color;
  lblGutterFont.Font.Assign(coTmp.Gutter.Font);
  lblGutterFont.Caption          := lblGutterFont.Font.Name +
                                    ' ' +
                                    IntToStr(lblGutterFont.Font.Size) +
                                    'pt';
  ShowAdjustedFont(lblGutterFont,
                   panGutterFont);

  // Right Edge
  eRightEdge.Text            := IntToStr(coTmp.RightEdge);
  sRightEdgeColor.Brush.Color:= coTmp.RightEdgeColor;

  // Line Spacing
  eLineSpacing.Text:= IntToStr(coTmp.ExtraLineSpacing);
  eTabWidth.Text   := IntToStr(coTmp.TabWidth);

  // Font
  labFont.Font.Assign(coTmp.Font);
  labFont.Caption:= labFont.Font.Name +
                    ' ' + IntToStr(labFont.Font.Size) +
                    'pt';

  ShowAdjustedFont(labFont,
                   panLabFont);

  // Options
  ckAltSetsColumnMode.Checked  := eoAltSetsColumnMode in coTmp.Options;
  ckAutoIndent.Checked         := eoAutoIndent in coTmp.Options;
  ckAutoSizeMaxWidth.Checked   := eoAutoSizeMaxScrollWidth in coTmp.Options;
  ckDisableScrollArrows.Checked:= eoDisableScrollArrows in coTmp.Options;
  ckDragAndDropEditing.Checked := eoDragDropEditing in coTmp.Options;
  ckEnhanceEndKey.Checked      := eoEnhanceEndKey in coTmp.Options;
  ckEnhanceHomeKey.Checked     := eoEnhanceHomeKey in coTmp.Options;
  ckGroupUndo.Checked          := eoGroupUndo in coTmp.Options;
  ckHalfPageScroll.Checked     := eoHalfPageScroll in coTmp.Options;
  ckHideShowScrollbars.Checked := eoHideShowScrollbars in coTmp.Options;
  ckKeepCaretX.Checked         := eoKeepCaretX in coTmp.Options;
  ckRightMouseMoves.Checked    := eoRightMouseMovesCursor in coTmp.Options;
  ckScrollByOneLess.Checked    := eoScrollByOneLess in coTmp.Options;
  ckScrollHintFollows.Checked  := eoScrollHintFollows in coTmp.Options;
  ckScrollPastEOF.Checked      := eoScrollPastEof in coTmp.Options;
  ckScrollPastEOL.Checked      := eoScrollPastEol in coTmp.Options;
  ckShowScrollHint.Checked     := eoShowScrollHint in coTmp.Options;
  ckShowSpecialChars.Checked   := eoShowSpecialChars in coTmp.Options;
  ckSmartTabDelete.Checked     := eoSmartTabDelete in coTmp.Options;
  ckSmartTabs.Checked          := eoSmartTabs in coTmp.Options;
  ckTabsToSpaces.Checked       := eoTabsToSpaces in coTmp.Options;
  ckTrimTrailingSpaces.Checked := eoTrimTrailingSpaces in coTmp.Options;
  ckWantTabs.Checked           := coTmp.WantTabs;

  // Caret
  cInsertCaret.ItemIndex   := ord(coTmp.InsertCaret);
  cOverwriteCaret.ItemIndex:= ord(coTmp.OverwriteCaret);

  // Keystrokes
  lvKeystrokes.Items.BeginUpdate;
  try
    lvKeystrokes.Items.Clear;

    for i:= 0 to (coTmp.Keystrokes.Count-1) do begin
      liTmp:= lvKeystrokes.Items.Add;

      FillInKeystrokeInfo(coTmp.Keystrokes.Items[i],
                          liTmp);

      liTmp.Data:= coTmp.Keystrokes.Items[i];
  end;
    //if (lvKeystrokes.Items.Count > 0) then lvKeystrokes.Items[0].Selected:= True;
  finally
    lvKeystrokes.Items.EndUpdate;
  end;
end;

procedure TfrmAppOptions.NewStatus_Editor(var coTmp: TSynEditorOC);
var
  vOptions: TSynEditorOptions;

  procedure SetFlag(aOption: TSynEditorOption;
                    aValue: Boolean);
  begin
    if aValue then Include(vOptions,
                           aOption)
              else Exclude(vOptions,
                           aOption);
  end;

begin
  // Gutter
  coTmp.Gutter.Visible        := ckGutterVisible.Checked;
  coTmp.Gutter.AutoSize       := ckGutterAutosize.Checked;
  coTmp.Gutter.ShowLineNumbers:= ckGutterShowLineNumbers.Checked;
  coTmp.Gutter.LeadingZeros   := ckGutterShowLeaderZeros.Checked;
  coTmp.Gutter.ZeroStart      := ckGutterStartAtZero.Checked;
  coTmp.Gutter.Color          := sGutterColor.Brush.Color;
  coTmp.Gutter.UseFontStyle   := cbGutterFont.Checked;
  coTmp.Gutter.Font.Assign(lblGutterFont.Font);

  // Right Edge
  coTmp.RightEdge     := StrToIntDef(eRightEdge.Text,
                                     80);
  coTmp.RightEdgeColor:= sRightEdgeColor.Brush.Color;

  // Line Spacing
  coTmp.ExtraLineSpacing:= StrToIntDef(eLineSpacing.Text,
                                       0);

  // Tab width
  coTmp.TabWidth        := StrToIntDef(eTabWidth.Text,
                                       2);

  // Bookmarks
  coTmp.BookMarkOptions.EnableKeys   := True;
  coTmp.BookMarkOptions.GlyphsVisible:= True;

  // Font
  coTmp.Font.Assign(labFont.Font);

  // Options
  vOptions:= coTmp.Options;  // Keep old values for unsupported options
  coTmp.WantTabs:= ckWantTabs.Checked;
  SetFlag(eoAltSetsColumnMode, ckAltSetsColumnMode.Checked);
  SetFlag(eoAutoIndent, ckAutoIndent.Checked);
  SetFlag(eoAutoSizeMaxScrollWidth, ckAutoSizeMaxWidth.Checked);
  SetFlag(eoDisableScrollArrows, ckDisableScrollArrows.Checked);
  SetFlag(eoDragDropEditing, ckDragAndDropEditing.Checked);
  SetFlag(eoEnhanceEndKey, ckEnhanceEndKey.Checked);
  SetFlag(eoEnhanceHomeKey, ckEnhanceHomeKey.Checked);
  SetFlag(eoGroupUndo, ckGroupUndo.Checked);
  SetFlag(eoHalfPageScroll, ckHalfPageScroll.Checked);
  SetFlag(eoHideShowScrollbars, ckHideShowScrollbars.Checked);
  SetFlag(eoKeepCaretX, ckKeepCaretX.Checked);
  SetFlag(eoRightMouseMovesCursor, ckRightMouseMoves.Checked);
  SetFlag(eoScrollByOneLess, ckScrollByOneLess.Checked);
  SetFlag(eoScrollHintFollows, ckScrollHintFollows.Checked);
  SetFlag(eoScrollPastEof, ckScrollPastEOF.Checked);
  SetFlag(eoScrollPastEol, ckScrollPastEOL.Checked);
  SetFlag(eoShowScrollHint, ckShowScrollHint.Checked);
  SetFlag(eoShowSpecialChars, ckShowSpecialChars.Checked);
  SetFlag(eoSmartTabDelete, ckSmartTabDelete.Checked);
  SetFlag(eoSmartTabs, ckSmartTabs.Checked);
  SetFlag(eoTabsToSpaces, ckTabsToSpaces.Checked);
  SetFlag(eoTrimTrailingSpaces, ckTrimTrailingSpaces.Checked);
  coTmp.Options:= vOptions;

  // Caret
  coTmp.InsertCaret   := TSynEditCaretType(cInsertCaret.ItemIndex);
  coTmp.OverwriteCaret:= TSynEditCaretType(cOverwriteCaret.ItemIndex);
{
  // Keystrokes
  lvKeystrokes.Items.BeginUpdate;
  try
    lvKeystrokes.Items.Clear;
    for i:= 0 to (coTmp.Keystrokes.Count-1) do begin
      li:= lvKeystrokes.Items.Add;

      FillInKeystrokeInfo(coTmp.Keystrokes.Items[i],
                          li);

      li.Data:= coTmp.Keystrokes.Items[i];
    end;
    //if (lvKeystrokes.Items.Count > 0) then lvKeystrokes.Items[0].Selected:= True;
  finally
    lvKeystrokes.Items.EndUpdate;
  end;
}
(*
  // Keystrokes
  //coTmp.Keystrokes.Clear;
  lvKeystrokes.Items.BeginUpdate;

  try
    for i:= 0 to (lvKeystrokes.Items.Count - 1) do begin
      //coTmp.Keystrokes.Items[i].:= nil;
      //coTmp.Keystrokes.Items[i]:= lvKeystrokes.Items.Item[i].Data;
      //coTmp.Keystrokes.Items[i]:= lvKeystrokes.Items.Item[i].Data;
{
      coTmp.Keystrokes.AddKey(TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).Command,
                              TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).ShortCut,
                              TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).Shift);
}
      //TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).Command; //está comendo um já existente.
      //TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).ShortCut;
      coTmp.Keystrokes.Items[i].Command := TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).Command;
      coTmp.Keystrokes.Items[i].ShortCut:= TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).Shortcut;
      coTmp.Keystrokes.Items[i].Shift   := TSynEditKeyStroke(lvKeystrokes.Items.Item[i].Data).Shift;
    end;
  except
    // TODO
  end;

  lvKeystrokes.Items.EndUpdate;
*)
end;

procedure TfrmAppOptions.imGeneralMouseDown(Sender: TObject;
                                            Button: TMouseButton;
                                            Shift: TShiftState;
                                            X,
                                             Y: Integer);
var
  P : TPoint;

begin
  cpFrom:= cpRightEdge;
  P:= sRightEdgeColor.ClientToScreen(Point(-1, sRightEdgeColor.Height-1));
  btnRightEdge.BevelOuter:= bvLowered;
  pmAppOptions.Popup(P.X,
                     P.Y);
  btnRightEdge.BevelOuter:= bvNone;
end;

procedure TfrmAppOptions.imGutterMouseDown(Sender: TObject;
                                           Button: TMouseButton;
                                           Shift: TShiftState;
                                           X,
                                            Y: Integer);
var
  P : TPoint;

begin
  cpFrom:= cpGutter;
  P:= sGutterColor.ClientToScreen(Point(-1, sGutterColor.Height-1));
  btnGutterColor.BevelOuter:= bvLowered;
  pmAppOptions.Popup(P.X,
                     P.Y);
  btnGutterColor.BevelOuter:= bvNone;
end;

procedure TfrmAppOptions.FillInKeystrokeInfo(seKeystroke: TSynEditKeystroke;
                                             liTmp: TListItem);
var
  sTmp: string;

begin
  with seKeystroke do begin
    if (Command >= ecUserFirst) then begin
      sTmp:= 'User Command';

      if Assigned(GetUserCommandNames) then GetUserCommandNames(Command,
                                                                sTmp);
    end
    else begin
      if bExtended then sTmp:= ConvertCodeStringToExtended(EditorCommandToCodeString(Command))
                   else sTmp:= EditorCommandToCodeString(Command);
    end;

    // Caption
    liTmp.Caption:= sTmp;

    // Keystroke
    liTmp.SubItems.Clear;
    sTmp:= '';

    if (Shortcut <> 0) then sTmp:= ShortCutToText(ShortCut);

    liTmp.SubItems.Add(sTmp);
  end;
end;

procedure TfrmAppOptions.pmColorClick(Sender: TObject);
var
  C: TColor;

begin
  C:= GetColor(TMenuItem(Sender));
  //Set the color based on where it was "popped from"
  if (cpFrom = cpGutter) then sGutterColor.Brush.Color:= C
  else if (cpFrom = cpRightEdge) then sRightEdgeColor.Brush.Color:= C;
end;

function TfrmAppOptions.GetColor(Item: TMenuItem): TColor;
begin
 if (Item.Tag = -1) or
    (Item.Tag > 24) then Result:= clNone
                    else Result:= TColor(Byte(Item.Tag) or $80000000);
end;

//J.C.Faria: perhaps it is not the best option... but works!
procedure TfrmAppOptions.ShowAdjustedFont(lbl: TLabel;
                                          pan: TPanel);
var
  x: integer;

begin
  x:= lbl.Font.Size;
  if (lbl.Width > pan.Width) then begin
    lbl.Left:= pan.Left;
    // I made a quadratic regression, r2=0,99
    lbl.Top := Round(22.69 - 0.7216*x + 0.0021*Sqr(x));
  end
  else begin
    lbl.Left:= (pan.Width div 2) - (lbl.Width div 2);
    lbl.Top := 24;
  end;
end;

end.
(*
procedure TfrmAppOptions.btnRemKeyClick(Sender: TObject);
var
  ix,
   ic: integer;

begin
  with lvKeystrokes do
    if (Selected = nil) then Exit;

  bChanging:= True;

  TSynEditKeyStroke(lvKeystrokes.Selected.Data).Free;

  with lvKeystrokes do begin
    ix:= ItemIndex;
    Selected.Delete;
    ic:= Items.Count
  end;

  bChanging:= False;

  if (ic = 0) then Exit;

  // Select the index of the old selected (and deleted)
  with lvKeystrokes do
    if (ix < ic) then Items[ix].Selected    := True
                 else Items[ic - 1].Selected:= True;
end;
*)

(*
{$IFNDEF SYN_COMPILER_4_UP}
procedure TfrmAppOptions.OverridingWndProc(var Message: TMessage);
var
  li: TListItem;

begin
  FOldWndProc(Message);

  if (Message.Msg = CN_NOTIFY) then
    with TWMNotify(Message) do
      if NMHdr.code = LVN_ITEMCHANGED then
        with PNMListView(NMHdr)^ do
        begin
          li:= lvKeystrokes.Items[iItem];

          if Assigned(FOnSelectItem) and (uChanged = LVIF_STATE) then
          begin
            if (uOldState and LVIS_SELECTED <> 0) and
               (uNewState and LVIS_SELECTED = 0) then
              FOnSelectItem(Self,
                            li,
                            False)
            else if (uOldState and LVIS_SELECTED = 0) and
                    (uNewState and LVIS_SELECTED <> 0) then
              FOnSelectItem(Self,
                            li,
                            True);
          end;
        end;
end;
{$ENDIF}
*)

