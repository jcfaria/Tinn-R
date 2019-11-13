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

unit ufrmAppOptions;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, CommCtrl, StdCtrls, Buttons, Spin, ExtCtrls, ImgList,
  Menus, EditAlign, ScktComp, trShape, JvExControls,
  JvColorTrackbar, JvgPage, JvExComCtrls, JvComCtrls,
  SynEdit, SynEditMiscClasses, SynEditKeyCmds, SynEditKeyConst,
  SynEditOC, SynMemo;

type
  TColorPopup = (cpGutter,
                 cpRightEdge);

  TSynEditorOptionsAllUserCommands = procedure(ACommands: TStrings) of object;

  TfrmApp_Options_Dlg = class(TForm)
    ActiveBorder1: TMenuItem;
    ActiveCaption1: TMenuItem;
    ApplicationWorkspace1: TMenuItem;
    Background1: TMenuItem;
    bbHelp: TBitBtn;
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    bbtRGuiDefault: TButton;
    bbtRGuiPath: TBitBtn;
    bbtRTermDefault: TButton;
    bbtRTermPath: TBitBtn;
    btnFont: TButton;
    btnGutterColor: TPanel;
    btnGutterFont: TButton;
    btnMRUClear: TButton;
    btnRightEdge: TPanel;
    ButtonFace1: TMenuItem;
    ButtonShadow1: TMenuItem;
    ButtonText1: TMenuItem;
    CaptionText1: TMenuItem;
    cbAllNames: TCheckBox;
    cbComAutoDetect_Language: TCheckBox;
    cbComPriority_Line: TCheckBox;
    cbConnectionBeepOnError: TCheckBox;
    cbGutterFont: TCheckBox;
    cbMinimizeTinn: TCheckBox;
    cbRClearAll: TCheckBox;
    cbRClearConsole: TCheckBox;
    cbRCloseAllGraphics: TCheckBox;
    cbRCurrentLineToTop: TCheckBox;
    cbREditVariable: TCheckBox;
    cbRememberFileState: TCheckBox;
    cbRemoveExtension: TCheckBox;
    cbREscape: TCheckBox;
    cbRestoreIniDock: TCheckBox;
    cbRExampleSelectedWord: TCheckBox;
    cbRFixVariable: TCheckBox;
    cbRSetget_Info: TCheckBox;
    cbRGuiPuTTYStartClose: TCheckBox;
    cbRHelp: TCheckBox;
    cbRHelpSelectedWord: TCheckBox;
    cbRListAllObjects: TCheckBox;
    cbRListVariableNames: TCheckBox;
    cbRListVariableStructure: TCheckBox;
    cbRMirros_Update: TCheckBox;
    cbRPackages: TCheckBox;
    cbRPlotVariable: TCheckBox;
    cbRPrintVariableContent: TCheckBox;
    cbRRemoveAllObjects: TCheckBox;
    cbRSendAll: TCheckBox;
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
    cbRSendSweave: TCheckBox;
    cbRSetWorkDir_Starting: TCheckBox;
    cbRSetWorkDirectory: TCheckBox;
    cbRSmart: TCheckBox;
    cbRTCPConnection: TCheckBox;
    cbRtermCanFloat: TCheckBox;
    cbRTermStartClose: TCheckBox;
    cbScrollSendingLines: TCheckBox;
    cbToolsCanFloat: TCheckBox;
    cbUndoAfterSave: TCheckBox;
    ckAltSetsColumnMode: TCheckBox;
    ckAutocomplete: TCheckBox;
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
    edMaxDeparseLength: TEdit;
    edParRGui: TEditAlign;
    edParRTerm: TEditAlign;
    edPathR_Connected: TEditAlign;
    edPathRGui: TEditAlign;
    edPathRTerm: TEditAlign;
    eLineSpacing: TEdit;
    eRightEdge: TEdit;
    eTabWidth: TEdit;
    fdAppOptions: TFontDialog;
    gbControlling: TGroupBox;
    gbGutter: TGroupBox;
    gbOptions: TGroupBox;
    gbRightEdge: TGroupBox;
    gbSendR: TGroupBox;
    gpbDelay: TGroupBox;
    gpbMaxDeparseLength: TGroupBox;
    gpbPathRGui: TGroupBox;
    gpbPathRTerm: TGroupBox;
    gpbRTriggers: TGroupBox;
    GrayText1: TMenuItem;
    GroupBox1: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label8: TLabel;
    labFont: TLabel;
    lbDelay: TLabel;
    lblGutterFont: TLabel;
    lblLastFile: TLabel;
    lblLastSearch: TLabel;
    lbTransparency: TLabel;
    Memo1: TMemo;
    Menu1: TMenuItem;
    MEnu2: TMenuItem;
    mFiles: TMemo;
    N3dDarkShadow1: TMenuItem;
    N3DLight1: TMenuItem;
    None1: TMenuItem;
    odAppOptions: TOpenDialog;
    panAppOptions: TPanel;
    panGutterFont: TPanel;
    panLabFont: TPanel;
    pgApp: TJvgPageControl;
    pGutterBack: TPanel;
    pmAppOptions: TPopupMenu;
    pRightEdgeBack: TPanel;
    rdgDataCompletion_Pattern: TRadioGroup;
    rdgLineWraping: TRadioGroup;
    rdgRArchitecture: TRadioGroup;
    rdgRUseLatest: TRadioGroup;
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
    tbsR_Basic: TTabSheet;
    tbsProcessing_conversion: TTabSheet;
    tbsMain_DockFloat: TTabSheet;
    tbsProcessing_DviLatex: TTabSheet;
    tbsMain_Appearance: TTabSheet;
    tbsMain_Files: TTabSheet;
    tbsMain_General: TTabSheet;
    tbsR_Rgui_PuTTY: TTabSheet;
    tbsR_Rterm: TTabSheet;
    tbsR_Options: TTabSheet;
    tbsR_Resources: TTabSheet;
    tbsEditor_Advanced: TTabSheet;
    tbsEditor_Display: TTabSheet;
    tbTransparency: TJvColorTrackBar;
    Window1: TMenuItem;
    WindowFrame1: TMenuItem;
    WindowText1: TMenuItem;
    GroupBox10: TGroupBox;
    cbNotification: TCheckBox;
    cbNotification_US: TCheckBox;
    cbREcho: TCheckBox;
    Label23: TLabel;
    tbsEditor_Encoding: TTabSheet;
    gbCaret: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    cInsertCaret: TComboBox;
    cOverwriteCaret: TComboBox;
    GroupBox25: TGroupBox;
    cbApplyToANSI: TCheckBox;
    cbAlwaysAddBOM: TCheckBox;
    Memo2: TMemo;
    GroupBox23: TGroupBox;
    rgEncoding: TRadioGroup;
    rgEOL: TRadioGroup;
    Edit1: TEdit;
    cbROpenExampleSelectedWord: TCheckBox;
    tbsR_Library_Packages: TTabSheet;
    Memo3: TMemo;
    tbsR_Installed: TTabSheet;
    GroupBox11: TGroupBox;
    tvRAVailable: TTreeView;
    btnSetToRTerm: TBitBtn;
    btnSetToRGui: TBitBtn;
    btnSetToBoth: TBitBtn;
    pgRterm: TJvgPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    gbpRtermDisposition: TGroupBox;
    rdgRtermType: TRadioGroup;
    rdgRtermDisposition: TRadioGroup;
    rdgRtermWidth: TRadioGroup;
    gbRtermSyntax: TGroupBox;
    rdgRtermLOG_Syntax: TRadioGroup;
    rdgRtermIO_Syntax: TRadioGroup;
    Label28: TLabel;
    Label1: TLabel;
    rdgRtermFindError: TRadioGroup;
    rdgRtermBeepOnError: TRadioGroup;
    pgRgui_PuTTY: TJvgPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    gbpRguiTinnRProportion: TGroupBox;
    lblTinnRExpansion: TLabel;
    tbRguiTinnR_Proportion: TTrackBar;
    panScreen: TPanel;
    panTinnR: TPanel;
    panR: TPanel;
    cbRguiOrganizeAutomatically: TCheckBox;
    GroupBox27: TGroupBox;
    Label26: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    edPuttyUser: TEdit;
    edPuttyHost: TEdit;
    edPuttyPassword: TEdit;
    edParRPuTTY: TEditAlign;
    bbttPuTTYRestoreDefault: TButton;
    rgRguiTinnR_Disposition: TRadioGroup;
    Label33: TLabel;
    gpbRguiReturnFocus: TGroupBox;
    cbRguiReturnFocus: TCheckBox;
    rdgRecognition_Caption: TRadioGroup;
    Memo4: TMemo;
    pgPackages: TJvgPageControl;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    GroupBox17: TGroupBox;
    mRLibPaths: TMemo;
    GroupBox24: TGroupBox;
    edRLibPathDefault: TEdit;
    bLibraryRestoreDefault: TButton;
    Label37: TLabel;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    edVersion_TinnRcomInstalled: TEdit;
    edPathTinnRcom_Installed: TEditAlign;
    cbRTinnRcom_Install: TCheckBox;
    cbRTinnRcom_Load: TCheckBox;
    Label30: TLabel;
    Label5: TLabel;
    GroupBox15: TGroupBox;
    rdgReformatRSplit: TRadioGroup;
    GroupBox14: TGroupBox;
    memFormatR: TMemo;
    GroupBox13: TGroupBox;
    edFormatR: TEditAlign;
    GroupBox26: TGroupBox;
    memKnit: TMemo;
    GroupBox12: TGroupBox;
    edKnit: TEditAlign;
    GroupBox28: TGroupBox;
    cbRsvSocket_Connect: TCheckBox;
    gpbRServerTCPIP: TGroupBox;
    gpbRTCPIPParameter: TGroupBox;
    pgIP: TJvgPageControl;
    tbsIPLocal: TTabSheet;
    Label2: TLabel;
    Label7: TLabel;
    edtIPHostLocal: TEdit;
    edtIPPortLocal: TEdit;
    tbsIPRemote: TTabSheet;
    Label14: TLabel;
    Label15: TLabel;
    edtIPHostRemote: TEdit;
    edtIPPortRemote: TEdit;
    rdgRTCPIPType: TRadioGroup;
    gpbRTCPIPConsoleUse: TGroupBox;
    cbRTCPIPConsoleEcho: TCheckBox;
    cbRTCPIPConsoleUse: TCheckBox;
    Label39: TLabel;
    Label40: TLabel;
    pgProcessing_conversion: TJvgPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    TabSheet13: TTabSheet;
    gpbParDeplate: TGroupBox;
    edParDeplate: TEditAlign;
    bbtParDeplate: TButton;
    gpbIntPathDeplate: TGroupBox;
    edPathDeplate_Interpreter: TEditAlign;
    bbtIntPathDeplate: TBitBtn;
    gpbConPathDeplate: TGroupBox;
    edPathDeplate_Converter: TEditAlign;
    bbtConPathDeplate: TBitBtn;
    gpbPathPandoc: TGroupBox;
    edPath_Pandoc: TEditAlign;
    bbtPathPandoc: TBitBtn;
    gpbConPathTxt2tags: TGroupBox;
    edPathTxt2tags_Converter: TEditAlign;
    bbtConPathTxt2tags: TBitBtn;
    gpbIntPathTxt2tags: TGroupBox;
    edPathTxt2tags_Interpreter: TEditAlign;
    bbtIntPathTxt2tags: TBitBtn;
    gpbParTxt2tags: TGroupBox;
    edParTxt2tags: TEditAlign;
    bbtParTxt2tags: TButton;
    gpbConversionMore: TGroupBox;
    cbHTMLOpenAlways: TCheckBox;
    pgProcessing_Latex: TJvgPageControl;
    TabSheet14: TTabSheet;
    TabSheet15: TTabSheet;
    TabSheet16: TTabSheet;
    gpbDVIParameters: TGroupBox;
    gpbDVIParametersSingle: TGroupBox;
    edParDVISingle: TEditAlign;
    bbtDVIParametersSingle: TButton;
    gpbDVIParametersBibtex: TGroupBox;
    edParDVIBibtex: TEditAlign;
    bbtDVIParametersBibtex: TButton;
    gpbPDFParameters: TGroupBox;
    gpbPDFParametersSingle: TGroupBox;
    edParPDFSingle: TEditAlign;
    bbtPDFParSingle: TButton;
    gpbPDFParametersBibtex: TGroupBox;
    edParPDFBibtex: TEditAlign;
    bbtPDFParBibtex: TButton;
    gpbLatexOptions: TGroupBox;
    cbLatexVisible: TCheckBox;
    gbpLatexCloseViewer: TGroupBox;
    cbCloseDVIViewer: TCheckBox;
    cbClosePDFViewer: TCheckBox;
    gpbDOSOption: TGroupBox;
    cbDOSMinimizedAlways: TCheckBox;
    gpbPDFAfter: TGroupBox;
    cbPDFOpenAlways: TCheckBox;
    cbDVIOpenAlways: TCheckBox;
    lblURLPandoc: TLabel;
    lblURLTxt2tags: TLabel;
    lblURLDeplate: TLabel;
    lblURLR: TLabel;
    cbRSendSmart: TCheckBox;
    GroupBox29: TGroupBox;
    rdgRtermClose: TRadioGroup;
    rdgRtermSend_Plus: TRadioGroup;
    GroupBox30: TGroupBox;
    Edit2: TEdit;
    Label3: TLabel;
    GroupBox31: TGroupBox;
    edLatexClearWaste: TEditAlign;
    bbtLatexWaste_default: TButton;

    procedure bbHelpClick(Sender: TObject);
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
    procedure pmColorClick(Sender: TObject);
    procedure rdgRArchitectureClick(Sender: TObject);
    procedure rdgRTCPIPTypeClick(Sender: TObject);
    procedure rdgRtermTypeClick(Sender: TObject);
    procedure rdgRUseLatestClick(Sender: TObject);
    procedure rgRguiTinnR_DispositionClick(Sender: TObject);
    procedure sGutterColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGApplicationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGTabSelectedMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shFGApplicationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sRightEdgeColorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure tbDelayPosChange(Sender: TObject);
    procedure tbLastFileChange(Sender: TObject);
    procedure tbLastSearchChange(Sender: TObject);
    procedure tbRguiTinnR_ProportionChange(Sender: TObject);
    procedure tbTransparencyPosChange(Sender: TObject);
    procedure cbNotificationClick(Sender: TObject);
    procedure bLibraryRestoreDefaultClick(Sender: TObject);
    procedure bbttPuTTYRestoreDefaultClick(Sender: TObject);
    procedure tvRAVailableClick(Sender: TObject);
    procedure tvRAVailableKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSetToRTermClick(Sender: TObject);
    procedure btnSetToRGuiClick(Sender: TObject);
    procedure btnSetToBothClick(Sender: TObject);
    procedure lblURLPandocClick(Sender: TObject);
    procedure lblURLPandocMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblURLTxt2tagsClick(Sender: TObject);
    procedure lblURLDeplateClick(Sender: TObject);
    procedure lblURLTxt2tagsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblURLDeplateMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblURLRClick(Sender: TObject);
    procedure lblURLRMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure bbtLatexWaste_defaultClick(Sender: TObject);

  private
    { Private declarations }
    bRArchitecture64: boolean;  // It is necessary here due to automatic changes in path according with user option.
                                // The same variable name exists also as private in frmMain.

    bFormVisible      : boolean;
    cpFrom            : TColorPopup;
    seoAllUserCommands: TSynEditorOptionsAllUserCommands;
    seoUserCommand    : TSynEditorOptionsUserCommand;

    {$IFNDEF SYN_COMPILER_4_UP}
    //FOldWndProc: TWndMethod;
    //procedure OverridingWndProc(var Message: TMessage);
    {$ENDIF}

    function fGetColor(Item: TMenuItem): TColor;

    procedure pShowAdjustedFont(lbl: TLabel; pan: TPanel);
    procedure pRAvailable_Set;

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

    procedure pNewStatus_Editor(var coTmp: TSynEditorOC);
    procedure pStatus_Editor(var coTmp: TSynEditorOC);
    procedure pRAvailable(var slRAvailable: TStringList);
  end;

var
  frmApp_Options_Dlg: TfrmApp_Options_Dlg;

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

procedure TfrmApp_Options_Dlg.btnFontClick(Sender: TObject);
begin
  with fdAppOptions do
    Options:= Options - [fdEffects];

  fdAppOptions.Font.Assign(labFont.Font);

  if fdAppOptions.Execute then
  begin
    labFont.Font.Assign(fdAppOptions.Font);

    labFont.Caption:= labFont.Font.Name;

    labFont.Caption:= labFont.Font.Name +
                      ' ' +
                      IntToStr(labFont.Font.Size);

    pShowAdjustedFont(labFont,
                      panLabFont);
  end;
end;

procedure TfrmApp_Options_Dlg.btnGutterFontClick(Sender: TObject);
begin
  with fdAppOptions do
    Options:= Options + [fdEffects];

  fdAppOptions.Font.Assign(lblGutterFont.Font);

  if fdAppOptions.Execute then
  begin
    lblGutterFont.Font.Assign(fdAppOptions.Font);

    lblGutterFont.Caption:= lblGutterFont.Font.Name +
                            ' ' +
                            IntToStr(lblGutterFont.Font.Size);

    pShowAdjustedFont(lblGutterFont,
                      panGutterFont);
  end;
end;

procedure TfrmApp_Options_Dlg.btnMRUClearClick(Sender: TObject);
begin
  frmMain.pClear_MRU;
end;

procedure TfrmApp_Options_Dlg.btnSetToBothClick(Sender: TObject);
var
  sPath: string;

begin
  with tvRAVailable do
    if (Selected = nil) then Exit;

  with tvRAVailable do
    case Selected.level of
      0: ; //TODO
      1: // https://regex101.com/r/A0AtVg/2
         //$re = '/([a-zA-Z]:\\\\).+/m';
         //$str = '3.5.1
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //3.5.1 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //3.5.1.0 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //3.6.0 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //
         //99.99.99
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //99.99.99.99 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //';
         //
         //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
         //
         //// Print the entire match result
         //var_dump($matches);

         sPath:= fRegEx(tvRAVailable.Selected.Text,
                        '([a-zA-Z]:\\).+',
                        False);
    end;

  rdgRUseLatest.ItemIndex:= 1;
  rdgRUseLatestClick(nil);

  edPathRTerm.Text:= sPath +
                     'Rterm.exe';

  edPathRGui.Text:= sPath +
                    'Rgui.exe';
end;

procedure TfrmApp_Options_Dlg.btnSetToRGuiClick(Sender: TObject);
var
  sPath: string;

begin
  with tvRAVailable do
    if (Selected = nil) then Exit;

  with tvRAVailable do
    case Selected.level of
      0: ; //TODO
      1: // https://regex101.com/r/A0AtVg/2
         //$re = '/([a-zA-Z]:\\\\).+/m';
         //$str = '3.5.1
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //3.5.1 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //3.5.1.0 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //3.6.0 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //
         //99.99.99
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //99.99.99.99 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //';
         //
         //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
         //
         //// Print the entire match result
         //var_dump($matches);

         sPath:= fRegEx(tvRAVailable.Selected.Text,
                        '([a-zA-Z]:\\).+',
                        False);
    end;

  rdgRUseLatest.ItemIndex:= 1;
  rdgRUseLatestClick(nil);

  edPathRGui.Text:= sPath +
                    'Rgui.exe';
end;

procedure TfrmApp_Options_Dlg.btnSetToRTermClick(Sender: TObject);
var
  sPath: string;

begin
  with tvRAVailable do
    if (Selected = nil) then Exit;

  with tvRAVailable do
    case Selected.level of
      0: ; //TODO
      1: // https://regex101.com/r/A0AtVg/2
         //$re = '/([a-zA-Z]:\\\\).+/m';
         //$str = '3.5.1
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //3.5.1 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //3.5.1.0 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //3.6.0 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //
         //99.99.99
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //99.99.99.99 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //';
         //
         //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
         //
         //// Print the entire match result
         //var_dump($matches);

         sPath:= fRegEx(tvRAVailable.Selected.Text,
                        '([a-zA-Z]:\\).+',
                        False);
    end;

  rdgRUseLatest.ItemIndex:= 1;
  rdgRUseLatestClick(nil);

  edPathRTerm.Text:= sPath +
                     'Rterm.exe';
end;

procedure TfrmApp_Options_Dlg.bbtLatexWaste_defaultClick(Sender: TObject);
begin
  edLatexClearWaste.Text:= '.aux, .log, .lof, .lot, .bbl, .blg, .out, .toc';
end;

procedure TfrmApp_Options_Dlg.edLineWidthKeyDown(Sender: TObject;
                                            var Key: Word;
                                            Shift: TShiftState);
begin
  // Only digits allowed
end;

procedure TfrmApp_Options_Dlg.edMaxDeparseLengthKeyPress(Sender: TObject;
                                                    var Key: Char);
begin
  if not (Key in['0'..'9',
          Chr(8)]) then Key:= #0;
end;

procedure TfrmApp_Options_Dlg.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    pgIP.TabSelectedStyle.BackgrColor                   := clBGTabSelectedNew;
    pgRterm.TabSelectedStyle.BackgrColor                := clBGTabSelectedNew;
    pgRgui_PuTTY.TabSelectedStyle.BackgrColor           := clBGTabSelectedNew;
    pgPackages.TabSelectedStyle.BackgrColor             := clBGTabSelectedNew;
    pgProcessing_Conversion.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
    pgProcessing_Latex.TabSelectedStyle.BackgrColor     := clBGTabSelectedNew;

    pgRterm.TabIndex                := 0;
    pgRgui_PuTTY.TabIndex           := 0;
    pgPackages.TabIndex             := 0;
    pgProcessing_Conversion.TabIndex:= 0;
    pgProcessing_Latex.TabIndex     := 0;

    with jtvAppOptions do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  // Force both to be executed
  tbDelayPosChange(nil);
  tbTransparencyPosChange(nil);
end;

procedure TfrmApp_Options_Dlg.FormCreate(Sender: TObject);
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
      C:= fGetColor(pmAppOptions.Items[i]);
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

  bFormVisible:= False;
end;

procedure TfrmApp_Options_Dlg.FormClose(Sender: TObject;
                                        var Action: TCloseAction);
begin
  frmMain.sAppSelected:= jtvAppOptions.Selected.Text;
end;

procedure TfrmApp_Options_Dlg.FormShow(Sender: TObject);
//var
  //vloNode : TTreeNode;
  
begin
{
  vloNode := tvRAvailable.Items.Add(nil, '3.5.1');
  vloNode := tvRAvailable.Items.AddChild(vloNode, '[32 b] - C:\Program files\R');
  tvRAvailable.Items.AddObject(vloNode, '[64 b] - C:\Program files\R', nil);

  vloNode := tvRAvailable.Items.Add(nil, '3.5.1patched');
  vloNode := tvRAvailable.Items.AddChild(vloNode, '[32 b] - C:\Program files\R');
  tvRAvailable.Items.AddObject(vloNode, '[64 b] - C:\Program files\R', nil);
}
  GetNodeByText(jtvAppOptions,
                frmMain.sAppSelected,
                True);

  with frmMain do begin
    // Files
    mFiles.Color     := clBGApplication;
    mFiles.Font.Color:= clFGApplication;

    // FormatR
    edFormatR.Color      := clBGApplication;
    edFormatR.Font.Color := clFGApplication;
    memFormatR.Color     := clBGApplication;
    memFormatR.Font.Color:= clFGApplication;

    // Knitr
    edKnit.Color      := clBGApplication;
    edKnit.Font.Color := clFGApplication;
    memKnit.Color     := clBGApplication;
    memKnit.Font.Color:= clFGApplication;

    // TinnRcom
    mRLibPaths.Color     := clBGApplication;
    mRLibPaths.Font.Color:= clFGApplication;

    // R Paths
    //memRAvailable.Color     := clBGApplication;
    //memRAvailable.Font.Color:= clFGApplication;
  end;

  AlphaBlendValue:= frmMain.iAlphaBlendValue;

  // To avoid the function GetRegistryValue runs many times
  bFormVisible:= True;
  rdgRUseLatestClick(nil);
end;

procedure TfrmApp_Options_Dlg.jtvAppOptionsChange(Sender: TObject;
                                             Node: TTreeNode);
begin
// // the below bother me with time.
//  case fStringToCaseSelect(Node.Text,
//                          ['Main',    // All of them do not have an associated TabSheet!
//                           'Editor',
//                           'R',
//                           'Rterm',
//                           'Rgui/PuTTY',
//                           'Packages',
//                           'Processing',
//                           'Conversion',
//                           'Latex']) of
//    0..8: with jtvAppOptions do begin
//            Node.Collapse(True);
//            Selected:= Selected.GetNext;
//          end;
//  end;

//  if (Node.Parent = nil) then
//    //Node.Expand(True);
//    ShowMessage('oi');
end;

procedure TfrmApp_Options_Dlg.bbtRGuiPathClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathRGui.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathRGui.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtRTermPathClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathRTerm.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathRTerm.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.bbttPuTTYRestoreDefaultClick(Sender: TObject);
begin
  edParRPuTTY.Text:= '--no-save';
end;

procedure TfrmApp_Options_Dlg.bLibraryRestoreDefaultClick(Sender: TObject);
begin
  edRLibPathDefault.Text:= '.libPaths()[1L]';
end;

procedure TfrmApp_Options_Dlg.tbLastFileChange(Sender: TObject);
begin
  lblLastFile.Caption:= intToStr(tbLastFile.Position) +
                        ' file(s)';
end;

procedure TfrmApp_Options_Dlg.tbLastSearchChange(Sender: TObject);
begin
  lblLastSearch.Caption:= intToStr(tbLastSearch.Position) +
                          ' search(es)';
end;

procedure TfrmApp_Options_Dlg.bbtParDeplateClick(Sender: TObject);
begin
  edParDeplate.Text:= '-f';
end;

procedure TfrmApp_Options_Dlg.bbtParTxt2tagsClick(Sender: TObject);
begin
  edParTxt2tags.Text:= '-t';
end;

procedure TfrmApp_Options_Dlg.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpen_UserGuidePDF('"Application options"');
end;

procedure TfrmApp_Options_Dlg.bbtConPathDeplateClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathDeplate_Converter.Text);
    Filter    := 'Ruby script (*.*)|*.*';
    DefaultExt:= '';
    FileName  := '';
    if Execute then edPathDeplate_Converter.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtConPathTxt2tagsClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathTxt2tags_Converter.Text);
    Filter    := 'Python script (*.*)|*.*';
    DefaultExt:= '';
    FileName  := '';
    if Execute then edPathTxt2tags_Converter.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtIntPathDeplateClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathDeplate_Interpreter.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathDeplate_Interpreter.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtPathPandocClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPath_Pandoc.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPath_Pandoc.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtIntPathTxt2tagsClick(Sender: TObject);
begin
  with odAppOptions do begin
    InitialDir:= ExtractFilePath(edPathTxt2tags_Interpreter.Text);
    Filter    := 'Executable program (*.exe)|*.exe';
    DefaultExt:= 'exe';
    FileName  := '';
    if Execute then edPathTxt2tags_Interpreter.Text:= FileName;
  end;
end;

procedure TfrmApp_Options_Dlg.tbRguiTinnR_ProportionChange(Sender: TObject);
begin
  lblTinnRExpansion.Caption:= 'Proportion: ' +
                              intToStr(tbRguiTinnR_Proportion.Position) +
                              '%';
  rgRguiTinnR_DispositionClick(nil);
end;

procedure TfrmApp_Options_Dlg.tbTransparencyPosChange(Sender: TObject);
begin
  lbTransparency.Caption:= IntToStr(tbTransparency.Position) +
                           ' %';

  AlphaBlendValue:= 255 - (255 * tbTransparency.Position) Div 100;
end;

procedure TfrmApp_Options_Dlg.tvRAVailableClick(Sender: TObject);
begin
  pRAvailable_Set;
end;

procedure TfrmApp_Options_Dlg.tvRAVailableKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  pRAvailable_Set;
end;

procedure TfrmApp_Options_Dlg.rdgRArchitectureClick(Sender: TObject);
var
  sPathR,
    sPathRterm,
    sPathRgui : string;

  procedure pSetPathRTerm;
  begin
    if DirectoryExists(sPathR +
                       '\bin\x64') and
       bRArchitecture64 then sPathRterm:= sPathR +
                                          '\bin\x64\Rterm.exe'
                        else sPathRterm:= sPathR +
                                            '\bin\i386\Rterm.exe';
  end;

  procedure pSetPathRgui;
  begin
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

  sPathR:= fGet_Registry_InstallPath('SOFTWARE\R-core\R');

  if (rdgRArchitecture.ItemIndex = 1) then bRArchitecture64:= True
                                      else bRArchitecture64:= False;

  // Rterm
  pSetPathRTerm;
  edPathRTerm.Text:= sPathRterm;

  // Rgui
  pSetPathRgui;
  edPathRgui.Text := sPathRgui;
end;

procedure TfrmApp_Options_Dlg.rdgRUseLatestClick(Sender: TObject);
begin
  // To avoid the function GetRegistryValue runs many times
  if (not bFormVisible) then Exit;

  bRArchitecture64:= frmMain.bRArchitecture64;
  rdgRArchitecture.Enabled:= bRArchitecture64;

  case rdgRUseLatest.ItemIndex of
     0: begin
          if DirectoryExists(fGet_Registry_InstallPath('SOFTWARE\R-core\R') +
                                                       '\bin\x64') then
            rdgRArchitecture.Enabled:= True;
          rdgRArchitectureClick(Self);
        end;
     1: begin
          rdgRArchitecture.Enabled:= False;
        end;
  end;
end;

procedure TfrmApp_Options_Dlg.rdgRtermTypeClick(Sender: TObject);
begin
  rdgRTermDisposition.Enabled:= rdgRTermType.ItemIndex = 0;
end;

procedure TfrmApp_Options_Dlg.rgRguiTinnR_DispositionClick(Sender: TObject);
begin
  //0: Tinn-R on top
  //1: Tinn-R on bottom
  //2: Tinn-R on left
  //3: Tinn-R on right
  case rgRguiTinnR_Disposition.ItemIndex of
    0: begin  //0: Tinn-R on top
         panTinnR.Align := alTop;
         panTinnR.Height:= (tbRguiTinnR_Proportion.Position * panScreen.Height) div 100;
       end;
    1: begin  //1: Tinn-R on bottom
         panTinnR.Align := alBottom;
         panTinnR.Height:= (tbRguiTinnR_Proportion.Position * panScreen.Height) div 100;
       end;
    2: begin  //2: Tinn-R on left
         panTinnR.Align := alLeft;
         panTinnR.Width := (tbRguiTinnR_Proportion.Position * panScreen.Width) div 100;
       end;
    3: begin  //3: Tinn-R on right
         panTinnR.Align := alRight;
         panTinnR.Width := (tbRguiTinnR_Proportion.Position * panScreen.Width) div 100;
       end;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtRGuiDefaultClick(Sender: TObject);
begin
  edParRGui.Text:= '--sdi';
end;

procedure TfrmApp_Options_Dlg.bbtRTermDefaultClick(Sender: TObject);
begin
  edParRTerm.Text:= '--ess';
end;

procedure TfrmApp_Options_Dlg.cbRResourcesVisibleClick(Sender: TObject);
begin
  //tbsR.TabVisible:= cbRResourcesVisible.Checked;
end;

procedure TfrmApp_Options_Dlg.cbNotificationClick(Sender: TObject);
begin
  with cbNotification do begin
    if Checked then
      with cbNotification_US do
        Enabled:= True
    else
      with cbNotification_US do begin
        Checked:= False;
        Enabled:= False;
      end;
  end;
end;

procedure TfrmApp_Options_Dlg.bbtPDFParSingleClick(Sender: TObject);
begin
  edParPDFSingle.Text:= 'pdflatex -c-style-errors'
end;

procedure TfrmApp_Options_Dlg.bbtPDFParBibtexClick(Sender: TObject);
begin
  edParPDFBibtex.Text:= 'bibtex'
end;

procedure TfrmApp_Options_Dlg.bbtDVIParametersSingleClick(Sender: TObject);
begin
  edParDVISingle.Text:= 'latex -c-style-errors --src-specials'
end;

procedure TfrmApp_Options_Dlg.bbtDVIParametersBibtexClick(Sender: TObject);
begin
  edParDVIBibtex.Text:= 'bibtex --src-specials'
end;

procedure TfrmApp_Options_Dlg.sGutterColorMouseUp(Sender: TObject;
                                             Button: TMouseButton;
                                             Shift: TShiftState;
                                             X,
                                              Y: Integer);
begin
  with frmMain do begin
    cdMain.Color:= sGutterColor.Brush.Color;
    if (cdMain.Execute) then sGutterColor.Brush.Color:= cdMain.Color;
  end;
end;

procedure TfrmApp_Options_Dlg.shBGApplicationMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                Y: Integer);
var
  clTemp: TColor;

begin
  with frmMain do begin
    cdMain.Color:= shBGApplication.Brush.Color;
    if (not cdMain.Execute) then Exit;
    clTemp:= cdMain.Color;
  end;

  with shBGApplication do begin
    Brush.Color:= clTemp;
    Font.Color := fContrast_Color(clTemp);
    Refresh;
  end;

  with shSampleApplication do
    Brush.Color:= clTemp;
end;

procedure TfrmApp_Options_Dlg.shFGApplicationMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                 Y: Integer);
var
  clTemp: TColor;

begin
  with frmMain do begin
    cdMain.Color:= shFGApplication.Brush.Color;
    if (not cdMain.Execute) then Exit;
    clTemp:= cdMain.Color;
  end;

  with shFGApplication do begin
    Brush.Color:= clTemp;
    Font.Color := fContrast_Color(clTemp);
    Refresh;
  end;

  with shSampleApplication do
    Font.Color:= clTemp;
end;

procedure TfrmApp_Options_Dlg.sRightEdgeColorMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                 Y: Integer);
begin
  with frmMain do begin
    cdMain.Color:= sRightEdgeColor.Brush.Color;
    if (cdMain.Execute) then sRightEdgeColor.Brush.Color:= cdMain.Color;
  end;
end;

procedure TfrmApp_Options_Dlg.shBGTabSelectedMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X,
                                                Y: Integer);
var
  clTemp: TColor;

begin
  with frmMain do begin
    cdMain.Color:= shBGApplication.Brush.Color;
    if (not cdMain.Execute) then Exit;
    clTemp:= cdMain.Color;
  end;

  with shBGTabSelected do
    Brush.Color:= clTemp;
end;

procedure TfrmApp_Options_Dlg.rdgRTCPIPTypeClick(Sender: TObject);
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

procedure TfrmApp_Options_Dlg.tbDelayPosChange(Sender: TObject);
begin
  lbDelay.Caption:= IntToStr(tbDelay.Position) +
                    ' ms';
end;

procedure TfrmApp_Options_Dlg.lblURLDeplateClick(Sender: TObject);
begin
  pOpen_Url('http://deplate.sourceforge.net/index.php');
end;

procedure TfrmApp_Options_Dlg.lblURLDeplateMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  lblURLDeplate.Cursor:= crHandPoint;
end;

procedure TfrmApp_Options_Dlg.lblURLPandocClick(Sender: TObject);
begin
  pOpen_Url('http://pandoc.org');
end;

procedure TfrmApp_Options_Dlg.lblURLPandocMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  lblURLPandoc.Cursor:= crHandPoint;
end;

procedure TfrmApp_Options_Dlg.lblURLRClick(Sender: TObject);
begin
  pOpen_Url('http://www.r-project.org');
end;

procedure TfrmApp_Options_Dlg.lblURLRMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  lblURLR.Cursor:= crHandPoint;
end;

procedure TfrmApp_Options_Dlg.lblURLTxt2tagsClick(Sender: TObject);
begin
  pOpen_Url('http://txt2tags.org');
end;

procedure TfrmApp_Options_Dlg.lblURLTxt2tagsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  lblURLTxt2tags.Cursor:= crHandPoint;
end;

procedure TfrmApp_Options_Dlg.pStatus_Editor(var coTmp: TSynEditorOC);
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
  pShowAdjustedFont(lblGutterFont,
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

  pShowAdjustedFont(labFont,
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
  ckWantTabs.Checked           := eoTabIndent in coTmp.Options;

  // Caret
  cInsertCaret.ItemIndex   := ord(coTmp.InsertCaret);
  cOverwriteCaret.ItemIndex:= ord(coTmp.OverwriteCaret);
end;

procedure TfrmApp_Options_Dlg.pNewStatus_Editor(var coTmp: TSynEditorOC);
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
  coTmp.Gutter.AutoSize       := ckGutterAutosize.Checked;
  coTmp.Gutter.Color          := sGutterColor.Brush.Color;
  coTmp.Gutter.LeadingZeros   := ckGutterShowLeaderZeros.Checked;
  coTmp.Gutter.ShowLineNumbers:= ckGutterShowLineNumbers.Checked;
  coTmp.Gutter.UseFontStyle   := cbGutterFont.Checked;
  coTmp.Gutter.Visible        := ckGutterVisible.Checked;
  coTmp.Gutter.ZeroStart      := ckGutterStartAtZero.Checked;
  coTmp.Gutter.Font.Assign(lblGutterFont.Font);

  // Right Edge
  coTmp.RightEdge:= StrToIntDef(eRightEdge.Text,
                                80);
  coTmp.RightEdgeColor:= sRightEdgeColor.Brush.Color;

  // Line Spacing
  coTmp.ExtraLineSpacing:= StrToIntDef(eLineSpacing.Text,
                                       0);

  // Tab width
  coTmp.TabWidth:= StrToIntDef(eTabWidth.Text,
                               2);

  // Bookmarks
  coTmp.BookMarkOptions.EnableKeys   := True;
  coTmp.BookMarkOptions.GlyphsVisible:= True;

  // Font
  coTmp.Font.Assign(labFont.Font);

  // Options
  vOptions:= coTmp.Options;  // Keep old values for unsupported options
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
  SetFlag(eoTabIndent, ckWantTabs.Checked);
  SetFlag(eoTabsToSpaces, ckTabsToSpaces.Checked);
  SetFlag(eoTrimTrailingSpaces, ckTrimTrailingSpaces.Checked);
  coTmp.Options:= vOptions;

  // Caret
  coTmp.InsertCaret   := TSynEditCaretType(cInsertCaret.ItemIndex);
  coTmp.OverwriteCaret:= TSynEditCaretType(cOverwriteCaret.ItemIndex);
end;

procedure TfrmApp_Options_Dlg.imGeneralMouseDown(Sender: TObject;
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

procedure TfrmApp_Options_Dlg.imGutterMouseDown(Sender: TObject;
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

procedure TfrmApp_Options_Dlg.pmColorClick(Sender: TObject);
var
  C: TColor;

begin
  C:= fGetColor(TMenuItem(Sender));
  //Set the color based on where it was "popped from"
  if (cpFrom = cpGutter) then sGutterColor.Brush.Color:= C
  else if (cpFrom = cpRightEdge) then sRightEdgeColor.Brush.Color:= C;
end;

function TfrmApp_Options_Dlg.fGetColor(Item: TMenuItem): TColor;
begin
 if (Item.Tag = -1) or
    (Item.Tag > 24) then Result:= clNone
                    else Result:= TColor(Byte(Item.Tag) or $80000000);
end;

//J.C.Faria: perhaps it is not the best option... but it works!
procedure TfrmApp_Options_Dlg.pShowAdjustedFont(lbl: TLabel;
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

procedure TfrmApp_Options_Dlg.pRAvailable_Set;
var
  sPath: string;

begin
  with tvRAVailable do
    if (Selected = nil) then Exit;

  with tvRAVailable do
    case Selected.level of
      0: ; //TODO
      1: // https://regex101.com/r/A0AtVg/2
         //$re = '/([a-zA-Z]:\\\\).+/m';
         //$str = '3.5.1
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //3.5.1 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //3.5.1.0 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //3.6.0 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //
         //99.99.99
         //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Patched
         //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
         //
         //99.99.99.99 Microsoft R Open
         //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
         //
         //99.99.99 Pre-release
         //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
         //';
         //
         //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
         //
         //// Print the entire match result
         //var_dump($matches);

         sPath:= fRegEx(tvRAVailable.Selected.Text,
                        '([a-zA-Z]:\\).+',
                        False);
    end;

    if DirectoryExists(sPath) then begin
      btnSetToRTerm.Enabled:= True;
      btnSetToRGui.Enabled := True;
      btnSetToBoth.Enabled := True;
    end
    else begin
      btnSetToRTerm.Enabled:= False;
      btnSetToRGui.Enabled := False;
      btnSetToBoth.Enabled := False;
    end;
end;

procedure TfrmApp_Options_Dlg.pRAvailable(var slRAvailable: TStringList);
var
  sTmp: string;

  tnVersion,
   tnPath: TTreeNode;

  procedure pMakeTree;
  var
    i: integer;

  begin
    tnVersion:= nil; tnPath:= nil;
    for i:= 0 to (slRAvailable.Count - 1) do begin
      if (slRAvailable.Strings[i] <> EmptyStr) then begin
        //https://regex101.com/r/SOMrn2/2
        //$re = '/^([0-9]+[.]?){1,}/m';
        //$str = '3.5.1
        //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
        //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
        //
        //3.5.1 Patched
        //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
        //
        //3.5.1.0 Microsoft R Open
        //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
        //
        //3.6.0 Pre-release
        //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
        //
        //99.99.99
        //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
        //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
        //
        //99.99.99 Patched
        //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
        //
        //99.99.99.99 Microsoft R Open
        //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
        //
        //99.99.99 Pre-release
        //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
        //';
        //
        //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
        //
        //// Print the entire match result
        //var_dump($matches);

        sTmp:= fRegEx(slRAvailable.Strings[i],
                      '^([0-9]+[.]?){1,}',
                      False);

        if (sTmp <> '') then begin  // Is a version
          tnVersion:= tvRAvailable.Items.Add(nil,
                                             slRAvailable.Strings[i]);

          tnVersion.ImageIndex   := 0;
          tnVersion.SelectedIndex:= 0;
        end
        else  // Is the path of version
        begin
          tnPath:= tvRAvailable.Items.AddChild(tnVersion,
                                               slRAvailable.Strings[i]);
//          //https://regex101.com/r/A0AtVg/1
            //$re = '/([a-zA-Z]:\\\\).+/m';
            //$str = '3.5.1
            //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
            //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
            //
            //3.5.1 Patched
            //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
            //
            //3.5.1.0 Microsoft R Open
            //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
            //
            //3.6.0 Pre-release
            //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
            //
            //99.99.99
            //  [32 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\i386\\
            //  [64 b] - C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\
            //
            //99.99.99 Patched
            //  [64 b] - C:\\Program Files\\R\\R-3.5.1patched\\bin\\x64\\
            //
            //99.99.99.99 Microsoft R Open
            //  [64 b] - C:\\Program Files\\Microsoft\\R Open\\R-3.5.1\\bin\\x64\\
            //
            //99.99.99 Pre-release
            //  [64 b] - C:\\Program Files\\R\\R-devel\\bin\\x64\\
            //';
            //
            //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
            //
            //// Print the entire match result
            //var_dump($matches);

//          tnPath.Data:= Pchar(fRegEx(slRAvailable.Strings[i],
//                                     '([a-zA-Z]:\\).+',
//                                     False));
          tnPath.ImageIndex   := 1;
          tnPath.SelectedIndex:= 1;
        end;
      end;
    end; // loop for
  end;

begin
  with tvRAvailable do begin
    Items.BeginUpdate;
    pMakeTree;
    if (Items.Count <> 0) then Items[0].Expanded:= True;  //FullExpand
    Items.EndUpdate;
  end;
end;

(*
{
  // Keystrokes
  lvKeystrokes.Items.BeginUpdate;
  try
    lvKeystrokes.Items.Clear;
    for i:= 0 to (coTmp.Keystrokes.Count-1) do begin
      li:= lvKeystrokes.Items.Add;

      pFillInKeystrokeInfo(coTmp.Keystrokes.Items[i],
                           li);

      li.Data:= coTmp.Keystrokes.Items[i];
    end;
    //if (lvKeystrokes.Items.Count > 0) then lvKeystrokes.Items[0].Selected:= True;
  finally
    lvKeystrokes.Items.EndUpdate;
  end;
}

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

end.
