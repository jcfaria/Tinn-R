{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM OFF}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}

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

(*
Basic conventions of Tinn-R to variables names:
a   = Array                        ex: aMyArray
b   = boolean                      ex: bMyBoolean
ba  = TBasicAction                 ex: baMyAction
bc  = TBufferCoord                 ex: bcMyPos
bt  = TButton                      ex: btMyButton
c   = Char                         ex: cMyChar
cb  = TComboBox                    ex: cbSyntax
cd  = TColorDialog                 ex: cdSyntax
ch  = PChar                        ex: chMyPChar
cl  = Color                        ex: clMyColor
co  = SynEditorOC                  ex: coMyEditor  // Container of the editor options
cs  = TClientSocket                ex: csMyClient
ctb = TControlBar                  ex: ctbMain
d   = Double                       ex: dMyDouble
dc  = TDisplayCoord;               ex: dcMyDC
dt  = TMsgDlgType                  ex: dtMyType
f   = TFileNotification            ex: fNotif
ff  = TSynEditFileFormat           ex: ffDefault
fd  = TFontDialog                  ex: fdMain
frm  = Tform                       ex: frmMyForm 
fs  = TFileStream                  ex: fsMyFileStream
h   = handle                       ex: hMyHandle
hk  = TfrmHotKeys                  ex: hkMyHotkeys
i   = integer                      ex: iMyInteger
if  = TIniFile                     ex: ifMyFile
im  = im                           ex: imMyImage
ks  = TKeyboardState               ex: ksMyState
l   = TLabel                       ex: lMyLabel
li  = TListItem                    ex: liMyItem
lp  = LParam                       ex: lpMyLParam
me  = TMemo                        ex: meMyMemeo
mi  = TMenuItem                    ex: miMyMenuItem
mr  = TModalResult                 ex: mrMyModalResult
ms  = TMemoryStream                ex: msMyStream
op  = TOpenDialog                  ex: opMain
p   = TPoint                       ex: pMyPoint
pc  = TPageControl                 ex: pcMyPageControl
pr  = TPrintDialog                 ex: prMain
pre = TPerlRegEx                   ex: preRegEx
r   = real                         ex: rMyReal
rs  = TRegExpr                     ex: rsMyReg
s   = string                       ex: sMyString
sd  = TSaveDialog                  ex: sdMain
se  = TSynEdit                     ex: seTmp
sen = TSynEncoding                 ex: senANSI
sf  = TSaveFormat                  ex: sfUTF8
sl  = TStringList                  ex: slMyStringLIst
sm  = TSynSelectionMode            ex: smLine
sp  = TSplitter                    ex: spMySplitter
sr  = TSearchRec                   ex: srMySearchRec
tb  = TTrackBar                    ex: tbDelay
tf  = TextFile                     ex: tfMyTextFile
tn  = TTreeNode                    ex: tnMyNode
tob = ToolBar                      ex: tobMyBar
ts  = TString                      ex: tsMyTString
us  = UnicodeStrings               ex: usMyUnicodeStrings
w   = Word                         ex: wMyWord
wc  = WideChar                     ex: wcMWChar
*)

unit ufrmMain;
(*
 The two directives below is to
 avoide Unit or symbol "Unit FileCtrl or faArchive etc" is specific to a plataform
 under Delphi 7
*)



{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ToolWin, StdActns, ActnList, ImgList, StdCtrls, ExtCtrls,
  ClipBrd, ufrmAbout, inifiles, SynEdit, SynEditPrint, SynEditHighlighter,
  SynRegExpr, SynHighlighterMulti, SynEditTypes, Buttons, SynEditPlugins,
  SynMacroRecorder, TB2Item, TB2Dock, TB2Toolbar, Httpapp,
  SynEditKeyCmds, FileCtrl, SynExportHTML, SynEditExport, SynExportRTF,
  SynExportTeX, AppEvnts, ShellAPI, FindFile,
  ufrmHotKeys, trRHistory, trSendSmart,
  ShellCtrls, TB2MDI, TB2ExtItems, TB2MRU, TB2ToolWindow,
  Grids, DBGrids, DBCtrls,
  ScktComp, commctrl, AbArcTyp, AbUtils, AbZipper,
  AbZipKit, AbZipTyp, AbZBrows, AbMeter, AbDlgDir, AbView, AbZView, AbBrowse,
  AbBase, AbUnzper, Spellers, SpellLanguageComboBox, SynMemo,
  SynURIOpener, Registry, SynEditMiscClasses,
  SynEditSearch, Jpeg, JvPCX, JvGIF, JvAni, JvCursor, JvExForms,
  JvCustomItemViewer, JvImagesViewer, DateUtils, ConsoleIO,
  SynCompletionProposal, clMultiStream, SynEditAutoComplete, JvgPage,
  JvDriveCtrls, JvExStdCtrls, JvListBox, JvCombobox, JvgTypes, JvComponentBase,
  JvDockControlForm, JvDockTree, JvDockVSNetStyle,
  JvComponent, JvAppIniStorage, JvDockVIDStyle, JvExComCtrls,
  JvComCtrls, JvMenus, JvAppHotKey, JvTimer, SynUnicode, SynEditTextBuffer, DB,
  SynEditOC, PngImageList, JvAppStorage, ATBinHex, ATxCodepages, ATFileNotificationSimple,
  IdHTTP, IdException, IdStack, JvUpDown, PerlRegEx, UrlMon,
  trRUtils;

const
  WM_OPENEDITOR = WM_USER + 1;
  WM_NOTEXISTS  = WM_USER + 2;
  WM_RESTOREAPP = WM_USER + 3;
  MyUniqueConst = $17031958;

// Constants that we must pass to Windows to specify which special folder we want
// From: http://forum.codecall.net/topic/60120-using-special-folders-to-comply-with-uac-enabled-windows-with-delphi-code/
const
  CSIDL_APPDATA = $001A;          // APPDATA folder
  CSIDL_LOCAL_APPDATA = $001C;    // LOCAL_APPDATA folder
  CSIDL_COMMON_APPDATA = $0023;   // COMMON_APPDATA folder
  CSIDL_COMMON_DOCUMENTS = $002E; // COMMON_DOCUMENTS folder
  CSIDL_PERSONAL = $0005;         // MY DOCUMENTS folder

var
  WM_FINDINSTANCE: integer;

  RHistory: TRHistory;
  RSend_Smart: TRSend_Smart;

type
  TfrmMain = class(TForm)
    a1: TMenuItem;
    act1: TMenuItem;
    actAbout: TAction;
    actAlwaysAddBOM: TAction;
    actANSI: TAction;
    actAplicationExit: TAction;
    actApplyToANSI: TAction;
    actAsciiChart: TAction;
    actAutoCompletion: TAction;
    actBackupDatabase: TAction;
    actBackupSystemConfiguration: TAction;
    actBlockMark: TAction;
    actBlockUnmark: TAction;
    actCloseDVIViewer: TAction;
    actClosePDFViewer: TAction;
    actColorsPreference: TAction;
    actColumnSelect: TAction;
    actComment: TAction;
    actCommentsEdit: TAction;
    actCommentsHelp: TAction;
    actCompletion: TAction;
    actCompletionCopyDescrition: TAction;
    actCompletionCopyFunction: TAction;
    actCompletionEdit: TAction;
    actCompletionExampleSelected: TAction;
    actCompletionHelp: TAction;
    actCompletionHelpSelected: TAction;
    actCompletionInsert: TAction;
    actCopyFormatted: TAction;
    actCopyFormattedHtml: TAction;
    actCopyFormattedRtf: TAction;
    actCopyFormattedTeX: TAction;
    actCount: TAction;
    actCount1: TMenuItem;
    actDatabaseVisible: TAction;
    actDataCommentsVisible: TAction;
    actDataCompletionVisible: TAction;
    actDataRcardVisible: TAction;
    actDataRmirrorsVisible: TAction;
    actDataShortcutsVisible: TAction;
    actDateStamp: TAction;
    actDeplateToDocbookArticle: TAction;
    actDeplateToDocbookBook: TAction;
    actDeplateToDocbookReference: TAction;
    actDeplateToHtml: TAction;
    actDeplateToHtmlSite: TAction;
    actDeplateToHtmlSlides: TAction;
    actDeplateToLaTeX: TAction;
    actDeplateToLaTeXDramatist: TAction;
    actDeplateToPhp: TAction;
    actDeplateToPlain: TAction;
    actDeplateToSweave: TAction;
    actDeplateToXhtmlMathMl: TAction;
    actDeplateToXhtmlTransitional: TAction;
    actDifferences: TAction;
    actDosMinimizedAlways: TAction;
    actDviOpenAlways: TAction;
    actDviOpenFile: TAction;
    actEditCopy: TAction;
    actEditCut: TAction;
    actEditorLineWrap: TAction;
    actEditPaste: TAction;
    actEditRedo: TAction;
    actEditSelectAll: TAction;
    actEditUndo: TAction;
    actFileClose: TAction;
    actFileCloseAll: TAction;
    actFileCloseLeft: TAction;
    actFileCloseOthers: TAction;
    actFileCloseRight: TAction;
    actFileNew: TAction;
    actFileOpen: TAction;
    actFilesAdd: TAction;
    actFilesAddCurrent: TAction;
    actFileSave: TAction;
    actFileSaveAll: TAction;
    actFileSaveAs: TAction;
    actFilesCloseAll: TAction;
    actFilesCloseAllOfGroup: TAction;
    actFilesFullPathUnix: TAction;
    actFilesFullPathWindows: TAction;
    actFilesOpenAll: TAction;
    actFilesOpenAllOfGroup: TAction;
    actFilesRemove: TAction;
    actFilesRemoveAllOfGroup: TAction;
    actFilesRemoveAllOfProject: TAction;
    actFilesTabsBottom: TAction;
    actFilesTabsTop: TAction;
    actFind: TAction;
    actFindAgain: TAction;
    actFontDecrease: TAction;
    actFontIncrease: TAction;
    actFormatR: TAction;
    actFullPathUnix: TAction;
    actFullPathWindows: TAction;
    actGotoLine: TAction;
    actGroupCollapseAll: TAction;
    actGroupDeleteAll: TAction;
    actGroupDeleteCurrent: TAction;
    actGroupExpandAll: TAction;
    actGroupRename: TAction;
    actGrouptNew: TAction;
    actGutterVisible: TAction;
    actHexViewerVisible: TAction;
    actHtmlOpenAlways: TAction;
    actHtmlOpenCurrentFile: TAction;
    actHtmlOpenFile: TAction;
    actIndentBlock: TAction;
    actIniLogVisible: TAction;
    actInvertCaseWord: TAction;
    actInvertSelection: TAction;
    actLatexAlgebricFrac: TAction;
    actLatexAlgebricSqrt: TAction;
    actLatexAlgebricSqrtN: TAction;
    actLatexDimensional: TAction;
    actLatexFontBold: TAction;
    actLatexFontEnphase: TAction;
    actLatexFontFootnote: TAction;
    actLatexFontHuge: TAction;
    actLatexFontHuger: TAction;
    actLatexFontItalic: TAction;
    actLatexFontLarge: TAction;
    actLatexFontLarger: TAction;
    actLatexFontLargest: TAction;
    actLatexFontNormal: TAction;
    actLatexFontScript: TAction;
    actLatexFontSlatend: TAction;
    actLatexFontSmall: TAction;
    actLatexFontSmallcaps: TAction;
    actLatexFontTiny: TAction;
    actLatexFontTypewriter: TAction;
    actLatexFormatCenter: TAction;
    actLatexFormatEnumeration: TAction;
    actLatexFormatItemization: TAction;
    actLatexFormatLeft: TAction;
    actLatexFormatRight: TAction;
    actLatexHeaderChapter: TAction;
    actLatexHeaderParagraph: TAction;
    actLatexHeaderPart: TAction;
    actLatexHeaderSection: TAction;
    actLatexHeaderSubParagraph: TAction;
    actLatexHeaderSubSection: TAction;
    actLatexHeaderSubSubSection: TAction;
    actLatexMakeIndex: TAction;
    actLatexToDviBibtex: TAction;
    actLatexToDviSingle: TAction;
    actLatexToPdfBibtex: TAction;
    actLatexToPdfSingle: TAction;
    actLatexVisible: TAction;
    actLineNumbersVisible: TAction;
    actLineSelect: TAction;
    actLowerCaseSelection: TAction;
    actLowerCaseWord: TAction;
    actMAC: TAction;
    actMacroPlay: TAction;
    actMacroRecord: TAction;
    actMarkupVisible: TAction;
    actMatchBracket: TAction;
    actMiscVisible: TAction;
    actNormalSelect: TAction;
    actNotification: TAction;
    actNotification_US: TAction;
    actOnTop: TAction;
    actOpenMaximized: TAction;
    actOpenMRU: TAction;
    actOrganizeScreen: TAction;
    actPdfOpenAlways: TAction;
    actPdfOpenFile: TAction;
    actPgFilesVisible: TAction;
    actPrint: TAction;
    actProjectClose: TAction;
    actProjectDeleteCurrent: TAction;
    actProjectEdit: TAction;
    actProjectNew: TAction;
    actProjectOpen: TAction;
    actProjectOpenDemo: TAction;
    actProjectOpenNode: TAction;
    actProjectReload: TAction;
    actProjectSave: TAction;
    actProjectSaveAs: TAction;
    actProjectVisible: TAction;
    actRAssignmentLeft: TAction;
    actRAssignmentRight: TAction;
    actRcardCopyDescrition: TAction;
    actRcardCopyFunction: TAction;
    actRcardEdit: TAction;
    actRCardExampleSelected: TAction;
    actRCardHelp: TAction;
    actRCardHelpSelected: TAction;
    actRcardInsert: TAction;
    actRComplexDefault: TAction;
    actRContClearAll: TAction;
    actRContClearConsole: TAction;
    actRContCloseAllGraphics: TAction;
    actRContEditVariable: TAction;
    actRContEscape: TAction;
    actRContExampleSelectedWord: TAction;
    actRContFixVariable: TAction;
    actRContGuiPuTTYStartClose: TAction;
    actRContHelp: TAction;
    actRContHelpSelectedWord: TAction;
    actRContListAllObjects: TAction;
    actRContListVariableNames: TAction;
    actRContListVariableStructure: TAction;
    actRContPacInstall: TAction;
    actRContPacInstalled: TAction;
    actRContPacInstallZip: TAction;
    actRContPacInstTinnRcom: TAction;
    actRContPackages: TAction;
    actRContPacLoad: TAction;
    actRContPacLoadTinnRcom: TAction;
    actRContPacNew: TAction;
    actRContPacRemove: TAction;
    actRContPacStatus: TAction;
    actRContPacUpdate: TAction;
    actRContPlotVariable: TAction;
    actRContPrintVariableContent: TAction;
    actRContRemoveAllObjects: TAction;
    actRContSetWorkDirectory: TAction;
    actRContTCPConnection: TAction;
    actRContTermStartClose: TAction;
    actRCurrentLineToTop: TAction;
    actReadOnly: TAction;
    actREcho: TAction;
    actReload: TAction;
    actReloadLatexSymbols: TAction;
    actREnvironmentRefresh: TAction;
    actReplace: TAction;
    actRestoreDatabase: TAction;
    actRestoreSystemConfiguration: TAction;
    actResultsVisible: TAction;
    actRExplorerBasic: TAction;
    actRExplorerContent: TAction;
    actRExplorerEdit: TAction;
    actRExplorerExampleSelected: TAction;
    actRExplorerExpAscii: TAction;
    actRExplorerExpRaw: TAction;
    actRExplorerFix: TAction;
    actRExplorerHelp: TAction;
    actRExplorerHelpSelected: TAction;
    actRExplorerNames: TAction;
    actRExplorerPlot: TAction;
    actRExplorerRefresh: TAction;
    actRExplorerRemove: TAction;
    actRExplorerRemoveAllObjects: TAction;
    actRExplorerSendNameToClipboard: TAction;
    actRExplorerSendNameToEditor: TAction;
    actRExplorerStructure: TAction;
    actRExplorerStyle: TAction;
    actRExplorerSummary: TAction;
    actRExplorerVisible: TAction;
    actRFilterRefresh: TAction;
    actRguiReturnFocus: TAction;
    actRmirrorsCopyHost: TAction;
    actRmirrorsCopyURL: TAction;
    actRmirrorsEdit: TAction;
    actRmirrorsHelp: TAction;
    actRmirrorsOpenURLCurrent: TAction;
    actRmirrorsOpenURLDefault: TAction;
    actRmirrorsSetRepos: TAction;
    actRmirrorsUpdate: TAction;
    actRSendBlockMarked: TAction;
    actRSendClipboard: TAction;
    actRSendContiguous: TAction;
    actRSendCursorToBeginningLine: TAction;
    actRSendCursorToEndLine: TAction;
    actRSendFile: TAction;
    actRSendKnitHtml: TAction;
    actRSendKnitPdf: TAction;
    actRSendLine: TAction;
    actRSendLinesToEndPage: TAction;
    actRSendSelection: TAction;
    actRSendSweave: TAction;
    actRSimpleDefault: TAction;
    actRtermAutoHide: TAction;
    actRtermDivide: TAction;
    actRtermEditorSetFocus: TAction;
    actRtermIOandLOGClear: TAction;
    actRtermIOClear: TAction;
    actRtermIOHistoryNext: TAction;
    actRtermIOHistoryPrior: TAction;
    actRtermIOLineWrap: TAction;
    actRtermIOPrint: TAction;
    actRtermIOSave: TAction;
    actRtermIOSaveAs: TAction;
    actRtermIOSetFocus: TAction;
    actRtermIOSplitHorizontal: TAction;
    actRtermIOSplitRemove: TAction;
    actRtermIOSplitVertical: TAction;
    actRtermLoadHistory: TAction;
    actRtermLoadWorkspace: TAction;
    actRtermLOGClear: TAction;
    actRtermLOGLineWrap: TAction;
    actRtermLOGPrint: TAction;
    actRtermLOGSave: TAction;
    actRtermLOGSaveAs: TAction;
    actRtermLOGSetFocus: TAction;
    actRtermMaximize: TAction;
    actRtermMinimize: TAction;
    actRtermSaveHistory: TAction;
    actRtermSaveWorkspace: TAction;
    actRtermIO_R: TAction;
    actRtermIO_Text: TAction;
    actRtermLOG_R: TAction;
    actRtermLOG_Text: TAction;
    actRtermTabsBottom: TAction;
    actRtermTabsLeft: TAction;
    actRtermTabsRight: TAction;
    actRtermTabsTop: TAction;
    actRtermVisible: TAction;
    actRtermWarningError: TAction;
    actRVisible: TAction;
    actSearchCollapseAll: TAction;
    actSearchCollapseOne: TAction;
    actSearchExpandAll: TAction;
    actSearchExpandOne: TAction;
    actSearchInFiles: TAction;
    actSearchVisible: TAction;
    actShortcutsEdit: TAction;
    actShortcutsHelp: TAction;
    actShowAllBars: TAction;
    actShowAppOptions: TAction;
    actSortDate: TAction;
    actSortNumber: TAction;
    actSortString: TAction;
    actSpecialCharVisible: TAction;
    actSpell: TAction;
    actSpellVisible: TAction;
    actSplitHorizontal: TAction;
    actSplitRemove: TAction;
    actSplitVertical: TAction;
    actStatusBarVisible: TAction;
    actTextDefault: TAction;
    actTobEditVisible: TAction;
    actTobFilesVisible: TAction;
    actTobFilterVisible: TAction;
    actTobFormatVisible: TAction;
    actTobMacroVisible: TAction;
    actTobMiscVisible: TAction;
    actTobProcessingVisible: TAction;
    actTobRVisible: TAction;
    actTobSearchVisible: TAction;
    actTobSpellVisible: TAction;
    actTobSyntaxVisible: TAction;
    actTobViewVisible: TAction;
    actToolsAutoHide: TAction;
    actToolsDivide: TAction;
    actToolsMaximize: TAction;
    actToolsMinimize: TAction;
    actToolsTabsBottom: TAction;
    actToolsTabsLeft: TAction;
    actToolsTabsRight: TAction;
    actToolsTabsTop: TAction;
    actToolsVisible: TAction;
    actTxt2tagsToDoku: TAction;
    actTxt2tagsToGwiki: TAction;
    actTxt2tagsToHtml: TAction;
    actTxt2tagsToLatex: TAction;
    actTxt2tagsToLout: TAction;
    actTxt2tagsToMan: TAction;
    actTxt2tagsToMgp: TAction;
    actTxt2tagsToMoin: TAction;
    actTxt2tagsToPm6: TAction;
    actTxt2tagsToSgml: TAction;
    actTxt2tagsToSweave: TAction;
    actTxt2tagsToTxt: TAction;
    actTxt2tagsToWiki: TAction;
    actTxt2tagsToXhtml: TAction;
    actTxt2tagsVisible: TAction;
    actUncomment: TAction;
    actUncommentFirst: TAction;
    actUnindentBlock: TAction;
    actUNIX: TAction;
    actUnmarkAll: TAction;
    actUpperCaseSelection: TAction;
    actUpperCaseWord: TAction;
    actUTF16BE: TAction;
    actUTF16LE: TAction;
    actUTF8: TAction;
    actWIN: TAction;
    actWindowArrange: TWindowArrange;
    actWindowCascade: TWindowCascade;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWinExplVisible: TAction;
    actWorkExplVisible: TAction;
    alMain: TActionList;
    AlwaysaddtheBOM1: TMenuItem;
    ANSI1: TMenuItem;
    ApplytoopenANSIfiles1: TMenuItem;
    Autocompletion1: TMenuItem;
    b1: TMenuItem;
    Bottom1: TMenuItem;
    Bottom2: TMenuItem;
    Bottom3: TMenuItem;
    Card1: TMenuItem;
    cbSpellLanguage: TSpellLanguageComboBox;
    cbSyntax: TComboBox;
    cdMain: TColorDialog;
    Clear3: TMenuItem;
    Clipboard1: TMenuItem;
    Closeallselectedgroup2: TMenuItem;
    Commentsshowhide1: TMenuItem;
    Completionshowhide1: TMenuItem;
    ContiguousechoTRUE1: TMenuItem;
    Copyhost1: TMenuItem;
    CopyURL1: TMenuItem;
    csREnvironment: TClientSocket;
    csRExplorer: TClientSocket;
    csRGeneral: TClientSocket;
    csRtip: TClientSocket;
    ctbMain: TControlBar;
    Databaseshowhide1: TMenuItem;
    Databaseshowhide2: TMenuItem;
    Decrease1: TMenuItem;
    DokuWiki1: TMenuItem;
    edFilter: TEdit;
    Edit1: TMenuItem;
    Editorshowhide1: TMenuItem;
    Enablenotification1: TMenuItem;
    ESS1: TMenuItem;
    Exampleselected1: TMenuItem;
    Exampleselected2: TMenuItem;
    Explorer1: TMenuItem;
    Fontofactivecontrolnotpermanent1: TMenuItem;
    GoogleCodeWiki1: TMenuItem;
    Help1: TMenuItem;
    Help2: TMenuItem;
    Help3: TMenuItem;
    Help4: TMenuItem;
    Help5: TMenuItem;
    Helpselected1: TMenuItem;
    Helpselected2: TMenuItem;
    Hewviewershowhide1: TMenuItem;
    imlProject: TPngImageList;
    imlRexplorer: TPngImageList;
    imlSearch: TPngImageList;
    imlStatusBar: TPngImageList;
    imlTinnR: TPngImageList;
    Increase1: TMenuItem;
    Indent1: TMenuItem;
    Inilog1: TMenuItem;
    Insert1: TMenuItem;
    Insert3: TMenuItem;
    InvertCase1: TMenuItem;
    Invertcase2: TMenuItem;
    InvertSelection1: TMenuItem;
    Invertselection2: TMenuItem;
    IO1: TMenuItem;
    IO2: TMenuItem;
    IOandLog4: TMenuItem;
    JvAppIniFileStorage: TJvAppIniFileStorage;
    JvDockServer: TJvDockServer;
    JvDockVSNetStyle: TJvDockVSNetStyle;
    jvmenMain: TJvMainMenu;
    Knitr1: TMenuItem;
    KnittoHTMLRmd1: TMenuItem;
    Left1: TMenuItem;
    Left2: TMenuItem;
    Linewrap1: TMenuItem;
    Log1: TMenuItem;
    Log2: TMenuItem;
    Lout1: TMenuItem;
    LowerCaseSelection1: TMenuItem;
    Lowercaseselection2: TMenuItem;
    LowercaseWord1: TMenuItem;
    Lowercaseword2: TMenuItem;
    MAC1: TMenuItem;
    MagicPoint1: TMenuItem;
    Makeindexmakeindex1: TMenuItem;
    Manpage1: TMenuItem;
    memRTCPConnection: TMenuItem;
    menControlR: TMenuItem;
    menControlRClearAll: TMenuItem;
    menControlRClearConsole: TMenuItem;
    menControlRCloseAllGraphicDevices: TMenuItem;
    menControlREditSelected: TMenuItem;
    menControlREscape: TMenuItem;
    menControlRExampleSelected: TMenuItem;
    menControlRFixSelected: TMenuItem;
    menControlRHelp: TMenuItem;
    menControlRHelpSelected: TMenuItem;
    menControlRListAllObjects: TMenuItem;
    menControlRListVariableNames: TMenuItem;
    menControlRListVariableStructure: TMenuItem;
    menControlRPlotSelected: TMenuItem;
    menControlRPrintVariableContent: TMenuItem;
    menControlRRemoveAllObjects: TMenuItem;
    menControlRSetWorkDir: TMenuItem;
    menEdit: TMenuItem;
    menEditComment: TMenuItem;
    menEditCopy: TMenuItem;
    menEditCopyFormated: TMenuItem;
    menEditCopyFormatedHtml: TMenuItem;
    menEditCopyFormatedRtf: TMenuItem;
    menEditCopyFormatedTex: TMenuItem;
    menEditCut: TMenuItem;
    menEditPaste: TMenuItem;
    menEditRedo: TMenuItem;
    menEditSelectAll: TMenuItem;
    menEditUncommentAll: TMenuItem;
    menEditUncommentFirst: TMenuItem;
    menEditUndo: TMenuItem;
    menFile: TMenuItem;
    menFileClose: TMenuItem;
    menFileCloseAll: TMenuItem;
    menFileCopyFullPath: TMenuItem;
    menFileCopyFullPathUnix: TMenuItem;
    menFileCopyFullPathWindows: TMenuItem;
    menFileExit: TMenuItem;
    menFileNew: TMenuItem;
    menFileOpen: TMenuItem;
    menFileOpenAllMRU: TMenuItem;
    menFilePrint: TMenuItem;
    menFileRecentFiles: TMenuItem;
    menFileReload: TMenuItem;
    menFileSave: TMenuItem;
    menFileSaveAll: TMenuItem;
    menFileSaveAs: TMenuItem;
    menFilesFullPath: TMenuItem;
    menFilesFullPathUnix: TMenuItem;
    menFilesFullPathWindows: TMenuItem;
    menFileTemplate: TMenuItem;
    menFileTemplateRdoc: TMenuItem;
    menFileTemplateRdocDataset: TMenuItem;
    menFileTemplateRdocEmpty: TMenuItem;
    menFileTemplateRdocFunction: TMenuItem;
    menFileTemplateRhtml: TMenuItem;
    menFileTemplateRmarkdown: TMenuItem;
    menFileTemplateRscript: TMenuItem;
    menFileTemplateRsweave: TMenuItem;
    menForBlockIndent: TMenuItem;
    menForBlockUnident: TMenuItem;
    menForDelConvert: TMenuItem;
    menForDelDefault: TMenuItem;
    menForDelimiter: TMenuItem;
    menForEncConANSI: TMenuItem;
    menForEncConUTF16BE: TMenuItem;
    menForEncConUTF16LE: TMenuItem;
    menForEncConUTF8: TMenuItem;
    menForEncConvert: TMenuItem;
    menForEncDefault: TMenuItem;
    menForEncoding: TMenuItem;
    menForLinEndConMAC: TMenuItem;
    menForLinEndConUNIX: TMenuItem;
    menForLinEndConWIN: TMenuItem;
    menFormat: TMenuItem;
    menForR: TMenuItem;
    menForSelection: TMenuItem;
    menForUTF8: TMenuItem;
    menForWord: TMenuItem;
    menHelAbout: TMenuItem;
    menHelCitation: TMenuItem;
    menHelExampleOfScript: TMenuItem;
    menHelFileConversion: TMenuItem;
    menHelFileConversionDeplate: TMenuItem;
    menHelFileConversionPandoc: TMenuItem;
    menHelFileConversionTxt2tags: TMenuItem;
    menHelIniFiles: TMenuItem;
    menHelNews: TMenuItem;
    menHelp: TMenuItem;
    menHelpRecognizedWords: TMenuItem;
    menHelpStatHyperstat: TMenuItem;
    menHelpStatJSS: TMenuItem;
    menHelpStatStatSoft: TMenuItem;
    menHelSecrets: TMenuItem;
    menHelUserGuide: TMenuItem;
    menHelUserList: TMenuItem;
    menInserCompletion: TMenuItem;
    menInsert: TMenuItem;
    menInsertDateTime: TMenuItem;
    menInsertLatex: TMenuItem;
    menInsertLatexFont: TMenuItem;
    menInsertLatexFontBold: TMenuItem;
    menInsertLatexFontEnphase: TMenuItem;
    menInsertLatexFontFootnotsize: TMenuItem;
    menInsertLatexFontHuge: TMenuItem;
    menInsertLatexFontHuger: TMenuItem;
    menInsertLatexFontItalic: TMenuItem;
    menInsertLatexFontLarge: TMenuItem;
    menInsertLatexFontLarger: TMenuItem;
    menInsertLatexFontLargest: TMenuItem;
    menInsertLatexFontNormal: TMenuItem;
    menInsertLatexFontScriptsize: TMenuItem;
    menInsertLatexFontSlatend: TMenuItem;
    menInsertLatexFontSmall: TMenuItem;
    menInsertLatexFontSmallcaps: TMenuItem;
    menInsertLatexFontTiny: TMenuItem;
    menInsertLatexFontTypewriter: TMenuItem;
    menInsertLatexFormat: TMenuItem;
    menInsertLatexFormatCenter: TMenuItem;
    menInsertLatexFormatEnumeration: TMenuItem;
    menInsertLatexFormatItemization: TMenuItem;
    menInsertLatexFormatLeft: TMenuItem;
    menInsertLatexFormatRight: TMenuItem;
    menInsertLatexHeader: TMenuItem;
    menInsertLatexHeaderChapter: TMenuItem;
    menInsertLatexHeaderParagraph: TMenuItem;
    menInsertLatexHeaderPart: TMenuItem;
    menInsertLatexHeaderSection: TMenuItem;
    menInsertLatexHeaderSubparagraph: TMenuItem;
    menInsertLatexHeaderSubsection: TMenuItem;
    menInsertLatexHeaderSubsubsection: TMenuItem;
    menInsertLatexMath: TMenuItem;
    menInsertLatexMathDimensional: TMenuItem;
    menInsertLatexMathFrac: TMenuItem;
    menInsertLatexMathSqrt: TMenuItem;
    menInsertLatexMathSqrtn: TMenuItem;
    menInsertRAssignment: TMenuItem;
    menInsertRAssignmentLeft: TMenuItem;
    menInsertRAssignmentRight: TMenuItem;
    menMarks: TMenuItem;
    menMarksBlock: TMenuItem;
    menMarksMark: TMenuItem;
    menMarksUnmark: TMenuItem;
    menMarksUnmarkAll: TMenuItem;
    menOptionAlwaysOnTop: TMenuItem;
    menOptionColorPreference: TMenuItem;
    menOptionEcho: TMenuItem;
    menOptionGoBack: TMenuItem;
    menOptionReadOnlyToggle: TMenuItem;
    menOptions: TMenuItem;
    menOptionsApplication: TMenuItem;
    menOptionsSelection: TMenuItem;
    menOptionsSelectionColumn: TMenuItem;
    menOptionsSelectionLine: TMenuItem;
    menOptionsSelectionNormal: TMenuItem;
    menOptionsShortcuts: TMenuItem;
    menOptionStartupFileMaximized: TMenuItem;
    menOptionSyntax: TMenuItem;
    menOptionSyntaxDefault: TMenuItem;
    menOptionSyntaxDefaultR: TMenuItem;
    menOptionSyntaxDefaultRComplex: TMenuItem;
    menOptionSyntaxDefaultText: TMenuItem;
    menOptionSyntaxSet: TMenuItem;
    menProject: TMenuItem;
    menProjEdit: TMenuItem;
    menProjFiles: TMenuItem;
    menProjFilesAdd: TMenuItem;
    menProjFilesAddCurrent: TMenuItem;
    menProjFilesCloseAll: TMenuItem;
    menProjFilesCloseAllOfGroup: TMenuItem;
    menProjFilesOpenAll: TMenuItem;
    menProjFilesOpenAllOfGroup: TMenuItem;
    menProjFilesRemove: TMenuItem;
    menProjFilesRemoveAllOfGroup: TMenuItem;
    menProjFilesRemoveAllOfProject: TMenuItem;
    menProjGroup: TMenuItem;
    menProjGroupCollapseAll: TMenuItem;
    menProjGroupDeleteAll: TMenuItem;
    menProjGroupDeleteCurrent: TMenuItem;
    menProjGroupExpandAll: TMenuItem;
    menProjGroupNew: TMenuItem;
    menProjGroupRename: TMenuItem;
    menProjProject: TMenuItem;
    menProjProjectClose: TMenuItem;
    menProjProjectDeleteCurrent: TMenuItem;
    menProjProjectNew: TMenuItem;
    menProjProjectOpen: TMenuItem;
    menProjProjectOpenDemo: TMenuItem;
    menProjProjectSave: TMenuItem;
    menProjProjectSaveAs: TMenuItem;
    menProjRecent: TMenuItem;
    menProjReload: TMenuItem;
    menR: TMenuItem;
    menRget_Info: TMenuItem;
    menRguiStartClose: TMenuItem;
    menRHotKeys: TMenuItem;
    menRmirrors_update: TMenuItem;
    menRPackages: TMenuItem;
    menRPackagesInstall: TMenuItem;
    menRPackagesInstalled: TMenuItem;
    menRPackagesInstallfromZip: TMenuItem;
    menRPackagesInstallTinnRcom: TMenuItem;
    menRPackagesLoad: TMenuItem;
    menRPackagesLoadTinnRcom: TMenuItem;
    menRPackagesNew: TMenuItem;
    menRPackagesRemove: TMenuItem;
    menRPackagesStatus: TMenuItem;
    menRPackagesUpdate: TMenuItem;
    menRServer: TMenuItem;
    menRSet_trPaths: TMenuItem;
    menRStartClose: TMenuItem;
    menRterm: TMenuItem;
    menRtermFile: TMenuItem;
    menRtermFileIO: TMenuItem;
    menRtermFileIOPrint: TMenuItem;
    menRtermFileIOSave: TMenuItem;
    menRtermFileIOSaveAs: TMenuItem;
    menRtermFileLog: TMenuItem;
    menRtermFileLogPrint: TMenuItem;
    menRtermFileLogSave: TMenuItem;
    menRtermFileLogSaveAs: TMenuItem;
    menRtermFocus: TMenuItem;
    menRtermFocusConsole: TMenuItem;
    menRtermFocusEditor: TMenuItem;
    menRtermFocusLog: TMenuItem;
    menRtermFont: TMenuItem;
    menRtermHighlighter: TMenuItem;
    menRtermHistory: TMenuItem;
    menRtermHistoryLoad: TMenuItem;
    menRtermHistoryNext: TMenuItem;
    menRtermHistoryPrior: TMenuItem;
    menRtermHistorySave: TMenuItem;
    menRtermLineWrap: TMenuItem;
    menRtermShowHide: TMenuItem;
    menRtermSize: TMenuItem;
    menRtermSizeMaximize: TMenuItem;
    menRtermSplit: TMenuItem;
    menRtermSplitHorizontal: TMenuItem;
    menRtermSplitRemove: TMenuItem;
    menRtermSplitVertical: TMenuItem;
    menRtermStartClose: TMenuItem;
    menRtermSyntaxIO: TMenuItem;
    menRtermSyntaxIOR: TMenuItem;
    menRtermSyntaxIOText: TMenuItem;
    menRtermSyntaxLog: TMenuItem;
    menRtermSyntaxLogR: TMenuItem;
    menRtermSyntaxLogText: TMenuItem;
    menRtermWorkspace: TMenuItem;
    menRtermWorkspaceLoad: TMenuItem;
    menRtermWorkspaceSave: TMenuItem;
    menSearch: TMenuItem;
    menSearchFind: TMenuItem;
    menSearchFindAgain: TMenuItem;
    menSearchGoTo: TMenuItem;
    menSearchInFiles: TMenuItem;
    menSearchReplace: TMenuItem;
    menSendToR: TMenuItem;
    menSendToRAll: TMenuItem;
    menSendToRBlockMarked: TMenuItem;
    menSendToRCursorToBegginingLine: TMenuItem;
    menSendToRCursorToEndLine: TMenuItem;
    menSendToRKnitr: TMenuItem;
    menSendToRLine: TMenuItem;
    menSendToRLinesToEndPage: TMenuItem;
    menSendToRSelection: TMenuItem;
    menTools: TMenuItem;
    menToolsAsciiChart: TMenuItem;
    menToolsBackup: TMenuItem;
    menToolsBackupDatabase: TMenuItem;
    menToolsBackupSystem: TMenuItem;
    menToolsCompilation: TMenuItem;
    menToolsCompilationLaTeXToDviBibtex: TMenuItem;
    menToolsCompilationLaTeXToDviSingle: TMenuItem;
    menToolsCompilationLaTeXToPdfBibtex: TMenuItem;
    menToolsCompilationLaTeXToPdfSingle: TMenuItem;
    menToolsCompilationMinimized: TMenuItem;
    menToolsConversion: TMenuItem;
    menToolsConversionDeplateTo: TMenuItem;
    menToolsConversionDeplateToDbkarticle: TMenuItem;
    menToolsConversionDeplateToDbkbook: TMenuItem;
    menToolsConversionDeplateToDbkref: TMenuItem;
    menToolsConversionDeplateToHtml: TMenuItem;
    menToolsConversionDeplateToHtmlsite: TMenuItem;
    menToolsConversionDeplateToHtmlslides: TMenuItem;
    menToolsConversionDeplateToLaTeX: TMenuItem;
    menToolsConversionDeplateToLaTeXdramastic: TMenuItem;
    menToolsConversionDeplateToPhp: TMenuItem;
    menToolsConversionDeplateToPlain: TMenuItem;
    menToolsConversionDeplateToSweave: TMenuItem;
    menToolsConversionDeplateToXhtml10: TMenuItem;
    menToolsConversionDeplateToXhtml11: TMenuItem;
    menToolsConversionPandoc: TMenuItem;
    menToolsConversionTxt2tagsTo: TMenuItem;
    menToolsConversionTxt2tagsToHtml: TMenuItem;
    menToolsConversionTxt2tagsToLatex: TMenuItem;
    menToolsConversionTxt2tagsToSweave: TMenuItem;
    menToolsDatabase: TMenuItem;
    menToolsDatabaseCardR: TMenuItem;
    menToolsDatabaseComments: TMenuItem;
    menToolsDatabaseCompletion: TMenuItem;
    menToolsDatabaseMirrorsR: TMenuItem;
    menToolsDatabaseShortcuts: TMenuItem;
    menToolsDifferences: TMenuItem;
    menToolsMacro: TMenuItem;
    menToolsMacroPlay: TMenuItem;
    menToolsMacroRecord: TMenuItem;
    menToolsMatchBracket: TMenuItem;
    menToolsProcessing: TMenuItem;
    menToolsRestore: TMenuItem;
    menToolsRestoreDatabase: TMenuItem;
    menToolsRestoreSystem: TMenuItem;
    menToolsSort: TMenuItem;
    menToolsSortDate: TMenuItem;
    menToolsSortNumber: TMenuItem;
    menToolsSortString: TMenuItem;
    menToolsSpell: TMenuItem;
    menToolsUtils: TMenuItem;
    menToolsUtilsActionlistToClipboard: TMenuItem;
    menToolsUtilsActionlistToDataset: TMenuItem;
    menToolsUtilsDatasetToActionlist: TMenuItem;
    menToolsUtilsStringReplace: TMenuItem;
    menToolsUtilsTesteRegex: TMenuItem;
    menToolsViewer: TMenuItem;
    menToolsViewerDvi: TMenuItem;
    menToolsViewerDviOpenAlways: TMenuItem;
    menToolsViewerDviOpenFile: TMenuItem;
    menToolsViewerHtml: TMenuItem;
    menToolsViewerHtmlOpenAlways: TMenuItem;
    menToolsViewerHtmlOpenCurrent: TMenuItem;
    menToolsViewerHtmlOpenFile: TMenuItem;
    menToolsViewerPdf: TMenuItem;
    menToolsViewerPdfOpenAlways: TMenuItem;
    menToolsViewerPdfOpenFile: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    menView: TMenuItem;
    menViewDecrease: TMenuItem;
    menViewFont: TMenuItem;
    menViewGutter: TMenuItem;
    menViewIncrease: TMenuItem;
    menViewLineNumbers: TMenuItem;
    menViewR: TMenuItem;
    menViewROrganizeScreen: TMenuItem;
    menViewRterm: TMenuItem;
    menViewRtermShowHide: TMenuItem;
    menViewRtermSize: TMenuItem;
    menViewRtermSizeDivide: TMenuItem;
    menViewRtermSizeMaximize: TMenuItem;
    menViewRtermSizeMinimize: TMenuItem;
    menViewRtermSplit: TMenuItem;
    menViewRtermSplitHorizontal: TMenuItem;
    menViewRtermSplitRemove: TMenuItem;
    menViewRtermSplitVertical: TMenuItem;
    menViewRtermSyntax: TMenuItem;
    menViewRtermSyntaxIO: TMenuItem;
    menViewRtermSyntaxIOR: TMenuItem;
    menViewRtermSyntaxIOText: TMenuItem;
    menViewRtermSyntaxLog: TMenuItem;
    menViewRtermSyntaxLogR: TMenuItem;
    menViewRtermSyntaxLogText: TMenuItem;
    menViewSpecialCharacters: TMenuItem;
    menViewSplit: TMenuItem;
    menViewSplitHorizontal: TMenuItem;
    menViewSplitRemove: TMenuItem;
    menViewSplitVertical: TMenuItem;
    menViewStatusBar: TMenuItem;
    menViewTabs: TMenuItem;
    menViewTabsFiles: TMenuItem;
    menViewTabsFilesVisible: TMenuItem;
    menViewTabsRterm: TMenuItem;
    menViewTabsTools: TMenuItem;
    menViewToolbars: TMenuItem;
    menViewToolbarsEdit: TMenuItem;
    menViewToolbarsFile: TMenuItem;
    menViewToolbarsFilter: TMenuItem;
    menViewToolbarsFormat: TMenuItem;
    menViewToolbarsMacro: TMenuItem;
    menViewToolbarsMisc: TMenuItem;
    menViewToolbarsProcessing: TMenuItem;
    menViewToolbarsR: TMenuItem;
    menViewToolbarsSearch: TMenuItem;
    menViewToolbarsSpell: TMenuItem;
    menViewToolbarsSyntax: TMenuItem;
    menViewToolbarsView: TMenuItem;
    menViewTools: TMenuItem;
    menViewToolsRes: TMenuItem;
    menViewToolsResDatabase: TMenuItem;
    menViewToolsResMarkup: TMenuItem;
    menViewToolsResMarkupLatex: TMenuItem;
    menViewToolsResMarkupMarkup: TMenuItem;
    menViewToolsResMarkupTxt2tags: TMenuItem;
    menViewToolsResMisc: TMenuItem;
    menViewToolsResR: TMenuItem;
    menViewToolsResResults: TMenuItem;
    menViewToolsResShortcuts: TMenuItem;
    menViewToolsResSpeel: TMenuItem;
    menViewToolsSize: TMenuItem;
    menViewToolsVisibleToggle: TMenuItem;
    menViewToolsWidthDivide: TMenuItem;
    menViewToolsWidthMaximize: TMenuItem;
    menViewToolsWidthMinimize: TMenuItem;
    menWeb: TMenuItem;
    menWebR_help: TMenuItem;
    menWebRgui: TMenuItem;
    menWebRguiRComander: TMenuItem;
    menWebRGuiRStudio: TMenuItem;
    menWebRguiTinnR: TMenuItem;
    menWebRGuiTinnRLEC: TMenuItem;
    menWebRguiTinnRSourceForge: TMenuItem;
    menWebRGuiTinnRUserList: TMenuItem;
    menWebRInformation: TMenuItem;
    menWebRInformationsBioconductor: TMenuItem;
    menWebRInformationsCRAN: TMenuItem;
    menWebRInformationsNews: TMenuItem;
    menWebRInformationsOmega: TMenuItem;
    menWebRInformationsRWiki: TMenuItem;
    menWebRInformationsTutorial: TMenuItem;
    menWebRInformationsWebSite: TMenuItem;
    menWebRInformationsZoonekynd: TMenuItem;
    menWebRSearch: TMenuItem;
    menWebRSearchHelpForR: TMenuItem;
    menWebRSearchMailingListArchives: TMenuItem;
    menWebRSearchNabble: TMenuItem;
    menWebRSearchNabbleR: TMenuItem;
    menWebRSearchNabbleRbr: TMenuItem;
    menWebRSearchRseek: TMenuItem;
    menWebRSearchSel: TMenuItem;
    menWebRSearchSite: TMenuItem;
    menWebSearchSelGoogle: TMenuItem;
    menWebSearchSelRArchives: TMenuItem;
    menWebSearchSelRSite: TMenuItem;
    menWebStat: TMenuItem;
    menWebStatVirtualLab: TMenuItem;
    menWebStatVirtualLabRice: TMenuItem;
    menWebStatVirtualLabVESTAC: TMenuItem;
    menWebStatVirtualStatisticalJava: TMenuItem;
    menWebStatVLPS: TMenuItem;
    menWebtProcessing: TMenuItem;
    menWebtProcessingDeplate: TMenuItem;
    menWebtProcessingMikTeX: TMenuItem;
    menWebtProcessingPandoc: TMenuItem;
    menWebtProcessingTxt2tags: TMenuItem;
    menWindow: TMenuItem;
    menWindowArrangeIcons: TMenuItem;
    menWindowCascade: TMenuItem;
    menWindowMinimizeAll: TMenuItem;
    menWindowTileHorizontally: TMenuItem;
    menWindowTileVertically: TMenuItem;
    Miscshowhide1: TMenuItem;
    mmenRtermSizeDivide: TMenuItem;
    mmenRtermSizeMinimize: TMenuItem;
    MoinMoin1: TMenuItem;
    N1: TMenuItem;
    N10: TMenuItem;
    N100: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    N102_OLD: TMenuItem;
    N103: TMenuItem;
    N104: TMenuItem;
    N105: TMenuItem;
    N106: TMenuItem;
    N107: TMenuItem;
    N108: TMenuItem;
    N109: TMenuItem;
    N11: TMenuItem;
    N110: TMenuItem;
    N111: TMenuItem;
    N112: TMenuItem;
    N113: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    N117: TMenuItem;
    N118: TMenuItem;
    N119: TMenuItem;
    N120: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    N125: TMenuItem;
    N126: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    N129: TMenuItem;
    N13: TMenuItem;
    N130: TMenuItem;
    N131: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    N135: TMenuItem;
    N136: TMenuItem;
    N138: TMenuItem;
    N139: TMenuItem;
    N14: TMenuItem;
    N140: TMenuItem;
    N141: TMenuItem;
    N142: TMenuItem;
    N143: TMenuItem;
    N144: TMenuItem;
    N145: TMenuItem;
    N146: TMenuItem;
    N147: TMenuItem;
    N148: TMenuItem;
    N149: TMenuItem;
    N15: TMenuItem;
    N150: TMenuItem;
    N151: TMenuItem;
    N152: TMenuItem;
    N153: TMenuItem;
    N154: TMenuItem;
    N155: TMenuItem;
    N156: TMenuItem;
    N157: TMenuItem;
    N158: TMenuItem;
    N159: TMenuItem;
    N16: TMenuItem;
    N160: TMenuItem;
    N161: TMenuItem;
    N162: TMenuItem;
    N163: TMenuItem;
    N164: TMenuItem;
    N165: TMenuItem;
    N166: TMenuItem;
    N167: TMenuItem;
    N168: TMenuItem;
    N169: TMenuItem;
    N17: TMenuItem;
    N170: TMenuItem;
    N171: TMenuItem;
    N172: TMenuItem;
    N174: TMenuItem;
    N175: TMenuItem;
    N176: TMenuItem;
    N177: TMenuItem;
    N178: TMenuItem;
    N179: TMenuItem;
    N18: TMenuItem;
    N180: TMenuItem;
    N181: TMenuItem;
    N182: TMenuItem;
    N183: TMenuItem;
    N185: TMenuItem;
    N186: TMenuItem;
    N187: TMenuItem;
    N188: TMenuItem;
    N19: TMenuItem;
    N190: TMenuItem;
    N191: TMenuItem;
    N192: TMenuItem;
    N193: TMenuItem;
    N194: TMenuItem;
    N195: TMenuItem;
    N196: TMenuItem;
    N197: TMenuItem;
    N198: TMenuItem;
    N199: TMenuItem;
    N2: TMenuItem;
    N20: TMenuItem;
    N200: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N3: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N34: TMenuItem;
    N34_OLD: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N37_OLD: TMenuItem;
    N38: TMenuItem;
    N38_OLD: TMenuItem;
    N39: TMenuItem;
    N4: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N43_OLD: TMenuItem;
    N44: TMenuItem;
    N44_OLD: TMenuItem;
    N45: TMenuItem;
    n45_OLD: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N47_OLD: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N5: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N56_OLD: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N59_OLD: TMenuItem;
    N6: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N7: TMenuItem;
    N70: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N8: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N9: TMenuItem;
    N90: TMenuItem;
    N91: TMenuItem;
    N92: TMenuItem;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    N98: TMenuItem;
    N99: TMenuItem;
    odMain: TOpenDialog;
    oolsdivide1: TMenuItem;
    oolsmaximize1: TMenuItem;
    oolsminimize1: TMenuItem;
    oolsshowhide1: TMenuItem;
    op1: TMenuItem;
    op2: TMenuItem;
    op3: TMenuItem;
    Openallselectedgroup1: TMenuItem;
    Opennode1: TMenuItem;
    OpenURLactive1: TMenuItem;
    OpenURLcurrent1: TMenuItem;
    OrganizescreenTinnRRgui1: TMenuItem;
    PageMaker1: TMenuItem;
    Panel1: TPanel;
    panInvisibleParent: TPanel;
    panProjectDockSite: TPanel;
    pgFiles: TJvgPageControl;
    pmemIOClear: TMenuItem;
    pmemIOClearIO: TMenuItem;
    pmemIOClearIOLog: TMenuItem;
    pmemIOCopy: TMenuItem;
    pmemIOCut: TMenuItem;
    pmemIOEdit: TMenuItem;
    pmemIOFile: TMenuItem;
    pmemIOFilePrint: TMenuItem;
    pmemIOFileSave: TMenuItem;
    pmemIOFileSaveAs: TMenuItem;
    pmemIOFocus: TMenuItem;
    pmemIOFont: TMenuItem;
    pmemIOFontDecrease: TMenuItem;
    pmemIOFontIncrease: TMenuItem;
    pmemIOHistory: TMenuItem;
    pmemIOHistoryLoad: TMenuItem;
    pmemIOHistoryNext: TMenuItem;
    pmemIOHistoryPrior: TMenuItem;
    pmemIOHistorySave: TMenuItem;
    pmemIOLineWrap: TMenuItem;
    pmemIOPaste: TMenuItem;
    pmemIORedo: TMenuItem;
    pmemIOSelectAll: TMenuItem;
    pmemIOSetFocusConsole: TMenuItem;
    pmemIOSetFocusEditor: TMenuItem;
    pmemIOSetFocusLog: TMenuItem;
    pmemIOSHighlighter: TMenuItem;
    pmemIOShowHide: TMenuItem;
    pmemIOSize: TMenuItem;
    pmemIOSizeDivide: TMenuItem;
    pmemIOSizeMaximize: TMenuItem;
    pmemIOSizeMinimize: TMenuItem;
    pmemIOSplit: TMenuItem;
    pmemIOSplitHorizontal: TMenuItem;
    pmemIOSplitRemove: TMenuItem;
    pmemIOSplitVertical: TMenuItem;
    pmemIOSyntaxR: TMenuItem;
    pmemIOSyntaxText: TMenuItem;
    pmemIOUndo: TMenuItem;
    pmemIOWorkspace: TMenuItem;
    pmemIOWorkspaceLoad: TMenuItem;
    pmemIOWorkspaceSave: TMenuItem;
    pmemLogClear: TMenuItem;
    pmemLogClearIOLog: TMenuItem;
    pmemLogClearLog: TMenuItem;
    pmemLogEdit: TMenuItem;
    pmemLogEditCopy: TMenuItem;
    pmemLogEditCut: TMenuItem;
    pmemLogEditPaste: TMenuItem;
    pmemLogEditRedo: TMenuItem;
    pmemLogEditSelectAll: TMenuItem;
    pmemLogEditUndo: TMenuItem;
    pmemLogFile: TMenuItem;
    pmemLogFilePrint: TMenuItem;
    pmemLogFileSave: TMenuItem;
    pmemLogFileSaveAs: TMenuItem;
    pmemLogFocus: TMenuItem;
    pmemLogFocusEditor: TMenuItem;
    pmemLogFocusIO: TMenuItem;
    pmemLogFocusLog: TMenuItem;
    pmemLogHighlighter: TMenuItem;
    pmemLogLineWrap: TMenuItem;
    pmemLogShowHide: TMenuItem;
    pmemLogSize: TMenuItem;
    pmemLogSizeDivide: TMenuItem;
    pmemLogSizeMaximize: TMenuItem;
    pmemLogSizeMinimize: TMenuItem;
    pmemLogSplit: TMenuItem;
    pmemLogSplitRemove: TMenuItem;
    pmemLogSplittHorizontal: TMenuItem;
    pmemLogSplitVertical: TMenuItem;
    pmemLogSyntaxR: TMenuItem;
    pmemLogSyntaxText: TMenuItem;
    pmemRResCurrentLineToTop: TMenuItem;
    pmemRResSendBlockMarked: TMenuItem;
    pmemRResSendClipboard: TMenuItem;
    pmemRResSendContiguous: TMenuItem;
    pmemRResSendCursorToBeginningLine: TMenuItem;
    pmemRResSendCursorToEndLine: TMenuItem;
    pmemRResSendFile: TMenuItem;
    pmemRResSendKnitr: TMenuItem;
    pmemRResSendLine: TMenuItem;
    pmemRResSendLinesToEndPage: TMenuItem;
    pmemRResSendSelection: TMenuItem;
    pmemRResSendSweave: TMenuItem;
    pmemSpellClearAll: TMenuItem;
    pmemSpellCopy: TMenuItem;
    pmemSpellCut: TMenuItem;
    pmemSpellDelete: TMenuItem;
    pmemSpellFont: TMenuItem;
    pmemSpellFontDecrease: TMenuItem;
    pmemSpellFontIncrease: TMenuItem;
    pmemSpellPaste: TMenuItem;
    pmemSpellSelectAll: TMenuItem;
    pmenComments: TJvPopupMenu;
    pmenCompletion: TJvPopupMenu;
    pmenCompletionMemo: TJvPopupMenu;
    pmenEditor: TJvPopupMenu;
    pmenEditorClose: TMenuItem;
    pmenEditorCloseAll: TMenuItem;
    pmenEditorCloseLeft: TMenuItem;
    pmenEditorCloseMore: TMenuItem;
    pmenEditorCloseOthers: TMenuItem;
    pmenEditorCloseRight: TMenuItem;
    pmenEditorComment: TMenuItem;
    pmenEditorCopy: TMenuItem;
    pmenEditorCopyFormatted: TMenuItem;
    pmenEditorCount: TMenuItem;
    pmenEditorCut: TMenuItem;
    pmenEditorEdit: TMenuItem;
    pmenEditorFile: TMenuItem;
    pmenEditorFont: TMenuItem;
    pmenEditorFontDec: TMenuItem;
    pmenEditorFontInc: TMenuItem;
    pmenEditorFormat: TMenuItem;
    pmenEditorFormatReformat: TMenuItem;
    pmenEditorFormatSelection: TMenuItem;
    pmenEditorFormatWord: TMenuItem;
    pmenEditorLineWrap: TMenuItem;
    pmenEditorPaste: TMenuItem;
    pmenEditorPrint: TMenuItem;
    pmenEditorReadOnly: TMenuItem;
    pmenEditorRedo: TMenuItem;
    pmenEditorReload: TMenuItem;
    pmenEditorSave: TMenuItem;
    pmenEditorSaveAll: TMenuItem;
    pmenEditorSaveAs: TMenuItem;
    pmenEditorSelectAll: TMenuItem;
    pmenEditorSort: TMenuItem;
    pmenEditorSortDate: TMenuItem;
    pmenEditorSortNumber: TMenuItem;
    pmenEditorSortString: TMenuItem;
    pmenEditorSpell: TMenuItem;
    pmenEditorUncommentAll: TMenuItem;
    pmenEditorUncommentFirsts: TMenuItem;
    pmenEditorUndo: TMenuItem;
    pmenFilePath: TMenuItem;
    pmenFilePathUnix: TMenuItem;
    pmenFilePathWindows: TMenuItem;
    pmenFiles_OLD: TMenuItem;
    pmenFilesAdd_OLD: TMenuItem;
    pmenFilesAddCurrent_OLD: TMenuItem;
    pmenFilesCloseAll_OLD: TMenuItem;
    pmenFilesDeleteAllOfGroup_OLD: TMenuItem;
    pmenFilesDeleteAllOfProject_OLD: TMenuItem;
    pmenFilesDeleteCurrent_OLD: TMenuItem;
    pmenFilesFullPath: TMenuItem;
    pmenFilesFullPathUnix: TMenuItem;
    pmenFilesFullPathWindows: TMenuItem;
    pmenFilesOpenAll_OLD: TMenuItem;
    pmenFontGeneric: TJvPopupMenu;
    pmenGenericFont: TMenuItem;
    pmenGenericFontDecrease: TMenuItem;
    pmenGenericFontIncrease: TMenuItem;
    pmenGroup_OLD: TMenuItem;
    pmenGroupCollapseAll: TMenuItem;
    pmenGroupDeleteAll_OLD: TMenuItem;
    pmenGroupDeleteCurrent_OLD: TMenuItem;
    pmenGroupExpandAll: TMenuItem;
    pmenGroupNew_OLD: TMenuItem;
    pmenGroupRename_OLD: TMenuItem;
    pmenIO: TJvPopupMenu;
    pmenLOG: TJvPopupMenu;
    pmenLogFont: TMenuItem;
    pmenLogFontDecrease: TMenuItem;
    pmenLogFontIncrease: TMenuItem;
    pmenMainMRU: TJvPopupMenu;
    pmenPgFiles: TJvPopupMenu;
    pmenPgFilesCloseActive: TMenuItem;
    pmenPgFilesCloseAll: TMenuItem;
    pmenPgFilesCloseLeft: TMenuItem;
    pmenPgFilesCloseOthers: TMenuItem;
    pmenPgFilesCloseRight: TMenuItem;
    pmenProject_OLD: TMenuItem;
    pmenProjectClose_OLD: TMenuItem;
    pmenProjectDeleteCurrent_OLD: TMenuItem;
    pmenProjectMRU: TJvPopupMenu;
    pmenProjects: TJvPopupMenu;
    pmenProjectSave_OLD: TMenuItem;
    pmenProjectSaveAs_OLD: TMenuItem;
    pmenProjFont: TMenuItem;
    pmenProjFontDecrease: TMenuItem;
    pmenProjFontIncrease: TMenuItem;
    pmenProjNew_OLD: TMenuItem;
    pmenProjOpen_OLD: TMenuItem;
    pmenProjR: TMenuItem;
    pmenProjRSendToR: TMenuItem;
    pmenProjRSetWorkDir: TMenuItem;
    pmenRcard: TJvPopupMenu;
    pmenRcardCopyDescrition: TMenuItem;
    pmenRcardCopyFunction: TMenuItem;
    pmenRcardEdit: TMenuItem;
    pmenRcardEditExample: TMenuItem;
    pmenRcardFont: TMenuItem;
    pmenRcardFontDecrease: TMenuItem;
    pmenRcardFontIncrease: TMenuItem;
    pmenRcardHelp: TMenuItem;
    pmenRcardMemo: TJvPopupMenu;
    pmenRcardMemoCopy: TMenuItem;
    pmenRcardMemoFont: TMenuItem;
    pmenRcardMemoFontDecrease: TMenuItem;
    pmenRcardMemoFontIncrease: TMenuItem;
    pmenResultsFont: TMenuItem;
    pmenResultsFontDecrease: TMenuItem;
    pmenResultsFontIncrease: TMenuItem;
    pmenResultsNewSearch: TMenuItem;
    pmenResultsOpenLink: TMenuItem;
    pmenRExplorer: TJvPopupMenu;
    pmenRexplorerBasic: TMenuItem;
    pmenRexplorerContent: TMenuItem;
    pmenRexplorerContentCopyAscii: TMenuItem;
    pmenRexplorerContentCopyRaw: TMenuItem;
    pmenRexplorerEdit: TMenuItem;
    pmenRexplorerExample: TMenuItem;
    pmenRexplorerFix: TMenuItem;
    pmenRexplorerFont: TMenuItem;
    pmenRexplorerFontDecrease: TMenuItem;
    pmenRexplorerFontIncrease: TMenuItem;
    pmenRexplorerHelp: TMenuItem;
    pmenRexplorerName: TMenuItem;
    pmenRexplorerNames: TMenuItem;
    pmenRexplorerNameSendToClipboard: TMenuItem;
    pmenRexplorerNameSendToEditor: TMenuItem;
    pmenRexplorerNameSendToR: TMenuItem;
    pmenRexplorerPlot: TMenuItem;
    pmenRexplorerRemove: TMenuItem;
    pmenRexplorerRemoveAllObjects: TMenuItem;
    pmenRexplorerStructure: TMenuItem;
    pmenRexplorerStyle: TMenuItem;
    pmenRexplorerSummary: TMenuItem;
    pmenRmirrors: TJvPopupMenu;
    pmenRRes: TJvPopupMenu;
    pmenRResCont: TMenuItem;
    pmenRResContClearAll: TMenuItem;
    pmenRResContClearConsole: TMenuItem;
    pmenRResContCloseAllGraphics: TMenuItem;
    pmenRResContEditVariable: TMenuItem;
    pmenRResContEscape: TMenuItem;
    pmenRResContExampleSelectedWord: TMenuItem;
    pmenRResContFixVariable: TMenuItem;
    pmenRResContGuiPuTTYStartClose: TMenuItem;
    pmenRResContHelp: TMenuItem;
    pmenRResContHelpSelectedWord: TMenuItem;
    pmenRResContListAllObjects: TMenuItem;
    pmenRResContListVariableNames: TMenuItem;
    pmenRResContListVariableStructure: TMenuItem;
    pmenRResContPackages: TMenuItem;
    pmenRResContPlotVariable: TMenuItem;
    pmenRResContPrintVariableContent: TMenuItem;
    pmenRResContRemoveAllObjects: TMenuItem;
    pmenRResContSetWorkDirectory: TMenuItem;
    pmenRResContTCPConnection: TMenuItem;
    pmenRResContTermStartClose: TMenuItem;
    pmenRResSend: TMenuItem;
    pmenSearch: TJvPopupMenu;
    pmenShortcuts: TJvPopupMenu;
    pmenSpell: TJvPopupMenu;
    pmenViewToolbars: TJvPopupMenu;
    pmenViewToolbarsEdit: TMenuItem;
    pmenViewToolbarsFile: TMenuItem;
    pmenViewToolbarsFilter: TMenuItem;
    pmenViewToolbarsFormat: TMenuItem;
    pmenViewToolbarsMacro: TMenuItem;
    pmenViewToolbarsMisc: TMenuItem;
    pmenViewToolbarsProcessing: TMenuItem;
    pmenViewToolbarsR: TMenuItem;
    pmenViewToolbarsSearch: TMenuItem;
    pmenViewToolbarsShowall: TMenuItem;
    pmenViewToolbarsSpell: TMenuItem;
    pmenViewToolbarsSyntax: TMenuItem;
    pmenViewToolbarsView: TMenuItem;
    pmenWinExplorerFiles: TJvPopupMenu;
    pmenWinExplorerFilesFont: TMenuItem;
    pmenWinExplorerFilesFontDecrease: TMenuItem;
    pmenWinExplorerFilesFontIncrease: TMenuItem;
    pmenWinExplorerFilesRefresh: TMenuItem;
    pmenWinExplorerFolders: TJvPopupMenu;
    pmenWinExplorerFoldersFont: TMenuItem;
    pmenWinExplorerFoldersFontDecrease: TMenuItem;
    pmenWinExplorerFoldersFontIncrease: TMenuItem;
    pmenWinExplorerFoldersRefresh: TMenuItem;
    pmenWorkExplorerFiles: TJvPopupMenu;
    pmenWorkExplorerFilesFont: TMenuItem;
    pmenWorkExplorerFilesFontDecrease: TMenuItem;
    pmenWorkExplorerFilesFontIncrease: TMenuItem;
    pmenWorkExplorerFilesRefresh: TMenuItem;
    pmenWorkExplorerFolders: TJvPopupMenu;
    pmenWorkExplorerFoldersFont: TMenuItem;
    pmenWorkExplorerFoldersFontDecrease: TMenuItem;
    pmenWorkExplorerFoldersFontIncrease: TMenuItem;
    pmenWorkExplorerFoldersRefresh: TMenuItem;
    popEditorCopyFormattedHtml: TMenuItem;
    popEditorCopyFormattedRtf: TMenuItem;
    popEditorCopyFormattedTeX: TMenuItem;
    prDialog: TPrintDialog;
    Project1: TMenuItem;
    ReformatRfileorselection1: TMenuItem;
    Results2: TMenuItem;
    Right1: TMenuItem;
    Right2: TMenuItem;
    Rshowhide1: TMenuItem;
    Rtermautohideonoff1: TMenuItem;
    Rtermautohideonoff2: TMenuItem;
    Rtermdivide1: TMenuItem;
    RtermIOLinewrapshowhide1: TMenuItem;
    RtermIOshowhide1: TMenuItem;
    RtermLogLinewrapshowhide1: TMenuItem;
    RtermLogLinewrapshowhide2: TMenuItem;
    Rtermmaximize1: TMenuItem;
    Rtermminimize1: TMenuItem;
    Rtermshowhide1: TMenuItem;
    sdMain: TSaveDialog;
    Search1: TMenuItem;
    SGML1: TMenuItem;
    Showall1: TMenuItem;
    SpellChecker: TSpellChecker;
    stbMain: TStatusBar;
    Sweave1: TMenuItem;
    synEditor2Tip: TSynCompletionProposal;
    synEditorTip: TSynCompletionProposal;
    synEditPrint: TSynEditPrint;
    SynEditSearch: TSynEditSearch;
    synExporterHtml: TSynExporterHtml;
    synExporterRtf: TSynExporterRtf;
    synExporterTeX: TSynExporterTeX;
    synIOTip: TSynCompletionProposal;
    synMR: TSynMacroRecorder;
    synURIOpener: TSynURIOpener;
    TBDockBottom: TTBDock;
    TBDockLeft: TTBDock;
    TBDockRight: TTBDock;
    tbFilter: TToolButton;
    tbFind: TToolButton;
    tbFindInFiles: TToolButton;
    tbGoto: TToolButton;
    tbiPandoc: TTBItem;
    TBIRtermShowHide: TTBItem;
    TBItem1: TTBItem;
    TBItem10: TTBItem;
    TBItem100: TTBItem;
    TBItem101: TTBItem;
    TBItem102: TTBItem;
    TBItem103: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem2: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    TBItem3: TTBItem;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    TBItem39: TTBItem;
    TBItem4: TTBItem;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    TBItem42: TTBItem;
    TBItem43: TTBItem;
    TBItem44: TTBItem;
    TBItem45: TTBItem;
    TBItem46: TTBItem;
    TBItem48: TTBItem;
    TBItem49: TTBItem;
    TBItem5: TTBItem;
    TBItem50: TTBItem;
    TBItem51: TTBItem;
    TBItem52: TTBItem;
    TBItem53: TTBItem;
    TBItem54: TTBItem;
    TBItem55: TTBItem;
    TBItem56: TTBItem;
    TBItem57: TTBItem;
    TBItem58: TTBItem;
    TBItem59: TTBItem;
    TBItem6: TTBItem;
    TBItem60: TTBItem;
    TBItem61: TTBItem;
    TBItem62: TTBItem;
    TBItem63: TTBItem;
    TBItem64: TTBItem;
    TBItem65: TTBItem;
    TBItem66: TTBItem;
    TBItem7: TTBItem;
    TBItem72: TTBItem;
    TBItem73: TTBItem;
    TBItem74: TTBItem;
    TBItem75: TTBItem;
    TBItem76: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBItem90: TTBItem;
    TBItem91: TTBItem;
    TBItem92: TTBItem;
    TBItem93: TTBItem;
    TBItem94: TTBItem;
    TBItem95: TTBItem;
    TBItem96: TTBItem;
    TBItem98: TTBItem;
    TBItem99: TTBItem;
    tbKnitr: TTBSubmenuItem;
    tbNew: TToolButton;
    tbOnTop: TToolButton;
    tbOpen: TToolButton;
    tbPlay: TToolButton;
    tbPrint: TToolButton;
    TBRClearAll: TTBItem;
    TBRClearConsole: TTBItem;
    TBRCloseAllGraphics: TTBItem;
    TBRCurrentLineToTop: TTBItem;
    TBRDockTop: TTBDock;
    tbRecord: TToolButton;
    tbReload: TToolButton;
    tbReplace: TToolButton;
    tbReturnFocus: TToolButton;
    TBRListAllObjects: TTBItem;
    TBRMain: TTBToolbar;
    TBRRemoveAllObjects: TTBItem;
    TBRREscape: TTBItem;
    TBRRExampleSelectedWord: TTBItem;
    TBRRguiStartToogle: TTBItem;
    TBRRHelp: TTBItem;
    TBRRHelpSelectedWord: TTBItem;
    TBRRListVariableNames: TTBItem;
    TBRRListVariableStructure: TTBItem;
    TBRRPackages: TTBSubmenuItem;
    TBRRPrintVariableContent: TTBItem;
    TBRRTCPIP: TTBItem;
    TBRRtermStartToogle: TTBItem;
    TBRRWarningsErrror: TTBItem;
    TBRSendAll: TTBItem;
    TBRSendBlockMarked: TTBItem;
    TBRSendCursorToBeginningLine: TTBItem;
    TBRSendCursorToEndLine: TTBItem;
    TBRSendLine: TTBItem;
    TBRSendLineToEndPage: TTBItem;
    TBRSendSelection: TTBItem;
    TBRSetWorkDir: TTBItem;
    tbSave: TToolButton;
    tbSaveAll: TToolButton;
    TBSConvertion: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBSeparatorItem15: TTBSeparatorItem;
    TBSeparatorItem16: TTBSeparatorItem;
    TBSeparatorItem17: TTBSeparatorItem;
    TBSeparatorItem18: TTBSeparatorItem;
    TBSeparatorItem19: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem22: TTBSeparatorItem;
    TBSeparatorItem23: TTBSeparatorItem;
    TBSeparatorItem24: TTBSeparatorItem;
    TBSeparatorItem25: TTBSeparatorItem;
    TBSeparatorItem26: TTBSeparatorItem;
    TBSeparatorItem27: TTBSeparatorItem;
    TBSeparatorItem28: TTBSeparatorItem;
    TBSeparatorItem29: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem31: TTBSeparatorItem;
    TBSeparatorItem32: TTBSeparatorItem;
    TBSeparatorItem33: TTBSeparatorItem;
    TBSeparatorItem34: TTBSeparatorItem;
    TBSeparatorItem35: TTBSeparatorItem;
    TBSeparatorItem36: TTBSeparatorItem;
    TBSeparatorItem37: TTBSeparatorItem;
    TBSeparatorItem38: TTBSeparatorItem;
    TBSeparatorItem39: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    tbsMarkBlock: TToolButton;
    TBSMiktex: TTBSubmenuItem;
    tbSpell: TToolButton;
    TBSReformatR: TTBSubmenuItem;
    TBSRtermHeight: TTBSubmenuItem;
    TBSRtermLineWrap: TTBSubmenuItem;
    TBSRtermOptions: TTBSubmenuItem;
    TBSToolsWidth: TTBSubmenuItem;
    TBSubmenuItem10: TTBSubmenuItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBSubmenuItem6: TTBSubmenuItem;
    TBSubmenuItem7: TTBSubmenuItem;
    TBSubmenuItem8: TTBSubmenuItem;
    TBSubmenuItem9: TTBSubmenuItem;
    tbsUnmarkAll: TToolButton;
    tbsUnmarkBlock: TToolButton;
    TBSViewer: TTBSubmenuItem;
    tobEdit: TToolBar;
    tobFile: TToolBar;
    tobFilter: TToolBar;
    tobFormat: TTBToolbar;
    tobMacro: TToolBar;
    tobMisc: TToolBar;
    tobProcessing: TTBToolbar;
    tobSearch: TToolBar;
    tobSpell: TToolBar;
    tobSyntax: TToolBar;
    tobView: TTBToolbar;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    tRRuning: TJvTimer;
    tUpdateOptions: TJvTimer;
    Unindent1: TMenuItem;
    UNIX1: TMenuItem;
    Updatesilently1: TMenuItem;
    UpperCaseSelection1: TMenuItem;
    Uppercaseselection2: TMenuItem;
    UppercaseWord1: TMenuItem;
    Uppercaseword2: TMenuItem;
    UTF16BE1: TMenuItem;
    UTF16LE1: TMenuItem;
    UTF81: TMenuItem;
    Nvim_R_plugin: TMenuItem;
    Wikipedia1: TMenuItem;
    WIN1: TMenuItem;
    Windowsexplorer1: TMenuItem;
    Wordwrap1: TMenuItem;
    Workexpl1: TMenuItem;
    xt1: TMenuItem;
    zipKit: TAbZipKit;
    actOpenCurrentFile: TAction;
    menToolsViewerOpenCurrent: TMenuItem;
    TBItem29: TTBItem;
    actRContOpenExampleSelectedWord: TAction;
    TBItem47: TTBItem;
    Openexampleselected1: TMenuItem;
    actRExplorerOpenExampleSelected: TAction;
    Openexampleselected2: TMenuItem;
    Openexampleselected3: TMenuItem;
    actRtermIO_Text_nML: TAction;
    actRtermIO_R_nML: TAction;
    actRtermLOG_Text_nML: TAction;
    actRtermLOG_R_nML: TAction;
    extnomultlinestring1: TMenuItem;
    Rnomultlinestring1: TMenuItem;
    extnomultlinestring2: TMenuItem;
    Rnomultlinestring2: TMenuItem;
    extnomultlinestring3: TMenuItem;
    Rnomultlinestring3: TMenuItem;
    extnomultlinestring4: TMenuItem;
    Rnomultlinestring4: TMenuItem;
    menWebRGuiRTVS: TMenuItem;
    menHelpStatRJournal: TMenuItem;
    menWebRInformationsMRAN: TMenuItem;
    menHelCheckForUpdate: TMenuItem;
    actRCardOpenExampleSelected: TAction;
    imlRAVailable: TPngImageList;
    actRSendSmart: TAction;
    TBItem67: TTBItem;
    N33: TMenuItem;
    pmemRResSendSmart: TMenuItem;
    menSendToRSmart: TMenuItem;
    ext1: TMenuItem;
    Rnomultlinestring5: TMenuItem;
    extnomultlinestring5: TMenuItem;
    Rnomultlinestring6: TMenuItem;
    imlRSend_Plus: TPngImageList;

    procedure actAboutExecute(Sender: TObject);
    procedure actAlwaysAddBOMExecute(Sender: TObject);
    procedure actANSIExecute(Sender: TObject);
    procedure actAplicationExitExecute(Sender: TObject);
    procedure actApplyToANSIExecute(Sender: TObject);
    procedure actAsciiChartExecute(Sender: TObject);
    procedure actAutoCompletionExecute(Sender: TObject);
    procedure actBackupDatabaseExecute(Sender: TObject);
    procedure actBackupSystemConfigurationExecute(Sender: TObject);
    procedure actBlockMarkExecute(Sender: TObject);
    procedure actBlockUnmarkExecute(Sender: TObject);
    procedure actColorsPreferenceExecute(Sender: TObject);
    procedure actColumnSelectExecute(Sender: TObject);
    procedure actCommentExecute(Sender: TObject);
    procedure actCommentsEditExecute(Sender: TObject);
    procedure actCommentsHelpExecute(Sender: TObject);
    procedure actCompletionCopyDescritionExecute(Sender: TObject);
    procedure actCompletionCopyFunctionExecute(Sender: TObject);
    procedure actCompletionEditExecute(Sender: TObject);
    procedure actCompletionExampleSelectedExecute(Sender: TObject);
    procedure actCompletionExecute(Sender: TObject);
    procedure actCompletionHelpExecute(Sender: TObject);
    procedure actCompletionHelpSelectedExecute(Sender: TObject);
    procedure actCompletionInsertExecute(Sender: TObject);
    procedure actCopyFormattedExecute(Sender: TObject);
    procedure actCopyFormattedHtmlExecute(Sender: TObject);
    procedure actCopyFormattedRtfExecute(Sender: TObject);
    procedure actCopyFormattedTeXExecute(Sender: TObject);
    procedure actCountExecute(Sender: TObject);
    procedure actDatabaseVisibleExecute(Sender: TObject);
    procedure actDataCommentsVisibleExecute(Sender: TObject);
    procedure actDataCompletionVisibleExecute(Sender: TObject);
    procedure actDataRcardVisibleExecute(Sender: TObject);
    procedure actDataRmirrorsVisibleExecute(Sender: TObject);
    procedure actDataShortcutsVisibleExecute(Sender: TObject);
    procedure actDateStampExecute(Sender: TObject);
    procedure actDeplateToDocbookArticleExecute(Sender: TObject);
    procedure actDeplateToDocbookBookExecute(Sender: TObject);
    procedure actDeplateToDocbookReferenceExecute(Sender: TObject);
    procedure actDeplateToHtmlExecute(Sender: TObject);
    procedure actDeplateToHtmlSiteExecute(Sender: TObject);
    procedure actDeplateToHtmlSlidesExecute(Sender: TObject);
    procedure actDeplateToLaTeXDramatistExecute(Sender: TObject);
    procedure actDeplateToLaTeXExecute(Sender: TObject);
    procedure actDeplateToPhpExecute(Sender: TObject);
    procedure actDeplateToPlainExecute(Sender: TObject);
    procedure actDeplateToSweaveExecute(Sender: TObject);
    procedure actDeplateToXhtmlMathMlExecute(Sender: TObject);
    procedure actDeplateToXhtmlTransitionalExecute(Sender: TObject);
    procedure actDifferencesExecute(Sender: TObject);
    procedure actDosMinimizedAlwaysExecute(Sender: TObject);
    procedure actDviOpenAlwaysExecute(Sender: TObject);
    procedure actDviOpenFileExecute(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure actEditCutExecute(Sender: TObject);
    procedure actEditorLineWrapExecute(Sender: TObject);
    procedure actEditPasteExecute(Sender: TObject);
    procedure actEditRedoExecute(Sender: TObject);
    procedure actEditSelectAllExecute(Sender: TObject);
    procedure actEditUndoExecute(Sender: TObject);
    procedure actFileCloseAllExecute(Sender: TObject);
    procedure actFileCloseExecute(Sender: TObject);
    procedure actFileCloseLeftExecute(Sender: TObject);
    procedure actFileCloseOthersExecute(Sender: TObject);
    procedure actFileCloseRightExecute(Sender: TObject);
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actFilesAddCurrentExecute(Sender: TObject);
    procedure actFilesAddExecute(Sender: TObject);
    procedure actFileSaveAllExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actFilesCloseAllExecute(Sender: TObject);
    procedure actFilesCloseAllOfGroupExecute(Sender: TObject);
    procedure actFilesFullPathUnixExecute(Sender: TObject);
    procedure actFilesFullPathWindowsExecute(Sender: TObject);
    procedure actFilesOpenAllExecute(Sender: TObject);
    procedure actFilesOpenAllOfGroupExecute(Sender: TObject);
    procedure actFilesRemoveAllOfGroupExecute(Sender: TObject);
    procedure actFilesRemoveAllOfProjectExecute(Sender: TObject);
    procedure actFilesRemoveExecute(Sender: TObject);
    procedure actFilesTabsBottomExecute(Sender: TObject);
    procedure actFilesTabsTopExecute(Sender: TObject);
    procedure actFindAgainExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actFontDecreaseExecute(Sender: TObject);
    procedure actFontIncreaseExecute(Sender: TObject);
    procedure actFormatRExecute(Sender: TObject);
    procedure actFullPathUnixExecute(Sender: TObject);
    procedure actFullPathWindowsExecute(Sender: TObject);
    procedure actGotoLineExecute(Sender: TObject);
    procedure actGroupCollapseAllExecute(Sender: TObject);
    procedure actGroupDeleteAllExecute(Sender: TObject);
    procedure actGroupDeleteCurrentExecute(Sender: TObject);
    procedure actGroupExpandAllExecute(Sender: TObject);
    procedure actGroupRenameExecute(Sender: TObject);
    procedure actGrouptNewExecute(Sender: TObject);
    procedure actGutterVisibleExecute(Sender: TObject);
    procedure actHexViewerVisibleExecute(Sender: TObject);
    procedure actHtmlOpenAlwaysExecute(Sender: TObject);
    procedure actHtmlOpenCurrentFileExecute(Sender: TObject);
    procedure actHtmlOpenFileExecute(Sender: TObject);
    procedure actIndentBlockExecute(Sender: TObject);
    procedure actIniLogVisibleExecute(Sender: TObject);
    procedure actInvertCaseWordExecute(Sender: TObject);
    procedure actInvertSelectionExecute(Sender: TObject);
    procedure actLatexAlgebricFracExecute(Sender: TObject);
    procedure actLatexAlgebricSqrtExecute(Sender: TObject);
    procedure actLatexAlgebricSqrtNExecute(Sender: TObject);
    procedure actLatexDimensionalExecute(Sender: TObject);
    procedure actLatexMakeIndexExecute(Sender: TObject);
    procedure actLatexToDviBibtexExecute(Sender: TObject);
    procedure actLatexToDviSingleExecute(Sender: TObject);
    procedure actLatexToPdfBibtexExecute(Sender: TObject);
    procedure actLatexToPdfSingleExecute(Sender: TObject);
    procedure actLatexVisibleExecute(Sender: TObject);
    procedure actLineNumbersVisibleExecute(Sender: TObject);
    procedure actLineSelectExecute(Sender: TObject);
    procedure actLowerCaseSelectionExecute(Sender: TObject);
    procedure actLowerCaseWordExecute(Sender: TObject);
    procedure actMACExecute(Sender: TObject);
    procedure actMacroPlayExecute(Sender: TObject);
    procedure actMacroRecordExecute(Sender: TObject);
    procedure actMarkupVisibleExecute(Sender: TObject);
    procedure actMatchBracketExecute(Sender: TObject);
    procedure actMiscVisibleExecute(Sender: TObject);
    procedure actNormalSelectExecute(Sender: TObject);
    procedure actNotification_USExecute(Sender: TObject);
    procedure actNotificationExecute(Sender: TObject);
    procedure actOnTopExecute(Sender: TObject);
    procedure actOpenMaximizedExecute(Sender: TObject);
    procedure actOpenMRUExecute(Sender: TObject);
    procedure actOrganizeScreenExecute(Sender: TObject);
    procedure actPdfOpenAlwaysExecute(Sender: TObject);
    procedure actPdfOpenFileExecute(Sender: TObject);
    procedure actPgFilesVisibleExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actProjectCloseExecute(Sender: TObject);
    procedure actProjectDeleteCurrentExecute(Sender: TObject);
    procedure actProjectEditExecute(Sender: TObject);
    procedure actProjectNewExecute(Sender: TObject);
    procedure actProjectOpenDemoExecute(Sender: TObject);
    procedure actProjectOpenExecute(Sender: TObject);
    procedure actProjectOpenNodeExecute(Sender: TObject);
    procedure actProjectReloadExecute(Sender: TObject);
    procedure actProjectSaveAsExecute(Sender: TObject);
    procedure actProjectSaveExecute(Sender: TObject);
    procedure actProjectVisibleExecute(Sender: TObject);
    procedure actRAssignmentLeftExecute(Sender: TObject);
    procedure actRAssignmentRightExecute(Sender: TObject);
    procedure actRcardCopyDescritionExecute(Sender: TObject);
    procedure actRcardCopyFunctionExecute(Sender: TObject);
    procedure actRcardEditExecute(Sender: TObject);
    procedure actRCardExampleSelectedExecute(Sender: TObject);
    procedure actRCardHelpExecute(Sender: TObject);
    procedure actRCardHelpSelectedExecute(Sender: TObject);
    procedure actRcardInsertExecute(Sender: TObject);
    procedure actRComplexDefaultExecute(Sender: TObject);
    procedure actRContClearAllExecute(Sender: TObject);
    procedure actRContClearConsoleExecute(Sender: TObject);
    procedure actRContCloseAllGraphicsExecute(Sender: TObject);
    procedure actRContEditVariableExecute(Sender: TObject);
    procedure actRContEscapeExecute(Sender: TObject);
    procedure actRContExampleSelectedWordExecute(Sender: TObject);
    procedure actRContFixVariableExecute(Sender: TObject);
    procedure actRContGuiPuTTYStartCloseExecute(Sender: TObject);
    procedure actRContHelpExecute(Sender: TObject);
    procedure actRContHelpSelectedWordExecute(Sender: TObject);
    procedure actRContListAllObjectsExecute(Sender: TObject);
    procedure actRContListVariableNamesExecute(Sender: TObject);
    procedure actRContListVariableStructureExecute(Sender: TObject);
    procedure actRContPacAvailableExecute(Sender: TObject);
    procedure actRContPacInstalledExecute(Sender: TObject);
    procedure actRContPacInstallExecute(Sender: TObject);
    procedure actRContPacInstallZipExecute(Sender: TObject);
    procedure actRContPacInstTinnRcomExecute(Sender: TObject);
    procedure actRContPackagesExecute(Sender: TObject);
    procedure actRContPacLoadExecute(Sender: TObject);
    procedure actRContPacLoadTinnRcomExecute(Sender: TObject);
    procedure actRContPacNewExecute(Sender: TObject);
    procedure actRContPacRemoveExecute(Sender: TObject);
    procedure actRContPacStatusExecute(Sender: TObject);
    procedure actRContPacUpdateExecute(Sender: TObject);
    procedure actRContPlotVariableExecute(Sender: TObject);
    procedure actRContPrintVariableContentExecute(Sender: TObject);
    procedure actRContRemoveAllObjectsExecute(Sender: TObject);
    procedure actRContSetWorkDirectoryExecute(Sender: TObject);
    procedure actRContTCPConnectionExecute(Sender: TObject);
    procedure actRContTermStartCloseExecute(Sender: TObject);
    procedure actRCurrentLineToTopExecute(Sender: TObject);
    procedure actReadOnlyExecute(Sender: TObject);
    procedure actREchoExecute(Sender: TObject);
    procedure actReloadExecute(Sender: TObject);
    procedure actReloadLatexSymbolsExecute(Sender: TObject);
    procedure actREnvironmentRefreshExecute(Sender: TObject);
    procedure actReplaceExecute(Sender: TObject);
    procedure actRestoreDatabaseExecute(Sender: TObject);
    procedure actRestoreSystemConfigurationExecute(Sender: TObject);
    procedure actResultsVisibleExecute(Sender: TObject);
    procedure actRExplorerBasicExecute(Sender: TObject);
    procedure actRExplorerContentExecute(Sender: TObject);
    procedure actRExplorerEditExecute(Sender: TObject);
    procedure actRExplorerExampleSelectedExecute(Sender: TObject);
    procedure actRExplorerExpAsciiExecute(Sender: TObject);
    procedure actRExplorerExpRawExecute(Sender: TObject);
    procedure actRExplorerFixExecute(Sender: TObject);
    procedure actRExplorerHelpExecute(Sender: TObject);
    procedure actRExplorerHelpSelectedExecute(Sender: TObject);
    procedure actRExplorerNamesExecute(Sender: TObject);
    procedure actRExplorerPlotExecute(Sender: TObject);
    procedure actRExplorerRefreshExecute(Sender: TObject);
    procedure actRExplorerRemoveAllObjectsExecute(Sender: TObject);
    procedure actRExplorerRemoveExecute(Sender: TObject);
    procedure actRExplorerSendNameToClipboardExecute(Sender: TObject);
    procedure actRExplorerSendNameToEditorExecute(Sender: TObject);
    procedure actRExplorerStructureExecute(Sender: TObject);
    procedure actRExplorerStyleExecute(Sender: TObject);
    procedure actRExplorerSummaryExecute(Sender: TObject);
    procedure actRExplorerVisibleExecute(Sender: TObject);
    procedure actRFilterRefreshExecute(Sender: TObject);
    procedure actRguiReturnFocusExecute(Sender: TObject);
    procedure actRmirrorsCopyHostExecute(Sender: TObject);
    procedure actRmirrorsCopyURLExecute(Sender: TObject);
    procedure actRmirrorsEditExecute(Sender: TObject);
    procedure actRmirrorsHelpExecute(Sender: TObject);
    procedure actRmirrorsOpenURLCurrentExecute(Sender: TObject);
    procedure actRmirrorsOpenURLDefaultExecute(Sender: TObject);
    procedure actRmirrorsSetReposExecute(Sender: TObject);
    procedure actRmirrorsUpdateExecute(Sender: TObject);
    procedure actRSendBlockMarkedExecute(Sender: TObject);
    procedure actRSendClipboardExecute(Sender: TObject);
    procedure actRSendContiguousExecute(Sender: TObject);
    procedure actRSendCursorToBeginningLineExecute(Sender: TObject);
    procedure actRSendCursorToEndLineExecute(Sender: TObject);
    procedure actRSendFileExecute(Sender: TObject);
    procedure actRSendKnitHtmlExecute(Sender: TObject);
    procedure actRSendKnitPdfExecute(Sender: TObject);
    procedure actRSendLineExecute(Sender: TObject);
    procedure actRSendLinesToEndPageExecute(Sender: TObject);
    procedure actRSendSelectionExecute(Sender: TObject);
    procedure actRSendSourceContiguousExecute(Sender: TObject);
    procedure actRSendSweaveExecute(Sender: TObject);
    procedure actRSimpleDefaultExecute(Sender: TObject);
    procedure actRtermAutoHideExecute(Sender: TObject);
    procedure actRtermDivideExecute(Sender: TObject);
    procedure actRtermEditorSetFocusExecute(Sender: TObject);
    procedure actRtermIOandLOGClearExecute(Sender: TObject);
    procedure actRtermIOClearExecute(Sender: TObject);
    procedure actRtermIOHistoryNextExecute(Sender: TObject);
    procedure actRtermIOHistoryPriorExecute(Sender: TObject);
    procedure actRtermIOLineWrapExecute(Sender: TObject);
    procedure actRtermIOPrintExecute(Sender: TObject);
    procedure actRtermIOSaveAsExecute(Sender: TObject);
    procedure actRtermIOSaveExecute(Sender: TObject);
    procedure actRtermIOSetFocusExecute(Sender: TObject);
    procedure actRtermIOSplitHorizontalExecute(Sender: TObject);
    procedure actRtermIOSplitRemoveExecute(Sender: TObject);
    procedure actRtermIOSplitVerticalExecute(Sender: TObject);
    procedure actRtermLoadHistoryExecute(Sender: TObject);
    procedure actRtermLoadWorkspaceExecute(Sender: TObject);
    procedure actRtermLOGClearExecute(Sender: TObject);
    procedure actRtermLOGLineWrapExecute(Sender: TObject);
    procedure actRtermLOGPrintExecute(Sender: TObject);
    procedure actRtermLOGSaveAsExecute(Sender: TObject);
    procedure actRtermLOGSaveExecute(Sender: TObject);
    procedure actRtermLOGSetFocusExecute(Sender: TObject);
    procedure actRtermMaximizeExecute(Sender: TObject);
    procedure actRtermMinimizeExecute(Sender: TObject);
    procedure actRtermSaveHistoryExecute(Sender: TObject);
    procedure actRtermSaveWorkspaceExecute(Sender: TObject);
    procedure actRtermIO_RExecute(Sender: TObject);
    procedure actRtermIO_TextExecute(Sender: TObject);
    procedure actRtermLOG_RExecute(Sender: TObject);
    procedure actRtermLOG_TextExecute(Sender: TObject);
    procedure actRtermTabsBottomExecute(Sender: TObject);
    procedure actRtermTabsLeftExecute(Sender: TObject);
    procedure actRtermTabsRightExecute(Sender: TObject);
    procedure actRtermTabsTopExecute(Sender: TObject);
    procedure actRtermVisibleExecute(Sender: TObject);
    procedure actRtermWarningErrorExecute(Sender: TObject);
    procedure actRtipInsertExecute(Sender: TObject);
    procedure actRVisibleExecute(Sender: TObject);
    procedure actSearchCollapseAllExecute(Sender: TObject);
    procedure actSearchCollapseOneExecute(Sender: TObject);
    procedure actSearchExpandAllExecute(Sender: TObject);
    procedure actSearchExpandOneExecute(Sender: TObject);
    procedure actSearchInFilesExecute(Sender: TObject);
    procedure actSearchVisibleExecute(Sender: TObject);
    procedure actShortcutsCustomizationSaveExecute(Sender: TObject);
    procedure actShortcutsEditExecute(Sender: TObject);
    procedure actShortcutsHelpExecute(Sender: TObject);
    procedure actShowAllBarsExecute(Sender: TObject);
    procedure actShowAppOptionsExecute(Sender: TObject);
    procedure actSortDateExecute(Sender: TObject);
    procedure actSortNumberExecute(Sender: TObject);
    procedure actSortStringExecute(Sender: TObject);
    procedure actSpecialCharVisibleExecute(Sender: TObject);
    procedure actSpellExecute(Sender: TObject);
    procedure actSpellVisibleExecute(Sender: TObject);
    procedure actSplitHorizontalExecute(Sender: TObject);
    procedure actSplitRemoveExecute(Sender: TObject);
    procedure actSplitVerticalExecute(Sender: TObject);
    procedure actStatusBarVisibleExecute(Sender: TObject);
    procedure actTextDefaultExecute(Sender: TObject);
    procedure actTobEditVisibleExecute(Sender: TObject);
    procedure actTobFilesVisibleExecute(Sender: TObject);
    procedure actTobFilterVisibleExecute(Sender: TObject);
    procedure actTobFormatVisibleExecute(Sender: TObject);
    procedure actTobMacroVisibleExecute(Sender: TObject);
    procedure actTobMiscVisibleExecute(Sender: TObject);
    procedure actTobProcessingVisibleExecute(Sender: TObject);
    procedure actTobRVisibleExecute(Sender: TObject);
    procedure actTobSearchVisibleExecute(Sender: TObject);
    procedure actTobSpellVisibleExecute(Sender: TObject);
    procedure actTobSyntaxVisibleExecute(Sender: TObject);
    procedure actTobViewVisibleExecute(Sender: TObject);
    procedure actToolsAutoHideExecute(Sender: TObject);
    procedure actToolsDivideExecute(Sender: TObject);
    procedure actToolsMaximizeExecute(Sender: TObject);
    procedure actToolsMinimizeExecute(Sender: TObject);
    procedure actToolsTabsBottomExecute(Sender: TObject);
    procedure actToolsTabsLeftExecute(Sender: TObject);
    procedure actToolsTabsRightExecute(Sender: TObject);
    procedure actToolsTabsTopExecute(Sender: TObject);
    procedure actToolsVisibleExecute(Sender: TObject);
    procedure actTxt2tagsToDokuExecute(Sender: TObject);
    procedure actTxt2tagsToGwikiExecute(Sender: TObject);
    procedure actTxt2tagsToHtmlExecute(Sender: TObject);
    procedure actTxt2tagsToLatexExecute(Sender: TObject);
    procedure actTxt2tagsToLoutExecute(Sender: TObject);
    procedure actTxt2tagsToManExecute(Sender: TObject);
    procedure actTxt2tagsToMgpExecute(Sender: TObject);
    procedure actTxt2tagsToMoinExecute(Sender: TObject);
    procedure actTxt2tagsToPm6Execute(Sender: TObject);
    procedure actTxt2tagsToSgmlExecute(Sender: TObject);
    procedure actTxt2tagsToSweaveExecute(Sender: TObject);
    procedure actTxt2tagsToTxtExecute(Sender: TObject);
    procedure actTxt2tagsToWikiExecute(Sender: TObject);
    procedure actTxt2tagsToXhtmlExecute(Sender: TObject);
    procedure actTxt2tagsVisibleExecute(Sender: TObject);
    procedure actUncommentExecute(Sender: TObject);
    procedure actUncommentFirstExecute(Sender: TObject);
    procedure actUnindentBlockExecute(Sender: TObject);
    procedure actUNIXExecute(Sender: TObject);
    procedure actUnmarkAllExecute(Sender: TObject);
    procedure actUpperCaseSelectionExecute(Sender: TObject);
    procedure actUpperCaseWordExecute(Sender: TObject);
    procedure actUTF16BEExecute(Sender: TObject);
    procedure actUTF16LEExecute(Sender: TObject);
    procedure actUTF8Execute(Sender: TObject);
    procedure actWindowArrangeExecute(Sender: TObject);
    procedure actWindowCascadeExecute(Sender: TObject);
    procedure actWindowMinimizeAllExecute(Sender: TObject);
    procedure actWindowTileHorizontalExecute(Sender: TObject);
    procedure actWindowTileVerticalExecute(Sender: TObject);
    procedure actWINExecute(Sender: TObject);
    procedure actWinExplVisibleExecute(Sender: TObject);
    procedure actWorkExplVisibleExecute(Sender: TObject);
    procedure csREnvironmentError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csREnvironmentRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRExplorerError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csRGeneralConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRGeneralDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRGeneralError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csRGeneralRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRtipError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure edFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ESS1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var bCanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure HighlighterSelection(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure LatexAccents(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LatexFont(Sender: TObject);
    procedure LatexFontSize(Sender: TObject);
    procedure LatexFormat(Sender: TObject);
    procedure LatexHeader(Sender: TObject);
    procedure lvRexplorerDblClick(Sender: TObject);
    procedure menEncConUTF8wClick(Sender: TObject);
    procedure menFileTemplateRdocDatasetClick(Sender: TObject);
    procedure menFileTemplateRdocEmptyClick(Sender: TObject);
    procedure menFileTemplateRdocFunctionClick(Sender: TObject);
    procedure menFileTemplateRhtmlClick(Sender: TObject);
    procedure menFileTemplateRmarkdownClick(Sender: TObject);
    procedure menFileTemplateRscriptClick(Sender: TObject);
    procedure menFileTemplateRsweaveClick(Sender: TObject);
    procedure menForEncConANSIClick(Sender: TObject);
    procedure menForEncConUTF16BEClick(Sender: TObject);
    procedure menForEncConUTF16LEClick(Sender: TObject);
    procedure menForEncConUTF8Click(Sender: TObject);
    procedure menForLinEndConMACClick(Sender: TObject);
    procedure menForLinEndConUNIXClick(Sender: TObject);
    procedure menForLinEndConWINClick(Sender: TObject);
    procedure menHelCitationClick(Sender: TObject);
    procedure menHelExampleOfScriptClick(Sender: TObject);
    procedure menHelFileConversionDeplateClick(Sender: TObject);
    procedure menHelFileConversionPandocClick(Sender: TObject);
    procedure menHelFileConversionTxt2tagsClick(Sender: TObject);
    procedure menHelIniFilesClick(Sender: TObject);
    procedure menHelNewsClick(Sender: TObject);
    procedure menHelpEnglishChanges_t2tClick(Sender: TObject);
    procedure menHelpRecognizedWordsClick(Sender: TObject);
    procedure menHelpStatHyperstatClick(Sender: TObject);
    procedure menHelpStatJSSClick(Sender: TObject);
    procedure menHelpStatStatSoftClick(Sender: TObject);
    procedure menHelSecretsClick(Sender: TObject);
    procedure menHelUserGuideClick(Sender: TObject);
    procedure menHelUserListClick(Sender: TObject);
    procedure menOptionsShortcutsClick(Sender: TObject);
    procedure menRget_InfoClick(Sender: TObject);
    procedure menRHotKeysClick(Sender: TObject);
    procedure menRServerClick(Sender: TObject);
    procedure menRSet_trPathsClick(Sender: TObject);
    procedure menRtermHistoryNextClick(Sender: TObject);
    procedure menRtermHistoryPriorClick(Sender: TObject);
    procedure menToolsConversionPandocClick(Sender: TObject);
    procedure menToolsDatabaseCardRClick(Sender: TObject);
    procedure menToolsDatabaseCommentsClick(Sender: TObject);
    procedure menToolsDatabaseCompletionClick(Sender: TObject);
    procedure menToolsDatabaseMirrorsRClick(Sender: TObject);
    procedure menToolsDatabaseShortcutsClick(Sender: TObject);
    procedure menToolsUtilsActionlistToClipboardClick(Sender: TObject);
    procedure menToolsUtilsActionlistToDatasetClick(Sender: TObject);
    procedure menToolsUtilsDatasetToActionlistClick(Sender: TObject);
    procedure menToolsUtilsStringReplaceClick(Sender: TObject);
    procedure menToolsUtilsTesteRegexClick(Sender: TObject);
    procedure menWebR_helpClick(Sender: TObject);
    procedure menWebRguiRComanderClick(Sender: TObject);
    procedure menWebRGuiRStudioClick(Sender: TObject);
    procedure menWebRGuiTinnRLECClick(Sender: TObject);
    procedure menWebRguiTinnRSourceForgeClick(Sender: TObject);
    procedure menWebRGuiTinnRUserListClick(Sender: TObject);
    procedure menWebRInformationsBioconductorClick(Sender: TObject);
    procedure menWebRInformationsCRANClick(Sender: TObject);
    procedure menWebRInformationsNewsClick(Sender: TObject);
    procedure menWebRInformationsOmegaClick(Sender: TObject);
    procedure menWebRInformationsRWikiClick(Sender: TObject);
    procedure menWebRInformationsTutorialClick(Sender: TObject);
    procedure menWebRInformationsWebSiteClick(Sender: TObject);
    procedure menWebRInformationsZoonekyndClick(Sender: TObject);
    procedure menWebRSearchHelpForRClick(Sender: TObject);
    procedure menWebRSearchMailingListArchivesClick(Sender: TObject);
    procedure menWebRSearchNabbleRbrClick(Sender: TObject);
    procedure menWebRSearchNabbleRClick(Sender: TObject);
    procedure menWebRSearchRseekClick(Sender: TObject);
    procedure menWebRSearchSiteClick(Sender: TObject);
    procedure menWebSearchSelGoogleClick(Sender: TObject);
    procedure menWebSearchSelRArchivesClick(Sender: TObject);
    procedure menWebSearchSelRSiteClick(Sender: TObject);
    procedure menWebStatVirtualLabRiceClick(Sender: TObject);
    procedure menWebStatVirtualLabVESTACClick(Sender: TObject);
    procedure menWebStatVirtualStatisticalJavaClick(Sender: TObject);
    procedure menWebStatVLPSClick(Sender: TObject);
    procedure menWebtProcessingDeplateClick(Sender: TObject);
    procedure menWebtProcessingMikTeXClick(Sender: TObject);
    procedure menWebtProcessingPandocClick(Sender: TObject);
    procedure menWebtProcessingTxt2tagsClick(Sender: TObject);
    procedure panProjectDockSiteDockDrop(Sender: TObject; Source: TDragDockObject; X, Y: Integer);
    procedure panProjectDockSiteUnDock(Sender: TObject; Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
    procedure pgFilesChange(Sender: TObject);
    procedure pgFilesDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pgFilesDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure pgFilesMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pgFilesMouseLeave(Sender: TObject);
    procedure pgFilesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pmemRResCurrentLineToTopClick(Sender: TObject);
    procedure pmemRResSendBlockMarkedClick(Sender: TObject);
    procedure pmemRResSendClipboardClick(Sender: TObject);
    procedure pmemRResSendContiguousClick(Sender: TObject);
    procedure pmemRResSendCursorToBeginningLineClick(Sender: TObject);
    procedure pmemRResSendCursorToEndLineClick(Sender: TObject);
    procedure pmemRResSendFileClick(Sender: TObject);
    procedure pmemRResSendKnitrClick(Sender: TObject);
    procedure pmemRResSendLineClick(Sender: TObject);
    procedure pmemRResSendLinesToEndPageClick(Sender: TObject);
    procedure pmemRResSendSelectionClick(Sender: TObject);
    procedure pmemRResSendSweaveClick(Sender: TObject);
    procedure pmemSpellClearAllClick(Sender: TObject);
    procedure pmemSpellCopyClick(Sender: TObject);
    procedure pmemSpellCutClick(Sender: TObject);
    procedure pmemSpellDeleteClick(Sender: TObject);
    procedure pmemSpellPasteClick(Sender: TObject);
    procedure pmemSpellSelectAllClick(Sender: TObject);
    procedure pmenProjRSendToRClick(Sender: TObject);
    procedure pmenProjRSetWorkDirClick(Sender: TObject);
    procedure pmenResultsOpenLinkClick(Sender: TObject);
    procedure pmenResultsOpenLinkMeasureItem(Sender: TObject; ACanvas: TCanvas; var Width, Height: Integer);
    procedure pmenRResContClearAllClick(Sender: TObject);
    procedure pmenRResContClearConsoleClick(Sender: TObject);
    procedure pmenRResContCloseAllGraphicsClick(Sender: TObject);
    procedure pmenRResContEditVariableClick(Sender: TObject);
    procedure pmenRResContEscapeClick(Sender: TObject);
    procedure pmenRResContExampleSelectedWordClick(Sender: TObject);
    procedure pmenRResContFixVariableClick(Sender: TObject);
    procedure pmenRResContGuiPuTTYStartCloseClick(Sender: TObject);
    procedure pmenRResContHelpClick(Sender: TObject);
    procedure pmenRResContHelpSelectedWordClick(Sender: TObject);
    procedure pmenRResContListAllObjectsClick(Sender: TObject);
    procedure pmenRResContListVariableNamesClick(Sender: TObject);
    procedure pmenRResContListVariableStructureClick(Sender: TObject);
    procedure pmenRResContPackagesClick(Sender: TObject);
    procedure pmenRResContPlotVariableClick(Sender: TObject);
    procedure pmenRResContPrintVariableContentClick(Sender: TObject);
    procedure pmenRResContRemoveAllObjectsClick(Sender: TObject);
    procedure pmenRResContSetWorkDirectoryClick(Sender: TObject);
    procedure pmenRResContTCPConnectionClick(Sender: TObject);
    procedure pmenRResContTermStartCloseClick(Sender: TObject);
    procedure pmenWinExplorerFilesRefreshClick(Sender: TObject);
    procedure pmenWinExplorerFoldersRefreshClick(Sender: TObject);
    procedure pmenWorkExplorerFilesRefreshClick(Sender: TObject);
    procedure pmenWorkExplorerFoldersRefreshClick(Sender: TObject);
    procedure RecentFileClick(Sender: TObject);
    procedure sdMainShow(Sender: TObject);
    procedure sdMainTypeChange(Sender: TObject);
    procedure stbMainClick(Sender: TObject);
    procedure stbMainDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure synIOClick(Sender: TObject);
    procedure synIOEnter(Sender: TObject);
    procedure synMRStateChange(Sender: TObject);
    procedure synCompletion(Kind: SynCompletionType; Sender: TObject; var CurrentInput: WideString; var x, y: Integer; var CanExecute: Boolean);
    procedure tbFilterClick(Sender: TObject);
    procedure tbiPandocClick(Sender: TObject);
    procedure tbReloadClick(Sender: TObject);
    procedure TBRMainMove(Sender: TObject);
    procedure tRRuningTimer(Sender: TObject);
    procedure tUpdateOptionsTimer(Sender: TObject);
    procedure Nvim_R_pluginClick(Sender: TObject);
    procedure actOpenCurrentFileExecute(Sender: TObject);
    procedure actRContOpenExampleSelectedWordExecute(Sender: TObject);
    procedure actRExplorerOpenExampleSelectedExecute(Sender: TObject);
    procedure actRtermIO_Text_nMLExecute(Sender: TObject);
    procedure actRtermIO_R_nMLExecute(Sender: TObject);
    procedure actRtermLOG_Text_nMLExecute(Sender: TObject);
    procedure actRtermLOG_R_nMLExecute(Sender: TObject);
    procedure menWebRGuiRTVSClick(Sender: TObject);
    procedure menHelpStatRJournalClick(Sender: TObject);
    procedure menWebRInformationsMRANClick(Sender: TObject);
    procedure menHelCheckForUpdateClick(Sender: TObject);
    procedure actRCardOpenExampleSelectedExecute(Sender: TObject);
    procedure actRSendSmartExecute(Sender: TObject);
    procedure pmemRResSendSmartClick(Sender: TObject);
    procedure stbMainMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    aImg                           : Array[0..9] of TBitmap;
    bAlreadyOrganized              : boolean;
    bAskActualizeChangedFiles      : boolean;
    bColors_OldVersion             : boolean;
    bConectionError                : boolean;
    bCustom_OldVersion             : boolean;
    bDataCompletionAnywhere        : boolean;
    bInExecute                     : boolean;
    bIOLineWrap                    : boolean;
    bLogLineWrap                   : boolean;
    bMinimizeTinnAfterLastFile     : boolean;
    bOnTop                         : boolean;
    bOrganizeAutomatically         : boolean;
    bREcho                         : boolean;
    bRestored                      : boolean;
    bRestoreIniDock                : boolean;
    bRKnitr                        : boolean;
    bRMirros_Update                : boolean;
    bRRequireKnitr                 : boolean;
    bRSendAll                      : boolean;
    bRSetget_Info                  : boolean;
    bRSetWorkDir_Starting          : boolean;
    bRSmart                        : boolean;
    bRsvSocket_Connect             : boolean;
    bRtermCanFloat                 : boolean;
    bRtermCloseWithoutAsk          : boolean;
    bRtermHorizontal               : boolean;  // IO disposition for IO and Log in the same view
    bRtermOptionCancel             : boolean;
    bRtermSingle                   : boolean;  // IO and Log in the same view
    bRTinnRcom_Info                : boolean;
    bRTinnRcom_Install             : boolean;
    bRTinnRcom_Installed           : boolean;
    bRTinnRcom_Load                : boolean;
    bRTinnRcom_Loaded              : boolean;
    bRTinnRcom_Updating            : boolean;
    bRUseLatest                    : boolean;
    bScrollSendingLines            : boolean;
    bSearchDirectory               : boolean;
    bSearchInSub                   : boolean;
    bSearchOpenFiles               : boolean;
    bStartingUp                    : boolean;
    //bStartOptionsWithProcessingPage: boolean;
    //bStartOptionsWithRPage         : boolean;
    bSyntax_OldVersion             : boolean;
    bTCPIPRunning                  : boolean;
    bToolsCanFloat                 : boolean;
    bUpdate_Cache                  : boolean;
    bUpdate_Comments               : boolean;
    bUpdate_Completion             : boolean;
    bUpdate_Latex                  : boolean;
    bUpdate_Project                : boolean;
    bUpdate_Rcard                  : boolean;
    bUpdate_Rmirrors               : boolean;
    bUpdate_Shortcuts              : boolean;
    hkTinnR                        : TfrmHotKeys;
    iCols                          : integer;
    ifEditor                       : TIniFile;
    ifEditor_Tmp                   : TIniFile;
    ifTinn                         : TIniFile;
    ifTinn_Tmp                     : TIniFile;
    iIO_Syntax                     : integer;
    iLastFile                      : integer;
    iLastSearch                    : integer;
    iLatexDimensionalElement       : integer;
    iLOG_Syntax                    : integer;
    iMaxDeparseLength              : integer;
    iReformatRSplit                : integer;
    iRFormatted                    : integer;
    iRguiTinnR_Disposition         : integer;
    iRguiTinnR_Proportion          : integer;
    iRows                          : integer;
    iTimerCounter                  : integer;
    iViewStyleRExplorer            : integer;
    msHexViewer                    : TMemoryStream;
    rsSearch                       : TRegExpr;
    sApp_Data                      : string;
    sCurrentVersion_Cache          : string;
    sCurrentVersion_Comments       : string;
    sCurrentVersion_Completion     : string;
    sCurrentVersion_Latex          : string;
    sCurrentVersion_Project        : string;
    sCurrentVersion_Rcard          : string;
    sCurrentVersion_Rmirrors       : string;
    sCurrentVersion_Shortcuts      : string;
    seTmp                          : TSynEdit;
    sEncodingDefault               : string;
    sEOLDefault                    : string;
    sFileLatexOrigin               : string;
    sFileProjectOrigin             : string;
    sformatR                       : string;
    sKnit                          : string;
    sGuiRRunning                   : string;
    sIniDockFilePath               : string;
    slFileMRU                      : TStringList;
    slProject                      : TStringList;
    slProjectChanges               : TStringList;
    slprojectMRU                   : TStringList;
    slRAvailable                   : TStringList;
    slRLibPaths                    : TStringList;
    slTextDiff                     : TStringList;
    sOldPreferencesTmp             : string;
    sParDeplate                    : string;
    sParDviBibtex                  : string;
    sParDviSingle                  : string;
    sParPdfBibtex                  : string;
    sParPdfSingle                  : string;
    sParRgui                       : string;
    sParRPuTTY                     : string;
    //sParRterm                      : string;
    sParTxt2tags                   : string;
    sPath_Bkp                      : string;
    sPath_Editor                   : string;
    sPath_Ini                      : string;
    sPath_Latex                    : string;
    sPath_Pandoc                   : string;
    sPath_Project                  : string;
    sPath_R                        : string;
    sPath_R_Connected              : string;
    sPath_Rgui                     : string;
    //sPath_Rterm                    : string;
    sPathDeplate_Converter         : string;
    sPathDeplate_Interpreter       : string;
    sPathIniEditor_Tmp             : string;
    sPathIniTinn_Tmp               : string;
    sPathTinnRcom_Installed        : string;
    sPathTxt2tags_Converter        : string;
    sPathTxt2tags_Interpreter      : string;
    sProjectName                   : string;
    sRIOSaved                      : string;
    sRLibPathDefault               : string;
    sRLogSaved                     : string;
    sSearchDirHistory              : string;
    sSearchFileMaskHistory         : string;
    sTipFromRServer                : string;
    sVersion_Cache                 : string;
    sVersion_Comments              : string;
    sVersion_Completion            : string;
    sVersion_Ini                   : string;
    sVersion_Latex                 : string;
    sVersion_Project               : string;
    sVersion_Rcard                 : string;
    sVersion_Rmirrors              : string;
    sVersion_Shortcuts             : string;
    sVersion_TinnRcomInstalled     : string;
    sWindowOption                  : string;
    tnGenericGroup                 : TTreeNode;
    R_Useful                       : TR_Useful;

    function fActivePanel: integer;
    function fCheckConnection: boolean;
    function fCloseAllFilesOfProject: boolean;
    function fFileExistsAsNode(var iPos: integer; sFile: string): boolean;
    function fFindWindowByName(sName: string): integer;
//    function fFindWord: string;
    function fGet_Syn: TSynEdit;
    function fGenericGroupExists: boolean;
    function fGetBlockMarked(var bSingleLine: boolean): string;
    function fGetClipboard(var bSingleLine: boolean): string;
    function fGetContiguous(var bSingleLine: boolean): string;
    function fGetEncodingDefault: string;
    function fGetCursorTo(sWay: string): string;
    function fGetEOLDefault: string;
    function fGetFile(var bSingleLine: boolean): string;
    function fGetFileToReformat: string;
    function fGetFocus: integer;
    function fGetLine(bGoToNextValidLine: boolean; seEditor: TSynEdit): string;
    function fGetLinesToEndPage(var bSingleLine: boolean): string;
    function fGetPathFile(bFull: boolean = False): string;
    function fGetSaveFormat(uStrings: TUnicodeStrings): string;
    function fGetSelection(var bSingleLine: boolean): string;
    function fGetSelectionToReformat(sSel: string): string;
    function fGroupExistsAsNode(sGroupName: string): boolean;
    function fMessageDlg(const sMsg: string; mdType: TMsgDlgType; mdButtons: TMsgDlgButtons; iHelp: Integer): Integer;
    function fREnvironment: string;
    //function fRWorkDir: string;
    function fSingleLine(sTmp: string): boolean;
    function fStripRegExPower(sSearchText: string): string;

    procedure pAddFile(iFile: string);
    procedure pBackupSystemConfiguration(bStarting: boolean);
    procedure pBuildMRU(var miItem: TMenuItem);
    procedure pBuildProjectMRU(var miItem: TMenuItem);
    procedure pCheckData;
    procedure pCheckEditorOptions;
    procedure pCheckIfProjectWasChanged;
    procedure pCheckIni;
    procedure pCheckIniDock;
    procedure pCheckLatex(bReload: boolean);
    procedure pCheckOrigin;
    procedure pCheckProcessingPath(sPath: string);
    procedure pCheckProject;
    procedure pCheckREcho;
    procedure pCheckTemporary;
    procedure pCheckTop;
    procedure pCheckVersion;
    procedure pClearStatusBarProject;
    procedure pCloseAllFilesOfGroup;
    procedure pCompileLaTeX(sMikPar, sBibPar, sExtension: string; bWait: boolean);
    procedure pControlResources(bOption: boolean);
    procedure pCreateGroup(sGroupName: string);
    procedure pCreateProject;
    procedure pDatasetToActionList(Sender: TObject);
    procedure pDoClearConsole;
    procedure pDoIPConnection(sIPHost: string; iIPPort: integer; bActive: boolean);
    procedure pDoTxt2Tag(iButton: integer);
    procedure pFileConversion(sParameter, sExtension, sPathConversor: string; sPathInterpreter: string = ''; bWait: boolean = True);
    procedure pFileSaveGeneric(sFile: string; synEditor: TSynEdit);
    procedure pGetCallTip(var sRObject, sRPackage, sRTip: string; var bTipFound: boolean);
    procedure pGetComments;
    procedure pInsertLatexMath(sFunction: string; iCaretControl: integer);
    procedure pLoadEditorKeystrokes;
    procedure pLoadFile(sFileName: string; bCreateNewChild: boolean = True; bUpdateMRU: boolean = True);
    procedure pMakeItem(sRObjName, sRObjDim, sRObjGroup, sRObjClass: string; iIndex: integer);
    procedure pMakeRenvironment(slRObjects: TStringList);
    procedure pMakeTemplate(sFile: string);
    procedure pMakeTree(sRObjName, sRObjDim, sRObjGroup, sRObjClass: string);
    procedure pMakeTreeRExplorer_TmpFile(slRObjects: TStringList);
    procedure pMatchBracket(seActive: TSynEdit);
    procedure pMySort(iSort: integer);
    procedure pOnTop(hHandle: HWND);
    procedure pOpenFileWithViewer(sFilter, sDefaultExt: string);
    procedure pOpenHelpFile(sFileToOpen: string);
    procedure pOpenProject;
    procedure pOpenProjectIntoTinn(sProjectName: string);
    procedure pPandocConversion(sPandocInstruction, sPandocFrom, sPandocTo: string; bWait: boolean = True);
    procedure pRecentProjectFileClick(Sender: TObject);
    procedure pRecordActions(baAction: TBasicAction; var bHandled: Boolean);
    procedure pRemoveLine_Commented(var sTmp: string);
    procedure pRemoveLine_Empty(var sTmp: string);
    procedure pRMenu(bOption: boolean);
    procedure pRmirrorsInterface_Update;
    procedure pRSetGet_Info;
    procedure pRSetSend_Info(var sInfo, sFileInfo: string);
    procedure pR_Info;
    procedure pRToolbar(bOption: boolean);
    procedure pSaveEditorKeystrokes;
    procedure pSaveNewIni_Application;
    procedure pSaveNewIni_Editor;
    procedure pSavePreferencesOfOldVersion;
    procedure pSaveProject;
    procedure pSearchInDirectories(const sDir, sMask: string; var iFileCount, iMatchCount, iTotFileCount: integer);
    procedure pSearchInOpenFiles(var iFileCount, iMatchCount: integer);
    procedure pSendResources(bOption: boolean);
    procedure pSetBuffer_FileFormat(ff: TSynEditFileFormat);
    procedure pSetBuffer_SaveFormat(sf: TSaveFormat);
    procedure pSetCompletion;
    procedure pSetEncodingDefault(sTmp: string);
    procedure pSetEOLDefault(sTmp: string);
    procedure pSetIniStructure;
    procedure pSetInterfaceSize(frm: TForm; iSize: integer);
    procedure pSetPreferences_Application;
    procedure pSetPreferences_Editor;
    procedure pSetRcard;
    procedure pSetREcho_False;
    procedure pSetREcho_True;
    procedure pSetRExplorer(bOption: boolean);
    procedure pSetRLibrary_Path(sTmp: string);
    procedure pSetRmirrors;
    procedure pSetShortcuts;
    procedure pSetupSearchParameters(sSearchText: string);
    procedure pSortProject;
    procedure pStartSocketServer_svSocket;
    procedure pTabMenuPopup(pcTmp: TPageControl; X, Y: Integer);
    procedure pToolsProjectControls(bOption: boolean);
    procedure pToolsSearchControls(bOption: boolean);
    procedure pTraverseDir(sPath: string; var tsFileList: TStringList; sMask: string);
    procedure pUdatePgFiles;
    procedure pUnpackFile(sFile, sPath, sChoice: string);
    procedure pUpdateAppearance(bFontSize: boolean = True);
    procedure pUpdateBars(bOption: boolean);
    procedure pUpdateCloseFileOptions;
    procedure pUpdateFile(var seEditor: TSynEdit; var smOption: TSynSelectionMode);
    procedure pUpdateFileIntoTinn(sFile: string; iLineNumberJump: integer = 0);
    procedure pUpdateOptions;
    procedure pUpdateProjectMRU(var miItem: TMenuItem; sFileName: string);
    procedure pUpdateRFileReformatted(Stmp: string);
    procedure pUpdateRSelectionReformatted(Stmp: string);
    Procedure pUpdateRterm_Appearance(bUpdate_FontSize: boolean = True);
    procedure pWMCopyData(var msg: TWMCopyData); message WM_COPYDATA;
    procedure pWMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure pWMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure pWriteIniFile_Application(bMakingBackup: boolean);
    procedure pWriteIniFile_Editor(bMakingBackup: boolean);
    procedure pDraw_RtermSend_Plus;

    // From public
    procedure pAppActivate(Sender: TObject);


  public
    { Public declarations }
    ajavHK_S                     : array[1..10] of TJvApplicationHotKey;  // R Hotkeys_Send
    ajavHK_C                     : array[1..10] of TJvApplicationHotKey;  // R Hotkeys_Control
    ajavHK_CU1                   : array[1..10] of TJvApplicationHotKey;  // R Hotkeys_Custom_1
    ajavHK_CU2                   : array[1..10] of TJvApplicationHotKey;  // R Hotkeys_Custom_2
    aR_CU1                       : array[1..10] of string;                // R Action Custom_1
    aR_CU2                       : array[1..10] of string;                // R Action Custom_2
    bActiveLine                  : boolean;
    bAllNames                    : boolean;
    bBOM                         : boolean;
    bCloseCanceled               : boolean;
    bConnectionBeepOnError       : boolean;
    bDatabaseRestored            : boolean;
    bEditorLineWrap              : boolean;
    bIPLocal                     : boolean;  // It controls the type of TCPIP connection: False: Remote, True: Local
    bIPRemoteConnected           : boolean;
    bPrintColors                 : boolean;
    bPrintFileName               : boolean;
    bPrintLineNumber             : boolean;
    bPrintLineWrap               : boolean;
    bPrintPageNumber             : boolean;
    bPrintSyntaxColor            : boolean;
    bProjectChanged              : boolean;
    bRArchitecture64             : boolean;
    bRAsServer                   : boolean;
    bRememberFileState           : boolean;
    bRemoveExtension             : boolean;
    bRguiReturnFocus             : boolean;
    bRTCPIPConsoleEcho           : boolean;
    bRTCPIPConsoleUse            : boolean;
    bRtermBeepOnError            : boolean;
    bRtermFindError              : boolean;
    bRtermWidth                  : boolean;
    bSearchBackwards             : boolean;
    bSearchCaseSensitive         : boolean;
    bSearchFromCursor            : boolean;
    bSearchRegExp                : boolean;
    bSearchWholeWords            : boolean;
    bselectedToPreview           : boolean;
    bTinnRHotKeys                : boolean;
    bUndoAfterSave               : boolean;
    bUpdating                    : boolean;
    clActiveLine                 : TColor;
    clBGApplication              : TColor;
    clBGForAllHighlighters       : TColor;
    clBGPreferred                : TColor;
    clBGTabSelectedNew           : TColor;
    clBrackets                   : TColor;
    clFGApplication              : TColor;
    coEditor                     : TSynEditorOC;
    ffDefault                    : TSynEditFileFormat;
    hRgui                        : HWND;
    iAlphaBlendValue             : integer;
    iCommentsBeforeChanges       : integer;
    iCompletionBeforeChanges     : integer;
    iCompletionFilter            : integer;
    iCountriesFilter             : integer;
    iDelay                       : integer;
    iDragLevel                   : integer;
    iFileCount                   : integer;
    iFilterToSaveAs              : integer;
    iIPPortLocal                 : integer;
    iIPPortRemote                : integer;
    iLatexDimensionalAlign       : integer;
    iPandocFrom                  : integer;
    iPandocTo                    : integer;
    iProjecSelected              : integer;
    iRecognition_Caption         : integer;
    iRcardBeforeChanges          : integer;
    iRcardFilter                 : integer;
    iRmirrorsBeforeChanges       : integer;
    iRtipBeforeChanges           : integer;
    iRtipFilter                  : integer;
    iScaleMode                   : integer;
    iShortcutsBeforeChanges      : integer;
    iShortcutsFilter             : integer;
    iSynWithFocus                : integer;
    iTransparency                : integer;
    iZoomPreview                 : integer;
    sAppSelected                 : string;
    sBeginComment                : string;
    sCommentsBookMark            : string;
    sCompletionBookMark          : string;
    sDragSource                  : string;
    sDragSourceLine              : string;
    seDefault                    : TSynEncoding;
    sEndComment                  : string;
    seUsed                       : TSynEncoding;
    sfDefault                    : TSaveFormat;
    sFileDataOrigin              : string;
    sFileExtensions              : string;
    sIPHostLocal                 : string;
    sIPHostRemote                : string;
    slFileNotify                 : TStringList;
    slFilters                    : TStringList;
    sLineComment                 : string;
    sPandocHistory               : string;
    sPandocHistoryFrom           : string;
    sPandocHistoryTo             : string;
    sPath_App                    : string;
    sPath_Color                  : string;
    sPath_Data                   : string;
    sPath_Syntax                 : string;
    sPath_SyntaxBKP              : string;
    sPath_TinnR                  : string;
    sPath_TinnRcom               : string;
    sPath_Tmp                    : string;
    sPathColor_Custom            : string;
    sPathIniEditor_File          : string;
    sPathIniTinn_File            : string;
    sPuttyHost                   : string;
    sPuttyPassword               : string;
    sPuttyUser                   : string;
    sRcardBookMark               : string;
    sRmirror                     : string;
    sRmirrorsBookMark            : string;
    sRtipBookMark                : string;
    sSaveAsFileExt               : string;
    sSearchTextHistory           : string;
    sShortcutsInUse              : string;
    sTipToWrite                  : string;
    sUpdate                      : string;
    sUtilsOrigin                 : string;
    sWorkingDir                  : string;
    bRtermSend_Plus              : boolean;
    sPath_Rterm                  : string;
    sParRterm                    : string;
    sReplaceTextHistory          : string;

    function fFindTopWindow: integer;
    function fGetBuildInfo: string;
    function fRgui_Running(bFirstTime: boolean = False): boolean;
    function fRterm_Running: boolean;
    function fUseTCPIP: boolean;
    function fValidRRunning: boolean;
    procedure DefaultHandler(var message); override;
    procedure pCheckIfFileFromDvi(sFile: string);
    procedure pCheckRterm;
    procedure pClearMRU;
    procedure pClearStatusBar;
    procedure pDoRConnection(sTmp: string; bActive, bSendTask: boolean);
    procedure pDoRguiConnection(sTmp: string; bActive: boolean);
    procedure pDoSend(var sTmp: string; bSendToSynIO: boolean = True);
    procedure pDrawSelectionMode(iSelMode: integer);
    procedure pGetFile_Info(sFileName: string; uStrings: TUnicodeStrings; bConverting: boolean = False);
    procedure pInsertLatexSymbol(sSymbol: string; iCaretControl: integer);
    procedure pMinimizeTinnAfterLastFile;
    procedure pOpenAllFiles;
    procedure pOpenAllFilesOfGroup;
    procedure pOpenFileFromSearch;
    procedure pOpenFileIntoTinn(sFile: string; iLineNumberJump: integer = 0; bOpenProjetcText: boolean = False; bUpdateMRU: boolean = True);
    procedure pOpenUserGuidePDF(sWhere: string);
    procedure pPrintMessage(sInstruction: string; bNewLine: boolean; sSignal: string = '> ');
    procedure pRemoveTab(sTabCaption: string);
    procedure pSendRCustom(sRC: string);
    procedure pSendToConsole(sTmp: string);
    procedure pSetFileSize_StatusBar(sFileName: string);
    procedure pSetFocus_Main;
    procedure pSetFocus_Rgui(iDelay: integer);
    procedure pSetPathRgui;
    procedure pSetPathRTerm;
    procedure pSetSyntaxComboBox(sSynName: string);
    procedure pSetSyntaxMenuItem(sSynName: string);
    procedure pSetTabTitle(sStat: string);
    procedure pSetToolbarProcessing(sFileExtension: string);
    procedure pUpdateCursorPos(Sender: TSynEdit);
    procedure pUpdateHexViewer;
    procedure pUpdateMRU(var miItem: TMenuItem; sFileName: string);
    function fRWorkDir: string;

end;

var
  frmMain: TfrmMain;

implementation

uses
  StrUtils,
  trUtils,
  trSynUtils,
  trCodeSender,
  uActionMacro,
  uDMSyn,
  ufrmAppOptions,
  ufrmAsciiChart,
  ufrmColors,
  ufrmConfigurePrint,
  ufrmRterm,
  ufrmCount,
  ufrmDiffMain,
  ufrmEditor,
  ufrmGroupRename,
  ufrmLatexDimensional,
  ufrmNewGoup,
  ufrmPrintPreview,
  ufrmRcard,
  ufrmRServer,
  ufrmSearchInFiles,
  ufrmSplash,
  ufrmTools,
  uModDados,
  ufrmCompletion,
  ufrmShortcuts,
  ufrmPandoc,
  ufrmComments,
  ufrmRmirrors,
  ufrmUpdater;

{$R *.DFM}

(*
----------------------------------------------------
 pSetShortcuts: It is very important for developers!
----------------------------------------------------
*)
procedure TfrmMain.pSetShortcuts;
begin
(*
----------------------------------------------------------------------------------------------
  It will update (from dataset shortcut.xml) all actions inside of alMain:
   1- Comment the line below (pDatasetToActionList(nil)) when was done any change in the alMain;
   2- Run Tinn-R ;
   3- Generate a new Dataset: Tools/Utils/Actionlist to dataset
      (This menu is visible only when running the project under the IDE);
   4- Close Tinn-R;
   5- Change the version of sCurrentVersion_Shortcuts in procedure TfrmMain.pCheckVersion
      (It is very important to the user version be updated!);
   6- Uncomment this line newly (pDatasetToActionList(nil));
   7- It is all!
----------------------------------------------------------------------------------------------
*)

(*-------------------------*)
  pDatasetToActionList(nil);
(*-------------------------*)

  // Create items in lbShortcuts from strListShortcutsGroups create in uModDados
  with modDados do begin
    frmTools.lbShortcuts.Items:= slShortcuts_Groups;
    frmTools.lbShortcuts.Refresh;
    FreeAndNil(slShortcuts_Groups);
  end;

  // To prevent some problem
  if (iShortcutsFilter < 0) then iShortcutsFilter:= 0;
  frmTools.lbShortcuts.Selected[iShortcutsFilter]:= True;
  frmTools.lbShortcutsClick(Self);
end;

procedure TfrmMain.pCheckREcho;
begin
  bREcho:= ifTinn.ReadBool('App', 'bREcho', True);

  if bREcho then begin
    actREcho.Checked:= True;
    pSetREcho_True;
  end
  else begin
    actREcho.Checked:= False;
    pSetREcho_False;
  end;
end;

procedure TfrmMain.pCheckVersion;
begin
  // Versions in use by user: from ini file
  sVersion_Cache     := ifTinn.ReadString('App', 'sVersion_Cache'     , '0.0.0.0');
  sVersion_Comments  := ifTinn.ReadString('App', 'sVersion_Comments'  , '0.0.0.0');
  sVersion_Completion:= ifTinn.ReadString('App', 'sVersion_Completion', '0.0.0.0');
  sVersion_Ini       := ifTinn.ReadString('App', 'sVersion_Ini'       , '0.0.0.0');
  sVersion_Latex     := ifTinn.ReadString('App', 'sVersion_Latex'     , '0.0.0.0');
  sVersion_Project   := ifTinn.ReadString('App', 'sVersion_Project'   , '0.0.0.0');
  sVersion_Rcard     := ifTinn.ReadString('App', 'sVersion_Rcard'     , '0.0.0.0');
  sVersion_Rmirrors  := ifTinn.ReadString('App', 'sVersion_Rmirrors'  , '0.0.0.0');
  sVersion_Shortcuts := ifTinn.ReadString('App', 'sVersion_Shortcuts' , '0.0.0.0');

  // Version of the main resources: database and TinnRcom packages 
  sCurrentVersion_Cache     := '5.02.02.00';
  sCurrentVersion_Comments  := '3.00.02.01';
  sCurrentVersion_Completion:= '5.02.03.00';
  sCurrentVersion_Latex     := '2.01.01.01';
  sCurrentVersion_Project   := '5.03.01.01';
  sCurrentVersion_Rcard     := '2.03.00.00';
  sCurrentVersion_Rmirrors  := '5.02.02.00';
  sCurrentVersion_Shortcuts := '5.03.00.00';

  // Cache
  if (AnsiCompareStr(sVersion_Cache,
                     sCurrentVersion_Cache) < 0) then begin
    bUpdate_Cache := True;
    sVersion_Cache:= sCurrentVersion_Cache;
  end;

  // Comments
  if (AnsiCompareStr(sVersion_Comments,
                     sCurrentVersion_Comments) < 0) then begin
    bUpdate_Comments := True;
    sVersion_Comments:= sCurrentVersion_Comments;
  end;

  // Completion
  if (AnsiCompareStr(sVersion_Completion,
                     sCurrentVersion_Completion) < 0) then begin
    bUpdate_Completion := True;
    sVersion_Completion:= sCurrentVersion_Completion;
  end;

  // Latex
  if (AnsiCompareStr(sVersion_Latex,
                     sCurrentVersion_Latex) < 0) then begin
    bUpdate_Latex := True;
    sVersion_Latex:= sCurrentVersion_Latex;
  end;

  // Project
  if (AnsiCompareStr(sVersion_Project,
                     sCurrentVersion_Project) < 0) then begin
    bUpdate_Project := True;
    sVersion_Project:= sCurrentVersion_Project;
  end;

  // Rcard
  if (AnsiCompareStr(sVersion_Rcard,
                     sCurrentVersion_Rcard) < 0) then begin
    bUpdate_Rcard := True;
    sVersion_Rcard:= sCurrentVersion_Rcard;
  end;

  // Mirrors
  if (AnsiCompareStr(sVersion_Rmirrors,
                     sCurrentVersion_Rmirrors) < 0) then begin
    bUpdate_Rmirrors := True;
    sVersion_Rmirrors:= sCurrentVersion_Rmirrors;
  end;

  // Shortcuts
  if (AnsiCompareStr(sVersion_Shortcuts,
                     sCurrentVersion_Shortcuts) < 0) then begin
    sVersion_Shortcuts:= sCurrentVersion_Shortcuts;
    if FileExists(sPath_Data +
                  '\Shortcuts.xml') then
      bUpdate_Shortcuts:= True;
  end;

  // SynUnihighlighter: It was removed from the project!
  if DirectoryExists(sPath_Ini +
                     '\unihighlighter') then pDelete_Dir(sPath_Ini +
                                                         '\unihighlighter');
  // It was removed from the project!
  if DirectoryExists(sPath_Ini +
                     '\editor shortcuts') then pDelete_Dir(sPath_Ini +
                                                           '\editor shortcuts');
end;

procedure TfrmMain.pOpenFileIntoTinn(sFile: string;
                                         iLineNumberJump: integer = 0;
                                         bOpenProjetcText: boolean = False;
                                         bUpdateMRU: boolean = True);

  function fGetFileNameFromURL(sFile: string): string;
  var
    sTmp,
     sName,
     sExtension: string;

  begin
    // Delete '/' if latest character on sFile
    if (fLastPos('/',
                 sFile) = length(sFile)) then delete(sFile,
                                                     length(sFile),
                                                     1);

    // Get all from latest '/' to the end of string
    sTmp:= fRegEx(sFile,
                  '[^\/]+$',
                  False);

    // Get any word character (letter, number, underscore) until a possible '.'
    sName:= fRegEx(sTmp,
                   '^\w+',
                   False);

    if (sName = EmptyStr) then sName:= 'Temporary';

    // It is only for security
    sName:= fSanitize_FileName(sName);


    // It will get possible file extension
    sExtension:= fRegEx(sTmp,
                        '[.]\w+',
                        False);

    // It will check if sExtension has a recognized extension
    if Pos(sExtension,
           slFilters.Text) = 0 then sExtension:= EmptyStr;

    result:= sPath_Tmp +
             '\' +
             sName +
             '[' +
             FormatDateTime('hh_mm_ss',
                            now) +
             ']' +
             sExtension;
  end;

var
  bFileExists,
   bLoadFileFromDisk,
   bOverwriteCurrentContents: boolean;

  i,
   j,
   iCaretX,
   iCaretY,
   iTopLine: integer;

  iLineNumber: TPoint;

  seEditor: TSynEdit;

  slNewFile: TUnicodeStringList;

  slTmp1,
   slTmp2: TStringList;

  sTmp,
   sMarks,
   sFileExt,
   sFileName: string;

  userOption: TModalResult;

  cTmp: char;

begin
  // Check if sFile is a valid URL
  if fIsURL(sFile) then begin
    sFileName:= fGetFileNameFromURL(sFile);

    if fDownload_File(sFile,
                      sFileName) then
      if FileExists(sFileName) then begin
        pOpenFileIntoTinn(sFileName);
        Exit;
      end
      else begin
        fMessageDlg(sFile + #13 + #13 +
                    'Sorry, it was not possible to open the file above!',
                    mtWarning,
                    [mbOk],
                    0);

        Exit;
      end;
  end;

  // Check if is *.tps file, if yes, open it in the project interface
  sFileExt:= lowerCase(ExtractFileExt(sFile));

  if (sFileExt = '.tps') then begin
    frmTools.pgTools.ActivePage:= frmTools.tbsMisc;
    frmTools.pgMisc.ActivePage := frmTools.tbsProject;

    pCheckIfProjectWasChanged;
    Application.ProcessMessages;

    sProjectName:= sFile;

    // Bring to front the textual project, if it is opened
    i:= fFindWindowByName(sProjectName);

    if (i > -1) then Self.MDIChildren[i].BringToFront;

    pOpenProjectIntoTinn(sProjectName);
    Application.ProcessMessages;

    if not bOpenProjetcText then Exit;  // The textual project file (*.tps) will not be opened!
  end;

  pControlResources(False);

  // Init of the variables
  bLoadFileFromDisk        := True;
  bOverwriteCurrentContents:= False;

  // Check to see if the file is already opened
  sTmp:= sFile;

  i:= fFindWindowByName(sTmp);
  if (i > -1) then begin  // if the file is already open, bring it to the front
    // !! removed, done in activate and btw, do not change if user set it manually
    if bUpdateMRU then pUpdateMRU(menFileRecentFiles,
                                  sTmp);

    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

    // !! set after the calls to Self.MDIChildren[i] because the bring to front changes the order of the MDIChildren
    Self.MDIChildren[i].BringToFront;

    for j:= 0 to (pgFiles.PageCount - 1) do
      if (pgFiles.Pages[j].Hint = sTmp) then pgFiles.ActivePageIndex:= j;

    pgFiles.Hint          := sTmp;
    pgFiles.ActivePage.Tag:= -1;

    // !! Check contents of new file
    slNewFile:= TUnicodeStringList.Create;
    if FileExists(sFile) then slNewFile.LoadFromFile(sFile);

    // Contents changed
    if not slNewFile.Equals(seEditor.Lines) and
           (bAskActualizeChangedFiles) then begin
      userOption:= fMessageDlg('The file was changed.' + #13 +
                               'Load original file from disk?',
                               mtConfirmation,
                               [mbYes, mbNo, mbNoToAll],
                               0);
      case userOption of
        mrYes: begin
                 bOverwriteCurrentContents:= True;
                 // Remember current line
                  iLineNumberJump:= seEditor.CaretY;
               end;

        mrNo: bLoadFileFromDisk:= False;

        mrNoToAll: begin
                     bLoadFileFromDisk        := False;
                     bAskActualizeChangedFiles:= False;
                   end;
      end;
    end
    else bLoadFileFromDisk:= False;

    FreeAndNil(slNewFile);
  end;

  // If added
  if bLoadFileFromDisk then begin
    // If an Untitled is on top
    bFileExists:= False;

    if (pgFiles.PageCount > 0) then bFileExists:= FileExists(pgFiles.ActivePage.Hint);

    if not(bFileExists) and
          (ExecRegExpr('Untitled[1-9] + $',
                       pgFiles.ActivePage.Caption))  then begin
      if ((Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor.Modified = False) then pLoadFile(sTmp,
                                                                                                      False,
                                                                                                      bUpdateMRU)
                                                                                      else pLoadFile(sTmp,
                                                                                                     True,
                                                                                                     bUpdateMRU);
    end
    else pLoadFile(sTmp,
                   not bOverwriteCurrentContents,
                   bUpdateMRU); // Boolean added

    cTmp:= sFile[1];
    sTmp:= ExtractFilePath(sFile);

    if (frmTools.jvdcWorkExplorer.Drive <> cTmp) then frmTools.jvdcWorkExplorer.Drive:= cTmp;

    if (frmTools.jvdlbWorkExplorer.Directory <> sTmp) then begin
      frmTools.jvdlbWorkExplorer.Directory:= sTmp;

      if (trim(frmTools.edWorkExplorerFilter.Text) = '*.*') then frmTools.jvflbWorkExplorer.Mask:= '*.*'
                                                            else frmTools.jvflbWorkExplorer.Mask:= trim(frmTools.edWorkExplorerFilter.Text);
    end;
  end;

  if (iLineNumberJump > 0) then begin
    iLineNumber.y:= iLineNumberJump;
    iLineNumber.x:= 1;

    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

    with seEditor do begin
      TopLine:= iLineNumberJump;

      ExecuteCommand(ecGotoXY,
                     'A',
                     @iLineNumber);
    end;
  end;

  i:= fFindTopWindow;
  synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;

  (Self.MDIChildren[i] as TfrmEditor).pCheckSaveStatus;

  if bRememberFileState then
    // Load file state from Cache.xml
    if modDados.fLoadFileState(sFile,
                               sMarks,
                               iTopLine,
                               iCaretX,
                               iCaretY) then begin
      // Restore all marks
      if (sMarks <> EmptyStr) then begin
        slTmp1:= TStringList.Create;
        pString_Split(' ',
                      sMarks,
                      slTmp1);

        if (slTmp1.Count >= 0) then
          for j:= 0 to (slTmp1.Count - 1) do begin
            slTmp2:= TStringList.Create;
            pString_Split(':',
                          slTmp1[j],
                          slTmp2);

            if (slTmp2.Count >= 0) then
              with (Self.MDIChildren[i] as TfrmEditor).synEditor do
                SetBookMark(StrToInt(slTmp2[0]),
                            0,
                            StrToInt(slTmp2[1]))
          end;

        FreeAndNil(slTmp1);
        FreeAndNil(slTmp2);
      end;

      // Restore: CaretX, CaretY and TopLine
      if (iLineNumberJump = 0) then
        with (Self.MDIChildren[i] as TfrmEditor).synEditor do begin
          CaretX := iCaretX;
          CaretY := iCaretY;
          TopLine:= iTopLine;
        end;
    end;
end;

procedure TfrmMain.pUpdateFileIntoTinn(sFile: string;
                                           iLineNumberJump: integer = 0);
var
  bFileExists,
   bLoadFileFromDisk,
   bOverwriteCurrentContents: boolean;

  i,
   j: integer;

  pLineNumber: TPoint;

  seEditor: TSynEdit;

  slNewFile: TUnicodeStringList;

  sTmp: string;

begin
  pControlResources(False);

  // Init of the variables
  bLoadFileFromDisk        := True;
  bOverwriteCurrentContents:= False;

  // Check to see if the file is already opened
  sTmp:= sFile;
  i:= fFindWindowByName(sTmp);
  if (i > -1) then begin// If the file is already open, bring it to the front
    // !! Removed, done in activate and btw, do not change if user set it manually
    pUpdateMRU(menFileRecentFiles,
               sTmp);

    seEditor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;

    // !! Set after the calls to Self.MDIChildren[i] because the bring to front changes the order of the MDIChildren
    Self.MDIChildren[i].BringToFront;

    for j:= 0 to (pgFiles.PageCount -1) do
      if (pgFiles.Pages[j].Hint = sTmp) then pgFiles.ActivePageIndex:= j;

    pgFiles.Hint          := sTmp;
    pgFiles.ActivePage.Tag:= -1;

    // !! Check contents of new file
    slNewFile:= TUnicodeStringList.Create;
    if FileExists(sFile) then slNewFile.LoadFromFile(sFile);

    // Contents changed
    if (not slNewFile.Equals(seEditor.Lines)) then begin
      // Remember current line
      iLineNumberJump:= seEditor.CaretY;
      bOverwriteCurrentContents:= True;
    end
    else bLoadFileFromDisk:= False;

    FreeAndNil(slNewFile);
  end;

  // If added
  if bLoadFileFromDisk then begin
    // If an Untitled is on top
    bFileExists:= False;
    if (pgFiles.PageCount > 0) then bFileExists:= FileExists(pgFiles.ActivePage.Hint);

    if not bFileExists and
          (ExecRegExpr('Untitled[1-9] + $',
                       pgFiles.ActivePage.Caption)) then begin
      if ((Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor.Modified = False) then pLoadFile(sTmp,
                                                                                                      False)
                                                                                      else pLoadFile(sTmp,
                                                                                                     True);
    end
    else pLoadFile(sTmp,
                   not bOverwriteCurrentContents); // Boolean added
  end;

  if (iLineNumberJump > 0) then begin
    pLineNumber.y:= iLineNumberJump;
    pLineNumber.x:= 1;
    (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor.ExecuteCommand(ecGotoXY,
                                                                              'A',
                                                                              @pLineNumber);
  end;

  i:= fFindTopWindow;
  synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;
  (Self.MDIChildren[i] as TfrmEditor).pCheckSaveStatus;
end;

//procedure pSetDataCompletion(synDataCompletion: TSynCompletionProposal;
//                             synTmp: TSynEdit;
//                             sTmp: string);
//begin
//  // Don't use 'with synDataCompletion' where!
//  synDataCompletion.Editor:= synTmp;
//  synDataCompletion.ShortCut:= TextToShortCut(sTmp);
//end;

procedure TfrmMain.pLoadFile(sFileName: string;
                                 bCreateNewChild: boolean = True;
                                 bUpdateMRU: boolean = True);
var
  sTmp: string;

  wAttributes: word;

begin
  if bCreateNewChild then begin
    TfrmEditor.Create(Self);

    with TTabSheet.Create(Self) do begin
      PageControl:= pgFiles;
      pgFiles.ActivePageIndex:= pgFiles.PageCount -1;
    end;
  end;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    sActiveFile:= sFileName;
    sWorkingDir:= ExtractFilePath(sFileName);
    if FileExists(sFileName) then begin
      seUsed:= LoadFromFile(synEditor.Lines,
                            sActiveFile,
                            GetEncoding(sActiveFile,
                                        bBOM),
                            bBOM);

      if (seUsed = seANSI) and
         actApplyToANSI.Checked then pSetBuffer_SaveFormat(sfUTF8);

      pGetFile_Info(sActiveFile,
                    synEditor.Lines);

      wAttributes:= FileGetAttr(sActiveFile);

      if (((wAttributes and SysUtils.faReadOnly) = SysUtils.faReadOnly) = True) then begin
        synEditor.ReadOnly    := True;
        stbMain.Panels[3].Text:= 'Read only';
        actReadOnly.Checked   := True;
      end;

      pSetFileSize_StatusBar(sActiveFile);
    end;

    synEditor.WordWrap:= actEditorLineWrap.Checked;
    if synEditor.WordWrap then synEditor.Options:= synEditor.Options - [eoTrimTrailingSpaces]
                          else synEditor.Options:= synEditor.Options + [eoTrimTrailingSpaces];

    synEditor.OnPaintTransient:= TSyn_Transient.pSynPaintTransient;

    pSetDataCompletion(synEditorTip,
                       synEditor,
                       'CTRL+SPACE');

    pSetHighlighterFromFileExt(ExtractFileExt(sFileName));
    pSetTitle;

    if bActiveLine then synEditor.ActiveLineColor:= TColor(clActiveLine)
                   else synEditor.ActiveLineColor:= TColor(clNone);

    synEditor.Modified:= False;
    pUpdateCursorPos(synEditor);

    with synEditor do
      if CanFocus then SetFocus;

    // File notify: Start
    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= pFileChanged;
    pNotifyFile_Start(sFileName);
  end;

  sTmp:= StringReplace(sFileName,
                       '&',
                       '&&',
                       [rfReplaceAll]);

  pgFiles.ActivePage.Hint:= sTmp;

  if actReadOnly.Checked then pgFiles.ActivePage.Caption:= '<' +
                                                            fStrip_Path(pgFiles.ActivePage.Hint) +
                                                            '>'
                         else pgFiles.ActivePage.Caption:= fStrip_Path(sFileName);

  pgFiles.ActivePage.Tag:= -1;

  if bUpdateMRU then pUpdateMRU(menFileRecentFiles,
                                sFileName);

  pUpdateHexViewer;
end;

procedure TfrmMain.pSaveNewIni_Application;
var
  slSearch,
   slReplace,
   slPandocHistory,
   slPandocHistoryFrom,
   slPandocHistoryTo: TStringList;

  i: integer;

begin
  // Application
  if not DirectoryExists(sPath_App) then begin
    try
      CreateDir(sPath_App);
    except
      fMessageDlg(sPath_App + #13 + #13 +
                  'The path above is no allowed for your system previleges.' + #13 +
                  'The necessary ".ini" files related to "Application" will not be saved!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;
  end;

  // Aplication
  ifTinn_Tmp:= TIniFile.create(sPath_App +
                               '\Tinn.tmp');
  sPathIniTinn_Tmp:= (sPath_App +
                      '\Tinn.tmp');
  if FileExists(sPathIniTinn_Tmp) then DeleteFile(sPathIniTinn_Tmp);  // Delete any old Tinn.tmp

  // RToolbar status
  TBIniSavePositions(Self,
                     sPathIniTinn_Tmp,
                     EmptyStr);

  with ifTinn_Tmp do begin
    // Version control
    WriteString('App', 'sVersion_Cache'     , sVersion_Cache);
    WriteString('App', 'sVersion_Comments'  , sVersion_Comments);
    WriteString('App', 'sVersion_Completion', sVersion_Completion);
    WriteString('App', 'sVersion_Ini'       , fGetBuildInfo);
    WriteString('App', 'sVersion_Latex'     , sVersion_Latex);
    WriteString('App', 'sVersion_Project'   , sVersion_Project);
    WriteString('App', 'sVersion_Rcard'     , sVersion_Rcard);
    WriteString('App', 'sVersion_Rmirrors'  , sVersion_Rmirrors);
    WriteString('App', 'sVersion_Shortcuts' , sVersion_Shortcuts);

    // Last path
    WriteString('App', 'sWorkingDir', sWorkingDir);

    // On top
    WriteBool('App', 'bAlwaysOnTop', actOnTop.Checked);

    // Max files in File MRU
    WriteInteger('App', 'iLastFile', iLastFile);

    // Toolbars
    WriteBool('App', 'bTobEdit.Visible', tobEdit.Visible);
    WriteBool('App', 'bTobFile.Visible', tobFile.Visible);
    WriteBool('App', 'bTobFilter.Visible', tobFilter.Visible);
    WriteBool('App', 'bTobFormat.Visible', tobFormat.Visible);
    WriteBool('App', 'bTobMacro.Visible', tobMacro.Visible);
    WriteBool('App', 'bTobMisc.Visible', tobMisc.Visible);
    WriteBool('App', 'bTobProcessing.Visible', tobProcessing.Visible);
    WriteBool('App', 'bTobSearch.Visible', tobSearch.Visible);
    WriteBool('App', 'bTobSpell.Visible', tobSpell.Visible);
    WriteBool('App', 'bTobSyntax.Visible', tobSyntax.Visible);
    WriteBool('App', 'bTobView.Visible', tobView.Visible);
    WriteBool('TBRMain', 'bTobVisible', actTobRVisible.Checked);
    WriteInteger('App', 'iCompletion.Height', frmTools.panCompletion.Height);
    WriteInteger('App', 'iCompletion.ItemIndex', frmTools.lbCompletion.ItemIndex);
    WriteInteger('App', 'iCountries.Height', frmTools.panCountries.Height);
    WriteInteger('App', 'iCountries.ItemIndex', frmTools.lbCountries.ItemIndex);
    WriteInteger('App', 'iRcard.Height', frmTools.panRcard.Height);
    WriteInteger('App', 'iRcard.ItemIndex', frmTools.lbRcard.ItemIndex);
    WriteInteger('App', 'iRExplorer.Width', frmTools.panRExplorer.Width);
    WriteInteger('App', 'iShortcuts.Height', frmTools.panShortcuts.Height);
    WriteInteger('App', 'iShortcuts.ItemIndex', frmTools.lbShortcuts.ItemIndex);
    WriteInteger('App', 'iSpellLanguage.ItemIndex', cbSpellLanguage.ItemIndex);
    WriteInteger('App', 'iTobEdit.Left', tobEdit.Left);
    WriteInteger('App', 'iTobEdit.Top', tobEdit.Top);
    WriteInteger('App', 'iTobFile.Left', tobFile.Left);
    WriteInteger('App', 'iTobFile.Top', tobFile.Top);
    WriteInteger('App', 'iTobFilter.Left', tobFilter.Left);
    WriteInteger('App', 'iTobFilter.Top', tobFilter.Top);
    WriteInteger('App', 'iTobFormat.Left', tobFormat.Left);
    WriteInteger('App', 'iTobFormat.Top', tobFormat.Top);
    WriteInteger('App', 'iTobMacro.Left', tobMacro.Left);
    WriteInteger('App', 'iTobMacro.Top', tobMacro.Top);
    WriteInteger('App', 'iTobMisc.Left', tobMisc.Left);
    WriteInteger('App', 'iTobMisc.Top', tobMisc.Top);
    WriteInteger('App', 'iTobProcessing.Left', tobProcessing.Left);
    WriteInteger('App', 'iTobProcessing.Top', tobProcessing.Top);
    WriteInteger('App', 'iTobSearch.Left', tobSearch.Left);
    WriteInteger('App', 'iTobSearch.Top', tobSearch.Top);
    WriteInteger('App', 'iTobSpell.Left', tobSpell.Left);
    WriteInteger('App', 'iTobSpell.Top', tobSpell.Top);
    WriteInteger('App', 'iTobSyntax.Left', tobSyntax.Left);
    WriteInteger('App', 'iTobSyntax.Top', tobSyntax.Top);
    WriteInteger('App', 'iTobView.Left', tobView.Left);
    WriteInteger('App', 'iTobView.Top', tobView.Top);
    WriteInteger('App', 'iWinExplorer.Height', frmTools.panWinExplorer.Height);
    WriteInteger('App', 'iWorkExplorer.Height', frmTools.panWorkExplorer.Height);

    // Rterm
    WriteBool('App', 'bRtermCanFloat', bRtermCanFloat);
    WriteBool('App', 'bRtermSend_Plus', bRtermSend_Plus);
    WriteBool('App', 'bRtermCloseWithoutAsk', bRtermCloseWithoutAsk);
    WriteBool('App', 'bRtermHorizontal', bRtermHorizontal);
    WriteBool('App', 'bRtermSingle', bRtermSingle);
    WriteInteger('App', 'iIO_Syntax', iIO_Syntax);
    WriteInteger('App', 'iLOG_Syntax', iLOG_Syntax);
    WriteInteger('App', 'iRterm.Size', frmRterm.iSize);
    WriteInteger('App', 'iSynLog2.Height', frmRterm.iSynLog2Height);
    WriteInteger('App', 'iSynLog2.Width', frmRterm.iSynLog2Width);

    // Tools
    WriteBool('App', 'bToolsCanFloat', bToolsCanFloat);
    WriteInteger('App', 'iDatabase.TabIndex', frmTools.pgDatabase.TabIndex);
    WriteInteger('App', 'iLatex.TabIndex', frmTools.pgLatex.TabIndex);
    WriteInteger('App', 'iMarkup.TabIndex', frmTools.pgMarkup.TabIndex);
    WriteInteger('App', 'iMisc.TabIndex', frmTools.pgMisc.TabIndex);
    WriteInteger('App', 'iR.TabIndex', frmTools.pgR.TabIndex);
    WriteInteger('App', 'iResults.TabIndex', frmTools.pgResults.TabIndex);
    WriteInteger('App', 'iTools.Size', frmTools.iSize);
    WriteInteger('App', 'iTools.TabIndex', frmTools.pgTools.TabIndex);
    WriteInteger('App', 'iTxt2tags.TabIndex', frmTools.pgTxt2tags.TabIndex);

    // Tools visibility
    WriteBool('App', 'bDatabase.Visible', actDatabaseVisible.Checked);
    WriteBool('App', 'bDataComments.Visible', actDataCommentsVisible.Checked);
    WriteBool('App', 'bDataCompletion.Visible', actDataCompletionVisible.Checked);
    WriteBool('App', 'bDataRcard.Visible', actDataRcardVisible.Checked);
    WriteBool('App', 'bDataRmirrors.Visible', actDataRmirrorsVisible.Checked);
    WriteBool('App', 'bDataShortcuts.Visible', actDataShortcutsVisible.Checked);
    WriteBool('App', 'bHexViewer.Visible', actHexViewerVisible.Checked);
    WriteBool('App', 'bIniLog.Visible', actIniLogVisible.Checked);
    WriteBool('App', 'bLatex.Visible', actLatexVisible.Checked);
    WriteBool('App', 'bMarkup.Visible', actMarkupVisible.Checked);
    WriteBool('App', 'bMisc.Visible', actMiscVisible.Checked);
    WriteBool('App', 'bProject.Visible', actProjectVisible.Checked);
    WriteBool('App', 'bR.Visible', actRVisible.Checked);
    WriteBool('App', 'bResults.Visible', actResultsVisible.Checked);
    WriteBool('App', 'bRExplorer.Visible', actRExplorerVisible.Checked);
    WriteBool('App', 'bSearch.Visible', actSearchVisible.Checked);
    WriteBool('App', 'bSpell.Visible', actSpellVisible.Checked);
    WriteBool('App', 'bTxt2tags.Visible', actTxt2tagsVisible.Checked);
    WriteBool('App', 'bWinExpl.Visible', actWinExplVisible.Checked);
    WriteBool('App', 'bWorkExpl.Visible', actWorkExplVisible.Checked);

    // Misc
    WriteBool('App', 'bActiveLine', bActiveLine);
    WriteBool('App', 'bAllNames', bAllNames);
    WriteBool('App', 'bAlwaysAddBOM', actAlwaysAddBOM.Checked);
    WriteBool('App', 'bApplyToANSI', actApplyToANSI.Checked);
    WriteBool('App', 'bCloseDVIViewer', actCloseDVIViewer.Checked);
    WriteBool('App', 'bClosePDFViewer', actClosePDFViewer.Checked);
    WriteBool('App', 'bComAutoDetect_Language', frmTools.cbComAutoDetect_Language.Checked);
    WriteBool('App', 'bComPriority_Line', frmTools.cbComPriority_Line.Checked);
    WriteBool('App', 'bConnectionBeepOnError', bConnectionBeepOnError);
    WriteBool('App', 'bDataCompletionAnywhere', bDataCompletionAnywhere);
    WriteBool('App', 'bDosMinimizedAlways', actDosMinimizedAlways.Checked);
    WriteBool('App', 'bDviOpenAlways', actDviOpenAlways.Checked);
    WriteBool('App', 'bEditorLineWrap', actEditorLineWrap.Checked);
    WriteBool('App', 'bFormatR', actFormatR.Visible);
    WriteBool('App', 'bHtmlOpenAlways', actHtmlOpenAlways.Checked);
    WriteBool('App', 'bIOLineWrap', actRtermIOLineWrap.Checked);
    WriteBool('App', 'bIPLocal', bIPLocal);
    WriteBool('App', 'bLogLineWrap', actRtermLogLineWrap.Checked);
    WriteBool('App', 'bMinimizeTinnAfterLastFile', bMinimizeTinnAfterLastFile);
    WriteBool('App', 'bNotification', actNotification.Checked);
    WriteBool('App', 'bNotification_US', actNotification_US.Checked);
    WriteBool('App', 'bOpenMaximized', actOpenMaximized.Checked);
    WriteBool('App', 'bOrganizeAutomatically', bOrganizeAutomatically);
    WriteBool('App', 'bPdfOpenAlways', actPdfOpenAlways.Checked);
    WriteBool('App', 'bPgFiles.Visible', actPgFilesVisible.Checked);
    WriteBool('App', 'bRArchitecture64', bRArchitecture64);
    WriteBool('App', 'bRAsServer', bRAsServer);
    WriteBool('App', 'bRComplexDefault', actRComplexDefault.Checked);
    WriteBool('App', 'bREcho', actREcho.Checked);
    WriteBool('App', 'bRememberFileState', bRememberFileState);
    WriteBool('App', 'bRemoveExtension', bRemoveExtension);
    WriteBool('App', 'bRestoreIniDock', bRestoreIniDock);
    WriteBool('App', 'bRguiReturnFocus', bRguiReturnFocus);
    WriteBool('App', 'bRMirros_Update', bRMirros_Update);
    WriteBool('App', 'bRSendAll', bRSendAll);
    WriteBool('App', 'bRSetget_Info', bRSetget_Info);
    WriteBool('App', 'bRSetWorkDir_Starting', bRSetWorkDir_Starting);
    WriteBool('App', 'bRSimpleDefault', actRSimpleDefault.Checked);
    WriteBool('App', 'bRSmart', bRSmart);
    WriteBool('App', 'bRsvSocketConnect', bRsvSocket_Connect);
    WriteBool('App', 'bRTCPIPConsoleEcho', bRTCPIPConsoleEcho);
    WriteBool('App', 'bRTCPIPConsoleUse', bRTCPIPConsoleUse);
    WriteBool('App', 'bRtermBeepOnError', bRtermBeepOnError);
    WriteBool('App', 'bRtermFindError', bRtermFindError);
    WriteBool('App', 'bRtermWidth', bRtermWidth);
    WriteBool('App', 'bRTinnRcomInstall', bRTinnRcom_Install);
    WriteBool('App', 'bRTinnRcomLoad', bRTinnRcom_Load);
    WriteBool('App', 'bRUseLatest', bRUseLatest);
    WriteBool('App', 'bScrollSendingLines', bScrollSendingLines);
    WriteBool('App', 'bShowAllBars', actShowAllBars.Checked);
    WriteBool('App', 'bStatusBar', actStatusBarVisible.Checked);
    WriteBool('App', 'bTextDefault', actTextDefault.Checked);
    WriteBool('App', 'bTinnRHotKeys', bTinnRHotKeys);
    WriteBool('App', 'bUndoAfterSave', bUndoAfterSave);
    WriteInteger('App', 'clActiveLine', Tcolor(clActiveLine));
    WriteInteger('App', 'clBGApplication', Tcolor(clBGApplication));
    WriteInteger('App', 'clBGForAllHighlighters', Tcolor(clBGForAllHighlighters));
    WriteInteger('App', 'clBGPreferred', Tcolor(clBGPreferred));
    WriteInteger('App', 'clBGTabSelectedNew', Tcolor(clBGTabSelectedNew));
    WriteInteger('App', 'clBrackets', Tcolor(clBrackets));
    WriteInteger('App', 'clFGApplication', Tcolor(clFGApplication));
    WriteInteger('App', 'iDelay', iDelay);
    WriteInteger('App', 'iIPPortLocal', iIPPortLocal);
    WriteInteger('App', 'iIPPortRemote', iIPPortRemote);
    WriteInteger('App', 'iMaxDeparseLength', iMaxDeparseLength);
    WriteInteger('App', 'iPandocFrom', iPandocFrom);
    WriteInteger('App', 'iPandocTo', iPandocTo);
    WriteInteger('App', 'iPgFiles.TabsPosition', integer(pgFiles.TabsPosition));
    WriteInteger('App', 'iPgRterm.TabsPosition', integer(frmRterm.pgRterm.TabsPosition));
    WriteInteger('App', 'iPgTools.TabsPosition', integer(frmTools.pgTools.TabsPosition));
    WriteInteger('App', 'iRecognition_Caption', iRecognition_Caption);
    WriteInteger('App', 'iReformatRSplit', iReformatRSplit);
    WriteInteger('App', 'iRguiTinnR_Disposition', iRguiTinnR_Disposition);
    WriteInteger('App', 'iRguiTinnR_Proportion', iRguiTinnR_Proportion);
    WriteInteger('App', 'iTransparency', iTransparency);
    WriteInteger('App', 'iViewStyleRExplorer', iViewStyleRExplorer);
    WriteString('App', 'sAppSelected', sAppSelected);
    WriteString('App', 'sEncodingDefault', fGetEncodingDefault);
    WriteString('App', 'sEndComment', sEndComment);
    WriteString('App', 'sEOLDefault', fGetEOLDefault);
    WriteString('App', 'sFormatR', sFormatR);
    WriteString('App', 'sKnit', sKnit);
    WriteString('App', 'sIPHostLocal', sIPHostLocal);
    WriteString('App', 'sIPHostRemote', sIPHostRemote);
    WriteString('App', 'sParDeplate', sParDeplate);
    WriteString('App', 'sParDviBibtex', sParDviBibtex);
    WriteString('App', 'sParDviSingle', sParDviSingle);
    WriteString('App', 'sParPdfBibtex', sParPdfBibtex);
    WriteString('App', 'sParPdfSingle', sParPdfSingle);
    WriteString('App', 'sParRgui', sParRgui);
    WriteString('App', 'sParRPuTTY', sParRPuTTY);
    WriteString('App', 'sParRterm', sParRterm);
    WriteString('App', 'sParTxt2tags', sParTxt2tags);
    WriteString('App', 'sPath_Pandoc', sPath_Pandoc);
    WriteString('App', 'sPath_Rgui', sPath_Rgui);
    WriteString('App', 'sPath_Rterm', sPath_Rterm);
    WriteString('App', 'sPathDeplate_Converter', sPathDeplate_Converter);
    WriteString('App', 'sPathDeplate_Interpreter', sPathDeplate_Interpreter);
    WriteString('App', 'sPathTxt2tags_Converter', sPathTxt2tags_Converter);
    WriteString('App', 'sPathTxt2tags_Interpreter', sPathTxt2tags_Interpreter);
    WriteString('App', 'sPuttyHost', sPuttyHost);
    WriteString('App', 'sPuttyPassword', sPuttyPassword);
    WriteString('App', 'sPuttyUser', sPuttyUser);
    WriteString('App', 'sRLibPathDefault', sRLibPathDefault);
    WriteString('App', 'sRmirror', sRmirror);
    WriteString('App', 'sShortcutsInUse', sShortcutsInUse);

    // Search settings
    WriteBool('Search', 'bSearchBackwards', bSearchBackwards);
    WriteBool('Search', 'bSearchCaseSensitive', bSearchCaseSensitive);
    WriteBool('Search', 'bSearchDirectory', bSearchDirectory);
    WriteBool('Search', 'bSearchFromCursor', bSearchFromCursor);
    WriteBool('Search', 'bSearchInSub', bSearchInSub);
    WriteBool('Search', 'bSearchOpenFiles', bSearchOpenFiles);
    WriteBool('Search', 'bSearchRegExp', bSearchRegExp);
    WriteBool('Search', 'bSearchWholeWords', bSearchWholeWords);
    WriteInteger('Search', 'iLastSearch', iLastSearch);

    // Print settings
    WriteBool('Print', 'bPrintColors', bPrintColors);
    WriteBool('Print', 'bPrintFileName', bPrintFileName);
    WriteBool('Print', 'bPrintLineNumber', bPrintLineNumber);
    WriteBool('Print', 'bPrintLineWrap', bPrintLineWrap);
    WriteBool('Print', 'bPrintPageNumber', bPrintPageNumber);
    WriteBool('Print', 'bPrintSyntaxColor', bPrintSyntaxColor);
    WriteInteger('Print', 'iScaleMode', iScaleMode);
    WriteInteger('Print', 'iZoomPreview', iZoomPreview);

    // Send To R alphabetically ordered
    WriteBool('R Options', 'bRCurrentLineToTop', actRCurrentLineToTop.Visible);
    WriteBool('R Options', 'bRKnitr', bRKnitr);
    WriteBool('R Options', 'bRSendBlockMarked', actRSendBlockMarked.Visible);
    WriteBool('R Options', 'bRSendClipboard', actRSendClipboard.Visible);
    WriteBool('R Options', 'bRSendContiguous', actRSendContiguous.Visible);
    WriteBool('R Options', 'bRSendCursorToBeginningLine', actRSendCursorToBeginningLine.Visible);
    WriteBool('R Options', 'bRSendCursorToEndLine', actRSendCursorToEndLine.Visible);
    WriteBool('R Options', 'bRSendFile', actRSendFile.Visible);
    WriteBool('R Options', 'bRSendLine', actRSendLine.Visible);
    WriteBool('R Options', 'bRSendLinesToEndPage', actRSendLinesToEndPage.Visible);
    WriteBool('R Options', 'bRSendSelection', actRSendSelection.Visible);
    WriteBool('R Options', 'bRSendSmart', actRSendSmart.Visible);
    WriteBool('R Options', 'bRSweave', actRSendSweave.Visible);

    // Controlling R alphabetically ordered
    WriteBool('R Options', 'bRClearAll', actRContClearAll.Visible);
    WriteBool('R Options', 'bRClearConsole', actRContClearConsole.Visible);
    WriteBool('R Options', 'bRCloseAllGraphics', actRContCloseAllGraphics.Visible);
    WriteBool('R Options', 'bREditVariable', actRContEditVariable.Visible);
    WriteBool('R Options', 'bREscape', actRContEscape.Visible);
    WriteBool('R Options', 'bRExampleSelectedWord', actRContExampleSelectedWord.Visible);
    WriteBool('R Options', 'bROpenExampleSelectedWord', actRContOpenExampleSelectedWord.Visible);
    WriteBool('R Options', 'bRFixVariable', actRContFixVariable.Visible);
    WriteBool('R Options', 'bRguiPuTTYStartClose', actRContGuiPuTTYStartClose.Visible);
    WriteBool('R Options', 'bRHelp', actRContHelp.Visible);
    WriteBool('R Options', 'bRHelpSelectedWord', actRContHelpSelectedWord.Visible);
    WriteBool('R Options', 'bRListAllObjects', actRContListAllObjects.Visible);
    WriteBool('R Options', 'bRListVariableNames', actRContListVariableNames.Visible);
    WriteBool('R Options', 'bRListVariableStructure', actRContListVariableStructure.Visible);
    WriteBool('R Options', 'bRPackages', actRContPackages.Visible);
    WriteBool('R Options', 'bRPlotVariable', actRContPlotVariable.Visible);
    WriteBool('R Options', 'bRPrintVariableContent', actRContPrintVariableContent.Visible);
    WriteBool('R Options', 'bRRemoveAllObjects', actRContRemoveAllObjects.Visible);
    WriteBool('R Options', 'bRSetWorkDir', actRContSetWorkDirectory.Visible);
    WriteBool('R Options', 'bRTCPConnection', actRContTCPConnection.Visible);
    WriteBool('R Options', 'bRtermStartClose', actRContTermStartClose.Visible);

    // Database status
    WriteInteger('Database', 'iCompletionBeforeChanges', iCompletionBeforeChanges);
    WriteInteger('Database', 'iRcardBeforeChanges', iRcardBeforeChanges);
    WriteInteger('Database', 'iRtipBeforeChanges', iRtipBeforeChanges);
    WriteInteger('Database', 'iShortcutsBeforeChanges', iShortcutsBeforeChanges);

    // Latex Dimensional
    WriteInteger('Latex', 'iCols', iCols);
    WriteInteger('Latex', 'iLatexDimensionalAlign', iLatexDimensionalAlign);
    WriteInteger('Latex', 'iLatexDimensionalElement', iLatexDimensionalElement);
    WriteInteger('Latex', 'iRows', iRows);
  end;

  // Pandoc history
  slPandocHistory     := TStringList.Create;
  slPandocHistory.Text:= sPandocHistory;
  i:= 0;
  while (slPandocHistory.Count >= 1) and
        (i < 10) do begin
    if (trim(slPandocHistory.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('Pandoc History',
                             IntToStr(i),
                             slPandocHistory.Strings[0]);
      inc(i);
    end;
    slPandocHistory.Delete(0);
  end;

  FreeAndNil(slPandocHistory);

  // Pandoc history: From
  slPandocHistoryFrom     := TStringList.Create;
  slPandocHistoryFrom.Text:= sPandocHistoryFrom;

  i:= 0;
  while (slPandocHistoryFrom.Count >= 1) and
        (i < 10) do begin
    if (trim(slPandocHistoryFrom.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('Pandoc History From',
                             IntToStr(i),
                             slPandocHistoryFrom.Strings[0]);
      inc(i);
    end;
    slPandocHistoryFrom.Delete(0);
  end;

  FreeAndNil(slPandocHistoryFrom);

  // Pandoc history: To
  slPandocHistoryTo     := TStringList.Create;
  slPandocHistoryTo.Text:= sPandocHistoryTo;

  i:= 0;
  while (slPandocHistoryTo.Count >= 1) and
        (i < 10) do begin
    if (trim(slPandocHistoryTo.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('Pandoc History To',
                             IntToStr(i),
                             slPandocHistoryTo.Strings[0]);
      inc(i);
    end;
    slPandocHistoryTo.Delete(0);
  end;
  FreeAndNil(slPandocHistoryTo);

  // Search Text History
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchTextHistory;
  i:= 0;
  while (slSearch.Count >= 1) and
        (i < iLastSearch) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('Search Text History',
                             IntToStr(i),
                             slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  // Replace Text History
  slReplace     := TStringList.Create;
  slReplace.Text:= sReplaceTextHistory;
  i:= 0;
  while (slReplace.Count >= 1) and
        (i < iLastSearch) do begin
    if (trim(slReplace.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Replace Text History',
                         IntToStr(i),
                         slReplace.Strings[0]);
      inc(i);
    end;
    slReplace.Delete(0);
  end;
  FreeAndNil(slReplace);

  // Search Dir History
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchDirHistory;
  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('Search Dir History',
                             IntToStr(i),
                             slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  // Search File Mask History
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchFileMaskHistory;
  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('Search File Mask History',
                             IntToStr(i),
                             slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  for i:= 0 to (frmTools.cbExplorerFavorites.Items.Count-1) do
    ifTinn_Tmp.WriteString('Explorer Favorites',
                           IntToStr(i),
                           frmTools.cbExplorerFavorites.Items.Strings[i]);

  i:= 0;
  while (slFileMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn_Tmp.WriteString('File MRU',
                           IntToStr(i),
                           slFileMRU.Values[IntToStr(i)]);
    inc(i);
  end;

  i:= 0;
  while (slprojectMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn_Tmp.WriteString('Project MRU',
                           IntToStr(i),
                           slprojectMRU.Values[IntToStr(i)]);
    inc(i);
  end;

  with slTextDiff do begin
    if (Count >= 1) then
      for i:= 0 to (Count-1) do
        ifTinn_Tmp.WriteString('Diff Options',
                               Names[i],
                               ValueFromIndex[i]);
    FreeAndNil(slTextDiff);
  end;

  // Send
  for i:= 1 to 10 do
    ifTinn_Tmp.WriteString('R Hotkeys Send',
                           'RHK' + IntToStr(i),
                           hkTinnR.strgHK_Send.Cells[1, i]);

  // Control
  for i:= 1 to 10 do
    ifTinn_Tmp.WriteString('R Hotkeys Control',
                           'RHK' + IntToStr(i),
                           hkTinnR.strgHK_Control.Cells[1, i]);

  // R Action Custom_1
  for i:= 1 to 10 do
    ifTinn_Tmp.WriteString('R Action Custom_1',
                           'RAC' + IntToStr(i),
                           hkTinnR.strgHK_CU1.Cells[0, i]);

  // R Action Custom_1 Hotkeys
  for i:= 1 to 10 do
    ifTinn_Tmp.WriteString('R Hotkeys Custom_1',
                           'RHKC' + IntToStr(i),
                           hkTinnR.strgHK_CU1.Cells[1, i]);

  // R Action Custom_2
  for i:= 1 to 10 do
    ifTinn_Tmp.WriteString('R Action Custom_2',
                           'RAC' + IntToStr(i),
                           hkTinnR.strgHK_CU2.Cells[0, i]);

  // R Action Custom_2 Hotkeys
  for i:= 1 to 10 do
    ifTinn_Tmp.WriteString('R Hotkeys Custom_2',
                           'RHKC' + IntToStr(i),
                           hkTinnR.strgHK_CU2.Cells[1, i]);
end;

procedure TfrmMain.pSaveNewIni_Editor;
begin
  // Editor
  if not DirectoryExists(sPath_Editor) then begin
    try
      CreateDir(sPath_Editor);
    except
      fMessageDlg(sPath_Editor + #13 + #13 +
                  'The path above is no allowed for your system previleges.' + #13 +
                  'The necessary ".ini" files related to "Editor" will not be saved!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;
  end;

  // Editor
  ifEditor_Tmp:= TIniFile.create(sPath_Editor +
                                 '\Editor.tmp');
  sPathIniEditor_Tmp:= (sPath_Editor +
                        '\Editor.tmp');
  if FileExists(sPathIniEditor_Tmp) then DeleteFile(sPathIniEditor_Tmp);  // Delete any old Editor.tmp

  with ifEditor_Tmp do begin
    // Gutter settings
    WriteBool('Gutter', 'bAutoSize', coEditor.Gutter.AutoSize);
    WriteBool('Gutter', 'bLeadingZeros', coEditor.Gutter.LeadingZeros);
    WriteBool('Gutter', 'bLineNumber', coEditor.Gutter.ShowLineNumbers);
    WriteBool('Gutter', 'bVisible', coEditor.Gutter.Visible);
    WriteBool('Gutter', 'bZeroStart', coEditor.Gutter.ZeroStart);
    WriteInteger('Gutter', 'iColor', coEditor.Gutter.Color);
    WriteInteger('Gutter', 'iDigitCount', coEditor.Gutter.DigitCount);
    WriteInteger('Gutter', 'iFont.Color', coEditor.Gutter.Font.Color);
    WriteInteger('Gutter', 'iFont.Size', coEditor.Gutter.Font.Size);
    WriteInteger('Gutter', 'iWidth', coEditor.Gutter.Width);
    WriteString('Gutter', 'sFont.Name', coEditor.Gutter.Font.Name);

    // Editor settings
    WriteBool('Editor', 'bAutocompletion', actAutoCompletion.Checked);
    WriteBool('Editor', 'bHideSelection', coEditor.HideSelection);
    WriteBool('Editor', 'bWantTabs', coEditor.WantTabs);
    WriteInteger('Editor', 'iExtraLineSpacing', coEditor.ExtraLineSpacing);
    WriteInteger('Editor', 'iFont.Color', coEditor.Font.Color);
    WriteInteger('Editor', 'iFont.Size', coEditor.Font.Size);
    WriteInteger('Editor', 'iInsertCaret', Integer(coEditor.InsertCaret));
    WriteInteger('Editor', 'iOptions', Integer(coEditor.Options));
    WriteInteger('Editor', 'iOverwriteCaret', Integer(coEditor.OverwriteCaret));
    WriteInteger('Editor', 'iRightEdge', coEditor.RightEdge);
    WriteInteger('Editor', 'iRightEdgeColor', coEditor.RightEdgeColor);
    WriteInteger('Editor', 'iSelectedColor.Background', coEditor.SelectedColor.Background);
    WriteInteger('Editor', 'iSelectedColor.Foreground', coEditor.SelectedColor.Foreground);
    WriteInteger('Editor', 'iTab.Width', coEditor.TabWidth);
    WriteString('Editor', 'sFont.Name', coEditor.Font.Name);
  end;

  FreeAndNil(ifEditor_Tmp);
end;

procedure TfrmMain.pWriteIniFile_Application(bMakingBackup: boolean);
var
  slSearch,
   slReplace,
   slPandocHistory,
    slPandocHistoryFrom,
    slPandocHistoryTo: TStringList;

  i: integer;

begin
  // Application
  if not DirectoryExists(sPath_App) then begin
    try
      CreateDir(sPath_App);
    except
      fMessageDlg(sPath_App + #13 + #13 +
                  'The path above is no allowed for your system previleges.' + #13 +
                  'The necessary ".ini" files related to "Application" will not be saved!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;
  end;

  // Application
  with ifTinn do begin
    // Version control
    WriteString('App', 'sVersion_Cache'     , sVersion_Cache);
    WriteString('App', 'sVersion_Comments'  , sVersion_Comments);
    WriteString('App', 'sVersion_Completion', sVersion_Completion);
    WriteString('App', 'sVersion_Rcard'     , sVersion_Rcard);
    WriteString('App', 'sVersion_Rmirrors'  , sVersion_Rmirrors);
    WriteString('App', 'sVersion_Shortcuts' , sVersion_Shortcuts);

    // Last path
    WriteString('App', 'sWorkingDir', sWorkingDir);

    // On top
    WriteBool('App', 'bAlwaysOnTop', actOnTop.Checked);

    // Max files in File MRU
    WriteInteger('App', 'iLastFile', iLastFile);

    // Toolbars
    WriteBool('App', 'bTobEdit.Visible', tobEdit.Visible);
    WriteBool('App', 'bTobFile.Visible', tobFile.Visible);
    WriteBool('App', 'bTobFilter.Visible', tobFilter.Visible);
    WriteBool('App', 'bTobFormat.Visible', tobFormat.Visible);
    WriteBool('App', 'bTobMacro.Visible', tobMacro.Visible);
    WriteBool('App', 'bTobMisc.Visible', tobMisc.Visible);
    WriteBool('App', 'bTobProcessing.Visible', tobProcessing.Visible);
    WriteBool('App', 'bTobSearch.Visible', tobSearch.Visible);
    WriteBool('App', 'bTobSpell.Visible', tobSpell.Visible);
    WriteBool('App', 'bTobSyntax.Visible', tobSyntax.Visible);
    WriteBool('App', 'bTobView.Visible', tobView.Visible);
    WriteBool('TBRMain', 'bTobVisible', actTobRVisible.Checked);
    WriteInteger('App', 'iCompletion.Height', frmTools.panCompletion.Height);
    WriteInteger('App', 'iCompletion.ItemIndex', frmTools.lbCompletion.ItemIndex);
    WriteInteger('App', 'iCountries.Height', frmTools.panCountries.Height);
    WriteInteger('App', 'iCountries.ItemIndex', frmTools.lbCountries.ItemIndex);
    WriteInteger('App', 'iRcard.Height', frmTools.panRcard.Height);
    WriteInteger('App', 'iRcard.ItemIndex', frmTools.lbRcard.ItemIndex);
    WriteInteger('App', 'iRExplorer.Width', frmTools.panRExplorer.Width);
    WriteInteger('App', 'iShortcuts.Height', frmTools.panShortcuts.Height);
    WriteInteger('App', 'iShortcuts.ItemIndex', frmTools.lbShortcuts.ItemIndex);
    WriteInteger('App', 'iSpellLanguage.ItemIndex', cbSpellLanguage.ItemIndex);
    WriteInteger('App', 'iTobEdit.Left', tobEdit.Left);
    WriteInteger('App', 'iTobEdit.Top', tobEdit.Top);
    WriteInteger('App', 'iTobFile.Left', tobFile.Left);
    WriteInteger('App', 'iTobFile.Top', tobFile.Top);
    WriteInteger('App', 'iTobFilter.Left', tobFilter.Left);
    WriteInteger('App', 'iTobFilter.Top', tobFilter.Top);
    WriteInteger('App', 'iTobFormat.Left', tobFormat.Left);
    WriteInteger('App', 'iTobFormat.Top', tobFormat.Top);
    WriteInteger('App', 'iTobMacro.Left', tobMacro.Left);
    WriteInteger('App', 'iTobMacro.Top', tobMacro.Top);
    WriteInteger('App', 'iTobMisc.Left', tobMisc.Left);
    WriteInteger('App', 'iTobMisc.Top', tobMisc.Top);
    WriteInteger('App', 'iTobProcessing.Left', tobProcessing.Left);
    WriteInteger('App', 'iTobProcessing.Top', tobProcessing.Top);
    WriteInteger('App', 'iTobSearch.Left', tobSearch.Left);
    WriteInteger('App', 'iTobSearch.Top', tobSearch.Top);
    WriteInteger('App', 'iTobSpell.Left', tobSpell.Left);
    WriteInteger('App', 'iTobSpell.Top', tobSpell.Top);
    WriteInteger('App', 'iTobSyntax.Left', tobSyntax.Left);
    WriteInteger('App', 'iTobSyntax.Top', tobSyntax.Top);
    WriteInteger('App', 'iTobView.Left', tobView.Left);
    WriteInteger('App', 'iTobView.Top', tobView.Top);
    WriteInteger('App', 'iWinExplorer.Height', frmTools.panWinExplorer.Height);
    WriteInteger('App', 'iWorkExplorer.Height', frmTools.panWorkExplorer.Height);

    // Rterm
    WriteBool('App', 'bRtermCanFloat', bRtermCanFloat);
    WriteBool('App', 'bRtermSend_Plus', bRtermSend_Plus);
    WriteBool('App', 'bRtermCloseWithoutAsk', bRtermCloseWithoutAsk);
    WriteBool('App', 'bRtermHorizontal', bRtermHorizontal);
    WriteBool('App', 'bRtermSingle', bRtermSingle);
    WriteInteger('App', 'iIO_Syntax', iIO_Syntax);
    WriteInteger('App', 'iLOG_Syntax', iLOG_Syntax);
    WriteInteger('App', 'iRterm.Size', frmRterm.iSize);
    WriteInteger('App', 'iSynLog2.Height', frmRterm.iSynLog2Height);
    WriteInteger('App', 'iSynLog2.Width', frmRterm.iSynLog2Width);

    // Tools
    WriteBool('App', 'bToolsCanFloat', bToolsCanFloat);
    WriteInteger('App', 'iDatabase.TabIndex', frmTools.pgDatabase.TabIndex);
    WriteInteger('App', 'iLatex.TabIndex', frmTools.pgLatex.TabIndex);
    WriteInteger('App', 'iMarkup.TabIndex', frmTools.pgMarkup.TabIndex);
    WriteInteger('App', 'iMisc.TabIndex', frmTools.pgMisc.TabIndex);
    WriteInteger('App', 'iR.TabIndex', frmTools.pgR.TabIndex);
    WriteInteger('App', 'iResults.TabIndex', frmTools.pgResults.TabIndex);
    WriteInteger('App', 'iTools.Size', frmTools.iSize);
    WriteInteger('App', 'iTools.TabIndex', frmTools.pgTools.TabIndex);
    WriteInteger('App', 'iTxt2tags.TabIndex', frmTools.pgTxt2tags.TabIndex);

    // Tools visibility
    WriteBool('App', 'bDatabase.Visible', actDatabaseVisible.Checked);
    WriteBool('App', 'bDataComments.Visible', actDataCommentsVisible.Checked);
    WriteBool('App', 'bDataCompletion.Visible', actDataCompletionVisible.Checked);
    WriteBool('App', 'bDataRcard.Visible', actDataRcardVisible.Checked);
    WriteBool('App', 'bDataRmirrors.Visible', actDataRmirrorsVisible.Checked);
    WriteBool('App', 'bDataShortcuts.Visible', actDataShortcutsVisible.Checked);
    WriteBool('App', 'bHexViewer.Visible', actHexViewerVisible.Checked);
    WriteBool('App', 'bIniLog.Visible', actIniLogVisible.Checked);
    WriteBool('App', 'bLatex.Visible', actLatexVisible.Checked);
    WriteBool('App', 'bMarkup.Visible', actMarkupVisible.Checked);
    WriteBool('App', 'bMisc.Visible', actMiscVisible.Checked);
    WriteBool('App', 'bProject.Visible', actProjectVisible.Checked);
    WriteBool('App', 'bR.Visible', actRVisible.Checked);
    WriteBool('App', 'bResults.Visible', actResultsVisible.Checked);
    WriteBool('App', 'bRExplorer.Visible', actRExplorerVisible.Checked);
    WriteBool('App', 'bSearch.Visible', actSearchVisible.Checked);
    WriteBool('App', 'bSpell.Visible', actSpellVisible.Checked);
    WriteBool('App', 'bTxt2tags.Visible', actTxt2tagsVisible.Checked);
    WriteBool('App', 'bWinExpl.Visible', actWinExplVisible.Checked);
    WriteBool('App', 'bWorkExpl.Visible', actWorkExplVisible.Checked);

    // Misc
    WriteBool('App', 'bActiveLine', bActiveLine);
    WriteBool('App', 'bAllNames', bAllNames);
    WriteBool('App', 'bAlwaysAddBOM', actAlwaysAddBOM.Checked);
    WriteBool('App', 'bApplyToANSI', actApplyToANSI.Checked);
    WriteBool('App', 'bCloseDVIViewer', actCloseDVIViewer.Checked);
    WriteBool('App', 'bClosePDFViewer', actClosePDFViewer.Checked);
    WriteBool('App', 'bComAutoDetect_Language', frmTools.cbComAutoDetect_Language.Checked);
    WriteBool('App', 'bComPriority_Line', frmTools.cbComPriority_Line.Checked);
    WriteBool('App', 'bConnectionBeepOnError', bConnectionBeepOnError);
    WriteBool('App', 'bDataCompletionAnywhere', bDataCompletionAnywhere);
    WriteBool('App', 'bDosMinimizedAlways', actDosMinimizedAlways.Checked);
    WriteBool('App', 'bDviOpenAlways', actDviOpenAlways.Checked);
    WriteBool('App', 'bEditorLineWrap', actEditorLineWrap.Checked);
    WriteBool('App', 'bFormatR', actFormatR.Visible);
    WriteBool('App', 'bHtmlOpenAlways', actHtmlOpenAlways.Checked);
    WriteBool('App', 'bIOLineWrap', actRtermIOLineWrap.Checked);
    WriteBool('App', 'bIPLocal', bIPLocal);
    WriteBool('App', 'bLogLineWrap', actRtermLogLineWrap.Checked);
    WriteBool('App', 'bMinimizeTinnAfterLastFile', bMinimizeTinnAfterLastFile);
    WriteBool('App', 'bNotification', actNotification.Checked);
    WriteBool('App', 'bNotification_US', actNotification_US.Checked);
    WriteBool('App', 'bOpenMaximized', actOpenMaximized.Checked);
    WriteBool('App', 'bOrganizeAutomatically', bOrganizeAutomatically);
    WriteBool('App', 'bPdfOpenAlways', actPdfOpenAlways.Checked);
    WriteBool('App', 'bPgFiles.Visible', actPgFilesVisible.Checked);
    WriteBool('App', 'bRArchitecture64', bRArchitecture64);
    WriteBool('App', 'bRAsServer', bRAsServer);
    WriteBool('App', 'bRComplexDefault', actRComplexDefault.Checked);
    WriteBool('App', 'bREcho', actREcho.Checked);
    WriteBool('App', 'bRememberFileState', bRememberFileState);
    WriteBool('App', 'bRemoveExtension', bRemoveExtension);
    WriteBool('App', 'bRestoreIniDock', bRestoreIniDock);
    WriteBool('App', 'bRguiReturnFocus', bRguiReturnFocus);
    WriteBool('App', 'bRMirros_Update', bRMirros_Update);
    WriteBool('App', 'bRSendAll', bRSendAll);
    WriteBool('App', 'bRSetget_Info', bRSetget_Info);
    WriteBool('App', 'bRSetWorkDir_Starting', bRSetWorkDir_Starting);
    WriteBool('App', 'bRSimpleDefault', actRSimpleDefault.Checked);
    WriteBool('App', 'bRSmart', bRSmart);
    WriteBool('App', 'bRsvSocketConnect', bRsvSocket_Connect);
    WriteBool('App', 'bRTCPIPConsoleEcho', bRTCPIPConsoleEcho);
    WriteBool('App', 'bRTCPIPConsoleUse', bRTCPIPConsoleUse);
    WriteBool('App', 'bRtermBeepOnError', bRtermBeepOnError);
    WriteBool('App', 'bRtermFindError', bRtermFindError);
    WriteBool('App', 'bRtermWidth', bRtermWidth);
    WriteBool('App', 'bRTinnRcomInstall', bRTinnRcom_Install);
    WriteBool('App', 'bRTinnRcomLoad', bRTinnRcom_Load);
    WriteBool('App', 'bRUseLatest', bRUseLatest);
    WriteBool('App', 'bScrollSendingLines', bScrollSendingLines);
    WriteBool('App', 'bShowAllBars', actShowAllBars.Checked);
    WriteBool('App', 'bStatusBar', actStatusBarVisible.Checked);
    WriteBool('App', 'bTextDefault', actTextDefault.Checked);
    WriteBool('App', 'bTinnRHotKeys', bTinnRHotKeys);
    WriteBool('App', 'bUndoAfterSave', bUndoAfterSave);
    WriteInteger('App', 'clActiveLine', Tcolor(clActiveLine));
    WriteInteger('App', 'clBGApplication', Tcolor(clBGApplication));
    WriteInteger('App', 'clBGForAllHighlighters', Tcolor(clBGForAllHighlighters));
    WriteInteger('App', 'clBGPreferred', Tcolor(clBGPreferred));
    WriteInteger('App', 'clBGTabSelectedNew', Tcolor(clBGTabSelectedNew));
    WriteInteger('App', 'clBrackets', Tcolor(clBrackets));
    WriteInteger('App', 'clFGApplication', Tcolor(clFGApplication));
    WriteInteger('App', 'iDelay', iDelay);
    WriteInteger('App', 'iIPPortLocal', iIPPortLocal);
    WriteInteger('App', 'iIPPortRemote', iIPPortRemote);
    WriteInteger('App', 'iMaxDeparseLength', iMaxDeparseLength);
    WriteInteger('App', 'iPandocFrom', iPandocFrom);
    WriteInteger('App', 'iPandocTo', iPandocTo);
    WriteInteger('App', 'iPgFiles.TabsPosition', integer(pgFiles.TabsPosition));
    WriteInteger('App', 'iPgRterm.TabsPosition', integer(frmRterm.pgRterm.TabsPosition));
    WriteInteger('App', 'iPgTools.TabsPosition', integer(frmTools.pgTools.TabsPosition));
    WriteInteger('App', 'iRecognition_Caption', iRecognition_Caption);
    WriteInteger('App', 'iReformatRSplit', iReformatRSplit);
    WriteInteger('App', 'iRguiTinnR_Disposition', iRguiTinnR_Disposition);
    WriteInteger('App', 'iRguiTinnR_Proportion', iRguiTinnR_Proportion);
    WriteInteger('App', 'iTransparency', iTransparency);
    WriteInteger('App', 'iViewStyleRExplorer', iViewStyleRExplorer);
    WriteString('App', 'sAppSelected', sAppSelected);
    WriteString('App', 'sEncodingDefault', fGetEncodingDefault);
    WriteString('App', 'sEndComment', sEndComment);
    WriteString('App', 'sEOLDefault', fGetEOLDefault);
    WriteString('App', 'sFormatR', sFormatR);
    WriteString('App', 'sKnit', sKnit);
    WriteString('App', 'sIPHostLocal', sIPHostLocal);
    WriteString('App', 'sIPHostRemote', sIPHostRemote);
    WriteString('App', 'sParDeplate', sParDeplate);
    WriteString('App', 'sParDviBibtex', sParDviBibtex);
    WriteString('App', 'sParDviSingle', sParDviSingle);
    WriteString('App', 'sParPdfBibtex', sParPdfBibtex);
    WriteString('App', 'sParPdfSingle', sParPdfSingle);
    WriteString('App', 'sParRgui', sParRgui);
    WriteString('App', 'sParRPuTTY', sParRPuTTY);
    WriteString('App', 'sParRterm', sParRterm);
    WriteString('App', 'sParTxt2tags', sParTxt2tags);
    WriteString('App', 'sPath_Pandoc', sPath_Pandoc);
    WriteString('App', 'sPath_Rgui', sPath_Rgui);
    WriteString('App', 'sPath_Rterm', sPath_Rterm);
    WriteString('App', 'sPathDeplate_Converter', sPathDeplate_Converter);
    WriteString('App', 'sPathDeplate_Interpreter', sPathDeplate_Interpreter);
    WriteString('App', 'sPathTxt2tags_Converter', sPathTxt2tags_Converter);
    WriteString('App', 'sPathTxt2tags_Interpreter', sPathTxt2tags_Interpreter);
    WriteString('App', 'sPuttyHost', sPuttyHost);
    WriteString('App', 'sPuttyPassword', sPuttyPassword);
    WriteString('App', 'sPuttyUser', sPuttyUser);
    WriteString('App', 'sRLibPathDefault', sRLibPathDefault);
    WriteString('App', 'sRmirror', sRmirror);
    WriteString('App', 'sShortcutsInUse', sShortcutsInUse);

    // Search settings
    WriteBool('Search', 'bSearchBackwards', bSearchBackwards);
    WriteBool('Search', 'bSearchCaseSensitive', bSearchCaseSensitive);
    WriteBool('Search', 'bSearchDirectory', bSearchDirectory);
    WriteBool('Search', 'bSearchFromCursor', bSearchFromCursor);
    WriteBool('Search', 'bSearchInSub', bSearchInSub);
    WriteBool('Search', 'bSearchOpenFiles', bSearchOpenFiles);
    WriteBool('Search', 'bSearchRegExp', bSearchRegExp);
    WriteBool('Search', 'bSearchWholeWords', bSearchWholeWords);
    WriteInteger('Search', 'iLastSearch', iLastSearch);

    // Print settings
    WriteBool('Print', 'bPrintColors', bPrintColors);
    WriteBool('Print', 'bPrintFileName', bPrintFileName);
    WriteBool('Print', 'bPrintLineNumber', bPrintLineNumber);
    WriteBool('Print', 'bPrintLineWrap', bPrintLineWrap);
    WriteBool('Print', 'bPrintPageNumber', bPrintPageNumber);
    WriteBool('Print', 'bPrintSyntaxColor', bPrintSyntaxColor);
    WriteInteger('Print', 'iScaleMode', iScaleMode);
    WriteInteger('Print', 'iZoomPreview', iZoomPreview);

    ifTinn.EraseSection('Pandoc History');
    ifTinn.EraseSection('Pandoc History From');
    ifTinn.EraseSection('Pandoc History To');
    ifTinn.EraseSection('Search Text History');
    ifTinn.EraseSection('Replace Text History');

    // Send To R alphabetically ordered
     WriteBool('R Options', 'bRKnitr', bRKnitr);
    WriteBool('R Options', 'bRSendBlockMarked', actRSendBlockMarked.Visible);
    WriteBool('R Options', 'bRSendClipboard', actRSendClipboard.Visible);
    WriteBool('R Options', 'bRSendContiguous', actRSendContiguous.Visible);
    WriteBool('R Options', 'bRSendCursorToBeginningLine', actRSendCursorToBeginningLine.Visible);
    WriteBool('R Options', 'bRSendCursorToEndLine', actRSendCursorToEndLine.Visible);
    WriteBool('R Options', 'bRSendFile', actRSendFile.Visible);
    WriteBool('R Options', 'bRSendLine', actRSendLine.Visible);
    WriteBool('R Options', 'bRSendLinesToEndPage', actRSendLinesToEndPage.Visible);
    WriteBool('R Options', 'bRSendSelection', actRSendSelection.Visible);
    WriteBool('R Options', 'bRSendSmart', actRSendSmart.Visible);
    WriteBool('R Options', 'bRSweave', actRSendSweave.Visible);
   WriteBool('R Options', 'bRCurrentLineToTop', actRCurrentLineToTop.Visible);

    // Controlling R alphabetically ordered
    WriteBool('R Options', 'bRClearAll', actRContClearAll.Visible);
    WriteBool('R Options', 'bRClearConsole', actRContClearConsole.Visible);
    WriteBool('R Options', 'bRCloseAllGraphics', actRContCloseAllGraphics.Visible);
    WriteBool('R Options', 'bREditVariable', actRContEditVariable.Visible);
    WriteBool('R Options', 'bREscape', actRContEscape.Visible);
    WriteBool('R Options', 'bRExampleSelectedWord', actRContExampleSelectedWord.Visible);
    WriteBool('R Options', 'bROpenExampleSelectedWord', actRContOpenExampleSelectedWord.Visible);
    WriteBool('R Options', 'bRFixVariable', actRContFixVariable.Visible);
    WriteBool('R Options', 'bRguiPuTTYStartClose', actRContGuiPuTTYStartClose.Visible);
    WriteBool('R Options', 'bRHelp', actRContHelp.Visible);
    WriteBool('R Options', 'bRHelpSelectedWord', actRContHelpSelectedWord.Visible);
    WriteBool('R Options', 'bRListAllObjects', actRContListAllObjects.Visible);
    WriteBool('R Options', 'bRListVariableNames', actRContListVariableNames.Visible);
    WriteBool('R Options', 'bRListVariableStructure', actRContListVariableStructure.Visible);
    WriteBool('R Options', 'bRPackages', actRContPackages.Visible);
    WriteBool('R Options', 'bRPlotVariable', actRContPlotVariable.Visible);
    WriteBool('R Options', 'bRPrintVariableContent', actRContPrintVariableContent.Visible);
    WriteBool('R Options', 'bRRemoveAllObjects', actRContRemoveAllObjects.Visible);
    WriteBool('R Options', 'bRSetWorkDir', actRContSetWorkDirectory.Visible);
    WriteBool('R Options', 'bRTCPConnection', actRContTCPConnection.Visible);
    WriteBool('R Options', 'bRtermStartClose', actRContTermStartClose.Visible);

    // Database status
    WriteInteger('Database', 'iCompletionBeforeChanges', iCompletionBeforeChanges);
    WriteInteger('Database', 'iRcardBeforeChanges', iRcardBeforeChanges);
    WriteInteger('Database', 'iRtipBeforeChanges', iRtipBeforeChanges);
    WriteInteger('Database', 'iShortcutsBeforeChanges', iShortcutsBeforeChanges);

    // Latex Dimensional
    WriteInteger('Latex', 'iCols', iCols);
    WriteInteger('Latex', 'iLatexDimensionalAlign', iLatexDimensionalAlign);
    WriteInteger('Latex', 'iLatexDimensionalElement', iLatexDimensionalElement);
    WriteInteger('Latex', 'iRows', iRows);
  end;

  // Pandoc history
  slPandocHistory     := TStringList.Create;
  slPandocHistory.Text:= sPandocHistory;
  i:= 0;
  while (slPandocHistory.Count >= 1) and
        (i < 10) do begin
    if (trim(slPandocHistory.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Pandoc History',
                         IntToStr(i),
                         slPandocHistory.Strings[0]);
      inc(i);
    end;
    slPandocHistory.Delete(0);
  end;
  FreeAndNil(slPandocHistory);

  // Pandoc history: From
  slPandocHistoryFrom     := TStringList.Create;
  slPandocHistoryFrom.Text:= sPandocHistoryFrom;

  i:= 0;
  while (slPandocHistoryFrom.Count >= 1) and
        (i < 10) do begin
    if (trim(slPandocHistoryFrom.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Pandoc History From',
                         IntToStr(i),
                         slPandocHistoryFrom.Strings[0]);
      inc(i);
    end;
    slPandocHistoryFrom.Delete(0);
  end;
  FreeAndNil(slPandocHistoryFrom);

  // Pandoc history: To
  slPandocHistoryTo     := TStringList.Create;
  slPandocHistoryTo.Text:= sPandocHistoryTo;

  i:= 0;
  while (slPandocHistoryTo.Count >= 1) and
        (i < 10) do begin
    if (trim(slPandocHistoryTo.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Pandoc History To',
                         IntToStr(i),
                         slPandocHistoryTo.Strings[0]);
      inc(i);
    end;
    slPandocHistoryTo.Delete(0);
  end;
  FreeAndNil(slPandocHistoryTo);

  // Search Text History
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchTextHistory;
  i:= 0;
  while (slSearch.Count >= 1) and
        (i < iLastSearch) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Search Text History',
                         IntToStr(i),
                         slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  // Replace Text History
  slReplace     := TStringList.Create;
  slReplace.Text:= sReplaceTextHistory;
  i:= 0;
  while (slReplace.Count >= 1) and
        (i < iLastSearch) do begin
    if (trim(slReplace.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Replace Text History',
                         IntToStr(i),
                         slReplace.Strings[0]);
      inc(i);
    end;
    slReplace.Delete(0);
  end;
  FreeAndNil(slReplace);

  // Search Dir History
  ifTinn.EraseSection('Search Dir History');
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchDirHistory;
  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Search Dir History',
                         IntToStr(i),
                         slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  // Search File Mask History
  ifTinn.EraseSection('Search File Mask History');
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchFileMaskHistory;
  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('Search File Mask History',
                         IntToStr(i),
                         slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  pSaveEditorKeystrokes;

  // Explorer Favorites
  ifTinn.EraseSection('Explorer Favorites');
  for i:= 0 to (frmTools.cbExplorerFavorites.Items.Count - 1) do
    ifTinn.WriteString('Explorer Favorites',
                       IntToStr(i),
                       frmTools.cbExplorerFavorites.Items.Strings[i]);

  // File MRU
  ifTinn.EraseSection('File MRU');
  i:= 0;
  while (slFileMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn.WriteString('File MRU',
                       IntToStr(i),
                       slFileMRU.Values[IntToStr(i)]);
    inc(i);
    if not bMakingBackup then slFileMRU.Delete(0);
  end;

  // Project MRU
  ifTinn.EraseSection('Project MRU');
  i:= 0;
  while (slprojectMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn.WriteString('Project MRU',
                       IntToStr(i),
                       slprojectMRU.Values[IntToStr(i)]);
    inc(i);
    if not bMakingBackup then slprojectMRU.Delete(0);
  end;

  // Send
  for i:= 1 to 10 do
    ifTinn.WriteString('R Hotkeys Send',
                       'RHK' + IntToStr(i),
                       hkTinnR.strgHK_Send.Cells[1, i]);

  // Control
  for i:= 1 to 10 do
    ifTinn.WriteString('R Hotkeys Control',
                       'RHK' + IntToStr(i),
                       hkTinnR.strgHK_Control.Cells[1, i]);

  // R Action Custom_1
  for i:= 1 to 10 do
    ifTinn.WriteString('R Action Custom_1',
                       'RAC' + IntToStr(i),
                       hkTinnR.strgHK_CU1.Cells[0, i]);

  // R Action Custom_1 Hotkeys
  for i:= 1 to 10 do
    ifTinn.WriteString('R Hotkeys Custom_1',
                       'RHKC' + IntToStr(i),
                       hkTinnR.strgHK_CU1.Cells[1, i]);

  // R Action Custom_2
  for i:= 1 to 10 do
    ifTinn.WriteString('R Action Custom_2',
                       'RAC' + IntToStr(i),
                       hkTinnR.strgHK_CU2.Cells[0, i]);

  // R Action Custom_2 Hotkeys
  for i:= 1 to 10 do
    ifTinn.WriteString('R Hotkeys Custom_2',
                       'RHKC' + IntToStr(i),
                       hkTinnR.strgHK_CU2.Cells[1, i]);

  if not bMakingBackup then begin
    if Assigned(hkTinnR) then FreeAndNil(hkTinnR);
    if Assigned(ifTinn) then FreeAndNil(ifTinn);
  end;
end;

procedure TfrmMain.pWriteIniFile_Editor(bMakingBackup: boolean);
begin
  // Editor
  if not DirectoryExists(sPath_Editor) then begin
    try
      CreateDir(sPath_Editor);
    except
      fMessageDlg(sPath_Editor + #13 + #13 +
                  'The path above is no allowed for your system previleges.' + #13 +
                  'The necessary ".ini" files related to "Editor" will not be saved!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;
  end;

  with ifEditor do begin
    // Gutter settings
    WriteBool('Gutter', 'bAutoSize', coEditor.Gutter.AutoSize);
    WriteBool('Gutter', 'bLeadingZeros', coEditor.Gutter.LeadingZeros);
    WriteBool('Gutter', 'bLineNumber', coEditor.Gutter.ShowLineNumbers);
    WriteBool('Gutter', 'bVisible', coEditor.Gutter.Visible);
    WriteBool('Gutter', 'bZeroStart', coEditor.Gutter.ZeroStart);
    WriteInteger('Gutter', 'iColor', coEditor.Gutter.Color);
    WriteInteger('Gutter', 'iDigitCount', coEditor.Gutter.DigitCount);
    WriteInteger('Gutter', 'iFont.Color', coEditor.Gutter.Font.Color);
    WriteInteger('Gutter', 'iFont.Size', coEditor.Gutter.Font.Size);
    WriteInteger('Gutter', 'iWidth', coEditor.Gutter.Width);
    WriteString('Gutter', 'sFont.Name', coEditor.Gutter.Font.Name);

    // Editor settings
    WriteBool('Editor', 'bAutocompletion', actAutoCompletion.Checked);
    WriteBool('Editor', 'bHideSelection', coEditor.HideSelection);
    WriteBool('Editor', 'bWantTabs', coEditor.WantTabs);
    WriteInteger('Editor', 'iExtraLineSpacing', coEditor.ExtraLineSpacing);
    WriteInteger('Editor', 'iFont.Color', coEditor.Font.Color);
    WriteInteger('Editor', 'iFont.Size', coEditor.Font.Size);
    WriteInteger('Editor', 'iInsertCaret', Integer(coEditor.InsertCaret));
    WriteInteger('Editor', 'iOptions', Integer(coEditor.Options));
    WriteInteger('Editor', 'iOverwriteCaret', Integer(coEditor.OverwriteCaret));
    WriteInteger('Editor', 'iRightEdge', coEditor.RightEdge);
    WriteInteger('Editor', 'iRightEdgeColor', coEditor.RightEdgeColor);
    WriteInteger('Editor', 'iSelectedColor.Background', coEditor.SelectedColor.Background);
    WriteInteger('Editor', 'iSelectedColor.Foreground', coEditor.SelectedColor.Foreground);
    WriteInteger('Editor', 'iTab.Width', coEditor.TabWidth);
    WriteString('Editor', 'sFont.Name', coEditor.Font.Name);
  end;

  if not bMakingBackup then begin
    if Assigned(coEditor) then FreeAndNil(coEditor);
    if Assigned(ifEditor) then FreeAndNil(ifEditor);
  end;
end;

function TfrmMain.fGetEncodingDefault: string;
begin
  if      actANSI.Checked    then Result:= 'ANSI'
  else if actUTF8.Checked    then Result:= 'UTF8'
  else if actUTF16LE.Checked then Result:= 'UTF16LE'
  else if actUTF16BE.Checked then Result:= 'UTF16BE';
end;

function TfrmMain.fGetEOLDefault: string;
begin
  if      actWIN.Checked  then Result:= 'WIN'
  else if actMAC.Checked  then Result:= 'MAC'
  else if actUNIX.Checked then Result:= 'UNIX';
end;

procedure TfrmMain.pSetEOLDefault(sTmp: string);
begin
  case fStringToCase_Select(sTmp,
                            ['WIN',
                             'MAC',
                             'UNIX']) of
    0: actWINExecute(Self);   // WIN
    1: actMACExecute(Self);   // MAC
    2: actUNIXExecute(Self);  // UNIX
  end;
end;

procedure TfrmMain.pSetEncodingDefault(sTmp: string);
begin
  case fStringToCase_Select(sTmp,
                            ['ANSI',
                             'UTF8',
                             'UTF16LE',
                             'UTF16BE']) of
    0: actANSIExecute(Self);     // ANSI
    1: actUTF8Execute(Self);     // UTF-8
    2: actUTF16LEExecute(Self);  // UTF-16 LE
    3: actUTF16BEExecute(Self);  // UTF-16 BE
  end;
end;

function TfrmMain.fGetSaveFormat(uStrings: TUnicodeStrings): string;
var
  sf: TSaveFormat;
  
begin
  sf:= TSynEditStringList(uStrings).SaveFormat;

  case sf of
    sfANSI:     Result:= 'ANSI';
    sfUTF8:     Result:= 'UTF-8';
    sfUTF16LSB: Result:= 'UTF16-LE';
    sfUTF16MSB: Result:= 'UTF16-BE';
  end;
end;

procedure TfrmMain.pGetFile_Info(sFileName: string;
                                     uStrings: TUnicodeStrings;
                                     bConverting: boolean = False);
var
  sff,
   ssf: string;

begin
  ssf:= fGetSaveFormat(uStrings);

  case TSynEditStringList(uStrings).FileFormat of
    sffDOS:  sff:= 'WIN';
    sffUNIX: sff:= 'UNIX';
    sffMAC:  sff:= 'MAC';
    else     sff:= 'UNK';
  end;

  // The file does not exists physically in the HD yet!
  if (ExtractFileExt(sFileName) = EmptyStr) and
     (Pos('Untitled',
          sFileName) > 0) then begin

    with stbMain do
      Panels[0].Text:= ssf;
  end
  else begin
    // The file should already exist physically in the HD!
    if (not FileExists(sFileName)) then Exit;

    seUsed:= GetEncoding(sFileName,
                         bBOM);

    with stbMain do
      if (not bConverting and bBOM) then Panels[0].Text:= ssf + ' BOM'
                                    else Panels[0].Text:= ssf;
  end;

  with stbMain do
    Panels[1].Text:= sff;
end;

procedure TfrmMain.pSetBuffer_SaveFormat(sf: TSaveFormat);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    TSynEditStringList(synEditor.Lines).SaveFormat:= sf;
    synEditor.Modified:= True;
    pSetTabTitle('*');
    pCheckSaveStatus;
    pGetFile_Info(sActiveFile,
                  synEditor.Lines,
                  True);  // True because is converting
  end;
end;

procedure TfrmMain.pSetBuffer_FileFormat(ff: TSynEditFileFormat);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    TSynEditStringList(synEditor.Lines).FileFormat:= ff;
    synEditor.Modified:= True;
    pSetTabTitle('*');
    pCheckSaveStatus;
    pGetFile_Info(sActiveFile,
                  synEditor.Lines,
                  True);  // True because is converting
  end;
end;

procedure TfrmMain.pSetPreferences_Application;

//  function fReadRegEntry(strSubKey,
//                         strValueName: string): string;
//  var
//   Key: HKey;
//
//   Buffer: array[0..255] of char;
//
//   Size: cardinal;
//
//  begin
//   Result:= 'ERROR';
//   Size := SizeOf(Buffer);
//   if RegOpenKeyEx(HKEY_LOCAL_MACHINE,
//                   PChar(strSubKey),
//                   0,
//                   KEY_READ,
//                   Key) = ERROR_SUCCESS then
//
//     if RegQueryValueEx(Key,
//                        PChar(strValueName),
//                        nil,
//                        nil,
//                        @Buffer,
//                        @Size) = ERROR_SUCCESS then Result := Buffer;
//
//   RegCloseKey(Key);
//  end;

var
  i,
   iPos,
   iTmp: integer;

  slTmpFavoriteFolders,
   slFavoriteFolders,
   slSearch,
   slReplace,
   slPandocHistory,
   slPandocHistoryFrom,
   slPandocHistoryTo,
   slSubkeys: TStringList;

  sTmp: string;

  bTop: boolean;

begin
  TBIniLoadPositions(Self,
                     sPathIniTinn_File,
                     EmptyStr);

  actTobRVisible.Checked:= ifTinn.ReadBool('TBRMain', 'bTobVisible', True);

  // Dir and Top
  bTop       := ifTinn.ReadBool('App', 'bAlwaysOnTop', False);
  sWorkingDir:= trim(ifTinn.ReadString('App', 'sWorkingDir', EmptyStr));
  if (bTop) then actOnTopExecute(nil);

  // File Bar
  tobFile.Left   := ifTinn.ReadInteger('App', 'iTobFile.Left', tobFile.Left);
  tobFile.Top    := ifTinn.ReadInteger('App', 'iTobFile.Top', tobFile.Top);
  tobFile.Visible:= ifTinn.ReadBool('App', 'bTobFile.Visible', True);
  actTobFilesVisible.Checked:= tobFile.Visible;

  // Edit Bar
  tobEdit.Left   := ifTinn.ReadInteger('App', 'iTobEdit.Left', tobEdit.Left);
  tobEdit.Top    := ifTinn.ReadInteger('App', 'iTobEdit.Top', tobEdit.Top);
  tobEdit.Visible:= ifTinn.ReadBool('App', 'bTobEdit.Visible', True);
  actTobEditVisible.Checked:= tobEdit.Visible;

  // Search Bar
  tobSearch.Left   := ifTinn.ReadInteger('App', 'iTobSearch.Left', tobSearch.Left);
  tobSearch.Top    := ifTinn.ReadInteger('App', 'iTobSearch.Top', tobSearch.Top);
  tobSearch.Visible:= ifTinn.ReadBool('App', 'bTobSearch.Visible', True);
  actTobSearchVisible.Checked:= tobSearch.Visible;

  // Misc Bar
  tobMisc.Left   := ifTinn.ReadInteger('App', 'iTobMisc.Left', tobMisc.Left);
  tobMisc.Top    := ifTinn.ReadInteger('App', 'iTobMisc.Top', tobMisc.Top);
  tobMisc.Visible:= ifTinn.ReadBool('App', 'bTobMisc.Visible', True);
  actTobMiscVisible.Checked:= tobMisc.Visible;

  // Processing Bar
  tobProcessing.Left   := ifTinn.ReadInteger('App', 'iTobProcessing.Left', tobProcessing.Left);
  tobProcessing.Top    := ifTinn.ReadInteger('App', 'iTobProcessing.Top', tobProcessing.Top);
  tobProcessing.Visible:= ifTinn.ReadBool('App', 'bTobProcessing.Visible', True);
  actTobProcessingVisible.Checked:= tobProcessing.Visible;

  // Format Bar
  tobFormat.Left   := ifTinn.ReadInteger('App', 'iTobFormat.Left', tobFormat.Left);
  tobFormat.Top    := ifTinn.ReadInteger('App', 'iTobFormat.Top', tobFormat.Top);
  tobFormat.Visible:= ifTinn.ReadBool('App', 'bTobFormat.Visible', True);
  actTobFormatVisible.Checked:= tobFormat.Visible;

  // View Bar
  tobView.Left   := ifTinn.ReadInteger('App', 'iTobView.Left', tobView.Left);
  tobView.Top    := ifTinn.ReadInteger('App', 'iTobView.Top', tobView.Top);
  tobView.Visible:= ifTinn.ReadBool('App', 'bTobView.Visible', True);
  actTobViewVisible.Checked:= tobView.Visible;

  // Macro Bar
  tobMacro.Left   := ifTinn.ReadInteger('App', 'iTobMacro.Left', tobMacro.Left);
  tobMacro.Top    := ifTinn.ReadInteger('App', 'iTobMacro.Top', tobMacro.Top);
  tobMacro.Visible:= ifTinn.ReadBool('App', 'bTobMacro.Visible', False);
  actTobMacroVisible.Checked:= tobMacro.Visible;

  // Filter Bar
  tobFilter.Left   := ifTinn.ReadInteger('App', 'iTobFilter.Left', tobFilter.Left);
  tobFilter.Top    := ifTinn.ReadInteger('App', 'iTobFilter.Top', tobFilter.Top);
  tobFilter.Visible:= ifTinn.ReadBool('App', 'bTobFilter.Visible', False);
  actTobFilterVisible.Checked:= tobFilter.Visible;

  // Syntax Bar
  tobSyntax.Left   := ifTinn.ReadInteger('App', 'iTobSyntax.Left', tobSyntax.Left);
  tobSyntax.Top    := ifTinn.ReadInteger('App', 'iTobSyntax.Top', tobSyntax.Top);
  tobSyntax.Visible:= ifTinn.ReadBool('App', 'bTobSyntax.Visible', True);
  actTobSyntaxVisible.Checked:= tobSyntax.Visible;

  // Spell Bar
  tobSpell.Left   := ifTinn.ReadInteger('App', 'iTobSpell.Left', tobSpell.Left);
  tobSpell.Top    := ifTinn.ReadInteger('App', 'iTobSpell.Top', tobSpell.Top);
  tobSpell.Visible:= ifTinn.ReadBool('App', 'bTobSpell.Visible', False);
  actTobSpellVisible.Checked:= tobSpell.Visible;

  // Misc
  bMinimizeTinnAfterLastFile:= ifTinn.ReadBool('App', 'bMinimizeTinnAfterLastFile', False);
  bRememberFileState        := ifTinn.ReadBool('App', 'bRememberFileState', True);
  bRemoveExtension          := ifTinn.ReadBool('App', 'bRemoveExtension', True);
  bUndoAfterSave            := ifTinn.ReadBool('App', 'bUndoAfterSave', True);
  actOpenMaximized.Checked  := ifTinn.ReadBool('App', 'bOpenMaximized', True);

  actDatabaseVisible.Checked         := ifTinn.ReadBool('App', 'bDatabase.Visible', True);
  actDataCommentsVisible.Checked     := ifTinn.ReadBool('App', 'bDataComments.Visible', True);
  actDataCompletionVisible.Checked   := ifTinn.ReadBool('App', 'bDataCompletion.Visible', True);
  actDataRcardVisible.Checked        := ifTinn.ReadBool('App', 'bDataRcard.Visible', True);
  actDataRmirrorsVisible.Checked     := ifTinn.ReadBool('App', 'bDataRmirrors.Visible', True);
  actDataShortcutsVisible.Checked    := ifTinn.ReadBool('App', 'bDataShortcuts.Visible', True);
  actHexViewerVisible.Checked        := ifTinn.ReadBool('App', 'bHexViewer.Visible', True);
  actIniLogVisible.Checked           := ifTinn.ReadBool('App', 'bIniLog.Visible', True);
  actLatexVisible.Checked            := ifTinn.ReadBool('App', 'bLatex.Visible', True);
  actMarkupVisible.Checked           := ifTinn.ReadBool('App', 'bMarkup.Visible', True);
  actMiscVisible.Checked             := ifTinn.ReadBool('App', 'bMisc.Visible', True);
  actProjectVisible.Checked          := ifTinn.ReadBool('App', 'bProject.Visible', True);
  actResultsVisible.Checked          := ifTinn.ReadBool('App', 'bResults.Visible', True);
  actRExplorerVisible.Checked        := ifTinn.ReadBool('App', 'bRExplorer.Visible', True);
  actRVisible.Checked                := ifTinn.ReadBool('App', 'bR.Visible', True);
  actSearchVisible.Checked           := ifTinn.ReadBool('App', 'bSearch.Visible', True);
  actSpellVisible.Checked            := ifTinn.ReadBool('App', 'bSpell.Visible', True);
  actTxt2tagsVisible.Checked         := ifTinn.ReadBool('App', 'bTxt2tags.Visible', True);
  actWinExplVisible.Checked          := ifTinn.ReadBool('App', 'bWinExpl.Visible', True);
  actWorkExplVisible.Checked         := ifTinn.ReadBool('App', 'bWorkExpl.Visible', True);

  frmTools.tbsComments.TabVisible    := actDataCommentsVisible.Checked;
  frmTools.tbsCompletion.TabVisible  := actDataCompletionVisible.Checked;
  frmTools.tbsDatabase.TabVisible    := actDatabaseVisible.Checked;
  frmTools.tbsHexViewer.TabVisible   := actHexViewerVisible.Checked;
  frmTools.tbsIniLog.TabVisible      := actIniLogVisible.Checked;
  frmTools.tbsLatex.TabVisible       := actLatexVisible.Checked;
  frmTools.tbsMarkup.TabVisible      := actMarkupVisible.Checked;
  frmTools.tbsMisc.TabVisible        := actMiscVisible.Checked;
  frmTools.tbsProject.TabVisible     := actProjectVisible.Checked;
  frmTools.tbsR.TabVisible           := actRVisible.Checked;
  frmTools.tbsRcard.TabVisible       := actDataRcardVisible.Checked;
  frmTools.tbsResults.TabVisible     := actResultsVisible.Checked;
  frmTools.tbsRExplorer.TabVisible   := actRExplorerVisible.Checked;
  frmTools.tbsRmirrors.TabVisible    := actDataRmirrorsVisible.Checked;
  frmTools.tbsSearch.TabVisible      := actSearchVisible.Checked;
  frmTools.tbsShortcuts.TabVisible   := actDataShortcutsVisible.Checked;
  frmTools.tbsSpell.TabVisible       := actSpellVisible.Checked;
  frmTools.tbsTxt2tags.TabVisible    := actTxt2tagsVisible.Checked;
  frmTools.tbsWinExplorer.TabVisible := actWinExplVisible.Checked;
  frmTools.tbsWorkExplorer.TabVisible:= actWorkExplVisible.Checked;

  actShowAllBars.Checked:= ifTinn.ReadBool('App', 'bShowAllBars', True);
  pUpdateBars(actShowAllBars.Checked);

  actAlwaysAddBOM.Checked  := ifTinn.ReadBool('App', 'bAlwaysAddBOM', False);
  actApplyToANSI.Checked   := ifTinn.ReadBool('App', 'bApplyToANSI', False);
  actEditorLineWrap.Checked:= ifTinn.ReadBool('App', 'bEditorLineWrap', True);

  bActiveLine           := ifTinn.ReadBool('App', 'bActiveLine', True);
  clActiveLine          := ifTinn.ReadInteger('App', 'clActiveLine', Tcolor(clYellow));
  clBGApplication       := ifTinn.ReadInteger('App', 'clBGApplication', Tcolor(clWindow));
  clBGForAllHighlighters:= ifTinn.ReadInteger('App', 'clBGForAllHighlighters', Tcolor(clWindow));
  clBGPreferred         := ifTinn.ReadInteger('App', 'clBGPreferred', Tcolor(clWindow));
  clBGTabSelectedNew    := ifTinn.ReadInteger('App', 'clBGTabSelectedNew', Tcolor(clMedGray));
  clBrackets            := ifTinn.ReadInteger('App', 'clBrackets', Tcolor(clRed));
  clFGApplication       := ifTinn.ReadInteger('App', 'clFGApplication', Tcolor(clBlack));
  iDelay                := ifTinn.ReadInteger('App', 'iDelay', 100);
  iPandocFrom           := ifTinn.ReadInteger('App', 'iPandocFrom', 4);
  iPandocTo             := ifTinn.ReadInteger('App', 'iPandocTo', 7);
  iTransparency         := ifTinn.ReadInteger('App', 'iTransparency', 0);
  iViewStyleRExplorer   := ifTinn.ReadInteger('App', 'iViewStyleRExplorer', 1);
  sShortcutsInUse       := trim(ifTinn.ReadString('App', 'sShortcutsInUse', sPath_Data + '\Shortcuts.xml'));

  bIPLocal     := ifTinn.ReadBool('App', 'bIPLocal', True);
  iIPPortLocal := ifTinn.ReadInteger('App', 'iIPPortLocal', 8889);
  iIPPortRemote:= ifTinn.ReadInteger('App', 'iIPPortLocal', 8889);
  sIPHostLocal := ifTinn.ReadString('App', 'sIPHostLocal', '127.0.0.1');
  sIPHostRemote:= ifTinn.ReadString('App', 'sIPHostRemote', '000.000.000.000');

  sFormatR                 := trim(ifTinn.ReadString('App', 'sFormatR', EmptyStr));
  sKnit                    := trim(ifTinn.ReadString('App', 'sKnit', EmptyStr));
  sParDeplate              := trim(ifTinn.ReadString('App', 'sParDeplate', '-f'));
  sParDviBibtex            := trim(ifTinn.ReadString('App', 'sParDviBibtex', 'bibtex --src-specials'));
  sParDviSingle            := trim(ifTinn.ReadString('App', 'sParDviSingle', 'latex -c-style-errors --src-specials'));
  sParPdfBibtex            := trim(ifTinn.ReadString('App', 'sParPdfBibtex', 'bibtex'));
  sParPdfSingle            := trim(ifTinn.ReadString('App', 'sParPdfSingle', 'pdflatex -c-style-errors'));
  sParRgui                 := trim(ifTinn.ReadString('App', 'sParRgui', '--sdi'));
  sParRPuTTY               := trim(ifTinn.ReadString('App', 'sParRPuTTY', '--no-save'));
  sParRterm                := trim(ifTinn.ReadString('App', 'sParRterm', '--ess'));
  sParTxt2tags             := trim(ifTinn.ReadString('App', 'sParTxt2tags', '-t'));
  sPath_Pandoc             := trim(ifTinn.ReadString('App', 'sPath_Pandoc', EmptyStr));
  sPathDeplate_Converter   := trim(ifTinn.ReadString('App', 'sPathDeplate_Converter', EmptyStr));
  sPathDeplate_Interpreter := trim(ifTinn.ReadString('App', 'sPathDeplate_Interpreter', EmptyStr));
  sPathTxt2tags_Converter  := trim(ifTinn.ReadString('App', 'sPathTxt2tags_Converter', EmptyStr));
  sPathTxt2tags_Interpreter:= trim(ifTinn.ReadString('App', 'sPathTxt2tags_Interpreter', EmptyStr));
  sPuttyHost               := trim(ifTinn.ReadString('App', 'sPuttyHost', EmptyStr));
  sPuttyPassword           := trim(ifTinn.ReadString('App', 'sPuttyPassword', EmptyStr));
  sPuttyUser               := trim(ifTinn.ReadString('App', 'sPuttyUser', EmptyStr));
  sRLibPathDefault         := trim(ifTinn.ReadString('App', 'sRLibPathDefault', '.libPaths()[1L]'));

  actCloseDVIViewer.Checked    := ifTinn.ReadBool('App', 'bCloseDVIViewer', False);
  actClosePDFViewer.Checked    := ifTinn.ReadBool('App', 'bClosePDFViewer', True);
  actDosMinimizedAlways.Checked:= ifTinn.ReadBool('App', 'bDosMinimizedAlways', True);
  actDviOpenAlways.Checked     := ifTinn.ReadBool('App', 'bDviOpenAlways', True);
  actHtmlOpenAlways.Checked    := ifTinn.ReadBool('App', 'bHtmlOpenAlways', True);
  actPdfOpenAlways.Checked     := ifTinn.ReadBool('App', 'bPdfOpenAlways', True);
  actRComplexDefault.Checked   := ifTinn.ReadBool('App', 'bRComplexDefault', False);
  actRSimpleDefault.Checked    := ifTinn.ReadBool('App', 'bRSimpleDefault', True);
  actTextDefault.Checked       := ifTinn.ReadBool('App', 'bTextDefault', False);

  bAllNames              := ifTinn.ReadBool('App', 'bAllNames', True);
  bConnectionBeepOnError := ifTinn.ReadBool('App', 'bConnectionBeepOnError', True);
  bDataCompletionAnywhere:= ifTinn.ReadBool('App', 'bDataCompletionAnywhere', True);
  bOrganizeAutomatically := ifTinn.ReadBool('App', 'bOrganizeAutomatically', False);

  // There is still some 32 bit computer in use today!
  if (fIs64Bit_OS) and
     ifTinn.ReadBool('App', 'bRArchitecture64', True) then bRArchitecture64:= True
                                                      else bRArchitecture64:= False;

  bRAsServer                   := ifTinn.ReadBool('App', 'bRAsServer', True);
  bRestoreIniDock              := ifTinn.ReadBool('App', 'bRestoreIniDock', False);
  bRguiReturnFocus             := ifTinn.ReadBool('App', 'bRguiReturnFocus', True);
  bRMirros_Update              := ifTinn.ReadBool('App', 'bRMirros_Update', False);
  bRSendAll                    := ifTinn.ReadBool('App', 'bRSendAll', False);
  bRSetget_Info                := ifTinn.ReadBool('App', 'bRSetget_Info', True);
  bRSetWorkDir_Starting        := ifTinn.ReadBool('App', 'bRSetWorkDir_Starting', True);
  bRSmart                      := ifTinn.ReadBool('App', 'bRSmart', True);
  bRsvSocket_Connect           := ifTinn.ReadBool('App', 'bRsvSocketConnect', True);
  bRTCPIPConsoleEcho           := ifTinn.ReadBool('App', 'bRTCPIPConsoleEcho', False);
  bRTCPIPConsoleUse            := ifTinn.ReadBool('App', 'bRTCPIPConsoleUse', False);
  bRtermBeepOnError            := ifTinn.ReadBool('App', 'bRtermBeepOnError', True);
  bRtermFindError              := ifTinn.ReadBool('App', 'bRtermFindError', False);
  bRtermWidth                  := ifTinn.ReadBool('App', 'bRtermWidth', True);
  bRTinnRcom_Install           := ifTinn.ReadBool('App', 'bRTinnRcomInstall', True);
  bRTinnRcom_Load              := ifTinn.ReadBool('App', 'bRTinnRcomLoad', True);
  bRUseLatest                  := ifTinn.ReadBool('App', 'bRUseLatest', True);
  bScrollSendingLines          := ifTinn.ReadBool('App', 'bScrollSendingLines', True);
  bTinnRHotKeys                := ifTinn.ReadBool('App', 'bTinnRHotKeys', True);
  iRecognition_Caption         := ifTinn.ReadInteger('App', 'iRecognition_Caption', 2);
  iReformatRSplit              := ifTinn.ReadInteger('App', 'iReformatRSPlit', 1);
  iRguiTinnR_Disposition       := ifTinn.ReadInteger('App', 'iRguiTinnR_Disposition', 0);
  iRguiTinnR_Proportion        := ifTinn.ReadInteger('App', 'iRguiTinnR_Proportion', 58);

  actPgFilesVisible.Checked                := ifTinn.ReadBool('App', 'bPgFiles.Visible', True);
  actStatusBarVisible.Checked              := ifTinn.ReadBool('App','bStatusBar', True);
  frmTools.cbComAutoDetect_Language.Checked:= ifTinn.ReadBool('App', 'bComAutoDetect_Language', True);
  frmTools.cbComPriority_Line.Checked      := ifTinn.ReadBool('App', 'bComPriority_Line', True);
  frmTools.panCompletion.Height            := ifTinn.ReadInteger('App', 'iCompletion.Height', 41);
  frmTools.panCountries.Height             := ifTinn.ReadInteger('App', 'iCountries.Height', 79);
  frmTools.panRcard.Height                 := ifTinn.ReadInteger('App', 'iRcard.Height', 79);
  frmTools.panRExplorer.Width              := ifTinn.ReadInteger('App', 'iRExplorer.Width', 200);
  frmTools.panShortcuts.Height             := ifTinn.ReadInteger('App', 'iShortcuts.Height', 79);
  frmTools.panWinExplorer.Height           := ifTinn.ReadInteger('App', 'iWinExplorer.Height', 75);
  frmTools.panWorkExplorer.Height          := ifTinn.ReadInteger('App', 'iWorkExplorer.Height', 75);

  // pgFiles
  iTmp:= ifTinn.ReadInteger('App', 'iPgFiles.TabsPosition', 1);
  // 0=fsdLeft, 1=fsdTop, 2=fsdRight, 3=fsdBottom
  case (iTmp) of
    1: actFilesTabsTopExecute(nil);
    3: actFilesTabsBottomExecute(nil);
  end;

  // pgTools
  iTmp:= ifTinn.ReadInteger('App', 'iPgTools.TabsPosition', 1);
  // 0=fsdLeft, 1=fsdTop, 2=fsdRight, 3=fsdBottom
  case (iTmp) of
    0: actToolsTabsLeftExecute(nil);
    1: actToolsTabsTopExecute(nil);
    2: actToolsTabsRightExecute(nil);
    3: actToolsTabsBottomExecute(nil);
  end;

  // pgConsole
  iTmp:= ifTinn.ReadInteger('App', 'iPgConsole.TabsPosition', 1);
  // 0=fsdLeft, 1=fsdTop, 2=fsdRight, 3=fsdBottom
  case (iTmp) of
    0: actRtermTabsLeftExecute(nil);
    1: actRtermTabsTopExecute(nil);
    2: actRtermTabsRightExecute(nil);
    3: actRtermTabsBottomExecute(nil);
  end;

  pgFiles.Visible:= actPgFilesVisible.Checked;
  stbMain.Visible:= actStatusBarVisible.Checked;

  // Tools
  bToolsCanFloat              := ifTinn.ReadBool('App', 'bToolsCanFloat', False);
  frmTools.iSize              := ifTinn.ReadInteger('App', 'iTools.Size', 310);
  frmTools.pgDatabase.TabIndex:= ifTinn.ReadInteger('App', 'iDatabase.TabIndex', 0);
  frmTools.pgLatex.TabIndex   := ifTinn.ReadInteger('App', 'iLatex.TabIndex', 0);
  frmTools.pgMarkup.TabIndex  := ifTinn.ReadInteger('App', 'iMarkup.TabIndex', 0);
  frmTools.pgMisc.TabIndex    := ifTinn.ReadInteger('App', 'iMIsc.TabIndex', 0);
  frmTools.pgR.TabIndex       := ifTinn.ReadInteger('App', 'iR.TabIndex', 0);
  frmTools.pgResults.TabIndex := ifTinn.ReadInteger('App', 'iResults.TabIndex', 0);
  frmTools.pgTools.TabIndex   := ifTinn.ReadInteger('App', 'iTools.TabIndex', 0);
  frmTools.pgTxt2tags.TabIndex:= ifTinn.ReadInteger('App', 'iTxt2tags.TabIndex', 0);

  cbSpellLanguage.ItemIndex:= ifTinn.ReadInteger('App', 'iSpellLanguage.ItemIndex', -1);
  iCompletionFilter        := ifTinn.ReadInteger('App', 'iCompletion.ItemIndex', 0);
  iCountriesFilter         := ifTinn.ReadInteger('App', 'iCountries.ItemIndex', 0);
  iRcardFilter             := ifTinn.ReadInteger('App', 'iRcard.ItemIndex', 0);
  iRtipFilter              := ifTinn.ReadInteger('App', 'iRtip.ItemIndex', 0);
  iShortcutsFilter         := ifTinn.ReadInteger('App', 'iShortcuts.ItemIndex', 0);
  iShortcutsFilter         := ifTinn.ReadInteger('App', 'iShortcuts.ItemIndex', 0);

  actRguiReturnFocus.Checked:= bRguiReturnFocus;

  // Rterm
  bIOLineWrap            := ifTinn.ReadBool('App', 'bIOLineWrap', True);
  bLogLineWrap           := ifTinn.ReadBool('App', 'bLogLineWrap', True);
  bRtermCanFloat         := ifTinn.ReadBool('App', 'bRtermCanFloat', False);
  bRtermSend_Plus        := ifTinn.ReadBool('App', 'bRtermSend_Plus', True);
  bRtermCloseWithoutAsk  := ifTinn.ReadBool('App', 'bRtermCloseWithoutAsk', False);
  bRtermHorizontal       := ifTinn.ReadBool('App', 'bRtermHorizontal', True);
  bRtermSingle           := ifTinn.ReadBool('App', 'bRtermSingle', True);
  frmRterm.iSize         := ifTinn.ReadInteger('App', 'iRterm.Size', 480);
  frmRterm.iSynLog2Height:= ifTinn.ReadInteger('App', 'iSynLog2.Height', 90);
  frmRterm.iSynLog2Width := ifTinn.ReadInteger('App', 'iSynLog2.Width', 140);
  iIO_Syntax             := ifTinn.ReadInteger('App', 'iIO_Syntax', 2);   // .R
  iLOG_Syntax            := ifTinn.ReadInteger('App', 'iLOG_Syntax', 0);  // .txt

  with frmRterm do begin
    synIO.WordWrap := bIOLineWrap;
    synLog.WordWrap:= bLogLineWrap;
  end;

  actRtermIOLineWrap.Checked := bIOLineWrap;
  actRtermLogLineWrap.Checked:= bLogLineWrap;

  case iViewStyleRExplorer of
    1: begin
         frmTools.lvRexplorer.ViewStyle:= vsList;
         actRExplorerStyle.Checked     := False;
       end;
    2: begin
         frmTools.lvRexplorer.ViewStyle:= vsReport;
         actRExplorerStyle.Checked     := True;
       end;
  end;

  iMaxDeparseLength := ifTinn.ReadInteger('App', 'iMaxDeparseLength', 150);
  sAppSelected      := ifTinn.ReadString('App', 'sAppSelected', 'General');

  // Encoding
  sEncodingDefault:= ifTinn.ReadString('App', 'sEncodingDefault', 'ANSI');
  pSetEncodingDefault(sEncodingDefault);

  // EOL
  sEOLDefault:= ifTinn.ReadString('App', 'sEOLDefault', 'WIN');
  pSetEOLDefault(sEOLDefault);

  // Search Settings
  bSearchBackwards    := ifTinn.ReadBool('Search', 'bSearchBackwards', False);
  bSearchCaseSensitive:= ifTinn.ReadBool('Search', 'bSearchCaseSensitive', False);
  bSearchDirectory    := ifTinn.ReadBool('Search', 'bSearchDirectory', False);
  bSearchFromCursor   := ifTinn.ReadBool('Search', 'bSearchFromCursor', False);
  bSearchInSub        := ifTinn.ReadBool('Search', 'bSearchInSub', False);
  bSearchOpenFiles    := ifTinn.ReadBool('Search', 'bSearchOpenFiles', True);
  bSearchRegExp       := ifTinn.ReadBool('Search', 'bSearchRegExp', False);
  bSearchWholeWords   := ifTinn.ReadBool('Search', 'bSearchWholeWords', False);
  iLastSearch         := ifTinn.ReadInteger('Search', 'iLastSearch', 10);

  // Print settings
  bPrintColors     := ifTinn.ReadBool('Print', 'bPrintColors', True);
  bPrintFileName   := ifTinn.ReadBool('Print', 'bPrintFileName', True);
  bPrintLineNumber := ifTinn.ReadBool('Print', 'bPrintLineNumber', False);
  bPrintLineWrap   := ifTinn.ReadBool('Print', 'bPrintLineWrap', True);
  bPrintPageNumber := ifTinn.ReadBool('Print', 'bPrintPageNumber', True);
  bPrintSyntaxColor:= ifTinn.ReadBool('Print', 'bPrintSyntaxColor', True);
  iScaleMode       := ifTinn.ReadInteger('Print', 'iScaleMode', 1);
  iZoomPreview     := ifTinn.ReadInteger('Print', 'iZoomPreview', 90);

  // Send to R alphabetically ordered
  pmemRResCurrentLineToTop.Checked         := ifTinn.ReadBool('R Options', 'bRCurrentLineToTop', True);
  pmemRResSendBlockMarked.Checked          := ifTinn.ReadBool('R Options', 'bRSendBlockMarked', True);
  pmemRResSendClipboard.Checked            := ifTinn.ReadBool('R Options', 'bRSendClipboard', True);
  pmemRResSendContiguous.Checked           := ifTinn.ReadBool('R Options', 'bRSendContiguous', True);
  pmemRResSendCursorToBeginningLine.Checked:= ifTinn.ReadBool('R Options', 'bRSendCursorToBeginningLine', True);
  pmemRResSendCursorToEndLine.Checked      := ifTinn.ReadBool('R Options', 'bRSendCursorToEndLine', True);
  pmemRResSendFile.Checked                 := ifTinn.ReadBool('R Options', 'bRSendFile', True);
  pmemRResSendKnitr.Checked                := ifTinn.ReadBool('R Options', 'bRKnitr', True);
  pmemRResSendLine.Checked                 := ifTinn.ReadBool('R Options', 'bRSendLine', True);
  pmemRResSendLinesToEndPage.Checked       := ifTinn.ReadBool('R Options', 'bRSendLinesToEndPage', True);
  pmemRResSendSelection.Checked            := ifTinn.ReadBool('R Options', 'bRSendSelection', True);
  pmemRResSendSmart.Checked                := ifTinn.ReadBool('R Options', 'bRSendSmart', False);
  pmemRResSendSweave.Checked               := ifTinn.ReadBool('R Options', 'bRSweave', True);

  actRCurrentLineToTop.Visible         := ifTinn.ReadBool('R Options', 'bRCurrentLineToTop', True);
  actRSendBlockMarked.Visible          := ifTinn.ReadBool('R Options', 'bRSendBlockMarked', True);
  actRSendClipboard.Visible            := ifTinn.ReadBool('R Options', 'bRSendClipboard', True);
  actRSendContiguous.Visible           := ifTinn.ReadBool('R Options', 'bRSendContiguous', True);
  actRSendCursorToBeginningLine.Visible:= ifTinn.ReadBool('R Options', 'bRSendCursorToBeginningLine', True);
  actRSendCursorToEndLine.Visible      := ifTinn.ReadBool('R Options', 'bRSendCursorToEndLine', True);
  actRSendFile.Visible                 := ifTinn.ReadBool('R Options', 'bRSendFile', True);
  actRSendLine.Visible                 := ifTinn.ReadBool('R Options', 'bRSendLine', True);
  actRSendLinesToEndPage.Visible       := ifTinn.ReadBool('R Options', 'bRSendLinesToEndPage', True);
  actRSendSelection.Visible            := ifTinn.ReadBool('R Options', 'bRSendSelection', True);
  actRSendSmart.Visible                := ifTinn.ReadBool('R Options', 'bRSendSmart', False);
  actRSendSweave.Visible               := ifTinn.ReadBool('R Options', 'bRSweave', True);
  bRKnitr                              := ifTinn.ReadBool('R Options', 'bRKnitr', True);

  // Controlling R alphabetically ordered
  pmenRResContClearAll.Checked             := ifTinn.ReadBool('R Options', 'bRClearAll', True);
  pmenRResContClearConsole.Checked         := ifTinn.ReadBool('R Options', 'bRClearConsole', True);
  pmenRResContCloseAllGraphics.Checked     := ifTinn.ReadBool('R Options', 'bRCloseAllGraphics', True);
  pmenRResContEditVariable.Checked         := ifTinn.ReadBool('R Options', 'bREditVariable', True);
  pmenRResContEscape.Checked               := ifTinn.ReadBool('R Options', 'bREscape', True);
  pmenRResContExampleSelectedWord.Checked  := ifTinn.ReadBool('R Options', 'bRExampleSelectedWord', True);
  pmenRResContFixVariable.Checked          := ifTinn.ReadBool('R Options', 'bRFixVariable', True);
  pmenRResContGuiPuTTYStartClose.Checked   := ifTinn.ReadBool('R Options', 'bRguiPuTTYStartClose', True);
  pmenRResContHelp.Checked                 := ifTinn.ReadBool('R Options', 'bRHelp', True);
  pmenRResContHelpSelectedWord.Checked     := ifTinn.ReadBool('R Options', 'bRHelpSelectedWord', True);
  pmenRResContListAllObjects.Checked       := ifTinn.ReadBool('R Options', 'bRListAllObjects', True);
  pmenRResContListVariableNames.Checked    := ifTinn.ReadBool('R Options', 'bRListVariableNames', True);
  pmenRResContListVariableStructure.Checked:= ifTinn.ReadBool('R Options', 'bRListVariableStructure', True);
  pmenRResContPackages.Checked             := ifTinn.ReadBool('R Options', 'bRPackages', True);
  pmenRResContPlotVariable.Checked         := ifTinn.ReadBool('R Options', 'bRPlotVariable', True);
  pmenRResContPrintVariableContent.Checked := ifTinn.ReadBool('R Options', 'bRPrintVariableContent', True);
  pmenRResContRemoveAllObjects.Checked     := ifTinn.ReadBool('R Options', 'bRRemoveAllObjects', True);
  pmenRResContSetWorkDirectory.Checked     := ifTinn.ReadBool('R Options', 'bRSetWorkDir', True);
  pmenRResContTCPConnection.Checked        := ifTinn.ReadBool('R Options', 'bRTCPConnection', True);
  pmenRResContTermStartClose.Checked       := ifTinn.ReadBool('R Options', 'bRtermStartClose', True);

  actRContClearAll.Visible               := ifTinn.ReadBool('R Options', 'bRClearAll', True);
  actRContClearConsole.Visible           := ifTinn.ReadBool('R Options', 'bRClearConsole', True);
  actRContCloseAllGraphics.Visible       := ifTinn.ReadBool('R Options', 'bRCloseAllGraphics', True);
  actRContEditVariable.Visible           := ifTinn.ReadBool('R Options', 'bREditVariable', True);
  actRContEscape.Visible                 := ifTinn.ReadBool('R Options', 'bREscape', True);
  actRContExampleSelectedWord.Visible    := ifTinn.ReadBool('R Options', 'bRExampleSelectedWord', True);
  actRContOpenExampleSelectedWord.Visible:= ifTinn.ReadBool('R Options', 'bROpenExampleSelectedWord', True);
  actRContFixVariable.Visible            := ifTinn.ReadBool('R Options', 'bRFixVariable', True);
  actRContGuiPuTTYStartClose.Visible     := ifTinn.ReadBool('R Options', 'bRguiPuTTYStartClose', True);
  actRContHelp.Visible                   := ifTinn.ReadBool('R Options', 'bRHelp', True);
  actRContHelpSelectedWord.Visible       := ifTinn.ReadBool('R Options', 'bRHelpSelectedWord', True);
  actRContListAllObjects.Visible         := ifTinn.ReadBool('R Options', 'bRListAllObjects', True);
  actRContListVariableNames.Visible      := ifTinn.ReadBool('R Options', 'bRListVariableNames', True);
  actRContListVariableStructure.Visible  := ifTinn.ReadBool('R Options', 'bRListVariableStructure', True);
  actRContPackages.Visible               := ifTinn.ReadBool('R Options', 'bRPackages', True);
  actRContPlotVariable.Visible           := ifTinn.ReadBool('R Options', 'bRPlotVariable', True);
  actRContPrintVariableContent.Visible   := ifTinn.ReadBool('R Options', 'bRPrintVariableContent', True);
  actRContRemoveAllObjects.Visible       := ifTinn.ReadBool('R Options', 'bRRemoveAllObjects', True);
  actRContSetWorkDirectory.Visible       := ifTinn.ReadBool('R Options', 'bRSetWorkDir', True);
  actRContTCPConnection.Visible          := ifTinn.ReadBool('R Options', 'bRTCPConnection', True);
  actRContTermStartClose.Visible         := ifTinn.ReadBool('R Options', 'bRtermStartClose', True);
  actRSendSweave.Visible                 := ifTinn.ReadBool('R Options', 'bRSweave', True);

  // Database status
  iCompletionBeforeChanges:= ifTinn.ReadInteger('Database', 'iCompletionBeforeChanges', 0);
  iRcardBeforeChanges     := ifTinn.ReadInteger('Database', 'iRcardBeforeChanges', 0);
  iRtipBeforeChanges      := ifTinn.ReadInteger('Database', 'iRtipBeforeChanges', 0);
  iShortcutsBeforeChanges := ifTinn.ReadInteger('Database', 'iShortcutsBeforeChanges', 0);

  // Latex Dimensional element
  iCols                   := ifTinn.ReadInteger('Latex', 'iCols', 2);
  iLatexDimensionalAlign  := ifTinn.ReadInteger('Latex', 'iLatexDimensionalAlign', 0);
  iLatexDimensionalElement:= ifTinn.ReadInteger('Latex', 'iLatexDimensionalElement', 0);
  iRows                   := ifTinn.ReadInteger('Latex', 'iRows', 2);

  tbKnitr.Visible:= bRKnitr;

  hkTinnR:= TfrmHotKeys.Create(Self);

  // Pandoc history
  slPandocHistory:= TStringList.Create;
  ifTinn.ReadSectionValues('Pandoc History',
                           slPandocHistory);
  if (slPandocHistory.Count > 0) then begin
    for i:= 0 to (slPandocHistory.Count - 1) do begin
      sTmp:= slPandocHistory.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sPandocHistory:= sTmp
                 else sPandocHistory:= sPandocHistory +
                                       #10 +
                                       sTmp;
    end;
  end
  else sPandocHistory:= EmptyStr;

  // Pandoc history: From
  slPandocHistoryFrom:= TStringList.Create;
  ifTinn.ReadSectionValues('Pandoc History From',
                           slPandocHistoryFrom);

  if (slPandocHistoryFrom.Count > 0) then begin
    for i:= 0 to (slPandocHistoryFrom.Count - 1) do begin
      sTmp:= slPandocHistoryFrom.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sPandocHistoryFrom:= sTmp
                 else sPandocHistoryFrom:= sPandocHistoryFrom +
                                           #10 +
                                           sTmp;
    end;
  end
  else sPandocHistory:= EmptyStr;

  // Pandoc history: To
  slPandocHistoryTo:= TStringList.Create;
  ifTinn.ReadSectionValues('Pandoc History To',
                           slPandocHistoryTo);

  if (slPandocHistoryTo.Count > 0) then begin
    for i:= 0 to (slPandocHistoryTo.Count - 1) do begin
      sTmp:= slPandocHistoryTo.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sPandocHistoryTo:= sTmp
                 else sPandocHistoryTo:= sPandocHistoryTo +
                                         #10 +
                                         sTmp;
    end;
  end
  else sPandocHistoryTo:= EmptyStr;

  // Search Text History
  slSearch:= TStringList.Create;
  ifTinn.ReadSectionValues('Search Text History',
                           slSearch);
  if (slSearch.Count > 0) then begin
    for i:= 0 to (slSearch.Count - 1) do begin
      sTmp:= slSearch.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sSearchTextHistory:= sTmp
                 else sSearchTextHistory:= sSearchTextHistory +
                                           #10 +
                                           sTmp;
    end;
  end
  else sSearchTextHistory:= EmptyStr;

  // Replace Text History
  slReplace:= TStringList.Create;
  ifTinn.ReadSectionValues('Replace Text History',
                           slReplace);
  if (slReplace.Count > 0) then begin
    for i:= 0 to (slReplace.Count - 1) do begin
      sTmp:= slReplace.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sReplaceTextHistory:= sTmp
                 else sReplaceTextHistory:= sReplaceTextHistory +
                                            #10 +
                                            sTmp;
    end;
  end
  else sReplaceTextHistory:= EmptyStr;

  //Search Dir History
  slSearch:= TStringList.Create;
  sSearchDirHistory:= EmptyStr;

  ifTinn.ReadSectionValues('Search Dir History',
                           slSearch);

  if (slSearch.Count > 0) then begin
    for i:= 0 to (slSearch.Count - 1) do begin
      sTmp:= slSearch.Strings[i];

      iPos:= Pos('=',
                 sTmp);


      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sSearchDirHistory:= sTmp
                 else sSearchDirHistory:= sSearchDirHistory +
                                          #10 +
                                          sTmp;
    end;
  end
  else sSearchDirHistory:= EmptyStr;

  // Search File Mask History
  slSearch:= TStringList.Create;
  ifTinn.ReadSectionValues('Search File Mask History',
                           slSearch);

  if (slSearch.Count > 0) then begin
    for i:= 0 to (slSearch.Count - 1) do begin
      sTmp:= slSearch.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sSearchFileMaskHistory:= sTmp
                 else sSearchFileMaskHistory:= sSearchFileMaskHistory +
                                               #10 +
                                               sTmp;
    end;
  end
  else sSearchFileMaskHistory:= EmptyStr;

  // Favorite Folders
  slTmpFavoriteFolders:= TStringList.Create;
  slFavoriteFolders   := TStringList.Create;
  ifTinn.ReadSectionValues('Explorer Favorites',
                           slTmpFavoriteFolders);
  if (slTmpFavoriteFolders.Count > 0) then begin
    for i:= 0 to (slTmpFavoriteFolders.Count - 1) do begin
      sTmp:= slTmpFavoriteFolders.Strings[i];

      iPos:= Pos('=',
                 sTmp);

      sTmp:= Copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      slFavoriteFolders.Add(sTmp);
    end;
  end
  else sSearchFileMaskHistory:= EmptyStr;
  frmTools.cbExplorerFavorites.Items.AddStrings(slFavoriteFolders);
  FreeAndNil(slTmpFavoriteFolders);
  FreeAndNil(slFavoriteFolders);

  iLastFile:= ifTinn.ReadInteger('App', 'iLastFile', 10);

  // Read the list of File MRU docs and add them to the menu and the drop down menu
  ifTinn.ReadSectionValues('File MRU', slFileMRU);
  pBuildMRU(menFileRecentFiles);

  // Do the same for Projects
  ifTinn.ReadSectionValues('Project MRU', slprojectMRU);
  pBuildProjectMRU(menProjRecent);

  slTextDiff:= TStringList.Create;
  ifTinn.ReadSectionValues('Diff Options', slTextDiff);

  // Paths and version of R
  sPath_R:= fGetRegistry_InstallPath('SOFTWARE\R-core\R');

  bRArchitecture64:= bRArchitecture64 and
                     DirectoryExists(sPath_R +
                                     '\bin\x64');

  // Check the latest R version installed
  if bRUseLatest then begin
    if (sPath_R <> EmptyStr) then begin
      pSetPathRTerm;
      pSetPathRgui;
    end;
  end
  else begin
    // Will read from INI because the user choice is not to use the latest instaled version of R
    sPath_Rterm:= trim(ifTinn.ReadString('App', 'sPath_Rterm', EmptyStr));
    if fIsPortable_Version then
      if not fPathRExists(sPath_Rterm) then begin  // Portable
        sPath_R    := 'UNKNOWN';
        sPath_Rterm:= 'UNKNOWN';
      end
    else
      if (sPath_Rterm = EmptyStr) or
         not FileExists(sPath_Rterm) then begin
           sPath_R    := 'UNKNOWN';
           sPath_Rterm:= 'UNKNOWN';
      end;

    sPath_Rgui:= trim(ifTinn.ReadString('App', 'sPath_Rgui', EmptyStr));
    if fIsPortable_Version then
      if not fPathRExists(sPath_Rgui) then begin  // Portable
        sPath_R    := 'UNKNOWN';
        sPath_Rterm:= 'UNKNOWN';
      end
    else
      if (sPath_Rterm = EmptyStr) or
         not FileExists(sPath_Rgui) then begin
           sPath_R    := 'UNKNOWN';
           sPath_Rterm:= 'UNKNOWN';
      end;
  end;

  actNotification.Checked   := ifTinn.ReadBool('App', 'bNotification', True);
  actNotification_US.Checked:= ifTinn.ReadBool('App', 'bNotification_US', False);

  sRmirror:= trim(ifTinn.ReadString('App', 'sRmirror', 'http://cran.at.r-project.org/'));
  frmTools.stbRMirrors.Panels[1].Text:= sRmirror;

  frmTools.JvDockClientTools.CanFloat:= bToolsCanFloat;
  frmRterm.JvDockClientRterm.CanFloat:= bRtermCanFloat;

  iAlphaBlendValue:= 255 - (255 * iTransparency) Div 100;
end;

procedure TfrmMain.pSetPreferences_Editor;
begin
  coEditor:= TSynEditorOC.Create(nil);

  // Gutter Options
  with coEditor.Gutter do begin
    AutoSize       := ifEditor.ReadBool('Gutter', 'bAutoSize', True);
    Color          := ifEditor.ReadInteger('Gutter', 'iColor', coEditor.Gutter.Color);
    DigitCount     := ifEditor.ReadInteger('Gutter', 'iDigitCount', 2);
    Font.Color     := ifEditor.ReadInteger('Gutter', 'iFont.Color', 0);
    Font.Name      := ifEditor.ReadString('Gutter', 'sFont.Name', 'Courier New');
    Font.Size      := ifEditor.ReadInteger('Gutter', 'iFont.Size', 8);
    LeadingZeros   := ifEditor.ReadBool('Gutter', 'bLeadingZeros', False);
    ShowLineNumbers:= ifEditor.ReadBool('Gutter', 'bLineNumber', True);
    Visible        := ifEditor.ReadBool('Gutter', 'bVisible', True);
    Width          := ifEditor.ReadInteger('Gutter', 'iWidth', 20);
    ZeroStart      := ifEditor.ReadBool('Gutter', 'bZeroStart', False);
  end;

  // Editor Options
  with coEditor do begin
    actAutoCompletion.Checked:= ifEditor.ReadBool('Editor', 'bAutocompletion', True);
    ExtraLineSpacing         := ifEditor.ReadInteger('Editor', 'iExtraLineSpacing', 0);
    Font.Color               := ifEditor.ReadInteger('Editor', 'iFont.Color', 0);
    Font.Name                := ifEditor.ReadString('Editor', 'sFont.Name', 'Courier New');
    Font.Size                := ifEditor.ReadInteger('Editor', 'iFont.Size', 11);
    HideSelection            := ifEditor.ReadBool('Editor', 'bHideSelection', False);
    InsertCaret              := TSynEditCaretType(ifEditor.ReadInteger('Editor', 'iInsertCaret', 0));
    Options                  := TSynEditorOptions(ifEditor.ReadInteger('Editor', 'iOptions', 124618775));  // My basic preferences!
    OverWriteCaret           := TSynEditCaretType(ifEditor.ReadInteger('Editor', 'iOverWriteCaret', 3));
    RightEdge                := ifEditor.ReadInteger('Editor', 'iRightEdge', 80);
    RightEdgeColor           := ifEditor.ReadInteger('Editor', 'iRightEdgeColor', coEditor.RightEdgeColor);
    SelectedColor.Background := ifEditor.ReadInteger('Editor', 'iSelectedColor.Background', coEditor.SelectedColor.Background);
    SelectedColor.Foreground := ifEditor.ReadInteger('Editor', 'iSelectedColor.Foreground', coEditor.SelectedColor.Foreground);
    TabWidth                 := ifEditor.ReadInteger('Editor', 'iTab.Width', 2);
    WantTabs                 := ifEditor.ReadBool('Editor', 'bWantTabs', True);
  end;

  // These options tend to be changed very often.
  // In this way was preferred to put in acts!
  actLineNumbersVisible.Checked:= coEditor.Gutter.ShowLineNumbers;
  actGutterVisible.Checked     := coEditor.Gutter.Visible;
  actSpecialCharVisible.Checked:= (eoShowSpecialChars in coEditor.Options);
end;

procedure TfrmMain.pGetCallTip(var sRObject,
                                   sRPackage,
                                   sRTip: string;
                                   var bTipFound: boolean);

  procedure pGetFunction_Completion(seEditor: TSynEdit;
                                    var sLocLine: string;
                                    var sContext: string;
                                    var iOpenBrk: integer;
                                    var iCloseBrk: integer;
                                    var iLineCount: integer);
  var
    i,
     iCaret,
     iTopLine: integer;

    bcPos: TBufferCoord;

  begin
    with seEditor do begin
      iTopLine:= TopLine;
      bcPos   := CaretXY;

      i        := 0;       // Escape
      iOpenBrk := 0;       // It stores the number of char '('
      iCloseBrk:= 0;       // It stores the number of char ')'

      iCaret:= CaretX;     // It stores CaretX in the first call. It is useful to this cases: sd(|), lm(|)

      BeginUpdate;         // To freeze the editor
      repeat
        if (i = 0) then sLocLine:= Trim(Copy(LineText,
                                             1,
                                             iCaret - 1))
                   else sLocLine:= Trim(LineText);

        sContext:= Trim(LineText) + sContext;  // Stores the all lines of the search down/top

        Inc(i);
        iLineCount:= i;

        iOpenBrk:= iOpenBrk +
                   fCount_Char(sLocLine,
                               '(');

        iCloseBrk:= iCloseBrk +
                    fCount_Char(sLocLine,
                                ')');

        if (iOpenBrk > iCloseBrk) then begin
          TopLine:= iTopLine;
          CaretXY:= bcPos;
          EndUpdate;

          {To debug only
          stbMain.Panels[9].Text:= sLocLine +
                                   '  ' +
                                   IntToStr(iOpen) +
                                   ':' +
                                   IntToStr(iClose);;
          }
          Exit;
        end;
          ExecuteCommand(ecUp,
                         #0,
                         nil);

      until (i = 40);  // 40 is the number of lines limit to search above the CaretY of the call.
                       // It also circumvents possible situations not provided for the algorithm in big files.
                       // It is the max visible lines of Tinn-R using my second monitor. ;)

      TopLine:= iTopLine;
      CaretXY:= bcPos;
      EndUpdate;
    end;
  end;

  // Function to receive and adequate tip from R under TCPIP
  function fReceiveTipFromTCPIP(): string;
  var
    iPosDoubleCote: integer;

    sRes: string;

  begin
    sRes:= csRtip.Socket.ReceiveText;

    iPosDoubleCote:= Pos('"',
                         sRes);

    Delete(sRes,
           1,
           iPosDoubleCote);

    sRes:= fInvertString(sRes);

    iPosDoubleCote:= Pos('"',
                         sRes);

    Delete(sRes,
           1,
           iPosDoubleCote);

    sRes:= fInvertString(sRes);

    sRes:= StringReplace(sRes,
                         '\"',
                         '''',
                         [rfReplaceAll]);

    // Particular cases of R
    // read.table(quote="\"'"  : it is very strange!
    sRes:= StringReplace(sRes,
                         '\\''''',
                         '\"',
                         [rfReplaceAll]);

    Result:= trim(sRes);
  end;

  procedure pGetTipFrom_TCPIP(sRClassFor: string);
  var
    sCmd: string;

    i: integer;

  begin
    // Try to find tip from TCPIP
    if fUseTCPIP then begin
      sCmd:= 'trArgs(' +
                     'fname=' +
                     '''' +
                     sRObject +
                     '''' +
                     ', ' +
                     'txt=' +
                     '' +
                     ', ' +
                     'pkg=' +
                     '''' +
                     sRPackage +
                     '''' +
                     ', ' +
                     'classfor=' +
                     '''' +
                     sRClassFor +
                     '''' +
                     ')' + #13#10;
      csRtip.Socket.SendText(sCmd);

      i:= 0;
      repeat
        sRTip:= EmptyStr;

        Sleep(2 * iDelay);  // This delay is very important!

        sRTip:= fReceiveTipFromTCPIP;

        inc(i);
      until (sRTip <> EmptyStr) or
            (i = 5);

      if (sRTip <> EmptyStr) then begin
        bTipFound      := True;
        sTipFromRServer:= 'TCP/IP';
      end
      else begin
        stbMain.Panels[8].Text:= 'Tip not found';

        if fUseTCPIP then stbMain.Panels[9].Text:= '<' +
                                                   sRObject +
                                                   '>' +
                                                   ' R server linked: YES'
                    else stbMain.Panels[9].Text:= '<' +
                                                  sRObject +
                                                  '>' +
                                                  ' R server linked: NOT';
      end;
    end  // fUseTCPIP
  end;

var
  i,
   iOpenBrk,
   iCloseBrk,
   iLineCount: integer;

  sLocline,
   sRClassFor,
   sContext: string;

  seEditor: TSynEdit;

{
  aOcc: array of array of integer;  // Dynamic array

  procedure GetOcc(const S: string;
                   const C: char);
  var
    i,
     j: Integer;
  begin
    j:= 0;
    for i:= 1 to length(S) do
      if (S[i] = C) then begin
        Inc(j);
        SetLength(aOcc,
                  j, 2);   // (n.lines, n.columns)

        aOcc[j-1, 0]:= j;  // (Occurrence, Column 0)
        aOcc[j-1, 1]:= i;  // (Position, Column 1)
      end;
  end;
}
  aOcc_Open_Brk: array of integer;  // Dynamic array
  //aOcc_Close: array of integer;  // Dynamic array

  procedure pGetOcc_Open_Brk(const S: string);
  var
    i,
     j: integer;

  begin
    j:= -1;
    for i:= 1 to length(S) do
      if (S[i] = '(') then begin
        Inc(j);
        SetLength(aOcc_Open_Brk,
                  j+1);

        aOcc_Open_Brk[j]:= i;
      end;
  end;

  {
  procedure GetOcc_Close_Brk(const S: string);
  var
    i,
     j: integer;

  begin
    j:= 0;
    for i:= 1 to length(S) do
      if (S[i] = ')') then begin
        Inc(j);
        SetLength(aOcc_Close,
                  j);

        aOcc_Close[j-1]:= i;
      end;
  end;
  }

  procedure pGetObject;
  begin
    // Get the Object
    // Find the text immediately before the last open-parenthesis (the function)
    // that doesn't have a matching close-parenthesis
    // Question: http://stackoverflow.com/questions/16952821/regex-word-immediately-before-the-last-opened-parenthesis?lq=1
    // https://regex101.com/r/pT3aY9/4
    //$re = '/[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)/m';
    //$str = '-------------------------------------------------
    //Text               I need
    //-------------------------------------------------
    //aaa(                                        aaa
    //a_aa(                                       a_aa
    //a.aa(                                       a.aa
    //a.99(                                       a.99
    //aaa(x)                                      \'\'
    //aaa(bbb(                                    bbb
    //aaa(y=b_bb(                                 b_bb
    //aaa(y=bbb()                                 aaa
    //aaa(y <- bbb()                              aaa
    //aaa(bbb(x)                                  aaa
    //aaa(bbb(ccc(                                ccc
    //aaa(bbb(x), ccc(                            ccc
    //aaa(bbb(x), ccc()                           aaa
    //aaa(bbb(x), ccc())                          \'\'
    //plot(x=1:10, y=sample(dnorm(1:10, 0, 4)),   plot
    //-------------------------------------------------';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    {
    --------------------------
    Text               I need
    --------------------------
    aaa(                  aaa
    a_aa(                a_aa
    a.aa(                a.aa
    a.99(                a.99
    aaa(x)                 ''
    aaa(bbb(              bbb
    aaa(y=b_bb(          b_bb
    aaa(y=bbb()           aaa
    aaa(y <- bbb()        aaa
    aaa(bbb(x)            aaa
    aaa(bbb(ccc(          ccc
    aaa(bbb(x), ccc(      ccc
    aaa(bbb(x), ccc()     aaa
    aaa(bbb(x), ccc())     ''
    --------------------------
    }

    // This is very iportant to coplex multiline
    if (iLineCount > 1) then begin  // It was necessary to up at last one line to find the condition (iOpen > iClose) to finish the GetFunction_Completion!
      pGetOcc_Open_Brk(sLocLine);

      sRObject:= fRegEx(Copy(sLocLine,
                             0,
                             aOcc_Open_Brk[((iOpenBrk-iCloseBrk)-1)]),
                        '[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)',  // R has function with complex names: '_', '.', 'numbers', ...
                        False);
    end
    else  //The regex is great for one line cases!
      sRObject:= fRegEx(sLocLine,
                        '[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)',  // R has function with complex names: '_', '.', 'numbers', ...
                        False);
  end;

  procedure pGetPackage;
  begin
    // Get the Package
    // Find the text immediately before ::: (the package) considering
    // the last open-parenthesis that doesn't have a matching close-parenthesis
    // https://regex101.com/r/wQ7eB0/3
    //$re = '/[a-zA-Z0-9._]+(?=:{3}[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$))/m';
    //$str = '----------------------------------
    //Text                       I need
    //----------------------------------
    //aaa(stats:::sd(             stats
    //base:::a_aa(                 base
    //base:::a_a1(                 base
    //base:::a_99(                 base
    //base:::a.aa(                 base
    //base:::a.99(                 base
    //stats:::aaa(x)                 \'\'
    //aaa(base:::bbb(              base
    //aaa(y=base:::bbb(            base
    //base:::aaa(y=bbb()           base
    //base:::aaa(y <- bbb()        base
    //base:::aaa(bbb(x)            base
    //aaa(bbb(base:::ccc(          base
    //aaa(stats:::bbb(x), ccc(       \'\'
    //base:::aaa(bbb(x), ccc()     base
    //stats:::aaa(bbb(x), ccc())     \'\'
    //----------------------------------
    //';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    {
    ----------------------------------
    Text                       I need
    ----------------------------------
    aaa(stats:::sd(             stats
    base:::a_aa(                 base
    base:::a_a1(                 base
    base:::a_99(                 base
    base:::a.aa(                 base
    base:::a.99(                 base
    stats:::aaa(x)                 ''
    aaa(base:::bbb(              base
    aaa(y=base:::bbb(            base
    base:::aaa(y=bbb()           base
    base:::aaa(y <- bbb()        base
    base:::aaa(bbb(x)            base
    aaa(bbb(base:::ccc(          base
    aaa(stats:::bbb(x), ccc(       ''
    base:::aaa(bbb(x), ccc()     base
    stats:::aaa(bbb(x), ccc())     ''
    ----------------------------------
    }

    // This is very iportant to coplex multiline
    if (iLineCount > 1) then begin  // It was necessary to up at last one line to find the condition (iOpen > iClose) to finish the GetFunction_Completion!
      pGetOcc_Open_Brk(sLocLine);

      sRPackage:= fRegEx(Copy(sLocLine,
                              0,
                              aOcc_Open_Brk[((iOpenBrk-iCloseBrk)-1)]),
                         '[a-zA-Z0-9._]+(?=:{3}[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$))',  // R has function with complex names: '_', '.', 'numbers', ...
                         False);
    end
    else  //The regex is great for one line cases!
      sRPackage:= fRegEx(sLocLine,
                         '[a-zA-Z0-9._]+(?=:{3}[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$))',  // R has function with complex names: '_', '.', 'numbers', ...
                         False);
  end;

  function fGetEnd_ClassFor(const S: string): integer;
  var
    i,
     iOpen_Brk,
     iClose_Brk,
     iComma: integer;

  begin
    i         := 0;
    iOpen_Brk := 0;
    iClose_Brk:= 0;
    iComma    := 0;
    Result:= -1;
    repeat
      if (S[i] = '(') then Inc(iOpen_Brk);
      if (S[i] = ')') then Inc(iClose_Brk);
      if (S[i] = ',') then Inc(iComma);

      if (iOpen_Brk > 0) then begin
        if (iOpen_Brk = iClose_Brk) then begin
          Result:= i;
          Exit;
        end
        else begin
          // Inc(i);
        end;
      end
      else begin
        if (iComma > 0) then begin
          Result:= i-1;
          Exit;
        end
        else begin
          // Inc(i)
        end;
      end;

      Inc(i);
    until (i = Length(S))
  end;

  procedure pGetClassFor;
  begin
    // Get the ClassFor
    // Find the text immediately after the latst open-parenthesis (the object) considering
    // the last open-parenthesis that doesn't have a matching close-parenthesis.
    // Question: http://stackoverflow.com/questions/17065448/regex-text-immediately-after-the-last-opened-parenthesis?lq=1
    // https://regex101.com/r/hT5rE2/5
    //$re = '/(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)/m';
    //$str = '------------------------------------
    //Text                         I need
    //------------------------------------
    //aaa(xxx                         xxx
    //aaa(xxx,                        xxx
    //aaa(xxx, yyy                    xxx
    //aaa(y=bbb(xxx)           y=bbb(xxx)
    //aaa(y <- bbb(xxx)     y <- bbb(xxx)
    //aaa(bbb(ccc(xxx                 xxx
    //aaa(bbb(x), ccc(xxx             xxx
    //aaa(bbb(x), ccc(x)           bbb(x)
    //aaa(bbb(x), ccc(x),          bbb(x)
    //aaa(?, bbb(??                    ??
    //aaa(bbb(x), ccc(x))              \'\'
    //aaa(x)                           \'\'
    //aaa(bbb(                         \'\'
    //aaa(bbb(x, y)             bbb(x, y)
    //aaa(bbb(x, y, z)       bbb(x, y, z)
    //------------------------------------
    //
    //Fail in all cases below:
    //------------------------------------
    //mean(iris[1:10,1:4]
    //cov(iris[1:10,1:4],
    //plot(iris[1:10, 1:4]
    //plot(iris[1:10, -c(4:5)],
    //plot(iris[1:10, 1],
    //------------------------------------
    //';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    {
    ------------------------------------
    Text                         I need
    ------------------------------------
    aaa(xxx                         xxx
    aaa(xxx,                        xxx
    aaa(xxx, yyy                    xxx
    aaa(y=bbb(xxx)           y=bbb(xxx)
    aaa(y <- bbb(xxx)     y <- bbb(xxx)
    aaa(bbb(ccc(xxx                 xxx
    aaa(bbb(x), ccc(xxx             xxx
    aaa(bbb(x), ccc(x)           bbb(x)
    aaa(bbb(x), ccc(x),          bbb(x)
    aaa(?, bbb(??                    ??
    aaa(bbb(x), ccc(x))              ''
    aaa(x)                           ''
    aaa(bbb(                         ''
    aaa(bbb(x, y)             bbb(x, y)
    aaa(bbb(x, y, z)       bbb(x, y, z)
    ------------------------------------

    Fail in all cases below:
    ------------------------------------
    mean(iris[1:10,1:4]
    cov(iris[1:10,1:4],
    plot(iris[1:10, 1:4]
    plot(iris[1:10, -c(4:5)],
    plot(iris[1:10, 1],
    ------------------------------------
    }

    {
    sRClassFor:= fRegEx(sLocLine,
                        '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)',
                        False);
    }

    // This is very iportant to coplex multiline
    if (iLineCount > 1) then begin  // It was necessary to up at last one line to find the condition (iOpen > iClose) to finish the GetFunction_Completion!
      pGetOcc_Open_Brk(sContext);
      //ShowMessage(sContext);



      sContext:= Copy(sContext,
                      aOcc_Open_Brk[((iOpenBrk-iCloseBrk)-1)] + 1,
                      Length(sContext));

      //ShowMessage(sContext);

      sRClassFor:= Copy(sContext,
                        0,
                        fGetEnd_ClassFor(sContext));

      //ShowMessage(sRClassFor);
    end
    else  //The regex is great for one line cases!
      sRClassFor:= fRegEx(sLocLine,
                          '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)',  // R has function with complex names: '_', '.', 'numbers', ...
                          False);
  end;

begin
  seEditor:= nil;

  sTipFromRServer:= EmptyStr;

  i:= fFindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

  if (iSynWithFocus = 3) then pGetFunction_Completion(frmRTerm.synIO,
                                                      sLocLine,
                                                      sContext,
                                                      iOpenBrk,
                                                      iCloseBrk,
                                                      iLineCount)
                         else pGetFunction_Completion(seEditor,
                                                      sLocLine,
                                                      sContext,
                                                      iOpenBrk,
                                                      iCloseBrk,
                                                      iLineCount);

  if (sLocLine <> EmptyStr) and
     (iOpenBrk > iCloseBrk) then begin
   {To debug only
    for i:=0 to High(aOcc_Open_Brk) do
      ShowMessage(IntToStr(i) +
                  ' | ' +
                  IntToStr(iOpen) +
                  ':' +
                  IntToStr(iClose) +
                  ' | ' +
                  sLocLine +
                  ' | ' +
                  IntToStr(aOcc_Open_Brk[i]));

    for i:=0 to High(aOcc_Close) do
      ShowMessage(IntToStr(i) +
                  ' | ' +
                  IntToStr(iOpen) +
                  ':' +
                  IntToStr(iClose) +
                  ' | ' +
                  sLocLine +
                  ' | ' +
                  IntToStr(aOcc_Close[i]));

    ShowMessage(IntToStr(aOcc_Open_Brk[((iOpen-iClose)-1)]));
   }

    pGetObject;

    {To debug only
    if (sRObject = EmptyStr) then begin
      Finalize(aOcc_Open_Brk);
      Exit;
    end
    else begin
      ShowMessage(sRObject);
      Finalize(aOcc_Open);
      Exit;
    end;
    }

    pGetPackage;

    {To debug only
    if (sRPackage = EmptyStr) then
      ShowMessage(sRObject)
    else
      ShowMessage(sRPackage +
                  ':::' +
                  sRObject);

    Finalize(aOcc_Open_Brk); Exit;
    }

    pGetClassFor;

    {To debug only
    ShowMessage(sRObject +
                '|' +
                sRPackage +
                '|' +
                sRClassFor);
    //Finalize(aOcc_Open_Brk); Exit;
    }

    {
    // It is necessary to workaround some cases (fails)
    if (sRClassFor <> EmptyStr) then begin
      i:= fGetPosMatchingForward(sRClassFor,
                                 '(',
                                 ')');

      j:= GetPosMatchingForward(sRClassFor,
                                 '[',
                                 ']');
      if (i <> 0) and
         (i > j) then
        Delete(sRClassFor,
               i + 1,
               length(sRClassFor));
    end;
    }

    if (sRClassFor <> EmptyStr) then
      sRClassFor:= StringReplace(sRClassFor,
                                 '''',
                                 '"',
                                 [rfReplaceAll]);  // Avoid problem with 'argumet', for example
                                                   //read.table(file='test',

    try
      pGetTipFrom_TCPIP(sRClassFor);
    finally
      //TODO
    end;
  end;

  {To debug only
  ShowMessage('OBJ=' +
              sRObject +
              #10#13 +
              'PKG=' +
              sRPackage +
              #10#13 +
              'CLF=' +
              sClassfor);
  }
end;

procedure TfrmMain.synCompletion(Kind: SynCompletionType;
                                     Sender: TObject;
                                     var CurrentInput: WideString;
                                     var x,
                                         y: Integer;
                                     var CanExecute: Boolean);

  procedure pGetLocLine(se: TSynEdit;
                        var sLocLine: string);
  var
    i: integer;

  begin
    with se do begin
      i:= CaretX;
      sLocLine:= LineText;
      sLocLine:= trim(Copy(sLocLine,
                           1,
                           i - 1));
    end;
  end;

  // It checks if the call is to data completion: object$
  function fIsDataCompletionCase: boolean;
  var
    i: integer;

    seEditor: TSynEdit;

    sLocLine,
      sTmp: string;

  begin
    seEditor:= nil;

    i:= fFindTopWindow;
    if Assigned(Self.MDIChildren[i] as TfrmEditor) then
      with (Self.MDIChildren[i] as TfrmEditor) do
        if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                         else seEditor:= synEditor2;

    if (iSynWithFocus = 3) then pGetLocLine(frmRTerm.synIO,
                                            sLocLine)
                           else pGetLocLine(seEditor,
                                            sLocLine);

    // This ReGex looks for $ (with restrictions) in the patther of data completion
    // https://regex101.com/r/dO4oB0/5
    //$re = '/\b\$(?!.+,)/m';
    //$str = 'iris$Species,
    //BOD$T
    //BOD$Time
    //BOD$Time,
    //iris$,
    //BOD$
    //airquality$
    //$aaa
    //a$aa
    //aa$a
    //aaa_bbb$ccc
    //aaa.bbb$ccc
    //aaa_1bb$ccc
    //aaa_111$ccc
    //aaa.222$ccc
    //aa2_333$ccc
    //iris$
    //iris$S
    //iris$Se
    //iris$Sep
    //iris$Sepal';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sTmp:= fReGex(sLocLine,
                  '\b\$(?!.+,)',
                  False);

    Result:= (sTmp <> EmptyStr);
  end;

  procedure pGetCompletion(var sRObject,
                               sRPackage,
                               sCompletion: string;
                           var bFound: boolean);

    procedure pGetInfo_ClearCompletion;
    begin
      pGet_RInfo(sCompletion,
                 sRPackage,
                 sRObject);  // Get info, [package] and <object>, from the returned

      sCompletion:= StringReplace(sCompletion,
                                  sRPackage,
                                  EmptyStr,
                                  []);

      sCompletion:= StringReplace(sCompletion,
                                  sRObject,
                                  EmptyStr,
                                  []);
      sCompletion:= trim(sCompletion);
    end;


    // Receive and adequate tip from R under TCPIP
    procedure pReceiveCompletionFromTCPIP;
    var
      i: integer;

    begin
      sCompletion:= csRtip.Socket.ReceiveText;

      pGetInfo_ClearCompletion;

      // Remove first "
      i:= Pos('"',
              sCompletion);

      Delete(sCompletion,
             1,
             i);

      // Remove latest "
      sCompletion:= fInvertString(sCompletion);

      i:= Pos('"',
              sCompletion);

      Delete(sCompletion,
             1,
             i);

      // Remove latest |
      i:= Pos('|',
              sCompletion);

      Delete(sCompletion,
             1,
             i);

      sCompletion:= fInvertString(sCompletion);
      sCompletion:= trim(sCompletion);
    end;

    procedure pCompletionGetFromTCPIP(var sCmd,
                                          sPattern: string;
                                      var bFound: boolean);
    var
      i: integer;

    begin
      // Try to use TCPIP
      if fUseTCPIP then begin
        sCmd:= 'trComplete(' +
               '''' +
               sRObject +
               '''' +
               ', ' +
               'pattern=' +
               '''' +
               sPattern +
               '''' +
               ', ' +
               'sep=''|''' +
               ')' + #13#10;

        csRtip.Socket.SendText(sCmd);

        i:= 0;
        repeat
          Sleep(iDelay);  // This delay is very important!
          pReceiveCompletionFromTCPIP;
          inc(i);
        until (sCompletion <> EmptyStr) or
              (i = 5);

        if (sCompletion <> EmptyStr) then
          bFound:= True
        else begin
          stbMain.Panels[8].Text:= 'Completion not found';
          if fUseTCPIP then stbMain.Panels[9].Text:= '<' +
                                                     sRObject +
                                                     '>' +
                                                     ' R server linked: YES'
                      else stbMain.Panels[9].Text:= '<' +
                                                    sRObject +
                                                    '>' +
                                                    ' R server linked: NOT';
        end;
      end;
    end;

  var
    i: integer;

    sLocline,
     sPattern: string;

    seEditor: TSynEdit;

  begin
    seEditor:= nil;
    sPattern:= EmptyStr;

    i:= fFindTopWindow;
    if Assigned(Self.MDIChildren[i] as TfrmEditor) then
      with (Self.MDIChildren[i] as TfrmEditor) do
        if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                         else seEditor:= synEditor2;

    if (iSynWithFocus = 3) then pGetLocLine(frmRTerm.synIO,
                                            sLocLine)
                           else pGetLocLine(seEditor,
                                            sLocLine);

    // https://regex101.com/r/mJ0xG4/4
    //$re = '/[a-zA-Z0-9:._\$]+(?=\$)/m';
    //$str = '> str(datasets::iris$)
    //> plot(datasets::iris$
    //str(datasets::iris$)
    //plot(datasets::iris$
    //str(iris$)
    //plot(iris$
    //plot(BOD$
    //iris$
    //A$
    //A$a2$
    //A$a2$b3$
    //a.b$
    //a_b$';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sRObject:= fRegEx(sLocLine,
                      '[a-zA-Z0-9:._\$]+(?=\$)',
                      False);

    // https://regex101.com/r/qR5bY3/1
    //$re = '/[a-zA-Z0-9._-]+(?<=$)/m';
    //$str = '> str(datasets::ris$S-0.pp
    //> plot(datasets::iris$S
    //str(datasets::iris$S
    //plot(datasets::iris$Sp
    //str(iris$S
    //plot(iris$Sp
    //plot(IRIs$S
    //iris$Petal.Lengt';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sPattern:= fRegEx(sLoclIne,
                      '[a-zA-Z0-9._-]+(?<=$)',
                      False);

    // It will use the ReGex n the function .DollarNames(x, pattern='^sPattern')
    if not bDataCompletionAnywhere then sPattern:= '^' +
                                                   sPattern;

    pCompletionGetFromTCPIP(sRObject,
                            sPattern,
                            bFound);
  end;

  // Data completion
  procedure pDoDataCompletion;
  var
    sRObject,
     sRPackage,
     sCompletion: string;

    slTmp: TStringList;

    bFound: boolean;

  begin
    sRObject   := EmptyStr;
    sRPackage  := EmptyStr;
    sCompletion:= EmptyStr;

    pGetCompletion(sRObject,
                   sRPackage,
                   sCompletion,
                   bFound);

    if CanExecute then begin
      slTmp:= TStringList.Create;
      pString_Split('|',
                    sCompletion,
                    slTmp);

      with TSynCompletionProposal(Sender) do begin
        ClearList;
        NbLinesInWindow:= slTmp.Count;
        ItemList.AddStrings(slTmp);
      end;

      FreeAndNil(slTmp);

      if (bFound) then
        with stbMain do begin
          Panels[8].Text:= sRPackage;
          Panels[9].Text:= sRObject;
        end;
    end
    else TSynCompletionProposal(Sender).ClearList;
  end;

  {
  function TipToShow_Adequation(str: string): string;
  var
    i,
     iPosClosePar,
     iLengthLine :integer;

    sTmp,
     sOri,
     sDes,
     sTmp1: string;

  begin
    iPosClosePar:= 0;
    sOri        := Str;
    sDes        := '"';
    iLengthLine := length(sOri);

    for i:=1 to iLengthLine do begin
      sTmp1:= sOri[i];
      if (sTmp1 = '(') then begin
        sTmp:= sOri;

        Delete(sTmp,
               1,
               i-1);  // Delete all char before this occurrence of '('

        if (i >= iPosClosePar) then iPosClosePar:= ((i-1) + fGetPosMatchingForward(sTmp,
                                                                                   '(',
                                                                                   ')'));
      end;

      if (sTmp1 <> '\') then
      begin
        if (sTmp1 <> '"') then
          if (sTmp1 <> ',') then sDes:= (sDes +
                                         sTmp1)
          else
            if (i >= iPosClosePar) then sDes:= (sDes +
                                                ',", "')
                                   else sDes:= (sDes +
                                                ',')
        else if (sTmp1 = '"') then sDes:= (sDes +
                                           '''');
      end
      else if (sTmp1 = '\') then sDes:= (sDes +
                                         EmptyStr);
    end;
    sDes  := (sDes +
              '"');
    Result:= sDes;
  end;
  }

  function fTipToWrite_Adequation(sTr: string): string;
  var
    i,
     iLengthLine: integer;

    sOri,
     sDes,
     sTmp1: string;

  begin
    sOri:= sTr;

    sOri:= StringReplace(sOri,
                         '|',
                         ', ',
                         [rfReplaceAll]);

    iLengthLine:= length(sOri);
    for i:=1 to iLengthLine do begin
      sTmp1:= sOri[i];

      if (sTmp1 <> '\') then
      begin
        if (sTmp1 <> '"') then
          if (sTmp1 <> ' ') then sDes:= (sDes +
                                         sTmp1)
          else  // tmp1 = ' ', i.e, space
            if (sOri[i-1] = ',') then sDes:= (sDes +
                                              sTmp1)
                                 else sDes:= sDes
        else if (sTmp1 = '"') then sDes:= (sDes +
                                           '''');
      end
      else if (sTmp1 = '\') then sDes:= (sDes +
                                         EmptyStr);
    end;
    Result:= sDes;
  end;

var
  bTipFound : boolean;

  sRObject,
   sRPackage,
   sRTip,
   sTip: string;

  slTmp: TStringList;

const
  NMC_RServer = '"[..] NOT MATCHED: Check integrity of the parameter(s) for this function in the R Server!"';
  NMP_RServer = '"(..) NOT MATCHED: Check integrity of the parameter(s) for this function in the R Server!"';

begin
  if not fValidRRunning then Exit;

  // Case of object$
  if fIsDataCompletionCase then begin
    pDoDataCompletion;
    Exit;
  end;

  sRObject := EmptyStr;
  sRPackage:= EmptyStr;
  sRTip    := EmptyStr;

  bTipFound:= False;

  pGetCallTip(sRObject,
              sRPackage,
              sRTip,
              bTipFound);

  if (not bTipFound) then Exit;

  TSynCompletionProposal(Sender).ItemList.Clear;
  if (sTipFromRServer <> EmptyStr) then pGet_RInfo(sRTip,
                                                   sRPackage,
                                                   sRObject);  // Get info, [package] and <object>, from the returned

  sRTip:= StringReplace(sRTip,
                        sRPackage,
                        EmptyStr,
                        []);

  sRTip:= StringReplace(sRTip,
                        sRObject,
                        EmptyStr,
                        []);

  try
    slTmp:= TStringList.Create;

    {Adapted from: http://www.andreanolanusse.com/pt/como-dividir-uma-string-em-um-array-utilizando-delphi/
     ExtractStrings respect spaces inside of the string: | ba ba ba | bebe be -> [1] ba ba ba
                                                                                 [2] bebe be}
    ExtractStrings(['|'],
                   [],
                   PChar(sRtip),
                   slTmp);

    with TSynCompletionProposal(Sender) do begin
      ClearList;
      NbLinesInWindow:= slTmp.Count;
      ItemList.AddStrings(slTmp);
    end;
  finally
    FreeAndNil(slTmp);
  end;

  sTipToWrite:= fTipTowrite_Adequation(sRTip);  // Will be available to be inserted (Ctrl + *)

  if (sTipFromRServer <> EmptyStr) then begin
    if (sRPackage = EmptyStr) then sRPackage:= ' [.ClobalEnv]';

    sTip:= //'R -> ' +
           //sTipFromRServer +
           //' ' +
           sRPackage;

    stbMain.Panels[8].Text:= sTip;
    stbMain.Panels[9].Text:= sRObject;
  end;
end;

(* The below enable Tinn-R to open files by Enter or Double click from Windows Explorer *)
procedure TfrmMain.DefaultHandler(var message);
begin
  if (Integer(TMessage(message).Msg) = WM_FINDINSTANCE) then
    TMessage(message).Result:= MyUniqueConst
  else if (TMessage(message).Msg = WM_RESTOREAPP) then
    PostMessage(Application.Handle,
                WM_SYSCOMMAND,
                SC_RESTORE,
                0)
  else
    inherited DefaultHandler(TMessage(message));
end;

function TfrmMain.fGetBuildInfo: string;
var
  VerInfoSize,
   VerValueSize,
   Dummy: DWORD;

  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;

  wV1,
   wV2,
   wV3,
   wV4: Word;

begin
  VerInfoSize:= GetFileVersionInfoSize(PChar(ParamStr(0)),
                                       Dummy);

  GetMem(VerInfo,
         VerInfoSize);

  GetFileVersionInfo(PChar(ParamStr(0)),
                     0,
                     VerInfoSize,
                     VerInfo);

  VerQueryValue(VerInfo,
                '\',
                Pointer(VerValue),
                VerValueSize);

  with VerValue^ do begin
    wV1:= dwFileVersionMS shr 16;
    wV2:= dwFileVersionMS and $FFFF;
    wV3:= dwFileVersionLS shr 16;
    wV4:= dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo,
          VerInfoSize);

  Result:= InttoStr(wV1) +
                    '.' +
                    //InttoStr(wV2) +
                    Format('%.*d', [2, wV2]) +
                    '.' +
                    //InttoStr(wV3) +
                    Format('%.*d', [2, wV3]) +
                    '.' +
                    //InttoStr(wV4);
                    Format('%.*d', [2, wV4]);
end;

procedure TfrmMain.actFileNewExecute(Sender: TObject);
begin
  inc(iFileCount);

  with TfrmEditor.Create(Self) do begin
    synEditor.OnPaintTransient:= TSyn_Transient.pSynPaintTransient;

    pSetDataCompletion(synEditorTip,
                       (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor,
                       'CTRL+SPACE');

    (Self.MDIChildren[fFindTopWindow] as tfrmEditor).pToogleWordWrap(actEditorLineWrap.Checked);

    synEditor.ReadOnly:= False;

    if (bActiveLine) then synEditor.ActiveLineColor:= TColor(clActiveLine)
                     else synEditor.ActiveLineColor:= TColor(clNone);

    actReadOnly.Checked:= False;
  end;

  seUsed:= seDefault;  {Do not remove!
                        By default (SynUnidoce) it is seUTF8 on creating!
                        Syn Unicode Line 381: TSynEncoding = (seUTF8, seUTF16LE, seUTF16BE, seANSI); }

  with TTabSheet.Create(Self) do begin
    PageControl:= pgFiles;
    Caption    := 'Untitled' +
                  IntToStr(iFileCount);
    Hint       := Caption;
  end;

  pgFiles.ActivePageIndex:= pgFiles.PageCount - 1;
  pgFiles.ActivePage.Tag := -1;

  pUpdateHexViewer;
end;

procedure TfrmMain.actFileOpenExecute(Sender: TObject);
var
  i: integer;

begin
  with odMain do begin
    InitialDir:= sWorkingDir;
    Filter    := sdMain.Filter;

    Options   := Options +
                 [ofAllowMultiSelect];

    if Execute then
      for i:= 0 to (Files.Count - 1) do
        pOpenFileIntoTinn(Files[i]);

    Options:= Options -
              [ofAllowMultiSelect];
  end;
end;

procedure TfrmMain.pRMenu(bOption: boolean);
begin
  menR.Visible          := bOption;
  actTobRVisible.Visible:= bOption;
end;

procedure TfrmMain.pRToolbar(bOption: boolean);
begin
  TBRDockTop.Visible   := bOption;
  TBRMain.Visible      := bOption;
end;

procedure TfrmMain.pControlResources(bOption: boolean);
begin
  // Main R menu and R toolbar alphabetically ordered
  actRContClearAll.Enabled               := bOption;
  actRContClearConsole.Enabled           := bOption;
  actRContCloseAllGraphics.Enabled       := bOption;
  actRContEditVariable.Enabled           := bOption and (pgFiles.PageCount > 0);
  actRContEscape.Enabled                 := bOption and not fRterm_Running;
  actRContExampleSelectedWord.Enabled    := bOption;
  actRContOpenExampleSelectedWord.Enabled:= bOption;
  actRContFixVariable.Enabled            := bOption and (pgFiles.PageCount > 0);
  actRContHelp.Enabled                   := bOption;
  actRContHelpSelectedWord.Enabled       := bOption;
  actRContListAllObjects.Enabled         := bOption;
  actRContListVariableNames.Enabled      := bOption and (pgFiles.PageCount > 0);
  actRContListVariableStructure.Enabled  := bOption and (pgFiles.PageCount > 0);
  actRContPacInstall.Enabled             := bOption;
  actRContPacInstalled.Enabled           := bOption;
  actRContPacInstallZip.Enabled          := bOption;
  actRContPacInstTinnRcom.Enabled        := bOption;
  actRContPacLoad.Enabled                := bOption;
  actRContPacLoadTinnRcom.Enabled        := bOption;
  actRContPacNew.Enabled                 := bOption;
  actRContPacRemove.Enabled              := bOption;
  actRContPacStatus.Enabled              := bOption;
  actRContPacUpdate.Enabled              := bOption;
  actRContPlotVariable.Enabled           := bOption and (pgFiles.PageCount > 0);
  actRContPrintVariableContent.Enabled   := bOption and (pgFiles.PageCount > 0);
  actRContRemoveAllObjects.Enabled       := bOption;
  actRContTCPConnection.Enabled          := bOption or not bIPLocal;
  actRSendClipboard.Enabled              := bOption;

  // Rterm
  actRtermIOHistoryNext.Enabled := bOption and fRterm_Running;
  actRtermIOHistoryPrior.Enabled:= bOption and fRterm_Running;
  actRtermLoadHistory.Enabled   := bOption and fRterm_Running;
  actRtermLoadWorkspace.Enabled := bOption and fRterm_Running;
  actRtermSaveHistory.Enabled   := bOption and fRterm_Running;
  actRtermSaveWorkspace.Enabled := bOption and fRterm_Running;
  menRtermHistoryNext.Enabled   := bOption and fRterm_Running;
  menRtermHistoryPrior.Enabled  := bOption and fRterm_Running;

  // Rcard
  actRcardExampleSelected.Enabled    := bOption;
  actRcardOpenExampleSelected.Enabled:= bOption;
  actRcardHelpSelected.Enabled       := bOption;

  // Rcompletion
  actCompletionExampleSelected.Enabled:= bOption;
  actCompletionHelpSelected.Enabled   := bOption;

  // Mirrors
  actRmirrorsSetRepos.Enabled:= bOption;
  actRmirrorsUpdate.Enabled  := bOption;

  // R explorer
  actREnvironmentRefresh.Enabled:= bOption;
  actRExplorerRefresh.Enabled   := bOption;
  actRFilterRefresh.Enabled     := bOption;

  if Assigned(frmTools) then
    with frmTools.lvRexplorer.Items do
      if (Count = 0) then pSetRExplorer(False)
                     else pSetRExplorer(bOption);

  // Project
  pmenProjRSendToR.Enabled   := bOption;
  pmenProjRSetWorkDir.Enabled:= bOption and (iProjecSelected = 2);

  // Menu R
  menRGet_Info.Enabled   := bOption;
  menRSet_trPAths.Enabled:= bOption;
end;

procedure TfrmMain.pSendResources(bOption: boolean);
var
  bMark: boolean;

  i: integer;

  seEditor: TSynEdit;

begin
  i:= 0;
  bMark:= False;
  if (pgFiles.PageCount > 0) then begin
    i:= fFindTopWindow;
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;
    with seEditor do
      if (Marks.Count <> 0) then bMark:= True;
  end;

// Alphabetically ordered
  actFormatR.Enabled                   := bOption;
  actRContSetWorkDirectory.Enabled     := bOption and FileExists((Self.MDIChildren[i] as TfrmEditor).sActiveFile);
  actRCurrentLineToTop.Enabled         := bOption;
  actRSendBlockMarked.Enabled          := bOption and bMark;
  actRSendContiguous.Enabled           := bOption;
  actRSendCursorToBeginningLine.Enabled:= bOption;
  actRSendCursorToEndLine.Enabled      := bOption;
  actRSendFile.Enabled                 := bOption;
  actRSendKnitHtml.Enabled             := bOption;
  actRSendKnitPdf.Enabled              := bOption;
  actRSendLine.Enabled                 := bOption;
  actRSendSmart.Enabled                := bOption;
  actRSendLinesToEndPage.Enabled       := bOption;
  actRSendSweave.Enabled               := bOption;
end;

procedure TfrmMain.actWindowArrangeExecute(Sender: TObject);
begin
  ArrangeIcons;
  sWindowOption:= 'Arranje icons';
end;

procedure TfrmMain.actWindowCascadeExecute(Sender: TObject);
begin
  Cascade;
  sWindowOption:= 'Cascade';
end;

procedure TfrmMain.actWindowMinimizeAllExecute(Sender: TObject);
var
  i: integer;

begin
  for i:= (Self.MDIChildCount - 1) downto 0 do
    Self.MDIChildren[i].WindowState:= wsMinimized;
  sWindowOption:= 'Minimize all';
end;

procedure TfrmMain.actWindowTileHorizontalExecute(Sender: TObject);
begin
  TileMode     := tbHorizontal;
  sWindowOption:= 'Tiled horizontal';
  Tile;
end;

procedure TfrmMain.actWindowTileVerticalExecute(Sender: TObject);
begin
  TileMode     := tbVertical;
  sWindowOption:= 'Tiled vertical';
  Tile;
end;

procedure TfrmMain.actWINExecute(Sender: TObject);
begin
  actWIN.Checked:= True;
  ffDefault     := sffDOS;
end;

procedure TfrmMain.HighlighterSelection(Sender: TObject);
var
  i: integer;

  sTmp: string;

begin
  if (Self.MDIChildCount > 0) then begin
    for i:= (Self.MDIChildCount - 1) downto 0 do
      if Self.MDIChildren[i].Active then break;
    (Self.MDIChildren[i] as TfrmEditor).pSetHighlighterStatus(Sender);
    pgFiles.ActivePage.Tag:= (Self.MDIChildren[i] as TfrmEditor).fSetHighlighterID;
  end
  else begin
    if Sender is TComboBox then begin
      sTmp:= trim((Sender as TComboBox).Text);
      pSetSyntaxMenuItem(sTmp)
    end
    else begin
      sTmp:= StringReplace((Sender as TMenuItem).Caption,
                           '&',
                           EmptyStr,
                           []); // [rfReplaceAll])
      pSetSyntaxComboBox(sTmp);
    end;
  end;
end;

procedure TfrmMain.pOpenUserGuidePDF(sWhere: string);
var
  sFile,
   sViewerDefault,
   sPathSumatra,
   sParameter: string;

begin
  sFile:= sPath_TinnR +
          '\doc\User_guide.pdf';

  sParameter:= '-view "continuous single page" ' + 
               '-reuse-instance ' +
               '-named-dest ' +
               sWhere;

  try
    sViewerDefault:= fGetAssociation('.pdf');

    if Pos('Sumatra',
           sViewerDefault) > 0 then
      // Open default PDF viewer
      ShellExecute(0,
                   'open',
                   Pchar(sFile),
                   Pchar(sParameter),
                   nil,
                   sw_shownormal)
    else begin
      sPathSumatra:= sPath_TinnR +
                     '\sumatra\SumatraPDF.exe';

      // Open SumatraPDF viewer
      fOpen_CmdLine(sPathSumatra +
                    ' "' +
                    sFile +
                    '" ' +
                    sParameter,
                    sw_shownormal);
    end;
  except
    fMessageDlg('PDF viewer is not accessible!',
                mtInformation,
                [mbOk],
                0);
  end;
end;

procedure TfrmMain.menHelUserGuideClick(Sender: TObject);
begin
  pOpenUserGuidePDF('"Contents"');
end;

procedure TfrmMain.menHelUserListClick(Sender: TObject);
begin
  pOpen_Url('http://groups.google.com/forum/?fromgroups#!forum/tinn-r');
end;

procedure TfrmMain.actTobSearchVisibleExecute(Sender: TObject);
begin
  tobSearch.Visible             := not(tobSearch.Visible);
  menViewToolbarsSearch.Checked := tobSearch.Visible;
  pmenViewToolbarsSearch.Checked:= tobSearch.Visible;
end;

procedure TfrmMain.actTobSyntaxVisibleExecute(Sender: TObject);
begin
  tobSyntax.Visible             := not(tobSyntax.Visible);
  menViewToolbarsSyntax.Checked := tobSyntax.Visible;
  pmenViewToolbarsSyntax.Checked:= tobSyntax.Visible;
end;

procedure TfrmMain.actTobFilesVisibleExecute(Sender: TObject);
begin
  tobFile.Visible             := not(tobFile.Visible);
  menViewToolbarsFile.Checked := tobFile.Visible;
  pmenViewToolbarsFile.Checked:= tobFile.Visible;
end;

procedure TfrmMain.actTobFilterVisibleExecute(Sender: TObject);
begin
  tobFilter.Visible             := not(tobFilter.Visible);
  menViewToolbarsFilter.Checked := tobFilter.Visible;
  pmenViewToolbarsFilter.Checked:= tobFilter.Visible;
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
begin
  with TfrmAbout.Create(Self) do
    try
      ShowModal;
    finally
      frmMain.Refresh;
      FreeAndNil(frmAbout);
      pSetFocus_Main;
    end;
end;

procedure TfrmMain.pWMDropFiles(var Msg: TWMDropFiles);
var
  chTmp: PChar;

  i,
   iSize,
   iCount: integer;

  slFile: TStringList;

begin
  try
    chTmp:= '';
    iCount:= DragQueryFile(Msg.Drop,
                           $FFFFFFFF,
                           chTmp,
                           255);
    slFile:= TStringList.Create;
    try
      for i:= 0 to (iCount - 1) do begin
        iSize := DragQueryFile(Msg.Drop,
                               i,
                               nil,
                               0) + 1;
        chTmp:= StrAlloc(iSize);

        try
      	  DragQueryFile(Msg.Drop,
                        i,
                        chTmp,
                        iSize);

    	  if FileExists(chTmp) then slFile.Add(ExpandFileName(chTmp));
        finally
    	    StrDispose(chTmp);
        end;
      end;

      for i:= 0 to (slFile.Count - 1) do
        pOpenFileIntoTinn(slFile.Strings[i]);

    finally
      FreeAndNil(slFile);
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TfrmMain.pWMCopyData(var msg: TWMCopyData);
var
  chReceived: PChar;

  sPathReceived: string;

begin
  chReceived   := msg.CopyDataStruct.lpData;
  sPathReceived:= AnsiExtractQuotedStr(chReceived,
                                       '"');
  pCheckIfFileFromDvi(StringReplace(sPathReceived,
                                    '/',
                                    '\',
                                    [rfReplaceAll]));
end;

procedure TfrmMain.pSetFileSize_StatusBar(sFileName: string);

  // Return the exact file size for a file. Return zero if the file is not found.
  function fFileSize(FileName : string) : Int64;
  var
    srSearch: TSearchRec;

  begin
    if (FindFirst(FileName,
                  faAnyFile,
                  srSearch ) = 0) then  // if found
       Result:= Int64(srSearch.FindData.nFileSizeHigh) shl Int64(32) +     // Calculate the size
                Int64(srSearch.FindData.nFileSizeLow)
    else Result:= 0;
    FindClose(srSearch);                                                   // Close the find
  end;

  function fBytesToString(Bytes: real;
                          LongNames: boolean = false;
                         NrOfDecimals: Integer = 2): string;

  const
    aStrings: array [0..6] of string = ('B',
                                        'KB',
                                        'MB',
                                        'GB',
                                        'TB',
                                        'PB',
                                        'EB');

  var
    i: Integer;

    r: Real;

    s: string;

  begin
    i := 0;
    r := Bytes;
    while (r > 1024) and
          (i < 6)
    do begin
       inc(i);
       r:= r / 1024;
    end;
    Str(r:7:NrOfDecimals,
        s);
    Result:= trim(s +
                  ' ' +
                  aStrings[i]);
  end;

var
  dSize: double; // Int64

  sSize: string;

begin
  if (ExtractFileExt(sFileName)  = EmptyStr) and
     (Pos('Untitled',
          sFileName) > 0) then begin
    stbMain.Panels[5].Text:= EmptyStr;
    Exit;
  end
  else dSize:= fFileSize(sFileName);

  if (dSize > 0) and
     (pgFiles.PageCount > 0) then begin
      sSize:= 'Size: ' +
              fBytesToString(dSize);
      stbMain.Panels[5].Text:= sSize;
  end
  else stbMain.Panels[5].Text:= EmptyStr;
end;

procedure TfrmMain.actReadOnlyExecute(Sender: TObject);
var
  bReadOnly: boolean;

  i: integer;

begin
  i:= fFindTopWindow;
  with (Self.MDIChildren[i] as tfrmEditor).synEditor do
    if ReadOnly then begin
      ReadOnly := False;
      bReadOnly:= False;
      stbMain.Panels[3].Text:= 'Editing';
    end
    else begin
      ReadOnly := True;
      bReadOnly:= True;
      stbMain.Panels[3].Text:= 'Read only';
    end;

  with (Self.MDIChildren[i] as tfrmEditor) do begin
    if Assigned(synEditor2) then begin
      with synEditor2 do begin
        if ReadOnly then begin
          ReadOnly := False;
          bReadOnly:= False;
        end
        else begin
          ReadOnly := True;
          bReadOnly:= True;
        end;
      end;
    end;
  end;

  if not bReadOnly then (Self.MDIChildren[i] as TfrmEditor).pEnableSave;

  actReadOnly.Checked:= not(actReadOnly.Checked);

  with (Self.MDIChildren[i] as tfrmEditor) do
  begin
    if synEditor.Modified then begin
      pSetTabTitle('*');
      pCheckSaveStatus;
    end
    else begin
      pSetTabTitle(EmptyStr);
      pCheckSaveStatus;
    end
  end;
end;

procedure TfrmMain.pSetREcho_True;
begin
  // File
  actRSendFile.Caption   := 'File (echo=TRUE)';
  actRSendFile.Hint      := 'R send: file (echo=TRUE)';
  actRSendFile.ImageIndex:= 2;

  // Selection
  actRSendSelection.Caption   := 'Selection (echo=TRUE)';
  actRSendSelection.Hint      := 'R send: selection (echo=TRUE)';
  actRSendSelection.ImageIndex:= 4;

  // Clipboard
  actRSendClipboard.Caption   := 'Clipboard (echo=TRUE)';
  actRSendClipboard.Hint      := 'R send: clipboard (echo=TRUE)';
  actRSendClipboard.ImageIndex:= 269;

  // Block
  actRSendBlockMarked.Caption   := 'Marked block (echo=TRUE)';
  actRSendBlockMarked.Hint      := 'R send: marked block (echo=TRUE)';
  actRSendBlockMarked.ImageIndex:= 6;

  // Contiguous
  actRSendContiguous.Caption   := 'Contiguous (echo=TRUE)';
  actRSendContiguous.Hint      := 'R send: contiguous (echo=TRUE)';
  actRSendContiguous.ImageIndex:= 271;

  // Lines to EndPage
  actRSendLinesToEndPage.Caption   := 'Lines to end page (echo=TRUE)';
  actRSendLinesToEndPage.Hint      := 'R send: lines to end page (echo=TRUE)';
  actRSendLinesToEndPage.ImageIndex:= 8;
end;

procedure TfrmMain.pSetREcho_False;
begin
  // File
  actRSendFile.Caption   := 'File';
  actRSendFile.Hint      := 'R send: file';
  actRSendFile.ImageIndex:= 1;

  // Selection
  actRSendSelection.Caption   := 'Selection';
  actRSendSelection.Hint      := 'R send: selection';
  actRSendSelection.ImageIndex:= 3;

  // Clipboard
  actRSendClipboard.Caption   := 'Clipboard';
  actRSendClipboard.Hint      := 'R send: clipboard';
  actRSendClipboard.ImageIndex:= 268;

  // Block
  actRSendBlockMarked.Caption   := 'Marked block';
  actRSendBlockMarked.Hint      := 'R send: marked block';
  actRSendBlockMarked.ImageIndex:= 5;

  // Contiguous
  actRSendContiguous.Caption   := 'Contiguous';
  actRSendContiguous.Hint      := 'R send: contiguous';
  actRSendContiguous.ImageIndex:= 270;

  // Lines to EndPage
  actRSendLinesToEndPage.Caption   := 'Lines to end page';
  actRSendLinesToEndPage.Hint      := 'R send: lines to end page';
  actRSendLinesToEndPage.ImageIndex:= 298;
end;

procedure TfrmMain.actREchoExecute(Sender: TObject);
begin
  if not actREcho.Checked then begin
    bREcho:= True;
    actREcho.Checked:= bREcho;
    pSetREcho_True;
  end
  else begin
    bREcho:= False;
    actREcho.Checked:= bREcho;
    pSetREcho_False;
  end;
end;

procedure TfrmMain.actEditCopyExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          CopyToClipboard;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          CopyToClipboard;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          CopyToClipboard;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          CopyToClipboard;
  end;
end;

procedure TfrmMain.actEditCutExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          CutToClipboard;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          CutToClipboard;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          CutToClipboard;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          CutToClipboard;
  end;
end;

procedure TfrmMain.actEditPasteExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          PasteFromClipboard;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          PasteFromClipboard;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          PasteFromClipboard;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          PasteFromClipboard;
  end;
end;

procedure TfrmMain.actEditRedoExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          Redo;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          Redo;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          Redo;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          Redo;
  end;
end;

procedure TfrmMain.actEditSelectAllExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          SelectAll;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          SelectAll;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          SelectAll;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          SelectAll;
  end;
end;

procedure TfrmMain.actTobEditVisibleExecute(Sender: TObject);
begin
  tobEdit.Visible             := not(tobEdit.Visible);
  menViewToolbarsEdit.Checked := tobEdit.Visible;
  pmenViewToolbarsEdit.Checked:= tobEdit.Visible;
end;

// The following procedures are intended to facilitate the TinnRcom package installation
// and packages maintenance under Rterm settings the Windows Environment Variable (WEV) R_LIBS

// OBS: If we use R_LIBS_USER (instead of R_LIBS)
// and the user sets a WEV R_LIBS
// R-packages will stay in second position in .libPaths()
procedure TfrmMain.pSetRLibrary_Path(sTmp: string);

  function fRLibraryNumber(sTmp: string): string;
  begin
    // https://regex101.com/r/pL4eP7/1
    //$re = '/^[0-9]*.[0-9]*/m';
    //$str = '3.2.5
    //3.3.0
    //3.4.1
    //10.9.5
    //100.100.100';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    Result:= fRegEx(sTmp,
                    '^[0-9]*.[0-9]*',
                    False)
  end;

var
  sRLibDefault: string;

begin
  sRLibDefault:= fGetSpecialFolder(CSIDL_PERSONAL) +  // The same folder created (default) by R
                 '\R\win-library\' +
                 fRLibraryNumber(fGetRegistry_Key('SOFTWARE\R-core\R'));

  if (not DirectoryExists(sRLibDefault)) then begin
    try
      ForceDirectories(sRLibDefault);
    except
      fMessageDlg(sRLibDefault + #13 + #13 +
                  'The path above is no allowed for your system previleges!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;
  end;

{ Dev version: it was aborted!
  sRLibPath:= fGetSpecialFolder(CSIDL_PERSONAL) +
              '\R-packages';

  if (not DirectoryExists(sRLibPath)) then begin
    while fRgui_Running(True) do  // R is already running prior to Tinn-R be started. To create R_LIBS it is necessary to close R.
      fMessageDlg('It is the first time Tinn-R is used and there is an instance o R running!' + #13 + #13 +
                  'Because the need to create and configure the R_LIBS environment variable, it is necessary to close R.' + #13 +
                  'Please, save your work and close R just now!',
                  mtWarning,
                  [mbOk],
                  0);

    CreateDir(sRLibPath);
  end;

  pSetEnvVariable('R_LIBS',
                 sRLibPath);
}                 
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i,
   j: integer;

  miItem: TMenuItem;

  sName,
   sFilter: string;

begin
  if fIsPortable_Version then frmMain.Caption:= 'Tinn-R (portable)';

  (*
  // The below controls (automatically) the visibility of the menu Tools/Utils on build!
  {$IFDEF DEBUG}
    menToolsUtils.Visible:= True;
  {$ELSE}
    menToolsUtils.Visible:= False;
  {$ENDIF}
  *)
  if (DebugHook <> 0) then menToolsUtils.Visible:= True;

  frmSplash.pb.Position:= 0;

  // Initial status
  pToolsProjectControls(False);
  pToolsSearchControls(False);
  actMacroPlay.Enabled          := False;
  actMacroRecord.Enabled        := False;
  actReadOnly.Enabled           := False;
  actREnvironmentRefresh.Checked:= False;
  actRExplorerRefresh.Checked   := False;
  actRFilterRefresh.Checked     := False;
  actRtermWarningError.Visible  := False;
  actSplitHorizontal.Enabled    := False;
  actSplitRemove.Enabled        := False;
  actSplitVertical.Enabled      := False;

  DragAcceptFiles(Handle,
                  True);

  bStartingUp := True;
  slFileMRU   := TStringList.Create;
  slprojectMRU:= TStringList.Create;
  frmSplash.pb.Position:= 1;

  try
    frmTools:= TfrmTools.Create(nil);
    frmSplash.pb.Position:= 2;

    pCheckOrigin;

    pSetIniStructure;
    frmSplash.pb.Position:= 3;

    pCheckVersion;

    sOldPreferencesTmp:= sPath_Ini +
                         '_tmp';

    pSavePreferencesOfOldVersion;

    frmRterm:= TfrmRterm.Create(nil);
    frmSplash.pb.Position:= 4;

    pSetPreferences_Application;
    pSetPreferences_Editor;

    pCheckIni;

    pCheckIniDock;
    frmSplash.pb.Position:= 5;

    pCheckData;

    Application.CreateForm(TmodDados,
                           modDados);
    frmSplash.pb.Position:= 6;

    pSetRcard;
    frmSplash.pb.Position:= 7;

    pSetCompletion;
    pSetRmirrors;
    frmSplash.pb.Position:= 8;

    pSetShortcuts;

    pCheckREcho;  // Must be after pSetShortcuts!

    frmTools.tbsLatex.TabVisible:= actLatexVisible.Checked;
    pCheckLatex(False);

    pCheckProject;

    pCheckEditorOptions;

    pCheckTemporary;

    frmSplash.pb.Position:= 9;

    pDelete_Dir(sOldPreferencesTmp);
    if bColors_OldVersion or
       bCustom_OldVersion or
       bSyntax_OldVersion then begin
      bColors_OldVersion:= False;
      bCustom_OldVersion:= False;
      bSyntax_OldVersion:= False;
    end;

    Application.CreateForm(TdmSyn,
                           dmSyn);

    synURIOpener.URIHighlighter:= dmSyn.synURI;
    frmSplash.pb.Position:= 10;

    // Application
    pSaveNewIni_Application;                                                  // Will create a new and clean Tinn.tmp
    if FileExists(sPathIniTinn_File) then DeleteFile(sPathIniTinn_File);      // Delete old Tinn.ini

    RenameFile(sPathIniTinn_Tmp,
               sPathIniTinn_File);                                            // Set the new Tinn.ini

    // Editor
    pSaveNewIni_Editor;                                                       // Will create a new and clean Tinn.tmp
    if FileExists(sPathIniEditor_File) then DeleteFile(sPathIniEditor_File);  // Delete old Tinn.ini

    RenameFile(sPathIniEditor_Tmp,
               sPathIniEditor_File);                                          // Set the new Editor.ini

    frmSplash.pb.Position:= 11;

  except
    fMessageDlg(sPath_Ini + #13 + #13 +
                'Serious problem reading ini files!' + #13 +
                'Tinn-R can not be initiated.' + #13 + #13 +
                'Please, try to rename (or remove) the folder above and restart the program!' + #13 +
                'If this procedure not solve the problem, contact the developers.',
                mtError,
                [mbOk],
                0);
    Application.Terminate;
  end;

  menR.Visible:= False;  // Avoid flash in start if user not to use appearance like XP

  slFilters:= TStringList.Create;
  with slFilters do begin
    LineBreak:= '|';
    Sorted:= True;
  end;

  for j:= 0 to (dmSyn.iHigCount - 1) do begin
    sName:= (dmSyn.Components[j] as TSynCustomHighlighter).GetFriendlyLanguageName;
    if (sName = 'General_Multi-Highlighter') then sName:= (dmSyn.Components[j] as TSynMultiSyn).DefaultLanguageName;

    if (sName <> 'R term') and
       (sName <> 'Text term') then begin
      cbSyntax.Items.Add(sName);
      sFilter:= trim((dmSyn.Components[j] as TSynCustomHighlighter).DefaultFilter);
      slFilters.Add(sFilter);
    end;
  end;

  frmSplash.pb.Position:= 12;

  //cbSyntax.Sorted:= True; // It is important!!!
  i:= 0;
  for j:= 0 to (cbSyntax.Items.Count - 1) do begin
    sName := cbSyntax.Items.Strings[j];
    miItem:= newItem(sName,
                     0,
                     False,
                     True,
                     HighlighterSelection,
                     0,
                     format('SynItem%d',[i]));

    miItem.Tag:= i;
    menOptionSyntaxSet.Insert(i,
                              miItem);
    inc(i);
  end;

  sdMain.Filter:= slFilters.Text;

  with frmTools do begin
    fcbbToolsWinExplorer.Filter := slFilters.Text;
    fcbbToolsWorkExplorer.Filter:= slFilters.Text;
  end;

  for i := 0 to 9 do begin
    aImg[i] := TBitmap.Create;
    imlRexplorer.GetBitmap(i,
                           aImg[i]);
  end;

  with frmTools.cbbToolsRExplorer.Items do begin
    AddObject('All'       , aImg[0]);
    AddObject('All [- fx]', aImg[1]);
    AddObject('Function'  , aImg[2]);
    AddObject('Vector'    , aImg[3]);
    AddObject('Matrix'    , aImg[4]);
    AddObject('Frame'     , aImg[5]);
    AddObject('Array'     , aImg[6]);
    AddObject('List'      , aImg[7]);
    AddObject('Table'     , aImg[8]);
    AddObject('Other'     , aImg[9]);
  end;

  frmTools.cbbToolsRExplorer.ItemIndex   := 0;
  frmTools.cbbToolsREnvironment.ItemIndex:= 0;

  case iIO_Syntax of
    0: actRtermIO_TextExecute(nil);      // .txt
    1: actRtermIO_Text_nMLExecute(nil);  // .txt nML
    2: actRtermIO_RExecute(nil);         // .R
    3: actRtermIO_R_nMLExecute(nil);     // .R nML
  end;

  case iLOG_Syntax of
    0: actRtermLOG_TextExecute(nil);      // .txt
    1: actRtermLOG_Text_nMLExecute(nil);  // .txt nML
    2: actRtermLOG_RExecute(nil);         // .R
    3: actRtermLOG_R_nMLExecute(nil);     // .R nML
  end;

  iRFormatted:= -1;

  Application.OnActivate:= pAppActivate; // It controls when the application receives the focus.
                                         // It is necessary to procedure TfrmEditor.pFileChanged
  slFileNotify:= TStringList.Create;

  with slFileNotify do begin
    Sorted:= True;
    Duplicates:= dupIgnore;
  end;

  pSetDataCompletion(synIOTip,
                     frmRterm.synIO,
                     'CTRL+SPACE');
end;

procedure TfrmMain.pAppActivate(Sender: TObject);
var
  i,
   j: integer;

  sTmp: string;

begin
  if (slFileNotify.Count <= 0) then Exit;

  for i:= 0 to slFileNotify.Count - 1 do begin
    sTmp:= slFileNotify.Strings[i];

    for j:= 0 to pgFiles.PageCount - 1 do
      if (pgFiles.Pages[j].Hint = sTmp) then begin

        pgFiles.ActivePageIndex:= j;

        pgFilesChange(nil);

        if actNotification_US.Checked then actReloadExecute(nil)
        else
          if fMessageDlg(sTmp + #13 + #13 +
                         'This file has been modified by another program.' + #13 +
                         'Do you want to reload it?',
                         mtConfirmation,
                         [mbYes, mbNo],
                         0) = mrYes then actReloadExecute(nil);
      end;
  end;

  // Clear all prior file notification
  slFileNotify.Clear;
end;

procedure TfrmMain.pLoadEditorKeystrokes;
var
  sEditor: string;

  stream: TStream;

begin
  sEditor:= (sPath_Editor +
             '\Editor.kst');

  if FileExists(sEditor) then begin
    stream:= TFileStream.Create(sEditor,
                                fmOpenRead);

    with coEditor.Keystrokes do
      LoadFromStream(stream);

    FreeAndNil(stream);
  end;
end;

procedure TfrmMain.pSaveEditorKeystrokes;
var
  sEditor: string;

  stream: TStream;

begin
  sEditor:= sPath_Editor +
            '\Editor.kst';

  if FileExists(sEditor) then
    DeleteFile(sEditor);

  stream:= TFileStream.Create(sEditor,
                              fmCreate);

  with coEditor.Keystrokes do
    SaveToStream(stream);

  FreeAndNil(stream);
end;

procedure TfrmMain.pUnpackFile(sFile,
                                   sPath,
                                   sChoice: string);
begin
  with zipKit do begin
    FileName     := sFile;
    BaseDirectory:= sPath;
    ExtractFiles(sChoice);
    CloseArchive;
  end;
end;

procedure TfrmMain.pCheckOrigin;
begin
  with frmTools.memIniLog.Lines do begin
    Add('Version - ' +
        fGetBuildInfo);

    Add('Started - ' +
        DateTimeToStr(Now));

    Add(EmptyStr);

    Add('1. Path of executable and sources (origin)');

    Add('  Tinn-R - ' +
        Application.ExeName);
  end;

  sPath_TinnR:= ExtractFilePath(Application.ExeName);
//  ShowMessage('sPath_TinnR: ' + sPath_TinnR);

  Delete(sPath_TinnR,
         length(sPath_TinnR) - 4,
         5);  // Exclude '\bin\' of Tinn-R path

//  ShowMessage('sPath_TinnR: ' + sPath_TinnR);

  sPath_TinnRcom:= sPath_TinnR +
                   '\packages';

  sFileDataOrigin:= sPath_TinnR +
                    '\data\data.zip';

  sUtilsOrigin:= sPath_TinnR +
                 '\utils';

  sFileLatexOrigin:= sPath_TinnR +
                     '\latex\latex.zip';

  sFileProjectOrigin:= sPath_TinnR +
                       '\project\project.zip';

  //sPath_Pandoc:= sPath_TinnR +
  //               '\pandoc\pandoc.exe';

  with frmTools.memIniLog.Lines do begin
    Add('  data   - ' +
        sFileDataOrigin);

    Add('  latex  - ' +
        sFileLatexOrigin);

    //Add('  pandoc - ' +
    //    sPath_Pandoc);

    Add('  utils  - ' +
        sUtilsOrigin);

    Add('   \example - ' +
        sUtilsOrigin +
        '\example.R');

    Add('   \info    - ' +
        sUtilsOrigin +
        '\info.R');

    Add('   \install - ' +
        sUtilsOrigin +
        '\install.R');

    Add('   \mirrors - ' +
        sUtilsOrigin +
        '\mirrors.R');
  end;
end;

procedure TfrmMain.pSavePreferencesOfOldVersion;

  function fMakeBackup(sPathSource,
                       sPathDest,
                       sFiles: string): boolean;
  begin
    try
      if FileExists(sPathDest) then DeleteFile(sPathDest);
    except
      //TODO
    end;
    zipKit.StoreOptions:= [soStripPath];

    with zipKit do begin
      FileName:= sPathDest;
      AddFiles(sPathSource + sFiles,
               0 );
      CloseArchive;
      Result:= True;
    end;
  end;

var
  sPathColors_OldVersion,
   sPathSyntax_OldVersion: string;

begin
  if not DirectoryExists(sOldPreferencesTmp) then CreateDir(sOldPreferencesTmp);

  // Colors of old version
  if not FileExists(sPath_Ini +
                    '\colors\Custom_colors.ini') then Exit;

  sPathColors_OldVersion:= sPath_Ini +
                           '\colors';

  if DirectoryExists(sPathColors_OldVersion) then begin
    if fMakeBackup(sPathColors_OldVersion,
                   sOldPreferencesTmp +
                   '\colors_bkp.zip',
                   '\*.ini') then bColors_OldVersion:= True;
  end;

  // Syntax of old version
  sPathSyntax_OldVersion:= sPath_Ini +
                           '\syntax';

  if DirectoryExists(sPathSyntax_OldVersion) then begin
    if fMakeBackup(sPathSyntax_OldVersion,
                   sOldPreferencesTmp +
                   '\syntax_bkp.zip',
                   '\*.ini') then bSyntax_OldVersion:= True;
  end;
end;

procedure TfrmMain.pSetIniStructure;

  function fGet_LocalTmp: string;
  begin
     Result:= GetEnvironmentVariable('TEMP') + '\Tinn-R'
  end;

begin
  // Portable simple
  if fIsPortable_Version then begin
    sPath_Ini:= Copy(sPath_TinnR,
                     1,
                     fLastPos('\Tinn-R',
                              sPath_TinnR) + length('Tinn-R'));
    sPath_Ini:= sPath_Ini + '\app_data';  // Portable
  end
  else begin
    sApp_Data:= fGetSpecialFolder(CSIDL_APPDATA);
    sPath_Ini:= sApp_Data + '\Tinn-R';
  end;

//  ShowMessage('sPath_Ini: ' + sPath_Ini);

  sPath_App      := sPath_Ini + '\app';
  sPath_Bkp      := sPath_Ini + '\bkp';
  sPath_Color    := sPath_Ini + '\colors';
  sPath_Data     := sPath_Ini + '\data';
  sPath_Editor   := sPath_Ini + '\editor';
  sPath_Latex    := sPath_Ini + '\latex';
  sPath_Project  := sPath_Ini + '\project';
  sPath_Syntax   := sPath_Ini + '\syntax';
  sPath_SyntaxBKP:= sPath_Ini + '\syntax bkp';
  sPath_Tmp      := fGet_LocalTmp;

  sPathColor_Custom:= sPath_Color +
                      '\Custom.txt';  // It will stores cdMain custom colors

  // Ini files
  sPathIniTinn_File  := sPath_App + '\Tinn.ini';
  sPathIniEditor_File:= sPath_Editor + '\Editor.ini';

  ifTinn  := TIniFile.Create(sPathIniTinn_File);
  ifEditor:= TIniFile.Create(sPathIniEditor_File);

  with frmTools.memIniLog.Lines do begin
    Add(EmptyStr);
    Add('2. Path of ini folders');
    Add('  Tinn-R - ' + sPath_Ini);
    Add('   \' + ExtractFileName(sPath_App));
    Add('   \' + ExtractFileName(sPath_Bkp));
    Add('   \' + ExtractFileName(sPath_Color));
    Add('   \' + ExtractFileName(sPath_Data));
    Add('   \' + ExtractFileName(sPath_Editor));
    Add('   \' + ExtractFileName(sPath_Project));
    Add('   \' + ExtractFileName(sPath_Latex));
    Add('   \' + ExtractFileName(sPath_Syntax));
    Add('   \' + ExtractFileName(sPath_SyntaxBKP));
  end;
end;

procedure TfrmMain.pCheckIni;

  procedure pCheckPriorTo_2(sPathUser,
                            sPath_Ini: string);
  begin
    try
      if DirectoryExists(sPathUser) and
        (StrToInt(sVersion_Ini[1]) < 2) then begin
        pBackupSystemConfiguration(True);
        pDelete_Dir(sPathUser);
      end;
    except
      //TODO;
    end;
  end;

var
  sPathReadme_User,
   sPathReadme_Bkp,
   sPathReadme_App,
   sPathReadme_Color,
   sPathReadme_Syntax,
   sPathReadme_SyntaxBKP: string;

  tfTmp: TextFile;

begin
  with frmTools.memIniLog.Lines do begin
    Add(EmptyStr);
    Add('3. Verification of necessary folder and files');
    Add('3.1. Tinn-R, app, bkp, colors, syntax and syntax bkp');
  end;

  try
    pCheckPriorTo_2(sPath_Ini,
                    sPath_App);

    // Tinn-R
//    ShowMessage('sPath_Ini: ' + sPath_Ini);
    if (not DirectoryExists(sPath_Ini)) then begin
      CreateDir(sPath_Ini);
      frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                   sPath_Ini +
                                   ': CREATED');
    end
    else frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                      sPath_Ini +
                                      ': OK');

    // Tinn-R\app
    if (not DirectoryExists(sPath_App)) then begin
      CreateDir(sPath_App);
      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sPath_App) +
                                   '        : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('   \' +
                                      ExtractFileName(sPath_App) +
                                      '        : OK');

    // Tinn-R\bkp
    if (not DirectoryExists(sPath_Bkp)) then begin
      CreateDir(sPath_Bkp);
      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sPath_Bkp) +
                                   '        : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('   \' +
                                      ExtractFileName(sPath_Bkp) +
                                      '        : OK');

    // Tinn-R\colors
    if (not DirectoryExists(sPath_Color)) then begin
      CreateDir(sPath_Color);
      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sPath_Color) +
                                   '     : CREATED');
      // Recover colors from old version
      if bColors_OldVersion then pUnpackFile(sOldPreferencesTmp +
                                             '\colors_bkp.zip',
                                             sPath_Color,
                                             '*.*');
    end
    else frmTools.memIniLog.Lines.Add('   \' +
                                      ExtractFileName(sPath_Color) +
                                      '     : OK');

    // If the file does not exists, it will be created as an empty file
    if not FileExists(sPathColor_Custom) then
      fFile_Save_Fast(sPathColor_Custom,
                      '');

    // Tinn-R\editor
    if (not DirectoryExists(sPath_Editor)) then begin
      CreateDir(sPath_Editor);
      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sPath_Editor) +
                                   '     : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('   \' +
                                      ExtractFileName(sPath_Editor) +
                                      '     : OK');

    // Tinn-R\Syntax
    if (not DirectoryExists(sPath_Syntax)) then begin
      CreateDir(sPath_Syntax);
      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sPath_Syntax) +
                                   '     : CREATED');
      // Recover syntax from old version
      if bSyntax_OldVersion then pUnpackFile(sOldPreferencesTmp +
                                             '\syntax_bkp.zip',
                                             sPath_Syntax,
                                             '*.*');
    end
    else frmTools.memIniLog.Lines.Add('   \' +
                                      ExtractFileName(sPath_Syntax) +
                                      '     : OK');

    // Tinn-R\syntax bkp
    if (not DirectoryExists(sPath_SyntaxBKP)) then begin
      CreateDir(sPath_SyntaxBKP);
      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sPath_SyntaxBKP) +
                                   ' : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('   \' +
                                      ExtractFileName(sPath_SyntaxBKP) +
                                      ' : OK');
  except
    raise;
    Exit;
  end;

  Application.ProcessMessages;

  // Main ini
  pDelete_FilesOfPath(sPath_Ini);  // Necessary to remove trashes from previous versions related
                                   // to fixed bug in drag and drop from R explorer interface.
  
  sPathReadme_User:= sPath_Ini +
                     '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_User);
  Rewrite(tfTmp);
    WriteLn(tfTmp, 'This main folder stores:' + #13 +
                   '''app'', ''bkp'', ''colors'', ''data'', ''editor'', ''latex'', ''project'', ''syntax'' and ''syntax bkp''.');
  CloseFile(tfTmp);


  // app
  sPathReadme_App:= sPath_App +
                    '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_App);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            '''Tinn.ini'' and ''Tinn_dock.ini'' files.');
  CloseFile(tfTmp);


  // bkp
  sPathReadme_Bkp:= sPath_Bkp +
                    '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_Bkp);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'Backups of old ini files.');
  CloseFile(tfTmp);


  // colors
  sPathReadme_Color:= sPath_Color +
                      '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_Color);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'The ''Custom.txt'' file.');
  CloseFile(tfTmp);


  // syntax
  sPathReadme_Syntax:= sPath_Syntax +
                       '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_Syntax);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'All syntax user preferences.');
  CloseFile(tfTmp);


  // syntax bkp
  sPathReadme_SyntaxBKP:= sPath_SyntaxBKP +
                          '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_SyntaxBKP);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'Temporary backups of syntax preferences.');
  CloseFile(tfTmp);
end;

procedure TfrmMain.pCheckTemporary;
begin
  // Tinn-R: temporary folder
  with frmTools.memIniLog.Lines do begin
    Add(EmptyStr);
    Add('3.6. Temporary folder');
  end;

  if (DirectoryExists(sPath_Tmp)) then pDelete_Dir(sPath_Tmp);  // Tinn-R was terminated abnormally

  CreateDir(sPath_Tmp);

  frmTools.memIniLog.Lines.Add('  Tinn-R - ' +
                               sPath_Tmp +
                               ': CREATED');
end;

procedure TfrmMain.pCheckIniDock;
begin
  sIniDockFilePath:= (sPath_App +
                      '\Tinn_dock.ini');

  JvAppIniFileStorage.FileName:= sIniDockFilePath;
end;

procedure TfrmMain.pCheckData;

  procedure pCreateDataDir;
  begin
    CreateDir(sPath_Data);
    zipKit.FileName:= sFileDataOrigin;
    zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

    with zipKit do begin
      BaseDirectory:= sPath_Data;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' +
                                 sPath_Data +
                                 ': CREATED');
  end;

  procedure pMakeDataBackup(sFile: string);
  begin
    zipKit.StoreOptions:= [soRecurse];  // soRecurse: will include all files of all folders and sub-folders
    with zipKit do begin
      FileName:= sPath_Bkp +
                 fRemove_FileExtension(sFile) +
                 '_bkp_' +
                 IntToStr(Integer(MonthOf(Date))) +
                 '.' +
                 IntToStr(Integer(DayOf(Date))) +
                 '.' +
                 IntToStr(Integer(YearOf(Date))) +
                 '.zip';
      AddFiles(sPath_Data + sFile,
               0);
      frmTools.memIniLog.Lines.Add('  Backup - ' + 
                                   zipKit.FileName +
                                   ': DONE');
      CloseArchive;
    end;
  end;

var
  sPathReadmeDB,
   sFileRcard,
   sFileRmirrors,
   sFileComments,
   sFileCompletion,
   sFileShortcuts,
   sFileCache: string;

  tfTmp: TextFile;

begin
  sFileCache     := sPath_Data + '\Cache.xml';
  sFileRcard     := sPath_Data + '\Rcard.xml';
  sFileRmirrors  := sPath_Data + '\Rmirrors.xml';
  sFileComments  := sPath_Data + '\Comments.xml';
  sFileCompletion:= sPath_Data + '\Completion.xml';
  sFileShortcuts := sPath_Data + '\Shortcuts.xml';

  try
    with frmTools.memIniLog.Lines do begin
      Add(EmptyStr);
      Add('3.2. Data');
    end;

    if not DirectoryExists(sPath_Data) then pCreateDataDir
    else begin
      frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                   sPath_Data +
                                   ': OK');

      if (bUpdate_Cache)      then pMakeDataBackup('\Cache.xml');
      if (bUpdate_Rcard)      then pMakeDataBackup('\Rcard.xml');
      if (bUpdate_Rmirrors)   then pMakeDataBackup('\Rmirrors.xml');
      if (bUpdate_Comments)   then pMakeDataBackup('\Comments.xml');
      if (bUpdate_Completion) then pMakeDataBackup('\Completion.xml');
      if (bUpdate_Shortcuts)  then begin
        pMakeDataBackup('\Shortcuts.xml');
        // Shortcuts in use: = Shortcuts.xml
        if (sShortcutsInUse = sPath_Data +
            '\Shortcuts.xml') then begin
          RenameFile(sPath_Data +
                     '\Shortcuts.xml',
                     sPath_Data +
                     '\OldShortcuts.xml');

          pUnpackFile(sFileDataOrigin,
                      sPath_Data,
                      'Shortcuts.xml');  // It is necessary to make a new copy from origin

          with modDados do              // All useful information related to user preferences (shortcuts) will be add int the new Shortcuts.xml
            pShortcutsValidation(sPath_Data +
                                 '\OldShortcuts.xml',
                                 sPath_Data +
                                 '\Shortcuts.xml');
          DeleteFile(sPath_Data +
                     '\OldShortcuts.xml');
        end
        // Shortcuts in use: <> Shortcuts.xml
        else begin
          pUnpackFile(sFileDataOrigin,
                      sPath_Data,
                      'Shortcuts.xml');  // It is necessary to make a new copy from origin

          with modDados do              // All useful information related to user preferences (shortcuts) will be add int the new Shortcuts.xml
            pShortcutsValidation(sShortcutsInUse,
                                 sPath_Data +
                                 '\Shortcuts.xml');
          DeleteFile(sShortcutsInUse);
        end;

        sShortcutsInUse:= sPath_Data +
                          '\Shortcuts.xml';
      end;
    end;

    // Cache
    if not FileExists(sFileCache)  then begin
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Cache.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileCache) +
                                   '(version = ' +
                                   sCurrentVersion_Cache +
                                   ')' +
                                   ': CREATED');
    end
    else begin
    if bUpdate_Cache then
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Cache.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileCache) +
                                   '(version = ' +
                                   sCurrentVersion_Cache +
                                   ')' +
                                   ': OK');
    end;

    // Comments
    if not FileExists(sFileComments)  then begin
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Comments.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileComments) +
                                   '(version = ' +
                                   sCurrentVersion_Comments +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Comments then
        pUnpackFile(sFileDataOrigin,
                    sPath_Data,
                    'Comments.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileComments) +
                                   '(version = ' +
                                   sCurrentVersion_Comments +
                                   ')' +
                                   ': OK');
    end;

    // Completion
    if not FileExists(sFileCompletion)  then begin
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Completion.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileCompletion) +
                                   '(version = ' +
                                   sCurrentVersion_Completion +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Completion then
        pUnpackFile(sFileDataOrigin,
                    sPath_Data,
                    'Completion.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileCompletion) +
                                   '(version = ' +
                                   sCurrentVersion_Completion +
                                   ')' +
                                   ': OK');
    end;

    // Rcard
    if not FileExists(sFileRcard) then begin
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Rcard.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileRcard) +
                                   '(version = ' +
                                   sCurrentVersion_Rcard +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Rcard then
        pUnpackFile(sFileDataOrigin,
                    sPath_Data,
                    'Rcard.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileRcard) +
                                   '(version = ' +
                                   sCurrentVersion_Rcard +
                                   ')' +
                                   ': OK');
    end;

    // Rmirrors
    if not FileExists(sFileRmirrors) then begin
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Rmirrors.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileRmirrors) +
                                   '(version = ' +
                                   sCurrentVersion_Rmirrors +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Rmirrors then
        pUnpackFile(sFileDataOrigin,
                    sPath_Data,
                    'Rmirrors.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileRmirrors) +
                                   '(version = ' +
                                   sCurrentVersion_Rmirrors +
                                   ')' +
                                   ': OK');
    end;

    // Shortcuts
    if not FileExists(sShortcutsInUse) then sShortcutsInUse:= sPath_Data +
                                                              '\Shortcuts.xml';
    if not FileExists(sFileShortcuts)  then begin
      pUnpackFile(sFileDataOrigin,
                  sPath_Data,
                  'Shortcuts.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileShortcuts) +
                                   '(version = ' +
                                   sCurrentVersion_Shortcuts +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Shortcuts then
        pUnpackFile(sFileDataOrigin,
                    sPath_Data,
                    'Shortcuts.xml');

      frmTools.memIniLog.Lines.Add('   \' +
                                   ExtractFileName(sFileShortcuts) +
                                   '(version = ' +
                                   sCurrentVersion_Shortcuts +
                                   ')' +
                                   ': OK');
    end;
  except
    raise;
    Exit;
  end;
  sPathReadmeDB:= sPath_Data +
                  '\Readme.txt';

  AssignFile(tfTmp,
             sPathReadmeDB);

  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores (by default):' + #13 +
            'The XML files ''Cache.xml'', ''Comments.xml'', ''Completion.xml'', ''Rcard.xlm'',  ''Rmirrors.xml'' and ''Shortcuts.xml''.');
  CloseFile(tfTmp);
end;

procedure TfrmMain.pCheckLatex(bReload: boolean);

  procedure pCheckLatexDir(sDir: string;
                           bMain: boolean = False);
  begin
    if not DirectoryExists(sDir) then
      if bMain then
        frmTools.memIniLog.Lines.Add('  \' +
                                     ExtractFileName(sDir) +
                                     ': NOT FOUND')
      else
        frmTools.memIniLog.Lines.Add('    \' +
                                     ExtractFileName(sDir) +
                                     ': NOT FOUND')
    else
      if bMain then
        frmTools.memIniLog.Lines.Add('  \' +
                                     ExtractFileName(sDir) +
                                     ': OK')
      else
        frmTools.memIniLog.Lines.Add('    \' +
                                     ExtractFileName(sDir) +
                                     ': OK')
  end;

  procedure pCreateLatexDir;
  begin
    CreateDir(sPath_Latex);
    zipKit.FileName:= sFileLatexOrigin;
    zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

    with zipKit do begin
      BaseDirectory:= sPath_Latex;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' +
                                 sPath_Latex +
                                 ': CREATED');
  end;

  procedure pLoadSymbols(jviTmp: TJvImagesViewer;
                         sDir: string);
  begin
    with jviTmp do begin
      BeginUpdate;
      Directory:= sDir;
      LoadImages;
      EndUpdate;
    end;
  end;

var
  sPathReadmeLatex: string;

  tfTmp: TextFile;

begin
  try
    with frmTools.memIniLog.Lines do begin
      Add(EmptyStr);
      if not bReload then Add('3.3. Latex' +
                              ' (version = ' +
                              sVersion_Latex +
                              ')')
                     else Add('3.3. Latex (reload)' +
                              ' (version = ' +
                              sVersion_Latex +
                              ')');
    end;

    if (bUpdate_Latex) then begin
      if DirectoryExists(sPath_Latex) then begin  // Will make a backup of old latex folder
        zipKit.StoreOptions:= [soRecurse];        // soRecurse: will include all files of all folders and sub-folders

        with zipKit do begin
          FileName:= sPath_Bkp +
                     '\latex_bkp_' +
                     IntToStr(Integer(MonthOf(Date))) +
                     '.' +
                     IntToStr(Integer(DayOf(Date))) +
                     '.' +
                     IntToStr(Integer(YearOf(Date))) +
                     '.zip';
          AddFiles(sPath_Latex +
                   '\*.*',
                   0);
          frmTools.memIniLog.Lines.Add('  Backup - ' +
                                       zipKit.FileName +
                                       ': DONE');
          CloseArchive;
        end;
      end;
      
      pDelete_Dir(sPath_Latex);
      pCreateLatexDir;
    end
    else
      if DirectoryExists(sPath_Latex) then frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                                                       sPath_Latex +
                                                                       ': OK')
                                     else pCreateLatexDir;

    // Loading LaTeX Symbols
    // 01. accents
    pCheckLatexDir(sPath_Latex +
                   '\' +
                   '01. accents',
                   True);
    pLoadSymbols(frmTools.jvivAccents,
                 sPath_Latex +
                 '\' +
                 '01. accents');

    // 02. arrow
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow', True);
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '01. right');
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '02. down');
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '03. left');
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '04. up');
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '05. sloped');
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '06. both');
    pCheckLatexDir(sPath_Latex + '\' + '02. arrow' + '\' + '07. box');
    pLoadSymbols(frmTools.jvivArrowRight,  sPath_Latex + '\' + '02. arrow' + '\' + '01. right');
    pLoadSymbols(frmTools.jvivArrowDown,   sPath_Latex + '\' + '02. arrow' + '\' + '02. down');
    pLoadSymbols(frmTools.jvivArrowLeft,   sPath_Latex + '\' + '02. arrow' + '\' + '03. left');
    pLoadSymbols(frmTools.jvivArrowUp,     sPath_Latex + '\' + '02. arrow' + '\' + '04. up');
    pLoadSymbols(frmTools.jvivArrowSloped, sPath_Latex + '\' + '02. arrow' + '\' + '05. sloped');
    pLoadSymbols(frmTools.jvivArrowBoth,   sPath_Latex + '\' + '02. arrow' + '\' + '06. both');
    pLoadSymbols(frmTools.jvivArrowBox,    sPath_Latex + '\' + '02. arrow' + '\' + '07. box');

    // 03. bar
    pCheckLatexDir(sPath_Latex + '\' + '03. bar', True);
    pLoadSymbols(frmTools.jvivBar, sPath_Latex + '\' + '03. bar');

    // 04. bracket
    pCheckLatexDir(sPath_Latex + '\' + '04. bracket', True);
    pLoadSymbols(frmTools.jvivBracket, sPath_Latex + '\' + '04. bracket');

    // 05. dot
    pCheckLatexDir(sPath_Latex + '\' + '05. dot', True);
    pLoadSymbols(frmTools.jvivDot, sPath_Latex + '\' + '05. dot');

    // 06. geometry
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry', True);
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '01. line');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '02. angle');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '03. triangle');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '04. star');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '05. box');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '06. diamond');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '07. circle');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '08. var');
    pCheckLatexDir(sPath_Latex + '\' + '06. geometry' + '\' + '09. misc');
    pLoadSymbols(frmTools.jvivGeometryLine,     sPath_Latex + '\' + '06. geometry' + '\' + '01. line');
    pLoadSymbols(frmTools.jvivGeometryAngle,    sPath_Latex + '\' + '06. geometry' + '\' + '02. angle');
    pLoadSymbols(frmTools.jvivGeometryTriangle, sPath_Latex + '\' + '06. geometry' + '\' + '03. triangle');
    pLoadSymbols(frmTools.jvivGeometryStar,     sPath_Latex + '\' + '06. geometry' + '\' + '04. star');
    pLoadSymbols(frmTools.jvivGeometryBox,      sPath_Latex + '\' + '06. geometry' + '\' + '05. box');
    pLoadSymbols(frmTools.jvivGeometryDiamond,  sPath_Latex + '\' + '06. geometry' + '\' + '06. diamond');
    pLoadSymbols(frmTools.jvivGeometryCircle,   sPath_Latex + '\' + '06. geometry' + '\' + '07. circle');
    pLoadSymbols(frmTools.jvivGeometryVar,      sPath_Latex + '\' + '06. geometry' + '\' + '08. var');
    pLoadSymbols(frmTools.jvivGeometryMisc,     sPath_Latex + '\' + '06. geometry' + '\' + '09. misc');

    // 07. greek
    pCheckLatexDir(sPath_Latex + '\' + '07. greek', True);
    pCheckLatexDir(sPath_Latex + '\' + '07. greek' + '\' + '01. lower');
    pCheckLatexDir(sPath_Latex + '\' + '07. greek' + '\' + '02. upper');
    pCheckLatexDir(sPath_Latex + '\' + '07. greek' + '\' + '03. var');
    pCheckLatexDir(sPath_Latex + '\' + '07. greek' + '\' + '04. misc');
    pLoadSymbols(frmTools.jvivGreekLower, sPath_Latex + '\' + '07. greek' + '\' + '01. lower');
    pLoadSymbols(frmTools.jvivGreekUpper, sPath_Latex + '\' + '07. greek' + '\' + '02. upper');
    pLoadSymbols(frmTools.jvivGreekVar,   sPath_Latex + '\' + '07. greek' + '\' + '03. var');
    pLoadSymbols(frmTools.jvivGreekMisc,  sPath_Latex + '\' + '07. greek' + '\' + '04. misc');

    // 08. math
    pCheckLatexDir(sPath_Latex + '\' + '08. math', True);
    pCheckLatexDir(sPath_Latex + '\' + '08. math' + '\' + '01. function');
    pCheckLatexDir(sPath_Latex + '\' + '08. math' + '\' + '02. logical');
    pCheckLatexDir(sPath_Latex + '\' + '08. math' + '\' + '03. set');
    pCheckLatexDir(sPath_Latex + '\' + '08. math' + '\' + '04. var');
    pCheckLatexDir(sPath_Latex + '\' + '08. math' + '\' + '05. misc');
    pLoadSymbols(frmTools.jvivMathFunction, sPath_Latex + '\' + '08. math' + '\' + '01. function');
    pLoadSymbols(frmTools.jvivMathLogical,  sPath_Latex + '\' + '08. math' + '\' + '02. logical');
    pLoadSymbols(frmTools.jvivMathSet,      sPath_Latex + '\' + '08. math' + '\' + '03. set');
    pLoadSymbols(frmTools.jvivMathVar,      sPath_Latex + '\' + '08. math' + '\' + '04. var');
    pLoadSymbols(frmTools.jvivMathMisc,     sPath_Latex + '\' + '08. math' + '\' + '05. misc');

    // 09. misc
    pCheckLatexDir(sPath_Latex + '\' + '09. misc', True);
    pLoadSymbols(frmTools.jvivMisc, sPath_Latex + '\' + '09. misc');

    // 10. negation
    pCheckLatexDir(sPath_Latex + '\' + '10. negation', True);
    pLoadSymbols(frmTools.jvivNegation, sPath_Latex + '\' + '10. negation');

    // 11. operator
    pCheckLatexDir(sPath_Latex + '\' + '11. operator', True);
    pLoadSymbols(frmTools.jvivOperator, sPath_Latex + '\' + '11. operator');

    // 12. relation
    pCheckLatexDir(sPath_Latex + '\' + '12. relation', True);
    pLoadSymbols(frmTools.jvivRelation, sPath_Latex + '\' + '12. relation');

    // 13. sky
    pCheckLatexDir(sPath_Latex + '\' + '13. sky', True);
    pCheckLatexDir(sPath_Latex + '\' + '13. sky' + '\' + '01. solar');
    pCheckLatexDir(sPath_Latex + '\' + '13. sky' + '\' + '02. astrology');
    pCheckLatexDir(sPath_Latex + '\' + '13. sky' + '\' + '03. var');
    pLoadSymbols(frmTools.jvivSkySolar,     sPath_Latex + '\' + '13. sky' + '\' + '01. solar');
    pLoadSymbols(frmTools.jvivSkyAstrology, sPath_Latex + '\' + '13. sky' + '\' + '02. astrology');
    pLoadSymbols(frmTools.jvivSkyVar,       sPath_Latex + '\' + '13. sky' + '\' + '03. var');

    // 14. user_custom
    pCheckLatexDir(sPath_Latex + '\' + '14. user_custom', True);
    pLoadSymbols(frmTools.jvivUserCustom, sPath_Latex + '\' + '14. user_custom');
  except
    raise;
    Exit;
  end;
  sPathReadmeLatex:= sPath_Latex +
                     '\Readme.txt';

  AssignFile(tfTmp,
             sPathReadmeLatex);

  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'All LaTeX symbols of Tinn-R.' + #13 +
            'It is user customizable!');

  CloseFile(tfTmp);
end;

procedure TfrmMain.pCheckProject;
var
  tfTmp: TextFile;

  procedure pCreateProjectDemo;
  begin
    AssignFile(tfTmp,
               sPath_Project +
               '\pDemo.tps');

    Rewrite(tfTmp);
      WriteLn(tfTmp,
              '\1. doc'                                            + #13 +
              '  ' + sPath_Project + '\licence_gpl2.txt'           + #13 +
              '  ' + sPath_Project + '\licence_gpl3.txt'           + #13 +
              '  ' + sPath_Project + '\Tinn-R_recognized words.R'  + #13 +
              '\2. sample'                                         + #13 +
              '  ' + sPath_Project + '\deplate.dplt'               + #13 +
              '  ' + sPath_Project + '\pandoc.markdown'            + #13 +
              '  ' + sPath_Project + '\Tinn-R_example of script.R' + #13 +
              '  ' + sPath_Project + '\txt2tags.t2t'               + #13 +
              '\3. templates'                                      + #13 +
              '  ' + sPath_Project + '\R doc_dataset.Rd'           + #13 +
              '  ' + sPath_Project + '\R doc_empty.Rd'             + #13 +
              '  ' + sPath_Project + '\R doc_function.Rd'          + #13 +
              '  ' + sPath_Project + '\R html.Rhtml'               + #13 +
              '  ' + sPath_Project + '\R markdown.Rmd'             + #13 +
              '  ' + sPath_Project + '\R script.R'                 + #13 +
              '  ' + sPath_Project + '\R_noweb.Rnw'                + #13 +
              '\4. utils'                                          + #13 +
              '  ' + sPath_Project + '\example.R'                  + #13 +
              '  ' + sPath_Project + '\info.R'                     + #13 +
              '  ' + sPath_Project + '\install.R'                  + #13 +
              '  ' + sPath_Project + '\mirrors.R'                  + #13
              );

    CloseFile(tfTmp);
  end;

  procedure pCreateProjectDir;
  begin
    CreateDir(sPath_Project);
    zipKit.FileName:= sFileProjectOrigin;
    zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

    with zipKit do begin
      BaseDirectory:= sPath_Project;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' +
                                 sPath_Project +
                                 ': CREATED');
  end;

begin
  try
    with frmTools.memIniLog.Lines do begin
      Add(EmptyStr);
      Add('3.4. Project' +
          ' (version = ' +
          sVersion_Project +
          ')');
    end;

    // Will delete the entire project folder and creates a new fresh
    if (bUpdate_Project) then begin
      pDelete_Dir(sPath_Project);
      pCreateProjectDir;
      pCreateProjectDemo;
    end
    else
      if DirectoryExists(sPath_Project) then frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                                                         sPath_Project +
                                                                         ': OK')
                                        else begin  // User may have removed manually!
                                          pCreateProjectDir;
                                          pCreateProjectDemo;
                                        end;
      if not FileExists(sPath_Project +            // User may have removed manually or with remove project!
                        '\pDemo.tps') then
        pCreateProjectDemo;
  except
    raise;
    Exit;
  end;

  AssignFile(tfTmp,
             sPath_Project +
             '\Readme.txt');

  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'All files related to project demo of Tinn-R.' + #13 +
            'It is user customizable!');

  CloseFile(tfTmp);
end;

procedure TfrmMain.pCheckEditorOptions;

  procedure pUpdateShortcutsDir;
  begin
    pDelete_Dir(sApp_Data +
                '\Tinn-R\shortcuts'); // Related to old versions of Tinn-R
        pDelete_Dir(sApp_Data +
                    '\Tinn-R\editor shortcuts'); // Related to old versions of Tinn-R

    pDelete_Dir(sPath_Editor);
    CreateDir(sPath_Editor);
  end;

var
  sPathReadmeEditor: string;

  tfTmp: TextFile;

begin
  try
    with frmTools.memIniLog.Lines do begin
      Add(EmptyStr);
      Add('3.5. Editor options');
    end;

    pLoadEditorKeystrokes;
    pUpdateShortcutsDir;
    frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                 sPath_Editor +
                                 ': CREATED');

    frmTools.memIniLog.Lines.Add('   \' +
                                 'Editor.kst' +
                                 ': OK');  // Created in other place
  except
    raise;
    Exit;
  end;
  sPathReadmeEditor:= sPath_Editor +
                      '\Readme.txt';
  
  AssignFile(tfTmp,
             sPathReadmeEditor);

  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            '''Editor.ini'' and ''Editor.kst'' files.'+ #13 +
            'Notice: the latest is always deleted when Tinn-R starts and recreated (storing the user preferences) when the application finishes.');

  CloseFile(tfTmp);
end;

procedure TfrmMain.pSetPathRTerm;
begin
  if bRArchitecture64 then sPath_Rterm:= sPath_R +
                                         '\bin\x64\Rterm.exe'
                      else sPath_Rterm:= sPath_R +
                                         '\bin\i386\Rterm.exe';
end;

procedure TfrmMain.pSetPathRgui;
begin
  if bRArchitecture64 then sPath_Rgui:= sPath_R +
                                        '\bin\x64\Rgui.exe'
                      else sPath_Rgui:= sPath_R +
                                        '\bin\i386\Rgui.exe';
end;

procedure TfrmMain.pSetRcard;
begin
  // Create items in lbRcard from strListRcardGroup create in uModDados
  with modDados do begin
    frmTools.lbRcard.Items:= slRcard_Groups;
    frmTools.lbRcard.Refresh;
    FreeAndNil(slRcard_Groups);
  end;

  // To prevent some problem
  if (iRcardFilter < 0) then iRcardFilter:= 0;
  frmTools.lbRcard.Selected[iRcardFilter]:= True;
  frmTools.lbRcardClick(Self);
end;

procedure TfrmMain.pSetCompletion;
begin
  // Create items in lbCompletion from strListCompletionGroups create in uModDados
  with modDados do begin
    frmTools.lbCompletion.Items:= slCompletion_Groups;
    frmTools.lbCompletion.Refresh;
    FreeAndNil(slCompletion_Groups);
  end;

  // To prevent some problem
  if (iCompletionFilter < 0) or
     (iCompletionFilter > frmTools.lbCompletion.Count - 1) then iCompletionFilter:= 0;
  frmTools.lbCompletion.Selected[iCompletionFilter]:= True;
  frmTools.lbCompletionClick(Self);
end;

procedure TfrmMain.pSetRmirrors;
begin
  // Create items in lbCountries from slRmirrors_Countries create in uModDados
  with modDados do begin
    frmTools.lbCountries.Items:= slRmirrors_Countries;
    frmTools.lbCountries.Refresh;
    FreeAndNil(slRmirrors_Countries);
  end;

  // To prevent some problem
  if (iCountriesFilter < 0) or
     (iCountriesFilter > frmTools.lbCountries.Count - 1) then iCountriesFilter:= 0;
  frmTools.lbCountries.Selected[iCountriesFilter]:= True;
  frmTools.lbCountriesClick(Self);
end;

procedure TfrmMain.pBuildMRU(var miItem: TMenuItem);
var
  i: integer;

  miMRU: TMenuItem;

  sFile: string;

begin
  pmenMainMRU.Items.Clear;
  miItem.Clear;
  if (slFileMRU.Count > 0) then begin
    for i:= 0 to (slFileMRU.Count -1)  do begin
      if (i < iLastFile) then begin
        sFile:= slFileMRU.Values[IntToStr(i)];
        if (sFile <> EmptyStr) then begin
          miMRU:= newItem(slFileMRU.Values[IntToStr(i)],
                          0,
                          False,
                          True,
                          RecentFileClick,
                          0,
                          format('File%d',
                                 [i]));
          miMRU.Tag:= i;
          miItem.Add(miMRU);
          miMRU:= newItem(slFileMRU.Values[IntToStr(i)],
                          0,
                          False,
                          True,
                          RecentFileClick,
                          0,
                          format('File%d',
                                 [i]));
          pmenMainMRU.Items.Add(miMRU);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.pUpdateMRU(var miItem: TMenuItem;
                                  sFileName: string);
var
  i,
   j: integer;

  slTmp: TStringList;

  sTmp: string;

begin
  slTmp:= TStringList.create;
  // Puts the opened file in at the top of the list
  sTmp:= StringReplace(sFileName,
                       '&',
                       '&&',
                       [rfReplaceAll]);
 
  if FileExists(sFileName) then begin
    slTmp.Insert(0,
                 '0=' + sTmp);
    j:= 1;
  end
  else j:= 0;
 
 // Stores Data and remove from menu
 for i:= 0 to (slFileMRU.Count - 1) do begin
   if (CompareText(sTmp,
                   slFileMRU.Values[IntToStr(i)]) <> 0) then begin
     slTmp.Add(IntToStr(j) +
               '=' +
               slFileMRU.Values[IntToStr(i)]);
     inc(j);
   end;
 end;
 
 slFileMRU.Text:= slTmp.Text;
 pBuildMRU(miItem);
 FreeAndNil(slTmp);
end;

procedure TfrmMain.RecentFileClick(Sender: TObject);
var
 sTmp: string;

begin
  sTmp:= StringReplace(TMenuItem(Sender).Caption,
                       '&',
                       EmptyStr,
                       []);
 
  sTmp:= StringReplace(sTmp,
                       '&&',
                       '&',
                       [rfReplaceAll]);
 
  if FileExists(sTmp) then pOpenFileIntoTinn(sTmp)
  else
    // Takes it off the File MRU list
    if (fMessageDlg(sTmp + #13 + #13 +
                    'File does not exist.' + #13 +
                    'Would you like to remove it from MRU (Most Recent Used) list?',
                    mtInformation,
                    [mbYes, mbNo],
                    0) = mrYes) then pUpdateMRU(menFileRecentFiles,
                                                sTmp);
end;

function TfrmMain.fFindWindowByName(sName: string): integer;
var
  i: integer;

  bFound: boolean;

  sCaption: string;

begin
  bFound:= False;
 
  for i:= (Self.MDIChildCount - 1) downto 0 do begin
    sCaption:= frmEditor.fScrubCaption(Self.MDIChildren[i].Caption);
    if (UpperCase(sCaption) = UpperCase(sName)) then begin
      bFound:= True;
      break;
    end;
  end;
 
  if bFound then Result:= i
            else Result:= -1;
end;

function TfrmMain.fFindTopWindow: integer;
var
  i: integer;
  
begin
  Result:= -1;

  for i:= (Self.MDIChildCount-1) downto 0 do
    if (Self.MDIChildren[i].Active = True) then begin
      Result:= i;
      Break;
    end
end;

procedure TfrmMain.actRguiReturnFocusExecute(Sender: TObject);
begin
  if not actRguiReturnFocus.Checked then begin
    bRguiReturnFocus          := True;
    actRguiReturnFocus.Checked:= True;
  end
  else begin
    bRguiReturnFocus          := False;
    actRguiReturnFocus.Checked:= False;
  end;
end;

procedure TfrmMain.actRAssignmentLeftExecute(Sender: TObject);
var
  seTmp: TSynEdit;

begin
  seTmp:= nil;

  case iSynWithFocus of
    0: Exit;
    1: seTmp:= (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor;
    2: seTmp:= (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2;
    3: seTmp:= frmRterm.synIO;
    4: with frmRterm do
         if Assigned(synLog2) then seTmp:= synLog2
                              else seTmp:= synLog;
  end;

  with seTmp do
    SelText:= ' <- ';
end;

procedure TfrmMain.actRAssignmentRightExecute(Sender: TObject);
var
  seTmp: TSynEdit;

begin
  seTmp:= nil;

  case iSynWithFocus of
    0: Exit;
    1: seTmp:= (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor;
    2: seTmp:= (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2;
    3: seTmp:= frmRterm.synIO;
    4: with frmRterm do
         if Assigned(synLog2) then seTmp:= synLog2
                              else seTmp:= synLog;
  end;

  with seTmp do
    SelText:= ' -> ';
end;

procedure TfrmMain.actRmirrorsCopyHostExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdRmirrorsHost.Text;
end;

procedure TfrmMain.actRmirrorsCopyURLExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdRmirrorsURL.Text;
end;

procedure TfrmMain.actRmirrorsEditExecute(Sender: TObject);
begin
  sRmirrorsBookMark:= modDados.cdRmirrors.Bookmark;
  menToolsDatabaseMirrorsRClick(nil);
  pSetFocus_Main;
end;

procedure TfrmMain.actRmirrorsHelpExecute(Sender: TObject);
begin
  pOpenUserGuidePDF('"Mirrors (R)"');
end;

procedure TfrmMain.actRmirrorsOpenURLDefaultExecute(Sender: TObject);
begin
  pOpen_Url(frmTools.stbRMirrors.Panels[1].Text);
end;

procedure TfrmMain.actRmirrorsOpenURLCurrentExecute(Sender: TObject);
begin
  pOpen_Url(frmTools.dbeRmirrorsURL.Text);
end;

procedure TfrmMain.actRmirrorsSetReposExecute(Sender: TObject);
var
  sTmp: string;
  
begin
  sRmirror:= modDados.cdRmirrorsURL.Text;

  sTmp:= 'options(''repos''=' +
                  '''' +
                  sRmirror +
                  '''' +
                  ')';

  pDoSend(sTmp);

  frmTools.stbRMirrors.Panels[1].Text:= sRmirror;
end;

procedure TfrmMain.pRmirrorsInterface_Update;
begin
  // TfrmRmirrors.FormActivate
  with ModDados do begin
    cdRmirrors.Filtered:= False;

    frmTools.lbCountries.Selected[iCountriesFilter]:= False;

    cdRmirrors.Bookmark:= sRmirrorsBookMark;
  end;

  // TfrmRmirrors.FormCloseQuery
  with modDados.cdRmirrors do begin
    IndexDefs.Clear;

    with IndexDefs.AddIndexDef do
    begin
      Name   := 'RmirrorsDefaultIndex';
      Fields := 'Country;Name;URL';
      Options:= [ixPrimary, ixUnique];
    end;

    IndexName:= 'RmirrorsDefaultIndex';
  end;

  // TfrmRmirrors.ActualizeCountries
  with modDados do begin
    pRmirrorsCountriesFilter(nil);

    frmTools.lbCountries.Items:= slRmirrors_Countries;
    frmTools.lbCountries.Refresh;

    FreeAndNil(slRmirrors_Countries);
  end;

  // TfrmRmirrors.FormClose
  with frmTools do begin
    lbCountries.ItemIndex:= iCountriesFilter;
    lbCountriesClick(Self);
  end;

  with stbMain do begin
    Panels[8].Text:= 'Done!';
    Panels[9].Text:= 'The file ' +
                     '''mirrors.xml'' ' +
                     'was updated in ' +
                     sPath_Data;
  end;
end;

procedure TfrmMain.actRmirrorsUpdateExecute(Sender: TObject);
var
  i: integer;

  sPath,
   sTmp: string;

begin
  if fRterm_Running and
     (not frmRTerm.cRterm.bRterm_Ready) then Exit
                                        else Sleep(10*iDelay);

  sPath:= sUtilsOrigin +
          '\mirrors.R';

  sTmp:= 'source('''+
          sPath +
          ''')';

  sTmp:= DosPathToUnixPath(sTmp);
  pDoSend(sTmp);

  sPath:= sPath_Tmp +
          '\mirrors.txt';

  i:= 1;
  repeat
    Sleep(iDelay);
    if FileExists(sPath) then Break
                         else inc(i);
  until (i = 20);

  if (FileExists(sPath)) then
    with modDados do
      if (not fRmirrors_Update(sPath)) then begin
        fMessageDlg('Sorry, it was not possible to update the dataset from CRAN mirrors!',
                    mtWarning,
                    [mbOk],
                    0);
        Exit;
      end;

  pRmirrorsInterface_Update;
end;

procedure TfrmMain.actDataRmirrorsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsRmirrors do begin
    TabVisible:= not TabVisible;
    actDataRmirrorsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.pOnTop(hHandle: HWND);
var
  hOption: HWnd;

begin
  if bOnTop then hOption:= HWND_TOPMOST
            else hOption:= HWND_NOTOPMOST;
 
  SetWindowPos(hHandle,
               hOption,
               0,
               0,
               0,
               0,
               SWP_NOACTIVATE or
               SWP_NOMOVE or
               SWP_NOSIZE or
               SWP_NOSENDCHANGING);
end;

procedure TfrmMain.actOnTopExecute(Sender: TObject);
begin
  if not actOnTop.Checked then begin
    bOnTop:= True;
    pOnTop(Application.Handle);
    actOnTop.Checked:= bOnTop;
  end
  else begin
    bOnTop:= False;
    pOnTop(Application.Handle);
    actOnTop.Checked:= bOnTop;
  end;
end;

procedure TfrmMain.pUpdateCursorPos(Sender: TSynEdit);
var
  bcCol: TDisplayCoord;

  bcLin: TBufferCoord;

  iLineCount: Integer;

begin
  bcLin     := Sender.CaretXY;
  bcCol     := Sender.DisplayXY;
  iLineCount:= Sender.Lines.Count;
  if (iLineCount = 0) then iLineCount:= 1;
  stbMain.Panels[2].Text:= Format('L: (%d/%d) - C: %d',
                                  [bcLin.Line,
                                   iLineCount,
                                   bcCol.Column]);
end;

procedure TfrmMain.pSetSyntaxMenuItem(sSynName: string);
var
  i: integer;

  sTmp: string;

begin
  for i:= 0 to (menOptionSyntaxSet.Count - 1) do begin
    sTmp:= StringReplace(menOptionSyntaxSet.Items[i].Caption,
                         '&',
                         EmptyStr,
                         []);
    menOptionSyntaxSet.Items[i].Checked:= (sTmp = sSynName);
    menOptionSyntaxSet.Items[i].Default:= menOptionSyntaxSet.Items[i].Checked;
  end;
end;

procedure TfrmMain.pSetSyntaxComboBox(sSynName: string);
var
  i: integer;

begin
  for i:= 0 to (cbSyntax.Items.Count - 1) do
    if cbSyntax.Items[i] = sSynName then begin
      cbSyntax.ItemIndex:= i;
      iFilterToSaveAs   := i + 1;  // Because general (All *.*)
      Break;
    end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject;
                                      var bCanClose: Boolean);
begin
  bRtermOptionCancel:= False;

  if fRterm_Running then actRContTermStartCloseExecute(nil);
  bCanClose:= not bRtermOptionCancel;  // If the choice is 'Cancel' don't close

  if bCanClose then begin
    pCheckIfProjectWasChanged;
    Application.ProcessMessages;

    if not bUpdating then
      pDelete_Dir(sPath_Tmp);      // The dowloaded setup of the new version was stored in this folder

    if not bRestored then begin  // If it was made a restore will not save to ini!
      pWriteIniFile_Application(False);

      pWriteIniFile_Editor(False);

      // Save layout
      JvAppIniFileStorage.BeginUpdate;
      try
        SaveDockTreeToAppStorage(JvAppIniFileStorage);
      finally
        JvAppIniFileStorage.EndUpdate;
      end;
    end;

    FreeAndNil(slProject);
    slProjectChanges.Free;

    if Assigned(frmTools) then
      with frmTools do begin
        Close;
        FreeAndNil(frmTools);
      end;

    if Assigned(frmRterm) then
      with frmRterm do begin
        Close;
        FreeAndNil(frmRterm);
      end;

    if Assigned(frmDiffMain) then begin
      with frmDiffMain do begin
        Close;
        FreeAndNil(frmDiffMain);
      end;
    end;

    if Assigned(frmAsciiChart) then begin
      with frmDiffMain do begin
        Close;
        FreeAndNil(frmDiffMain);
      end;
    end;

    // seTmp created in actRSendSmartExecute
    if Assigned(seTmp) then FreeAndNil(seTmp);

    // Save custom colors
    if FileExists(sPathColor_Custom) then
      cdMain.CustomColors.SaveToFile(sPathColor_Custom);

    // Destroy StringList
    FreeAndNil(slFilters);
    FreeAndNil(slRLibPaths);

    // Destroy Stream
    FreeAndNil(msHexViewer);

    // Destriy TStrings
    FreeAndNil(slFileNotify);

    // Terminate
    Application.Terminate;
  end;
end;

procedure TfrmMain.pDraw_RtermSend_Plus;
var
  i,
   iLeft: integer;

begin
  with stbMain do begin
    iLeft:= Panels[0].Width +
            Panels[1].Width +
            Panels[2].Width +
            Panels[3].Width +
            Panels[4].Width +
            Panels[5].Width +
            Panels[6].Width;

    i:= Panels[7].Width;
  end;

  with stbMain.Canvas do begin
    Pen.Color:= Color;
    Brush.Color:= Color;
    Rectangle(iLeft,
              1,
              iLeft + i,
              Height);
  end;

  imlRSend_Plus.Draw(stbMain.Canvas,
                     iLeft + 2,
                     2,
                     ord(bRtermSend_Plus));
end;

procedure TfrmMain.pDrawSelectionMode(iSelMode: integer);
var
  i,
   iLeft: integer;

begin
  with stbMain do begin
    iLeft:= Panels[0].Width +
            Panels[1].Width +
            Panels[2].Width +
            Panels[3].Width;

    i:= Panels[4].Width;
  end;

  with stbMain.Canvas do begin
    Pen.Color:= Color;
    Brush.Color:= Color;
    Rectangle(iLeft,
              1,
              iLeft + i,
              Height);
  end;

  imlStatusBar.Draw(stbMain.Canvas,
                    iLeft + 2,
                    2,
                    iSelMode);
end;

procedure TfrmMain.pgFilesChange(Sender: TObject);
var
  i: integer;

  sTmp,
   sNodeToSelect,
   sPageSelected: string;

begin
  sPageSelected:= pgFiles.ActivePage.Hint;

  with frmTools.tvProject do begin
    for i:= 1 to (Items.Count -1) do begin
      if Items[i].Level = 2 then begin
        sNodeToSelect:= trim(PChar(Items[i].Data));
        if (sNodeToSelect = sPageSelected) then Items[i].ImageIndex:= 4
                                           else Items[i].ImageIndex:= 2;
      end;
    end;
  end;

  with stbMain do begin
    Panels[8].Text:= EmptyStr;
    Panels[9].Text:= EmptyStr;
  end;

  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  sTmp:= pgFiles.ActivePage.Hint;
  i:= fFindWindowByName(sTmp);

  if (i > -1) then begin
    if Self.MDIChildren[i].WindowState = wsMinimized then Self.MDIChildren[i].WindowState:= wsNormal
    else begin
      // Check if the active form (position 0) is maximized
      if  Self.MDIChildren[0].WindowState = wsMaximized then begin
        // Size new window to fit mainform
        Self.MDIChildren[i].Width := Width;
        Self.MDIChildren[i].Height:= Height;
      end;
      Self.MDIChildren[i].BringToFront;
    end;

    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
      case synEDitor.SelectionMode of
        smNormal: pDrawSelectionMode(0);
        smLine  : pDrawSelectionMode(1);
        smColumn: pDrawSelectionMode(2);
        {smNormal: stbMain.Panels[4].Text:= 'Normal';
        smLine  : stbMain.Panels[4].Text:= 'Line';
        smColumn: stbMain.Panels[4].Text:= 'Column';}
      end;
    end;
  end;

  i:= fFindTopWindow;
  synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;

  pSetDataCompletion(synEditorTip,
                     (Self.MDIChildren[i] as TfrmEditor).synEditor,
                     'CTRL+SPACE');

  pSetDataCompletion(synEditor2Tip,
                     (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                     'CTRL+SPACE');

  pUpdateHexViewer;
end;

procedure TfrmMain.actPrintExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    if (sActiveEditor = 'synEditor2') then
      if (synEditor2.SelText <> EmptyStr) then bSelectedToPreview:= True
                                          else bSelectedToPreview:= False
    else if (sActiveEditor = 'synEditor') then
      if (synEditor.SelText <> EmptyStr) then bSelectedToPreview:= True
                                         else bSelectedToPreview:= False;
  end;
 
  frmConfigurePrint:= TfrmConfigurePrint.Create(Self);
 
  with frmConfigurePrint do begin
    try
      if (pgFiles.PageCount <> 0) then begin
        with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
          if (sActiveEditor = 'synEditor')       then ShowDialog(synEditor)
          else if (sActiveEditor = 'synEditor2') then ShowDialog(synEditor2);
        end;
      end;
    finally
      FreeAndNil(frmConfigurePrint);
      frmMain.Repaint;
      pSetFocus_Main;
    end;
  end;
end;

procedure TfrmMain.actFilesTabsTopExecute(Sender: TObject);
begin
  with pgFiles do begin
    Align       := alTop;
    TabsPosition:= fsdTop;
  end;
  actFilesTabsTop.Checked:= True;
  //if (Self.MDIChildCount > 0) then pUdatePgFiles;
end;

procedure TfrmMain.actFilesTabsBottomExecute(Sender: TObject);
begin
  with pgFiles do begin
    Align       := alBottom;
    TabsPosition:= fsdBottom;
  end;
  actFilesTabsBottom.Checked:= True;
  //if (Self.MDIChildCount > 0) then pUdatePgFiles;
end;

procedure TfrmMain.actGutterVisibleExecute(Sender: TObject);
var
  i,
   j: integer;

begin
  actGutterVisible.Checked:= not(actGutterVisible.Checked);
  coEditor.Gutter.Visible := actGutterVisible.Checked;

  // Update all open files
  if (Self.MDIChildCount > 0) then
    for i:= (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do begin
        j:= synEditor.Font.Size;  // The font size can be changed (temporarily) by user!
        coEditor.AssignTo(synEditor);
        synEditor.Font.Size:= j;

        if Assigned(synEditor2) then begin
          j:= synEditor2.Font.Size;
          coEditor.AssignTo(synEditor2);
          synEditor2.Font.Size:= j;
        end
      end;

  // Update Rterm
  pUpdateRterm_Appearance(False);
end;

procedure TfrmMain.actLineNumbersVisibleExecute(Sender: TObject);
var
  i,
   j: integer;

begin
  actLineNumbersVisible.Checked  := not(actLineNumbersVisible.Checked);
  coEditor.Gutter.ShowLineNumbers:= actLineNumbersVisible.Checked;

  // Update all open files
  if (Self.MDIChildCount > 0) then
    for i:= (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do begin
        j:= synEditor.Font.Size;  // The font size can be changed (temporarily) by user!
        coEditor.AssignTo(synEditor);
        synEditor.Font.Size:= j;

        if Assigned(synEditor2) then begin
          j:= synEditor2.Font.Size;
          coEditor.AssignTo(synEditor2);
          synEditor2.Font.Size:= j;
        end
      end;
end;

procedure TfrmMain.actOpenCurrentFileExecute(Sender: TObject);
var
  sFile: string;

  i: integer;

begin
  i:= fFindTopWindow;

  if not Assigned(Self.MDIChildren[i] as TfrmEditor) then Exit;
  sFile:= (Self.MDIChildren[i] as TfrmEditor).sActiveFile;

  try
    ShellExecute(0,
                 'open',
                 Pchar(sFile),
                 nil,
                 nil,
                 sw_shownormal);
  except
    fMessageDlg('The viewer is not accessible!',
                mtInformation,
                [mbOk],
                0);
  end;
end;

procedure TfrmMain.actOpenMaximizedExecute(Sender: TObject);
begin
  actOpenMaximized.Checked:= not(actOpenMaximized.Checked);
end;

procedure TfrmMain.actFileSaveAllExecute(Sender: TObject);
var
  i,
   iChildID,
   iActivePage: integer;

  sTmp: string;

begin
  if (pgFiles.PageCount > 0) then begin
    // Get the starting window ID
    iActivePage:= pgFiles.ActivePageIndex;

    // Loop through all windows and save files
    for i:= 0 to (pgFiles.PageCount - 1) do begin
      pgFiles.ActivePageIndex:= i;
      sTmp    := pgFiles.ActivePage.Hint;
      iChildID:= fFindWindowByName(sTmp);
      MDIChildren[iChildID].BringToFront;
      Application.ProcessMessages;
      iChildID:= fFindWindowByName(sTmp);
      with (Self.MDIChildren[iChildID] as tfrmEditor) do
        if synEditor.Modified then
      	  actFileSaveExecute(Sender);
    end;

    // Bring back the starting window
    pgFiles.ActivePageIndex:= iActivePage;
    sTmp    := pgFiles.ActivePage.Hint;
    iChildID:= fFindWindowByName(sTmp);
    MDIChildren[iChildID].BringToFront;
  end;
  actFileSaveAll.Enabled:= False;

  pUpdateHexViewer;
end;

procedure TfrmMain.tbFilterClick(Sender: TObject);
var
  i,
   iStartFile,
    iNewFile  : integer;

  rsGrep: TRegExpr;

  slTmp: TStringList;

  sTmp: string;

begin
  if (pgFiles.PageCount = 0) then begin
    fMessageDlg('No archive is opened!',
                mtInformation,
                [mbOk],
                0);
    edFilter.Text:= EmptyStr;
    Exit;
  end;

  if (edFilter.TexT = EmptyStr) then begin
    fMessageDlg('You need to define a RegEx filter before running it!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;

  // Grep and filter
  rsGrep:= TRegExpr.Create;
  slTmp := TStringList.Create;
  try
    // For every line in the current on top window that matches, put it into another editor window
    iStartFile:= fFindTopWindow;
    slTmp.Text:= (Self.MDIChildren[iStartFile] as tfrmEditor).synEditor.Lines.text;
    // Create new tab and window
    actFileNewExecute(Sender);
    iNewFile         := fFindTopWindow;
    rsGrep.Expression:= edFilter.Text;
 
    for i:= 0 to (slTmp.Count - 1) do begin
      // Look at each line and if it matches, add it to the new child
      sTmp:= slTmp.Strings[i];
      if rsGrep.Exec(sTmp) then
        (Self.MDIChildren[iNewFile] as tfrmEditor).synEditor.Lines.Add(sTmp);
    end;

    with ((Self.MDIChildren[iNewFile] as tfrmEditor).synEditor.Lines) do
      if (Count = 0) then Add('No matches found.');
  finally
    FreeAndNil(rsGrep);
    FreeAndNil(slTmp);
  end;
end;

procedure TfrmMain.tbiPandocClick(Sender: TObject);
begin
  menToolsConversionPandocClick(nil);
end;

procedure TfrmMain.actColorsPreferenceExecute(Sender: TObject);
var
  dlg: TfrmColors;

  clBrackets_Prior: TColor;


  i: integer;

  sSyntaxBackupFile: string;

begin
  clBrackets_Prior:= clBrackets;

  try
    dlg:= TfrmColors.Create(Self);
    if (dlg.ShowModal = mrOK) then begin  // OK
      with dlg do begin
        clActiveLine          := shActiveLine.Brush.Color;
        clBrackets            := shBrackets.Brush.Color;
        clBGForAllHighlighters:= shBGAllHighlighters.Brush.Color;
        clBGPreferred         := shBGPreferred.Brush.Color;
        bActiveLine           := cbActiveLineBG.Checked;
      end;
    end
    else begin  // Cancel: will restore a prior backup o all ini syntax files
      sSyntaxBackupFile:= sPath_SyntaxBKP +
                          '\syntax_bkp.zip';

      try
        pDelete_Dir(sPath_Syntax);
        zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

        with zipKit do begin
          FileName     := sSyntaxBackupFile;
          BaseDirectory:= ExtractFileDrive(sPath_Ini) +
                                           '\';
          ExtractFiles('*.*');
        end;

        zipKit.CloseArchive;
        if FileExists(sSyntaxBackupFile) then DeleteFile(sSyntaxBackupFile);
      except
        // TODO
      end;
      clBrackets:= clBrackets_Prior;
      dmSyn.pLoadSyntaxFromIni;
    end;
  finally
    synURIOpener.Editor:= nil;  // Don't remove from here!
    FreeAndNil(dlg);
  end;

  for i:= (Self.MDIChildCount - 1) downto 0 do begin
    with (Self.MDIChildren[i] as TfrmEditor).synEditor do begin
      if bActiveLine then ActiveLineColor:= TColor(clActiveLine)
                     else ActiveLineColor:= TColor(clNone);
      WordWrap:= actEditorLineWrap.Checked;
    end;
    (Self.MDIChildren[i] as TfrmEditor).Repaint;
  end;

  // It is necessary to update pSynPaintTransient in cases where the brackets are selected!
  i:= fFindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    with (Self.MDIChildren[i] as TfrmEditor) do begin
      if Assigned(synEditor) then synEditor.Repaint;
      if Assigned(synEditor2) then synEditor2.Repaint;
    end;

  pUpdateAppearance(False);
  pSetFocus_Main;
end;

procedure TfrmMain.actStatusBarVisibleExecute(Sender: TObject);
begin
  stbMain.Visible            := not(stbMain.Visible);
  actStatusBarVisible.Checked:= stbMain.Visible;
  //iConsoleHeight:= frmConsole.pgConsole.Height;
end;

procedure TfrmMain.actSpecialCharVisibleExecute(Sender: TObject);
var
  i,
   j: integer;

begin
  actSpecialCharVisible.Checked:= not(actSpecialCharVisible.Checked);

  if actSpecialCharVisible.Checked then coEditor.Options:= coEditor.Options +
                                                           [eoShowSpecialChars]
                                   else coEditor.Options:= coEditor.Options -
                                                           [eoShowSpecialChars];

  // Update all open files
  if (Self.MDIChildCount > 0) then
    for i:= (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do begin
        j:= synEditor.Font.Size;  // The font size can be changed (temporarily) by user!
        coEditor.AssignTo(synEditor);
        synEditor.Font.Size:= j;

        if Assigned(synEditor2) then begin
          j:= synEditor2.Font.Size;
          coEditor.AssignTo(synEditor2);
          synEditor2.Font.Size:= j;
        end;
      end;
end;

procedure TfrmMain.pSetTabTitle(sStat: string);
begin
  if (pgFiles.PageCount > 0) then begin
    if (not actReadOnly.Checked) then pgFiles.ActivePage.Caption:= fStrip_Path(pgFiles.ActivePage.Hint) +
                                                                   sStat
                                 else pgFiles.ActivePage.Caption:= '<' +
                                                                   fStrip_Path(pgFiles.ActivePage.Hint) +
                                                                   sStat +
                                                                   '>'
  end;
end;

procedure TfrmMain.actPgFilesVisibleExecute(Sender: TObject);
begin
  pgFiles.Visible          := not pgFiles.Visible;
  actPgFilesVisible.Checked:= pgFiles.Visible;
end;

procedure TfrmMain.pRemoveTab(sTabCaption: string);
var
  j,
   i: integer;

begin
  j:= 0;
  while (j <= pgFiles.PageCount -1) do begin
    if (pgFiles.Pages[j].Hint = sTabCaption) then pgFiles.Pages[j].Free;
    inc(j);
  end;
  for i:= (Self.MDIChildCount - 1) downto 0 do
    (Self.MDIChildren[i] as TfrmEditor).Repaint;
end;

procedure TfrmMain.actOpenMRUExecute(Sender: TObject);
var
  i: integer;

  slTmp: TStringList;

begin
  // Open all files in File MRU
  slTmp:= TStringList.Create;
 
  for i:= 0 to (menFileRecentFiles.Count - 1) do
    slTmp.Add(menFileRecentFiles.Items[i].Caption);
 
  for i:= 0 to (slTmp.Count - 1) do begin
    if FileExists(slTmp.Strings[i]) then pOpenFileIntoTinn(slTmp.Strings[i])
    else begin
      // Take it off the File MRU list
      if (fMessageDlg(slTmp.Strings[i] + #13 + #13 +
                      'File does not exist.' + #13 +
                      'Would you like to remove it from MRU (Most Recent Used) list?',
                      mtInformation,
                      [mbYes, mbNo],
                      0) = mrYes) then
        pUpdateMRU(menFileRecentFiles,
                   slTmp.Strings[i]);
    end;
  end;
 
  FreeAndNil(slTmp);
end;

procedure TfrmMain.actProjectOpenNodeExecute(Sender: TObject);
begin
  with frmTools do
    pDoProjectOpenNode;
end;

procedure TfrmMain.pSearchInOpenFiles(var iFileCount,
                                          iMatchCount: integer);
var
  bFileFind: boolean;

  i,
   j: integer;

  sLine,
   sFileName: string;

  tnSearch,
   tnFile,
   tnOccurence: TTreeNode;

begin
  tnFile:= nil;

  with frmTools.tvSearch do begin
    Items.BeginUpdate;
    tnSearch:= Items.Add(nil,
                         'Opened files');
    tnSearch.ImageIndex   := 0;
    tnSearch.SelectedIndex:= 0;
  end;

  for i:= (Self.MDIChildCount - 1) downto 0 do begin
    with (Self.MDIChildren[i] as TfrmEditor) do begin
      bFileFind:= False;
      sFileName:= frmEditor.fScrubCaption((Self.MDIChildren[i] as TfrmEditor).Caption);
 
      with stbMain do begin
        Panels[8].Text:= 'Search in file(s)';
        if (length(sFileName) > 100) then Panels[9].Text:= ExtractFileDrive(sFileName) +
                                                           '\...\' +
                                                           ExtractFileName(sFileName)
                                     else Panels[9].Text:= sFileName;
        Refresh;
      end;
      for j:= 0 to (synEditor.Lines.Count - 1) do begin
        sLine:= trim(synEditor.Lines.Strings[j]);
          if rsSearch.Exec(sLine) then begin
            if not bFileFind then begin
              with frmTools.tvSearch do begin
                tnFile:= Items.AddChild(tnSearch,
                                        sFileName);
                tnFile.ImageIndex   := 2;
                tnFile.SelectedIndex:= 2;
              end;
            end;

            bFileFind:= True;
            inc(iMatchCount);

            with frmTools.tvSearch do begin
              tnOccurence:= Items.AddChild(tnFile,
                                           '(' +
                                           IntToStr(j+1) +
                                           '): ' +
                                           sLine);
              tnOccurence.ImageIndex   := 3;
              tnOccurence.SelectedIndex:= 3;
            end;
          end; // if regex match
      end; // end line loop for j:= 0
    end;  // with (Self.MDIChildren[i]
    if bFileFind then inc(iFileCount);
  end; // for i:= (Self.MDIChildCount - 1)

  with frmTools.tvSearch do
    Items.EndUpdate;

  with stbMain do begin
    Panels[8].Text:= EmptyStr;
    Panels[9].Text:= EmptyStr;
    Refresh;
  end;

  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

end;

procedure TfrmMain.pClearMRU;
begin
  slFileMRU.Clear;
  pmenMainMRU.Items.Clear;
  while (menFileRecentFiles.Count > 0) do
    menFileRecentFiles.Delete(0);
end;

procedure TfrmMain.pMinimizeTinnAfterLastFile;
begin
  if bMinimizeTinnAfterLastFile then Application.Minimize;
end;

procedure TfrmMain.pSearchInDirectories(const sDir,
                                                  sMask: string;
                                            var iFileCount,
                                                iMatchCount,
                                                iTotFileCount: integer);
var
  bFileFind: boolean;

  i,
   j,
   iPosSlash,
   iDirLen,
   iLinePos: integer;

  seTmp: TSynEdit;

  slFile: TStringList;

  sPath,
   lastChar,
   tmpLine: string;

  tnSearch,
   tnFile,
   tnOccurence: TTreeNode;

begin
  tnFile:= nil;
  with frmTools.tvSearch do begin
    if (Items.Count > 0) and
       not bSearchOpenFiles then begin
      Items.Clear;
      frmTools.tvSearch.Refresh;
    end;
    tnSearch:= Items.Add(nil,
                         'Directories');
    tnSearch.ImageIndex   := 1;
    tnSearch.SelectedIndex:= 1;
  end;

  try
    slFile:= TStringList.Create;
    seTmp := TSynEdit.Create(Self);
    try
      // Make sure the file path has a '\' at the end
      iDirLen  := length(sDir);
      lastChar := Copy(sDir,
                       iDirLen,
                       1);

      iPosSlash:= Pos('\',
                      lastChar);

      if (iPosSlash = 0) then sPath:= sDir +
                                      '\'
                         else sPath:= sDir;

      // Get a file list
      pTraverseDir(sPath,
                   slFile,
                   sMask);

      for i:= 0 to (slFile.Count - 1) do begin
        with stbMain do begin
          Panels[8].Text:= 'Search in directory(ies)';
          if (length(slFile[i]) > 100) then Panels[9].Text:= ExtractFileDrive(slFile[i]) +
                                                             '\...\' +
                                                             ExtractFileName(slFile[i])
                                       else Panels[9].Text:= slFile[i];
          Refresh;
        end;
        bFileFind:= False;

        j:= 0;
        seTmp.Lines.LoadFromFile(slFile.Strings[i]);
        for iLinePos:= 0 to (seTmp.Lines.Count - 1) do begin
          tmpLine:= seTmp.Lines.Strings[iLinePos];
          if rsSearch.Exec(tmpLine) then begin
            tmpLine:= trim(tmpLine);
            if not bFileFind then begin
              with frmTools.tvSearch do begin
                tnFile:= Items.AddChild(tnSearch,
                                        slFile.Strings[i]);
                tnFile.ImageIndex   := 2;
                tnFile.SelectedIndex:= 2;
              end;
            end;
            bFileFind:= True;
            inc(iMatchCount);
            with frmTools.tvSearch do begin
              tnOccurence:= Items.AddChild(tnFile,
                                           '(' +
                                           IntToStr(j+1) +
                                           '): ' +
                                           tmpLine);
              tnOccurence.ImageIndex   := 3;
              tnOccurence.SelectedIndex:= 3;
            end;
          end; // if regex match
          inc(j);
        end;
        if bFileFind then inc(iFileCount);
      end;
        iTotFileCount:= slFile.Count;
    except
      on e: exception do
        //tsResultList.Add(e.Message);
    end;
  finally
    with stbMain do begin
      Panels[8].Text:= EmptyStr;
      Panels[9].Text:= EmptyStr;
      Refresh;
    end;

    with actRtermWarningError do begin
      Visible:= False;
      Checked:= False;
    end;

    FreeAndNil(slFile);
    FreeAndNil(seTmp);
  end;

  with frmTools.tvSearch do
    Items.EndUpdate;
end;

procedure TfrmMain.menToolsUtilsStringReplaceClick(Sender: TObject);
var
  i: integer;

  seEditor,
   seTmp: TSynEdit;

begin
  i:= fFindTopWindow;
  if not Assigned(Self.MDIChildren[i] as TfrmEditor) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  seTmp := TSynEdit.Create(Self);
  seTmp.Parent:= panInvisibleParent;

  seTmp.Lines:= seEditor.Lines;

  i:= 0;
  with seTmp do begin
    BeginUpdate;

    repeat
      Lines.Strings[i]:= StringReplace(Lines.Strings[i],
                                       '//',
                                       '',
                                       []);
      inc(i)
    until (i = Lines.Count);

    EndUpdate;
  end;

  seEditor.SelectAll;
  seTmp.SelectAll;

  fSave_PriorClipboard_Text;
  seTmp.CutToClipboard;
  seEditor.PasteFromClipboard;
  pRestore_PriorClipboard_Text;

  FreeAndNil(seTmp);
end;

function TfrmMain.fStripRegExPower(sSearchText: string): string;
begin
  sSearchText:= StringReplace(sSearchText, '*', '\*', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '\', '\\', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '[', '\[', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '(', '\(', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '+', '\+', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '?', '\?', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '^', '\^', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '$', '\$', [rfReplaceAll]);
  sSearchText:= StringReplace(sSearchText, '.', '\.', [rfReplaceAll]);
  Result:= sSearchText;
end;

procedure TfrmMain.pSetupSearchParameters(sSearchText: string);
begin
  if rsSearch = nil then rsSearch:= TRegExpr.Create;
  if (length(trim(sSearchText)) = 0) then sSearchText:= ' ';
  if not bSearchRegExp then sSearchText:= fStripRegExPower(sSearchText);
  if bSearchWholeWords then sSearchText:= sSearchText +
                                          '\W';
  rsSearch.ModifierI := not bSearchCaseSensitive;
  rsSearch.Expression:= sSearchText;
end;

procedure TfrmMain.pTraverseDir(sPath: string;
                                    var tsFileList: TStringList;
                                    sMask: string);
var
  curFile: WIN32_FIND_DATA;

  hHandle: THandle;

  i,
   iDirFound: integer;

  slPath: TStringList;

  srDir: TSearchRec;

  sTmp: string;

begin
  // Get the files for the current directory
  hHandle:= FindFirstFile(PChar(sPath +
                                sMask),
                          curFile);
  if FileExists(sPath +
                curFile.cFilename) then tsFileList.Add(sPath +
                                                       curFile.cFilename);

  while FindNextFile(hHandle,
                     curFile) do

    if FileExists(sPath +
                  curFile.cFilename) then tsFileList.Add(sPath +
                                                         curFile.cFilename);

  if bSearchInSub then begin
    // Ok to search sub directories
    slPath:= TStringList.Create;
    try
      // Get the list of sub directories
      iDirFound:= FindFirst(sPath +
                            '*.*',
                            faDirectory,
                            srDir);

      while (iDirFound = 0) do begin
        if (srDir.Attr and faDirectory > 0) and
           (srDir.Name[1] <> '.') then slPath.Add(srDir.Name);
        iDirFound:= FindNext(srDir);
      end;

      for i:= 0 to (slPath.Count - 1) do begin
        // Traverse the directories
        sTmp:= sPath +
               slPath.Strings[i] +
               '\';
        pTraverseDir(sTmp,
                     tsFileList,
                     sMask);
      end;
    finally
      FreeAndNil(slPath);
    end;
  end;
end;

procedure TfrmMain.synMRStateChange(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (synMR.State = msRecording) then alMain.OnExecute:= pRecordActions
    else if Assigned(alMain.OnExecute) then alMain.OnExecute:= nil;
end;

procedure TfrmMain.pRecordActions(baAction: TBasicAction;
                                      var bHandled: Boolean);
var
  aEvent: TActionMacroEvent;

begin
  try
  if not bInExecute and
     (baAction <> actMacroRecord) and
     (baAction <> actMacroPlay) then

    with synMR do begin
      aEvent:= TActionMacroEvent.Create;
      aEvent.ActionName:= baAction.Name;

      with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
        aEvent.ActionLists.Add(alMain);
      AddCustomEvent(TSynMacroEvent(aEvent));
      bInExecute:= True;
      try
        baAction.Execute;
        bHandled:= True;
      finally
        bInExecute:= False;
      end;
    end;
  except
    on e: exception do
      fMessageDlg(e.message,
                  mtError,
                  [mbOk],
                  0);
  end;
end;

procedure TfrmMain.tbReloadClick(Sender: TObject);
begin
  actReloadExecute(nil);
end;

procedure TfrmMain.panProjectDockSiteDockDrop(Sender: TObject;
                                                  Source: TDragDockObject;
                                                  X,
                                                  Y: Integer);
begin
  panProjectDockSite.Constraints.MinWidth:= 20;
  panProjectDockSite.Width               := 150;
  //splTools.Visible                       := True;
end;

procedure TfrmMain.actProjectNewExecute(Sender: TObject);
var
  sFileExt: string;

begin
  // New Project
  pCheckIfProjectWasChanged;
  Application.ProcessMessages;

  with sdMain do begin
    InitialDir:= sWorkingDir;
    Filter    := 'Tinn-R project space (*.tps)|*.tps';
    DefaultExt:= '*.tps';
    if Execute then begin
      sProjectName:= sdMain.FileName;
      sFileExt    := lowerCase(ExtractFileExt(sProjectName));  // John Fox suggestion

      if not (sFileExt = '.tps') then sProjectName:= FileName +
                                                     '.tps';

      if FileExists(sProjectName) then
        if (fMessageDlg(sProjectName + #13 + #13 +
                        'Do you want to overwrite this file?',
                        mtConfirmation,
                        [mbYes, mbCancel],
                        0) <> idYes) then Exit;

      pCreateProject;
      pSaveProject;
      pUpdateProjectMRU(menProjRecent,
                        sProjectName);
      pToolsProjectControls(True);
    end;
    sdMain.Filter:= slFilters.Text;
  end;
end;

procedure TfrmMain.panProjectDockSiteUnDock(Sender: TObject;
                                                Client: TControl;
                                                NewTarget: TWinControl;
                                                var Allow: Boolean);
begin
  panProjectDockSite.Constraints.MinWidth:= 1;
  panProjectDockSite.Width               := 0;
  //splTools.Visible                       := False;
end;

procedure TfrmMain.actFilesAddCurrentExecute(Sender: TObject);
var
  i: integer;

begin
  // Add the current file to the project
  if (pgFiles.PageCount = 0) then Exit;
  if (frmTools.tvProject.SelectionCount <= 0) then Exit;
  if (frmTools.tvProject.Selected.Level = 1) or
     (frmTools.tvProject.Selected.Level = 2) then begin
    if (slProjectChanges = nil) then slProjectChanges:= TStringList.Create;

    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
      slProjectChanges.Add(sActiveFile);
      i:= slProjectChanges.IndexOf(sActiveFile);
    end;

    pAddFile(slProjectChanges[i]);
  end;
end;

procedure TfrmMain.actProjectOpenDemoExecute(Sender: TObject);
var
  fTmp: string;

begin
  fTmp:= sPath_Project +
         '\pDemo.tps';

  if FileExists(fTmp) then
    pOpenFileIntoTinn(fTmp)
  else
    fMessageDlg(fTmp + #13 + #13 +
                'The file was not found.' + #13 +
                'Please, contact developers!',
                mtWarning,
                [mbOk],
                0);
end;

procedure TfrmMain.actProjectOpenExecute(Sender: TObject);
var
  od: TOpenDialog;

  sFile: string;

begin
  // Open an existing project
  od:= TOpenDialog.Create(Self);
  try
    od.InitialDir:= sWorkingDir;
    od.Filter:= 'Tinn project space (*.tps)|*.tps';

    if od.Execute then begin
      sFile:= od.FileName;
      pOpenFileIntoTinn(sFile);
    end;
  finally
    FreeAndNil(od);
  end;
  Self.Repaint;
end;

procedure TfrmMain.actProjectSaveExecute(Sender: TObject);
begin
  pSaveProject;
  pUpdateProjectMRU(menProjRecent,
                    sProjectName);
end;

procedure TfrmMain.actFilesRemoveExecute(Sender: TObject);
begin
  // Remove selected file
  with frmTools.tvProject do begin
    if (SelectionCount <= 0) then Exit;
    if (Selected.Level = 2) then begin
      Selected.Delete;
      bProjectChanged:= True;
    end;
  end;
end;

procedure TfrmMain.pCheckIfProjectWasChanged;
var
  i: integer;

begin
  if not bProjectChanged then Exit;

  // Bring to front the textual project, if it is opened
  i:= fFindWindowByName(sProjectName);
  if (i > -1) then Self.MDIChildren[i].BringToFront;

  if (fMessageDlg(sProjectName + #13 + #13 +
                  'This project was changed!' + #13 +
                  'Do you like to save the changes?',
                  mtConfirmation,
                  [mbYes, mbNo],
                  0) = mrYes) then actProjectSaveExecute(nil);
end;

procedure TfrmMain.pClearStatusBar;
var
  i: integer;

begin
  i:= 0;
  repeat
    with stbMain do
      Panels[i].Text:= EmptyStr;
    inc(i)
  until (i > 5);
  Application.ProcessMessages;
end;

procedure TfrmMain.pClearStatusBarProject;
begin
  with frmTools.stbProject do begin
    Panels[1].Text:= EmptyStr;
    Panels[3].Text:= EmptyStr;
    Panels[5].Text:= EmptyStr;
    Refresh;
  end;
end;

procedure TfrmMain.actProjectCloseExecute(Sender: TObject);
var
  iPos: integer;

begin
  pCheckIfProjectWasChanged;
  Application.ProcessMessages;
  if not fCloseAllFilesOfProject then Exit;

  // Close also the *.tps project file
  iPos:= fFindWindowByName(sProjectName);
  try
    if (iPos > -1) then (Self.MDIChildren[iPos] as TfrmEditor).Close;
    if (pgFiles.PageCount = 0) then pClearStatusBar
  except
    fMessageDlg(sProjectName + #13 + #13 +
                'The project file above was not found!',
                mtInformation,
                [mbOk],
                0);
  end;

  pToolsProjectControls(False);

  with frmTools.tvProject.Items do begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;

  if Assigned(slProjectChanges) then slProjectChanges.Clear;
  bProjectChanged:= False;
  pClearStatusBarProject;
end;

procedure TfrmMain.actFilesOpenAllExecute(Sender: TObject);
begin
  pOpenAllFiles;
end;

procedure TfrmMain.actFilesCloseAllExecute(Sender: TObject);
begin
  // Close all files of the active project;
  fCloseAllFilesOfProject;
end;

procedure TfrmMain.pOpenProjectIntoTinn(sProjectName: string);
begin
  // If not panTools.Visible then actToolsVisibleToogleExecute(nil);
  if not frmTools.tbsProject.TabVisible then actProjectVisibleExecute(nil);
  Application.ProcessMessages;
  frmTools.pgTools.ActivePage:= frmTools.tbsMisc;
  frmTools.pgMisc.ActivePage:= frmTools.tbsProject;
  pOpenProject;
  bProjectChanged:= False;
  pToolsProjectControls(True);

  pUpdateProjectMRU(menProjRecent,
                    sProjectName);
  pSortProject;
  pClearStatusBarProject;

  with frmTools.stbProject do begin
    Panels[1].Text:= IntToStr(frmTools.tvProject.Items.Count);
    Refresh;
  end;

  with frmTools.tvProject do
    Selected:= Items.GetFirstNode;
end;

procedure TfrmMain.pBuildProjectMRU(var miItem: TMenuItem);
var
  i: integer;

  miMRU: TMenuItem;

  prjTmp: string;

begin
  pmenProjectMRU.Items.Clear;
  miItem.Clear;
  if (slprojectMRU.Count > 0) then begin
    for i:= 0 to (slprojectMRU.Count - 1)  do begin
      if (i < iLastFile) then begin
        prjTmp:= slprojectMRU.Values[IntToStr(i)];
        if (prjTmp <> EmptyStr) then begin
          miMRU:= newItem(slprojectMRU.Values[IntToStr(i)],
                          0,
                          False,
                          True,
                          pRecentProjectFileClick,
                          0,
                          format('File%d',
                                 [i]));
          miMRU.Tag:= i;

          miItem.Add(miMRU);

          miMRU:= newItem(slprojectMRU.Values[IntToStr(i)],
                          0,
                          False,
                          True,
                          pRecentProjectFileClick,
                          0,
                          format('File%d',
                                 [i]));

          pmenProjectMRU.Items.Add(miMRU);
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.pUpdateProjectMRU(var miItem: TMenuItem;
                                         sFileName: string);
var
  i,
   j: integer;

  slTmp: TStringList;

  sTmp: string;

begin
  slTmp:= TStringList.create;

  // Put the opened file in at the top of the list
  sTmp:= StringReplace(sFileName,
                       '&',
                       '&&',
                       [rfReplaceAll]);

  if FileExists(sFileName) then begin
    slTmp.Insert(0,'0=' + sTmp);
    j:= 1;
  end
  else j:= 0;

  // Store Data and remove from menu
  for i:= 0 to (slprojectMRU.Count - 1) do begin
    if (sTmp <>  slprojectMRU.Values[IntToStr(i)]) then begin
      slTmp.Add(IntToStr(j) +
                '=' +
                slprojectMRU.Values[IntToStr(i)]);
      inc(j);
    end;
  end;

  slprojectMRU.Text:= slTmp.Text;
  pBuildProjectMRU(miItem);
  FreeAndNil(slTmp);
end;

procedure TfrmMain.pRecentProjectFileClick(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= StringReplace(TMenuItem(Sender).Caption,
                       '&',
                       EmptyStr,
                       []);

  sTmp:= StringReplace(sTmp,
                       '&&',
                       '&',
                       [rfReplaceAll]);

  if FileExists(sTmp) then
    pOpenFileIntoTinn(sTmp)
  else begin
    // Take it off the File MRU list
    if (fMessageDlg(sTmp + #13 + #13 +
                    'File does not exist.' + #13 +
                    'Would you like to remove it from MRU (Most Recent Used) list?',
                    mtInformation,
                    [mbYes, mbNo],
                    0) = mrYes) then
      pUpdateProjectMRU(menProjRecent,
                        sTmp);
  end;
end;

procedure TfrmMain.pgFilesMouseDown(Sender: TObject;
                                        Button: TMouseButton;
                                        Shift: TShiftState;
                                        X,
                                        Y: Integer);
var
  i: integer;

begin
  pgFiles.BeginDrag(False);
  i:= pgFiles.IndexOfTabAt(X, Y);

  if (Button = mbRight) and
     (pgFiles.ActivePageIndex = i) then pTabMenuPopup(pgFiles,
                                                      X,
                                                      Y);
end;

procedure TfrmMain.pgFilesMouseLeave(Sender: TObject);
begin
  with pgFiles do begin
    Hint:= '';
    ShowHint:= false;
  end;
end;

procedure TfrmMain.pgFilesMouseMove(Sender: TObject;
                                        Shift: TShiftState;
                                        X,
                                         Y: Integer);
var
  i: integer;

begin
  i:= pgFiles.IndexOfTabAt(X, Y);

  if (i >= 0) and (pgFiles.Hint <> pgFiles.Pages[i].Hint) then begin
    Application.CancelHint;
    pgFiles.Hint:= pgFiles.Pages[i].Hint;
    pgFiles.ShowHint:= true;
  end;
end;

procedure TfrmMain.pgFilesDragDrop(Sender,
                                       Source: TObject;
                                       X,
                                       Y: Integer);
const
  TCM_GETITEMRECT = $130A;

var
  i: integer;

  r: TRect;

begin
  if not (Sender is TPageControl) then Exit;

  with pgFiles do begin
    for i:= 0 to (PageCount - 1) do begin
      Perform(TCM_GETITEMRECT,
              i,
              lParam(@r));

      if PtInRect(r,
                  Point(X, Y)) then begin
        if (i <> ActivePage.PageIndex) then
          ActivePage.PageIndex:= i;
        Exit;
      end;
    end;
  end;
end;

procedure TfrmMain.pgFilesDragOver(Sender,
                                       Source: TObject;
                                       X,
                                       Y: Integer;
                                       State: TDragState;
                                       var Accept: Boolean);
begin
  if Sender is TPageControl then Accept:= True;
end;

function TfrmMain.fUseTCPIP: boolean;
begin
  Result:= False;
  if bRAsServer then
    if csREnvironment.Active and
       csRExplorer.Active    and
       csRGeneral.Active     and
       csRtip.Active then Result:= True;
end;

procedure TfrmMain.menToolsUtilsActionlistToClipboardClick(Sender: TObject);
var
  i,
   iImage: integer;

  sShortcut,
   sGroup,
   sCaption,
   sHint,
   sTmp1,
   sTmp2,
   sBegin,
   sEnd: string;

  aTmp: TAction;
  
begin
  sBegin:= '<DATAPACKET Version="2.0">'                                    + #13#10 +
           ' <METADATA>'                                                   + #13#10 +
           '  <FIELDS>'                                                    + #13#10 +
           '   <FIELD attrname="Index" fieldtype="i4"/>'                   + #13#10 +
           '   <FIELD attrname="Group" fieldtype="string" WIDTH="50"/>'    + #13#10 +
           '   <FIELD attrname="Caption" fieldtype="string" WIDTH="50"/>'  + #13#10 +
           '   <FIELD attrname="Hint" fieldtype="string" WIDTH="80"/>'     + #13#10 +
           '   <FIELD attrname="Shortcut" fieldtype="string" WIDTH="50"/>' + #13#10 +
           '   <FIELD attrname="Image" fieldtype="i4"/>'                   + #13#10 +
           '  </FIELDS>'                                                   + #13#10 +
           '  <PARAMS/>'                                                   + #13#10 +
           ' </METADATA>'                                                  + #13#10 +
           ' <ROWDATA>'                                                    + #13#10;

  sEnd  := ' </ROWDATA>'                                                   + #13#10 +
           '</DATAPACKET>'                                                 + #13#10;
           
  sTmp2 := sBegin;

  for i:= 0 to alMain.ActionCount -1 do begin
    aTmp:= TAction(alMain.Actions[i]);
    with aTmp do begin
      sGroup   := Category;
      sHint    := Hint;
      sCaption := Caption;
      sShortCut:= ShortCutToText(ShortCut);
      iImage   := ImageIndex;
    end;

    if (sShortCut = EmptyStr) then sShortCut:= 'None';
    sTmp1:= '  <ROW'                                   + ' ' + 
            'Index='    + '"' + IntToStr(i)      + '"' + ' ' + 
            'Group='    + '"' + sGroup           + '"' + ' ' + 
            'Caption='  + '"' + sCaption         + '"' + ' ' + 
            'Hint='     + '"' + sHint            + '"' + ' ' + 
            'Shortcut=' + '"' + sShortcut        + '"' + ' ' + 
            'Image='    + '"' + IntToStr(iImage) + '"' + ' ' + 
            '/>'        + #13#10;
    sTmp2:= sTmp2 + sTmp1;
  end;

  sTMp2:= Stmp2 + sEnd;
  Clipboard.AsText:= sTmp2;
  stbMain.Panels[8].Text:= 'Done!';
end;

// Tinn-R version (3.0.2.9): I was a bit tired of doing the below manually!
procedure TfrmMain.menToolsUtilsActionlistToDatasetClick(Sender: TObject);

  procedure pMakeNewData_Zip;
    var
      sBackup: string;

  begin
    sBackup:= sPath_TinnR +
              '\data\' +
              'data.zip';

    DeleteFile(sBackup);

    try
      DeleteFile(sBackup);

      zipKit.StoreOptions:= [soRecurse,     // soRecurse: will include all files of all folders and sub-folders!
                             soStripPath];  // soStripPath: the new data.zip generated should not (in any way) preserve the information of the original path!
      with zipKit do begin
        FileName:= sBackup;

        with ModDados do begin
          AddFiles(sPath_Data + '\*.*',
                   0);
          CloseArchive;
        end;
      end;
      fMessageDlg(sBackup + #13 + #13 +
                  'The new file "data.zip" was created' + #13 +
                  'successfully in the path above!',
                  mtInformation,
                  [mbOk],
                  0);
    except
      fMessageDlg(sBackup + #13 + #13 +
                  'A problem occurred while trying to copy the file.' + #13 +
                  'The "data.zip" file wall not be copied!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;  // try
  end;

  procedure pDoMessage (sTmp: string);
  begin
    fMessageDlg(sTmp + #13 + #13 +
                'A problem occurred while trying to copy the file.' + #13 +
                'The "Shortcuts_new.xml" file wall not be copied!',
                mtError,
                [mbOk],
                0);
  end;

var
  sOrigin,
   sDest: string;

begin
  with modDados do
    if not fActionlistToDataset then Exit;

  sOrigin:= sPath_Data +
            '\' +
            'Shortcuts.xml';

  sDest:= sPath_TinnR +
          '\data\' +
          'Shortcuts.xml';

  try
    if not (CopyFile(PChar(sOrigin),
                     PChar(sDest),
                     False)) then begin  // False: replace the old file
      pDoMessage(sDest);
      Exit;
    end;
  except
    pDoMessage(sDest);
    Exit;
  end;

  pMakeNewData_Zip;

  with stbMain do begin
    Panels[8].Text:= 'Done!';
    Panels[9].Text:= 'Shortcuts.xml replaced: ' +
                     sPath_Data;
  end;
end;

procedure TfrmMain.pDatasetToActionList(Sender: TObject);

  procedure pUpdate_Action(i: integer;
                           sGroup,
                           sCaption,
                           sHint,
                           sShortcut: string;
                           iImage: integer);
  var
    aTmp: TAction;
    
  begin
    aTmp:= TAction(alMain.Actions[i]);
    with aTmp do begin
      Category  := sGroup;
      Caption   := sCaption;
      Hint      := sHint;
      Shortcut  := TextToShortcut(sShortcut);
      ImageIndex:= iImage;
      UpdateAction(aTmp);
    end;
  end;
  
var
  pTmp: pointer;

  i,
   iImage: integer;

  sShortcut,
   sGroup,
   sCaption,
   sHint: string;

begin
  alMain.State:= asSuspended;

  with modDados.cdShortcuts do begin
    pTmp:= GetBookmark;
    DisableControls;
    Filtered:= False;
    First;

    // while not Eof do begin
    for i:= 0 to RecordCount - 1 do begin
      sGroup   := Fields[1].AsString;
      sCaption := Fields[2].AsString;
      sHint    := Fields[3].AsString;
      sShortcut:= Fields[4].AsString;
      iImage   := Fields[5].AsInteger;
      pUpdate_Action(i,
                     sGroup,
                     sCaption,
                     sHint,
                     sShortcut,
                     iImage);
      Next;
    end;

    EnableControls;
    Filtered:= True;
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;

  alMain.State:= asNormal;
end;

procedure TfrmMain.menToolsUtilsDatasetToActionlistClick(Sender: TObject);
begin
  pDatasetToActionList(nil);
  stbMain.Panels[8].Text:= 'Done!';
end;

procedure TfrmMain.pCheckTop;
begin
  pOnTop(Application.Handle);
end;

procedure TfrmMain.pSetFocus_Rgui(iDelay: integer);
begin
  Sleep(iDelay);
  if bRguiReturnFocus then SetForegroundWindow(Application.Handle);
end;

//function TfrmMain.fFindWord: string;
//var
//  seTmp: TSynEdit;
//
//  i: integer;
//
//begin
//  seTmp:= nil;
//  i:= fFindTopWindow;
//
//  case iSynWithFocus of
//    0: Exit;
// 1..2: if Assigned(Self.MDIChildren[i] as TfrmEditor) then
//         with (Self.MDIChildren[i] as TfrmEditor) do
//           if (sActiveEditor = 'synEditor') then seTmp:= (Self.MDIChildren[i] as TfrmEditor).synEditor
//                                            else seTmp:= (Self.MDIChildren[i] as TfrmEditor).synEditor2;
//    3: seTmp:= frmRterm.synIO;
//    4: with frmRterm do
//         if Assigned(synLog2) then seTmp:= synLog2
//                              else seTmp:= synLog;
//  end;
//
//  if (seTmp = nil) then Exit;  // It is important, do not remove!
//
//  with seTmp do
//    if SelAvail and
//      (BlockBegin.Line = BlockEnd.Line) then Result:= SelText
//                                        else Result:= GetWordAtRowCol(WordStartEx(CaretXY));  // Avoid return empty wheter cursor is at the end of word
//end;

function TfrmMain.fGet_Syn: TSynEdit;
var
  seTmp: TSynEdit;

  i:integer;

begin
  seTmp:= nil;
  Result:= nil;

  i:= fFindTopWindow;
  case iSynWithFocus of
    0: Exit;
 1..2: if Assigned(Self.MDIChildren[i] as TfrmEditor) then
         with (Self.MDIChildren[i] as TfrmEditor) do
           if (sActiveEditor = 'synEditor') then seTmp:= (Self.MDIChildren[i] as TfrmEditor).synEditor
                                            else seTmp:= (Self.MDIChildren[i] as TfrmEditor).synEditor2;
    3: seTmp:= frmRterm.synIO;
    4: with frmRterm do
         if Assigned(synLog2) then seTmp:= synLog2
                              else seTmp:= synLog;
  end;

  Result:= seTmp;
end;

procedure TfrmMain.menRget_InfoClick(Sender: TObject);
begin
  pR_Info;
end;

procedure TfrmMain.menRHotKeysClick(Sender: TObject);
begin
  hkTinnR.ShowModal;
  pSetFocus_Main;
end;

procedure TfrmMain.actEditorLineWrapExecute(Sender: TObject);
var
  i: integer;

begin
  // Toogle Word wrap
  actEditorLineWrap.Checked:= not actEditorLineWrap.Checked;

  if (Self.MDIChildCount > 0) then
    for  i:= (Self.MDIChildCount - 1) downto 0 do
      (Self.MDIChildren[i] as tfrmEditor).pToogleWordWrap(actEditorLineWrap.Checked);
end;

procedure TfrmMain.TBRMainMove(Sender: TObject);
begin
  TBIniSavePositions(Self,
                     sPathIniTinn_File,
                     EmptyStr);
end;

procedure TfrmMain.menToolsUtilsTesteRegexClick(Sender: TObject);
var
  res: string;

begin
  res:= fRegEx('Teste,,,',
               'Teste[,]+$',
               True,
               'The PCRE RegEx is OK!');

  fMessageDlg('Teste,,,' + #13 + #13 +
              'RegEx = ''Teste[,]+$''' + #13 +
              'Replace = True ' + #13 +
              'Replacement = ''The replacement PCRE RegEx is OK!''' + #13 + #13 +
              res,
              mtInformation,
              [mbOK],
              0)
(*
var
  RegExI: TPerlRegEx;

begin
  try
    try
      RegExI:= TPerlRegEx.Create;

      with RegExI do begin
        Subject := 'I like to hang out at' + #13#10 +
                   'foo BAR';

        fRegEx := '([a-z]+) BAR';

        Replacement := '\1 is the name of the bar I like!';

        if Match then pReplace;

        ShowMessage(RegExI.Subject);
      end;


        Options:= [preCaseLess,
                   preMultiLine];
        Subject:= 'Aaa bbb ccc' + #13 +
                  'Bbb aAa dDd' + #13 +
                  'Ccc dDD eEe';

        fRegEx:= '^c{1,3}'
      end;

      if RegexObj.Match then begin
        // Successful match
        ShowMessage(RegexObj.Subject +
                    #13#13 +
                    'has ' +
                    RegexObj.RegEx);
      end
      else begin
        // Match attempt failed
        ShowMessage(RegexObj.Subject +
                    #13#13 +
                    'doesn''t has ' +
                    RegexObj.RegEx);
      end;

    except
        // Syntax error in the regular expression
    end;

  finally
    FreeAndNil(RegExI);
  end;
*)  
end;

procedure TfrmMain.pUpdateRFileReformatted(sTmp: string);
var
  i,
    iTopLine: Integer;

  bcPos: TBufferCoord;

  seEditor: TSynEdit;

  sPrior,
   sFormatted: string;

begin
  if not FileExists(sTmp) then Exit;

(*
  iReformatRSplit = 0 -> do not split
  iReformatRSplit = 1 -> split vertical
  iReformatRSplit = 2 -> split horizontal
*)
  case iReformatRSplit of
    1: actSplitVerticalExecute(nil);    // Vertical
    2: actSplitHorizontalExecute(nil);  // Horizontal
  end;

  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  // Will load the formatted file in synEditor
  with seEditor do begin
    iTopLine:= TopLine;
    bcPos:= CaretXY;
    SelectAll;

    if SelAvail then begin
      sPrior    := SelText;
      sFormatted:= fFile_ToString(sTmp);
      SelText   := sFormatted;
    end;

    TopLine:= iTopLine;
    CaretXY:= bcPos;
  end;

  // Reload the original file in synEditor2 for comparison
  case iReformatRSplit of
    1, 2: with (Self.MDIChildren[i] as tfrmEditor) do
            with (synEditor2) do
              Lines.LoadFromFile(sActiveFile);
  end;

  with (Self.MDIChildren[i] as TfrmEditor) do
    pCheckSaveStatus;

  DeleteFile(sTmp);

  iRFormatted:= -1;
end;

procedure TfrmMain.pUpdateRSelectionReformatted(sTmp: string);
var
  seEditor: TSynEdit;

  sPrior,
   sFormatted: string;

  i: integer;

begin
  i:= fFindTopWindow;

  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    if SelAvail then begin
      sPrior    := SelText;
      sFormatted:= fFile_ToString(sTmp);
      SelText   := sFormatted;
    end
  end;

  DeleteFile(sTmp);

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);

  iRFormatted:= -1;
end;

procedure TfrmMain.tUpdateOptionsTimer(Sender: TObject);
begin
  try
    pUpdateOptions;
  except
    // TODO
  end;
end;

procedure TfrmMain.pRSetGet_Info;
begin
  // Get Info
  if (not bRTinnRcom_Info) then
    if fRterm_Running and
       (frmRTerm.cRterm.bRterm_Ready) then pR_Info
    else if fRgui_Running then pR_Info;

  // Start svSocket
  if bRsvSocket_Connect and
     not bTCPIPRunning then pStartSocketServer_svSocket;
end;

procedure TfrmMain.pRSetSend_Info(var sInfo,
                                          sFileInfo: string);

  procedure pSet_Repos(var sInfo: string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%repos',
                          sRmirror,
                          []);
  end;

  procedure pSet_Path(var sInfo: string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%path',
                          DosPathToUnixPath(sPath_TinnRcom),
                          []);
  end;

  procedure pSet_Install(var sInfo: string; sVal:string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%install',
                          sVal,
                          []);
  end;

  procedure pSet_Load(var sInfo: string; sVal:string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%load',
                          sVal,
                          []);
  end;

  procedure pSet_Connect(var sInfo: string; sVal:string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%connect',
                          sVal,
                          []);
  end;

  procedure pSet_Mirrors(var sInfo: string; sVal:string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%mirrors',
                          sVal,
                          []);
  end;

  procedure pSet_Input_Mirrors(var sInfo: string; sVal:string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%input',
                          sVal,
                          []);
  end;

var
  i,
   iWidth: integer;

  sToSend,
   sInput,
   sPathPuTTY: string;

begin
  sInfo:= fFile_ToString(sUtilsOrigin +
                         '\info.R');

  sFileInfo:= sPath_Tmp +
              '\info.R';

  sInput:= DosPathToUnixPath(sUtilsOrigin +
                             '\mirrors.R');

  pSet_Repos(sInfo);

  pSet_Path(sInfo);

  if bRTinnRcom_Install then pSet_Install(sInfo, 'TRUE')
                        else pSet_Install(sInfo, 'FALSE');

  if bRTinnRcom_Load then pSet_Load(sInfo, 'TRUE')
                     else pSet_Load(sInfo, 'FALSE');

  if bRsvSocket_Connect then pSet_Connect(sInfo, 'TRUE')
                        else pSet_Connect(sInfo, 'FALSE');

  if bRMirros_Update then begin
                            pSet_Mirrors(sInfo, 'TRUE');
                            pSet_Input_Mirrors(sInfo, sInput)
                          end
                     else pSet_Mirrors(sInfo, 'FALSE');

  if fRterm_Running then begin
    with frmRterm do
      iWidth:= (synIO.Width - synIO.Gutter.Width - 20) div synIO.CharWidth;

    if (iWidth >= 20) then
      sInfo:= sInfo + #13#10 +
              '# Set width: Rterm' + #13#10 +
              'options(''width''=' +
              IntToStr(iWidth) +
              ')';
  end;

  // R remote under PuTTY
  if (iRecognition_Caption = 4) and
     not fRterm_Running then begin
    sPathPuTTY:= sPath_TinnR + '\putty\pscp.exe';

    if fFile_Save_Fast_PuTTY(sFileInfo,
                             sInfo,
                             sPathPuTTY,
                             sPuTTYPassword,
                             sPuTTYUser,
                             sPuTTYHost) then begin

      Sleep(5*iDelay);

      if FileExists(sFileInfo) then DeleteFile(sFileInfo);
      if FileExists(sPath_Tmp + '\info.txt') then DeleteFile(sPath_Tmp + '\info.txt');  // It can exixts as trash from old R remote (or local) session

      i:= 1;
      repeat
        Sleep(5*iDelay);

        if fFile_Exists_PuTTY(sFileInfo,
                              '/tmp/Tinn-R/info.R',
                              sPathPuTTY,
                              sPuTTYPassword,
                              sPuTTYUser,
                              sPuTTYHost) then Break
                                          else inc(i)
      until (i = 20);

      if (not FileExists(sFileInfo)) then Exit
                                     else sToSend:= 'source(' +
                                                    '''' +
                                                    '/tmp/Tinn-R/info.R' +
                                                    '''' +
                                                    ')';
    end;
  end
  else
    if fFile_Save_Fast(sFileInfo,
                       sInfo) then sToSend:= 'source(' +
                                             '''' +
                                             DosPathToUnixPath(sFileInfo) +
                                             '''' +
                                             ')';

  // Disable ReturnFocus: Temporary to avoid a flicker in the TBRMain
  if fRgui_Running and
     bRguiReturnFocus then actRguiReturnFocus.Checked:= False;
  Application.ProcessMessages;

  pDoSend(sToSend);

  if fRterm_Running then frmRTerm.cRterm.bRterm_Ready:= False;
  //ShowMessage(sInfo); Exit;  // To debug only
end;

procedure TfrmMain.pR_Info;

  procedure pReturnPreviousStates;
  begin
    // On Top
    if bOnTop then begin
      pOnTop(Application.Handle);
      actOnTop.Checked:= True;
      pCheckTop;
    end
    else begin
      pOnTop(Application.Handle);
      actOnTop.Checked:= False;
    end;

    // ReturnFocus
    if bRguiReturnFocus then begin
      actRguiReturnFocus.Checked:= True;
      pSetFocus_Rgui(iDelay);
    end
    else actRguiReturnFocus.Checked:= False;
  end;

var
  i: integer;

  sInfo,
   sFilePath,
   sTmp: string;

  slTmp: TStringList;

begin
  try
    pRSetSend_Info(sInfo,
                   sFilePath);

    if (bRMirros_Update) then sTmp:= sPath_Tmp +
                                     '\mirrors.txt'
                         else sTmp:= sPath_Tmp +
                                     '\info.txt';

    i:= 1;
    repeat
      Sleep(5*iDelay);

      if (iRecognition_Caption = 4) and
         not fRterm_Running then
        if fFile_Exists_PuTTY(sPath_Tmp + '\info.txt',
                              '/tmp/Tinn-R/info.txt',
                              sPath_TinnR + '\putty\pscp.exe',
                              sPuTTYPassword,
                              sPuTTYUser,
                              sPuTTYHost) then Break
                                          else inc(i)
      else
        if FileExists(sTmp) then Break
                            else inc(i);
    until (i = 20);

    if (not FileExists(sTmp)) then Exit
                              else bRTinnRcom_Info:= True;

    slRLibPaths:= TStringList.Create;
    slTmp      := TStringList.Create;

    Sleep(20*iDelay);  // It is very important when installing packages!

    slTmp.LoadFromFile(sPath_Tmp +
                       '\info.txt');

    // R remote under PuTTY
    if (iRecognition_Caption = 4) and
       not fRterm_Running then begin
      sPath_R_Connected         := trim(slTmp.Strings[0]);
      sPathTinnRcom_Installed   := trim(slTmp.Strings[1]);
      sVersion_TinnRcomInstalled:= trim(slTmp.Strings[2]);

      if (slTmp.Count > 3) then  // .libPaths has more than one folder
        for i:= 0 to (slTmp.Count - 4) do
          slRLibPaths.Add(trim(slTmp.Strings[i + 3]));
    end
    else begin
      if DirectoryExists(trim(slTmp.Strings[0])) then begin  // R running path
        sPath_R_Connected         := UnixPathToDosPath(trim(slTmp.Strings[0]));
        sPathTinnRcom_Installed   := UnixPathToDosPath(trim(slTmp.Strings[1]));
        sVersion_TinnRcomInstalled:= trim(slTmp.Strings[2]);

        if (slTmp.Count > 3) then  // .libPaths has more than one folder
          for i:= 0 to (slTmp.Count - 4) do
            slRLibPaths.Add(UnixPathToDosPath(trim(slTmp.Strings[i + 3])));
      end
      else begin
        sPath_R_Connected         := 'UNKNOWN';
        sPathTinnRcom_Installed   := 'UNKNOWN';
        sVersion_TinnRcomInstalled:= 'UNKNOWN';
        slRLibPaths.Add('UNKNOWN');
      end;
    end;

    if (sPathTinnRcom_Installed = 'Not installed') or
       (sPathTinnRcom_Installed = 'UNKNOWN') then bRTinnRcom_Installed:= False
                                             else bRTinnRcom_Installed:= True;

    if bRMirros_Update then
      if FileExists(sPath_Tmp +
                   '\mirrors.txt') then begin
        if (not modDados.fRmirrors_Update(sPath_Tmp +
                                          '\mirrors.txt')) then
          fMessageDlg('It was not possible to update the dataset from CRAN mirrors!',
                      mtWarning,
                      [mbOk],
                      0)
        else pRmirrorsInterface_Update;
      end  // FileExists(sPath_Tmp +
      else
        fMessageDlg('It was not possible to update the dataset from CRAN mirrors!',
                    mtWarning,
                    [mbOk],
                    0);

  finally
    FreeAndNil(slTmp);
    if fRgui_Running and
       bRguiReturnFocus then pReturnPreviousStates;
  end;
end;

procedure TfrmMain.pStartSocketServer_svSocket;
begin
  Screen.Cursor:= crHourglass;

  if fRterm_Running and
    frmRTerm.cRterm.bRterm_Ready then begin
    Sleep(1*iDelay);
    actRContTCPConnectionExecute(nil);
  end
  else if fRgui_Running then begin
    Sleep(5*iDelay);
    actRContTCPConnectionExecute(nil);
  end;

  Screen.Cursor:= crDefault;
end;

procedure TfrmMain.tRRuningTimer(Sender: TObject);

  procedure pRgui(bRunning: boolean);
  begin
    with actRContGuiPuTTYStartClose do
      if bRunning then begin
        Caption   := 'Rgui/PuTTY (close)';
        ImageIndex:= 82
      end
      else begin
        Caption   := 'Rgui/PuTTY (start)';
        ImageIndex:= 81;
      end;

    actRContGuiPuTTYStartClose.Update;

    if bRunning                  and
       (frmAppOptionsDlg = nil)  and
       bOrganizeAutomatically    and
       not bAlreadyOrganized  then actOrganizeScreenExecute(Self);
  end;

  procedure pRterm(bRunning: boolean);
  begin
    with actRContTermStartClose do
      if bRunning then begin
        Caption   := 'Rterm (close)';
        ImageIndex:= 245
      end
      else begin
        Caption   := 'Rterm (start)';
        ImageIndex:= 244
      end;

    actRContTermStartClose.Update;
  end;

  // R is running
  procedure pR_Is_Running;
  var
    seEditor: TSynEdit;

  begin
    pRMenu(True);

    pControlResources(True);

    if (pgFiles.PageCount = 0) then pSendResources(False)
    else begin
      pSendResources(True);
      with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
        if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                         else seEditor:= synEditor2;
      with seEditor do begin
        actRSendSelection.Enabled:= SelAvail;
      end;
    end;

    if bTinnRHotKeys then stbMain.Panels[6].Text:= 'HK On'
                     else stbMain.Panels[6].Text:= 'HK Off';

    menControlRClearConsole.Enabled:= True;
    menControlRHelp.Enabled        := True;
    TBRClearConsole.Enabled        := True;
    TBRRHelp.Enabled               := True;

    if bRSetget_Info then pRSetGet_Info;

    case iRFormatted of
      -1: Exit;
       0: pUpdateRFileReformatted(sPath_Tmp +
                                  '\reformat-output.r');
       1: pUpdateRSelectionReformatted(sPath_Tmp +
                                       '\reformat-output.r');
    end;
  end;

  // R isn't running
  procedure pR_Not_Running;
  begin
    pRMenu(True);

    pControlResources(False);

    pSendResources(False);

    if (stbMain.Panels[6].Text <> EmptyStr) then stbMain.Panels[6].Text:= EmptyStr;

    actRSendSelection.Enabled      := False;
    bAlreadyOrganized              := False;
    bTCPIPRunning                  := False;
    bRTinnRcom_Loaded              := False;
    bRTinnRcom_Info                := False;
    sPath_R_Connected              := 'UNKNOWN';
    sPathTinnRcom_Installed        := 'UNKNOWN';
    sVersion_TinnRcomInstalled     := 'UNKNOWN';
    if Assigned(slRLibPaths) then
      FreeAndNil(slRLibPaths);
    actRContTCPConnection.ImageIndex:= 168;  
  end;

begin
  try
      pRgui(fRgui_Running);
      pRterm(fRterm_Running);

      if fRgui_Running or
         fRterm_Running or
         bIPRemoteConnected then pR_Is_Running
                            else pR_Not_Running;
  except
     // TODO
  end;
end;

procedure TfrmMain.pOpenHelpFile(sFileToOpen: string);
var
  sPathFile: string;

begin
  sPathFile:= sPath_TinnR + sFileToOpen;
  if FileExists(sPathFile) then pOpenFileIntoTinn(sPathFile)
  else fMessageDlg(sPathFile + #13 + #13 +
                   'The file was not found.' + #13 +
                   'Please, reinstall the program!',
                   mtWarning,
                   [mbOk],
                   0);
end;

function TfrmMain.fMessageDlg(const sMsg:
                                  string; mdType: TMsgDlgType;
                                  mdButtons: TMsgDlgButtons;
                                  iHelp: Integer): Integer;
begin
  with CreateMessageDialog(sMsg,
                           mdType,
                           mdButtons) do
    try
      Position:= poOwnerFormCenter;
      Result  := ShowModal
    finally
      Free;
    end
end;

procedure TfrmMain.sdMainShow(Sender: TObject);
begin
  sdMainTypeChange(Self);
end;

procedure TfrmMain.sdMainTypeChange(Sender: TObject);
var
  iSelectedIndex,
   iPeriodPos,
   iEndPos: integer;

  sFileName,
   sTmp: string;

begin
  // This is a good place to ReGex!
  sFileName      := sdMain.FileName;
  sTmp           := EmptyStr;
  iSelectedIndex := sdMain.FilterIndex;
  sTmp           := slFilters.Strings[iSelectedIndex -1];
  sFileExtensions:= sTmp;  // All extensions of the highlighter

  iPeriodPos:= Pos('*',
                   sTmp);

  iEndPos:= Pos(';',  // With SynEdit_ANSI: ','
                sTmp);

  if (iEndPos = 0) then iEndPos:= Pos(')',
                                      sTmp);

  sTmp:= Copy(sTmp,
              iPeriodPos + 1,
              (iEndPos - iPeriodPos) - 1);

  sSaveAsFileExt:= sTmp;  // First file extension
end;

procedure TfrmMain.menWebRInformationsCRANClick(Sender: TObject);
begin
  pOpen_Url('http://cran.r-project.org/');
end;

procedure TfrmMain.menWebRInformationsMRANClick(Sender: TObject);
begin
  pOpen_Url('http://mran.microsoft.com/');
end;

procedure TfrmMain.menWebRInformationsWebSiteClick(Sender: TObject);
begin
  pOpen_Url('http://www.r-project.org/');
end;

procedure TfrmMain.menWebRInformationsZoonekyndClick(Sender: TObject);
begin
  pOpen_Url('http://zoonek2.free.fr/UNIX/48_R/all.html');
end;

procedure TfrmMain.menWebRInformationsBioconductorClick(Sender: TObject);
begin
  pOpen_Url('http://www.bioconductor.org/');
end;

procedure TfrmMain.menWebRInformationsNewsClick(Sender: TObject);
begin
  pOpen_Url('http://cran.r-project.org/doc/Rnews/');
end;

procedure TfrmMain.menWebRInformationsOmegaClick(Sender: TObject);
begin
  pOpen_Url('http://www.omegahat.org/');
end;

procedure TfrmMain.menWebRInformationsRWikiClick(Sender: TObject);
begin
  pOpen_Url('http://cran.r-project.org/web/views/');
end;

procedure TfrmMain.menWebRInformationsTutorialClick(Sender: TObject);
begin
  pOpen_Url('http://www.r-tutor.com/');
end;

procedure TfrmMain.menWebRGuiRStudioClick(Sender: TObject);
begin
  pOpen_Url('http://www.rstudio.org/');
end;

procedure TfrmMain.menWebRGuiRTVSClick(Sender: TObject);
begin
//  pOpen_Url('http://microsoft.github.io/RTVS-docs/')
  pOpen_Url('https://docs.microsoft.com/pt-br/visualstudio/rtvs/?view=vs-2017')
end;

procedure TfrmMain.menWebRSearchMailingListArchivesClick(Sender: TObject);
begin
  pOpen_Url('http://tolstoy.newcastle.edu.au/R/');
end;

procedure TfrmMain.menWebRSearchSiteClick(Sender: TObject);
begin
  pOpen_Url('http://finzi.psych.upenn.edu/search.html');
end;

procedure TfrmMain.menWebRSearchRseekClick(Sender: TObject);
begin
  pOpen_Url('http://www.rseek.org/');
end;

procedure TfrmMain.menWebRSearchHelpForRClick(Sender: TObject);
begin
  pOpen_Url('http://finzi.psych.upenn.edu/');
end;

procedure TfrmMain.menHelpStatJSSClick(Sender: TObject);
begin
  pOpen_Url('http://www.jstatsoft.org/');
end;

procedure TfrmMain.menHelpStatRJournalClick(Sender: TObject);
begin
  pOpen_Url('http://journal.r-project.org');
end;

procedure TfrmMain.menWebStatVLPSClick(Sender: TObject);
begin
  pOpen_Url('http://www.math.uah.edu/stat/');
end;

procedure TfrmMain.menWebStatVirtualLabVESTACClick(Sender: TObject);
begin
  pOpen_Url('http://lstat.kuleuven.be/newjava/vestac/');
end;

procedure TfrmMain.menWebStatVirtualLabRiceClick(Sender: TObject);
begin
  pOpen_Url('http://onlinestatbook.com/rvls.html');
end;

procedure TfrmMain.menWebStatVirtualStatisticalJavaClick(Sender: TObject);
begin
  pOpen_Url('http://www.causeweb.org/repository/statjava/');
end;

procedure TfrmMain.menHelpStatHyperstatClick(Sender: TObject);
begin
  pOpen_Url('http://davidmlane.com/hyperstat/index.html');
end;

procedure TfrmMain.menHelpStatStatSoftClick(Sender: TObject);
begin
  pOpen_Url('http://www.statsoftinc.com/textbook/stathome.html');
end;

procedure TfrmMain.menHelSecretsClick(Sender: TObject);
begin
  pOpenUserGuidePDF('"Some Secrets for an Efficient Use"');
end;

procedure TfrmMain.menWebSearchSelGoogleClick(Sender: TObject);
var
  sTmp,
   sWord: string;

begin
  if (pgFiles.PageCount = 0) then Exit;
  sWord:= fFindWord_Extended(fGet_Syn);

  if (sWord = EmptyStr) then begin
    fMessageDlg('No valid word selected from the file!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;

  sTmp:= 'http://www.google.com/search?q='+
         sWord +
         '&domains=r-project.org&sitesearch=r-project.org&btnG=Google+Search';
  pOpen_Url(sTmp);
end;

procedure TfrmMain.menWebSearchSelRArchivesClick(Sender: TObject);
//var
//  sTmp,
//   sSelWord: string;

begin
//  if (pgFiles.PageCount = 0) then Exit;
//  sSelWord:= fFindWord_Extended(fGet_Syn);
//
//  if (sSelWord = EmptyStr) then begin
//    fMessageDlg('No valid word selected from the file!',
//                mtInformation,
//                [mbOk],
//                0);
//    Exit;
//  end;
//
//  sTmp:= 'www.google.com/u/newcastlemaths?q=' +
//         sSelWord +
//         '&sa=Google+Search';
//  pOpen_Url(sTmp);
end;

procedure TfrmMain.menWebSearchSelRSiteClick(Sender: TObject);
var
  sTmp,
   sSelWord: string;

begin
  if (pgFiles.PageCount = 0) then Exit;
  sSelWord:= fFindWord_Extended(fGet_Syn);

  if (sSelWord = EmptyStr) then begin
    fMessageDlg('No valid word selected from the file!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;

  sTmp:= 'http://finzi.psych.upenn.edu/cgi-bin/namazu.cgi?query=' +
          sSelWord +
          '&max=20&Result=normal&sort=score&idxname=functions&idxname=docs&idxname=Rhelp02a';

  pOpen_Url(sTmp);
end;

procedure TfrmMain.menWebRguiRComanderClick(Sender: TObject);
begin
  pOpen_Url('http://socserv.socsci.mcmaster.ca/jfox/Misc/Rcmdr/index.html');
end;

procedure TfrmMain.FormDragOver(Sender,
                                    Source: TObject;
                                    X,
                                    Y: Integer;
                                    State: TDragState;
                                    var Accept: Boolean);
begin
  Accept:= False;
  if Source is TShellListView then Accept:= True
  else if Source is TTreeView then Accept:= True
  else if Source is TListView then Accept:= True
  else if (Source is TJvFileListBox) then Accept:= True;
end;

procedure TfrmMain.FormDragDrop(Sender,
                                    Source: TObject;
                                    X,
                                    Y: Integer);
var
  i: integer;
  
begin
  // The below will avoid to try to open file (and related error message)
  // when dragging any selection inside of the editor
  i:= fFindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    if (Source = (Self.MDIChildren[i] as TfrmEditor).synEditor) or
       (Source = (Self.MDIChildren[i] as TfrmEditor).synEditor2) then Exit;

  // Object was draged from Search interface
  if (Source = frmTools.tvSearch) then begin
    if not (iDragLevel = 2) then Exit;
    if FileExists(trim(sDragSource)) then pOpenFileIntoTinn(sDragSource,
                                                            StrToIntDef(sDragSourceLine,
                                                                        0))
                                     else fMessageDlg(trim(sDragSource) + #13 + #13 +
                                                     'The file above was not found!',
                                                     mtWarning,
                                                     [mbOk],
                                                     0);

    Sleep(iDelay div 2);

    if (pgFiles.PageCount > 0) then
      with TfrmEditor(MDIChildren[0]).synEditor do begin
        TopLine:= StrToInt(sDragSourceLine);
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
        ExecuteCommand(ecSelLineStart,
                       #0,
                       nil);
      end;
    Exit;
  end;

  // Object was draged from R explorer interface
  if (Source = frmTools.lvRexplorer) then begin
    if FileExists(sDragSource) then begin
      pOpenFileIntoTinn(sDragSource,
                        0,
                        False,
                        False);
      DeleteFile(sDragSource);
    end
    else fMessageDlg(sDragSource + #13 + #13 +
                     'The file above was not found!',
                     mtWarning,
                     [mbOk],
                     0);
    Exit;
  end;

  // Object was draged from Project interface
  if (Source = frmTools.tvProject) then begin
    if (iDragLevel = 0) then pOpenAllFiles;
    if (iDragLevel = 1) then pOpenAllFilesOfGroup;
    if (sDragSource = EmptyStr) then Exit;
  end;

  if FileExists(sDragSource) then pOpenFileIntoTinn(sDragSource)
                             else fMessageDlg(sDragSource + #13 + #13 +
                                              'The file above was not found!',
                                              mtWarning,
                                              [mbOk],
                                              0);
end;

procedure TfrmMain.menHelpEnglishChanges_t2tClick(Sender: TObject);
begin
  pOpenHelpFile('\doc\Tinn-R_changes.t2t');
end;

{$HINTS OFF}
procedure TfrmMain.pCreateProject;
var
  tnProject: TTreeNode;

begin
  with frmTools.tvProject do begin
    Items.BeginUpdate;

    if Assigned(slProjectChanges) then slProjectChanges.Clear;

    if (Items.Count > 0) then begin
      Items.Clear;
      frmTools.tvProject.Refresh;
    end;

    SortType      := stText;
    tnProject     := Items.Add(nil,
                               ExtractFileName(sProjectName));
    tnGenericGroup:= Items.AddChild(tnProject,
                                    'generic group*');
    tnGenericGroup.ImageIndex   := 1;
    tnGenericGroup.SelectedIndex:= 1;
    FullExpand;
    Items.EndUpdate;
  end;
end;
{$HINTS ON}

{$WARNINGS OFF}
function TfrmMain.fGenericGroupExists: boolean;
var
  i: integer;

  meTmp: TMemo;

  sTmp: string;

begin
  meTmp:= TMemo.Create(nil);
  try
    meTmp.Parent:= panInvisibleParent;
    meTmp.Width := 1000;
    try
      meTmp.Lines.LoadFromFile(sProjectName);
      Result:= False;
      for i:= 0 to (meTmp.Lines.Count - 1) do begin
        sTmp:= trim(meTmp.Lines[i]);
        if (Pos('generic group*',
                lowerCase(sTmp)) <> 0) then begin
          Result:= True;
          Exit;
        end;
      end;
    except
      on E: EFOpenError do
      begin
        fMessageDlg(sProjectName + #13 + #13 +
                    'File not found!',
                    mtError,
                    [mbOk],
                    0);
        Exit;
      end; // em E: EFOpenError fazer
    end; // except
  finally
    FreeAndNil(meTmp);
  end;
end;
{$WARNINGS ON}

procedure TfrmMain.pSortProject;
var
  j: integer;

begin
  with frmTools.tvProject do begin
    Items.BeginUpdate;
    for j:= 0 to (Items.Count - 1) do
      if (Items[j].Level <= 1) then Items[j].AlphaSort(True);
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.pOpenProject;
var
  sTmp,
   sGroupName: string;

  tnProject,
   tnGroupToAdd,
   tnFileToAdd: TTreeNode;

  procedure pMakeTree;
  var
    i: integer;

  begin
    tnProject:= nil; tnGroupToAdd:= nil; tnFileToAdd:= nil;
    frmTools.tvProject.SortType:= stText;
    tnProject:= frmTools.tvProject.Items.Add(tnProject,
                                             ExtractFileName(sProjectName));
    if not fGenericGroupExists then begin
      tnGenericGroup:= frmTools.tvProject.Items.AddChild(tnProject,
                                                         'generic group*');
      tnGenericGroup.ImageIndex   := 1;
      tnGenericGroup.SelectedIndex:= 1;
    end;

    for i:= 0 to (slProject.Count - 1) do begin
      sTmp:= trim(slProject.Strings[i]);
      if (sTmp <> EmptyStr) then begin
        if (sTmp[1] = '\') then begin  // Is a group
          sGroupName  := StringReplace(sTmp,
                                       '\',
                                       EmptyStr,
                                       []);

          tnGroupToAdd:= frmTools.tvProject.Items.AddChild(tnProject,
                                                           sGroupName);

          tnGroupToAdd.ImageIndex   := 1;
          tnGroupToAdd.SelectedIndex:= 1;
        end
        else  // Is not a group
        begin
          if (sGroupName <> EmptyStr) then begin  // Is file and file pertain at last group
            tnFileToAdd:= frmTools.tvProject.Items.AddChild(tnGroupToAdd,
                                                            ExtractFileName(sTmp));
            tnFileToAdd.Data:= PChar(slProject.Strings[i]);
            tnFileToAdd.ImageIndex   := 2;
            tnFileToAdd.SelectedIndex:= 3;
          end
          else begin  // Is file and file pertain at project (root): it will be put into the generic group*
            tnFileToAdd:= frmTools.tvProject.Items.AddChild(tnGenericGroup,
                                                            ExtractFileName(sTmp));
            tnFileToAdd.Data:= PChar(slProject.Strings[i]);
            tnFileToAdd.ImageIndex   := 2;
            tnFileToAdd.SelectedIndex:= 3;
          end;
        end;
      end;
    end; // for
  end;

begin
  try  // Exception id file not exixts
    if Assigned(slProject) then slProject.Clear;
    slProject:= TStringList.Create;
    slProject.LoadFromFile(sProjectName);
  except
    on E: EFOpenError do begin
      fMessageDlg(sProjectName + #13 + #13 +
                  'File not found!',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;
  end; // except

  with frmTools.tvProject do begin
    Items.BeginUpdate;
    Items.Clear;
    pMakeTree;
    Items[0].Expanded:= True;
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.pAddFile(iFile: string);

  function fVerifyGenericGroup: boolean;
  var
    i: integer;

  begin
    Result:= False;

    with frmTools.tvProject do
      for i:= 0 to (Items.Count - 1) do
        if (Items[i].Level = 1) then
          if (lowerCase(Items[i].Text) = 'generic group*') then begin
            Items[i].Selected:= True;
            Result:= True;
            Exit;
          end;
  end;

var
  iGroupPos: integer;

  tnChildNode: TTreeNode;

begin
  if (frmTools.tvProject.Selected = nil) then Exit;

  // Check to see if the file has already been added
  if (fFileExistsAsNode(iGroupPos,
                        iFile)) then begin
    if (fMessageDlg(iFile + #13 + #13 +
                    'The file above already exists in the active project at position:' + #13 +
                    'Index: ' + IntToStr(iGroupPos + 1)+ #13 + #13 +
                    'Do you like to add this file anyway?',
                    mtWarning,
                    [mbYes, mbNo],
                    0) <> mrYes) then Exit;
  end;

  if (frmTools.tvProject.Selected.Level = 1) then begin
    tnChildNode              := frmTools.tvProject.Items.AddChild(frmTools.tvProject.Selected, ExtractFileName(iFile));
    tnChildNode.Data         := PChar(iFile);
    tnChildNode.ImageIndex   := 2;
    tnChildNode.SelectedIndex:= 3;
    frmTools.tvProject.Selected.Expand(True);
    bProjectChanged:= True;
    frmTools.tvProject.AlphaSort;
  end
  else if (frmTools.tvProject.Selected.Level = 2) then begin
    tnChildNode              := frmTools.tvProject.Items.Add(frmTools.tvProject.Selected,
                                                             ExtractFileName(iFile));
    tnChildNode.Data         := PChar(iFile);
    tnChildNode.ImageIndex   := 2;
    tnChildNode.SelectedIndex:= 3;
    frmTools.tvProject.Selected.Expand(True);
    bProjectChanged:= True;
    frmTools.tvProject.AlphaSort;
  end
  else begin
    if fVerifyGenericGroup then begin  // Generic group exists then select it
      tnChildNode              := frmTools.tvProject.Items.AddChild(frmTools.tvProject.Selected,
                                                                    ExtractFileName(iFile));
      tnChildNode.Data         := PChar(iFile);
      tnChildNode.ImageIndex   := 2;
      tnChildNode.SelectedIndex:= 3;
      frmTools.tvProject.Selected.Expand(True);
      bProjectChanged:= True;
      frmTools.tvProject.AlphaSort;
    end
    else
      if (fMessageDlg(iFile + #13 + #13 +
                      'No group was selected to this task!' + #13 +
                      'So, is not possible to add the file above because not exists a generic group*.' + #13 +
                      'Would you like to do this now?',
                      mtConfirmation,
                      [mbYes,mbCancel],
                      0) = mrYes) then begin
        pCreateGroup('generic group*');
        pAddFile(iFile);
      end;
  end;
end;

procedure TfrmMain.pSaveProject;
var
  i: integer;

  meTmp: TMemo;

  sTmpData,
   sTmpText: string;

begin
  // Save the file list to the project name
  meTmp       := TMemo.Create(nil);
  meTmp.Parent:= panInvisibleParent;
  with frmTools.tvProject do begin
    for i:= 1 to (Items.Count - 1) do begin
      sTmpData:= string(Items[i].Data);
      sTmpText:= string(Items[i].Text);
      sTmpText:= StringReplace(sTmpText,
                               '\',
                               EmptyStr,
                               []);

      if (Items[i].Level = 1) then begin  // Always save the groups
        if (sTmpText <> EmptyStr) then meTmp.Lines.Add('\' +
                                                       sTmpText)  // Control new groups created
                             else meTmp.Lines.Add('\generic group*');
      end
      else if (Items[i].Level = 2) then begin
        if sTmpData[1] = ' ' then meTmp.Lines.Add(sTmpData)
                             else meTmp.Lines.Add('  ' +
                                                  sTmpData)
      end;
    end;
  end;
  meTmp.Lines.SaveToFile(sProjectName);
  FreeAndNil(meTmp);
  bProjectChanged:= False;

  // Update the textual project, if it is opened
  i:= fFindWindowByName(sProjectName);
  if (i > -1) then begin
    Self.MDIChildren[i].BringToFront;
    actReloadExecute(nil);
  end;
end;

function TfrmMain.fGroupExistsAsNode(sGroupName: string): boolean;
var
  i: integer;

begin
  Result:= False;
  for i:= 0 to (frmTools.tvProject.Items.Count - 1) do begin
    if (frmTools.tvProject.Items[i].Text = sGroupName) then begin
      Result:= True;
      break;
    end;
  end;
end;

function TfrmMain.fFileExistsAsNode(var iPos: integer;
                                        sFile: string): boolean;
var
  i: integer;

begin
  Result:= False;
  for i:= 0 to (frmTools.tvProject.Items.Count - 1) do
    if (LowerCase(trim(Pchar(frmTools.tvProject.Items[i].Data))) = LowerCase(trim(sFile))) then begin
      iPos  := i;
      Result:= True;
      break;
    end;
end;

procedure TfrmMain.pCreateGroup(sGroupName: string);
var
  tnNewGroup: TTreeNode;

begin
  try
    tnNewGroup:= frmTools.tvProject.Items.AddChild(frmTools.tvProject.Items[0],
                                                   sGroupName);
    tnNewGroup.ImageIndex   := 1;
    tnNewGroup.SelectedIndex:= 1;
  except
    on ETreeViewError do
      fMessageDlg('It is necessary first to open or to create a project!',
                  mtWarning,
                  [mbOk],
                  0);
  end;
end;

procedure TfrmMain.pOpenAllFiles;
var
  bIgnoreAll: boolean;

  i,
   j: integer;

  sTmp: string;

  userOption: TModalResult;

begin
  with frmTools.tvProject do begin
    bIgnoreAll:= False;
    for j:= 1 to (Items.Count - 1) do begin
      if (Items[j].Level = 2) then begin
        sTmp:= trim(string(Items[j].Data));

        if FileExists(sTmp) then pOpenFileIntoTinn(sTmp)
        else if not bIgnoreAll then begin
          userOption:= fMessageDlg(sTmp + #13 + #13 +
                                   'The file above was not found!' + #13 +
                                   'Would you like to ignore it?',
                                   mtConfirmation,
                                   [mbYes, mbYesToAll, mbCancel],
                                   0);

          i:= fFindTopWindow;
          if Assigned(Self.MDIChildren[i] as TfrmEditor) then
            (Self.MDIChildren[i] as TfrmEditor).Refresh;

          case userOption of
            mrYesToAll: bIgnoreAll:= True;
            mrCancel: Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.pOpenAllFilesOfGroup;
var
  bIgnoreAll: boolean;

  i,
   j,
   iFiles: integer;

  sTmp: string;

  tnCurNode: TTreeNode;

  userOption: TModalResult;

begin
  with frmTools.tvProject do begin
    if (Selected = nil) or
       (Selected.Level <> 1) then Exit;
    bIgnoreAll:= False;
    j:= Selected.AbsoluteIndex;
    tnCurNode:= Items[j];  // Important don't remove!
    iFiles   := Items[j].Count;

    while iFiles > 0 do begin
      tnCurNode:= tnCurNode.GetNext;
      sTmp     := trim(string(tnCurNode.Data));

      if FileExists(sTmp) then pOpenFileIntoTinn(sTmp)
      else if not bIgnoreAll then begin
        userOption:= fMessageDlg(sTmp + #13 + #13 +
                                 'The file above was not found!' + #13 +
                                 'Would you like to ignore it?',
                                 mtConfirmation,
                                 [mbYes, mbYesToAll, mbCancel],
                                 0);
        i:= fFindTopWindow;
        if Assigned(Self.MDIChildren[i] as TfrmEditor) then
          (Self.MDIChildren[i] as TfrmEditor).Refresh;

        case userOption of
          mrYesToAll: bIgnoreAll:= True;
          mrCancel: Exit;
        end;
      end;
      dec(iFiles);
    end;
  end;
end;

function TfrmMain.fCloseAllFilesOfProject: boolean;
var
  i,
   iPos: integer;

  sFileName: string;

begin
  // Close all the files of the current project
  Result:= True;
  with frmTools.tvProject do
    for i:= 0 to (Items.Count - 1) do
      if (Items[i].Level = 2) then begin
        sFileName:= trim(string(Items[i].Data));
        iPos:= fFindWindowByName(sFileName);
        try
          if (iPos > -1) then
            with (MDIChildren[iPos] as TfrmEditor) do begin
              bCloseCanceled:= False;
              Close;
              if bCloseCanceled then begin
                Result:= False;
                Exit;
              end;
            end;
        except
          fMessageDlg(sFileName + #13 + #13 +
                      'The file above occurs more than a time in the project!',
                      mtInformation,
                      [mbOk],
                      0);
        end;
      end;
end;

procedure TfrmMain.pCloseAllFilesOfGroup;
var
  iPos,
   j,
   iFiles: integer;

  sTmp: string;

  tnCurNode: TTreeNode;

begin
  // Close all the files of the current project
  with frmTools.tvProject do begin
    if (Selected = nil) or
       (Selected.Level <> 1) then Exit;
    j:= Selected.AbsoluteIndex;
    tnCurNode:= Items[j];  // Important not remove!
    iFiles   := Items[j].Count;

    while iFiles > 0 do begin
      tnCurNode:= tnCurNode.GetNext;
      sTmp     := trim(string(tnCurNode.Data));
      iPos     := fFindWindowByName(sTmp);
      try
        if (iPos > -1) then (MDIChildren[iPos] as TfrmEditor).Close;
      except
        fMessageDlg(sTmp + #13 + #13 +
                    'The file above occurs more than a time in this group!',
                    mtInformation,
                    [mbOk],
                    0);
      end;
      dec(iFiles);
    end;
  end;
end;

procedure TfrmMain.actGrouptNewExecute(Sender: TObject);
var
  newGroup: TfrmNewGroup;

begin
  newGroup:= TfrmNewGroup.Create(Self);
  with newGroup do begin
    if (ShowModal = mrOK) then begin
      if (edtNewGroup.Text <> EmptyStr) then begin
        if not fGroupExistsAsNode(edtNewGroup.Text) then begin
          pCreateGroup(edtNewGroup.Text);
          bProjectChanged:= True;
        end
        else fMessageDlg(edtNewGroup.Text + #13 + #13 +
                         'A group with this name already exists in this project!',
                         mtError,
                         [mbOk],
                         0);
      end;
      Close;
    end;
  end;
  FreeAndNil(newGroup);
  pSortProject;
end;

Procedure TfrmMain.pUpdateRterm_Appearance(bUpdate_FontSize: boolean = True);
var
  i,
   j: integer;

begin
  i:= 0;
  j:= 0;
  
  if (not bUpdate_FontSize) then begin
    i:= frmRterm.synIO.Font.Size;

    if Assigned(frmRterm.synLog2) then j:= frmRterm.synLog2.Font.Size
                                  else j:= frmRterm.synLog.Font.Size;
  end;

  with coEditor do begin
    AssignTo(frmRterm.synIO);

    if Assigned(frmRterm.synLog2) then AssignTo(frmRterm.synLog2)
                                  else AssignTo(frmRterm.synLog);
  end;

  if (not bUpdate_FontSize) then begin
    frmRterm.synIO.Font.Size:= i;

    if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Font.Size:= j
                                  else frmRterm.synLog.Font.Size:= j;
  end;

  // Not all options of the editor are suitable to synIO
  with frmRterm.synIO do begin
    // Gutter
    Gutter.ShowLineNumbers:= False;  // Fixed vaule!
    Gutter.Width          := 15;     // It is necessary to gutter be visible when ShowLineNumbers is False and Gutter.Visible is True;
                                     // and to be a small value.

    // Options
    Options:= Options - [eoShowSpecialChars];  // Not necessary

    // Appearance
    if bActiveLine then ActiveLineColor:= clActiveLine
                   else ActiveLineColor:= clNone;

    RightEdge:= 0;
  end;

  // Not all options of the editor are suitable to synLog
  with frmRterm.synLog do begin
    // Gutter
    Gutter.ShowLineNumbers:= False;  // Fixed vaule!
    Gutter.Width          := 15;     // Fixed vaule!

    // Options
    Options:= Options - [eoShowSpecialChars];

    // Appearance
    if bActiveLine then ActiveLineColor:= clActiveLine
                   else ActiveLineColor:= clNone;

    RightEdge:= 0;
  end;

  // Not all options of the editor are suitable to synLog2
  if Assigned(frmRterm.synLog2) then
    with frmRterm.synLog2 do begin
      // Gutter
      Gutter.ShowLineNumbers:= False;  // Fixed vaule!
      Gutter.Width          := 15;     // Fixed vaule!

      // Options
      Options:= Options - [eoShowSpecialChars];

      // Appearance
      if bActiveLine then ActiveLineColor:= clActiveLine
                     else ActiveLineColor:= clNone;

      RightEdge:= 0;
    end;
end;

Procedure TfrmMain.pUpdateAppearance(bFontSize: boolean = True);
begin
  // Update transparency
  AlphaBlendValue:= iAlphaBlendValue;

  pUpdateRterm_Appearance(bFontSize);

  // WinExpl - BG
  frmTools.edWinExplorerFilter.Color:= clBGApplication;
  frmTools.jvdcWinExplorer.Color    := clBGApplication;
  frmTools.jvdlbWinExplorer.Color   := clBGApplication;
  frmTools.jvflbWinExplorer.Color   := clBGApplication;

  // WinExpl - FG
  frmTools.edWinExplorerFilter.Font.Color:= clFGApplication;
  frmTools.jvdcWinExplorer.Font.Color    := clFGApplication;
  frmTools.jvdlbWinExplorer.Font.Color   := clFGApplication;
  frmTools.jvflbWinExplorer.Font.Color   := clFGApplication;

  // WorkExpl - BG
  frmTools.edWorkExplorerFilter.Color:= clBGApplication;
  frmTools.jvdcWorkExplorer.Color    := clBGApplication;
  frmTools.jvdlbWorkExplorer.Color   := clBGApplication;
  frmTools.jvflbWorkExplorer.Color   := clBGApplication;

  // WorkExpl - FG
  frmTools.edWorkExplorerFilter.Font.Color:= clFGApplication;
  frmTools.jvdcWorkExplorer.Font.Color    := clFGApplication;
  frmTools.jvdlbWorkExplorer.Font.Color   := clFGApplication;
  frmTools.jvflbWorkExplorer.Font.Color   := clFGApplication;

  // Project - BG
  frmTools.tvProject.Color:= clBGApplication;

  // Project - FG
  frmTools.tvProject.Font.Color:= clFGApplication;

  // Markup - BG
  frmTools.jvivAccents.Color         := clBGApplication;
  frmTools.jvivArrowBoth.Color       := clBGApplication;
  frmTools.jvivArrowBox.Color        := clBGApplication;
  frmTools.jvivArrowDown.Color       := clBGApplication;
  frmTools.jvivArrowLeft.Color       := clBGApplication;
  frmTools.jvivArrowRight.Color      := clBGApplication;
  frmTools.jvivArrowSloped.Color     := clBGApplication;
  frmTools.jvivArrowUp.Color         := clBGApplication;
  frmTools.jvivBar.Color             := clBGApplication;
  frmTools.jvivBracket.Color         := clBGApplication;
  frmTools.jvivDot.Color             := clBGApplication;
  frmTools.jvivGeometryAngle.Color   := clBGApplication;
  frmTools.jvivGeometryBox.Color     := clBGApplication;
  frmTools.jvivGeometryCircle.Color  := clBGApplication;
  frmTools.jvivGeometryDiamond.Color := clBGApplication;
  frmTools.jvivGeometryLine.Color    := clBGApplication;
  frmTools.jvivGeometryMisc.Color    := clBGApplication;
  frmTools.jvivGeometryStar.Color    := clBGApplication;
  frmTools.jvivGeometryTriangle.Color:= clBGApplication;
  frmTools.jvivGeometryVar.Color     := clBGApplication;
  frmTools.jvivGreekLower.Color      := clBGApplication;
  frmTools.jvivGreekMisc.Color       := clBGApplication;
  frmTools.jvivGreekUpper.Color      := clBGApplication;
  frmTools.jvivGreekVar.Color        := clBGApplication;
  frmTools.jvivMathFunction.Color    := clBGApplication;
  frmTools.jvivMathLogical.Color     := clBGApplication;
  frmTools.jvivMathMisc.Color        := clBGApplication;
  frmTools.jvivMathSet.Color         := clBGApplication;
  frmTools.jvivMathVar.Color         := clBGApplication;
  frmTools.jvivMisc.Color            := clBGApplication;
  frmTools.jvivNegation.Color        := clBGApplication;
  frmTools.jvivOperator.Color        := clBGApplication;
  frmTools.jvivRelation.Color        := clBGApplication;
  frmTools.jvivSkyAstrology.Color    := clBGApplication;
  frmTools.jvivSkySolar.Color        := clBGApplication;
  frmTools.jvivSkyVar.Color          := clBGApplication;
  frmTools.jvivUserCustom.Color      := clBGApplication;

  // Results - BG
  frmTools.memIniLog.Color:= clBGApplication;
  frmTools.tvSearch.Color := clBGApplication;
  frmTools.ATBinHex.Color := clBGApplication;

  // Results - FG
  frmTools.memIniLog.Font.Color:= clFGApplication;
  frmTools.tvSearch.Font.Color := clFGApplication;
  frmTools.ATBinHex.Font.Color := clFGApplication;

  // Spell - BG
  frmTools.memSpell.Color:= clBGApplication;

  // Spell - FG
  frmTools.memSpell.Font.Color:= clFGApplication;

  // Rcard - BG
  frmTools.dbgRcard.Color   := clBGApplication;
  frmTools.dbRcardMemo.Color:= clBGApplication;
  frmTools.lbRcard.Color    := clBGApplication;

  // Rcard - FG
  frmTools.dbgRcard.Font.Color   := clFGApplication;
  frmTools.dbRcardMemo.Font.Color:= clFGApplication;
  frmTools.lbRcard.Font.Color    := clFGApplication;

  // Rmirrors - BG
  frmTools.dbeRmirrorsCode.Color:= clBGApplication;
  frmTools.dbeRmirrorsHost.Color:= clBGApplication;
  frmTools.dbeRmirrorsURL.Color := clBGApplication;
  frmTools.dbgRmirrors.Color    := clBGApplication;
  frmTools.lbCountries.Color    := clBGApplication;

  // Rmirrors - FG
  frmTools.dbeRmirrorsCode.Font.Color:= clFGApplication;
  frmTools.dbeRmirrorsHost.Font.Color:= clFGApplication;
  frmTools.dbeRmirrorsURL.Font.Color := clFGApplication;
  frmTools.dbgRmirrors.Font.Color    := clFGApplication;
  frmTools.lbCountries.Font.Color    := clFGApplication;

  // Completion - BG
  frmTools.dbCompletionMemo.Color:= clBGApplication;
  frmTools.dbgCompletion.Color   := clBGApplication;
  frmTools.lbCompletion.Color    := clBGApplication;

  // Completion - FG
  frmTools.dbCompletionMemo.Font.Color:= clFGApplication;
  frmTools.dbgCompletion.Font.Color   := clFGApplication;
  frmTools.lbCompletion.Font.Color    := clFGApplication;

  // Comments - BG
  frmTools.dbgComments.Color     := clBGApplication;

  // Comments - FG
  frmTools.dbgComments.Font.Color:= clFGApplication;

  // Shortcuts - BG
  frmTools.dbgShortcuts.Color   := clBGApplication;
  frmTools.dbShortcutsMemo.Color:= clBGApplication;
  frmTools.lbShortcuts.Color    := clBGApplication;

  // Completion - FG
  frmTools.dbgShortcuts.Font.Color   := clFGApplication;
  frmTools.dbShortcutsMemo.Font.Color:= clFGApplication;
  frmTools.lbShortcuts.Font.Color    := clFGApplication;

  // R explorer - BG
  frmTools.cbbToolsREnvironment.Color  := clBGApplication;
  frmTools.cbbToolsRExplorer.Color     := clBGApplication;
  frmTools.edToolsRExplorerFilter.Color:= clBGApplication;
  frmTools.lvRexplorer.Color           := clBGApplication;

  // R explorer - FG
  //edToolsRExplorerFilter.Font.Color:= clFGApplication;
  frmTools.cbbToolsREnvironment.Font.Color:= clFGApplication;
  frmTools.cbbToolsRExplorer.Font.Color   := clFGApplication;
  frmTools.lvRexplorer.Font.Color         := clFGApplication;

  // TabSelected - BG
  pgFiles.TabSelectedStyle.BackgrColor     := clBGTabSelectedNew;
  with frmTools do begin
    pgdatabase.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
    pgLatex.TabSelectedStyle.BackgrColor   := clBGTabSelectedNew;
    pgMarkup.TabSelectedStyle.BackgrColor  := clBGTabSelectedNew;
    pgMisc.TabSelectedStyle.BackgrColor    := clBGTabSelectedNew;
    pgR.TabSelectedStyle.BackgrColor       := clBGTabSelectedNew;
    pgResults.TabSelectedStyle.BackgrColor := clBGTabSelectedNew;
    pgTools.TabSelectedStyle.BackgrColor   := clBGTabSelectedNew;
    pgTxt2Tags.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;
  end;

  with frmRterm do
    frmRterm.pgRterm.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  with frmTools.jvflbWinExplorer do begin
    Items.BeginUpdate;
    Refresh;
    Items.EndUpdate;
  end;
  if (frmTools.pgTools.ActivePage = frmTools.tbsMisc) and
     (frmTools.pgMisc.ActivePage = frmTools.tbsRcard) then frmTools.lbRcard.SetFocus;

  ctbMain.Realign;  // Don't remove!
  pUpdateAppearance;

  // Check user option related to dock satus
  if FileExists(sIniDockFilePath) and
     bRestoreIniDock then begin
    frmTools.Visible       := True;
    actToolsVisible.Checked:= True;
    frmRterm.Visible       := True;
    actRtermVisible.Checked:= True;
    DeleteFile(sIniDockFilePath);  // Delete old Tinn_dock.ini
    bRestoreIniDock:= False;
  end;

  // The below is a bit strange but is necessary to show the forms (Rterm and Rtools)
  // when it is float and visible (restarting).
  //--------------------------------------
  with frmTools do
    ManualDock(JvDockServer.LeftDockPanel,
               nil,
               AlClient);

  with frmRterm do
    ManualDock(JvDockServer.RightDockPanel,
               nil,
               AlClient);
  //--------------------------------------

  // Load the layout from the Tinn_doc.ini file
  if FileExists(sIniDockFilePath) then begin
    JvAppIniFileStorage.BeginUpdate;
    try
      LoadDockTreeFromAppStorage(JvAppIniFileStorage);
    finally
      JvAppIniFileStorage.EndUpdate;
    end;
  end
  else begin
    actToolsVisible.Checked:= True;
    actRtermVisible.Checked:= True;

    ShowDockForm(frmTools);
    ShowDockForm(frmRterm);

    actRtermDivideExecute(nil);
    pSetInterfaceSize(frmTools,
                      350);
  end;

{ // For tests only!
  ifTinn_Tmp:= TIniFile.create(sPath_App + '\Tinn_dock.ini');
  ShowMessage(ifTinn_Tmp.ReadString('Forms\frmTools', 'ParentName', ''));
  ShowMessage(IntToStr(ifTinn_Tmp.ReadInteger('Forms\frmTools', 'DockTop', 0)));
  ShowMessage(IntToStr(ifTinn_Tmp.ReadInteger('Forms\frmTools', 'DockRight', 0)));
  ShowMessage(IntToStr(ifTinn_Tmp.ReadInteger('Forms\frmTools', 'DockBottom', 0)));
  ShowMessage(BoolToStr(ifTinn_Tmp.ReadBool('Forms\frmTools', 'Visible', False)));
  FreeAndNil(ifTinn_Tmp);
}
  actToolsVisible.Checked:= GetFormVisible(frmTools);
  actRtermVisible.Checked:= GetFormVisible(frmRterm);

  with frmRterm.pgRterm do
    ActivePage:= frmRterm.tbsIO;

  // Rterm
  if bRtermSingle then  // IO and Log in the same view
    if bRtermHorizontal then actRtermIOSplitHorizontalExecute(nil)
                        else actRtermIOSplitVerticalExecute(nil)
    else                // IO and Log in distinct view
      actRtermIOSplitRemoveExecute(nil);

  cbSpellLanguage.ItemIndex:= ifTinn.ReadInteger('App',
                                                 'iSpellLanguage.ItemIndex',
                                                 -1);

  if FileExists(sPathColor_Custom) then cdMain.CustomColors.LoadFromFile(sPathColor_Custom);

  tRRuning.Enabled:= True;  // Do no remove from here!

  AlphaBlendValue:= iAlphaBlendValue;

  // Very nice: from http://stackoverflow.com/questions/374304/how-can-i-make-delphi-2009-open-my-application-in-the-second-monitor-by-default?rq=1
  if (DebugHook <> 0) and (Screen.MonitorCount > 1) then Left:= Screen.Monitors[1].Left;
end;

procedure TfrmMain.actGroupDeleteCurrentExecute(Sender: TObject);
begin
  with frmTools.tvProject do
    if (Selected = nil) or
       (Selected.Level <> 1) then Exit;

  with frmTools.tvProject.Selected do
    if (Level = 1) then begin
      Delete;
      bProjectChanged:= True;
      pSortProject;
    end;
end;

procedure TfrmMain.actGroupDeleteAllExecute(Sender: TObject);
begin
  with frmTools.tvProject.Items[0] do
    if (Count > 0) then begin
      DeleteChildren;
      bProjectChanged:= True;
    end;
end;

procedure TfrmMain.actProjectDeleteCurrentExecute(Sender: TObject);
var
  intPos: integer;

begin
  if (fMessageDlg(sProjectName + #13 + #13 +
                  'Confirm the delection of the current project?',
                  mtConfirmation,
                  [mbOk, mbCancel],
                  0) = mrOk) then begin
    fCloseAllFilesOfProject;

    pToolsProjectControls(False);
    if Assigned(slProjectChanges) then slProjectChanges.Clear;
    frmTools.tvProject.Items.Clear;
    DeleteFile(sProjectName);

    // Close project file if is open.
    intPos:= fFindWindowByName(sProjectName);
    if (intPos > -1) then (MDIChildren[intPos] as TfrmEditor).Close;
    pUpdateMRU(menFileRecentFiles,
               sProjectName);

    pUpdateProjectMRU(menProjRecent,
                      sProjectName);

    with frmTools.jvflbWinExplorer do begin
      Items.BeginUpdate;
      Refresh;
      Items.EndUpdate;
    end;
  end;
end;

procedure TfrmMain.actGroupRenameExecute(Sender: TObject);
var
  renGroup: TfrmGroupRename;

begin
  with frmTools.tvProject do
    if (Selected = nil) or
       (Selected.Level <> 1) then Exit;
  renGroup:= TfrmGroupRename.Create(Self);

  with renGroup do begin
    edtOldGroupName.Text:= frmTools.tvProject.Selected.Text;
    edtNewGroupName.Text:= frmTools.tvProject.Selected.Text;
    if (ShowModal = mrOK) then begin
      if (edtNewGroupName.Text = EmptyStr) then Exit;
      if not fGroupExistsAsNode(edtNewGroupName.Text) then begin
        frmTools.tvProject.Selected.Text:= edtNewGroupName.Text;
        bProjectChanged:= True;
      end
      else fMessageDlg(edtNewGroupName.Text + #13 + #13 +
                       'A group with this name already exists in this project!',
                       mtError,
                       [mbOk],
                       0);
      Close;
    end;
  end;

  FreeAndNil(renGroup);
  pSortProject;
end;

procedure TfrmMain.actProjectSaveAsExecute(Sender: TObject);
var
  i: integer;

  meTmp: TMemo;

  sName,
   sTmpData,
   sTmpText: string;

  wFileAtt: word;

begin
  sdMain.InitialDir:= sWorkingDir;
  sName:= StringReplace(sProjectName,
                        '*',
                        EmptyStr,
                        [rfReplaceAll]);
  if bRemoveExtension then sName:= fRemove_FileExtension(sName);

  with sdMain do begin
    fileName  := sName;
    Filter    := 'Tinn-R project space (*.tps)|*.tps';
    DefaultExt:= '*.tps';
  end;

  if sdMain.Execute then begin
    sName:= sdMain.FileName;

    if FileExists(sName) then
      if (fMessageDlg(sName + #13 + #13 +
                      'Do you want to overwrite this file?',
                      mtConfirmation,
                      [mbYes, mbCancel],
                      0) <> idYes) then Exit;

    wFileAtt:= FileGetAttr(sName);
    wFileAtt:= wFileAtt and not SysUtils.faReadOnly;
    FileSetAttr(sName,
                wFileAtt);

    // Save the file list to the project name
    meTmp       := TMemo.Create(nil);
    meTmp.Parent:= panInvisibleParent;

    with frmTools.tvProject do begin
      for i:= 1 to (Items.Count - 1) do begin
        sTmpData:= string(Items[i].Data);
        sTmpText:= string(Items[i].Text);
        sTmpText:= StringReplace(sTmpText,
                                 '\',
                                 EmptyStr,
                                 []);
        if (Items[i].Level = 1) then begin
          if (sTmpText <> EmptyStr) then meTmp.Lines.Add('\' +
                                                         sTmpText)
                              else meTmp.Lines.Add('\generic group*');
        end
        else if (Items[i].Level = 2) then begin
          if (sTmpData[1] = ' ') then meTmp.Lines.Add(sTmpData)
                                 else meTmp.Lines.Add('  ' +
                                                      sTmpData);
        end
      end;
    end;

    meTmp.Lines.SaveToFile(sName);
    FreeAndNil(meTmp);
    bProjectChanged:= False;

    pUpdateProjectMRU(menProjRecent,
                      sName);

    with frmTools.tvProject do begin
      Items[0].Collapse(True);
      Items.Clear;
    end;
    Sleep(iDelay div 3);
    sProjectName:= sName;
    pOpenFileIntoTinn(sProjectName);
  end;
  sdMain.Filter:= slFilters.Text;
end;

{$WARNINGS ON}
procedure TfrmMain.actFilesRemoveAllOfProjectExecute(Sender: TObject);
var
  i: integer;

begin
  try
    with frmTools.tvProject do
      for i:= 1 to (items.Count-1) do
        if (Items[i].Level = 1) then begin
          Items[i].DeleteChildren;
          if not bProjectChanged then bProjectChanged:= True;;
        end;
  except
    Exit;
  end;
end;

procedure TfrmMain.actFilesRemoveAllOfGroupExecute(Sender: TObject);
begin
  with frmTools.tvProject.Selected do
    if (level = 1) then begin
      DeleteChildren;
      bProjectChanged:= True;
    end;
end;

procedure TfrmMain.actFilesAddExecute(Sender: TObject);
var
  i,
   j: integer;

begin
  // If (Sender is TTreeView) then
  with frmTools.tvProject do begin
    if (SelectionCount <= 0) then Exit;
    if (Selected.Level = 1) or
       (Selected.Level = 2) then begin
      with odMain do begin
        InitialDir:= sWorkingDir;
        Filter    := sdMain.Filter;
        Options   := Options +
                     [ofAllowMultiSelect];

        if Execute then
          with Files do begin
            if (slProjectChanges = nil) then slProjectChanges:= TStringList.Create;
            for i:= 0 to (Count-1) do begin
              slProjectChanges.Add(Strings[i]);
              j:= slProjectChanges.IndexOf(Strings[i]);
              pAddFile(slProjectChanges[j]);
            end;
          end;
        Options:= Options - [ofAllowMultiSelect];
      end;
    end;
  end;
end;

procedure TfrmMain.actFilesOpenAllOfGroupExecute(Sender: TObject);
begin
  pOpenAllFilesOfGroup;
end;

procedure TfrmMain.actFilesCloseAllOfGroupExecute(Sender: TObject);
begin
  pCloseAllFilesOfGroup;
end;

procedure TfrmMain.pToolsProjectControls(bOption: boolean);
begin
  actFilesAdd.Enabled               := bOption;
  actFilesAddCurrent.Enabled        := bOption;
  actFilesCloseAll.Enabled          := bOption;
  actFilesCloseAllOfGroup.Enabled   := bOption;
  actFilesFullPathUnix.Enabled      := bOption;
  actFilesFullPathWindows.Enabled   := bOption;
  actFilesOpenAll.Enabled           := bOption;
  actFilesOpenAllOfGroup.Enabled    := bOption;
  actFilesRemove.Enabled            := bOption;
  actFilesRemoveAllOfGroup.Enabled  := bOption;
  actFilesRemoveAllOfProject.Enabled:= bOption;
  actGroupCollapseAll.Enabled       := bOption;
  actGroupDeleteAll.Enabled         := bOption;
  actGroupDeleteCurrent.Enabled     := bOption;
  actGroupExpandAll.Enabled         := bOption;
  actGroupRename.Enabled            := bOption;
  actGrouptNew.Enabled              := bOption;
  actProjectClose.Enabled           := bOption;
  actProjectDeleteCurrent.Enabled   := bOption;
  actProjectEdit.Enabled            := bOption;
  actProjectOpenNode.Enabled        := bOption;
  actProjectReload.Enabled          := bOption;
  actProjectSave.Enabled            := bOption;
  actProjectSaveAs.Enabled          := bOption;
end;

procedure TfrmMain.pToolsSearchControls(bOption: boolean);
begin
  actSearchCollapseAll.Enabled:= bOption;
  actSearchCollapseOne.Enabled:= bOption;
  actSearchExpandAll.Enabled  := bOption;
  actSearchExpandOne.Enabled  := bOption;
end;

procedure TfrmMain.edFilterKeyDown(Sender: TObject;
                                       var Key: Word;
                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) then tbFilterClick(nil);
end;

procedure TfrmMain.ESS1Click(Sender: TObject);
begin
  pOpen_Url('http://ess.r-project.org/');
end;

procedure TfrmMain.actGroupExpandAllExecute(Sender: TObject);
var
  tnSelected,
   tnOldSelected: TTreeNode;

begin
  with frmTools.tvProject do begin
    if (Items.Count = 0) then Exit;
    tnOldSelected:= Selected;

    if (Selected.Level > 1) then tnSelected:= Selected.Parent
                            else tnSelected:= Selected;
    Items.BeginUpdate;
    FullExpand;
    TopItem := tnSelected;
    Selected:= tnOldSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.actGroupCollapseAllExecute(Sender: TObject);
var
  tnSelected: TTreeNode;

begin
  with frmTools.tvProject do begin
    if (Items.Count = 0) then Exit;
    if (Selected.Level > 1) then tnSelected:= Selected.Parent
                            else tnSelected:= Selected;

    Items.BeginUpdate;
    FullCollapse;
    Items[0].Expanded:= True;
    TopItem := tnSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.menHelExampleOfScriptClick(Sender: TObject);
begin
  pOpenHelpFile('\sample\Tinn-R_example of script.R');
end;

procedure TfrmMain.menHelpRecognizedWordsClick(Sender: TObject);
begin
  pOpenHelpFile('\doc\Tinn-R_recognized words.R');
end;

procedure TfrmMain.menOptionsShortcutsClick(Sender: TObject);
begin
  actShortcutsEditExecute(nil);
end;

procedure TfrmMain.actTobMiscVisibleExecute(Sender: TObject);
begin
  tobMisc.Visible          := not(tobMisc.Visible);
  actTobMiscVisible.Checked:= tobMisc.Visible;
end;

procedure TfrmMain.actTobViewVisibleExecute(Sender: TObject);
begin
  tobView.Visible         := not(tobView.Visible);
  actTobViewVisible.Checked:= tobView.Visible;
end;

procedure TfrmMain.actTobRVisibleExecute(Sender: TObject);
begin
  actTobRVisible.Checked:= not actTobRVisible.Checked;
  pRToolbar(actTobRVisible.Checked and actShowAllBars.Checked);
  Application.ProcessMessages;
  TBIniSavePositions(Self,
                     (sPathIniTinn_File),
                     EmptyStr);
end;

procedure TfrmMain.actBlockMarkExecute(Sender: TObject);
var
  bcB,
   bcE: TBufferCoord;

  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    bcB:= BlockBegin;
    bcE:= BlockEnd;
    if (bcB.Line <> bcE.Line) then begin
      CaretX:= 1;
      SetBookMark(0,
                  1,
                  bcB.Line);
      SetBookMark(1,
                  1,
                  bcE.Line);
    end;
  Refresh;
  end;
end;

procedure TfrmMain.actBlockUnmarkExecute(Sender: TObject);
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  end;
  with seEditor do begin
    ClearBookMark(0);
    ClearBookMark(1);
  end;
end;

procedure TfrmMain.actUnmarkAllExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  i: integer;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  end;

  with seEditor do
    for i:= 0 to 9 do
      ClearBookMark(i);
end;

procedure TfrmMain.menWebR_helpClick(Sender: TObject);
begin
  pOpen_Url('http://www.mail-archive.com/r-help@stat.math.ethz.ch/info.html');
end;

procedure TfrmMain.menWebRGuiTinnRLECClick(Sender: TObject);
begin
//  pOpen_Url('http://nbcgib.uesc.br/lec/software/editores/tinn-r/en');
  pOpen_Url('https://nbcgib.uesc.br/tinnr/en/');
end;

procedure TfrmMain.menWebRguiTinnRSourceForgeClick(Sender: TObject);
begin
  pOpen_Url('http://sourceforge.net/projects/tinn-r');
end;

procedure TfrmMain.menWebRGuiTinnRUserListClick(Sender: TObject);
begin
  pOpen_Url('http://groups.google.com/forum/?fromgroups#!forum/tinn-r');
end;

procedure TfrmMain.menHelCheckForUpdateClick(Sender: TObject);
var
  sUrl: string;

  IdHTTP: TIdHTTP;

begin
  if not fCheckConnection then begin
    Windows.Beep(600, 800);
    Exit;
  end;

  sUrl:= 'http://nbcgib.uesc.br/lec/update/new_version.txt';

  IdHTTP:= TIdHTTP.Create;
  with IdHTTP do
    try
      Request.UserAgent:= 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0';
      sUpdate:= IdHTTP.Get(sUrl);
      //ShowMessage(sUpdate);
    finally
      FreeAndNil(IdHTTP);
    end;

  // If wasn't done a new download: warning and exit!
  if (sUpdate = EmptyStr) then begin
    Windows.Beep(600, 800);
    fMessageDlg(sUrl + #13#13 +
                'The URL above is not available!' + #13 +
                'Please, check your internet connection or try again later.',
                mtWarning,
                [mbOk],
                0);
    Exit;
  end;

  with TfrmUpdater.Create(Self) do
    try
      ShowModal;
    finally
      frmMain.Refresh;
      FreeAndNil(frmUpdater);
      pSetFocus_Main;
    end;
end;

procedure TfrmMain.menHelCitationClick(Sender: TObject);
begin
  Clipboard.AsText:= 'Tinn-R Team (2018). Tinn-R Editor - GUI for R Language and Environment.' + #13 +
                     'URL http://nbcgib.uesc.br/lec/software/editores/tinn-r/en';

  fMessageDlg('Many thanks for cite Tinn-R.' + #13 + #13 +
              'The citation was put on clipboard!',
              mtWarning,
              [mbOk],
              0);

  pSetFocus_Main;
end;

procedure TfrmMain.actShowAppOptionsExecute(Sender: TObject);
var
  dlg: TfrmAppOptionsDlg;

  i: integer;

begin
  coEditor.Gutter.Visible        := actGutterVisible.Checked;
  coEditor.Gutter.ShowLineNumbers:= actLineNumbersVisible.Checked;

  if actSpecialCharVisible.Checked then coEditor.Options:= coEditor.Options +
                                                           [eoShowSpecialChars]
                                   else coEditor.Options:= coEditor.Options -
                                                           [eoShowSpecialChars];

  try
    dlg:= TfrmAppOptionsDlg.Create(Self);

    with dlg do begin
      if bIPLocal then rdgRTCPIPType.ItemIndex:= 0
                  else rdgRTCPIPType.ItemIndex:= 1;

      cbAllNames.Checked                 := bAllNames;
      cbCloseDVIViewer.Checked           := actCloseDVIViewer.Checked;
      cbClosePDFViewer.Checked           := actClosePDFViewer.Checked;
      cbComAutoDetect_Language.Checked   := frmTools.cbComAutoDetect_Language.Checked;
      cbComPriority_Line.Checked         := frmTools.cbComPriority_Line.Checked;
      cbConnectionBeepOnError.Checked    := bConnectionBeepOnError;
      cbDosMinimizedAlways.Checked       := actDosMinimizedAlways.Checked;
      cbDviOpenAlways.Checked            := actDviOpenAlways.Checked;
      cbHtmlOpenAlways.Checked           := actHtmlOpenAlways.Checked;
      cbLatexVisible.Checked             := actLatexVisible.Checked;
      cbMinimizeTinn.Checked             := bMinimizeTinnAfterLastFile;
      cbNotification.Checked             := actNotification.Checked;
      cbNotification_US.Checked          := actNotification_US.Checked;
      cbPdfOpenAlways.Checked            := actPdfOpenAlways.Checked;
      cbREcho.Checked                    := bREcho;
      cbRememberFileState.Checked        := bRememberFileState;
      cbRemoveExtension.Checked          := bRemoveExtension;
      cbRguiOrganizeAutomatically.Checked:= bOrganizeAutomatically;
      cbRguiReturnFocus.Checked          := bRguiReturnFocus;
      cbRMirros_Update.Checked           := bRMirros_Update;
      cbRSendAll.Checked                 := bRSendAll;
      cbRSetget_Info.Checked             := bRSetget_Info;
      cbRSetWorkDir_Starting.Checked     := bRSetWorkDir_Starting;
      cbRSmart.Checked                   := bRSmart;
      cbRsvSocket_Connect.Checked        := bRsvSocket_Connect;
      cbRTCPIPConsoleEcho.Checked        := bRTCPIPConsoleEcho;
      cbRTCPIPConsoleUse.Checked         := bRTCPIPConsoleUse;
      cbRtermCanFloat.Checked            := bRtermCanFloat;
      cbRTinnRcom_Install.Checked        := bRTinnRcom_Install;
      cbRTinnRcom_Load.Checked           := bRTinnRcom_Load;
      cbScrollSendingLines.Checked       := bScrollSendingLines;
      cbToolsCanFloat.Checked            := bToolsCanFloat;
      cbUndoAfterSave.Checked            := bUndoAfterSave;
      edFormatR.Text                     := sFormatR;
      edKnit.Text                        := sKnit;
      edMaxDeparseLength.Text            := IntToStr(iMaxDeparseLength);
      edParDeplate.Text                  := sParDeplate;
      edParDviBibtex.Text                := sParDviBibtex;
      edParDviSingle.Text                := sParDviSingle;
      edParPdfBibtex.Text                := sParPdfBibtex;
      edParPdfSingle.Text                := sParPdfSingle;
      edParRgui.Text                     := sParRgui;
      edParRPuTTY.Text                   := sParRPuTTY;
      edParRterm.Text                    := sParRterm;
      edParTxt2tags.Text                 := sParTxt2tags;
      edPath_Pandoc.Text                 := sPath_Pandoc;
      edRLibPathDefault.Text             := sRLibPathDefault;
      edPathDeplate_Converter.Text       := sPathDeplate_Converter;
      edPathDeplate_Interpreter.Text     := sPathDeplate_Interpreter;
      edPathR_Connected.Text             := sPath_R_Connected;
      edPathRgui.Text                    := sPath_Rgui;
      edPathRterm.Text                   := sPath_Rterm;
      edPathTinnRcom_Installed.Text      := sPathTinnRcom_Installed;
      edPathTxt2tags_Converter.Text      := sPathTxt2tags_Converter;
      edPathTxt2tags_Interpreter.Text    := sPathTxt2tags_Interpreter;
      edPuttyHost.Text                   := sPuttyHost;
      edPuttyPassword.Text               := sPuttyPassword;
      edPuttyUser.Text                   := sPuttyUser;
      edtIPHostLocal.Text                := sIPHostLocal;
      edtIPHostRemote.Text               := sIPHostRemote;
      edtIPPortLocal.Text                := intToStr(iIPPortLocal);
      edtIPPortRemote.Text               := intToStr(iIPPortRemote);
      edVersion_TinnRcomInstalled.Text   := sVersion_TinnRcomInstalled;
      rgRguiTinnR_Disposition.ItemIndex  := iRguiTinnR_Disposition;
      shBGApplication.Brush.Color        := clBGApplication;
      shBGApplication.Font.Color         := fContrast_Color(clBGApplication);
      shBGTabSelected.Brush.Color        := clBGTabSelectedNew;
      shBGTabSelected.Font.Color         := fContrast_Color(clBGTabSelectedNew);
      shFGApplication.Brush.Color        := clFGApplication;
      shFGApplication.Font.Color         := fContrast_Color(clFGApplication);
      shSampleApplication.Brush.Color    := clBGApplication;
      shSampleApplication.Font.Color     := clFGApplication;
      tbDelay.Position                   := iDelay;
      tbLastFile.Position                := iLastFile;
      tbLastSearch.Position              := iLastSearch;
      tbRguiTinnR_Proportion.Position    := iRguiTinnR_Proportion;
      tbTransparency.Position            := iTransparency;

      // Send to R
      cbRCurrentLineToTop.Checked         := actRCurrentLineToTop.Visible;
      cbRSendBlockMarked.Checked          := actRSendBlockMarked.Visible;
      cbRSendClipboard.Checked            := actRSendClipboard.Visible;
      cbRSendContiguous.Checked           := actRSendContiguous.Visible;
      cbRSendCursorToBeginningLine.Checked:= actRSendCursorToBeginningLine.Visible;
      cbRSendCursorToEndLine.Checked      := actRSendCursorToEndLine.Visible;
      cbRSendFile.Checked                 := actRSendFile.Visible;
      cbRSendKnitr.Checked                := bRKnitr;
      cbRSendLine.Checked                 := actRSendLine.Visible;
      cbRSendLinesToEndPage.Checked       := actRSendLinesToEndPage.Visible;
      cbRSendSelection.Checked            := actRSendSelection.Visible;
      cbRSendSmart.Checked                := actRSendSmart.Visible;
      cbRSendSweave.Checked               := actRSendSweave.Visible;

      // Controlling R
      cbRClearAll.Checked               := actRContClearAll.Visible;
      cbRClearConsole.Checked           := actRContClearConsole.Visible;
      cbRCloseAllGraphics.Checked       := actRContCloseAllGraphics.Visible;
      cbREditVariable.Checked           := actRContEditVariable.Visible;
      cbREscape.Checked                 := actRContEscape.Visible;
      cbRExampleSelectedWord.Checked    := actRContExampleSelectedWord.Visible;
      cbROPenExampleSelectedWord.Checked:= actRContOpenExampleSelectedWord.Visible;
      cbRFixVariable.Checked            := actRContFixVariable.Visible;
      cbRguiPuTTYStartClose.Checked     := actRContGuiPuTTYStartClose.Visible;
      cbRHelp.Checked                   := actRContHelp.Visible;
      cbRHelpSelectedWord.Checked       := actRContHelpSelectedWord.Visible;
      cbRListAllObjects.Checked         := actRContListAllObjects.Visible;
      cbRListVariableNames.Checked      := actRContListVariableNames.Visible;
      cbRListVariableStructure.Checked  := actRContListVariableStructure.Visible;
      cbRPackages.Checked               := actRContPackages.Visible;
      cbRPlotVariable.Checked           := actRContPlotVariable.Visible;
      cbRPrintVariableContent.Checked   := actRContPrintVariableContent.Visible;
      cbRRemoveAllObjects.Checked       := actRContRemoveAllObjects.Visible;
      cbRSetWorkDirectory.Checked       := actRContSetWorkDirectory.Visible;
      cbRTCPConnection.Checked          := actRContTCPConnection.Visible;
      cbRtermStartClose.Checked         := actRContTermStartClose.Visible;

      // EOL
      with rgEOL do begin
        if actWIN.Checked       then ItemIndex:= 0
        else if actMAC.Checked  then ItemIndex:= 1
        else if actUNIX.Checked then ItemIndex:= 2
      end;

      // Encoding
      with rgEncoding do begin
        if actANSI.Checked         then ItemIndex:= 0
        else if actUTF8.Checked    then ItemIndex:= 1
        else if actUTF16LE.Checked then ItemIndex:= 2
        else if actUTF16BE.Checked then ItemIndex:= 3
      end;
      cbApplyToANSI.Checked := actApplyToANSI.Checked;
      cbAlwaysAddBOM.Checked:= actAlwaysAddBOM.Checked;

      if bRUseLatest then rdgRUseLatest.ItemIndex:= 0
                     else rdgRUseLatest.ItemIndex:= 1;

      if bRArchitecture64 then rdgRArchitecture.ItemIndex:= 1
                          else rdgRArchitecture.ItemIndex:= 0;

      if bDataCompletionAnywhere then rdgDataCompletion_Pattern.ItemIndex:= 0
                                 else rdgDataCompletion_Pattern.ItemIndex:= 1;

      if bRtermFindError then rdgRtermFindError.ItemIndex:= 0
                         else rdgRtermFindError.ItemIndex:= 1;

      if bRtermBeepOnError then rdgRtermBeepOnError.ItemIndex:= 0
                           else rdgRtermBeepOnError.ItemIndex:= 1;

      rdgRecognition_Caption.ItemIndex:= iRecognition_Caption;
      rdgReformatRSplit.ItemIndex:= iReformatRSplit;

      with rdgLineWraping do
        if actEditorLineWrap.Checked then ItemIndex:= 0
                                     else ItemIndex:= 1;

      with rdgRtermType do
        if bRtermSingle then ItemIndex:= 0
                        else ItemIndex:= 1;

      rdgRtermDisposition.Enabled:= bRtermSingle;

      with rdgRtermWidth do
        if bRtermWidth then ItemIndex:= 0
                       else ItemIndex:= 1;

      with rdgRtermDisposition do
        if bRtermHorizontal then ItemIndex:= 0
                            else ItemIndex:= 1;

      with rdgRtermIO_Syntax do begin
        if (frmRterm.synIO.Highlighter = dmSyn.synText)      then ItemIndex:= 0;
        if (frmRterm.synIO.Highlighter = dmSyn.synText_term) then ItemIndex:= 1;
        if (frmRterm.synIO.Highlighter = dmSyn.synR)         then ItemIndex:= 2;
        if (frmRterm.synIO.Highlighter = dmSyn.synR_term)    then ItemIndex:= 3;
      end;

      with rdgRtermLOG_Syntax do begin
        if (frmRterm.synLog.Highlighter = dmSyn.synText)      then ItemIndex:= 0;
        if (frmRterm.synLog.Highlighter = dmSyn.synText_term) then ItemIndex:= 1;
        if (frmRterm.synLog.Highlighter = dmSyn.synR)         then ItemIndex:= 2;
        if (frmRterm.synLog.Highlighter = dmSyn.synR_term)    then ItemIndex:= 3;
      end;

      with rdgRtermSend_Plus do
        if bRtermSend_Plus then ItemIndex:= 0
                           else ItemIndex:= 1;

      with rdgRtermClose do
        if bRtermCloseWithoutAsk then ItemIndex:= 0
                                 else ItemIndex:= 1;

      ckAutocomplete.Checked:= actAutoCompletion.Checked;

      if Assigned(slRLibPaths) then mRLibPaths.Lines.Assign(slRLibPaths);

      slRAvailable:= TStringList.Create;
      pGet_Registry_R_Installed('SOFTWARE\R-core\R',
                                slRAvailable);

      //if Assigned(slRAvailable) then memRAvailable.Lines.Assign(slRAvailable);
      pRAvailable(slRAvailable);

      if Assigned(slFilters) then mFiles.Lines.Assign(slFilters);

      tbLastFileChange(nil);
      tbLastSearchChange(nil);
      tbRguiTinnR_ProportionChange(nil);

      pStatus_Editor(coEditor);
      iAlphaBlendValue:= 255 - (255 * tbTransparency.Position) Div 100;
    end;

//    if bStartOptionsWithRPage then begin
//      sAppSelected:= 'Path (R)';
//      bStartOptionsWithRPage:= False;
//    end
//    else if bStartOptionsWithProcessingPage then begin
//      sAppSelected:= 'Processing';
//      bStartOptionsWithProcessingPage:= False;
//    end;

    if (dlg.ShowModal = mrOK) then begin
      with dlg do begin
        // Send to R alphabetically ordered
        actRCurrentLineToTop.Visible         := cbRCurrentLineToTop.Checked;
        actRSendBlockMarked.Visible          := cbRSendBlockMarked.Checked;
        actRSendClipboard.Visible            := cbRSendClipboard.Checked;
        actRSendContiguous.Visible           := cbRSendContiguous.Checked;
        actRSendCursorToBeginningLine.Visible:= cbRSendCursorToBeginningLine.Checked;
        actRSendCursorToEndLine.Visible      := cbRSendCursorToEndLine.Checked;
        actRSendFile.Visible                 := cbRSendFile.Checked;
        actRSendLine.Visible                 := cbRSendLine.Checked;
        actRSendLinesToEndPage.Visible       := cbRSendLinesToEndPage.Checked;
        actRSendSelection.Visible            := cbRSendSelection.Checked;
        actRSendSmart.Visible                := cbRSendSmart.Checked;
        actRSendSweave.Visible               := cbRSendSweave.Checked;
        bRKnitr                              := cbRSendKnitr.Checked;

        pmemRResCurrentLineToTop.Checked         := cbRCurrentLineToTop.Checked;
        pmemRResSendBlockMarked.Checked          := cbRSendBlockMarked.Checked;
        pmemRResSendClipboard.Checked            := cbRSendClipboard.Checked;
        pmemRResSendContiguous.Checked           := cbRSendContiguous.Checked;
        pmemRResSendCursorToBeginningLine.Checked:= cbRSendCursorToBeginningLine.Checked;
        pmemRResSendCursorToEndLine.Checked      := cbRSendCursorToEndLine.Checked;
        pmemRResSendFile.Checked                 := cbRSendFile.Checked;
        pmemRResSendKnitr.Checked                := cbRSendKnitr.Checked;
        pmemRResSendLine.Checked                 := cbRSendLine.Checked;
        pmemRResSendLinesToEndPage.Checked       := cbRSendLinesToEndPage.Checked;
        pmemRResSendSelection.Checked            := cbRSendSelection.Checked;
        pmemRResSendSmart.Checked                := cbRSendSmart.Checked;
        pmemRResSendSweave.Checked               := cbRSendSweave.Checked;

        // Controlling R alphabetically ordered
        actRContClearAll.Visible               := cbRClearAll.Checked;
        actRContClearConsole.Visible           := cbRClearConsole.Checked;
        actRContCloseAllGraphics.Visible       := cbRCloseAllGraphics.Checked;
        actRContEditVariable.Visible           := cbREditVariable.Checked;
        actRContEscape.Visible                 := cbREscape.Checked;
        actRContExampleSelectedWord.Visible    := cbRExampleSelectedWord.Checked;
        actRContOpenExampleSelectedWord.Visible:= cbROpenExampleSelectedWord.Checked;
        actRContFixVariable.Visible            := cbRFixVariable.Checked;
        actRContGuiPuTTYStartClose.Visible     := cbRguiPuTTYStartClose.Checked;
        actRContHelp.Visible                   := cbRHelp.Checked;
        actRContHelpSelectedWord.Visible       := cbRHelpSelectedWord.Checked;
        actRContListAllObjects.Visible         := cbRListAllObjects.Checked;
        actRContListVariableNames.Visible      := cbRListVariableNames.Checked;
        actRContListVariableStructure.Visible  := cbRListVariableStructure.Checked;
        actRContPackages.Visible               := cbRPackages.Checked;
        actRContPlotVariable.Visible           := cbRPlotVariable.Checked;
        actRContPrintVariableContent.Visible   := cbRPrintVariableContent.Checked;
        actRContRemoveAllObjects.Visible       := cbRRemoveAllObjects.Checked;
        actRContSetWorkDirectory.Visible       := cbRSetWorkDirectory.Checked;
        actRContTCPConnection.Visible          := cbRTCPConnection.Checked;
        actRContTermStartClose.Visible         := cbRtermStartClose.Checked;

        pmenRResContClearAll.Checked             := cbRClearAll.Checked;
        pmenRResContClearConsole.Checked         := cbRClearConsole.Checked;
        pmenRResContCloseAllGraphics.Checked     := cbRCloseAllGraphics.Checked;
        pmenRResContEditVariable.Checked         := cbREditVariable.Checked;
        pmenRResContEscape.Checked               := cbREscape.Checked;
        pmenRResContExampleSelectedWord.Checked  := cbRExampleSelectedWord.Checked;
        pmenRResContFixVariable.Checked          := cbRFixVariable.Checked;
        pmenRResContGuiPuTTYStartClose.Checked   := cbRguiPuTTYStartClose.Checked;
        pmenRResContHelp.Checked                 := cbRHelp.Checked;
        pmenRResContHelpSelectedWord.Checked     := cbRHelpSelectedWord.Checked;
        pmenRResContListAllObjects.Checked       := cbRListAllObjects.Checked;
        pmenRResContListVariableNames.Checked    := cbRListVariableNames.Checked;
        pmenRResContListVariableStructure.Checked:= cbRListVariableStructure.Checked;
        pmenRResContPackages.Checked             := cbRPackages.Checked;
        pmenRResContPlotVariable.Checked         := cbRPlotVariable.Checked;
        pmenRResContPrintVariableContent.Checked := cbRPrintVariableContent.Checked;
        pmenRResContRemoveAllObjects.Checked     := cbRRemoveAllObjects.Checked;
        pmenRResContSetWorkDirectory.Checked     := cbRSetWorkDirectory.Checked;
        pmenRResContTCPConnection.Checked        := cbRTCPConnection.Checked;
        pmenRResContTermStartClose.Checked       := cbRtermStartClose.Checked;

        actCloseDVIViewer.Checked     := cbCloseDVIViewer.Checked;
        actClosePDFViewer.Checked     := cbClosePDFViewer.Checked;
        actDosMinimizedAlways.Checked := cbDosMinimizedAlways.Checked;
        actDviOpenAlways.Checked      := cbDviOpenAlways.Checked;
        actHtmlOpenAlways.Checked     := cbHtmlOpenAlways.Checked;
        actLatexVisible.Checked       := cbLatexVisible.Checked;
        actNotification.Checked       := cbNotification.Checked;
        actNotification_US.Checked    := cbNotification_US.Checked;
        actPdfOpenAlways.Checked      := cbPdfOpenAlways.Checked;
        bAllNames                     := cbAllNames.Checked;
        bConnectionBeepOnError        := cbConnectionBeepOnError.Checked;
        bMinimizeTinnAfterLastFile    := cbMinimizeTinn.Checked;
        bOrganizeAutomatically        := cbRguiOrganizeAutomatically.Checked;
        bREcho                        := cbREcho.Checked;
        bRememberFileState            := cbRememberFileState.Checked;
        bRemoveExtension              := cbRemoveExtension.Checked;
        bRestoreIniDock               := cbRestoreIniDock.Checked;
        bRguiReturnFocus              := cbRguiReturnFocus.Checked;
        bRMirros_Update               := cbRMirros_Update.Checked;
        bRSendAll                     := cbRSendAll.Checked;
        bRSetget_Info                 := cbRSetget_Info.Checked;
        bRSetWorkDir_Starting         := cbRSetWorkDir_Starting.Checked;
        bRSmart                       := cbRSmart.Checked;
        bRsvSocket_Connect            := cbRsvSocket_Connect.Checked;
        bRTCPIPConsoleEcho            := cbRTCPIPConsoleEcho.Checked;
        bRTCPIPConsoleUse             := cbRTCPIPConsoleUse.Checked;
        bRtermCanFloat                := cbRtermCanFloat.Checked;
        bRTinnRcom_Install            := cbRTinnRcom_Install.Checked;
        bRTinnRcom_Load               := cbRTinnRcom_Load.Checked;
        bScrollSendingLines           := cbScrollSendingLines.Checked;
        bToolsCanFloat                := cbToolsCanFloat.Checked;
        bUndoAfterSave                := cbUndoAfterSave.Checked;
        clBGApplication               := shSampleApplication.Brush.Color;
        clFGApplication               := shSampleApplication.Font.Color;
        frmMain.clBGTabSelectedNew    := shBGTabSelected.Brush.Color;
        iIPPortLocal                  := StrToInt(edtIPPortLocal.Text);
        iIPPortRemote                 := StrToInt(edtIPPortRemote.Text);
        iLastFile                     := tbLastFile.Position;
        iLastSearch                   := tbLastSearch.Position;
        iMaxDeparseLength             := StrToInt(edMaxDeparseLength.Text);
        iRguiTinnR_Disposition        := rgRguiTinnR_Disposition.ItemIndex;
        iRguiTinnR_Proportion         := tbRguiTinnR_Proportion.Position;
        sFormatR                      := edFormatR.Text;
        sKnit                         := edKnit.Text;
        sIPHostLocal                  := edtIPHostLocal.Text;
        sIPHostRemote                 := edtIPHostRemote.Text;
        sParDeplate                   := edParDeplate.Text;
        sParDviBibtex                 := edParDviBibtex.Text;
        sParDviSingle                 := edParDviSingle.Text;
        sParPdfBibtex                 := edParPdfBibtex.Text;
        sParPdfSingle                 := edParPdfSingle.Text;
        sParRgui                      := edParRgui.Text;
        sParRPuTTY                    := edParRPuTTY.Text;
        sParRterm                     := edParRterm.Text;
        sParTxt2tags                  := edParTxt2tags.Text;
        sPath_Pandoc                  := edPath_Pandoc.Text;
        sPuttyHost                    := edPuttyHost.Text;
        sPuttyPassword                := edPuttyPassword.Text;
        sPuttyUser                    := edPuttyUser.Text;
        sRLibPathDefault              := edRLibPathDefault.Text;
        sPathDeplate_Converter        := edPathDeplate_Converter.Text;
        sPathDeplate_Interpreter      := edPathDeplate_Interpreter.Text;
        sPath_Rgui                    := edPathRgui.Text;
        sPath_Rterm                   := edPathRterm.Text;
        sPathTxt2tags_Converter       := edPathTxt2tags_Converter.Text;
        sPathTxt2tags_Interpreter     := edPathTxt2tags_Interpreter.Text;

        frmTools.cbComPriority_Line.Checked      := cbComPriority_Line.Checked;
        frmTools.cbComAutoDetect_Language.Checked:= cbComAutoDetect_Language.Checked;

        if bREcho then begin
          actREcho.Checked:= True;
          pSetREcho_True;
        end
        else begin
          actREcho.Checked:= False;
          pSetREcho_False;
        end;

        // EOL
        case rgEOL.ItemIndex of
          0: actWINExecute(Self);   // WIN
          1: actMACExecute(Self);   // MAC
          2: actUNIXExecute(Self);  // UNIX
        end;

        // Encoding
        case rgEncoding.ItemIndex of
          0: actANSIExecute(Self);     // ANSI
          1: actUTF8Execute(Self);     // UTF-8
          2: actUTF16LEExecute(Self);  // UTF-16 LE
          3: actUTF16BEExecute(Self);  // UTF-16 BE
        end;
        actApplyToANSI.Checked := cbApplyToANSI.Checked;
        actAlwaysAddBOM.Checked:= cbAlwaysAddBOM.Checked;

        if (rdgRTCPIPType.ItemIndex = 0) then bIPLocal:= True
                                         else bIPLocal:= False;

        if bOrganizeAutomatically then bAlreadyOrganized:= False;

        if (rdgLineWraping.ItemIndex = 0) then actEditorLineWrap.Checked:= True
                                          else actEditorLineWrap.Checked:= False;

        if (rdgRUseLatest.ItemIndex = 0) then bRUseLatest:= True
                                         else bRUseLatest:= False;

        if (rdgRArchitecture.ItemIndex = 1) then bRArchitecture64:= True
                                            else bRArchitecture64:= False;

        if (rdgRtermFindError.ItemIndex = 0) then bRtermFindError:= True
                                             else bRtermFindError:= False;

        if (rdgRtermBeepOnError.ItemIndex = 0) then bRtermBeepOnError:= True
                                               else bRtermBeepOnError:= False;

        if (rdgRtermSend_Plus.ItemIndex = 0) then bRtermSend_Plus:= True
                                             else bRtermSend_Plus:= False;

        if (rdgRtermClose.ItemIndex = 0) then bRtermCloseWithoutAsk:= True
                                         else bRtermCloseWithoutAsk:= False;

        if (rdgDataCompletion_Pattern.ItemIndex = 0) then bDataCompletionAnywhere:= True
                                                     else bDataCompletionAnywhere:= False;

        if (rdgRtermWidth.ItemIndex = 0) then bRtermWidth:= True
                                         else bRtermWidth:= False;

        iRecognition_Caption:= rdgRecognition_Caption.ItemIndex;
        iReformatRSplit:= rdgReformatRSplit.ItemIndex;

        case rdgRtermType.ItemIndex of
          // IO and Log in the same view
          0: begin
               // It avoid the not always necessary (and expensive) procedures below
               if (bRtermSingle <> True) then  // The user changed the prior option related
                 case rdgRtermDisposition.ItemIndex of
                   0: actRtermIOSplitHorizontalExecute(nil);
                   1: actRtermIOSplitVerticalExecute(nil);
                 end;
             end;
          // IO and Log in distinct view
          1: actRtermIOSplitRemoveExecute(nil);
        end;

        case rdgRtermIO_Syntax.ItemIndex of
          0: actRtermIO_TextExecute(nil);
          1: actRtermIO_Text_nMLExecute(nil);
          2: actRtermIO_RExecute(nil);
          3: actRtermIO_R_nMLExecute(nil);
        end;

        case rdgRtermLOG_Syntax.ItemIndex of
          0: actRtermLOG_TextExecute(nil);
          1: actRtermLOG_Text_nMLExecute(nil);
          2: actRtermLOG_RExecute(nil);
          3: actRtermLOG_R_nMLExecute(nil);
        end;

        actAutoCompletion.Checked:= ckAutocomplete.Checked;

        actRguiReturnFocus.Checked:= bRguiReturnFocus;
        iDelay:= tbDelay.Position;

        iTransparency   := tbTransparency.Position;
        iAlphaBlendValue:= 255 - (255 * iTransparency) Div 100;
        frmMain.AlphaBlendValue:= iAlphaBlendValue;

        frmTools.tbsLatex.TabVisible:= actLatexVisible.Checked;

        pNewStatus_Editor(coEditor);

        tbKnitr.Visible:= bRKnitr;
      end;

      actGutterVisible.Checked     := coEditor.Gutter.Visible;
      actLineNumbersVisible.Checked:= coEditor.Gutter.ShowLineNumbers;
      actSpecialCharVisible.Checked:= (eoShowSpecialChars in coEditor.Options);

      // Update all opened files
      for i:= (Self.MDIChildCount - 1) downto 0 do begin
        // Line wraping
        (Self.MDIChildren[i] as tfrmEditor).pToogleWordWrap(actEditorLineWrap.Checked);

        // SynEditor
        coEditor.AssignTo((Self.MDIChildren[i] as TfrmEditor).synEditor);

        // SynEditor2
        if Assigned((Self.MDIChildren[i] as TfrmEditor).synEditor2) then
          coEditor.AssignTo((Self.MDIChildren[i] as TfrmEditor).synEditor2);

        (Self.MDIChildren[i] as TfrmEditor).Repaint;
      end;

      frmTools.JvDockClientTools.CanFloat:= bToolsCanFloat;
      frmRterm.JvDockClientRterm.CanFloat:= bRtermCanFloat;

      // Update General
      pUpdateAppearance;

      // Update Rterm
      pUpdateRterm_Appearance;

      // Update hex viewer
      pUpdateHexViewer;

      pDraw_RtermSend_Plus;
    end;
  finally
    FreeAndNil(dlg);
    FreeAndNil(slRAvailable);
    pSetFocus_Main;
  end;
end;

procedure TfrmMain.pWMSysCommand;
begin
  inherited;
  pCheckTop;
end;

procedure TfrmMain.pSetRExplorer(bOption: boolean);
begin
  //actRExplorerExpHtml.Enabled            := bOption;
  //actRExplorerExpTeX.Enabled             := bOption;
  actRExplorerContent.Enabled            := bOption;
  actRExplorerEdit.Enabled               := bOption;
  actRExplorerExampleSelected.Enabled    := bOption;
  actRExplorerOpenExampleSelected.Enabled:= bOption;
  actRExplorerExpAscii.Enabled           := bOption;
  actRExplorerExpRaw.Enabled             := bOption;
  actRExplorerFix.Enabled                := bOption;
  actRExplorerHelpSelected.Enabled       := bOption;
  actRExplorerNames.Enabled              := bOption;
  actRExplorerPlot.Enabled               := bOption;
  actRExplorerRemove.Enabled             := bOption;
  actRExplorerRemoveAllObjects.Enabled   := bOption;
  actRExplorerSendNameToClipboard.Enabled:= bOption;
  actRExplorerSendNameToEditor.Enabled   := bOption;
  actRExplorerStructure.Enabled          := bOption;
  actRExplorerSummary.Enabled            := bOption;
end;

procedure TfrmMain.pMakeRenvironment(slRObjects: TStringList);
var
  i,
   j: integer;

  slTmp: TStringList;

  sTmp: string;

begin
  frmTools.cbbToolsREnvironment.Clear;
  try
    slTmp:= TStringList.Create;
    for i:= 0 to (slRObjects.Count - 1) do begin
      sTmp:= slRObjects.Strings[i];

      pString_Split(' ',
                    sTmp,
                    slTmp);

      if (slTmp.Count >= 0) then
        for j:= 1 to (slTmp.Count - 1) do
          frmTools.cbbToolsREnvironment.Items.Add(slTmp[j]);
    end;
  finally
    FreeAndNil(slTmp);
    frmTools.cbbToolsREnvironment.ItemIndex:= 0;
  end;
end;

procedure TfrmMain.pMakeItem(sRObjName,
                                 sRObjDim,
                                 sRObjGroup,
                                 sRObjClass: string;
                                 iIndex: integer);
var
  liItem: TListItem;

begin
  liItem           := frmTools.lvRexplorer.Items.Add;
  liItem.Caption   := sRObjName;
  liItem.ImageIndex:= iIndex;
  liItem.SubItems.Add(sRObjDim);
  liItem.SubItems.Add(sRObjGroup);
  liItem.SubItems.Add(sRObjClass);
end;

procedure TfrmMain.pMakeTree(sRObjName,
                                 sRObjDim,
                                 sRObjGroup,
                                 sRObjClass: string);
begin
  {
    cbbToolsRExplorer.Items:
    0: All
    1: All (- F)
    2: Function
    3: Vector
    4: Matrix
    5: Frame
    6: Array
    7: List
    8: Table
    9: Other
  }

  case fStringToCase_Select(sRObjGroup,
                            ['function',
                             'vector',
                             'matrix',
                             'data.frame',
                             'array',
                             'list',
                             'table',
                             'other']) of
    0: begin  // function
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 2) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                    2);
       end;
    1: begin  // vector
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 3) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     3);
       end;
    2: begin  // matrix
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 4) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     4);
       end;
    3: begin  // data.frame
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 5) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     5);
       end;
    4: begin  // array
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 6) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     6);
       end;
    5: begin  // list
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 7) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     7);
       end;
    6: begin  // table
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 8) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     8);
       end;
    7: begin  // other
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 9) then
           pMakeItem(sRObjName,
                     sRObjDim,
                     sRObjGroup,
                     sRObjClass,
                     9);
       end;
  end;
end;

(*
procedure TfrmMain.MakeTreeRExplorer_TCPIP(slRObjects: TStringList);
var
  i          : integer;
  slTmp      : TStringList;
  sTmp,
   sRObjName,
   sRObjDims,
   sRObjGroup,
   sRObjClass: string;

begin
  frmTools.stbRexplorer.Panels[1].Text:= EmptyStr;
  frmTools.stbRexplorer.Panels[3].Text:= EmptyStr;
  frmTools.stbRexplorer.Panels[5].Text:= EmptyStr;
  frmTools.lvRexplorer.Items.BeginUpdate;
  frmTools.lvRexplorer.Items.Clear;
  try
    slTmp:= TStringList.Create;
    sTmp := slRObjects.Strings[0];
    pStrSplit(' ',
              sTmp,
              slTmp);
    for i:= 0 to (slRObjects.Count-1) do begin
      sTmp:= slRObjects.Strings[i];
      pStrSplit(' ',
                sTmp,
                slTmp) ;
      if (slTmp.Count >= 5) then begin
        sRObjName := slTmp[1]; // Name of R object
        sRObjDims := slTmp[2]; // Dims of R object
        sRObjGroup:= slTmp[3]; // Group of R object
        sRObjClass:= slTmp[4]; // Class of R object
        pMakeTree(sRObjName,
                  sRObjDims,
                  sRObjGroup,
                  sRObjClass);
      end;
    end;
    frmTools.lvRExplorer.Invalidate;
  finally
    frmTools.lvRExplorer.Items.EndUpdate;
    Sleep(iDelay);
    frmTools.lvRexplorer.Repaint;
    frmTools.stbRExplorer.Panels[1].Text:= ' ' +
                                           IntToStr(frmTools.lvRExplorer.Items.Count);
    FreeAndNil(slTmp);
  end;
end;
*)

procedure TfrmMain.pMakeTreeRExplorer_TmpFile(slRObjects: TStringList);

  procedure pDefineObjectStructure(var sTmp,
                                       RobjName,
                                       RobjDim,
                                       RobjGroup,
                                       RobjClass: string;
                                    var tslTmp: TstringList);
  begin
    pString_Split(' ',
                  sTmp,
                  tslTmp);
    if (tslTmp.Count = 3) then begin
      RobjName := tslTmp[0]; // Name of R object
      RobjDim  := EmptyStr;  // Dims of R object
      RobjGroup:= tslTmp[1]; // Group of R object
      RobjClass:= tslTmp[2]; // Class of R object
    end
    else if (tslTmp.Count = 4) then begin
      RobjName := tslTmp[0]; // Name of R object
      RobjDim  := tslTmp[1]; // Dims of R object
      RobjGroup:= tslTmp[2]; // Group of R object
      RobjClass:= tslTmp[3]; // Class of R object
    end;
  end;

var
  i: integer;

  slTmp: TStringList;

  sTmp,
   sRObjName,
   sRObjDim,
   sRObjGroup,
   sRObjClass: string;

begin
  frmTools.stbRexplorer.Panels[1].Text:= EmptyStr;
  frmTools.stbRexplorer.Panels[3].Text:= EmptyStr;
  frmTools.stbRexplorer.Panels[5].Text:= EmptyStr;
  frmTools.lvRexplorer.Items.BeginUpdate;
  frmTools.lvRexplorer.Items.Clear;
  try
    slTmp:= TStringList.Create;

    for i:= 0 to (slRObjects.Count-1) do begin
      sTmp:= slRObjects.Strings[i];
      pDefineObjectStructure(sTmp,
                             sRObjName,
                             sRObjDim,
                             sRObjGroup,
                             sRObjClass,
                             slTmp);

      pMakeTree(sRObjName,
                sRObjDim,
                sRObjGroup,
                sRObjClass);
    end;
    frmTools.lvRExplorer.Invalidate;
  finally
    frmTools.lvRExplorer.Items.EndUpdate;
    Sleep(iDelay);
    frmTools.lvRexplorer.Repaint;
    frmTools.stbRExplorer.Panels[1].Text:= ' ' +
                                           IntToStr(frmTools.lvRExplorer.Items.Count);
    FreeAndNil(slTmp);
  end;
end;

procedure TfrmMain.menRServerClick(Sender: TObject);
begin
  try
    frmRServer:= TfrmRServer.Create(nil);
    frmRServer.ShowModal;
  finally
    FreeAndNil(frmRServer);
    pSetFocus_Main;
  end;
  frmMain.Refresh;
end;

procedure TfrmMain.menRSet_trPathsClick(Sender: TObject);
var
  sTinnRPaths: string;
  
begin

sTinnRPaths:= '.paths <- file.path(Sys.getenv(''TEMP''), ' +
                                   '''Tinn-R'', ' +
                                   'c('''', ' +
                                   '''search.txt'', ' +
                                   '''objects.txt'', ' +
                                   '''file.r'', ' +
                                   '''selection.r'', ' +
                                   '''block.r'', ' +
                                   '''lines.r'', ' +
                                   '''reformat-input.r'', ' +
                                   '''reformat-output.r''), ' +
                                   'fsep=''\\'')';

pDoSend(sTinnRPaths);
end;

procedure TfrmMain.menRtermHistoryNextClick(Sender: TObject);
begin
  if not fRterm_Running then Exit;

  with frmRterm.synIO do begin
       CaretY:= Lines.Count;
       if (SelText <> EmptyStr) then Exit;
       if frmRterm.bRterm_Plus then LineText:= '+ ' +
                                               RHistory.fGetNext
       else
         if frmRterm.bRUnderDebug_Function or
            frmRterm.bRUnderDebug_Package then LineText:= frmRterm.sRDebugPrefix +
                                                          ' ' +
                                                          RHistory.fGetNext
                                 else LineText:= '> ' +
                                                 RHistory.fGetNext;
       ExecuteCommand(ecLineEnd,
                      #0,
                      nil);
  end;
end;

procedure TfrmMain.menRtermHistoryPriorClick(Sender: TObject);
begin
  if not fRterm_Running then Exit;

  with frmRterm do begin
       synIO.CaretY:= synIO.Lines.Count;
       if (synIO.SelText <> EmptyStr) then Exit;
       if bRterm_Plus then synIO.LineText:= '+ ' +
                                            RHistory.fGetPrior
       else
         if bRUnderDebug_Function or
            bRUnderDebug_Package then synIO.LineText:= sRDebugPrefix +
                                                       ' ' +
                                                       RHistory.fGetPrior
                                 else synIO.LineText:= '> ' +
                                                       RHistory.fGetPrior;
       synIO.ExecuteCommand(ecLineEnd,
                            #0,
                            nil);
  end;
end;

procedure TfrmMain.lvRexplorerDblClick(Sender: TObject);
var
  i: integer;
  
begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  actRExplorerSendNameToEditorExecute(nil);

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.csRGeneralConnect(Sender: TObject;
                                         Socket: TCustomWinSocket);
begin
  bConectionError              := False;
  actRContTCPConnection.Checked:= True;
  if Assigned(frmRServer) then begin
    with frmRServer do begin
      chbIPConnected.Checked    := True;
      edtIPClientIP.Text        := Socket.LocalAddress;
      edtIPClient.Text          := Socket.LocalHost;
      btnConnectTCPIP.Enabled   := False;
      btnDisconnectTCPIP.Enabled:= True;
      btnSendTCPIP.Enabled      := True;
      edtSend.SetFocus;
    end;
  end;
  if not bIPLocal then bIPRemoteConnected:= True;
end;

procedure TfrmMain.csRGeneralDisconnect(Sender: TObject;
                                            Socket: TCustomWinSocket);
var
  i: integer;

  sTmp: string;

begin
  if bConectionError then Exit;
  actRContTCPConnection.Checked:= False;
  // The server sends '' when disconnect fine
  sTmp:= Socket.ReceiveText;

  i   := Pos(#$D,
             sTmp);
  if (i <= 1) then sTmp:= 'Local R socket server disconnected.' +
                          #13#10 {#$D#$A};

  if Assigned(frmRServer) then begin
    with frmRServer do begin
      memRTCPIP.Lines.Add(sTmp);
      chbIPConnected.Checked    := False;
      edtIPClientIP.Text        := EmptyStr;
      edtIPClient.Text          := EmptyStr;
      btnConnectTCPIP.Enabled   := True;
      btnDisconnectTCPIP.Enabled:= False;
      btnSendTCPIP.Enabled      := False;
      edtSend.SetFocus;
    end;
    Exit;
  end;

  if not bIPLocal then bIPRemoteConnected:= False;
  frmRterm.synIO.Lines.Add(sTmp);
end;

procedure TfrmMain.csREnvironmentError(Sender: TObject;
                                           Socket: TCustomWinSocket;
                                           ErrorEvent: TErrorEvent;
                                           var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  Socket.Close;
end;

procedure TfrmMain.csRExplorerError(Sender: TObject;
                                        Socket: TCustomWinSocket;
                                        ErrorEvent: TErrorEvent;
                                        var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  Socket.Close;
end;

procedure TfrmMain.csRGeneralError(Sender: TObject;
                                       Socket: TCustomWinSocket;
                                       ErrorEvent: TErrorEvent;
                                       var ErrorCode: Integer);
begin
  if (ErrorCode = 10061) then
    fMessageDlg('Error: ' + IntToStr(ErrorCode) + #13 + #13 +
                'R is not in server mode.' + #13 +
                'Please, start R and/or run the startSocketServer() function' + #13 +
                'available in svSocket package!',
                mtError,
                [mbOk],
                0)
  else if (ErrorCode = 10053) and
          not bRsvSocket_Connect then
    fMessageDlg('Error: ' + IntToStr(ErrorCode) + #13 + #13 +
                'R is not more in server mode.' + #13 +
                'The connection with R server was lost!',
                mtError,
                [mbOk],
                0);

  if Assigned(frmRServer) then begin
    with frmRServer do begin
      chbIPConnected.Checked    := False;
      edtIPClientIP.Text        := EmptyStr;
      edtIPClient.Text          := EmptyStr;
      btnConnectTCPIP.Enabled   := True;
      btnDisconnectTCPIP.Enabled:= False;
      btnSendTCPIP.Enabled      := False;
    end;
  end;

  ErrorCode      := 0;
  bConectionError:= True;
  Socket.Close;
  actRContTCPConnection.Checked:= False;
end;

procedure TfrmMain.csREnvironmentRead(Sender: TObject;
                                          Socket: TCustomWinSocket);
var
  iRemoteIP,
   iPriorMessage: integer;

  slFromRServer: TStringList;

  sTmp: string;

begin
  sTmp:= trim(Socket.ReceiveText);
  iRemoteIP:= Pos(csRtip.Host,
                  sTmp);

  if (iRemoteIP <> 0) or
     (sTmp = EmptyStr) then Exit;  // Exit if message is of the connection or #$D#$A
  iPriorMessage:= Pos('[',
                      sTmp);

  if (iPriorMessage > 1) then begin
    Delete(sTmp,
           1,
           iPriorMessage-1);
  end;

  slFromRServer:= TStringList.Create;
  sTmp         := (sTmp) +
                  #13#10;

  slFromRServer.Text:= sTmp;
  pMakeRenvironment(slFromRServer);
  FreeAndNil(slFromRServer);
end;

procedure TfrmMain.csRGeneralRead(Sender: TObject;
                                      Socket: TCustomWinSocket);
var
  aBuffer: array [0..4095] of char;

  buf: PChar;

  iReceived: integer;

  muStream_1,
   muStream_2: TMultiStream;

  meStream,
   mePriorContent: TMemoryStream;

begin
  meStream      := TMemoryStream.Create;
  mePriorContent:= TMemoryStream.Create;
  muStream_1    := TMultiStream.Create;
  muStream_2    := TMultiStream.Create;
  try
    while True do
    begin
      Sleep(iDelay div 6);
      iReceived:= Socket.ReceiveBuf(aBuffer,
                                    SizeOf(aBuffer));
      if (iReceived <= 0) then Break
                          else meStream.Write(aBuffer,
                                              iReceived);
    end;

    meStream.Position:= 0;

    if (meStream.Size <> 0) then begin
      GetMem(buf,
             1024);
      // R server output
      if Assigned(frmRServer) then
        if (frmRServer.Visible) then
          with frmRServer.memRTCPIP do begin
            Lines.BeginUpdate;
            Lines.SaveToStream(mePriorContent);
            muStream_1.AddStream(mePriorContent);
            muStream_1.AddStream(meStream);
            ZeroMemory(buf,
                       1024);
            Lines.LoadFromStream(muStream_1);
            PostMessage(Handle,
                        WM_VSCROLL,
                        SB_BOTTOM,
                        0);
            Lines.EndUpdate;
          end;

      // R output
      with frmRterm.synIO do begin
        Lines.BeginUpdate;
        Lines.Add(EmptyStr);
        mePriorContent.Clear;
        Lines.SaveToStream(mePriorContent);
        muStream_2.AddStream(mePriorContent);
        muStream_2.AddStream(meStream);
        ZeroMemory(buf,
                   1024);

        Lines.LoadFromStream(muStream_2);
        ExecuteCommand(ecEditorBottom,
                       #0,
                       nil);

        LineText:= '> ';
        ExecuteCommand(ecEditorBottom,
                       #0,
                       nil);
        Lines.EndUpdate;
      end;
    end;
  finally
    FreeAndNil(meStream);
    FreeAndNil(mePriorContent);
    FreeAndNil(muStream_1);
    FreeAndNil(muStream_2);
  end;
end;

procedure TfrmMain.csRtipError(Sender: TObject;
                                   Socket: TCustomWinSocket;
                                   ErrorEvent: TErrorEvent;
                                   var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  Socket.Close;
end;

procedure TfrmMain.pPrintMessage(sInstruction: string;
                                     bNewLine: boolean;
                                     sSignal: string = '> ');
begin
  if not bRTCPIPConsoleUse or
     not bRTCPIPConsoleEcho then Exit;
  sInstruction:= TrimRight(sInstruction);

  with frmRterm.synIO do begin
    Lines.BeginUpdate;
    if bNewLine then Lines.Add(sSignal +
                               sInstruction)
                else LineText:= LineText +
                                sInstruction;
    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);            
    Lines.EndUpdate;
  end;
end;

procedure TfrmMain.pmenProjRSendToRClick(Sender: TObject);

  procedure pSendToR(var Stmp: string);
  begin
    pDoSend(sTmp);
  end;

  procedure pPrepareToSendToR(sFilePath: string;
                              var sTmp: string);
  var
    sUnixPath,
      sToSend: string;

  begin
    sUnixPath:= DosPathToUnixPath(sFilePath);
    if fRterm_Running or
       bIPRemoteConnected then begin
      if sTmp = EmptyStr then sTmp:= 'source(''' +
                                     sUnixPath +
                                     ''')'
                   else sTmp:= sTmp +
                               '; ' +
                               'source(''' +
                               sUnixPath +
                               ''')';
      Exit;
    end
    else  // Rgui is running!
      sToSend:= 'source(''' +
                        sUnixPath +
                        ''')';
      pDoSend(sToSend);
  end;

var
  bIgnoreAll: boolean;

  j,
   iFiles: integer;

  sFilePath,
    sTmp: string;

  tnCurNode: TTreeNode;

  userOption: TModalResult;

begin
  with frmTools.tvProject do begin
    if (Selected = nil) then Exit;

    // Send all files of the open project to R
    if (Selected.Level = 0) then begin
      bIgnoreAll:= False;

      for j:= 1 to (Items.Count-1) do begin
        if (Items[j].Level = 2) then begin
          sFilePath:= trim(string(Items[j].Data));
          if FileExists(sFilePath) then pPrepareToSendToR(sFilePath,
                                                          sTmp)
          else if not bIgnoreAll then begin
            userOption:= fMessageDlg(sFilePath + #13 + #13 +
                                     'File above was not found!' + #13 +
                                     'Ignore?',
                                     mtConfirmation,
                                     [mbYes, mbYesToAll, mbCancel],
                                     0);

            case userOption of
              mrYesToAll: bIgnoreAll:= True;
              mrCancel: Exit;
            end;
          end;
        end;
      end;
    end
    // Send all files of the selected group to R
    else if (Selected.Level = 1) then begin
      bIgnoreAll:= False;
      j         := Selected.AbsoluteIndex;
      tnCurNode := Items[j];  // Important not remove!
      iFiles    := Items[j].Count;

      while iFiles > 0 do begin
        tnCurNode:= tnCurNode.GetNext;
        sFilePath:= trim(string(tnCurNode.Data));
        if FileExists(sFilePath) then pPrepareToSendToR(sFilePath,
                                                        sTmp)
        else if not bIgnoreAll then begin
          userOption:= fMessageDlg(sFilePath + #13 + #13 +
                                   'File above was not found!' + #13 +
                                   'Ignore it?',
                                   mtConfirmation,
                                   [mbYes, mbYesToAll, mbCancel],
                                   0);

          case userOption of
            mrYesToAll: bIgnoreAll:= True;
            mrCancel: Exit;
          end;
        end;
        dec(iFiles);
      end;
    end
    // Send selected file to R
    else if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then pPrepareToSendToR(sFilePath,
                                                      sTmp)
                               else fMessageDlg(trim(sFilePath) + #13 + #13 +
                                                'File not found!',
                                                mtWarning,
                                                [mbOk],
                                                0);
    end;

    if (sTmp <> EmptyStr) then pSendToR(sTmp);
  end;
end;

procedure TfrmMain.pmenProjRSetWorkDirClick(Sender: TObject);

  procedure pSendToR(filePath: string);
  var
    unixPath,
     sToSend: string;

  begin
    unixPath:= DosPathToUnixPath(filePath);
    sToSend := 'setwd(''' +
               unixPath +
               ''')';
    pDoSend(sToSend);
  end;

var
  sFilePath: string;

begin
  with frmTools.tvProject do begin
    if (Selected = nil) then Exit;
    // Send selected file to R
    if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then pSendToR(ExtractFilePath(sFilePath))
                               else fMessageDlg(trim(sFilePath) + #13 + #13 +
                                                'File not found!',
                                                mtWarning,
                                                [mbOk],
                                                0);
    end;
  end;
end;

procedure TfrmMain.pmenWinExplorerFilesRefreshClick(Sender: TObject);
begin
  frmTools.bbtWinExplorerFilterRefreshClick(nil);
end;

procedure TfrmMain.pmenWinExplorerFoldersRefreshClick(Sender: TObject);
begin
  frmTools.bbtWinExplorerRefreshClick(nil);
end;

procedure TfrmMain.pmenWorkExplorerFilesRefreshClick(Sender: TObject);
begin
  frmTools.bbtWorkExplorerFileterRefreshClick(nil);
end;

procedure TfrmMain.pmenWorkExplorerFoldersRefreshClick(Sender: TObject);
begin
  frmTools.bbtWorkExplorerRefreshClick(nil);
end;

procedure TfrmMain.actRExplorerHelpExecute(Sender: TObject);
begin
  pOpenUserGuidePDF('"Tools interface"');
end;

function TfrmMain.fREnvironment: string;
begin
  Result:= EmptyStr;

  with frmTools do
    // It will get the R environment of the selected object
    if (Pos(':',
            cbbToolsREnvironment.Text) > 0) then Result:= fRegEx(cbbToolsREnvironment.Text, // It will get all from latest ':' to the end of string
                                                                 '[^:]+$',
                                                                 False) +
                                                          '::';      
end;

procedure TfrmMain.actRExplorerHelpSelectedExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'help(''' +
         frmTools.lvRexplorer.Selected.Caption +
         ''')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerExampleSelectedExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'example(''' +
         frmTools.lvRexplorer.Selected.Caption +
         ''')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerOpenExampleSelectedExecute(Sender: TObject);

  function fGetWord(var sTopic,
                        sPackage: string): boolean;
  begin
    Result:= False;

    with frmTools do begin
      sTopic:= lvRexplorer.Selected.Caption;

      if (Pos(':',                                            // It will get all from latest ':' to the end of string
              cbbToolsREnvironment.Text) > 0) then sPackage:= fRegEx(cbbToolsREnvironment.Text,
                                                                     '[^:]+$',
                                                                     False);
    end;

    if (sTopic = EmptyStr) then Exit;

    Result:= True;
  end;

  procedure pSetArgs(var sInfo,
                         sTopic,
                         sPackage,
                         sFile: string);
  begin
    // topic
    sInfo:= StringReplace(sInfo,
                          '%topic',
                          sTopic,
                          []);

    // package
    if (sPackage <> EmptyStr) then
      sInfo:= StringReplace(sInfo,
                            'NULL',
                            '''' +
                            sPackage
                            + '''',
                            []);

    // file
    sInfo:= StringReplace(sInfo,
                          '%file',
                          DosPathToUnixPath(sFile),
                          []);
  end;


var
  i: integer;

  sInfo,
   sToSend,
   sSource,
   sResult,
   sTopic,
   sPackage: string;

begin
  try
    if (frmTools.lvRexplorer.Selected = nil) then Exit;

    if not fGetWord(sTopic,
                    sPackage) then Exit;

    if (sPackage = EmptyStr) then
      sResult:= sPath_Tmp +
                '\' +
                sTopic +
                '.R'
    else
      sResult:= sPath_Tmp +
                '\' +
                sTopic +
                '_' +
                sPackage +
                '.R';

    sInfo:= fFile_ToString(sUtilsOrigin +
                           '\example.R');

    pSetArgs(sInfo,
             sTopic,
             sPackage,
             sResult);

    sSource:= sPath_Tmp +
              '\' +
              'example.R';

    if fFile_Save_Fast(sSource,
                       sInfo) then sToSend:= 'source(' +
                                             '''' +
                                             DosPathToUnixPath(sSource) +
                                             '''' +
                                             ')';

    // Disable ReturnFocus: Temporary to avoid a flicker in the TBRMain
    if fRgui_Running and
       bRguiReturnFocus then actRguiReturnFocus.Checked:= False;
    Application.ProcessMessages;

    pDoSend(sToSend);

    i:= 1;
    repeat
      Sleep(5*iDelay);

      if FileExists(sResult) and
         not fFile_InUse(sResult) then Break
                                  else inc(i);
    until (i = 50);

    if not FileExists(sResult) then begin
      fMessageDlg(sResult + #13 + #13 +
                  'The file was not found!',
                  mtWarning,
                  [mbOk],
                  0);
      Exit;
    end;

    if (fFile_ToString(sResult) = EmptyStr) then begin
      with stbMain do begin
        Beep;
        Panels[8].Text:= 'Example not found!';
      end;

      Exit;
    end
    else
      pOpenFileIntoTinn(sResult,
                        0,
                        False,
                        False);
  finally
    //TODO
  end;
end;

procedure TfrmMain.actRExplorerNamesExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'names(' +
         fREnvironment +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerStructureExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'str(' +
         fREnvironment +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerSummaryExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'summary(' +
         fREnvironment +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerEditExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'edit(' +
         fREnvironment +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerFixExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'fix(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerPlotExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'plot(' +
         fREnvironment +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerRemoveExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'rm(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerRemoveAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Items.Count = 0) then Exit;

  //sTmp:= 'rm(list=ls(all=TRUE))';  // It is very danger!
  sTmp:= 'rm(list=ls())';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerContentExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;

  sTmp:= fREnvironment +
         frmTools.lvRexplorer.Selected.Caption;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerSendNameToEditorExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  i: integer;

begin
  if Assigned(frmTools.lvRexplorer.Selected) then begin
    if not fSave_PriorClipboard_Text then Exit;
    Clipboard.AsText:= frmTools.lvRexplorer.Selected.Caption;

    i:= fFindTopWindow;
    if Assigned(Self.MDIChildren[i] as TfrmEditor) then begin
      with (Self.MDIChildren[i] as TfrmEditor) do begin
        if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                         else seEditor:= synEditor2;
        seEditor.PasteFromClipboard;
        pEnableSave;
      end;
    end;

    pRestore_PriorClipboard_Text;
  end;
end;

procedure TfrmMain.actRExplorerSendNameToClipboardExecute(Sender: TObject);
begin
  if Assigned(frmTools.lvRexplorer.Selected) then Clipboard.AsText:= frmTools.lvRexplorer.Selected.Caption;
end;

procedure TfrmMain.actRExplorerExpRawExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'trExport(''' +
         frmTools.lvRexplorer.Selected.Caption +
         '''' +
         ', ' +
         'type=''raw'')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRExplorerExpAsciiExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'trExport(''' +
         frmTools.lvRexplorer.Selected.Caption +
         '''' +
         ', ' +
         'type=''ascii'')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRCardHelpExecute(Sender: TObject);
begin
  pOpenUserGuidePDF('"Card (R)"');
end;

procedure TfrmMain.actRCardHelpSelectedExecute(Sender: TObject);

  function fGetWord: string;
  var
    iPos: integer;

    sTmp: string;

  begin
    Result:= EmptyStr;

    sTmp:= modDados.cdRcardFunction.Value;

    iPos:= Pos('(',
               sTmp);

    if (iPos <> 0) then sTmp:= Copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Exit;
    end;

    Result:= 'help(''' +
             sTmp +
             ''')';
  end;

var
  sTmp: string;

begin
  sTmp:= fGetWord;
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRcardInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then Exit;
  i:= fFindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    pDoCardInsert;
  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.actRCardExampleSelectedExecute(Sender: TObject);

  function fGetWord: string;
  var
    iPos: integer;

    sTmp: string;

  begin
    Result:= EmptyStr;

    sTmp:= modDados.cdRcardFunction.Value;

    iPos:= Pos('(',
               sTmp);

    if (iPos <> 0) then sTmp:= Copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Exit;
    end;

    Result:= 'example(''' +
             sTmp +
             ''')';
  end;

var
  sTmp: string;

begin
  sTmp:= fGetWord;
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRcardCopyFunctionExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdRcardFunction.Text;
end;

procedure TfrmMain.actRcardEditExecute(Sender: TObject);
begin
  sRcardBookMark:= modDados.cdRcard.Bookmark;
  menToolsDatabaseCardRClick(nil);
  pSetFocus_Main;
end;

procedure TfrmMain.actRcardCopyDescritionExecute(Sender: TObject);
begin
  with modDados do
    if frmTools.dbRcardMemo.SelLength <> 0 then Clipboard.AsText:= frmTools.dbRcardMemo.SelText
                                           else Clipboard.AsText:= cdRcardDescription.Value;
end;

procedure TfrmMain.pUpdateOptions;
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  with seEditor do begin
    actCopyFormattedHtml.Enabled       := SelAvail;
    actCopyFormattedRtf.Enabled        := SelAvail;
    actCopyFormattedTeX.Enabled        := SelAvail;
    actIndentBlock.Enabled             := SelAvail;
    actInvertSelection.Enabled         := SelAvail;
    actLowerCaseSelection.Enabled      := SelAvail;
    actUnindentBlock.Enabled           := SelAvail;
    actUpperCaseSelection.Enabled      := SelAvail;
  end;
  pUpdateCloseFileOptions;
end;

procedure TfrmMain.actSplitVerticalExecute(Sender: TObject);
var
  i: integer;

begin
  synURIOpener.Editor:= nil;
  i:= fFindTopWindow;

  with (Self.MDIChildren[i] as TfrmEditor) do
    pEditorSplit(False);

  pSetDataCompletion(synEditor2Tip,
                     (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                     'CTRL+SPACE');

  pSetFocus_Main;
end;

procedure TfrmMain.actSplitHorizontalExecute(Sender: TObject);
var
  i: integer;

begin
  synURIOpener.Editor:= nil;

  i:= fFindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    pEditorSplit;

  pSetDataCompletion(synEditor2Tip,
                     (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                     'CTRL+SPACE');

  pSetFocus_Main;
end;

procedure TfrmMain.actSplitRemoveExecute(Sender: TObject);
begin
  synURIOpener.Editor:= nil;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pEditorRemoveSplit;

  with synEditor2Tip do begin
    Editor       := nil;
    EndOfTokenChr:= EmptyStr;
    ShortCut     := TextToShortCut(EmptyStr);
  end;
end;

procedure TfrmMain.actRExplorerStyleExecute(Sender: TObject);
begin
  actRExplorerStyle.Checked:= not actRExplorerStyle.Checked;

  if actRExplorerStyle.Checked then begin
    frmTools.lvRexplorer.ViewStyle:= vsReport;
    iViewStyleRExplorer           := 2;
  end
  else begin
    frmTools.lvRexplorer.ViewStyle:= vsList;
    iViewStyleRExplorer           := 1;
  end;
end;


function TfrmMain.fValidRRunning: boolean;
begin
  Result:= True;
  if not fRterm_Running and
     not fRgui_Running  and
     not bIPRemoteConnected then Result:= False;
end;

procedure TfrmMain.Nvim_R_pluginClick(Sender: TObject);
begin
  pOpen_Url('http://www.vim.org/scripts/script.php?script_id=2628')
end;

procedure TfrmMain.pSendToConsole(sTmp: string);
var
  iPos: integer;

  sTmpPrior: string;

begin
  RHistory.Add(trim(sTmp));
  with frmRterm.synIO do begin
    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    if frmRterm.bRterm_Plus then begin
      LineText  := '+ ' + sTmp;
      frmRterm.bRterm_Plus:= False;
    end
    else
      if (trim(LineText) = '>') or
         (LineText = EmptyStr) then LineText:= '> ' + sTmp
      else begin
        sTmpPrior:= LineText;

        // Remove any trash
        iPos:= Pos('>',
                   sTmpPrior);
        if (iPos <> 0) then Delete(sTmpPrior,
                                   iPos + 1,
                                   length(sTmpPrior));

        // Check if under debug function
        iPos:= Pos(']>',
                   sTmpPrior);
        if (iPos <> 0) then Delete(sTmpPrior,
                                   iPos + 2,
                                   length(sTmpPrior));

        // Final Result
        LineText:= sTmpPrior + ' ' + sTmp;
      end;

    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    frmRTerm.synIO.OnPaintTransient:= TSyn_Transient.pSynPaintTransient;
  end;
end;

procedure TfrmMain.pCheckRterm;
begin
  if not GetFormVisible(frmRterm) then ShowDockForm(frmRterm);

  actRtermVisible.Checked:= GetFormVisible(frmRterm);
end;

procedure TfrmMain.pDoSend(var sTmp: string;
                               bSendToSynIO: boolean = True);
var
  sToSend: string;

begin
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  // Rterm: priority 1
  if fRterm_Running then begin
    pCheckRterm;
    sToSend:= sTmp + #13#10;
    // The order below is important for sincronization: do not change!
    if bSendToSynIO then
      pSendToConsole(sTmp);
    with frmRterm.cRterm do
      SendInput(sToSend);
  end
  // Rgui: priority 2
  else if fRgui_Running then begin
    sToSend:= sTmp;
    fCodeSender.pSendChar(sToSend,
                          hRgui,
                          iDelay);
    pCheckTop;
    pSetFocus_Rgui(iDelay div 4);
  end
  // R server remote: priority 3
  else if bIPRemoteConnected then begin
    if not fUseTCPIP then Exit;

    pCheckRterm;
    sToSend:= sTmp + #13#10;

    if bSendToSynIO then pPrintMessage(sTmp,
                                       True);
    csRGeneral.Socket.SendText(sToSend);
    pSetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmMain.pRemoveLine_Commented(var sTmp: string);
begin
  sTmp:= fRegEx_Multiline(sTmp,
                          //'^[ \{\}\(\)"''''_a-zA-Z0-9,.=-].*' // Get all lines not started by # (R is a language quite promiscuous!!!)
                          '^((?!^#)).*$');                      // \o/
end;

procedure TfrmMain.pRemoveLine_Empty(var sTmp: string);
begin
  sTmp:= fRegEx_Multiline(sTmp,
                          '.*$');  // \o/
end;

function TfrmMain.fGetFile(var bSingleLine: boolean): string;
var
  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;
  sTmp:= (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor.Text;
  if not bRSendAll then pRemoveLine_Commented(sTmp);
  pRemoveLine_Empty(sTmp);

  if bRSmart and
     fSingleLine(sTmp) then begin
    bSingleLine:= True;

    Result:= StringReplace(sTmp,
                           #13#10,
                           EmptyStr,
                           [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPath_Tmp +
              '\file.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then Result:= '.paths[4]';
end;

function TfrmMain.fGetSelectionToReformat(sSel: string): string;
var
  sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;

  sFilePath:= sPath_Tmp +
              '\reformat-input.r';

  if fFile_Save_Fast(sFilePath,
                     sSel) then Result:= '.paths[8]';
end;

function TfrmMain.fGetFileToReformat: string;
var
  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;

  sTmp:= (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor.Text;

  sFilePath:= sPath_Tmp +
              '\reformat-input.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then Result:= '.paths[8]';
end;

function TfrmMain.fSingleLine(sTmp: string): boolean;
begin
  Result:= False;
  if (Pos(#13#10,
          sTmp) <=0) or
     ((length(sTmp) - 1) = Pos(#13#10,
                               sTmp)) then Result:= True;
end;

function TfrmMain.fGetClipboard(var bSingleLine: boolean): string;
var
  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;

  sTmp:= Clipboard.AsText;
  if not bRSendAll then pRemoveLine_Commented(sTmp);
  pRemoveLine_Empty(sTmp);

  if bRSmart and
     fSingleLine(sTmp) then begin
    bSingleLine:= True;

    Result:= StringReplace(sTmp,
                           #13#10,
                           EmptyStr,
                           [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPath_Tmp +
              '\selection.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then begin
    Result:= '.paths[5]';
    RHistory.fLoadFromFile(sFilePath);
  end;  
end;

function TfrmMain.fGetSelection(var bSingleLine: boolean): string;
var
  seEditor: TSynEdit;

  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then sTmp:= SelText
                else Exit;

  if not bRSendAll then pRemoveLine_Commented(sTmp);
  pRemoveLine_Empty(sTmp);

  if bRSmart and
     fSingleLine(sTmp) then begin
    bSingleLine:= True;

    Result:= StringReplace(sTmp,
                           #13#10,
                           EmptyStr,
                           [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPath_Tmp +
              '\selection.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then begin
    Result:= '.paths[5]';
    RHistory.fLoadFromFile(sFilePath);
  end;
end;

function TfrmMain.fGetBlockMarked(var bSingleLine: boolean): string;
var
  aMarks: array of array of integer;

  bcPos: TBufferCoord;

  i,
   iLine,
   iLineBlockBegin,
   iLineBlockEnd: integer;

  seEditor: TSynEdit;
  smOption: TSynSelectionMode;

  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    if (Marks.Count = 0) then Exit;
    iLineBlockBegin:= -1;
    iLineBlockEnd:= Lines.Count;

    // It will generate an array with information about marks
    SetLength(aMarks,
              Marks.Count,
              2);

    for i:= 0 to Marks.Count - 1 do
      if Marks[i].IsBookmark then begin
        aMarks[i, 0]:= Marks[i].BookmarkNumber;
        aMarks[i, 1]:= Marks[i].Line;
      end;

    // Will find both: BlockBegin and BlockEnd near from the cursor
    for i:= 0 to Marks.Count - 1 do
      if (aMarks[i, 1] <= CaretY) and
         (aMarks[i, 1] > iLineBlockBegin) then iLineBlockBegin:= aMarks[i, 1]
      else if (aMarks[i, 1] > CaretY) and
              (aMarks[i, 1] < iLineBlockEnd) then iLineBlockEnd:= aMarks[i, 1];

    BeginUpdate;
    smOption:= SelectionMode;
    if (SelectionMode <> smLine) then SelectionMode:= smLine;
    iLine:= TopLine;
    bcPos:= CaretXY;
    BlockBegin:= BufferCoord(0,
                             iLineBlockBegin);

    BlockEnd:= BufferCoord(0,
                           iLineBlockEnd);

    if SelAvail then sTmp:= SelText
                else Exit;

    SelectionMode:= smOption;
    TopLine:= iLine;
    CaretXY:= bcPos;
    EndUpdate;
  end;

  if not bRSendAll then pRemoveLine_Commented(sTmp);
  pRemoveLine_Empty(sTmp);

  if bRSmart and
     fSingleLine(sTmp) then begin
    bSingleLine:= True;

    Result:= StringReplace(sTmp,
                           #13#10,
                           EmptyStr,
                           [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPath_Tmp +
              '\block.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then begin
    Result:= '.paths[6]';
    RHistory.fLoadFromFile(sFilePath);
  end;
end;

function TfrmMain.fGetContiguous(var bSingleLine: boolean): string;
var
  bEmptyLine,
   bEndOfChunk,
   bValidLine: boolean;

  cTmp: char;

  iCurrent,
   iLines,
   iResult,
   iLineContiguousBegin,
   iLineContiguousEnd: integer;

  seEditor: TSynEdit;

  sLine,
   sTmp,
   sFilePath: string;

  smOption: TSynSelectionMode;

  synSearchOptions: TSynSearchOptions;

  procedure pGoToNextLine;
  begin
    bEmptyLine:= False;

    with seEditor do begin
      CaretX:= 0;
      CaretY:= CaretY + 1;
      iCurrent:= CaretY;
    end;
  end;

  procedure pGoToNextValidLine(iLine: integer);
  begin
    with seEditor do begin
      CaretY    := iLine;
      bValidLine:= False;
      iCurrent  := CaretY;
      iLines    := Lines.Count;

      while (bValidLine = False) and
            (iCurrent < iLines) do begin
        sLine:= trim(LineText);
        try
          if (sLine <> EmptyStr) then cTmp:= sLine[1]
                                 else cTmp:= #32;  // Nothing
        except
          begin
            SelectionMode:= smOption;
            Exit;
          end;
        end;
        case cTmp of
          #10..#13,                                 // LF .. CR,
          #32: pGoToNextLine;                        // Nothing
          #35: if bRSendAll then bValidLine:= True   // #
                            else pGoToNextLine;
          else
            bValidLine:= True;
        end;
      end;
    end;
  end;

  procedure pOthers_GoToNextEmptyLine(iLine: integer);
  begin
    with seEditor do begin
      CaretY    := iLine + 1;
      bEmptyLine:= False;
      iCurrent  := CaretY;
      iLines    := Lines.Count;

      while (bEmptyLine = False) and
            (iCurrent < iLines) do begin
        sLine:= trim(LineText);
        try
          if (sLine <> EmptyStr) then cTmp:= sLine[1]
                                 else cTmp:= #32;  // Nothing
        except
          begin
            SelectionMode:= smOption;
            Exit;
          end;
        end;

        case cTmp of
          #10..#13: bEmptyLine:= True;   // LF .. CR,
          #32     : bEmptyLine:= True;   // Nothing
          #35     : pGoToNextLine;       // #
          else
            pGoToNextLine;
        end;
      end;
    end;
  end;

  procedure pSweave_GoToNextEmptyLine(iLine: integer);
  begin
    with seEditor do begin
      CaretY    := iLine + 1;
      bEmptyLine:= False;
      iCurrent  := CaretY;
      iLines    := Lines.Count;

      while (bEmptyLine = False) and
            (iCurrent <= iLines) do begin
        sLine:= trim(LineText);

        try
          if (sLine <> EmptyStr) then cTmp:= sLine[1]
                                 else cTmp:= #32;  // Nothing
        except
          begin
            SelectionMode:= smOption;
            Exit;
          end;
        end;

        case cTmp of
          #10..#13: bEmptyLine:= True;   // LF .. CR,
          #32     : bEmptyLine:= True;   // Nothing
          #35     : pGoToNextLine;       // #
          #64     : begin                // @ (end of chunk)
                     bEmptyLine:= True;
                     CaretY:= CaretY - 1;
                     bEndOfChunk:= True;
                    end
          else
            pGoToNextLine;
        end;
      end;
    end;
  end;

  function fFindNextChunk: boolean;
  begin
    Result:= True;

    with seEditor do begin
      SearchEngine:= SynEditSearch;
      synSearchOptions:= [];
      iResult:= SearchReplace('>>=',
                              EmptyStr,
                              synSearchOptions);  // It will search the next chunk of Sweave

      if (iResult > 0) then pGoToNextLine
                       else Result:= False;  // It was found the last line of the last chunk
    end;
  end;

begin
  Result:= EmptyStr;
  bEndOfChunk:= False;
  if not fValidRRunning then Exit;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    BeginUpdate;
    smOption:= SelectionMode;

    if (SelectionMode <> smLine) then SelectionMode:= smLine;
    CaretX:= 0;
    iLineContiguousBegin:= CaretY;

    if (cbSyntax.Text = 'Sweave') then pSweave_GoToNextEmptyLine(CaretY)
                                  else pOthers_GoToNextEmptyLine(CaretY);
    iLineContiguousEnd:= CaretY;
    BlockBegin:= BufferCoord(0,
                             iLineContiguousBegin);

    BlockEnd:= BufferCoord(0,
                           iLineContiguousEnd);

    if SelAvail then sTmp:= SelText
    else begin
      EndUpdate;
      SelectionMode:= smOption;
      Exit;
    end;

    CaretX:= 0;
    if (cbSyntax.Text = 'Sweave') and
       bEndOfChunk then fFindNextChunk;

    pGoToNextValidLine(CaretY);
    SelectionMode:= smOption;
    EndUpdate;
  end;

  if not bRSendAll then pRemoveLine_Commented(sTmp);
  pRemoveLine_Empty(sTmp);

  if (sTmp = EmptyStr) then Exit;

  if bRSmart and
     fSingleLine(sTmp) then begin
    bSingleLine:= True;

    Result:= StringReplace(sTmp,
                           #13#10,
                           EmptyStr,
                           [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPath_Tmp +
              '\selection.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then begin
    Result:= '.paths[5]';
    RHistory.fLoadFromFile(sFilePath);
  end;
end;

function TfrmMain.fGetLine(bGoToNextValidLine: boolean;
                           seEditor: TSynEdit): string;
var
  bValidLine,
   bLineWrap: boolean;

  cTmp: char;

  iCurrent,
   iLines,
   iResult: integer;

  sLine,
   sTmp: string;

  smOption: TSynSelectionMode;

  synSearchOptions: TSynSearchOptions;

  procedure pOthers_GoToNextValidLine(iLine: integer);

    procedure pGoToNextLine;
    begin
      bValidLine:= False;
      with seEditor do begin
        CaretX  := 0;
        CaretY  := CaretY + 1;
        iCurrent:= CaretY;
      end;
    end;

  begin
    with seEditor do begin
      CaretY    := iLine;
      bValidLine:= False;
      iCurrent  := CaretY;
      iLines    := Lines.Count;

      while (bValidLine = False) and
            (iCurrent < iLines) do begin
        sLine:= trim(LineText);
        try
          if (sLine <> EmptyStr) then cTmp:= sLine[1]
                                 else cTmp:= #32;  // Nothing
        except
          begin
            SelectionMode:= smOption;
            Exit;
          end;
        end;

        case cTmp of
          #10..#13,                                  // LF .. CR,
          #32: pGoToNextLine;                        // Nothing
          #35: if bRSendAll then bValidLine:= True   // #
                            else pGoToNextLine;
          else
            bValidLine:= True;
        end;
      end;
    end;
  end;

  procedure pSweave_GoToNextValidLine(iLine: integer);

    procedure pGoToNextLine;
    begin
      bValidLine:= False;

      with seEditor do begin
        CaretX  := 0;
        CaretY  := CaretY + 1;
        iCurrent:= CaretY;
      end;
    end;

    function fFindNextChunk: boolean;
    begin
      Result:= True;

      with seEditor do begin
        SearchEngine:= SynEditSearch;
        synSearchOptions:= [];
        iResult:= SearchReplace('>>=',
                                EmptyStr,
                                synSearchOptions);  // It will search the next chunk of Sweave
        if (iResult > 0) then pGoToNextLine
                         else Result:= False;       // It was found the last line of the last chunk
      end;
    end;

  begin
    with seEditor do begin
      CaretY    := iLine;
      bValidLine:= False;
      iCurrent  := CaretY;
      iLines    := Lines.Count;

      while (bValidLine = False) and
            (iCurrent < iLines) do begin
        sLine:= trim(LineText);
        try
          if (sLine <> EmptyStr) then cTmp:= sLine[1]
                                 else cTmp:= #32;  // Nothing
        except
          begin
            SelectionMode:= smOption;
            Exit;
          end;
        end;

        case cTmp of
          #10..#13,                                  // LF .. CR,
          #32: pGoToNextLine;                        // Nothing
          #35: if bRSendAll then bValidLine:= True   // #
                            else pGoToNextLine;
          #64: if not fFindNextChunk then Break;
          else
            bValidLine:= True;
        end;
      end;
    end;
  end;

begin
  Result:= EmptyStr;

  if not fValidRRunning then Exit;

  with seEditor do begin
    BeginUpdate;
    bLineWrap:= False;

    if bScrollSendingLines then begin  // Automatize scroll!
      if WordWrap then begin
        bLineWrap:= True;
        actEditorLineWrapExecute(nil);
      end;
      if (seEditor.CaretY = (seEditor.TopLine + seEditor.LinesInWindow - 1)) then
        TopLine:= CaretY;
      if bLineWrap then actEditorLineWrapExecute(nil);
    end;

    smOption:= SelectionMode;

    if (SelectionMode <> smLine) then SelectionMode:= smLine;

    CaretX:= 0;

    if bGoToNextValidLine then
      if (cbSyntax.Text = 'Sweave') then pSweave_GoToNextValidLine(CaretY)
                                    else pOthers_GoToNextValidLine(CaretY);
    if (CaretY = iLines) then sTmp:= LineText  // Last line without line endings
    else begin
      if (LineText <> EmptyStr) then
        ExecuteCommand(ecSelLineEnd,
                       #0,
                       nil);

      if SelAvail then sTmp:= trim(SelText)
      else begin
        EndUpdate;
        SelectionMode:= smOption;
        Exit;
      end;
    end;

    CaretX:= 0;
    if bGoToNextValidLine then
      if (cbSyntax.Text = 'Sweave') then pSweave_GoToNextValidLine(CaretY + 1)
                                    else pOthers_GoToNextValidLine(CaretY + 1);
    SelectionMode:= smOption;
    EndUpdate;
  end;

  Result:= sTmp;
end;

function TfrmMain.fGetLinesToEndPage(var bSingleLine: boolean): string;
var
  seEditor: TSynEdit;

  smOption: TSynSelectionMode;

  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    BeginUpdate;
    smOption:= SelectionMode;
    if (SelectionMode <> smLine) then SelectionMode:= smLine;
    ExecuteCommand(ecSelPageBottom,
                   #0,
                   nil);

    if SelAvail then sTmp:= SelText
                else Exit;

    SelectionMode:= smOption;
    CaretX:= 0;
    CaretY:= CaretY + 1;
    EndUpdate;
  end;

  if not bRSendAll then pRemoveLine_Commented(sTmp);
  pRemoveLine_Empty(sTmp);

  if bRSmart and
     fSingleLine(sTmp) then begin
    bSingleLine:= True;

    Result:= StringReplace(sTmp,
                           #13#10,
                           EmptyStr,
                           [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPath_Tmp +
              '\lines.r';

  if fFile_Save_Fast(sFilePath,
                     sTmp) then begin
    Result:= '.paths[7]';
    RHistory.fLoadFromFile(sFilePath);
  end;
end;

function TfrmMain.fGetCursorTo(sWay: string): string;
var
  bLineWrapOption: boolean;

  iPos: integer;

  seEditor: TSynEdit;

  smOption: TSynSelectionMode;

begin
  Result:= EmptyStr;
  if not fValidRRunning then Exit;
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;
  with seEditor do begin
    beginUpdate;
    smOption:= SelectionMode;
    bLineWrapOption:= WordWrap;
    if (SelectionMode <> smNormal) then SelectionMode:= smNormal;
    if (WordWrap <> False) then WordWrap:= False;
    iPos:= CaretX;

    // CursorToBeginningLine
    if (sWay = 'BeginningLine') then begin
      if not SelAvail then ExecuteCommand(ecSelLineStart,
                                          #0,
                                          nil);
    end
    // CursorToEndLine
    else
      if not SelAvail then ExecuteCommand(ecSelLineEnd,
                                          #0,
                                          nil);

    if SelAvail then Result:= SelText
    else begin
      Result       := EmptyStr;
      SelectionMode:= smOption;
      WordWrap     := bLineWrapOption;
      CaretX       := iPos;
      EndUpdate;
      Exit;
    end;

    SelectionMode:= smOption;
    WordWrap     := bLineWrapOption;
    CaretX       := iPos;
    EndUpdate;
  end;
end;

function TfrmMain.fGetPathFile(bFull: boolean = False): string;
var
  sDos: string;

  i: integer;

begin
  Result:= EmptyStr;

  if not fValidRRunning then Exit;
  i:= fFindTopWindow;

  if ((Self.MDIChildren[i] as TfrmEditor).synEditor.Modified = True) then actFileSaveExecute(Self);
  sDos:= (Self.MDIChildren[i] as TfrmEditor).sActiveFile;

  if bFull then Result:= DosPathToUnixPath(sDos)
           else Result:= DosPathToUnixPath(ExtractFilePath(sDos));
end;

procedure TfrmMain.actRSendFileExecute(Sender: TObject);
var
  sTmp,
   sToSend: string;

  bSingleLine: boolean;

begin
  sToSend:= fGetFile(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    if bREcho then
      sTmp:= 'source(' +
             sToSend +
             ', echo=TRUE' +
             ', max.deparse.length=' +
             IntToStr(iMaxDeparseLength) +
             ')'
    else
      sTmp:= 'source(' +
             sToSend +
             ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendSelectionExecute(Sender: TObject);
var
  sTmp,
   sToSend: string;

  bSingleLine: boolean;

begin
  sToSend:= fGetSelection(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    if bREcho then
      sTmp:= 'source(' +
             sToSend +
             ', echo=TRUE' +
             ', max.deparse.length=' +
             IntToStr(iMaxDeparseLength) +
             ')'
    else
      sTmp:= 'source(' +
             sToSend +
             ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendSmartExecute(Sender: TObject);

  procedure pDoSend_RU(var sTmp: string);
  var
    sToSend: string;

  begin
    // Rterm: priority 1
    if fRterm_Running then begin
      pCheckRterm;
      sToSend:= sTmp + #13#10;
      // The order below is important for sincronization: do not change!
      with R_Useful.cRTerm_RU do
        SendInput(sToSend);
    end;
//    // Rgui: priority 2
//    else if fRgui_Running then begin
//      sToSend:= sTmp;
//      fCodeSender.pSendChar(sToSend,
//                            hRgui,
//                            iDelay);
//      pCheckTop;
//      pSetFocus_Rgui(iDelay div 4);
//    end
//    // R server remote: priority 3
//    else if bIPRemoteConnected then begin
//      if not fUseTCPIP then Exit;
//
//      pCheckRterm;
//      sToSend:= sTmp + #13#10;
//
//      if bSendToSynIO then pPrintMessage(sTmp,
//                                         True);
//      csRGeneral.Socket.SendText(sToSend);
//      pSetFocus_Rgui(iDelay div 4);
//    end;
  end;

var
  bGoToNextValidLine: boolean;

  sTmp: string;

  seEditor: TSynEdit;

  iBegin,
   iEnd,
   iLen: integer;

begin
  fMessageDlg('This feature is still in development.' + #13 + #13 +
              'It will soon be available!',
              mtInformation,
              [mbOk],
              0);
  Exit;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    bGoToNextValidLine:= not bSendToREditing;

    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;
  end;

  // Be sure that the instance of the class 'TRSend_Smart' will be created when necessary
  if not Assigned(RSend_Smart) then RSend_Smart:= TRSend_Smart.Create;

  // If not exists, it will create a new instance of the editor
  // it will be destroyed in OnCloseQuery event
  if not Assigned(seTmp) then begin
    seTmp:= TSynEdit.Create(Self);
    seTmp.Parent:= panInvisibleParent;
  end;

  with seTmp do begin
    BeginUpdate;
    Lines:= seEditor.Lines;
    CaretXY:= seEditor.CaretXY;
    EndUpdate;
  end;

  with RSend_Smart do begin
    pSet_Editor(seTmp);  // Set a copy of the active editor to the instance of the class TRSend_Smart!
                         // This is important because of the large volume of operations that are done on the editor lines.

//    sTmp:= fGetLine(False);
//    pDoSend_RU(sTmp);

    if fIsSmart_Context(R_Useful) then begin
      if fGetSmart_Block(iBegin,
                         iEnd,
                         iLen) then begin
        with seEditor do begin
          BlockBegin:= BufferCoord(0,
                                   iBegin);

          BlockEnd:= BufferCoord(iLen + 1,
                                 iEnd);
        end;
        actRSendSelectionExecute(Self);
      end
      else
        fMessageDlg('Sorry, it was not possible to find the smart context!' + #13 + #13 +
                    'Please, send a emal to the developers' + #13 +
                    'with the block of code and the cursor position.',
                    mtInformation,
                    [mbOk],
                    0);
    end  //fIsSmart_Context
    else begin  // Not in smart context, it will try to send the single line
      sTmp:= fGetLine(bGoToNextValidLine,
                      seEditor);
      if (sTmp = EmptyStr) then Exit;

      pDoSend(sTmp);
    end;
  end;  //with RSend_Smart
end;

procedure TfrmMain.actRSendClipboardExecute(Sender: TObject);
var
  sTmp,
   sToSend: string;

  bSingleLine: boolean;

begin
  sToSend:= fGetClipboard(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    if bREcho then
      sTmp:= 'source(' +
             sToSend +
             ', echo=TRUE' +
             ', max.deparse.length=' +
             IntToStr(iMaxDeparseLength) +
             ')'
    else
      sTmp:= 'source(' +
             sToSend +
             ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendBlockMarkedExecute(Sender: TObject);
var
  sTmp,
   sToSend: string;

  bSingleLine: boolean;

begin
  sToSend:= fGetBlockMarked(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    if bREcho then
      sTmp:= 'source(' +
             sToSend +
             ', echo=TRUE' +
             ', max.deparse.length=' +
             IntToStr(iMaxDeparseLength) +
             ')'
    else
      sTmp:= 'source(' +
             sToSend +
             ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendSourceContiguousExecute(Sender: TObject);
{
var
  sTmp,
   sToSend: string;
  bSingleLine: boolean;
}
begin
{
  sToSend:= fGetContiguous(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ')';

  pDoSend(sTmp);
}  
end;

procedure TfrmMain.actRSendContiguousExecute(Sender: TObject);
var
  sTmp,
   sToSend: string;

  bSingleLine: boolean;

begin
  sToSend:= fGetContiguous(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    if bREcho then
      sTmp:= 'source(' +
             sToSend +
             ', echo=TRUE' +
             ', max.deparse.length=' +
             IntToStr(iMaxDeparseLength) +
             ')'
    else
      sTmp:= 'source(' +
             sToSend +
             ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendLineExecute(Sender: TObject);
var
  bGoToNextValidLine: boolean;

  sTmp: string;

  seEditor: TSynEdit;

  i: integer;

begin
  i:= fFindTopWindow;
  if not Assigned(Self.MDIChildren[i] as TfrmEditor) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do begin
    bGoToNextValidLine:= not bSendToREditing;
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;
  end;

  seEditor.OnPaintTransient:= nil;
  frmRTerm.synIO.OnPaintTransient:= nil;

  sTmp:= fGetLine(bGoToNextValidLine,
                  seEditor);
  seEditor.OnPaintTransient:= TSyn_Transient.pSynPaintTransient;

  if (sTmp = EmptyStr) then begin
    frmRTerm.synIO.OnPaintTransient:= TSyn_Transient.pSynPaintTransient;
    Exit;
  end;

  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendLinesToEndPageExecute(Sender: TObject);
var
  bSingleLine: boolean;

  sTmp,
   sToSend: string;

begin
  sToSend:= fGetLinesToEndPage(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    if bREcho then
      sTmp:= 'source(' +
             sToSend +
             ', echo=TRUE' +
             ', max.deparse.length=' +
             IntToStr(iMaxDeparseLength) +
             ')'
    else
      sTmp:= 'source(' +
             sToSend +
             ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRCurrentLineToTopExecute(Sender: TObject);
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    TopLine:= CaretY;
    CaretX := 0;
  end;

  pCheckTop;
  pSetFocus_Rgui(iDelay);
end;

procedure TfrmMain.actRSendCursorToBeginningLineExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= fGetCursorTo('BeginningLine');
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendCursorToEndLineExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= fGetCursorTo('EndLine');
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRSendSweaveExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sUnix,
   sLatex_File,
   sLatex_Old: string;

begin
  sUnix:= fGetPathFile(True);

  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
          fGetPathFile(False) +
          ''')' + #13#10;

  if (csRGeneral.Active) then csRGeneral.Socket.SendText(sTmp);
  Application.ProcessMessages;

  sTmp:= 'Sweave(''' +
         sUnix +
         ''')';

  pDoSend(sTmp);

  sLatex_File:= UnixPathToDosPath(ChangeFileExt(sUnix,
                                                '.tex'));

  sLatex_Old:= StringReplace(sLatex_File,
                             '.tex',
                             '.old',
                             []);

  // It will rename the file to delete the file .old
  if FileExists(sLatex_Old) then
    Windows.DeleteFile(PChar(sLatex_Old));

  // It will avoid the procedure pUpdateFileIntoTinn(.tex)
  // when R takes too long to generate a new one.
  if FileExists(sLatex_File) then
    RenameFile(sLatex_File, sLatex_Old);

  Application.ProcessMessages;

  i:= 1;
  repeat
    Sleep(5*iDelay);

    if FileExists(sLatex_File) and
       not fFile_InUse(sLatex_File) then begin
      pUpdateFileIntoTinn(sLatex_File);
      Break;
    end;

    inc(i);
  until (i = 20);

  // The new .tex was not created by R, so, it will must be regenerated.
  if FileExists(sLatex_Old) and
     not FileExists(sLatex_File) then begin
     RenameFile(sLatex_Old, sLatex_File);
     pUpdateFileIntoTinn(sLatex_File);
  end;
  
end;

procedure TfrmMain.actRSendKnitPdfExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sUnix,
   sLatex_File,
   sLatex_Old: string;

begin
  sUnix:= fGetPathFile(True);
  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
          fGetPathFile(False) +
          ''')' + #13#10;

  if (csRGeneral.Active) then csRGeneral.Socket.SendText(sTmp);
  Application.ProcessMessages;

  if (bRRequireKnitr) then begin
    bRRequireKnitr:= False;

    if (sKnit = EmptyStr) then
      sTmp:= 'require(knitr); knit(''' +
             sUnix +
             '''' +
             ')'
    else
      sTmp:= 'require(knitr); knit(''' +
             sUnix +
             '''' +
             ', ' +
             sKnit +
             ')'
  end
  else begin
    if (sKnit = EmptyStr) then
      sTmp:= 'knit(''' +
             sUnix +
             '''' +
             ')'
    else
      sTmp:= 'knit(''' +
             sUnix +
             '''' +
             ', ' +
             sKnit +
             ')'
  end;

  sLatex_File:= ChangeFileExt(UnixPathToDosPath(sUnix),
                                                '.tex');

  sLatex_Old:= StringReplace(sLatex_File,
                             '.tex',
                             '.old',
                             []);

  // It will rename the file to delete the file .old
  if FileExists(sLatex_Old) then
    Windows.DeleteFile(PChar(sLatex_Old));

  // It will avoid the procedure pUpdateFileIntoTinn(.tex)
  // when R takes too long to generate a new one.
  if FileExists(sLatex_File) then
    RenameFile(sLatex_File, sLatex_Old);

  Application.ProcessMessages;

  pDoSend(sTmp);

  i:= 1;
  repeat
  Sleep(5*iDelay);

    if FileExists(sLatex_File) and
       not fFile_InUse(sLatex_File) then begin
      pUpdateFileIntoTinn(sLatex_File);
      Break;
    end;

    inc(i);
  until (i = 20);

  // The new .tex was not created by R, so, it will must be regenerated.
  if FileExists(sLatex_Old) and
     not FileExists(sLatex_File) then begin
     RenameFile(sLatex_Old, sLatex_File);
     pUpdateFileIntoTinn(sLatex_File);
  end;
end;

procedure TfrmMain.actRSendKnitHtmlExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sUnix,
   sMarkdown_File,
   sMarkdown_Old,
   sHtml_File,
   sHtml_Old: string;

begin
  sUnix:= fGetPathFile(True);
  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
          fGetPathFile(False) +
          ''')' + #13#10;

  if (csRGeneral.Active) then csRGeneral.Socket.SendText(sTmp);
  Application.ProcessMessages;

  if (bRRequireKnitr) then begin
    bRRequireKnitr:= False;

    if (sKnit = EmptyStr) then
      sTmp:= 'require(knitr); knit2html(''' +
             sUnix +
             '''' +
             ')'
    else
      sTmp:= 'require(knitr); knit2html(''' +
             sUnix +
             '''' +
             ', ' +
             sKnit +
             ')'
  end
  else begin
    if (sKnit = EmptyStr) then
      sTmp:= 'knit2html(''' +
             sUnix +
             '''' +
             ')'
    else
      sTmp:= 'knit2html(''' +
             sUnix +
             '''' +
             ', ' +
             sKnit +
             ')'
  end;

  pDoSend(sTmp);

  sMarkdown_File:= UnixPathToDosPath(ChangeFileExt(sUnix,
                                                   '.md'));

  sMarkdown_Old:= StringReplace(sHtml_File,
                                '.md',
                                '.old',
                                []);

  sHtml_File:= UnixPathToDosPath(ChangeFileExt(sUnix,
                                               '.html'));

  sHtml_Old:= StringReplace(sHtml_File,
                            '.html',
                            '.old',
                            []);

  // It will rename the file to delete the file .old
  if FileExists(sMarkdown_Old) then
    Windows.DeleteFile(PChar(sMarkdown_Old));

  // It will rename the file to delete the file .old
  if FileExists(sHtml_Old) then
    Windows.DeleteFile(PChar(sHtml_Old));

  // It will avoid the procedure pUpdateFileIntoTinn(.html)
  // when R takes too long to generate a new one.
  if FileExists(sMarkdown_File) then
    RenameFile(sMarkdown_File,
               sMarkdown_Old);

  // It will avoid the procedure pUpdateFileIntoTinn(.html)
  // when R takes too long to generate a new one.
  if FileExists(sHtml_File) then
    RenameFile(sHtml_File,
               sHtml_Old);

  Application.ProcessMessages;

  i:= 1;
  repeat
    Sleep(5*iDelay);

    // Do not change the order of the pUpdateFileIntoTinn
    if not fFile_InUse(sMarkdown_File) and
       not fFile_InUse(sHtml_File) then begin

         if FileExists(sMarkdown_File) and  // *.Rhtml do not generate *.md
            not fFile_InUse(sMarkdown_File) then pUpdateFileIntoTinn(sMarkdown_File);

         if FileExists(sHtml_File) and
            not fFile_InUse(sHtml_File) then pUpdateFileIntoTinn(sHtml_File);

        if (actHtmlOpenAlways.Checked) then actHtmlOpenCurrentFileExecute(nil);

        Break;
    end;

    inc(i);
  until (i = 20);

  // The new .md was not created by R, so, it will must be regenerated.
  if FileExists(sMarkdown_Old) and
     not FileExists(sMarkdown_File) then begin
     RenameFile(sMarkdown_Old,
                sMarkdown_File);

     pUpdateFileIntoTinn(sMarkdown_File);
  end;

  // The new .html was not created by R, so, it will must be regenerated.
  if FileExists(sHtml_Old) and
     not FileExists(sHtml_File) then begin
     RenameFile(sHtml_Old,
                sHtml_File);

     pUpdateFileIntoTinn(sHtml_File);
  end;

end;

procedure TfrmMain.actRContSetWorkDirectoryExecute(Sender: TObject);
var
  sTmp,
   sUnix: string;

begin
  sUnix:= fGetPathFile;
  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
         sUnix +
         ''')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRContListAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= 'ls()';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPrintVariableContentExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= fFindWord_Extended(fGet_Syn);

  if (sTmp = EmptyStr) then begin
    fMessageDlg('No valid word selected!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;

  pDoSend(sTmp);
end;

procedure TfrmMain.actRContListVariableNamesExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= fFindWord_Extended(fGet_Syn);

  if (sTmp = EmptyStr) then begin
    fMessageDlg('No valid word selected!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;
  sTmp:= 'names(' +
          sTmp +
          ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRContListVariableStructureExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= fFindWord_Extended(fGet_Syn);

  if (sTmp = EmptyStr) then begin
    fMessageDlg('No valid word selected!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;
  sTmp:= 'str(' +
          sTmp +
          ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRContOpenExampleSelectedWordExecute(Sender: TObject);

  function fGetWord(var sTopic,
                        sPackage: string): boolean;
  var
    sTmp: string;

  begin
    Result:= False;

    if not fValidRRunning then Exit;

    sTmp:= fFindWord_Extended(fGet_Syn,
                              True);

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Result:= False;
      Exit;
    end;

    // https://regex101.com/r/kB2eR5/1
    //$re = '/(?<=::).+$/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sTopic:= fRegEx(sTmp,
                    '(?<=::).+$',
                    False);

    if (sTopic = EmptyStr) then sTopic:= sTmp;

    // https://regex101.com/r/bZ6tF2/2
    //$re = '/(?i)^[a-z0-9]+(?=::)/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sPackage:= fRegEx(sTmp,
                      '(?i)^[a-z0-9]+(?=::)',
                      False);

    Result:= True;
  end;

  procedure pSetArgs(var sInfo,
                         sTopic,
                         sPackage,
                         sFile: string);
  begin
    // topic
    sInfo:= StringReplace(sInfo,
                          '%topic',
                          sTopic,
                          []);

    // package
    if (sPackage <> EmptyStr) then
      sInfo:= StringReplace(sInfo,
                            'NULL',
                            '''' +
                            sPackage
                            + '''',
                            []);

    // file
    sInfo:= StringReplace(sInfo,
                          '%file',
                          DosPathToUnixPath(sFile),
                          []);
  end;


var
  i: integer;

  sInfo,
   sToSend,
   sSource,
   sResult,
   sTopic,
   sPackage: string;

begin
  try
    if not fGetWord(sTopic,
                    sPackage) then Exit;

    if (sPackage = EmptyStr) then
      sResult:= sPath_Tmp +
                '\' +
                sTopic +
                '.R'
    else
      sResult:= sPath_Tmp +
                '\' +
                sTopic +
                '_' +
                sPackage +
                '.R';

    sInfo:= fFile_ToString(sUtilsOrigin +
                           '\example.R');

    pSetArgs(sInfo,
             sTopic,
             sPackage,
             sResult);

    sSource:= sPath_Tmp +
              '\' +
              'example.R';

    if fFile_Save_Fast(sSource,
                       sInfo) then sToSend:= 'source(' +
                                             '''' +
                                             DosPathToUnixPath(sSource) +
                                             '''' +
                                             ')';

    // Disable ReturnFocus: Temporary to avoid a flicker in the TBRMain
    if fRgui_Running and
       bRguiReturnFocus then actRguiReturnFocus.Checked:= False;
    Application.ProcessMessages;

    pDoSend(sToSend);

    i:= 1;
    repeat
      Sleep(5*iDelay);

      if FileExists(sResult) and
         not fFile_InUse(sResult) then Break
                                  else inc(i);
    until (i = 50);

    if not FileExists(sResult) then begin
      fMessageDlg(sResult + #13 + #13 +
                  'The file was not found!',
                  mtWarning,
                  [mbOk],
                  0);
      Exit;
    end;

    if (fFile_ToString(sResult) = EmptyStr) then begin
      with stbMain do begin
        Beep;
        Panels[8].Text:= 'Example not found!';
      end;

      Exit;
    end
    else
      pOpenFileIntoTinn(sResult,
                        0,
                        False,
                        False);
  finally
    //TODO
  end;
end;

procedure TfrmMain.actRContEditVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= fFindWord_Extended(fGet_Syn);

  if (sTmp = EmptyStr) then begin
    fMessageDlg('No valid word selected!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;
  sTmp:= 'edit(' +
          sTmp +
          ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRContFixVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= fFindWord_Extended(fGet_Syn);

  if (sTmp = EmptyStr) then begin
    fMessageDlg('No valid word selected!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;
  sTmp:= 'fix(' +
          sTmp +
          ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPlotVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= fFindWord_Extended(fGet_Syn);

  if (sTmp = EmptyStr) then begin
    fMessageDlg('No valid word selected!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;
  sTmp:= 'plot(' +
          sTmp +
          ')';

  pDoSend(sTmp);
end;

procedure TfrmMain.pSendRCustom(sRC: string);
var
  bSingleLine: boolean;

  sTmp,
   sToSend: string;

begin
  if not fValidRRunning then Exit;

  if (Pos('%f',
          sRC) > 0) then begin
    if (pgFiles.PageCount = 0) then Exit;

    sToSend:= '''' +
              (Self.MDIChildren[fFindTopWindow] as TfrmEditor).sActiveFile +
              '''';

    sTmp:= StringReplace(sRC,
                         '%f',
                         DosPathToUnixPath(sToSend),
                         [rfReplaceAll]);
  end
  else if (Pos('%s',
               sRC) > 0) then begin
    if (pgFiles.PageCount = 0) then Exit;
    sToSend:= fGetSelection(bSingleLine);  // Get slection

    if (sToSend = EmptyStr) then begin
      sToSend:= fFindWord_Extended(fGet_Syn);        // Get word

      if (sToSend = EmptyStr) then begin
        fMessageDlg('No valid word selected!',
                    mtInformation,
                    [mbOk],
                    0);
        Exit;
      end;
    end;
    sTmp:= StringReplace(sRC,
                         '%s',
                         sToSend,
                         [rfReplaceAll]);
  end
  else sTmp:= sRC;

  pDoSend(sTmp);
end;

procedure TfrmMain.pDoClearConsole;
var
  sToSend: string;

begin
  if not fValidRRunning then Exit;

  // Rterm: priority 1
  if fRterm_Running then begin
    pCheckRterm;

    if frmRterm.bRUnderDebug_Function or
       frmRterm.bRUnderDebug_Package then begin

      with frmRterm do begin
        synIO.LineText:= sRDebugPrefix +
                         ' ';
        synIO.ExecuteCommand(ecLineEnd,
                             #0,
                             nil);
      end;
    end
    else sToSend:= EmptyStr + #13#10;

    frmRterm.cRterm.SendInput(sToSend);
    Exit;
  end;

  // Rgui: priority 2
  if fRgui_Running then begin
    sToSend:= '^l';
    fCodeSender.pDoPrepare;
    fCodeSender.pSendString(sToSend);
    pCheckTop;
    pSetFocus_Rgui(iDelay);
    Exit;
  end;

  // R remote: priority 3
  if bIPRemoteConnected then begin
    if not fUseTCPIP then Exit;
    frmRterm.synIO.Clear;
    sToSend:= EmptyStr + #13#10;
    csRGeneral.Socket.SendText(sToSend);
    pSetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmMain.actRContClearConsoleExecute(Sender: TObject);
begin
  actRtermIOandLogClearExecute(nil);
end;

procedure TfrmMain.actRContCloseAllGraphicsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= 'graphics.off()';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContRemoveAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= 'rm(list=ls())';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContClearAllExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sToSend: string;

  seLog: TSynEdit;

begin
  if not fValidRRunning then Exit;

  // Rterm: priority 1
  if fRterm_Running then begin
    //Sleep(2*iDelay);

    // IO
    with frmRterm.synIO do begin
      for i:= 0 to 9 do
        ClearBookMark(i);
      Clear;
    end;

    // Log
    if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                  else seLog:= frmRterm.synLog;

    with seLog do begin
      for i:= 0 to 9 do
        ClearBookMark(i);
      Clear;
    end;
  end;

  // It is necessary due to bug when many graphical devices are opened
  // http://groups.google.com/forum/?fromgroups#!forum/tinn-r
  // R crashes when performing a 'clear all' operation with lots of graph devices.
  // So it clear the console first
  // Rterm: priority 2
  if fRgui_Running then begin
    pCheckTop;
    pSetFocus_Rgui(iDelay div 2);
    sToSend:= '^l';
    fCodeSender.pDoPrepare;
    fCodeSender.pSendString(sToSend);
  end;

  sTmp:= 'rm(list=ls()); graphics.off()';
  pDoSend(sTmp);

  // Rterm: priority 1
  if fRterm_Running then begin
    Exit;
  end;

  // Rgui: priority 2
  if fRgui_Running then begin
    Exit;
  end;

  // R remote: priority 3
  if bIPRemoteConnected then begin
    if not fUseTCPIP then Exit;
    with frmRterm.synIO do begin
      for i:= 0 to 9 do
        ClearBookMark(i);
      Clear;
    end;

    sToSend:= EmptyStr + #13#10;
    csRGeneral.Socket.SendText(sToSend);
    pSetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmMain.actRContEscapeExecute(Sender: TObject);
var
  sTmp: string;

begin
  stbMain.Panels[9].Text:= EmptyStr;
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  if not (fRgui_Running) then Exit;
  //if fUseTCPIP then Exit;
  sTmp:= '{ESC}';
  fCodeSender.pDoPrepare;
  fCodeSender.pSendString(sTmp);
  pCheckTop;
  pSetFocus_Rgui(iDelay);
end;

procedure TfrmMain.actRContHelpSelectedWordExecute(Sender: TObject);

  function fGetWord: string;
  var
    sTmp,
      sTopic,
      sPackage: string;

  begin
    Result:= EmptyStr;
    if not fValidRRunning then Exit;
    sTmp:= fFindWord_Extended(fGet_Syn,
                              True);

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Exit;
    end;

    // https://regex101.com/r/kB2eR5/1
    //$re = '/(?<=::).+$/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sTopic:= fRegEx(sTmp,
                    '(?<=::).+$',
                    False);

    if (sTopic = EmptyStr) then sTopic:= sTmp;

    // https://regex101.com/r/bZ6tF2/2
    //$re = '/(?i)^[a-z0-9]+(?=::)/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sPackage:= fRegEx(sTmp,
                      '(?i)^[a-z0-9]+(?=::)',
                      False);

    if (sPackage = EmptyStr) then
      Result:= 'help(' +
               sTopic +
               ')'
    else
      Result:= 'help(' +
               sTopic +
               ', package=' +
               '''' +
               sPackage +
               '''' +
               ')';
   end;

var
  sTmp: string;

begin
  sTmp:= fGetWord;
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContExampleSelectedWordExecute(Sender: TObject);

  function fGetWord: string;
  var
    sTmp,
      sTopic,
      sPackage: string;

  begin
    Result:= EmptyStr;
    if not fValidRRunning then Exit;
    sTmp:= fFindWord_Extended(fGet_Syn,
                              True);

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Exit;
    end;

    // https://regex101.com/r/kB2eR5/1
    //$re = '/(?<=::).+$/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sTopic:= fRegEx(sTmp,
                    '(?<=::).+$',
                    False);

    if (sTopic = EmptyStr) then sTopic:= sTmp;

    // https://regex101.com/r/bZ6tF2/2
    //$re = '/(?i)^[a-z0-9]+(?=::)/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sPackage:= fRegEx(sTmp,
                      '(?i)^[a-z0-9]+(?=::)',
                      False);

    if (sPackage = EmptyStr) then
      Result:= 'example(' +
               sTopic +
               ')'
    else
      Result:= 'example(' +
               sTopic +
               ', package=' +
               '''' +
               sPackage +
               '''' +
               ')';
   end;

var
  sTmp: string;

begin
  sTmp:= fGetWord;
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContHelpExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fValidRRunning then Exit;
  sTmp:= 'help.start(update=FALSE)';
  pDoSend(sTmp);
end;

procedure TfrmMain.actREnvironmentRefreshExecute(Sender: TObject);

 procedure pReadTmpFile(sRFile: string);
 var
   strlFromRServer: TStringList;

 begin
   try
     strlFromRServer:= TStringList.Create;
     strlFromRServer.LoadFromFile(sRFile);
     strlFromRServer.Delete(0);

     with frmTools.cbbToolsREnvironment do begin
       Items.Assign(strlFromRServer);
       ItemIndex:= 0;
     end;
   finally
     FreeAndNil(strlFromRServer);
   end;
 end;

var
  i,
   iFocus: integer;

  bFileExists: boolean;

  sTmp,
   sToSend,
   sRFile : string;

begin
  stbMain.Panels[9].Text:= EmptyStr;

  iFocus:= fGetFocus;

  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;
  try
    sRFile:= sPath_Tmp + '\Search.txt';
    sTmp:= 'trObjSearch(' +
           'path=.paths[2]' +
           ')';

    // Rterm: priority 2.1
    if fRterm_Running then begin
      sToSend:= sTmp + #13#10;

      if (csREnvironment.Active) then csREnvironment.Socket.SendText(sToSend)
      else begin
        pCheckRterm;
        frmRterm.cRterm.SendInput(sToSend);
        pSendToConsole(sTmp);
      end;

    end
    else // Rgui: priority 2.2
      if fRgui_Running then begin
        sToSend:= sTmp;

        if (csREnvironment.Active) then csREnvironment.Socket.SendText(sToSend +
                                                                       #13#10)
                                   else fCodeSender.pSendChar(sToSend,
                                                              hRgui);

        pSetFocus_Rgui(iDelay div 4);
      end;

    i:= 0;
    repeat
      bFileExists:= False;
      Sleep(iDelay);
      if FileExists(sRFile) then begin
        bFileExists:= True;
        pReadTmpFile(sRFile);
      end;
      inc(i);
    until bFileExists or
          (i = 10);

    DeleteFile(sRFile);

    pCheckTop;

    if fRgui_Running then pSetFocus_Rgui(iDelay)
    else begin
      case iFocus of
         // synEditor1
         1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
              if CanFocus then SetFocus;
         // synEditor2
         2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
              if CanFocus then SetFocus;
         // synIO
         3: with (frmRterm.synIO as TSynEdit) do
              if CanFocus then SetFocus;
      end;
    end;
  except
    // TODO
  end;
end;

procedure TfrmMain.actRExplorerRefreshExecute(Sender: TObject);
var
  i,
   iFocus: integer;

  bFileExists: boolean;

  sRFile,
   sTmp,
   sToSend,
   sGroup,
   sAllNames: string;

  procedure pReadTmpFile(resRFile: string);
  var
    strlFromR: TStringList;

  begin
    try
      try
        strlFromR:= TStringList.Create;
        strlFromR.LoadFromFile(resRFile);

        if (strlFromR.Count = 0) then begin
          FreeAndNil(strlFromR);
          Sleep(iDelay);
          pReadTmpFile(sRFile);
        end;
        //strlFromRServer.Delete(0);
        pMakeTreeRExplorer_TmpFile(strlFromR);
      except
       on EFOpenError do begin
         FreeAndNil(strlFromR);
         Sleep(iDelay);
         pReadTmpFile(sRFile);
       end;
      end;
    finally
      FreeAndNil(strlFromR);
    end;
 end;

begin
  iFocus:= fGetFocus;

  try
    case frmTools.cbbToolsRExplorer.ItemIndex of
      { ***Options of the cbbToolsRExplorer***
      All
      All [- fx]
      Function
      Vector
      Matrix
      Frame
      Array
      List
      Table
      Other
      }

      0: sGroup:= EmptyStr;  // All
      1: sGroup:= 'data';    // All [-fx]
      2: sGroup:= 'function';
      3: sGroup:= 'vector';
      4: sGroup:= 'matrix';
      5: sGroup:= 'data.frame';
      6: sGroup:= 'array';
      7: sGroup:= 'list';
      8: sGroup:= 'table';
      9: sGroup:= 'other';       

    end;

    frmTools.lvRExplorer.Clear;
    if bAllNames then sAllNames:= EmptyStr
                 else sAllNames:= ', all.names=F';

    sRFile:= sPath_Tmp + '\objects.txt';
    sTmp  := 'trObjList(' +
             'envir=''' +
             frmTools.cbbToolsREnvironment.Text +
             '''' +
             ', ' +
             'pattern=''' +
             frmTools.edToolsRExplorerFilter.Text +
             '''' +
             ', ' +
             'group=''' +
             sGroup +
             '''' +
             ', ' +
             'path=.paths[3]' +
             sAllNames +
             ')';

    // Rterm: priority 2.1
    if fRterm_Running then begin
      sToSend:= sTmp + #13#10;

      if (csRExplorer.Active) then csRExplorer.Socket.SendText(sToSend)
      else begin
        pCheckRterm;
        frmRterm.cRterm.SendInput(sToSend);
        pSendToConsole(sTmp);
      end;
    end
    else // Rgui: priority 2.2
      if fRgui_Running then begin
        sToSend:= sTmp;

        if (csRExplorer.Active) then csRExplorer.Socket.SendText(sToSend +
                                                                 #13#10)
                                else fCodeSender.pSendChar(sToSend,
                                                           hRgui);

        pSetFocus_Rgui(iDelay div 4);
      end;

    i:= 0;
    repeat
      bFileExists:= False;
      Sleep(iDelay);
      if FileExists(sRFile) then begin
        bFileExists:= True;
        pReadTmpFile(sRFile);
      end;
      inc(i);
    until bFileExists or
          (i = 10);

    DeleteFile(sRFile);

    pCheckTop;

    if fRgui_Running then pSetFocus_Rgui(iDelay)
    else begin
      case iFocus of
         // synEditor1
         1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
              if CanFocus then SetFocus;
         // synEditor2
         2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
              if CanFocus then SetFocus;
         // synIO
         3: with (frmRterm.synIO as TSynEdit) do
              if CanFocus then SetFocus;
      end;
    end;
  except
    // TODO
  end;
  //splTools.Update;
end;

procedure TfrmMain.actProjectReloadExecute(Sender: TObject);
begin
  pCheckIfProjectWasChanged;
  Application.ProcessMessages;

  pToolsProjectControls(False);
  with frmTools.tvProject.Items do begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;
  if Assigned(slProjectChanges) then slProjectChanges.Clear;
  bProjectChanged:= False;

  pClearStatusBarProject;
  pOpenFileIntoTinn(sProjectName);
end;

procedure TfrmMain.actProjectEditExecute(Sender: TObject);
begin
  pOpenFileIntoTinn(sProjectName,
                    0,
                    True);
end;

procedure TfrmMain.pBackupSystemConfiguration(bStarting: boolean);
var
  sBackup: string;

  sd: TSaveDialog;

begin
  sd:= TSaveDialog.Create(Self);

  with sd do begin
    InitialDir:= sWorkingDir;
    if not bStarting then FileName:= 'Tinn-R_' + fGetBuildInfo + '_full_bkp'
                     else FileName:= 'Tinn-R_prior_to2_bkp';
    Filter    := 'Tinn backup (*.zip)|*.zip';
    DefaultExt:= '.zip';
  end;

  try
    if sd.Execute then begin
      if not bStarting then frmMain.Refresh;
      sBackup:= sd.FileName;
      if FileExists(sBackup) then begin
        if (fMessageDlg(sBackup + #13 + #13 +
                        'Do you want to overwrite this file?',
                        mtConfirmation,
                        [mbYes, mbCancel],
                        0) <> idYes) then Exit;
        DeleteFile(sBackup);
      end;

      try
        if not bStarting then begin
          pWriteIniFile_Application(True);
          pWriteIniFile_Editor(True);
        end;

        with zipKit do begin
          StoreOptions:= [soRecurse];  // soRecurse: will include all files of all folders and sub-folders
          FileName:= sBackup;
          BaseDirectory:= sPath_Ini;
          AddFiles('*.*',
                   faAnyFile);
          Save;
        end;

        if not bStarting then
          fMessageDlg(sBackup + #13 + #13 +
                      'The backup of Tinn-R INI was done' + #13 +
                      'successfully in the file above!',
                      mtInformation,
                      [mbOk],
                      0)
        else
          fMessageDlg(sBackup + #13 + #13 +
                      'The backup of old Tinn-R INI was done' + #13 +
                      'successfully in the file above!',
                      mtInformation,
                      [mbOk],
                      0);
      except
        if not bStarting then
          fMessageDlg(sBackup + #13 + #13 +
                      'The path above is no allowed for your system previleges.' + #13 +
                      'It is not possible to make a backup of the Tinn-R INI!',
                      mtError,
                      [mbOk],
                      0)
        else
          fMessageDlg(sBackup + #13 + #13 +
                      'The path above is no allowed for your system previleges.' + #13 +
                      'It is not possible to make a backup of the Tinn-R INI!',
                      mtError,
                      [mbOk],
                      0);
        Exit;
      end;  // try
    end;  // if (sd.Execute)
  finally
    FreeAndNil(sd);
  end;
end;

procedure TfrmMain.actBackupSystemConfigurationExecute(Sender: TObject);
begin
  pBackupSystemConfiguration(False);
  pSetFocus_Main;
end;

procedure TfrmMain.actBackupDatabaseExecute(Sender: TObject);
var
  sBackup: string;

  sd: TSaveDialog;

begin
  sd           := TSaveDialog.Create(Self);
  sd.InitialDir:= sWorkingDir;
  sd.FileName  := 'Tinn-R_' + fGetBuildInfo + '_database_bkp';
  sd.Filter    := 'Tinn backup (*.zip)|*.zip';
  sd.DefaultExt:= '.zip';

  try
    if sd.Execute then begin
      frmMain.Refresh;
      sBackup:= sd.FileName;

      if FileExists(sBackup) then begin
        if (fMessageDlg(sBackup + #13 + #13 +
                        'Do you want to overwrite this file?',
                        mtConfirmation,
                        [mbYes, mbCancel],
                        0) <> idYes) then Exit;
        DeleteFile(sBackup);
      end;

      try
        zipKit.StoreOptions:= [soRecurse,     // soRecurse: will include all files of all folders and sub-folders!
                               soStripPath];  // soStripPath: the new .zip generated should not (in any way) preserve the information of the original path!
        with zipKit do begin
          FileName:= sBackup;

          // Save database
          with modDados do begin
            with cdRcard do begin
              Edit;
              try
                Post;
                MergeChangeLog;
                SaveToFile();
                iRcardBeforeChanges:= SavePoint;
              except
              end;
            end;

            with cdCompletion do begin
              Edit;
              try
                Post;
                MergeChangeLog;
                SaveToFile();
                iCompletionBeforeChanges:= SavePoint;
              except
              end;
            end;

            with cdShortcuts do begin
              Edit;
              try
                Post;
                MergeChangeLog;
                SaveToFile();
                iShortcutsBeforeChanges:= SavePoint;
              except
              end;
            end;
          end;

          with ModDados do begin
            AddFiles(sPath_Data + '\*.*',
                     0);
            CloseArchive;
          end;
        end;
        fMessageDlg(sBackup + #13 + #13 +
                    'The backup of DATABASE was done' + #13 +
                    'successfully in the path above!',
                    mtInformation,
                    [mbOk],
                    0);
      except
        fMessageDlg(sBackup + #13 + #13 +
                    'The path above is no allowed for your system previleges.' + #13 +
                    'It is not possible to make a DATABASE backup!',
                    mtError,
                    [mbOk],
                    0);
        Exit;
      end;  // try
    end;  // if (sd.Execute)
  finally
    FreeAndNil(sd);
    pSetFocus_Main;
  end;
end;

procedure TfrmMain.actRestoreSystemConfigurationExecute(Sender: TObject);
var
  bRestart: boolean;

  cTinnR: PChar;

  i,
   j: integer;

  od: TOpenDialog;

  sBackup,
   sTmp: string;

begin
  od           := TOpenDialog.Create(Self);
  od.InitialDir:= sWorkingDir;
  od.FileName  := EmptyStr;
  od.Filter    := 'Tinn backup (*.zip)|*.zip';
  try
    if od.Execute then begin
      frmMain.Refresh;
      sBackup:= od.FileName;

      if FileExists(sBackup) then begin
        zipKit.FileName:= sBackup;

        j:= 0;
        for i:=0 to (zipKit.Count - 1) do begin
          sTmp:= zipKit.Items[i].FileName;
          if (Pos('Tinn.ini',
                  sTmp) > 0) or
             (Pos('Editor.ini',
                  sTmp) > 0) then inc(j);
        end;

        if (j < 2) then begin
          fMessageDlg(sBackup + #13 + #13 +
                      'Restore of Tinn-R INI' + #13 +
                      'The file above isn''t a valid backup of the Tinn-R!' + #13 +
                      'Please, try another file.',
                      mtWarning,
                      [mbOk],
                      0);
          Exit;
        end;

        stbMain.Panels[8].Text:= 'Please, wait...';
        stbMain.Panels[9].Text:= 'Restoring ' + sBackup;
        Application.ProcessMessages;

        try
          //pDeleteDir(sPath_Ini); // Will remove all ini files and subfolders
          pDelete_FilesOfPath(sPath_Ini);
          pDelete_FilesOfPath(sPath_App);
          pDelete_FilesOfPath(sPath_Bkp);
          pDelete_FilesOfPath(sPath_Color);
          pDelete_FilesOfPath(sPath_Data);
          pDelete_FilesOfPath(sPath_Editor);
          pDelete_FilesOfPath(sPath_Latex);
          pDelete_FilesOfPath(sPath_Project);
          pDelete_FilesOfPath(sPath_Syntax);
          pDelete_FilesOfPath(sPath_SyntaxBKP);
          pDelete_FilesOfPath(sPath_Tmp);

          with zipKit do begin
            ExtractOptions:= [eoRestorePath];
            BaseDirectory:= sPath_Ini;
            ExtractFiles('*.*');
            CloseArchive;
            bRestart:= True;
          end;

          if bRestart then begin
          bRestored:= True;  // Will be used in OnCloseQuery event

          with ModDados do
            DataModuleCreate(nil);
            if (fMessageDlg('The full Tinn-R INI was successfully restored.' + #13 +
                            'Tinn-R must be restarted for the changes to take effect!' + #13 + #13 +
                            'Do you want to do it just now?' + #13 + #13 +
                            'P.S: If Tinn-R does not restart automatically, please, do it manually!',
                            mtConfirmation,
                            [mbYes, mbNo],
                            0) = mrYes) then begin

              cTinnR:= PChar(Application.ExeName);

              Close;  // Check for unsaved files and project

              ShellExecute(handle,
                           'open',
                           cTinnR,
                           nil,
                           nil,
                           SW_SHOWNORMAL) ;
              Application.Terminate;
            end;
          end;
        except
          // TODO
        end;
      end
      else begin
        fMessageDlg(ExtractFilePath(sBackup) + #13 + #13 +
                    'It wasn''t possible to found a backup of the Tinn-R INI' + #13 +
                    'from the choice path above!' + #13 +
                    'Please, try another valid path.',
                    mtWarning,
                    [mbOk],
                    0);

        with ModDados do
          DataModuleCreate(nil);
      end;
    end;  // if (od.Execute)
  finally
    FreeAndNil(od);
    stbMain.Panels[8].Text:= '';
    stbMain.Panels[9].Text:= '';
  end;
end;

procedure TfrmMain.actRestoreDatabaseExecute(Sender: TObject);
var
  i,
   j: integer;

  od: TOpenDialog;

  sBackup,
   sTmp: string;

begin
  try
    od           := TOpenDialog.Create(Self);
    od.InitialDir:= sWorkingDir;
    od.FileName  := EmptyStr;
    od.Filter    := 'Tinn backup (*.zip)|*.zip';

    if od.Execute then begin
      frmMain.Refresh;
      sBackup:= od.FileName;

      if FileExists(sBackup) then begin
        zipKit.FileName:= sBackup;

        j:= 0;
        for i:= 0 to (zipKit.Count - 1) do begin
          sTmp:= zipKit.Items[i].FileName;
          if (Pos('Cache.xml',
                  sTmp) > 0)  or
             (Pos('Comments.xml',
                  sTmp) > 0) or
             (Pos('Completion.xml',
                  sTmp) > 0) or
             (Pos('Rcard.xml',
                  sTmp) > 0) or
             (Pos('Rmirrors.xml',
                  sTmp) > 0) or
             (Pos('Shortcuts.xml',
                  sTmp) > 0) then inc(j);
        end;

        if (j < 6) then begin
          fMessageDlg(sBackup + #13 + #13 +
                      'Restore of DATABASE:' + #13 +
                      'The file above isn''t a valid backup of the Tinn-R!' + #13 +
                      'Please, try another file.',
                      mtWarning,
                      [mbOk],
                      0);
          Exit;
        end;

        with ModDados do begin
          cdCache.Close;
          cdComments.Close;
          cdCompletion.Close;
          cdRcard.Close;
          cdRmirrors.Close;
          cdShortcuts.Close;
        end;
        pDelete_Dir(sPath_Data);
        CreateDir(sPath_Data);

        zipKit.ExtractOptions:= [];
        with zipKit do begin
          BaseDirectory:= sPath_Data + '\';
          ExtractFiles('*.*');
        end;
        zipKit.CloseArchive;

        bDatabaseRestored:= True;
        with ModDados do
          DataModuleCreate(nil);
        fMessageDlg('The DATABASE was successfully restored.' + #13 + #13 +
                    'You can continue your work normally!',
                    mtInformation,
                    [mbOk],
                    0);
      end
      else
        fMessageDlg(ExtractFilePath(sBackup) + #13 + #13 +
                    'It wasn''t possible to found a backup of the DATABASE' + #13 +
                    'from the choice path above!' + #13 +
                    'Please, try another valid path.',
                    mtWarning,
                    [mbOk],
                    0);
    end;  // if (od.Execute)
  finally
    FreeAndNil(od);
  end;  // try
end;

procedure TfrmMain.actMacroRecordExecute(Sender: TObject);
var
  i: integer;
  
begin
  synMR.Editor:= frmRterm.synIO;
  i:= fFindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    if (sActiveEditor = 'synEditor2') then synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor2
                                      else synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;

  if (actMacroRecord.ImageIndex = 89) then begin
    synMR.RecordMacro(synMR.Editor);
    tbRecord.Hint:= 'Stop';
    actMacroRecord.ImageIndex:= 90;
  end
  else begin
    synMR.Stop;
    tbRecord.Hint:= 'Record';
    actMacroRecord.ImageIndex:= 89;
  end;
end;

procedure TfrmMain.actMACExecute(Sender: TObject);
begin
  actMAC.Checked:= True;
  ffDefault     := sffMAC;
end;

procedure TfrmMain.actMacroPlayExecute(Sender: TObject);
begin
  synMR.PlaybackMacro(synMR.Editor);
end;

procedure TfrmMain.actAsciiChartExecute(Sender: TObject);
var
  dlgAscii: TfrmAsciiChart;

begin
  dlgAscii:= TfrmAsciiChart.Create(Self);
  dlgAscii.Show;
end;

procedure TfrmMain.actAutoCompletionExecute(Sender: TObject);
begin
  actAutoCompletion.Checked:= not actAutoCompletion.Checked;
end;

procedure TfrmMain.actDifferencesExecute(Sender: TObject);
begin
  if (frmDiffMain = nil) then Application.CreateForm(TfrmDiffMain,
                                                     frmDiffMain);
  frmDiffMain.Show;
end;

procedure TfrmMain.actTobMacroVisibleExecute(Sender: TObject);
begin
  tobMacro.Visible:= not(tobMacro.Visible);
  menViewToolbarsMacro.Checked := tobMacro.Visible;
  pmenViewToolbarsMacro.Checked:= tobMacro.Visible;
end;

procedure TfrmMain.actTobSpellVisibleExecute(Sender: TObject);
begin
  tobSpell.Visible:= not(tobSpell.Visible);
  menViewToolbarsSpell.Checked := tobSpell.Visible;
  pmenViewToolbarsSpell.Checked:= tobSpell.Visible;
end;

procedure TfrmMain.actTobProcessingVisibleExecute(Sender: TObject);
begin
  tobProcessing.Visible:= not(tobProcessing.Visible);
  menViewToolbarsProcessing.Checked := tobProcessing.Visible;
  pmenViewToolbarsProcessing.Checked:= tobProcessing.Visible;
end;

procedure TfrmMain.actTobFormatVisibleExecute(Sender: TObject);
begin
  tobFormat.Visible:= not(tobFormat.Visible);
  menViewToolbarsFormat.Checked := tobFormat.Visible;
  pmenViewToolbarsFormat.Checked:= tobFormat.Visible;
end;

procedure TfrmMain.pCheckProcessingPath(sPath: string);
begin
  if (sPath = EmptyStr) then begin
    fMessageDlg('The path of interpreter, conversor or viewer was not defined.' + #13#10 +
                'Please, set it in Options/Aplication/Processing.',
                mtWarning,
                [mbOK],
                0);

    Exit;
  end;
end;

procedure TfrmMain.pFileConversion(sParameter,
                                       sExtension,
                                       sPathConversor: string;
                                       sPathInterpreter: string = '';
                                       bWait: boolean = True);

  procedure pCopyFile(const sourcefilename,
                            targetfilename: string);
  var
    s,
     t: TFileStream;

  begin
    s:= TFileStream.Create(sourcefilename,
                           fmOpenRead);
    try
      t:= TFileStream.Create(targetfilename,
                             fmOpenWrite or fmCreate);
      try
        t.CopyFrom(s,
                   s.Size) ;
      finally
        t.Free;
      end;
    finally
      s.Free;
    end;
  end;

var
  oldCursor: TCursor;

  sTmpFile,
   sTmpPar,
   sLatexFile,
   sNewFile: string;

  i: integer;

 procedure pLatexToSweave;
 begin
   sNewFile  := ChangeFileExt(sTmpFile,
                              '.rnw');
   sLatexFile:= ChangeFileExt(sTmpFile,
                              '.tex');

   if FileExists(sLatexFile) then begin
     pCopyFile(sLatexFile,
               sNewFile);
     DeleteFile(sLatexFile);
   end;
 end;

begin
  i:= fFindTopWindow;
  sTmpFile:= (Self.MDIChildren[i] as TfrmEditor).sActiveFile;

  oldCursor:= (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= crHourGlass;
  actFileSaveExecute(Self);

  pCheckProcessingPath(sPathInterpreter);
  pCheckProcessingPath(sPathConversor);

  try
    if (sPathInterpreter <> EmptyStr) then sTmpPar:= sPathInterpreter +
                                                     ' ' +
                                                     sPathConversor +
                                                     ' ' +
                                                     sParameter +
                                                     ' ' +
                                                     sTmpFile
                                      else sTmpPar:= sParameter +
                                                     ' '        +
                                                     sTmpFile;

    SetCurrentDir(ExtractFilePath(sTmpFile));  // Set the OS directory to the current file prior to make the conversion

    if bWait then begin
      if fExecCmdLine_Wait(sTmpPar,
                           SW_HIDE) then begin
        if (sExtension = '.rnw') then pLatexToSweave
                                 else sNewFile:= ChangeFileExt(sTmpFile,
                                                               sExtension);
        pUpdateFileIntoTinn(sNewFile);
      end
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        fMessageDlg(sTmpPar + #13 + #13 +
                    'Sorry, it wasn''t possible to do the conversion!',
                    mtError,
                    [mbOK],
                    0);
      end;
    end
    else begin
      if fOpen_CmdLine(sTmpPar,
                       SW_HIDE) then begin
        if (sExtension = '.rnw') then pLatexToSweave
      end
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        fMessageDlg(sTmpPar + #13 + #13 +
                    'Sorry, it wasn''t possible to do the conversion!',
                    mtError,
                    [mbOk],
                    0);
      end;
    end;
  except
  // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
end;

procedure TfrmMain.pPandocConversion(sPandocInstruction,
                                         sPandocFrom,
                                         sPandocTo: string;
                                         bWait: boolean = True);
var
  oldCursor: TCursor;

  i: integer;

begin
  i:= fFindTopWindow;
  oldCursor:= (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= crHourGlass;
  actFileSaveExecute(Self);

  pCheckProcessingPath(sPath_Pandoc);

  sPandocInstruction:= StringReplace(sPandocInstruction,
                                     'pandoc',
                                     sPath_Pandoc,
                                     []);
  try
    if bWait then
      if fExecCmdLine_Wait(sPandocInstruction,
                           SW_HIDE) and
         not fFile_InUse(sPandocTo) then pUpdateFileIntoTinn(sPandocTo)
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        fMessageDlg(sPandocInstruction + #13 + #13 +
                    'Sorry, it wasn''t possible to do the conversion!',
                    mtError,
                    [mbOk],
                    0);
      end
    else begin
      if fOpen_CmdLine(sPandocInstruction,
                       SW_HIDE) then
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        fMessageDlg(sPandocInstruction + #13 + #13 +
                    'Sorry, it wasn''t possible to do the conversion!',
                    mtError,
                    [mbOk],
                    0);
      end;
    end;
  except
  // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
end;

procedure TfrmMain.actDeplateToLaTeXDramatistExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' latex-dramatist',
                  '.tex',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToLaTeXExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' latex',
                  '.tex',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToPhpExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' php',
                  '.php',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToPlainExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' plain',
                  '.text',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToLatexExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' tex',
                  '.tex',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToLoutExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' lout',
                  '.lout',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToManExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' man',
                  '.man',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToMgpExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' mgp',
                  '.mgp',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToMoinExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' moin',
                  '.moin',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToPm6Execute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' pm6',
                  '.pm6',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actDeplateToSweaveExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' latex',
                  '.rnw',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToXhtmlMathMlExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' xhtml11m',
                  '.xhtml',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToXhtmlTransitionalExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' xhtml10t',
                  '.xhtml',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToSgmlExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' sgml',
                  '.sgml',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmMain.actTxt2tagsToSweaveExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' tex',
                  '.rnw',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToTxtExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' txt',
                  '.txt',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToWikiExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' wiki',
                  '.wiki',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToXhtmlExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' xhtml',
                  '.xhtml',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmMain.actDeplateToDocbookArticleExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' dbk-article',
                  '.xml',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToDocbookBookExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' dbk-book',
                  '.xml',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToDocbookReferenceExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' dbk-ref',
                  '.xml',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
end;

procedure TfrmMain.actDeplateToHtmlExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' html',
                  '.html',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmMain.actDeplateToHtmlSiteExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' htmlsite',
                  '.html',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter,
                  False);
end;

procedure TfrmMain.actDeplateToHtmlSlidesExecute(Sender: TObject);
begin
  pFileConversion(sParDeplate + ' htmlslides',
                  '.html',
                  sPathDeplate_Converter,
                  sPathDeplate_Interpreter,
                  False);
end;

procedure TfrmMain.actTxt2tagsToDokuExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' doku',
                  '.doku',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToGwikiExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' gwiki',
                  '.gwiki',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
end;

procedure TfrmMain.actTxt2tagsToHtmlExecute(Sender: TObject);
begin
  pFileConversion(sParTxt2tags + ' html',
                  '.html',
                  sPathTxt2tags_Converter,
                  sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmMain.pCompileLaTeX(sMikPar,
                                     sBibPar,
                                     sExtension: string;
                                     bWait: boolean);
var
  oldCursor: TCursor;

  sTmpDir,
   sMikParameter,
   sBibParameter,
   sTmpFile,
   sTmpParameter: string;

  wOption: word;

  tmpHandle: HWND;

  i: integer;

  procedure pCloseCompileLaTeX;
  begin
    (Self.MDIChildren[fFindTopWindow] as TfrmEditor).Cursor:= oldCursor;
    fMessageDlg('Sorry, it wasn''t possible to do the compilation!',
                mtInformation,
                [mbOk],
                0);
    Abort;
  end;

  procedure pProblemOpeningCompiled;
  begin
    fMessageDlg('Sorry, it wasn''t possible to open the file: ' + sTmpDir + sTmpFile + #13 + #13 +
                'The instruction sent to the OS was: ' + sTmpParameter,
                mtInformation,
                [mbOk],
                0);
    Abort;
  end;

  procedure pCheckViewer(sTmp1,
                         sTmp2: string;
                         actTmp:TAction);
  begin
    if (sTmp1 = sTmp2) and
       actTMp.Checked then begin          // Avoid multiple instance of viewer and break compiling Pdf files
      tmpHandle:= fGetWindowHandle(Pchar(ChangeFileExt(sTmpFile,
                                                       sExtension)),
                                  True);  // Will close the instance of application with the opened .pdf file

      if not (PostMessage(tmpHandle,
                          WM_Close,
                          0,
                          0)) then
        ShowMessage('Sorry, it was not possible to close the default ' +
                    sTmp2 +
                    ' viewer!')
    end;
  end;

begin
  i:= fFindTopWindow;
  sTmpFile:= ExtractFileName((Self.MDIChildren[i] as TfrmEditor).sActiveFile);;
  if (LowerCase(ExtractFileExt(sTmpFile)) <> '.tex') then Exit;
  oldCursor:= (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= crHourGlass;
  actFileSaveExecute(Self);
  sTmpDir:= ExtractFilePath((Self.MDIChildren[i] as TfrmEditor).sActiveFile);

  try
    SetCurrentDir(sTmpDir);
    sMikParameter:= sMikPar + ' ' + ChangeFileExt(sTmpFile,
                                                  EmptyStr);

    if actDosMinimizedAlways.Checked then wOption:= SW_SHOWMINIMIZED
                                     else wOption:= SW_RESTORE;

    pCheckViewer(sExtension,
                 '.dvi',
                 actCloseDVIViewer);

    pCheckViewer(sExtension,
                 '.pdf',
                 actClosePDFViewer);

    if bWait then begin
      if (sBibPar <> 'N') then begin
        sBibParameter:= sBibPar + ' ' + fRemove_FileExtension(sTmpFile);
        // The three steps below are necessary to incorporate the complete citations from bibtex resource

        if fExecCmdLine_Wait(sMikParameter,
                             wOption) then
        else pCloseCompileLaTeX;

        if fExecCmdLine_Wait(sBibParameter,
                             wOption) then
        else pCloseCompileLaTeX;

        if fExecCmdLine_Wait(sMikParameter,
                             wOption) then
        else pCloseCompileLaTeX;
      end;

      if fExecCmdLine_Wait(sMikParameter,
                           wOption) then begin
        if (sExtension = '.dvi') and
           actDviOpenAlways.Checked then
             ShellExecute(handle,
                          'open',
                          PChar(ChangeFileExt(sTmpFile,
                                              sExtension)),
                          '',
                          '',
                          SW_SHOWNORMAL);

        if (sExtension = '.pdf') and
           actPdfOpenAlways.Checked then
             ShellExecute(handle,
                          'open',
                          PChar(ChangeFileExt(sTmpFile,
                                              sExtension)),
                          '',
                          '',
                          SW_SHOWNORMAL);
      end
      else pCloseCompileLaTeX;
    end
    else begin
      if fOpen_CmdLine(sMikParameter,
                       wOption) then // Nothing to do
      else pProblemOpeningCompiled;
    end;
  except
  // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
end;

procedure TfrmMain.menToolsDatabaseShortcutsClick(Sender: TObject);
begin
  actShortcutsEditExecute(nil);
end;

procedure TfrmMain.menToolsConversionPandocClick(Sender: TObject);

  function fGetEncoding: string;
  var
    seTmp: TSynEdit;

    sTmp: string;

  begin
    Result:= '';

    with (MDIChildren[fFindTopWindow] as TfrmEditor) do begin
      //if (seUsed = seUTF8) then Result:= True;
      seTmp:= SynEditor;
      sTmp:= fGetSaveFormat(seTmp.Lines)
    end;

    Result:= sTmp;
  end;

var
  dlg: TfrmPandoc;

  sTmp: string;

begin
  sTmp:= fGetEncoding;
  if (sTmp <> 'UTF-8') then begin
    fMessageDlg('The current file enconding is ' +
                sTmp +
                '.' + #13 + #13 +
                'Pandoc requires encoding UTF-8!',
                mtWarning,
                [mbOk],
                0);
    Exit;
  end;

  try
    dlg:= TfrmPandoc.Create(Self);
    with dlg do begin
      rdgFrom.ItemIndex:= iPandocFrom;
      rdgTo.ItemIndex  := iPandocTo;
      PandocHistory    := sPandocHistory;
    end;

    if (dlg.ShowModal = mrOK) then begin
      with dlg do begin
        iPandocFrom       := rdgFrom.ItemIndex;
        iPandocTo         := rdgTo.ItemIndex;
        sPandocHistory    := PandocHistory;
        sPandocHistoryFrom:= PandocHistoryFrom;
        sPandocHistoryTo  := PandocHistoryTo;
        pPandocConversion(sPandocInstruction,
                          sPandocFrom,
                          sPandocTo);

        if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
      end;
    end;
  finally
    with dlg do begin
      iPandocFrom:= rdgFrom.ItemIndex;
      iPandocTo  := rdgTo.ItemIndex;
    end;

    FreeAndNil(dlg);
  end;
end;

procedure TfrmMain.menToolsDatabaseCommentsClick(Sender: TObject);
var
  pTmp: pointer;

begin
  with modDados.cdComments do
    pTmp:= GetBookmark;
  Application.CreateForm(TfrmComments,
                         frmComments);

  with frmComments do
    try
      ShowModal;
    finally
      frmMain.Refresh;
      FreeAndNil(frmComments);
    end;

  with modDados.cdComments do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmMain.menToolsDatabaseCompletionClick(Sender: TObject);
var
  pTmp: pointer;

begin
  with modDados.cdCompletion do
    pTmp:= GetBookmark;
  Application.CreateForm(TfrmCompletion,
                         frmCompletion);

  with frmCompletion do
    try
      ShowModal;
    finally
      frmMain.Refresh;
      FreeAndNil(frmCompletion);
    end;

  with modDados.cdCompletion do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmMain.menToolsDatabaseCardRClick(Sender: TObject);
var
  pTmp: pointer;
  
begin
  with modDados.cdRcard do
    pTmp:= GetBookmark;
  Application.CreateForm(TfrmRcard,
                         frmRcard);

  with frmRcard do
    try
      ShowModal;
    finally
      frmMain.Refresh;
      FreeAndNil(frmRcard);
    end;

  with modDados.cdRcard do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmMain.menToolsDatabaseMirrorsRClick(Sender: TObject);
var
  pTmp: pointer;

begin
  with modDados.cdRmirrors do
    pTmp:= GetBookmark;
  Application.CreateForm(TfrmRmirrors,
                         frmRmirrors);

  with frmRmirrors do
    try
      ShowModal;
    finally
      frmMain.Refresh;
      FreeAndNil(frmRmirrors);
    end;

  with modDados.cdRmirrors do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmMain.actLatexToDviSingleExecute(Sender: TObject);
begin
  pCompileLaTeX(sParDviSingle,
                'N',
                '.dvi',
                actDviOpenAlways.Checked);
end;

procedure TfrmMain.actLatexToDviBibtexExecute(Sender: TObject);
begin
  pCompileLaTeX(sParDviSingle,
                sParDviBibtex,
                '.dvi',
                actDviOpenAlways.Checked);
end;

procedure TfrmMain.actLatexToPdfSingleExecute(Sender: TObject);
begin
  pCompileLaTeX(sParPdfSingle,
                'N',
                '.pdf',
                actPdfOpenAlways.Checked)
end;

procedure TfrmMain.actLatexToPdfBibtexExecute(Sender: TObject);
begin
  pCompileLaTeX(sParPdfSingle,
                sParPdfBibtex,
                '.pdf',
                actPdfOpenAlways.Checked)
end;

// Reload file from disk
procedure TfrmMain.actReloadExecute(Sender: TObject);
var
  bcPos: TBufferCoord;

  i,
   iResp,
   iTopLine: integer;

begin
  // Check for modification
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor).synEditor.Modified) then begin
    iResp:= fMessageDlg((Self.MDIChildren[i] as TfrmEditor).sActiveFile + #13 + #13 +
                        'If you reload this file, you will loose all changes.' + #13 +
                        'Do you want to reload the file?',
                        mtConfirmation,
                        [mbYes, mbCancel],
                        0);

    case iResp of
      idCancel: Abort;
    end;
  end;

  with (Self.MDIChildren[i] as TfrmEditor) do begin
    // File notify: Stop
    if Assigned(fNotif) then pNotifyFile_Stop;

    synEditor.BeginUpdate;
    iTopLine:= synEditor.TopLine;
    bcPos:= synEditor.CaretXY;

    //synEditor.Lines.LoadFromFile(sActiveFile);
    seUsed:= LoadFromFile(synEditor.Lines,
                          sActiveFile,
                          GetEncoding(sActiveFile,
                                      bBOM),
                          bBOM);

    pGetFile_Info(sActiveFile,
                  synEditor.Lines);

    synEditor.Modified:= False;
    pSetFileSize_StatusBar(sActiveFile);
    pCheckSaveStatus;
    pSetTitle;

    synEditor.ExecuteCommand(ecGotoXY,
                             'A',
                             @bcPos);
    synEditor.TopLine:= iTopLine;
    synEditor.EndUpdate;

    // File notify: Start
    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= pFileChanged;
    pNotifyFile_Start(sActiveFile);

    stbMain.Panels[8].Text:= 'Reloaded file';
    stbMain.Panels[9].Text:= sActiveFile;
  end;

  pUpdateHexViewer;
end;

(*
// It is not working nice for PDF under Windows 7 -> replaced for the below
procedure TfrmMain.pOpenFileWithViewer(sFilter, sDefaultExt, sPathViewer: string);
var
  od         : TOpenDialog;
  sFile,
   sParameter: string;

begin
  od           := TOpenDialog.Create(Self);
  od.InitialDir:= sWorkingDir;
  od.FileName  := EmptyStr;
  od.Filter    := sFilter;
  od.DefaultExt:= sDefaultExt;
  try
    if od.Execute then begin
      frmMain.Refresh;
      sFile:= od.FileName;
      if FileExists(sFile) then begin
        try
          pCheckProcessingPath(sPathViewer);
          if (ExtractFileExt(sFile)= '.pdf') then begin
            sParameter:= sPathViewer + ' ' + sFile;
            fOpenCmdLine(sParameter, SW_SHOWNORMAL);
          end
          else begin
            sParameter:= sPathViewer + ' --single-instance ' + sFile;
            fOpenCmdLine(sParameter, SW_HIDE);
          end;
        except
          fMessageDlg(sFile + #13 + #13 +
                      'It wasn''t possible to open the file above!',
                      mtError, [mbOk], 0);
          Exit;
        end;  // try
      end;  // if (od.Execute)
    end;
  finally
    FreeAndNil(od);
  end;
end;
*)

procedure TfrmMain.pOpenFileWithViewer(sFilter,
                                           sDefaultExt: string);
var
  od: TOpenDialog;

  sFile: string;

begin
  od           := TOpenDialog.Create(Self);
  od.InitialDir:= sWorkingDir;
  od.FileName  := EmptyStr;
  od.Filter    := sFilter;
  od.DefaultExt:= sDefaultExt;
  try
    if od.Execute then begin
      frmMain.Refresh;
      sFile:= od.FileName;

      if FileExists(sFile) then begin
        try
          ShellExecute(handle,
                       'open',
                       PChar(sFile),
                       '',
                       '',
                       SW_SHOWNORMAL);
        except
          fMessageDlg(sFile + #13 + #13 +
                      'It wasn''t possible to open the file above!',
                      mtError,
                      [mbOk],
                      0);
          Exit;
        end;
      end;

    end;
  finally
    FreeAndNil(od);
  end;
end;

procedure TfrmMain.actDviOpenFileExecute(Sender: TObject);
begin
  pOpenFileWithViewer('Dvi (*.dvi)|*.dvi',
                      '.dvi');
end;

procedure TfrmMain.actPdfOpenFileExecute(Sender: TObject);
begin
  pOpenFileWithViewer('Pdf (*.pdf)|*.pdf',
                      '.pdf');
end;

procedure TfrmMain.actHtmlOpenFileExecute(Sender: TObject);
begin
  pOpenFileWithViewer('Html (*.html, *.htm)|*.html; *.htm',
                      '.html; .htm')
end;

procedure TfrmMain.actHtmlOpenCurrentFileExecute(Sender: TObject);
var
  sFile: string;

  i: integer;

begin
  i:= fFindTopWindow;

  if not Assigned(Self.MDIChildren[i] as TfrmEditor) then Exit;
  sFile:= (Self.MDIChildren[i] as TfrmEditor).sActiveFile;

  if (ExtractFileExt(sFile) <> '.html') then Exit;
  try
    ShellExecute(0,
                 'open',
                 Pchar(sFile),
                 nil,
                 nil,
                 sw_shownormal);
  except
    fMessageDlg('Browser is not accessible!',
                mtInformation,
                [mbOk],
                0);
  end;
end;

procedure TfrmMain.actDviOpenAlwaysExecute(Sender: TObject);
begin
  actDviOpenAlways.Checked:= not actDviOpenAlways.Checked;
end;

procedure TfrmMain.actPdfOpenAlwaysExecute(Sender: TObject);
begin
  actPdfOpenAlways.Checked:= not actPdfOpenAlways.Checked;
end;

procedure TfrmMain.actHexViewerVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsHexViewer do begin
    TabVisible:= not TabVisible;
    actHexViewerVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actHtmlOpenAlwaysExecute(Sender: TObject);
begin
  actHtmlOpenAlways.Checked:= not actHtmlOpenAlways.Checked;
end;

procedure TfrmMain.pSetToolbarProcessing(sFileExtension: string);

  function fMatchExtension(sTmp: string;
                           aTmp: array of string): boolean;
  var
    i: integer;

  begin
    Result:= False;
    for i := low(aTmp) to high(aTmp) do
      if (sTmp = aTmp[i]) then begin
        Result:= True;
        Exit;
      end;
  end;

  procedure pSetBrowser(bTmp: boolean);
  begin
    actHtmlOpenCurrentFile.Enabled:= bTmp;
  end;

  procedure pSetDeplate (bTmp: boolean);
  begin
    actDeplateToLaTeX.Enabled            := bTmp;
    actDeplateToLaTeXDramatist.Enabled   := bTmp;
    actDeplateToSweave.Enabled           := bTmp;
    actDeplateToPlain.Enabled            := bTmp;
    actDeplateToHtml.Enabled             := bTmp;
    actDeplateToHtmlSite.Enabled         := bTmp;
    actDeplateToHtmlSlides.Enabled       := bTmp;
    actDeplateToXhtmlTransitional.Enabled:= bTmp;
    actDeplateToXhtmlMathMl.Enabled      := bTmp;
    actDeplateToPhp.Enabled              := bTmp;
    actDeplateToDocbookArticle.Enabled   := bTmp;
    actDeplateToDocbookBook.Enabled      := bTmp;
    actDeplateToDocbookReference.Enabled := bTmp;
  end;

  procedure pSetMarkdown(bTmp: boolean);
  begin
    // TODO
  end;

  procedure pSetTxt2tags(bTmp: boolean);
  begin
    actTxt2tagsToLatex.Enabled := bTmp;
    actTxt2tagsToSweave.Enabled:= bTmp;
    actTxt2tagsToHtml.Enabled  := bTmp;
    actTxt2tagsToTxt.Enabled   := bTmp;
    actTxt2tagsToXhtml.Enabled := bTmp;
    actTxt2tagsToSgml.Enabled  := bTmp;
    actTxt2tagsToLout.Enabled  := bTmp;
    actTxt2tagsToMan.Enabled   := bTmp;
    actTxt2tagsToMgp.Enabled   := bTmp;
    actTxt2tagsToWiki.Enabled  := bTmp;
    actTxt2tagsToGwiki.Enabled := bTmp;
    actTxt2tagsToDoku.Enabled  := bTmp;
    actTxt2tagsToMoin.Enabled  := bTmp;
    actTxt2tagsToPm6.Enabled   := bTmp;
  end;

  procedure pSetTex(bTmp: boolean);
  begin
    actLatexToDviSingle.Enabled:= bTmp;
    actLatexToDviBibtex.Enabled:= bTmp;
    actLatexToPdfSingle.Enabled:= bTmp;
    actLatexToPdfBibtex.Enabled:= bTmp;
    actLatexMakeIndex.Enabled  := bTmp;
  end;

const
  aBrowser: array [0..3] of string = ('.htm',
                                      '.html',
                                      '.php',
                                      '.xhtml');

  aDeplate: array [0..4] of string = ('.dp',
                                      '.dpt',
                                      '.dplt',
                                      '.deplate',
                                      '.txt');

  aTxt2tags: array [0..3] of string = ('.t2',
                                       '.t2t',
                                       '.txt2tags',
                                       '.txt');

var
  sExt: string;

begin
  sExt:= LowerCase(sFileExtension);
  if (sExt = EmptyStr) then Exit;

  // Browser
  if (fMatchExtension(sExt,
                      aBrowser)) then pSetBrowser(True)
                                 else pSetBrowser(False);

  // Deplate
  if (fMatchExtension(sExt, aDeplate)) then pSetDeplate(True)
                                       else pSetDeplate(False);
  //SetDeplate(True);   // any file extension

  // Txt2tags
  if (fMatchExtension(sExt, aTxt2tags)) then pSetTxt2tags(True)
                                        else pSetTxt2tags(False);
  //SetTxt2tags(True);  // any file extension

  // MikTeX
  if (sExt = '.tex') then pSetTex(True)
                     else pSetTex(False);
end;

procedure TfrmMain.menHelFileConversionDeplateClick(Sender: TObject);
begin
  pOpenHelpFile('\sample\deplate.dplt');
end;

procedure TfrmMain.menHelFileConversionPandocClick(Sender: TObject);
begin
  pOpenHelpFile('\sample\pandoc.markdown');
end;

procedure TfrmMain.menHelFileConversionTxt2tagsClick(Sender: TObject);
begin
  pOpenHelpFile('\sample\txt2tags.t2t');
end;

procedure TfrmMain.menWebtProcessingMikTeXClick(Sender: TObject);
begin
  pOpen_Url('http://miktex.org/');
end;

procedure TfrmMain.menWebtProcessingPandocClick(Sender: TObject);
begin
  pOpen_Url('http://johnmacfarlane.net/pandoc/');
end;

procedure TfrmMain.menWebtProcessingDeplateClick(Sender: TObject);
begin
  pOpen_Url('http://deplate.sourceforge.net/index.php');
end;

procedure TfrmMain.menWebtProcessingTxt2tagsClick(Sender: TObject);
begin
  pOpen_Url('http://txt2tags.sourceforge.net');
end;

procedure TfrmMain.actDosMinimizedAlwaysExecute(Sender: TObject);
begin
  actDosMinimizedAlways.Checked:= not actDosMinimizedAlways.Checked;
end;

procedure TfrmMain.pmenResultsOpenLinkMeasureItem(Sender: TObject;
                                                      ACanvas: TCanvas;
                                                      var Width,
                                                          Height: Integer);
begin
  with frmTools.tvSearch do
    if (Selected = nil) or
       (Selected.Level < 2) then pmenResultsOpenLink.Enabled:= False
                            else pmenResultsOpenLink.Enabled:= True;
end;

procedure TfrmMain.pmemRResSendBlockMarkedClick(Sender: TObject);
begin
  with actRSendBlockMarked do
    Visible:= not Visible;
  pmemRResSendBlockMarked.Checked:= actRSendBlockMarked.Visible;
end;

procedure TfrmMain.pmemRResSendClipboardClick(Sender: TObject);
begin
  with actRSendClipboard do
    Visible:= not Visible;
  pmemRResSendClipboard.Checked:= actRSendClipboard.Visible;
end;

procedure TfrmMain.pmemRResSendContiguousClick(Sender: TObject);
begin
  with actRSendContiguous do
    Visible:= not Visible;
  pmemRResSendContiguous.Checked:= actRSendContiguous.Visible;
end;

procedure TfrmMain.pmemRResSendFileClick(Sender: TObject);
begin
  with actRSendFile do
    Visible:= not Visible;
  pmemRResSendFile.Checked:= actRSendFile.Visible;
end;

procedure TfrmMain.pmemRResSendSelectionClick(Sender: TObject);
begin
  with actRSendSelection do
    Visible:= not Visible;
  pmemRResSendSelection.Checked:= actRSendSelection.Visible;
end;

procedure TfrmMain.pmemRResCurrentLineToTopClick(Sender: TObject);
begin
  with actRCurrentLineToTop do
    Visible:= not Visible;
  pmemRResCurrentLineToTop.Checked:= actRCurrentLineToTop.Visible;
end;

procedure TfrmMain.pmemRResSendLineClick(Sender: TObject);
begin
  with actRSendLine do
    Visible:= not Visible;
  pmemRResSendLine.Checked:= actRSendLine.Visible;
end;

procedure TfrmMain.pmemRResSendSmartClick(Sender: TObject);
begin
  with actRSendSmart do
    Visible:= not Visible;
  pmemRResSendSmart.Checked:= actRSendSmart.Visible;
end;

procedure TfrmMain.pmemRResSendLinesToEndPageClick(Sender: TObject);
begin
  with actRSendLinesToEndPage do
    Visible:= not Visible;
  pmemRResSendLinesToEndPage.Checked:= actRSendLinesToEndPage.Visible;
end;

procedure TfrmMain.pmemRResSendCursorToBeginningLineClick(Sender: TObject);
begin
  with actRSendCursorToBeginningLine do
    Visible:= not Visible;
  pmemRResSendCursorToBeginningLine.Checked:= actRSendCursorToBeginningLine.Visible;
end;

procedure TfrmMain.pmemRResSendCursorToEndLineClick(Sender: TObject);
begin
  with actRSendCursorToEndLine do
    Visible:= not Visible;
  pmemRResSendCursorToEndLine.Checked:= actRSendCursorToEndLine.Visible;
end;

procedure TfrmMain.pmemRResSendSweaveClick(Sender: TObject);
begin
  with actRSendSweave do
    Visible:= not Visible;
  pmemRResSendSweave.Checked:= actRSendSweave.Visible;
end;

procedure TfrmMain.pmemRResSendKnitrClick(Sender: TObject);
begin
  with tbKnitr do
    Visible:= not Visible;
  pmemRResSendKnitr.Checked:= tbKnitr.Visible;
  bRKnitr:= tbKnitr.Visible;
end;

procedure TfrmMain.pmenRResContSetWorkDirectoryClick(Sender: TObject);
begin
  with actRContSetWorkDirectory do
    Visible:= not Visible;
  pmenRResContSetWorkDirectory.Checked:= actRContSetWorkDirectory.Visible;
end;

procedure TfrmMain.pmenRResContListAllObjectsClick(Sender: TObject);
begin
  with actRContListAllObjects do
    Visible:= not Visible;
  pmenRResContListAllObjects.Checked:= actRContListAllObjects.Visible;
end;

procedure TfrmMain.pmenRResContPrintVariableContentClick(Sender: TObject);
begin
  with actRContPrintVariableContent do
    Visible:= not Visible;
  pmenRResContPrintVariableContent.Checked:= actRContPrintVariableContent.Visible;
end;

procedure TfrmMain.pmenRResContPlotVariableClick(Sender: TObject);
begin
  with actRContPlotVariable do
    Visible:= not Visible;
  pmenRResContPlotVariable.Checked:= actRContPlotVariable.Visible;
end;

procedure TfrmMain.pmenRResContListVariableNamesClick(Sender: TObject);
begin
  with actRContListVariableNames do
    Visible:= not Visible;
  pmenRResContListVariableNames.Checked:= actRContListVariableNames.Visible;
end;

procedure TfrmMain.pmenRResContListVariableStructureClick(Sender: TObject);
begin
  with actRContListVariableStructure do
    Visible:= not Visible;
  pmenRResContListVariableStructure.Checked:= actRContListVariableStructure.Visible;
end;

procedure TfrmMain.pmenRResContEditVariableClick(Sender: TObject);
begin
  with actRContEditVariable do
    Visible:= not Visible;
  pmenRResContEditVariable.Checked:= actRContEditVariable.Visible;
end;

procedure TfrmMain.pmenRResContFixVariableClick(Sender: TObject);
begin
  with actRContFixVariable do
    Visible:= not Visible;
  pmenRResContFixVariable.Checked:= actRContFixVariable.Visible;
end;

procedure TfrmMain.pmenRResContClearConsoleClick(Sender: TObject);
begin
  with actRContClearConsole do
    Visible:= not Visible;
  pmenRResContClearConsole.Checked:= actRContClearConsole.Visible;
end;

procedure TfrmMain.pmenRResContCloseAllGraphicsClick(Sender: TObject);
begin
  with actRContCloseAllGraphics do
    Visible:= not Visible;
  pmenRResContCloseAllGraphics.Checked:= actRContCloseAllGraphics.Visible;
end;

procedure TfrmMain.pmenRResContRemoveAllObjectsClick(Sender: TObject);
begin
  with actRContRemoveAllObjects do
    Visible:= not Visible;
  pmenRResContRemoveAllObjects.Checked:= actRContRemoveAllObjects.Visible;
end;

procedure TfrmMain.pmenRResContClearAllClick(Sender: TObject);
begin
  with actRContClearAll do
    Visible:= not Visible;
  pmenRResContClearAll.Checked:= actRContClearAll.Visible;
end;

procedure TfrmMain.pmenRResContEscapeClick(Sender: TObject);
begin
  with actRContEscape do
    Visible:= not Visible;
  pmenRResContEscape.Checked:= actRContEscape.Visible;
end;

procedure TfrmMain.pmenRResContHelpSelectedWordClick(Sender: TObject);
begin
  with actRContHelpSelectedWord do
    Visible:= not Visible;
  pmenRResContHelpSelectedWord.Checked:= actRContHelpSelectedWord.Visible;
end;

procedure TfrmMain.pmenRResContExampleSelectedWordClick(Sender: TObject);
begin
  with actRContExampleSelectedWord do
    Visible:= not Visible;
  pmenRResContExampleSelectedWord.Checked:= actRContExampleSelectedWord.Visible;
end;

procedure TfrmMain.pmenRResContHelpClick(Sender: TObject);
begin
  with actRContHelp do
    Visible:= not Visible;
  pmenRResContHelp.Checked:= actRContHelp.Visible;
end;

procedure TfrmMain.pmenRResContGuiPuTTYStartCloseClick(Sender: TObject);
begin
  with actRContGuiPuTTYStartClose do
    Visible:= not Visible;
  pmenRResContGuiPuTTYStartClose.Checked:= actRContGuiPuTTYStartClose.Visible;
end;

procedure TfrmMain.pmenRResContTermStartCloseClick(Sender: TObject);
begin
  with actRContTermStartClose do
    Visible:= not Visible;
  pmenRResContTermStartClose.Checked:= actRContTermStartClose.Visible;
end;

procedure TfrmMain.pmenRResContPackagesClick(Sender: TObject);
begin
  with actRContPackages do
    Visible:= not Visible;
  pmenRResContPackages.Checked:= actRContPackages.Visible;
end;

procedure TfrmMain.pmenRResContTCPConnectionClick(Sender: TObject);
begin
  with actRContTCPConnection do
    Visible:= not Visible;
  pmenRResContTCPConnection.Checked:= actRContTCPConnection.Visible;
end;

procedure TfrmMain.pUpdateFile(var seEditor: TSynEdit;
                                   var smOption: TSynSelectionMode);
var
  bcPos: TBufferCoord;

  iLine: integer;

  pMemo: Tpoint;

begin
  if (pgFiles.PageCount < 1) or
     not fSave_PriorClipboard_Text then begin
    seEditor.SelectionMode:= smOption;
    fMessageDlg('No memory available.' + #13 +
                'Please, repeat the action!',
                mtInformation,
                [mbOk],
                0);
    Exit;
  end;

  with seEditor do begin
    iLine:= TopLine;
    bcPos:= CaretXY;
  end;

  with frmTools.memSpell do begin
    pMemo:= CaretPos;
    Clipboard.AsText:= Text;  // This option is to enable undo and redo after the correction
    CaretPos:= pMemo;
  end;

  with seEditor do begin
    BeginUpdate;
    if SelAvail then PasteFromClipboard  // Partial correction
    else begin
      ExecuteCommand(ecEditorTop,
                     #0,
                     nil);
      ExecuteCommand(ecSelectAll,
                     #0,
                     nil);
      PasteFromClipboard;
      ExecuteCommand(ecDeleteLastChar,
                     #0,
                     nil);  // The spell add a not desired empty line to the end
    end;
    TopLine      := iLine;
    CaretXY      := bcPos;
    SelectionMode:= smOption;
    EndUpdate;
  end;
  pRestore_PriorClipboard_Text;
end;

procedure TfrmMain.actSpellExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  smOption: TSynSelectionMode;

begin
  if not actToolsVisible.Checked then actToolsVisibleExecute(nil);
  if not actSpellVisible.Checked then actSpellVisibleExecute(nil);
  frmTools.pgTools.ActivePage:= frmTools.tbsSpell;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    smOption:= SelectionMode;
    if (SelectionMode <> smNormal) then SelectionMode:= smNormal;
    if SelAvail then frmTools.memSpell.Text:= SelText  // Partial correction
                else frmTools.memSpell.Text:= Text;
  end;

  SpellChecker.Check(frmTools.memSpell);
  Refresh;
  pUpdateFile(seEditor,
              smOption);
end;

procedure TfrmMain.pmemSpellCutClick(Sender: TObject);
begin
  frmTools.memSpell.CutToClipboard;
end;

procedure TfrmMain.pmemSpellCopyClick(Sender: TObject);
begin
  frmTools.memSpell.CopyToClipboard;
end;

procedure TfrmMain.pmemSpellPasteClick(Sender: TObject);
begin
  frmTools.memSpell.PasteFromClipboard;
end;

procedure TfrmMain.pmemSpellDeleteClick(Sender: TObject);
begin
  frmTools.memSpell.ClearSelection;
end;

procedure TfrmMain.pmemSpellSelectAllClick(Sender: TObject);
begin
  frmTools.memSpell.SelectAll;
end;

procedure TfrmMain.pmemSpellClearAllClick(Sender: TObject);
begin
  frmTools.memSpell.Clear;
end;

procedure TfrmMain.pTabMenuPopup(pcTmp: TPageControl;
                                     X,
                                     Y: Integer);
var
  hi: TTCHitTestInfo;

  p: TPoint;

begin
  hi.pt.x := X;
  hi.pt.y := Y;
  hi.flags:= 0;
  p.x     := pcTmp.Left + X;
  p.y     := pcTmp.Top + Y;
  p       := ClientToScreen(p);
  pmenPgFiles.Popup(P.X,
                    P.Y)
end;

procedure TfrmMain.actAplicationExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actApplyToANSIExecute(Sender: TObject);
begin
  actApplyToANSI.Checked:= not actApplyToANSI.Checked;
end;

procedure TfrmMain.actShortcutsCustomizationSaveExecute(Sender: TObject);
begin
  //
end;

procedure TfrmMain.actShortcutsEditExecute(Sender: TObject);

  procedure pUpdateCompletionArgs;
  var
    i: integer;

  begin
    i:= fFindTopWindow;

    if Assigned(Self.MDIChildren[i] as TfrmEditor) then begin
      pSetDataCompletion(synEditorTip,
                         (Self.MDIChildren[i] as TfrmEditor).synEditor,
                         'CTRL+SPACE');

      pSetDataCompletion(synEditor2Tip,
                         (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                         'CTRL+SPACE');
    end;

    pSetDataCompletion(synIOTip,
                       frmRterm.synIO,
                       'CTRL+SPACE');
  end;

var
  pTmp: pointer;

  n: integer;

  sShortcuts: array of string;

  procedure pRemoveShortcuts;
  var
    i: integer;

  begin
    // Reset all shortcuts
    with alMain do begin
      n:= ActionCount;
      SetLength(sShortcuts,
                n);

      for i:= 0 to n - 1 do
        If (Actions[i] is TAction) then begin
           sShortcuts[i]:= ShortCutToText(TAction(Actions[i]).Shortcut);
           TAction(Actions[i]).Shortcut:= TextToShortCut('None');
        end;
    end;
  end;

begin
  with modDados.cdShortcuts do
    pTmp:= GetBookmark;

  Application.CreateForm(TfrmShortcuts,
                         frmShortcuts);

  with frmShortcuts do
    try
      pRemoveShortcuts;
      ShowModal;
      with modDados.cdShortcuts do begin
        if BookmarkValid(pTmp) then GoToBookmark(pTmp);
        FreeBookmark(pTmp);
      end;
    finally
      frmMain.Refresh;
      FreeAndNil(frmShortcuts);
      pDatasetToActionList(Self);
      pUpdateCompletionArgs;
      pSetFocus_Main;
    end;
end;

procedure TfrmMain.actShortcutsHelpExecute(Sender: TObject);
begin
  pOpenUserGuidePDF('"Shortcuts"');
end;

procedure TfrmMain.actFindExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pFind;
end;

procedure TfrmMain.actFindAgainExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pFindAgain;
end;

procedure TfrmMain.actReplaceExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pReplace;
end;

{$WARNINGS OFF}
procedure TfrmMain.actSearchInFilesExecute(Sender: TObject);
var
  dlg: TfrmSearchInFilesDlg;

  iMatchCount,
   iFoundFileCount,
   iTotFileCount: integer;

  lSavedCursor: TCursor;

  sSearchText,
   sSearchDirectoryText,
   sSearchFileMask: string;

  seEditor: TSynEdit;

begin
  dlg:= TfrmSearchInFilesDlg.Create(Self);

  with dlg do begin
    if (sSearchFileMaskHistory <> EmptyStr) then SearchFileMaskHistory:= sSearchFileMaskHistory;
    SearchCaseSensitive    := bSearchCaseSensitive;
    SearchDirectory        := bSearchDirectory;
    SearchDirectoryText    := sSearchDirectoryText;
    SearchDirHistory       := sSearchDirHistory;
    SearchInSub            := bSearchInSub;
    SearchOpenFiles        := bSearchOpenFiles;
    SearchRegularExpression:= bSearchRegExp;
    SearchTextHistory      := sSearchTextHistory;
    SearchWholeWords       := bSearchWholeWords;
  end;

  iMatchCount    := 0;
  iFoundFileCount:= 0;

  if (Self.MDIChildCount > 0) then begin
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

    with seEditor do
      if SelAvail and
        (BlockBegin.Line = BlockEnd.Line) then dlg.SearchText:= SelText
//                                          else dlg.SearchText:= GetWordAtRowCol(WordStartEx(CaretXY));  // Avoid return empty wheter cursor is at the end of word
                                          else dlg.SearchText:= fFindWord_Extended(seEditor);
  end;

  if (dlg.ShowModal = mrOK) then begin
    // Set cursor to 'busy'
    if (MDIChildCount > 0) then begin
       lSavedCursor:= TfrmEditor(MDIChildren[0]).synEditor.cursor;
       TfrmEditor(MDIChildren[0]).synEditor.cursor:= crhourglass;
    end
    else Screen.cursor:= crHourGlass;

    if not actToolsVisible.Checked    then actToolsVisibleExecute(nil);
    if not actResultsVisible.Checked  then actResultsVisibleExecute(nil);
    if not actSearchVisible.Checked   then actSearchVisibleExecute(nil);
    frmTools.pgTools.ActivePage  := frmTools.tbsResults;
    frmTools.pgResults.ActivePage:= frmTools.tbsSearch;

    with frmTools.stbSearch do begin
      Panels[1].Text:= EmptyStr;
      Panels[3].Text:= EmptyStr;
      Panels[5].Text:= EmptyStr;
    end;
    with frmTools.tvSearch do begin
      if (Items.Count > 0) then begin
        Items.BeginUpdate;
        Items.Clear;
        Refresh;
        Items.EndUpdate;
      end;
    end;
    try
      with dlg do begin
        bSearchCaseSensitive  := SearchCaseSensitive;
        bSearchDirectory      := SearchDirectory;
        bSearchInSub          := SearchInSub;
        bSearchOpenFiles      := SearchOpenFiles;
        bSearchRegExp         := SearchRegularExpression;
        bSearchWholeWords     := SearchWholeWords;
        sSearchDirectoryText  := SearchDirectoryText;
        sSearchDirHistory     := SearchDirHistory;
        sSearchFileMask       := SearchFileMask;
        sSearchFileMaskHistory:= SearchFileMaskHistory;
        sSearchText           := SearchText;
      end;

      with dlg do begin
        iTimerCounter:= 0;
        iTotFileCount:= 0;
        pSetupSearchParameters(sSearchText);
        if bSearchOpenFiles then begin
          pSearchInOpenFiles(iFoundFileCount,
                             iMatchCount);
          iTotFileCount:= Self.MDIChildCount;
        end;
        if bSearchDirectory then begin
          pSearchInDirectories(sSearchDirectoryText,
                               sSearchFileMask,
                               iFoundFileCount,
                               iMatchCount,
                               iTotFileCount);
        end;
        sSearchTextHistory:= dlg.SearchTextHistory;
      end;
    finally
      if (MDIChildCount > 0) then TfrmEditor(frmMain.MDIChildren[0]).synEditor.cursor:= lSavedCursor
                             else Screen.cursor:= crDefault;

      with frmTools.stbSearch do
        Panels[1].Text:= IntToStr(frmTools.tvSearch.Items.Count);

      FreeAndNil(dlg);

      with frmTools.tvSearch do begin
        Selected:= Items.GetFirstNode;
        actSearchExpandOneExecute(Self);
        if (Items.Count > 2) then pToolsSearchControls(True)
                             else pToolsSearchControls(False);
      end;
    end;
  end;
end;
{$WARNINGS ON}

procedure TfrmMain.actGotoLineExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pGotoLine;
end;

procedure TfrmMain.actCopyFormattedRtfExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pCopyFormattedRtf;
end;

procedure TfrmMain.actCopyFormattedHtmlExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pCopyFormattedHtml;
end;

procedure TfrmMain.actCopyFormattedTeXExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pCopyFormattedTeX;
end;

procedure TfrmMain.actFileSaveExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    // File notify: Stop
    if Assigned(fNotif) then pNotifyFile_Stop;

    pFileSave(Self);

    pGetFile_Info(sActiveFile,
                  synEditor.Lines);

    // File notify: Start
    if (ExtractFileExt(sActiveFile) = EmptyStr) and
       ExecRegExpr('^Untitled',
                   sActiveFile) then Exit;  // The file wasn't saved: cancel in save dlg

    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= pFileChanged;
    pNotifyFile_Start(sActiveFile);
  end;
  pUpdateHexViewer;
end;

procedure TfrmMain.actFileSaveAsExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    // File notify: Stop
    if Assigned(fNotif) then pNotifyFile_Stop;

    pFileSaveAs(Self);

    pGetFile_Info(sActiveFile,
                  synEditor.Lines);

    // File notify: Start
    if (ExtractFileExt(sActiveFile) = EmptyStr) and
       ExecRegExpr('^Untitled',
                   sActiveFile) then Exit;  // The file wasn't saved: cancel in save dlg

    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= pFileChanged;
    pNotifyFile_Start(sActiveFile);
  end;

  pUpdateHexViewer;
end;

procedure TfrmMain.actFullPathUnixExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pFullPathUnix;

  pSetFocus_Main;
end;

procedure TfrmMain.actFullPathWindowsExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pFullPathWindows;

  pSetFocus_Main;
end;

procedure TfrmMain.actDatabaseVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsDatabase do begin
    TabVisible:= not TabVisible;
    actDatabaseVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actDateStampExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pDateStamp;
end;

procedure TfrmMain.actIndentBlockExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pIndentBlock;
end;

procedure TfrmMain.actEditUndoExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          Undo;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          Undo;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          Undo;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          Undo;
  end;
end;

procedure TfrmMain.actUnindentBlockExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pUnindentBlock;
end;

procedure TfrmMain.actUNIXExecute(Sender: TObject);
begin
  actUNIX.Checked:= True;
  ffDefault      := sffUNIX;
end;

procedure TfrmMain.actUpperCaseWordExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pUpperCaseWord;
end;

procedure TfrmMain.actAlwaysAddBOMExecute(Sender: TObject);
begin
  actAlwaysAddBOM.Checked:= not actAlwaysAddBOM.Checked;
end;

procedure TfrmMain.actANSIExecute(Sender: TObject);
begin
  actANSI.Checked:= True;
  seDefault      := seANSI;
  sfDefault      := sfANSI;
end;

procedure TfrmMain.actUTF8Execute(Sender: TObject);
begin
  actUTF8.Checked:= True;
  seDefault      := seUTF8;
  sfDefault      := sfUTF8;
end;

procedure TfrmMain.actUTF16LEExecute(Sender: TObject);
begin
  actUTF16LE.Checked:= True;
  seDefault         := seUTF16LE;
  sfDefault         := sfUTF16LSB;
end;

procedure TfrmMain.actUTF16BEExecute(Sender: TObject);
begin
  actUTF16BE.Checked:= TRue;
  seDefault         := seUTF16BE;
  sfDefault         := sfUTF16MSB;
end;

procedure TfrmMain.actLowerCaseWordExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pLowerCaseWord;
end;

procedure TfrmMain.actInvertCaseWordExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pInvertCase;
end;

procedure TfrmMain.pMatchBracket(seActive: TSynEdit);
const
  allBrackets = ['{',
                 '[',
                 '(',
                 '<',
                 '}',
                 ']',
                 ')',
                 '>'];

var
  att: TSynHighlighterAttributes;

  bcPos: TBufferCoord;

  cTmp: WideChar;

  iPos: integer;

  sAtCursor: WideString;

begin
  with seActive do begin
    if (SelStart <> SelEnd) then Exit;
    iPos:= SelStart;
    cTmp:= Text[iPos + 1];
    sAtCursor:= cTmp;

    if not(CharInSet(cTmp,
                     AllBrackets)) then Exit;

    bcPos:= CaretXY;
    GetHighlighterAttriAtRowCol(bcPos,
                                sAtCursor,
                                att);

    if (Highlighter.SymbolAttribute = att) then
      ExecuteCommand(ecMatchBracket,
                     #0,
                     nil)
  end
end;

procedure TfrmMain.menEncConUTF8wClick(Sender: TObject);
begin
  pSetBuffer_SaveFormat(sfUTF8);
end;

procedure TfrmMain.pMakeTemplate(sFile: string);
var
  i: integer;

  sContent,
   sFileExt: string;

begin
  actFileNewExecute(nil);

  sContent:= fFile_ToString(sFile);
  sFileExt:= ExtractFileExt(sFile);

  i:= fFindTopWindow;
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    synEditor.Text:= sContent;
    synEditor.Modified:= True;
    pSetHighlighterFromFileExt(sFileExt);
  end;

  with pgFiles.ActivePage do
    Tag:= (Self.MDIChildren[i] as TfrmEditor).fSetHighlighterID;
end;

procedure TfrmMain.menFileTemplateRdocDatasetClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R doc_dataset.Rd');
end;

procedure TfrmMain.menFileTemplateRdocEmptyClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R doc_empty.Rd');
end;

procedure TfrmMain.menFileTemplateRdocFunctionClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R doc_function.Rd');
end;

procedure TfrmMain.menFileTemplateRhtmlClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R html.Rhtml');
end;

procedure TfrmMain.menFileTemplateRmarkdownClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R markdown.Rmd');
end;

procedure TfrmMain.menFileTemplateRscriptClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R script.R');
end;

procedure TfrmMain.menFileTemplateRsweaveClick(Sender: TObject);
begin
  pMakeTemplate(sPath_TinnR +
                '\templates\R_noweb.Rnw');
end;

procedure TfrmMain.menForEncConANSIClick(Sender: TObject);
begin
  pSetBuffer_SaveFormat(sfANSI);
end;

procedure TfrmMain.menForEncConUTF16BEClick(Sender: TObject);
begin
  pSetBuffer_SaveFormat(sfUTF16MSB)
end;

procedure TfrmMain.menForEncConUTF16LEClick(Sender: TObject);
begin
  pSetBuffer_SaveFormat(sfUTF16LSB);
end;

procedure TfrmMain.menForEncConUTF8Click(Sender: TObject);
begin
  pSetBuffer_SaveFormat(sfUTF8);
end;

procedure TfrmMain.menForLinEndConMACClick(Sender: TObject);
begin
  pSetBuffer_FileFormat(sffMAC);
end;

procedure TfrmMain.menForLinEndConUNIXClick(Sender: TObject);
begin
  pSetBuffer_FileFormat(sffUNIX);
end;

procedure TfrmMain.menForLinEndConWINClick(Sender: TObject);
begin
  pSetBuffer_FileFormat(sffDOS);
end;

procedure TfrmMain.actMatchBracketExecute(Sender: TObject);
var
  seEditor,
   seLog: TSynEdit;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;

  case fGetFocus of
        // synEditor or synEditor2
    1..2: pMatchBracket(seEditor);
        // synIO
       3: pMatchBracket(frmRterm.synIO);
        // synLog and synLog2
       4: pMatchBracket(seLog);
  end;
end;

procedure TfrmMain.actMiscVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsMisc do begin
    TabVisible:= not TabVisible;
    actMiscVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actCommentsEditExecute(Sender: TObject);
begin
  sCommentsBookMark:= modDados.cdComments.Bookmark;
  menToolsDatabaseCommentsClick(nil);
  pSetFocus_Main;
end;

procedure TfrmMain.actCommentsHelpExecute(Sender: TObject);
begin
  pOpenUserGuidePDF('"Comments"');
end;

procedure TfrmMain.actCompletionCopyDescritionExecute(Sender: TObject);
begin
  with modDados do
    if frmTools.dbCompletionMemo.SelLength <> 0 then Clipboard.AsText:= frmTools.dbCompletionMemo.SelText
                                                else Clipboard.AsText:= cdCompletionCompletion.Value;
end;

procedure TfrmMain.actCompletionCopyFunctionExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdCompletionFunction.Text;
end;

procedure TfrmMain.actCompletionEditExecute(Sender: TObject);
begin
  sCompletionBookMark:= modDados.cdCompletion.Bookmark;
  menToolsDatabaseCompletionClick(nil);
  pSetFocus_Main;
end;

procedure TfrmMain.actCompletionExampleSelectedExecute(Sender: TObject);

  function fGetWord: string;
  var
    iPos: integer;

    sTmp: string;

  begin
    Result:= EmptyStr;
    sTmp:= modDados.cdCompletionFunction.Value;
    iPos:= Pos(',',
               sTmp);

    if (iPos <> 0) then sTmp:= Copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Exit;
    end;

    Result:= 'example(''' +
             sTmp +
             ''')';
  end;

var
  sTmp: string;

begin
  sTmp:= fGetWord;
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actCompletionExecute(Sender: TObject);
var
  i: integer;
  
begin
  i:= fFindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    pDoCompletionInsert(True);

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.actCompletionHelpExecute(Sender: TObject);
begin
  pOpenUserGuidePDF('"Completion"');
end;

procedure TfrmMain.actCompletionHelpSelectedExecute(Sender: TObject);

  function fGetWord: string;
  var
    iPos: integer;

    sTmp: string;

  begin
    Result:= EmptyStr;
    sTmp:= modDados.cdCompletionFunction.Value;
    iPos:= Pos(',',
               sTmp);

    if (iPos <> 0) then sTmp:= Copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Exit;
    end;

    Result:= 'help(''' +
             sTmp +
             ''')';
  end;

var
  sTmp: string;

begin
  sTmp:= fGetWord;
  if (sTmp = EmptyStr) then Exit;
  pDoSend(sTmp);
end;

procedure TfrmMain.actCompletionInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then Exit;
  i:= fFindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    pDoCompletionInsert;

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.actDataCommentsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsComments do begin
    TabVisible:= not TabVisible;
    actDataCommentsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actDataCompletionVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsCompletion do begin
    TabVisible:= not TabVisible;
    actDataCompletionVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actNormalSelectExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pNormalSelect;
end;

procedure TfrmMain.actNotificationExecute(Sender: TObject);
begin
  with actNotification do begin
    Checked:= Not Checked;

    if Checked then
      with actNotification_US do
        Enabled:= True
    else
      with actNotification_US do begin
        Checked:= False;
        Enabled:= False;
      end;
  end;
end;

procedure TfrmMain.actNotification_USExecute(Sender: TObject);
begin
  with actNotification_US do
    Checked:= Not Checked;
end;

procedure TfrmMain.actLineSelectExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pLineSelect;
end;

procedure TfrmMain.actColumnSelectExecute(Sender: TObject);
begin
  with (MDIChildren[fFindTopWindow] as TfrmEditor) do
    pColumnSelect;
end;

procedure TfrmMain.actUpperCaseSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pUpperCaseSelection;
end;

procedure TfrmMain.actRtermLOGLineWrapExecute(Sender: TObject);
var
  seLog: TSynEdit;

begin
  with actRtermLogLineWrap do
    Checked:= not Checked;

  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;

  with seLog do
    WordWrap:= actRtermLogLineWrap.Checked;
end;

procedure TfrmMain.actLowerCaseSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pLowerCaseSelection;
end;

procedure TfrmMain.actInvertSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pInvertSelection;
end;

procedure TfrmMain.actRtermIOLineWrapExecute(Sender: TObject);
begin
  with actRtermIOLineWrap do
    Checked:= not Checked;

  with frmRterm.synIO do
    WordWrap:= actRtermIOLineWrap.Checked;
end;

procedure TfrmMain.pGetComments;
var
  scHighlighter,
   scBBHighlighter,
   scBEHighlighter: TSynCustomHighlighter;

  sLanguage: string;

begin
  // Get Highlighter (and check for mistake selection in multisyn case)
  if frmTools.cbComAutoDetect_Language.Checked then begin
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
      if (synEditor.SelText <> '') then begin
        scBBHighlighter:= fGetBBHighLighter;                 // Highlighter of the block begin
        scBEHighlighter:= fGetBEHighLighter;                 // Highlighter of the block end

        if (scBBHighlighter <> scBEHighlighter) then Exit;  // Will no be commented!
      end;

      scHighlighter:= fGetCurrentHighLighter;
    end;

    sLanguage:= scHighlighter.GetFriendlyLanguageName;
    modDados.pSetCurrentHighlighter(sLanguage);
  end;

  with modDados do begin
    //pSetCurrentHighlighter(sLanguage);
    with cdComments do begin
      DisableControls;
      sLineComment := Fields[1].AsString;  // Line
      sBeginComment:= Fields[2].AsString;  // Begin
      sEndComment  := Fields[3].AsString;  // End
      EnableControls;
    end;
  end;

  if (frmTools.cbComPriority_Line.Checked) and
     (sLineComment <> EmptyStr) then begin
    // Line by line
    sBeginComment:= sLineComment;
    sEndComment  := EmptyStr;
  end
  else
  if (sBeginComment = EmptyStr) or
     (sEndComment = EmptyStr) then begin
       // Line by line if and only if one (Begin or End) is empty
       sBeginComment:= sLineComment;
       sEndComment  := EmptyStr;
  end;
end;

procedure TfrmMain.actCommentExecute(Sender: TObject);
begin
  sBeginComment:= EmptyStr;  // Initial status

  pGetComments;
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pComment(sBeginComment,
             sEndComment);
end;

procedure TfrmMain.actUncommentFirstExecute(Sender: TObject);
begin
  sBeginComment:= EmptyStr;  // Initial status

  pGetComments;
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pUncomment(sBeginComment,
               sEndComment);
end;

procedure TfrmMain.actUncommentExecute(Sender: TObject);
begin
  sBeginComment:= EmptyStr;  // Initial status

  pGetComments;
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    pUncomment(sBeginComment,
               sEndComment,
               [rfReplaceAll]);
end;

procedure TfrmMain.actFileCloseExecute(Sender: TObject);
begin
  (Self.MDIChildren[fFindTopWindow] as TfrmEditor).Close;
  if (pgFiles.PageCount > 0) then pgFilesChange(nil);
end;

procedure TfrmMain.actFileCloseOthersExecute(Sender: TObject);
var
  i,
   iChildID: integer;

  sTmp,
   sActiveChild: string;

begin
  i:=0;
  sActiveChild:= pgFiles.ActivePage.Hint;
  while (pgFiles.PageCount > 1) do begin
    pgFiles.ActivePageIndex:= i;
    sTmp:= pgFiles.ActivePage.Hint;
    if (sTmp <> sActiveChild) then begin
      iChildID:= fFindWindowByName(sTmp);

      with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
        bCloseCanceled:= False;
        Close;
        if bCloseCanceled then Exit;
      end;

    end
    else i:=1;  // activeChild has now index = 0
  end;
  pgFiles.ActivePageIndex:= 0;
end;

procedure TfrmMain.actFileCloseAllExecute(Sender: TObject);
var
  iChildID: integer;

  sTmp: string;

begin
  while (pgFiles.PageCount > 0) do begin
    pgFiles.ActivePageIndex:= 0;
    sTmp    := pgFiles.ActivePage.Hint;
    iChildID:= fFindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
      bCloseCanceled:= False;
      Close;
      if bCloseCanceled then Exit;;
    end;

  end;
  if (pgFiles.PageCount = 0) then pClearStatusBar;
end;

procedure TfrmMain.actFileCloseRightExecute(Sender: TObject);
var
  iTotPages,
   iPos,
   iNumToClose,
   iChildID: integer;

  sTmp: string;

begin
  iPos       := pgFiles.ActivePageIndex;
  iTotPages  := pgFiles.PageCount - 1;
  iNumToClose:= iTotPages - iPos;
  if (iNumToClose = 0) then Exit;
  repeat
    sTmp    := pgFiles.Pages[iPos + 1].Hint;
    iChildID:= fFindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
      bCloseCanceled:= False;
      Close;
      if bCloseCanceled then Exit;
    end;

    dec(iNumToClose);
  until (iNumToClose = 0);
  pgFiles.ActivePageIndex:= iPos;
end;

procedure TfrmMain.actFileCloseLeftExecute(Sender: TObject);
var
  iPos,
   iChildID: integer;

  sTmp: string;

begin
  iPos:= pgFiles.ActivePageIndex;
  if (iPos = 0) then Exit;
  repeat
    sTmp    := pgFiles.Pages[iPos - 1].Hint;
    iChildID:= fFindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
      bCloseCanceled:= False;
      Close;
      if bCloseCanceled then Exit;;
    end;

    dec(iPos);
  until (iPos = 0);
  pgFiles.ActivePageIndex:= iPos;
end;

procedure TfrmMain.actCopyFormattedExecute(Sender: TObject);
begin
  // Nothing, but don't remove!
end;

procedure TfrmMain.actRExplorerBasicExecute(Sender: TObject);
begin
  // Nothing, but don't remove!
end;

procedure TfrmMain.actToolsTabsBottomExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then Exit;
  with frmTools do begin
    with pgTools do
      TabsPosition:= fsdBottom;

    with pgMisc do 
      TabsPosition:= fsdBottom;

    with pgMarkup do
      TabsPosition:= fsdBottom;

    with pgTxt2tags do
      TabsPosition:= fsdBottom;

    with pgLatex do
      TabsPosition:= fsdBottom;

    with pgResults do
      TabsPosition:= fsdBottom;

    with pgDatabase do
      TabsPosition:= fsdBottom;

    with pgR do
      TabsPosition:= fsdBottom;
  end;
  actToolsTabsBottom.Checked:= True;  
end;

procedure TfrmMain.actToolsTabsLeftExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then Exit;
  with frmTools do begin
    with pgTools do
      TabsPosition:= fsdLeft;

    with pgMisc do
      TabsPosition:= fsdLeft;

    with pgMarkup do
      TabsPosition:= fsdLeft;

    with pgTxt2tags do
      TabsPosition:= fsdLeft;

    with pgLatex do
      TabsPosition:= fsdLeft;

    with pgResults do
      TabsPosition:= fsdLeft;

    with pgDatabase do
      TabsPosition:= fsdLeft;

    with pgR do
      TabsPosition:= fsdLeft;
  end;
  actToolsTabsLeft.Checked:= True;  
end;

procedure TfrmMain.actToolsTabsRightExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then Exit;
  with frmTools do begin
    with pgTools do
      TabsPosition:= fsdRight;
    
    with pgMisc do
      TabsPosition:= fsdRight;
      
    with pgMarkup do
      TabsPosition:= fsdRight;

    with pgTxt2tags do
      TabsPosition:= fsdRight;

    with pgLatex do
      TabsPosition:= fsdRight;

    with pgResults do
      TabsPosition:= fsdRight;
  
    with pgDatabase do
      TabsPosition:= fsdRight;

    with pgR do
      TabsPosition:= fsdRight;
  end;
  actToolsTabsRight.Checked:= True;  
end;

procedure TfrmMain.actToolsTabsTopExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then Exit;
  with frmTools do begin
    with pgTools do
      TabsPosition:= fsdTop;

    with pgMisc do
      TabsPosition:= fsdTop;

    with pgMarkup do
      TabsPosition:= fsdTop;

    with pgTxt2tags do
      TabsPosition:= fsdTop;

    with pgLatex do
      TabsPosition:= fsdTop;

    with pgResults do
      TabsPosition:= fsdTop;

    with pgDatabase do
      TabsPosition:= fsdTop;

    with pgR do
      TabsPosition:= fsdTop;
  end;
  actToolsTabsTop.Checked:= True;  
end;

procedure TfrmMain.menHelIniFilesClick(Sender: TObject);
begin
  fMessageDlg(sPath_Ini + #13 + #13 +
              'The main folder above stores all ini files.' + #13 +
              'Each ini file is located in the respective sub-folder (data, syntax, etc)!',
              mtInformation,
              [mbOk],
              0);

  pSetFocus_Main;
end;

procedure TfrmMain.menHelNewsClick(Sender: TObject);
begin
  pOpenUserGuidePDF('"What is new?"');
end;

procedure TfrmMain.actRFilterRefreshExecute(Sender: TObject);
begin
  actRExplorerRefreshExecute(nil);
end;

procedure TfrmMain.pMySort(iSort: integer);

  procedure pUpdateSort;
  var
    tmpTopLine: integer;

    seEditor: TSynEdit;
    
  begin
    if (pgFiles.PageCount < 1) then Exit;
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;

    with seEditor do begin
      tmpTopLine:= TopLine;
      if not SelAvail then SelectAll;
      PasteFromClipboard;
      TopLine:= tmpTopLine;
    end;
  end;

var
  bSorted: boolean;

  meTmp: TMemo;

  seEditor: TSynEdit;

  slTmp: TStringList;

  function fSortMemo: boolean;
  var
    sStructure: string;
    wYear,
     wMonth,
     wDay: Word;

  begin
    Result := False;
    bSorted:= False;
    try
      slTmp.Text:= TrimRight(meTmp.Text);
      case iSort of
        1: slTmp.Sort;
        2: slTmp.CustomSort(fSort_Integer);
        3: slTmp.CustomSort(fSort_Date);
      end;

      meTmp.Text:= TrimRight(slTmp.Text);
      Result    := True;
      bSorted   := True;
    except
      on E: exception do begin
        DecodeDate(Now,
                   wYear,
                   wMonth,
                   wDay);

        sStructure:= '   Month: '   + IntToStr(wMonth) + #13 +
                     '   Day    : ' + IntToStr(wDay)   + #13 +
                     '   Year   : ' + IntToStr(wYear);

        fMessageDlg(E.Message + '!' + #13 + #13 +
                    'Your date system is set as ' + DateToStr(Now) + #13 +
                    sStructure + #13 + #13 +
                    'So, please, before to repeat this procedure,' + #13 +
                    'change the system or correct the dates!',
                    mtWarning,
                    [mbOk],
                    0);
      end;
    end;
  end;

begin
  if not fSave_PriorClipboard_Text then Exit;
  try
    slTmp       := TStringList.Create;
    meTmp       := TMemo.Create(nil);
    meTmp.Parent:= panInvisibleParent;
    
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;
    
    with seEditor do begin
      if SelAvail then meTmp.Text := SelText;
                  //else meTmp.Lines:= Lines;

      if fSortMemo then begin
          meTmp.SelectAll;
          meTmp.CopyToClipboard;
      end;

    end;
    
    if bSorted then pUpdateSort;
  finally
    pRestore_PriorClipboard_Text;
    FreeAndNil(slTmp);
    FreeAndNil(meTmp);
  end;
end;

procedure TfrmMain.menWebRSearchNabbleRbrClick(Sender: TObject);
begin
  pOpen_Url('http://r-br.2285057.n4.nabble.com/');
end;

procedure TfrmMain.menWebRSearchNabbleRClick(Sender: TObject);
begin
  pOpen_Url('http://r.789695.n4.nabble.com/');
end;

procedure TfrmMain.actSortStringExecute(Sender: TObject);
begin
  pMySort(1); // String
end;

procedure TfrmMain.actSortNumberExecute(Sender: TObject);
begin
  pMySort(2); // Number
end;

procedure TfrmMain.actSortDateExecute(Sender: TObject);
begin
  pMySort(3); // Date
end;

procedure TfrmMain.actOrganizeScreenExecute(Sender: TObject);
var
  i: integer;

begin
  if not fRgui_Running then Exit;

 (*
  0: Tinn-R on top
  1: Tinn-R on bottom
  2: Tinn-R on left
  3: Tinn-R on right

  SetWindowPos(hwnd,
               -1,
               left,
               top,
               width,
               high,
               SWP_SHOWWINDOW)
 *)

  for i:= 1 to 2 do  // Once just is not enough for all flavors of the OS Windows!
    case iRguiTinnR_Disposition of
      0: begin  // 0: Tinn-R on top
           // Set Tinn-R position
           SetWindowPos(frmMain.Handle,
                        HWND_TOP,
                        0,
                        0,
                        Screen.Width,
                        (Screen.Height * iRguiTinnR_Proportion div 100),
                        SWP_SHOWWINDOW);

           // Set Rgui position
           SetWindowPos(hRgui,
                        HWND_TOP,
                        0,
                        (Screen.Height * iRguiTinnR_Proportion div 100),
                        Screen.Width,
                        Screen.Height - (Screen.Height * iRguiTinnR_Proportion div 100) -30,
                        SWP_SHOWWINDOW);
         end;
      1: begin  // 1: Tinn-R on bottom
           // Tinn-R
           SetWindowPos(frmMain.Handle,
                        HWND_TOP,
                        0,
                        Screen.Height - (Screen.Height * iRguiTinnR_Proportion div 100),
                        Screen.Width,
                        (Screen.Height * iRguiTinnR_Proportion div 100) - 30,
                        SWP_SHOWWINDOW);

           // Rgui
           SetWindowPos(hRgui,
                        HWND_TOP,
                        0,
                        0,
                        Screen.Width,
                        Screen.Height - (Screen.Height * iRguiTinnR_Proportion div 100),
                        SWP_SHOWWINDOW);
         end;
      2: begin  // 2: Tinn-R on left
           // Tinn-R
           SetWindowPos(frmMain.Handle,
                        HWND_TOP,
                        0,
                        0,
                        (Screen.Width * iRguiTinnR_Proportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);

           // Rgui
           SetWindowPos(hRgui,
                        HWND_TOP,
                        (Screen.Width * iRguiTinnR_Proportion div 100),
                        0,
                        Screen.Width - (Screen.Width * iRguiTinnR_Proportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);
         end;
      3: begin  // 3: Tinn-R on right
           // Tinn-R
           SetWindowPos(frmMain.Handle,
                        HWND_TOP,
                        Screen.Width - (Screen.Width * iRguiTinnR_Proportion div 100),
                        0,
                        (Screen.Width * iRguiTinnR_Proportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);

           // Rgui
           SetWindowPos(hRgui,
                        HWND_TOP,
                        0,
                        0,
                        Screen.Width - (Screen.Width * iRguiTinnR_Proportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);
         end;
    end;

  bAlreadyOrganized:= True;
  Self.WindowState := wsNormal;
  pSetFocus_Rgui(iDelay);
end;

procedure TfrmMain.pDoIPConnection(sIPHost: string;
                                       iIPPort: integer;
                                       bActive: boolean);
begin
  csREnvironment.Host  := sIPHost;
  csREnvironment.Port  := iIPPort;
  csRExplorer.Host     := sIPHost;
  csRExplorer.Port     := iIPPort;
  csRGeneral.Host      := sIPHost;
  csRGeneral.Port      := iIPPort;
  csRtip.Host          := sIPHost;
  csRtip.Port          := iIPPort;

  csREnvironment.Active:= bActive;
  csRExplorer.Active   := bActive;
  csRGeneral.Active    := bActive;
  csRtip.Active        := bActive;
  bTCPIPRunning        := bActive;
end;

procedure TfrmMain.pDoRConnection(sTmp: string;
                                      bActive,
                                      bSendTask: boolean);
var
  sToSend: string;

begin
  if bSendTask then begin  // Rterm local must be running!
    pCheckRterm;
    sToSend:= sTmp + #13#10;
    frmRterm.cRterm.SendInput(sToSend);
    pSendToConsole(sTmp);
  end;

  pSetFocus_Rgui(iDelay div 4);
  if bIPLocal then pDoIPConnection(sIPHostLocal,
                                   iIPPortLocal,
                                   bActive)
              else pDoIPConnection(sIPHostRemote,
                                   iIPPortRemote,
                                   bActive);
end;

procedure TfrmMain.pDoRguiConnection(sTmp: string;
                                         bActive: boolean);
begin
  if not fRgui_Running then Exit;
  fCodeSender.pSendChar(sTmp,
                        hRgui);

  Sleep(2*iDelay div 3);
  if bIPLocal then pDoIPConnection(sIPHostLocal,
                                   iIPPortLocal,
                                   bActive)
              else pDoIPConnection(sIPHostRemote,
                                   iIPPortRemote,
                                   bActive);
end;

procedure TfrmMain.actRContTCPConnectionExecute(Sender: TObject);
var
  sStart,
   sStop: string;

begin
  if bIPLocal then begin
    sStart:= 'startSocketServer(port=' +
             IntToStr(iIPPortLocal) +
             ')';

    sStop:= 'stopSocketServer(port=' +
            IntToStr(iIPPortLocal) +
            ')'
  end
  else begin
    sStart:= 'startSocketServer(port=' +
             IntToStr(iIPPortRemote) +
             ')';

    sStop:= 'stopSocketServer(port=' +
            IntToStr(iIPPortRemote) +
            ')';
  end;

  try
    // It will connect
    if not actRContTCPConnection.Checked then begin
      // Related to Rterm local
      if fRterm_Running and
         bIPLocal then begin
        pDoRConnection(sStart,
                       True,
                       True);
        actRContTCPConnection.ImageIndex:= 293;
        Exit;
      end;

      // Related to R (gui or term) remote
      if not bIPLocal then begin
        pDoRConnection(sStart,
                       True,
                       False);
        actRContTCPConnection.ImageIndex:= 293;
        Exit;
      end;

      // Related to Rgui local
      if fRgui_Running then begin
        pDoRguiConnection(sStart,
                          True);
        actRContTCPConnection.ImageIndex:= 293;
      end;
    end
    // It will disconnect
    else begin
      bTCPIPRunning:= False;  // For all R

      // Related to Rterm local
      if fRterm_Running and
         bIPLocal then begin
        pDoRConnection(sStop,
                       False,
                       True);
        actRContTCPConnection.ImageIndex:= 168;
        Exit;
      end;

      // Related to R (gui or term) remote
      if not bIPLocal then begin
        pDoRConnection(sStop,
                       False,
                       False);
        actRContTCPConnection.ImageIndex:= 168;
        Exit;
      end;

      // Related to Rgui local
      if fRgui_Running then begin
        pDoRguiConnection(sStop,
                          False);
        actRContTCPConnection.ImageIndex:= 168;
      end;
    end;
  except
    // TODO
  end
end;

function TfrmMain.fRWorkDir: string;
begin
  with pgFiles do
    if (PageCount > 0) and
       FileExists(ActivePage.Hint) and
       bRSetWorkDir_Starting then Result:= ExtractFilePath(ActivePage.Hint)
                             else Result:= ExtractFilePath(sPath_Rgui);
end;

procedure TfrmMain.actRContGuiPuTTYStartCloseExecute(Sender: TObject);

  function fIsRQuestionRunning(sCaption: string): Boolean;
  var
    tmpHandle: HWND;

  begin
    Result:= False;
    tmpHandle:= fGetWindowHandle(Pchar(sCaption));
    if (tmpHandle <> 0) then Result:= True;
  end;

  procedure pReturnPreviousStates;
  begin
    // On Top
    if bOnTop then begin
      pOnTop(Application.Handle);
      actOnTop.Checked:= True;
      pCheckTop;
    end
    else begin
      pOnTop(Application.Handle);
      actOnTop.Checked:= False;
    end;

    // ReturnFocus
    if bRguiReturnFocus then begin
      actRguiReturnFocus.Checked:= True;
      pSetFocus_Rgui(iDelay);
    end
    else actRguiReturnFocus.Checked:= False;
  end;

  procedure pStartR_PuTTY;
  var
    sCmd,
     sPath,
     sTmp: string;

  begin
    if not fCheckConnection then begin
      Windows.Beep(600, 800);
      Exit;
    end;

    sPath:= sPath_TinnR +
            '\putty\putty.exe';

    sCmd:= sPath +
           ' -ssh ' +
           sPuttyUser +
           '@' +
           sPuttyHost +
           ' -pw ' +
           sPuttyPassword;

    if fOpen_CmdLine(sCmd,
                     SW_NORMAL) then begin
      sTmp:= 'R ' +
             sParRPuTTY;

      Sleep(30*iDelay);

      pDoSend(sTmp);
    end;
  end;

  procedure pCloseR_PuTTY;
  var
    sTmp: string;

  begin
    Sleep(10*iDelay);

    sTmp:= 'exit';
    fCodeSender.pSendChar(sTmp,
                          hRgui);
  end;

var
  resShellExecute: HINST;

  sTmp: string;

begin
  if (actRContGuiPuTTYStartClose.Caption = 'Rgui/PuTTY (start)') then begin

    // It will start PuTTY (SSH connection)
    if (iRecognition_Caption = 4) then begin
      pStartR_PuTTY;
      Exit;
    end;

    // It will check the path of Rgui executable
    if (sPath_Rgui = EmptyStr) then begin
      fMessageDlg('The preferred Rgui was not defined!' + #13#10 +
                  #13#10 +
                  'Please, set Rgui path at: Options/Application/R/.',
                   mtWarning,
                   [mbOK],
                   0);
      Exit;
    end;

    // It will check the path of Rgui executable
    if not FileExists(sPath_Rgui) or
       (ExtractFileExt(sPath_Rgui) <> '.exe') then begin
      sTmp:= sPath_Rgui;

      if (sTmp = EmptyStr) then sTmp:= 'Empty';

      fMessageDlg(sTmp + #13 + #13 +
                  'The file above is not executable!' + #13#10 +
                  #13#10 +
                  'Please, set Rgui path at: Options/Application/R/.',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;

    pSetRLibrary_Path(sPath_Rgui);

    // It will open preferred Rgui
    resShellExecute:= fRunFile(sPath_Rgui,
                               sParRgui,
                               fRWorkDir);

    if (resShellExecute <= 32) then pSend_Message(resShellExecute);  // function fail

    bRRequireKnitr:= True;
  end
  else begin
    // It will to close preferred Rgui/PuTTY
    // Disable pOnTop (Temporary)
    if bOnTop then begin
      SetWindowPos(Application.Handle,
                   HWND_NOTOPMOST,
                   0,
                   0,
                   0,
                   0,
                   SWP_NOACTIVATE or
                   SWP_NOMOVE or
                   SWP_NOSIZE or
                   SWP_NOSENDCHANGING);

      actOnTop.Checked:= False;
    end;

    // Disable ReturnFocus (Temporary)
    if bRguiReturnFocus then actRguiReturnFocus.Checked:= False;
    Application.ProcessMessages;

    if fUseTCPIP then begin
      sTmp:= 'q()' + #13#10;

      pPrintMessage(sTmp,
                    True);

      csRGeneral.Socket.SendText(sTmp)
    end
    else if fRgui_Running then begin
      sTmp:= 'q()';

      fCodeSender.pSendChar(sTmp,
                            hRgui);

      bRRequireKnitr:= False;

      // It will close PuTTY (SSH connection)
      if (iRecognition_Caption = 4) then pCloseR_PuTTY;
    end;

    Sleep(iDelay);
    while fIsRQuestionRunning('Question') do;

    pReturnPreviousStates;
  end;
end;

procedure TfrmMain.actFilesFullPathUnixExecute(Sender: TObject);
var
  sFilePath: string;

begin
  with frmTools.tvProject do begin
    SetFocus;

    if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then ClipBoard.AsText:= DosPathToUnixPath(sFilePath)
                               else fMessageDlg(trim(sFilePath) + #13 + #13 +
                                                'File not found!',
                                                mtWarning,
                                                [mbOk],
                                                0);
    end
    else
      fMessageDlg('Please, choice a valid file!',
                  mtWarning,
                  [mbOk],
                  0);
  end;
end;

procedure TfrmMain.actFilesFullPathWindowsExecute(Sender: TObject);
var
  sFilePath: string;

begin
  with frmTools.tvProject do begin
    SetFocus;

    if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then ClipBoard.AsText:= sFilePath
                               else fMessageDlg(trim(sFilePath) + #13 + #13 +
                                                'File not found!',
                                                mtWarning,
                                                [mbOk],
                                                0);
    end
    else
      fMessageDlg('Please, choice a valid file!',
                  mtWarning,
                  [mbOk],
                  0);
  end;
end;

procedure TfrmMain.pDoTxt2Tag(iButton: integer);
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    case iButton of
       //=============================
       // Marks
       //=============================
       // Title 1
       1: if SelAvail then SelText:= '= ' + SelText + ' ='
                      else begin
                        SelText:= '= ' + ' =';
                        CaretX := CaretX - 2;
                      end;
       // Title 2
       2: if SelAvail then SelText:= '== ' + SelText + ' =='
                      else begin
                        SelText:= '== ' + ' ==';
                        CaretX := CaretX - 3;
                      end;
       // Title 3
       3: if SelAvail then SelText:= '=== ' + SelText + ' ==='
                      else begin
                        SelText:= '=== ' + ' ===';
                        CaretX := CaretX - 4;
                      end;
       // Title 4
       4: if SelAvail then SelText:= '==== ' + SelText + ' ===='
                      else begin
                        SelText:= '==== ' + ' ====';
                        CaretX := CaretX - 5;
                      end;
       // Title 5
       5: if SelAvail then SelText:= '===== ' + SelText + ' ====='
                      else begin
                        SelText:= '===== ' + ' =====';
                        CaretX := CaretX - 6;
                      end;
       // Title num. 1
       6: if SelAvail then SelText:= '+ ' + SelText + ' +'
                      else begin
                        SelText:= '+ ' + ' +';
                        CaretX := CaretX - 2;
                      end;
       // Title num. 2
       7: if SelAvail then SelText:= '++ ' + SelText + ' ++'
                      else begin
                        SelText:= '++ ' + ' ++';
                        CaretX := CaretX - 3;
                      end;
       // Title num. 3
       8: if SelAvail then SelText:= '+++ ' + SelText + ' +++'
                      else begin
                        SelText:= '+++ ' + ' +++';
                        CaretX := CaretX - 4;
                      end;
       // Title num. 4
       9: if SelAvail then SelText:= '++++ ' + SelText + ' ++++'
                      else begin
                        SelText:= '++++ ' + ' ++++';
                        CaretX := CaretX - 5;
                      end;
      // Title num. 5
      10: if SelAvail then SelText:= '+++++ ' + SelText + ' +++++'
                      else begin
                        SelText:= '+++++ ' + ' +++++';
                        CaretX := CaretX - 6;
                      end;
      // Bold
      11: if SelAvail then SelText:= '**' + SelText + '**'
                      else begin
                        SelText:= '**' + '**';
                        CaretX := CaretX - 2;
                      end;
      // Italic
      12: if SelAvail then SelText:= '//' + SelText + '//'
                      else begin
                        SelText:= '//' + '//';
                        CaretX := CaretX - 2;
                      end;
      // Underline
      13: if SelAvail then SelText:= '__' + SelText + '__'
                      else begin
                        SelText:= '__' + '__';
                        CaretX := CaretX - 2;
                      end;
      // Mono
      14: if SelAvail then SelText:= '``' + SelText + '``'
                      else begin
                        SelText:= '``' + '``';
                        CaretX := CaretX - 2;
                      end;
      // Quote
      15: if SelAvail then SelText:= '  ' + SelText
                      else SelText:= '  ';
      // List
      16: if SelAvail then SelText:= '- ' + SelText
                      else SelText:= '-';
      // List num.
      17: if SelAvail then SelText:= '+ ' + SelText
                      else SelText:= '+';
      // List def.
      18: if SelAvail then SelText:= ': ' + SelText
                      else SelText:= ':';
      // Link
      19: if SelAvail then SelText:= '[' + SelText + ']'
                      else begin
                        SelText:= '[]';
                        CaretX := CaretX - 1;
                      end;
      // Anchor
      20: if SelAvail then SelText:= '[' + SelText + ']'
                      else begin
                        SelText:= '[]';
                        CaretX := CaretX - 1;
                      end;
      // Verbatin line
      21: if SelAvail then SelText:= '``` ' + SelText
                      else SelText:= '```';
      // Verbatin area
      22: if SelAvail then begin
            SelText:= '```' + #13 +
                      SelText + #13 +
                      '```';
            CaretX := CaretX - 3;
            CaretY := CaretY + 1;
          end
          else begin
            SelText:= '```' + #13 +
                              #13 +
                      '```';
            CaretX := CaretX - 3;
            CaretY := CaretY - 1;
          end;
      // Raw text
      23: if SelAvail then SelText:= '""' + SelText + '""'
                      else begin
                        SelText:= '""' + '""';
                        CaretX := CaretX - 2;
                      end;
      // Raw line
      24: if SelAvail then SelText:= '"""' + SelText
                      else SelText:= '""" ';
      // Raw area
      25: if SelAvail then begin
            SelText:= '"""' + #13 +
                      SelText + #13 +
                      '"""';
            CaretX := CaretX - 3;
            CaretY := CaretY + 1;
          end
          else begin
            SelText:= '"""' + #13 +
                              #13 +
                      '"""';
            CaretX := CaretX - 3;
            CaretY := CaretY - 1;
          end;
      // Image
      26: if SelAvail then SelText:= '[' + SelText + ']'
                      else begin
                        SelText:= '[]';
                        CaretX := CaretX - 1;
                      end;
      // Comments
      27: if SelAvail then SelText:= '% ' + SelText
                      else SelText:= '% ';
      // Table
      28: if SelAvail then SelText:= '|' + SelText
                      else SelText:= '|';
      // Line sep.
      29: if SelAvail then SelText:= '--------------------' + SelText
                      else SelText:= '--------------------';
      // Line sep. double
      30: if SelAvail then SelText:= '=====================' + SelText
                      else SelText:= '=====================';
      //=============================
      // Macros
      //=============================
      // Date
      31: if SelAvail then SelText:= '%%date() ' + SelText
                      else SelText:= '%%date()';
      // Modification time
      32: if SelAvail then SelText:= '%%mtime() ' + SelText
                      else SelText:= '%%mtime()';
      // Path source
      33: if SelAvail then SelText:= '%%infile() ' + SelText
                      else SelText:= '%%infile()';
      // Path destination
      34: if SelAvail then SelText:= '%%outfile() ' + SelText
                      else SelText:= '%%outfile()';
      // Table of content
      35: if SelAvail then SelText:= '%%toc ' + SelText
                      else SelText:= '%%toc ';
      // Document title
      36: begin
            CaretX := 0;
            CaretY := 0;
            SelText:= 'Document title' + #13 +
                      'Author name, email' + #13 +
                      '%%date(%b/%d/%Y)' + #13 + #13;
          end;
      //=============================
      // Settings
      //=============================
      // Target
      37: if SelAvail then SelText:= '%!target: ' + SelText
                      else SelText:= '%!target: ';
      // Options
      38: if SelAvail then SelText:= '%!options(): ' + SelText
                      else SelText:= '%!options(): ';
      // Pre processor
      39: if SelAvail then SelText:= '%!preproc: ' + SelText
                      else SelText:= '%!preproc: ';
      // Post processor
      40: if SelAvail then SelText:= '%!postproc(): ' + SelText
                      else SelText:= '%!postproc(): ';
      // Encoding
      41: if SelAvail then SelText:= '%!encoding: ' + SelText
                      else SelText:= '%!encoding: ';
      // Style
      42: if SelAvail then SelText:= '%!style: ' + SelText
                      else SelText:= '%!style: ';
    end;
  end;
end;

procedure TfrmMain.LabelClick(Sender: TObject);
var
  i: integer;
  
begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;
  pDoTxt2Tag((Sender as TLabel).Tag);
  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.actWinExplVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsWinExplorer do begin
    TabVisible:= not TabVisible;
    actWinExplVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actWorkExplVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsWorkExplorer do begin
    TabVisible:= not TabVisible;
    actWorkExplVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actProjectVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsProject do begin
    TabVisible:= not TabVisible;
    actProjectVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actMarkupVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsMarkup do begin
    TabVisible:= not TabVisible;
    actMarkupVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actTxt2tagsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsTxt2tags do begin
    TabVisible:= not TabVisible;
    actTxt2tagsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actLatexVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsLatex do begin
    TabVisible:= not TabVisible;
    actLatexVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actResultsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsResults do begin
    TabVisible:= not TabVisible;
    actResultsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actIniLogVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsIniLog do begin
    TabVisible:= not TabVisible;
    actIniLogVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actSearchVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsSearch do begin
    TabVisible:= not TabVisible;
    actSearchVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actSpellVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsSpell do begin
    TabVisible:= not TabVisible;
    actSpellVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actDataRcardVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsRcard do begin
    TabVisible:= not TabVisible;
    actDataRcardVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actRExplorerVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsRExplorer do begin
    TabVisible:= not TabVisible;
    actRExplorerVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.pUdatePgFiles;
begin
  if actFilesTabsTop.Checked then begin
    actFilesTabsBottomExecute(nil);
    actFilesTabsTopExecute(nil);
  end
  else if actFilesTabsBottom.Checked then begin
    actFilesTabsTopExecute(nil);
    actFilesTabsBottomExecute(nil);
  end;
end;

procedure TfrmMain.pUpdateBars(bOption: boolean);
begin
  pRToolbar(bOption and actTobRVisible.Checked);
  with ctbMain do begin
    Align  := alTop;
    Visible:= bOption;
  end;
  pUdatePgFiles;
end;

procedure TfrmMain.actShowAllBarsExecute(Sender: TObject);
begin
  with actShowAllBars do begin
    Checked:= not Checked;
    pUpdateBars(Checked)
  end;
end;

procedure TfrmMain.actRContPackagesExecute(Sender: TObject);
begin
  // Don't remove!
end;

procedure TfrmMain.actRContPacAvailableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fCheckConnection then begin
    Windows.Beep(600, 800);
    Exit;
  end;

  sTmp:= 'available.packages()';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacInstallExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fCheckConnection then begin
    Windows.Beep(600, 800);
    Exit;
  end;

  sTmp:= 'install.packages(NULL, ' +
         'lib=' +
         sRLibPathDefault +
         ', ' +
         'dependencies=NA, ' +
         'type=getOption("pkgType")' +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacInstallZipExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= 'install.packages(choose.files("", ' +
         'filters=Filters[c("zip", "All"), ]), ' +
         'lib=' +
         sRLibPathDefault +
         ', ' +
         'repos=NULL, ' +
         'type="binary"' +
         ')';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacInstalledExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= 'installed.packages()';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacLoadExecute(Sender: TObject);
var
  sTmp: string;

begin
(* Don't working inside of Rterm
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE)))' + #13 +
         '  if(nchar(pkg)) library(pkg, character.only=TRUE)})';' +
*)
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE))); if(nchar(pkg)) library(pkg, character.only=TRUE)})';
  pDoSend(sTmp);
end;

// Install TinnRcom from TinnRcom_X.X.X.zip
procedure TfrmMain.actRContPacInstTinnRcomExecute(Sender: TObject);

  function fIsPackageInstalled(sName: string): boolean;
  var
    i,
     j: integer;

  begin
    Result:= False;

    i:= 1;
    repeat
      Sleep(10*iDelay);

      for j:= 0 to (slRLibPaths.Count - 1) do
        if DirectoryExists(slRLibPaths.Strings[j] +
                           sName) then begin
          Result:= True;
          Exit;
        end;

      inc(i);
    until (i = 50);
  end;

  procedure pInstallPackage(var sName: string);
  var
    sDepends,
     sFilePath,
     sToSend: string;

  begin
    sDepends:= fFile_ToString(sUtilsOrigin +
                             '\install.R');

    sDepends:= StringReplace(sDepends,
                             '%path',
                             DosPathToUnixPath(sPath_TinnRcom),
                             []);

    sFilePath:= sPath_Tmp +
                '\install.R';

    if fFile_Save_Fast(sFilePath,
                       sDepends) then sToSend:= 'source(' +
                                             '''' +
                                             DosPathToUnixPath(sFilePath) +
                                             '''' +
                                             ')';

    pDoSend(sToSend);

    stbMain.Panels[8].Text:= 'Please, wait...';
    stbMain.Panels[9].Text:= 'Installing packages: ' +
                             sName;

    Application.ProcessMessages;
  end;

var
  i: integer;

  sToInstall,
   sLatest: string;

  uOption: TModalResult;

  srTmp: TSearchRec;

  bNot: boolean;

const
  sName = '\TinnRcom';

begin
  uOption:= mrNone;

  Screen.Cursor:= crHourglass;

  tRRuning.Enabled:= False;  // It is important!

  bNot:= False;

  // The user can be more than one source of the package.
  // So will install the latest version
  sLatest:= 'TinnRcom_00.00.00.zip';

  try
    // Try to find the source of TinnRcom package
    if FindFirst(sPath_TinnRcom +
                 '\TinnRcom_?.?.??.zip',
                 faAnyFile,
                 srTmp) = 0 then
    begin
      repeat
        if (AnsiCompareStr(srTmp.Name,
                           sLatest) > 0) then sLatest:= srTmp.Name;
      until FindNext(srTmp) <> 0;

      // Must free up resources used by these successful finds
      FindClose(srTmp);
    end;

    if (sLatest = 'TinnRcom_0.0.0.zip') then begin
      fMessageDlg(sPath_TinnRcom + '\' + #13 + #13 +
                  'It was not possible to found a valid version of TinnRcom package in the path above.' + #13 + #13 +
                  'If it was manual (or accidentally) removed, please make a dowload and try it again!',
                  mtError,
                  [mbOk],
                  0);
      bNot:= True;
      Exit;
    end;

    // TinnRcom package
    sToInstall:= DosPathToUnixPath(sPath_TinnRcom +
                                   '\' +
                                   sLatest);

    if not Assigned(slRLibPaths) then begin
      fMessageDlg('The necessary information about ''TinnRcom package'' from R are not available.' + #13 + #13 +
                  'Please, enable it at: ''Options/Application/R/Basic/Get information/TinnRcom (package)''!',
                  mtWarning,
                  [mbOk],
                  0);
      Exit;
    end;

    for i:= 0 to (slRLibPaths.Count - 1) do
      if DirectoryExists(slRLibPaths.Strings[i] +
                         sName) then begin
        if bRTinnRcom_Updating then
          fMessageDlg('Package to install: '+
                       sLatest + #13 + #13 +
                       'Package installed: ' +
                       'TinnRcom' +
                       '_' +
                       sVersion_TinnRcomInstalled + #13 +
                       '(' +
                       slRLibPaths.Strings[i] +
                       sName +
                       ')' + #13 + #13 +
                       'The TinnRcom package will be updated to the latest version!',
                       mtWarning,
                       [mbOK],
                       0)
        else
        uOption:= fMessageDlg('Package to install: '+
                              sLatest + #13 + #13 +
                              'Package installed: ' +
                              'TinnRcom' +
                              '_' +
                              sVersion_TinnRcomInstalled + #13 +
                              '(' +
                              slRLibPaths.Strings[i] +
                              sName +
                              ')' + #13 + #13 +
                              'Do you really want to install/reinstall it?',
                              mtConfirmation,
                              [mbYes, mbNo],
                              1);
          case uOption of
            mrNo: begin
                    bNot:= True;
                    Exit;
                  end;
          end;
      end;

    pInstallPackage(sToInstall);

    bRTinnRcom_Installed:= fIsPackageInstalled(sName);

    if (bRTinnRcom_Installed) then begin
      Sleep(5*iDelay);  // R is not fast to install TinnRcom package

      stbMain.Panels[8].Text:= 'Done!';
      stbMain.Panels[9].Text:= 'Installed package: TinnRcom';

      bRTinnRcom_Updating:= False;
      Application.ProcessMessages;
    end
    else begin
      stbMain.Panels[8].Text:= 'Error!';
      stbMain.Panels[9].Text:= 'Not installed package: TinnRcom';

      Application.ProcessMessages;
    end;
  finally
    tRRuning.Enabled:= True;

    if (not bNot) then
      if bRTinnRcom_Installed then pR_Info;

    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
  end;
end;

procedure TfrmMain.actRContPacLoadTinnRcomExecute(Sender: TObject);
var
  sTmp: string;

begin
  Screen.Cursor:= crHourglass;
  sTmp:= 'library(TinnRcom)';
  pDoSend(sTmp);
  Sleep(10*iDelay);
  bRTinnRcom_Loaded:= True;
  Screen.Cursor:= crDefault;
end;

procedure TfrmMain.actRContPacNewExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fCheckConnection then begin
    Windows.Beep(600, 800);
    Exit;
  end;

  sTmp:= 'new.packages()';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacRemoveExecute(Sender: TObject);
var
  sTmp: string;

begin
(*  Don't working inside of Rterm
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE)))' + #13 +
         '  if(nchar(pkg)) remove.packages(pkg)})';
*)
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE))); if(nchar(pkg)) remove.packages(pkg)})';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacStatusExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not fCheckConnection then begin
    Windows.Beep(600, 800);
    Exit;
  end;

  sTmp:= 'packageStatus()';
  pDoSend(sTmp);
end;

procedure TfrmMain.actRContPacUpdateExecute(Sender: TObject);
var
  sTmp: string;

begin
  // sTmp:= 'update.packages(ask=''graphics'')';
  if not fCheckConnection then begin
    Windows.Beep(600, 800);
    Exit;
  end;

  sTmp:= 'update.packages(checkBuilt=TRUE, ask=FALSE, instlib=' +
         sRLibPathDefault
         + ')';

  pDoSend(sTmp);
end;

function TfrmMain.fActivePanel: integer;
var
  x,
   i: integer;

  mpt: TPoint;

begin
  Result:= -1;
  mpt:= Mouse.CursorPos;             // mouse position in screen coordinates
  mpt:= stbMain.ScreenToClient(mpt); // mouse position in StatusBar coordinates

  x:= 0;

  for i:= 0 to (stbMain.Panels.Count - 1) do
  begin
    x:= x + stbMain.Panels[i].Width;
    if (mpt.X < x) then
    begin
      Result:= i;
      Break;
    end;
  end;
end;

procedure TfrmMain.stbMainClick(Sender: TObject);

  function fOpenedFile: boolean;
  begin
    Result:= True;
    if ((Self.MDIChildren[fFindTopWindow] as TfrmEditor) = nil) then Result:= False;
  end;

begin
  case fActivePanel of
     2: begin
          if fOpenedFile then actGotoLineExecute(nil);
        end;

     3: begin
          if fOpenedFile then actReadOnlyExecute(nil);
        end;

     4: begin
          if fOpenedFile then begin
            with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
              if actNormalSelect.Checked      then actLineSelectExecute(nil)
              else if actLineSelect.Checked   then actColumnSelectExecute(nil)
              else if actColumnSelect.Checked then actNormalSelectExecute(nil)
            end;
          end;
        end;

     6: begin
          bTinnRHotKeys:= not bTinnRHotKeys;
          with frmHotkeys do
            pSetHotkeys(bTinnRHotKeys);
        end;

     7: begin
          bRtermSend_Plus:= not bRtermSend_Plus;
          pDraw_RtermSend_Plus;
        end;

     9: actRtermWarningErrorExecute(nil);
  end;
end;

procedure TfrmMain.stbMainDrawPanel(StatusBar: TStatusBar;
                                    Panel: TStatusPanel;
                                    const Rect: TRect);
var
  cTmp: Tcolor;
  //cBrush: Tcolor;

  i: integer; 

begin
  if bTinnRHotKeys then cTmp:= clGreen
                   else cTmp:= clGray;

  //cBrush:= StatusBar.Color;

  with StatusBar.Canvas do begin
       case Panel.Index of
         0: begin
              Font.Color := clMaroon;
              //Font.Style := [fsBold];
            end;
         1: begin
              Font.Color := clMaroon;
              //Font.Style := [fsBold];
            end;
         4: begin
              i:= fFindTopWindow;
              if Assigned(Self.MDIChildren[i] as TfrmEditor) then
                with (Self.MDIChildren[i] as TfrmEditor) do begin
                  case synEDitor.SelectionMode of
                    smNormal: pDrawSelectionMode(0);
                    smLine  : pDrawSelectionMode(1);
                    smColumn: pDrawSelectionMode(2);
                  end;
                end;
            end;
         6: begin
              Font.Color := cTmp;
              //Font.Style := [fsBold];
            end;
         7: begin
              pDraw_RtermSend_Plus;
            end;
         8: begin
              Font.Color := clBlack;
              //Font.Style := [fsItalic];
            end;
         9: begin
              Font.Color := clNavy;
              //Font.Style := [fsItalic];
            end;
       end;
       {
       // Panel background color
       FillRect(Rect) ;
       }

       {
       // Panel Text
       TextRect(Rect,
                2 + imlSearch.Width + Rect.Left,
                2 + Rect.Top,
                Panel.Text);
       }

       TextOut(Rect.left + 2,
               Rect.top + 1,
               Panel.Text);
  end;

//  //from: http://docwiki.embarcadero.com/CodeExamples/Tokyo/en/OnDrawPanel_(Delphi)
//  with StatusBar.Canvas do
//    begin
//      Brush.Color := clRed;
//      FillRect(Rect);
//      Font.Color := clYellow;
//      imlRexplorer.Draw(StatusBar.Canvas, Rect.Left, Rect.Top, Panel.Index);
//      TextOut(Rect.left + 30, Rect.top + 2, 'p ' + IntToStr(Panel.Index));
//    end;
end;

// Adapted from: http://www.delphigroups.info/2/2d/472575.html
procedure TfrmMain.stbMainMouseMove(Sender: TObject;
                                    Shift: TShiftState;
                                    X,
                                     Y: Integer);
var
  i,
   j: integer;

  sTmp,
   sPre: string;

  stbTmp: TStatusbar;

begin
  j:= 0;
  sTmp:= '';
  sPre:= '';
  stbTmp:= Sender as TStatusbar;

  for i:= 0 to (stbTmp.Panels.Count - 1) do begin
    if (i = stbTmp.Panels.Count - 1) then
      j:= stbTmp.ClientWidth
    else
      j:= (j + stbTmp.Panels[i].Width);
    if (X <= j) then begin
      case i of
        0: sPre:= 'Encoding: ';
        1: sPre:= 'Line ending: ';
        2: sPre:= 'Lin (Cur/Tot) - Col: ';
        3: sPre:= 'File status: ';
        4: sPre:= 'Editor: sel. mode';
        5: sPre:= 'File size: ';
        6: sPre:= 'Hotkeys status: ';
        7: sPre:= 'Rterm: send lines cont. (partial instructions)';
      end;
      sTmp:= sPre +
             stbTmp.Panels[i].Text;  // here you would set the hint for the panel
      Break;
    end; {if}
  end; {for}

  if (sTmp <> stbTmp.Hint) then begin
    stbTmp.Hint:= sTmp;
    Application.CancelHint;  // makes sure new hint shows if user moves mouse inside statusbar
  end; {if}
end;

procedure TfrmMain.pUpdateCloseFileOptions;
begin
  if (pgFiles.PageCount > 1) then begin
    if (pgFiles.ActivePageIndex = 0) then begin // First
      actFileCloseAll.Enabled   := True;
      actFileCloseOthers.Enabled:= True;
      actFileCloseLeft.Enabled  := False;
      actFileCloseRight.Enabled := True;
    end
    else
      if (pgFiles.ActivePageIndex = (pgFiles.PageCount - 1)) then begin  // Last
        actFileCloseAll.Enabled   := True;
        actFileCloseOthers.Enabled:= True;
        actFileCloseLeft.Enabled  := True;
        actFileCloseRight.Enabled := False;
      end
      else begin  // Among
        actFileCloseAll.Enabled   := True;
        actFileCloseOthers.Enabled:= True;
        actFileCloseLeft.Enabled  := True;
        actFileCloseRight.Enabled := True;
      end;
  end
  else begin  // < 1
    actFileCloseAll.Enabled   := False;
    actFileCloseOthers.Enabled:= False;
    actFileCloseLeft.Enabled  := False;
    actFileCloseRight.Enabled := False;
    actFileSaveAll.Enabled    := False;
  end;
end;

procedure TfrmMain.pInsertLatexSymbol(sSymbol: string;
                                          iCaretControl: integer);
var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then SelText:= sSymbol
                else SelText:= sSymbol;

  with seEditor do
    CaretX:= CaretX + iCaretControl;

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

function TfrmMain.fRterm_Running: boolean;
begin

  Result:= False;

  if Assigned(frmRterm) then
    with frmRterm do
      Result:= bRterm_Running;

  with actRguiReturnFocus do
    if Result then Enabled:= False
              else Enabled:= True
end;

function TfrmMain.fRgui_Running(bFirstTime: boolean = False): boolean;
begin
  Result:= fIsGuiRunning(hRgui,
                         sGuiRRunning,
                         iRecognition_Caption,
                         bFirstTime);

  if Result then begin
    fCodeSender.pGuiHandle  := hRgui;
    fCodeSender.pGuiCaption:= sGuiRRunning;
  end;
end;

procedure TfrmMain.LatexAccents(Sender: TObject;
                                    Button: TMouseButton;
                                    Shift: TShiftState;
                                    X,
                                    Y: Integer);
var
  i: integer;

  seEditor: TSynEdit;

  sAccent: string;

  procedure pSetEditor;
  begin
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
  end;

  procedure pInsertAccentSimple;
  begin
    with seEditor do begin
      SelText:= sAccent;
      ExecuteCommand(ecLineEnd,
                     #0,
                     nil);
      CaretX := CaretX - 1;
    end;
  end;

  procedure pInsertAccent;
  var
    sPrior: string;

  begin
    with seEditor do begin
      if SelAvail then begin
        sPrior := SelText;
        SelText:= sAccent;
        CaretX := CaretX - 1;
        SelText:= sPrior;
        CaretX := CaretX + 1;
      end
      else pInsertAccentSimple;
    end;

    PostMessage(TWinControl(Self.MDIChildren[fFindTopWindow] as TfrmEditor).Handle,
                WM_SETFOCUS,
                0,
                0);
  end;

  procedure pFormatAccent;
  var
    ipos: integer;

  begin
    sAccent:= ChangeFileExt(sAccent,
                            EmptyStr);
    
    iPos   := Pos('_',
                  sAccent);
    
    sAccent:= Copy(sAccent,
                   iPos + 1,
                   length(sAccent));
    
    sAccent:= '\' + sAccent + '{}';
  end;

begin
  if ((Self.MDIChildren[fFindTopWindow] as TfrmEditor) = nil) then Exit;
  
  pSetEditor;
  
  with Sender as TJvImagesViewer do begin
    i:= SelectedIndex;
    if (i < 0) then Exit;
    sAccent:= ExtractFileName(Items[i].FileName);
    pFormatAccent;
    pInsertAccent;
  end;
end;

procedure TfrmMain.actLatexDimensionalExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  bcCurPos: TBufferCoord;

  dlg: TfrmLatexDimensional;

  sTmp: string;

  function fMakeContent(sType: string): string;
  var
    i,
     j: integer;

    sResult,
     sLine,
     sCab,
     sPrior,
     sFill: string;

  begin
    case fStringToCase_Select(sType,
                              ['Array',
                               'Matrix',
                               'Tabular',
                               'Tabbing']) of
      0: begin // Array
           sPrior:= ' ';
           sFill := ' | &';
         end;

      1: begin // Matrix
           sPrior:= '   ';
           sFill := ' | &';
         end;

      2: begin // Tabular
           sPrior:= ' ';
           sFill := ' | &';
         end;

      3: begin // Tabbing
           sPrior:= ' ';
           sCab  := ' | \=';
           sFill := ' | \>';

           i:= 0;
           repeat
             sLine:= sLine + sCab;
             inc(i);
           until(i = iCols - 1);
           sResult:= sPrior + sLine + ' | \kill' + #13;
         end;
    end;

    i:= 0;
    j:= 0;
    sLine:= EmptyStr;

    repeat
      if (iCols > 1) then begin
        repeat
          sLine:= sLine + sFill;
          inc(j);
        until(j = iCols - 1);
        sLine:= sPrior + sLine + ' | \\' + #13;
      end
      else sLine:= '  | \\' + #13;
      sResult:= sResult + sLine;
      sLine  := EmptyStr;
      inc(i);
      j:= 0;
    until(i = iRows);

    Result:= (sResult);
  end;

  function fMakeFormat(sTmp: string): string;
  var
    sResult: string;

  begin
    repeat
      sResult:= sResult + sTmp;
    until (length(sResult) = iCols);
    Result:= (sResult);
  end;

  procedure pMakeDimensional(sType: string;
                             iR,
                             iC,
                             iAlign: integer);
  var
    sAlign: string;

  begin
    case iAlign of
      0: sAlign:= 'l';
      1: sAlign:= 'c';
      2: sAlign:= 'r';
    end;

    case fStringToCase_Select(sType,
                              ['Array',
                               'Matrix',
                               'Tabular',
                               'Tabbing']) of
      0: begin // Array
           sTmp:=
             '\begin{array}{' + fMakeFormat(sAlign) + '}'  + #13 +
             fMakeContent(sType)                           +
             '\end{array}';
         end;
      1: begin // Matrix
           sTmp:=
             '\left('                                        + #13 +
             '  \begin{array}{' + fMakeFormat(sAlign) + '}'  + #13 +
             fMakeContent(sType)                             +
             '  \end{array}'                                 + #13 +
             '\right)';
         end;
      2: begin // Tabular
           sTmp:=
             '\begin{tabular}{' + fMakeFormat(sAlign) + '}'  + #13 +
             '  \hline'                                      + #13 +
             fMakeContent(sType)                             +
             '  \hline'                                      + #13 +
             '\end{tabular}';
         end;
      3: begin // Tabbing
           sTmp:=
             '\begin{tabbing}'   + #13 +
             fMakeContent(sType)  +
             '\end{tabbing}';
         end;
    end;
  end;

begin
  if not fSave_PriorClipboard_Text then Exit;

  if ((Self.MDIChildren[fFindTopWindow] as TfrmEditor) = nil) then Exit;

  dlg:= TfrmLatexDimensional.Create(Self);

  with dlg do begin
    rdgType.ItemIndex:= iLatexDimensionalElement;
    if (iLatexDimensionalElement = 3) then begin
      with rdgAlign do begin
        Enabled  := False;
        ItemIndex:= -1;
      end;
    end
    else begin
      with rdgAlign do begin
        Enabled:= True;
        if (iLatexDimensionalAlign < 0) then ItemIndex:= 1
                                        else ItemIndex:= iLatexDimensionalAlign;
      end;
    end;
    edRows.Text:= IntToStr(iRows);
    edCols.Text:= IntToStr(iCols);
  end;

  try
    if (dlg.ShowModal <> mrOk) then Exit;

    iRows:= StrToInt(dlg.edRows.Text);
    iCols:= StrToInt(dlg.edCols.Text);

    if (iRows <= 0) or
       (iCols <= 0) then Exit;

    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;

    with seEditor do
      bcCurPos:= BlockBegin;

    iLatexDimensionalAlign  := dlg.rdgAlign.ItemIndex;
    iLatexDimensionalElement:= dlg.rdgType.ItemIndex;

    case iLatexDimensionalElement of
      0: begin // Array
           pMakeDimensional('Array',
                            iRows,
                            iCols,
                            iLatexDimensionalAlign);

           pInsertText_Smart(seEditor,
                             stmp,
                             0);
         end;

      1: begin // Matrix
           pMakeDimensional('Matrix',
                            iRows,
                            iCols,
                            iLatexDimensionalAlign);

           pInsertText_Smart(seEditor,
                             stmp,
                             0);
         end;

      2: begin  // Tabular
           pMakeDimensional('Tabular',
                            iRows,
                            iCols,
                            iLatexDimensionalAlign);

           pInsertText_Smart(seEditor,
                             stmp,
                             0);
         end;

      3: begin  // Tabbing
           pMakeDimensional('Tabbing',
                            iRows,
                            iCols,
                            iLatexDimensionalAlign);

           pInsertText_Smart(seEditor,
                             stmp,
                             0);
         end;
    end;
  finally
    FreeAndNil(dlg);
  end;

  with seEditor do
    CaretXY:= bcCurPos;

  // Will search the next '|' as part of the stop of the completion
  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
    sSearchText:= '|';

    bSearchRegExp:= False;  // Do not remove due to '|' -> or in fRegEx

    pDoSearchReplaceText(False,
                         True,
                         False);

    pEnableSave;
  end;
end;

procedure TfrmMain.actLatexMakeIndexExecute(Sender: TObject);
var
  i,
   iPos: integer;

  oldCursor: TCursor;

  sTmpFile,
   sTmpDir: string;

  wOption: word;

begin
  i:= fFindTopWindow;
  sTmpFile:= ExtractFileName((Self.MDIChildren[i] as TfrmEditor).sActiveFile);;

  if (LowerCase(ExtractFileExt(sTmpFile)) <> '.tex') then Exit;

  iPos:= Pos('.',
             sTmpFile);

  sTmpFile:= Copy(sTmpFile,
                  0,
                  iPos-1);
                  
  oldCursor:= (Self.MDIChildren[i] as TfrmEditor).Cursor;

  (Self.MDIChildren[i] as TfrmEditor).Cursor:= crHourGlass;

  actFileSaveExecute(Self);
  sTmpDir:= ExtractFilePath((Self.MDIChildren[i] as TfrmEditor).sActiveFile);

  try
    SetCurrentDir(sTmpDir);

    if actDosMinimizedAlways.Checked then wOption:= SW_SHOWMINIMIZED
                                     else wOption:= SW_RESTORE;

    fExecCmdLine_Wait('makeindex ' +
                      sTmpFile,
                      wOption)
  finally
    (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
  end;
end;

procedure TfrmMain.LatexHeader(Sender: TObject);

  procedure pInsertLatex(iHeader: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sHeader: string;

    i: integer;

  begin
    i:= fFindTopWindow;
    if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

    case iHeader of
      0: sHeader:= '\part{}';
      1: sHeader:= '\chapter{}';
      2: sHeader:= '\section{}';
      3: sHeader:= '\subsection{}';
      4: sHeader:= '\subsubsection{}';
      5: sHeader:= '\paragraph{}';
      6: sHeader:= '\subparagraph{}';
    end;

    with (Self.MDIChildren[i] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
    with seEditor do begin
      if SelAvail then begin
        sPrior:= SelText;
        SelText:= sHeader;
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
        CaretX := CaretX - 1;
        SelText:= sPrior;
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
      end
      else begin
        SelText:= sHeader;
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
        CaretX := CaretX - 1;
      end;
    end;
  end;

begin
  with Sender as TAction do
    pInsertLatex(Tag);
end;


procedure TfrmMain.LatexFont(Sender: TObject);

  procedure pInsertLatex(iFont: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sFont: string;

    i: integer;

  begin
    i:= fFindTopWindow;
    if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

    case iFont of
       0: sFont:= '\emph{}';
       1: sFont:= '\textbf{}';
       2: sFont:= '\textit{}';
       3: sFont:= '\textsl{}';
       4: sFont:= '\texttt{}';
       5: sFont:= '\textsc{}';
    end;

    with (Self.MDIChildren[i] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
    with seEditor do begin
      if SelAvail then begin
        sPrior := SelText;
        SelText:= sFont;
        CaretX := CaretX - 1;
        SelText:= sPrior;
        CaretX := CaretX + 1;
      end
      else begin
        SelText:= sFont;
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
        CaretX := CaretX - 1;
      end;
    end;

    PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
                WM_SETFOCUS,
                0,
                0);
  end;

begin
  with Sender as TAction do
    pInsertLatex(Tag);
end;

procedure TfrmMain.LatexFontSize(Sender: TObject);

  procedure pInsertLatex(iSize: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sSize: string;

    i: integer;

  begin
    i:= fFindTopWindow;
    if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

    case iSize of
      0: sSize:= '{\tiny {}}';
      1: sSize:= '{\scriptsize {}}';
      2: sSize:= '{\footnotesize {}}';
      3: sSize:= '{\small {}}';
      4: sSize:= '{\normalsize {}}';
      5: sSize:= '{\large {}}';
      6: sSize:= '{\Large {}}';
      7: sSize:= '{\LARGE {}}';
      8: sSize:= '{\huge {}}';
      9: sSize:= '{\Huge {}}';
    end;

    with (Self.MDIChildren[i] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
    with seEditor do begin
      if SelAvail then begin
        sPrior := SelText;
        SelText:= sSize;
        CaretX := CaretX - 2;
        SelText:= sPrior;
        CaretX := CaretX + 2;
      end
      else begin
        SelText:= sSize;
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
        CaretX := CaretX - 2;
      end;
    end;

    PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
                WM_SETFOCUS,
                0,
                0);
  end;

begin
  with Sender as TAction do
    pInsertLatex(Tag);
end;

procedure TfrmMain.LatexFormat(Sender: TObject);

  function fMakeContent(sType,
                        sPrior: string;
                        iTabWidth: integer): string;
  var
    sTmp,
     sTab: string;

    function fFormatPrior(sPrior,
                          sReplace: string): string;
    begin
      sTmp:= sReplace + StringReplace(sPrior,
                                      #13#10,
                                      #13#10 + sReplace,
                                      [rfReplaceAll, rfIgnoreCase]);
      Result:= sTmp + #13;
    end;

  begin
    repeat
      sTab:= sTab +
             ' ';
    until(length(sTab) = iTabWidth);

    case fStringToCase_Select(sType,
                              ['Itemization',
                               'Enumeration',
                               'Left',
                               'Center',
                               'Right']) of
      0: begin // Itemization
           if (sPrior = EmptyStr) then Result:= sTab +
                                                '\item |' + #13#10
                                  else Result:= fFormatPrior(sPrior,
                                                             sTab +
                                                            '\item ');
         end;
      1: begin // Enumeration
           if (sPrior = EmptyStr) then Result:= sTab +
                                                '\item |' + #13
                                  else Result:= fFormatPrior(sPrior,
                                                             sTab +
                                                             '\item ');
         end;
      2: begin // Left
           if (sPrior = EmptyStr) then Result:= sTab + #13
                                  else Result:= fFormatPrior(sPrior,
                                                             sTab);
         end;
      3: begin // Center
           if (sPrior = EmptyStr) then Result:= sTab + #13
                                  else Result:= fFormatPrior(sPrior,
                                                             sTab);
         end;
      4: begin // Right
           if (sPrior = EmptyStr) then Result:= sTab + #13
                                  else Result:= fFormatPrior(sPrior,
                                                             sTab);
         end;
    end;
  end;

  function fMakeType(sType,
                     sPrior: string;
                     iTabWidth: integer): string;
  begin
    case fStringToCase_Select(sType,
                              ['Itemization',
                               'Enumeration',
                               'Left',
                               'Center',
                               'Right']) of
      0: begin // Itemization
           Result:=
             '\begin{itemize}' + #13 +
             fMakeContent(sType,
                          sPrior,
                          iTabWidth) +
             '\end{itemize}';
         end;
      1: begin // Enumeration
           Result:=
             '\begin{enumerate}' + #13 +
             fMakeContent(sType,
                          sPrior,
                          iTabWidth) +
             '\end{enumerate}';
         end;
      2: begin // Left
           Result:=
             '\begin{flushleft}' + #13 +
             fMakeContent(sType,
                          sPrior,
                          iTabWidth) +
             '\end{flushleft}';
         end;
      3: begin // Center
           Result:=
             '\begin{center}' + #13 +
             fMakeContent(sType,
                          sPrior,
                          iTabWidth) +
             '\end{center}';
         end;
      4: begin // Right
           Result:=
             '\begin{flushright}' + #13 +
             fMakeContent(sType,
                          sPrior,
                          iTabWidth) +
             '\end{flushright}';
         end;
    end;
  end;

  procedure pInsertLatex(iType: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sType: string;

    i,
      iTabWidth: integer;

    synSearchOptions: TSynSearchOptions;

  begin
    i:= fFindTopWindow;

    if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

    case iType of
      0: sType:= 'Itemization';
      1: sType:= 'Enumeration';
      2: sType:= 'Left';
      3: sType:= 'Center';
      4: sType:= 'Right';
    end;

    with (Self.MDIChildren[i] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
    with seEditor do begin
      iTabWidth:= TabWidth;
      if SelAvail then begin
        sPrior   := SelText;
        SelText  := fMakeType(sType,
                              sPrior,
                              iTabWidth);
      end
      else begin
        SelText:= fMakeType(sType,
                            EmptyStr,
                            iTabWidth);
        CaretY := CaretY - 1;
        ExecuteCommand(ecLineStart,
                       #0,
                       nil);
        SearchEngine    := SynEditSearch;
        synSearchOptions:= [];
        SearchReplace('|',
                      EmptyStr,
                      synSearchOptions);
      end;
    end;

    PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
                WM_SETFOCUS,
                0,
                0);
  end;

begin
  with Sender as TAction do
    pInsertLatex(Tag);
end;

procedure TfrmMain.actCountExecute(Sender: TObject);

  function fStripSpaces(s: string): string;
  var
    i,
     j,
     l: integer;

  begin
    i:= 1;
    j:= 1;
    l:= length(s);

    SetLength(Result,
              l);
    repeat
      if (s[i] > #32) then begin
        Result[j]:= s[i];
        inc(j);
      end;
      inc(i);
    until(i = l + 1);
    SetLength(Result,
              j - 1);
  end;

  function fSeps(cTmp: Char): Boolean;
  begin
    Result:= cTmp in [#0..#$1F,
                      ' ',
                      '.',
                      ',',
                      '?',
                      ':',
                      ';',
                      '(',
                      ')',
                      '/',
                      '\'];
  end;

  function fWordsCount(sTmp: string): longint;
  var
    i,
     iCount: longint;

  begin
    i     := 1;
    iCount:= 0;

    while (i <= length(sTmp)) do begin
      while (i <= length(sTmp)) and
            fSeps(sTmp[i]) do inc(i);

      if (i <= length(sTmp)) then begin
        inc(iCount);
        while (i <= length(sTmp)) and
              (not fSeps(sTmp[i])) do inc(i);
      end;
    end;

    Result:= iCount;
  end;

var
  seEditor: TSynEdit;

  sTmp: string;

  dlg: TfrmCount;

  iChars,
   iCharsStripSpaces: integer;

  dWords,
   dChars,
   dCharsStripSpaces: double;

begin
  if ((Self.MDIChildren[fFindTopWindow] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then sTmp:= SelText
                else sTmp:= Text;

  dlg:= TfrmCount.Create(Self);

  with dlg do begin
    iChars:= length(sTmp);

    if (sTmp <> EmptyStr) then iCharsStripSpaces:= length(fStripSpaces(sTmp))
                          else iCharsStripSpaces:= 0;

    dWords:= fWordsCount(sTmp);
    dChars:= iChars;
    dCharsStripSpaces:= iCharsStripSpaces;

    with seEditor do
      if not SelAvail then rdgCount.ItemIndex:= 0
                      else rdgCount.ItemIndex:= 1;

    with strGrid do begin
       Cells[0,0]:= 'Words';
       Cells[0,1]:= 'Characters (+ spaces)';
       Cells[0,2]:= 'Characters (- spaces)';
       Cells[0,3]:= 'Spaces';

       Cells[1,0]:= FloatToStrF(dWords,
                                ffNumber,
                                9,
                                0);
       Cells[1,1]:= FloatToStrF(dChars,
                                ffNumber,
                                9,
                                0);
       Cells[1,2]:= FloatToStrF(dCharsStripSpaces,
                                ffNumber,
                                9,
                                0);
       Cells[1,3]:= FloatToStrF((dChars - dCharsStripSpaces),
                                ffNumber,
                                9,
                                0);
    end;
  end;

  try
    if (dlg.ShowModal <> mrOk) then Exit;
  finally
    FreeAndNil(dlg);
  end;
end;

procedure TfrmMain.actReloadLatexSymbolsExecute(Sender: TObject);
begin
  pCheckLatex(True);
end;

procedure TfrmMain.pInsertLatexMath(sFunction: string;
                                        iCaretControl: integer);
var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  with seEditor do
    if SelAvail then SelText:= sFunction
                else SelText:= sFunction;

  with seEditor do
    CaretX:= CaretX + iCaretControl;

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.actLatexAlgebricFracExecute(Sender: TObject);

  function fCountStrings(sTmp: string): integer;
  var
    slTmp: TStringList;

  begin
    try
      slTmp:= TStringList.Create;
      pString_Split(' ',
                    sTmp,
                    slTmp);
    finally
      Result:= slTmp.Count;
      FreeAndNil(slTmp);
    end;
  end;

  function fFormatFrac(sTmp: string): string;
  var
    slTmp: TStringList;

    sArg1,
     sArg2: string;

  begin
    try
      slTmp:= TStringList.Create;
      
      pString_Split(' ',
                    sTmp,
                    slTmp);
      
      if (slTmp.Count >= 2) then begin
        sArg1:= slTmp[0];
        sArg2:= slTmp[1];
      end;
    finally
      FreeAndNil(slTmp);
      
      Result:= '{' +
               sArg1 +
               '}' +
               '{' +
               sArg2 +
               '}';
    end;
  end;

var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then begin
      if (fCountStrings(SelText) = 2) then
        pInsertLatexMath('\frac' +
                         fFormatFrac(SelText),
                         0)
      else
        pInsertLatexMath('\frac' +
                         fFormatFrac(SelText),
                         -3);
    end
    else
      pInsertLatexMath('\frac' +
                       fFormatFrac(EmptyStr),
                       -3);
end;

procedure TfrmMain.actLatexAlgebricSqrtExecute(Sender: TObject);

  function fFormatSqrt(sTmp: string): string;
  begin
    Result:= '{' +
             sTmp +
             '}';
  end;

var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then
      pInsertLatexMath('\sqrt' +
                       fFormatSqrt(SelText),
                       0)
    else
      pInsertLatexMath('\sqrt' +
                       fFormatSqrt(EmptyStr),
                       -1);
end;

procedure TfrmMain.actLatexAlgebricSqrtNExecute(Sender: TObject);

  function fCountStrings(sTmp: string): integer;
  var
    slTmp: TStringList;

  begin
    try
      slTmp:= TStringList.Create;
      pString_Split(' ',
                    sTmp,
                    slTmp);
    finally
      Result:= slTmp.Count;
      FreeAndNil(slTmp);
    end;
  end;

  function fFormatSqrtN(sTmp: string): string;
  var
    slTmp: TStringList;

    sArg1,
     sArg2: string;

  begin
    try
      slTmp:= TStringList.Create;
      
      pString_Split(' ',
                    sTmp,
                    slTmp);
      
      if (slTmp.Count >= 2) then begin
        sArg1:= slTmp[0];
        sArg2:= slTmp[1];
      end;
    finally
      FreeAndNil(slTmp);
      
      Result:= '[' +
               sArg1 +
               ']' +
               '{' +
               sArg2 +
               '}';
    end;
  end;

var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then begin
      if (fCountStrings(SelText) = 2) then
        pInsertLatexMath('\sqrt' +
                         fFormatSqrtN(SelText),
                         0)
      else
        pInsertLatexMath('\sqrt' +
                         fFormatSqrtN(SelText),
                         -3);
    end
    else
      pInsertLatexMath('\sqrt' +
                       fFormatSqrtN(EmptyStr),
                       -3);
end;

procedure TfrmMain.actRContTermStartCloseExecute(Sender: TObject);

  procedure pCloseRterm;
  begin
    if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Clear
                                  else frmRterm.synLog.Clear;

    stbMain.Panels[9].Text:= EmptyStr;

    with actRtermWarningError do begin
      Visible:= False;
      Checked:= False;
    end;

    frmRterm.cRterm.StopProcess;
    if Assigned(R_Useful) then R_Useful.Free;

    frmRterm.bRterm_Plus:= False;
    bRRequireKnitr:= False;
  end;

var
  sTmp: string;

  userOption: TModalResult;
begin
  if not fRterm_Running then begin
    // Will check the path of Rterm executable
    if (sPath_Rterm = EmptyStr) then begin
      fMessageDlg('The preferred Rterm was not defined!' + #13#10 +
                  #13#10 +
                  'Please, set Rterm path at: Options/Application/R/.',
                   mtWarning,
                   [mbOK],
                   0);
      Exit;
    end;

    if not FileExists(sPath_Rterm) or
       (ExtractFileExt(sPath_Rterm) <> '.exe') then begin
      sTmp:= sPath_Rterm;

      if (sTmp = EmptyStr) then sTmp:= 'Empty';

      fMessageDlg(sTmp + #13 + #13 +
                  'The file above is not executable!' + #13#10 +
                  #13#10 +
                  'Please, set Rterm path at: Options/Application/R/.',
                  mtError,
                  [mbOk],
                  0);
      Exit;
    end;

// Trying to solve focus in SynIO whem Auto Hide is On
//    if (pgFiles.PageCount <= 0) then begin
//      ShowDockForm(frmRterm);
//      Application.ProcessMessages;
//      Sleep(1000);
//    end;

    // Will open preferred Rterm
    pSetRLibrary_Path(sPath_Rterm);
    pCheckRterm;

    if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Clear
                                  else frmRterm.synLog.Clear;

    with frmRterm do begin
      synIO.Clear;

      iSynWithFocus:= 3;

      cRterm.RunProcess(sPath_Rterm +
                        ' ' +
                        sParRterm,
                        fRWorkDir);

      //R_Useful:= TR_Useful.Create;
    end;

    bRRequireKnitr:= True;
  end
  else begin
    pCheckRterm;

    if bRtermCloseWithoutAsk then
      pCloseRterm
    else begin
      userOption:= fMessageDlg('Save workspace image (Rhistory and Rdata)' + #13 +
                               'in the current R work directory?',
                               mtConfirmation,
                               [mbYes, mbNo, mbCancel],
                               0);

      case userOption of
        mrYes: begin
                 with frmRterm.synIO do begin
                   sTmp:= 'save.image()';
                   pDoSend(sTmp);
                 end;
                 pCloseRterm;
               end;

        mrNo: pCloseRterm;

        mrCancel: begin
                    bRtermOptionCancel:= True;
                    Exit;
                  end;
      end;
    end;
  end;
end;

procedure TfrmMain.pSetInterfaceSize(frm: TForm;
                                         iSize: integer);
begin
  with JvDockServer do begin
    with LeftDockPanel do  // Left
      if ContainsControl(frm) then begin
        Width:= iSize;
        Exit;
      end;
    with TopDockPanel do  // Top
      if ContainsControl(frm) then begin
        Height:= iSize;
        Exit;
      end;
    with RightDockPanel do // Right
      if ContainsControl(frm) then begin
        Width:= iSize;
        Exit;
      end;
    with BottomDockPanel do // Bottom
      if ContainsControl(frm) then begin
        Height:= iSize;
        Exit;
      end;
  end;
end;

procedure TfrmMain.actRtermMaximizeExecute(Sender: TObject);
const
  iW = 13;   // experimental
  iH = 143;

begin
  if not GetFormVisible(frmRterm) then Exit;

  if GetFormVisible(frmTools) then HideDockForm(frmTools);
  actToolsVisible.Checked:= GetFormVisible(frmTools);

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmRterm)   then pSetInterfaceSize(frmRterm, frmMain.Width  - iW)  // Left
    else if TopDockPanel.ContainsControl(frmRterm)    then pSetInterfaceSize(frmRterm, frmMain.Height - iH)  // Top
    else if RightDockPanel.ContainsControl(frmRterm)  then pSetInterfaceSize(frmRterm, frmMain.Width  - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then pSetInterfaceSize(frmRterm, frmMain.Height - iH); // Bottom

  pSetFocus_Main;
end;

procedure TfrmMain.actRtermAutoHideExecute(Sender: TObject);
begin
  if not actRtermVisible.Checked then Exit;  // Nothing to do

  if frmRterm.CanFocus then begin  // Toogles to auto hide on
    with JvDockServer do
      if      LeftDockPanel.ContainsControl(frmRterm)   then TJvDockVSNETPanel(JvDockServer.LeftDockPanel).DoAutoHideControl(frmRterm)    // Left
      else if TopDockPanel.ContainsControl(frmRterm)    then TJvDockVSNETPanel(JvDockServer.TopDockPanel).DoAutoHideControl(frmRterm)     // Top
      else if RightDockPanel.ContainsControl(frmRterm)  then TJvDockVSNETPanel(JvDockServer.RightDockPanel).DoAutoHideControl(frmRterm)   // Right
      else if BottomDockPanel.ContainsControl(frmRterm) then TJvDockVSNETPanel(JvDockServer.BottomDockPanel).DoAutoHideControl(frmRterm); // Bottom
  end
  else  // Toogles to auto hide off
    JvDockVSNetStyle.DoUnAutoHideDockForm(frmRterm);
end;

procedure TfrmMain.actRtermDivideExecute(Sender: TObject);
const
  iW = 20;   // experimental
  iH = 74;

begin
  if not GetFormVisible(frmRterm) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmRterm)   then pSetInterfaceSize(frmRterm, frmMain.Width  div 2 - iW)  // Left
    else if TopDockPanel.ContainsControl(frmRterm)    then pSetInterfaceSize(frmRterm, frmMain.Height div 2 - iH)  // Top
    else if RightDockPanel.ContainsControl(frmRterm)  then pSetInterfaceSize(frmRterm, frmMain.Width  div 2 - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then pSetInterfaceSize(frmRterm, frmMain.Height div 2 - iH); // Bottom

  pSetFocus_Main;
end;

procedure TfrmMain.actRtermMinimizeExecute(Sender: TObject);
const
  iK = 20;

begin
  if not GetFormVisible(frmRterm) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmRterm)   then pSetInterfaceSize(frmRterm, frmMain.Width  div iK)  // Left
    else if TopDockPanel.ContainsControl(frmRterm)    then pSetInterfaceSize(frmRterm, frmMain.Height div iK)  // Top
    else if RightDockPanel.ContainsControl(frmRterm)  then pSetInterfaceSize(frmRterm, frmMain.Width  div iK)  // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then pSetInterfaceSize(frmRterm, frmMain.Height div iK); // Bottom

  pSetFocus_Main;
end;

procedure TfrmMain.actToolsMaximizeExecute(Sender: TObject);
const
  iW = 13;   // experimental
  iH = 143;

begin
  if not GetFormVisible(frmTools) then Exit;

  if GetFormVisible(frmRterm) then HideDockForm(frmRterm);
  actRtermVisible.Checked:= GetFormVisible(frmRterm);

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmTools)   then pSetInterfaceSize(frmTools, frmMain.Width  - iW)  // Left
    else if TopDockPanel.ContainsControl(frmTools)    then pSetInterfaceSize(frmTools, frmMain.Height - iH)  // Top
    else if RightDockPanel.ContainsControl(frmTools)  then pSetInterfaceSize(frmTools, frmMain.Width  - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmTools) then pSetInterfaceSize(frmTools, frmMain.Height - iH); // Bottom
end;

procedure TfrmMain.actToolsAutoHideExecute(Sender: TObject);
begin
  if not actToolsVisible.Checked then Exit;  // Nothing to do

  if frmTools.CanFocus then begin  // Toogles to auto hide on
    with JvDockServer do
      if      LeftDockPanel.ContainsControl(frmTools)   then TJvDockVSNETPanel(JvDockServer.LeftDockPanel).DoAutoHideControl(frmTools)    // Left
      else if TopDockPanel.ContainsControl(frmTools)    then TJvDockVSNETPanel(JvDockServer.TopDockPanel).DoAutoHideControl(frmTools)     // Top
      else if RightDockPanel.ContainsControl(frmTools)  then TJvDockVSNETPanel(JvDockServer.RightDockPanel).DoAutoHideControl(frmTools)   // Right
      else if BottomDockPanel.ContainsControl(frmTools) then TJvDockVSNETPanel(JvDockServer.BottomDockPanel).DoAutoHideControl(frmTools); // Bottom
  end
  else  // Toogles to auto hide off
    JvDockVSNetStyle.DoUnAutoHideDockForm(frmTools);
end;

procedure TfrmMain.actToolsDivideExecute(Sender: TObject);
const
  iW = 20;   // experimental
  iH = 74;

begin
  if not GetFormVisible(frmTools) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmTools)   then pSetInterfaceSize(frmTools, frmMain.Width  div 2 - iW)  // Left
    else if TopDockPanel.ContainsControl(frmTools)    then pSetInterfaceSize(frmTools, frmMain.Height div 2 - iH)  // Top
    else if RightDockPanel.ContainsControl(frmTools)  then pSetInterfaceSize(frmTools, frmMain.Width  div 2 - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmTools) then pSetInterfaceSize(frmTools, frmMain.Height div 2 - iH); // Bottom
end;

procedure TfrmMain.actToolsMinimizeExecute(Sender: TObject);
const
  iK = 20;

begin
  if not GetFormVisible(frmTools) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmTools)   then pSetInterfaceSize(frmTools, frmMain.Width  div iK)  // Left
    else if TopDockPanel.ContainsControl(frmTools)    then pSetInterfaceSize(frmTools, frmMain.Height div iK)  // Top
    else if RightDockPanel.ContainsControl(frmTools)  then pSetInterfaceSize(frmTools, frmMain.Width  div iK)  // Right
    else if BottomDockPanel.ContainsControl(frmTools) then pSetInterfaceSize(frmTools, frmMain.Height div iK); // Bottom
end;

procedure TfrmMain.pCheckIfFileFromDvi(sFile: string);
var
  iPos: integer;

  sLineNumber,
   sTmp: string;

begin
  iPos:= Pos(';',
             sFile);
  if (iPos > 0) then begin
    sLineNumber:= Copy(sFile,
                       iPos + 1,
                       length(sFile));

    sFile:= Copy(sFile,
                 0,
                 iPos - 1);

    // Clear complex path
    sTmp:= fInvertString(sFile);
    iPos := Pos(':',
                sTmp);
    if (iPos <> 0) then begin
      sTmp := Copy(sTmp,
                   0,
                   iPos + 1);

      sFile:= fInvertString(sTmp);
    end;

    if FileExists(trim(sFile)) then begin
      pOpenFileIntoTinn(sFile,
                        StrToIntDef(sLineNumber,
                                    0));
      if (pgFiles.PageCount > 0) then
        with TfrmEditor(MDIChildren[0]).synEditor do begin
          TopLine:= StrToInt(sLineNumber);
    
          ExecuteCommand(ecLineEnd,
                         #0,
                         nil);
    
          ExecuteCommand(ecSelLineStart,
                         #0,
                         nil);
        end;
    end
    else Exit
  end
  else if FileExists(trim(sFile)) then pOpenFileIntoTinn(sFile);
end;

procedure TfrmMain.pOpenFileFromSearch;
var
  iPos,
   iEnd: integer;

  sFile,
   sTmp,
   sLineNumber: string;

  seEditor: TSynEdit;
  
begin
  with frmTools.tvSearch do begin
    if (Selected = nil) or
       (Selected.Level < 2) then Exit;
    
    sTmp:= Selected.Text;
    
    sFile:= Selected.Parent.Text;
    
    iPos:= Pos('(',
               sTmp);
    
    if (iPos > 0) then begin
      iEnd:= Pos('):',
                 sTmp);
    
      sLineNumber:= Copy(sTmp,
                         iPos + 1,
                         ((iEnd - iPos) - 1));
    end;
  end;

  if FileExists(trim(sFile)) then pOpenFileIntoTinn(sFile,
                                                    StrToIntDef(sLineNumber,
                                                               0))
                             else fMessageDlg(trim(sFile) + #13 + #13 +
                                              'The file above was not found!',
                                              mtWarning,
                                              [mbOk],
                                              0);

  Sleep(iDelay div 2);

  seEditor:= nil;

  if (pgFiles.PageCount > 0) then
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

    with seEditor do begin
      TopLine:= StrToInt(sLineNumber);

      ExecuteCommand(ecLineEnd,
                     #0,
                     nil);

      ExecuteCommand(ecSelLineStart,
                     #0,
                     nil);
    end;
end;

procedure TfrmMain.pmenResultsOpenLinkClick(Sender: TObject);
begin
  pOpenFileFromSearch;
end;

procedure TfrmMain.actSearchExpandOneExecute(Sender: TObject);
var
  i: integer;

  tnSelected: TTreeNode;

begin
  with frmTools.tvSearch do begin
    if (Items.Count = 0) then Exit;
    Items.BeginUpdate;

    if (Selected.Level > 1) then tnSelected:= Selected.Parent
                            else tnSelected:= Selected;
    FullCollapse;

    for i := 0 to Items.Count -1 do
      if (Items[i].Level = 0) then
        Items[i].Expand(False);

    TopItem := tnSelected;
    Selected:= TopItem;
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.actSearchExpandAllExecute(Sender: TObject);
var
  tnSelected,
   tnOldSelected: TTreeNode;

begin
  with frmTools.tvSearch do begin
    if (Items.Count = 0) then Exit;
    tnOldSelected:= Selected;

    if (Selected.Level > 1) then tnSelected:= Selected.Parent
                            else tnSelected:= Selected;

    Items.BeginUpdate;
    FullExpand;
    TopItem := tnSelected;
    Selected:= tnOldSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.actSearchCollapseOneExecute(Sender: TObject);
var
  i: integer;

  tnSelected,
   tnOldSelected: TTreeNode;

begin
  with frmTools.tvSearch do begin
    if (Items.Count = 0) then Exit;
    tnOldSelected:= Selected;

    if (Selected.Level > 1) then tnSelected:= Selected.Parent
                            else tnSelected:= Selected;
    Items.BeginUpdate;
    FullCollapse;

    for i := 0 to Items.Count -1 do
      if (Items[i].Level = 0) then
        Items[i].Expand(False);

    TopItem := tnSelected;
    Selected:= tnOldSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmMain.actSearchCollapseAllExecute(Sender: TObject);
var
  tnSelected: TTreeNode;

begin
  with frmTools.tvSearch do begin
    if (Items.Count = 0) then Exit;
    if (Selected.Level > 1) then tnSelected:= Selected.Parent
                            else tnSelected:= Selected;
    Items.BeginUpdate;
    FullCollapse;
    TopItem:= tnSelected;
    Items.EndUpdate;
  end;
end;

{
procedure TfrmMain.synEditorDataCompletionCodeCompletion(Sender: TObject;
                                                             var Value: string;
                                                             Shift: TShiftState;
                                                             Index: Integer;
                                                             EndToken: Char);
begin
  with TSynCompletionProposal(Sender).Editor do
    CaretX:= CaretX;
end;
}

procedure TfrmMain.actRtermVisibleExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;

  if GetFormVisible(frmRterm) then HideDockForm(frmRterm)
                              else begin
                                ShowDockForm(frmRterm);

                                pSetInterfaceSize(frmRterm,         // It was necessary due to a bug in the component (hard to fix for simple users like me)
                                                  frmRterm.iSize);  // http://stackoverflow.com/questions/27696359/delphi-jedi-docking-storage-remember
                              end;

  actRtermVisible.Checked:= GetFormVisible(frmRterm);
end;

procedure TfrmMain.actToolsVisibleExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then Exit;

  if GetFormVisible(frmTools) then HideDockForm(frmTools)
                              else begin
                                ShowDockForm(frmTools);

                                pSetInterfaceSize(frmTools,         // It was necessary due to a bug in the component (hard to fix for simple users like me)
                                                  frmTools.iSize);  // http://stackoverflow.com/questions/27696359/delphi-jedi-docking-storage-remember
                              end;

  actToolsVisible.Checked:= GetFormVisible(frmTools);
end;

procedure TfrmMain.actRtermTabsBottomExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdBottom;
  actRtermTabsBottom.Checked:= True;
end;

procedure TfrmMain.actRtermTabsLeftExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdLeft;
  actRtermTabsLeft.Checked:= True;
end;

procedure TfrmMain.actRtermTabsRightExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdRight;
  actRtermTabsRight.Checked:= True;
end;

procedure TfrmMain.actRtermTabsTopExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdTop;
  actRtermTabsTop.Checked:= True;
end;

procedure TfrmMain.actRtermWarningErrorExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;

  actRtermWarningError.Visible:= False;
  stbMain.Panels[9].Text:= EmptyStr; 

  ShowDockForm(frmRterm);
  if actRtermIOSplitRemove.Checked then frmRterm.pgRterm.ActivePage:= frmRterm.tbsLog
                                   else frmRterm.pgRterm.ActivePage:= frmRterm.tbsIO;

  actRtermVisible.Checked:= GetFormVisible(frmRterm);
end;

procedure TfrmMain.actRtipInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then Exit;
  i:= fFindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    pDoTipInsert;

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmMain.actRVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsR do begin
    TabVisible:= not TabVisible;
    actRVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.actRtermIOSetFocusExecute(Sender: TObject);
begin
  if not frmRterm.Visible then Exit;

  with frmRterm do
    try
      pgRterm.ActivePage:= tbsIO;
      with synIO do
        if CanFocus then SetFocus;
    except
      on E: Exception do
        ShowMessage('Please, be sure the Rterm panel is visible before that!');
    end;

  actRtermIOSetFocus.Checked:= True;
end;

procedure TfrmMain.actRtermIOSplitHorizontalExecute(Sender: TObject);
var
  sPriorLog: string;

begin
  if Assigned(frmRterm.synLog2) then sPriorLog:= frmRterm.synLog2.Text
                                else sPriorLog:= frmRterm.synLog.Text;

  frmRterm.pRtermSplit;
  if Assigned(frmRterm.synLog2) then

    with frmRterm.synLog2 do begin
      BeginUpdate;
      WordWrap:= bLogLineWrap;
      Text:= sPriorLog;

      PostMessage(TWinControl(frmRterm.synLog2).Handle,
                  WM_SETFOCUS,
                  0,
                  0);  // Will force ecEditorBottom below

      ExecuteCommand(ecEditorBottom,
                     #0,
                     nil);
      EndUpdate;
    end;

  frmRterm.tbsLog.TabVisible:= False;
  if frmRterm.Visible then
    with frmRterm.synIO do
        if Parent.CanFocus then SetFocus;

  actRtermIOSplitHorizontal.Checked:= Assigned(frmRterm.synLog2);
  bRtermSingle    := True;
  bRtermHorizontal:= True;
end;

procedure TfrmMain.actRtermIOSplitVerticalExecute(Sender: TObject);
var
  sPriorLog: string;

begin
  if Assigned(frmRterm.synLog2) then sPriorLog:= frmRterm.synLog2.Text
                                else sPriorLog:= frmRterm.synLog.Text;
  
  frmRterm.pRtermSplit(False);

  if Assigned(frmRterm.synLog2) then
    with frmRterm.synLog2 do begin
      BeginUpdate;
      WordWrap:= bLogLineWrap;
      Text:= sPriorLog;

      PostMessage(TWinControl(frmRterm.synLog2).Handle,
                  WM_SETFOCUS,
                  0,
                  0);  // Will force ecEditorBottom below

      ExecuteCommand(ecEditorBottom,
                     #0,
                     nil);

      EndUpdate;
    end;

  frmRterm.tbsLog.TabVisible:= False;
  if frmRterm.Visible then
    with frmRterm.synIO do
        if Parent.CanFocus then SetFocus;

  actRtermIOSplitVertical.Checked:= Assigned(frmRterm.synLog2);
  bRtermSingle    := True;
  bRtermHorizontal:= False;
end;

procedure TfrmMain.actRtermIOSplitRemoveExecute(Sender: TObject);
var
  sPriorLog: string;

begin
  if Assigned(frmRterm.synLog2) then sPriorLog:= frmRterm.synLog2.Text
                                else sPriorLog:= frmRterm.synLog.Text;

  if Assigned(frmRterm.splRIO) then FreeAndNil(frmRterm.splRIO);

  if Assigned(frmRterm.synLog2) then begin
    with frmRterm.synIO do
      if CanFocus then SetFocus;
    Application.ProcessMessages;
    FreeAndNil(frmRterm.synLog2);
  end;

  with frmRterm.synLog do begin
    BeginUpdate;

    WordWrap:= bLogLineWrap;

    Text:= sPriorLog;
  
    PostMessage(TWinControl(frmRterm.synLog).Handle,
                WM_SETFOCUS,
                0,
                0);  // Will force ecEditorBottom below

    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    EndUpdate;
  end;

  frmRterm.synIO.Align:= alClient;
  frmRterm.tbsLog.TabVisible:= True;
  actRtermIOSplitRemove.Checked:= (frmRterm.synLog2 = nil);
  bRtermSingle:= False;
  pUpdateRterm_Appearance;
  //frmRterm.TBToolbarRterm.Left:= 92;
end;

procedure TfrmMain.actRtermLOGSetFocusExecute(Sender: TObject);
begin
  if not frmRterm.Visible then Exit;

  with frmRterm do
    try
      if Assigned(synLog2) then begin
        pgRterm.ActivePage:= frmRterm.tbsIO;
        with synLog2 do
          if CanFocus then SetFocus;
      end
      else begin
        pgRterm.ActivePage:= frmRterm.tbsLog;
        with synLog do
          if CanFocus then SetFocus;
      end;
    except
      on E: Exception do
        ShowMessage('Please, be sure the Rterm panel is visible before that!');
    end;

  actRtermLogSetFocus.Checked:= True;
end;

procedure TfrmMain.actRtermEditorSetFocusExecute(Sender: TObject);
var
  i: integer;
  
begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);

  actRtermEditorSetFocus.Checked := True;
end;

procedure TfrmMain.synIOClick(Sender: TObject);
begin
  actRtermIOSetFocus.Checked:= True;
end;

procedure TfrmMain.synIOEnter(Sender: TObject);
begin
  actRtermIOSetFocus.Checked:= True;
end;

procedure TfrmMain.actRtermIO_TextExecute(Sender: TObject);
begin
  frmRterm.synIO.Highlighter:= dmSyn.synText;
  iIO_Syntax:= 0;
  actRtermIO_Text.Checked:= True;
end;

procedure TfrmMain.actRtermIO_Text_nMLExecute(Sender: TObject);
begin
  frmRterm.synIO.Highlighter:= dmSyn.synText_term;
  iIO_Syntax:= 1;
  actRtermIO_Text_nML.Checked:= True;
end;

procedure TfrmMain.actRtermLOG_TextExecute(Sender: TObject);
begin
  if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Highlighter:= dmSyn.synText;
  frmRterm.synLog.Highlighter:= dmSyn.synText;
  iLOG_Syntax:= 0;
  actRtermLOG_Text.Checked:= True;
end;

procedure TfrmMain.actRtermLOG_Text_nMLExecute(Sender: TObject);
begin
  if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Highlighter:= dmSyn.synText_term;
  frmRterm.synLog.Highlighter:= dmSyn.synText_term;
  iLOG_Syntax:= 1;
  actRtermLOG_Text_nML.Checked:= True;
end;

procedure TfrmMain.actRtermIO_RExecute(Sender: TObject);
begin
  frmRterm.synIO.Highlighter:= dmSyn.synR;
  iIO_Syntax:= 2;
  actRtermIO_R.Checked:= True;
end;

procedure TfrmMain.actRtermIO_R_nMLExecute(Sender: TObject);
begin
  frmRterm.synIO.Highlighter:= dmSyn.synR_term;
  iIO_Syntax:= 3;
  actRtermIO_R_nML.Checked:= True;
end;

procedure TfrmMain.actRtermLOG_RExecute(Sender: TObject);
begin
  if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Highlighter:= dmSyn.synR;
  frmRterm.synLog.Highlighter:= dmSyn.synR;
  iLOG_Syntax:= 2;
  actRtermLOG_R.Checked:= True;
end;

procedure TfrmMain.actRtermLOG_R_nMLExecute(Sender: TObject);
begin
  if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Highlighter:= dmSyn.synR_term;
  frmRterm.synLog.Highlighter:= dmSyn.synR_term;
  iLOG_Syntax:= 3;
  actRtermLOG_R_nML.Checked:= True;
end;

procedure TfrmMain.actRtermIOClearExecute(Sender: TObject);
var
  i: integer;

begin
  stbMain.Panels[9].Text:= EmptyStr;
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;
  with frmRterm.synIO do begin
    for i:= 0 to 9 do
      ClearBookMark(i);
    Clear;
  end;
  pDoClearConsole;
end;

procedure TfrmMain.actRtermIOHistoryNextExecute(Sender: TObject);
begin
  if not fRterm_Running then Exit;
  with frmRterm do begin
    synIO.CaretY:= synIO.Lines.Count;
    if (synIO.SelText <> EmptyStr) then Exit;
    if bRterm_Plus then synIO.LineText:= '+ ' +
                                         RHistory.fGetNext
    else
      if bRUnderDebug_Function or
         bRUnderDebug_Package then synIO.LineText:= frmRterm.sRDebugPrefix +
                                                    ' ' +
                                                    RHistory.fGetNext
                              else synIO.LineText:= '> ' +
                                                    RHistory.fGetNext;
    synIO.ExecuteCommand(ecLineEnd,
                         #0,
                         nil);
   end;
end;

procedure TfrmMain.actRtermIOHistoryPriorExecute(Sender: TObject);
begin
  if not fRterm_Running then Exit;
  
  with frmRterm do begin
    synIO.CaretY:= synIO.Lines.Count;
    if (synIO.SelText <> EmptyStr) then Exit;
    if bRterm_Plus then synIO.LineText:= '+ ' +
                                         RHistory.fGetPrior
    else
      if bRUnderDebug_Function or
         bRUnderDebug_Package then synIO.LineText:= frmRterm.sRDebugPrefix +
                                                    ' ' +
                                                    RHistory.fGetPrior
                              else synIO.LineText:= '> ' +
                                                    RHistory.fGetPrior;

    synIO.ExecuteCommand(ecLineEnd,
                         #0,
                         nil);
   end;
end;

procedure TfrmMain.actRtermLOGClearExecute(Sender: TObject);
var
  i: integer;

  seLog: TSynEdit;

begin
  stbMain.Panels[9].Text:= EmptyStr;
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  
  with seLog do begin
    for i:= 0 to 9 do
      ClearBookMark(i);
    Clear;
  end;
end;

procedure TfrmMain.actRtermIOandLOGClearExecute(Sender: TObject);
begin
  actRtermIOClearExecute(nil);
  actRtermLogClearExecute(nil);
end;

procedure TfrmMain.actRtermIOPrintExecute(Sender: TObject);
begin
  with frmRterm.synIO do
    if (SelText <> EmptyStr) then bSelectedToPreview:= True
                             else bSelectedToPreview:= False;
  
  frmConfigurePrint:= TfrmConfigurePrint.Create(Self);
  
  with frmConfigurePrint do begin
    try
      with frmRterm.synIO do
        ShowDialog(frmRterm.synIO);
    finally
      FreeAndNil(frmConfigurePrint);
      frmMain.Repaint;
    end;
  end;
end;

procedure TfrmMain.actRtermLOGPrintExecute(Sender: TObject);
var
  seLog: TSynEdit;

begin
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;

  with seLog do
    if (seLog.SelText <> EmptyStr) then bSelectedToPreview:= True
                                   else bSelectedToPreview:= False;

  frmConfigurePrint:= TfrmConfigurePrint.Create(Self);

  with frmConfigurePrint do begin
    try
      with seLog do
        ShowDialog(seLog);
    finally
      FreeAndNil(frmConfigurePrint);
      frmMain.Repaint;
    end;
  end;
end;

procedure TfrmMain.actRtermIOSaveExecute(Sender: TObject);
begin
  if FileExists(sRIOSaved) then frmRterm.synIO.Lines.SaveToFile(sRIOSaved)
                           else actRtermIOSaveAsExecute(nil);
end;

procedure TfrmMain.actRtermLOGSaveExecute(Sender: TObject);
begin
  if FileExists(sRLogSaved) then frmRterm.synIO.Lines.SaveToFile(sRLogSaved)
                            else actRtermLogSaveAsExecute(nil);
end;

procedure TfrmMain.actRtermIOSaveAsExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= fRemove_FileExtension(pgFiles.ActivePage.Caption);
  
  pFileSaveGeneric(sTmp +
                   '_io.txt',
                   frmRterm.synIO);
end;

procedure TfrmMain.actRtermLOGSaveAsExecute(Sender: TObject);
var
  sTmp: string;

  seLog: TSynEdit;

begin
  sTmp:= fRemove_FileExtension(pgFiles.ActivePage.Caption);
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;

  pFileSaveGeneric(sTmp +
                   '_log.txt',
                   seLog);
end;

procedure TfrmMain.pFileSaveGeneric(sFile: string;
                                        synEditor: TSynEdit);
begin
  sdMain.InitialDir:= sWorkingDir;

  with sdMain do begin
    fileName  := sFile;
    Filter    := 'Text (*.txt)|*.txt';
    DefaultExt:= '*.txt';
  end;

  if sdMain.Execute then begin
    sFile:= sdMain.fileName;
  
    if FileExists(sFile) then begin
      if (fMessageDlg(sFile + #13 + #13 +
                      'Do you want to overwrite this file?',
                      mtConfirmation,
                      [mbYes, mbCancel],
                      0) <> idYes) then begin

        sSaveAsFileExt:= EmptyStr;
        sdMain.Filter := slFilters.Text;
        Exit;
      end;

      DeleteFile(sFile);
    end;

    synEditor.Lines.SaveToFile(sFile);
    sWorkingDir:= fStrip_FileName(sFile);
  end;

  if (frmRterm.pgRterm.ActivePage = frmRterm.tbsIO) then sRIOSaved := sFile
                                                    else sRLogSaved:= sFile;
  sSaveAsFileExt:= EmptyStr;
  sdMain.Filter := slFilters.Text;
end;

procedure TfrmMain.actRSimpleDefaultExecute(Sender: TObject);
begin
  actRSimpleDefault.Checked:= True;
  if (pgFiles.PageCount > 0) then (Self.MDIChildren[fFindTopWindow] as tfrmEditor).FormActivate(nil);
end;

procedure TfrmMain.actRCardOpenExampleSelectedExecute(Sender: TObject);

  function fGetWord(var sTopic,
                       sPackage: string): boolean;
  var
    iPos: integer;

    sTmp: string;

  begin
    Result:= False;

    if not fValidRRunning then Exit;

    sTmp:= modDados.cdRcardFunction.Value;

    iPos:= Pos('(',
               sTmp);

    if (iPos <> 0) then sTmp:= Copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      fMessageDlg('No valid word selected!',
                  mtInformation,
                  [mbOk],
                  0);
      Result:= False;
      Exit;
    end;

    // https://regex101.com/r/kB2eR5/1
    //$re = '/(?<=::).+$/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sTopic:= fRegEx(sTmp,
                    '(?<=::).+$',
                    False);

    if (sTopic = EmptyStr) then sTopic:= sTmp;

    // https://regex101.com/r/bZ6tF2/2
    //$re = '/(?i)^[a-z0-9]+(?=::)/m';
    //$str = 'stats::var
    //stats::sd
    //
    //fdth::var
    //fdth::sd
    //
    //abcdeFBA::test
    //arf3DS4::test2
    //
    //var
    //sd
    //test';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    sPackage:= fRegEx(sTmp,
                      '(?i)^[a-z0-9]+(?=::)',
                      False);

    Result:= True;
  end;

  procedure pSetArgs(var sInfo,
                         sTopic,
                         sPackage,
                         sFile: string);
  begin
    // topic
    sInfo:= StringReplace(sInfo,
                          '%topic',
                          sTopic,
                          []);

    // package
    if (sPackage <> EmptyStr) then
      sInfo:= StringReplace(sInfo,
                            'NULL',
                            '''' +
                            sPackage
                            + '''',
                            []);

    // file
    sInfo:= StringReplace(sInfo,
                          '%file',
                          DosPathToUnixPath(sFile),
                          []);
  end;


var
  i: integer;

  sInfo,
   sToSend,
   sSource,
   sResult,
   sTopic,
   sPackage: string;

begin
  try
    if not fGetWord(sTopic,
                    sPackage) then Exit;

    if (sPackage = EmptyStr) then
      sResult:= sPath_Tmp +
                '\' +
                sTopic +
                '.R'
    else
      sResult:= sPath_Tmp +
                '\' +
                sTopic +
                '_' +
                sPackage +
                '.R';

    sInfo:= fFile_ToString(sUtilsOrigin +
                           '\example.R');

    pSetArgs(sInfo,
             sTopic,
             sPackage,
             sResult);

    sSource:= sPath_Tmp +
              '\' +
              'example.R';

    if fFile_Save_Fast(sSource,
                       sInfo) then sToSend:= 'source(' +
                                             '''' +
                                             DosPathToUnixPath(sSource) +
                                             '''' +
                                             ')';

    // Disable ReturnFocus: Temporary to avoid a flicker in the TBRMain
    if fRgui_Running and
       bRguiReturnFocus then actRguiReturnFocus.Checked:= False;
    Application.ProcessMessages;

    pDoSend(sToSend);

    i:= 1;
    repeat
      Sleep(5*iDelay);

      if FileExists(sResult) and
         not fFile_InUse(sResult) then Break
                                  else inc(i);
    until (i = 50);

    if not FileExists(sResult) then begin
      fMessageDlg(sResult + #13 + #13 +
                  'The file was not found!',
                  mtWarning,
                  [mbOk],
                  0);
      Exit;
    end;

    if (fFile_ToString(sResult) = EmptyStr) then begin
      with stbMain do begin
        Beep;
        Panels[8].Text:= 'Example not found!';
      end;

      Exit;
    end
    else
      pOpenFileIntoTinn(sResult,
                        0,
                        False,
                        False);
  finally
    //TODO
  end;
end;

procedure TfrmMain.actRComplexDefaultExecute(Sender: TObject);
begin
  actRComplexDefault.Checked:= True;
  if (pgFiles.PageCount > 0) then (Self.MDIChildren[fFindTopWindow] as tfrmEditor).FormActivate(nil);
end;

procedure TfrmMain.actTextDefaultExecute(Sender: TObject);
begin
  actTextDefault.Checked:= True;
  if (pgFiles.PageCount > 0) then (Self.MDIChildren[fFindTopWindow] as tfrmEditor).FormActivate(nil);
end;

procedure TfrmMain.actRtermSaveWorkspaceExecute(Sender: TObject);
var
  sFile,
   sTmp: string;

begin
  sdMain.InitialDir:= sWorkingDir;
  sdMain.fileName:= '.RData';
  sdMain.Filter  := '.RData';

  if sdMain.Execute then begin
    sFile:= sdMain.fileName;
    if FileExists(sFile) then begin
      if (fMessageDlg(sFile + #13 + #13 +
                      'Do you want to overwrite this file?',
                      mtConfirmation,
                      [mbYes, mbCancel],
                      0) <> idYes) then Exit;

      DeleteFile(sFile);
    end;

    sTmp:= 'save.image(''' +
                       DosPathToUnixPath(sFile) +
                       ''')';
    pDoSend(sTmp);
  end;
  sdMain.Filter:= slFilters.Text;
end;

procedure TfrmMain.actRtermSaveHistoryExecute(Sender: TObject);
var
  sFile: string;

begin
  sdMain.InitialDir:= sWorkingDir;
  sdMain.fileName:= '.Rhistory';
  sdMain.Filter  := '.Rhistory';

  if sdMain.Execute then begin
    sFile:= sdMain.fileName;

    if FileExists(sFile) then begin
      if (fMessageDlg(sFile + #13 + #13 +
                      'Do you want to overwrite this file?',
                      mtConfirmation,
                      [mbYes, mbCancel],
                      0) <> idYes) then Exit;

      DeleteFile(sFile);
    end;

    if RHistory.SaveToFile(sFile) then
      fMessageDlg(sFile + #13 + #13 +
                  'The R history was saved to the file above!',
                  mtInformation,
                  [mbOk],
                  0);
  end;
  sdMain.Filter:= slFilters.Text;
end;

procedure TfrmMain.actRtermLoadWorkspaceExecute(Sender: TObject);
var
  sFile,
   sTmp: string;

begin
  odMain.InitialDir:= sWorkingDir;
  odMain.fileName:= '.RData';
  odMain.Filter:= slFilters.Text;

  if odMain.Execute then begin
    sFile:= odMain.fileName;
  
    sTmp := 'load(''' +
                  DosPathToUnixPath(sFile) +
                  ''')';
  
    pDoSend(sTmp);
  end;
end;

procedure TfrmMain.actRtermLoadHistoryExecute(Sender: TObject);
var
  sFile: string;

begin
  odMain.InitialDir:= sWorkingDir;
  odMain.fileName:= '.Rhistory';
  odMain.Filter:= slFilters.Text;

  if odMain.Execute then begin
    sFile:= odMain.fileName;
  
    if RHistory.fLoadFromFile(sFile) then
      fMessageDlg(sFile + #13 + #13 +
                  'The R history was loaded from the file above!',
                  mtInformation,
                  [mbOk],
                  0);
  end;
end;

procedure TfrmMain.actDataShortcutsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsShortcuts do begin
    TabVisible:= not TabVisible;
    actDataShortcutsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmMain.pSetFocus_Main;
var
  i: integer;

begin
  case iSynWithFocus of
    1..2: begin
            i:= fFindTopWindow;
            if Assigned(Self.MDIChildren[i] as TfrmEditor) then
              PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
                          WM_SETFOCUS,
                          0,
                          0);
          end;
  end;
(*
    else
      {
      PostMessage(TWinControl(frmRTerm.synIO).Handle,
                  WM_SETFOCUS,
                  0,
                  0);
      }
      if frmRTerm.Visible then
        //frmRterm.synIO.SetFocus;  // Problem if autohide os on!
    end;
*)
end;

function TfrmMain.fGetFocus: integer;
var
  seLog: TSynEdit;

begin
  Result:= 0;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  // Editors
  if (pgFiles.PageCount <> 0) then
    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do begin
      // synEditor1
      if sActiveEditor = 'synEditor' then
        if synEditor.Focused then Result:= 1;
      // synEditor2
      if sActiveEditor = 'synEditor2' then
        if synEditor2.Focused then Result:= 2;
    end;
  // synIO
  if frmRterm.synIO.Focused                          then Result:= 3
  // syLog and synLog2
  else if seLog.Focused                              then Result:= 4
  // jvdlbWinExplorer
  else if (frmTools.jvdlbWinExplorer.Focused = True) then Result:= 5
  // jvflbWinExplorer
  else if (frmTools.jvflbWinExplorer.Focused = True) then Result:= 6
  // jvdlbWorkExplorer
  else if frmTools.jvdlbWorkExplorer.Focused         then Result:= 7
  // jvflbWorkExplorer
  else if frmTools.jvflbWorkExplorer.Focused         then Result:= 8
  // tvProject
  else if (frmTools.tvProject.Focused = True)        then Result:= 9
  // memIniLog
  else if frmTools.memIniLog.Focused                 then Result:= 10
  // tvSearch
  else if (frmTools.tvSearch.Focused = True)         then Result:= 11
  // memSpell
  else if frmTools.memSpell.Focused                  then Result:= 12
  // lbRcard
  else if frmTools.lbRcard.Focused                   then Result:= 13
  // dbgRcard
  else if frmTools.dbgRcard.Focused                  then Result:= 14
  // dbRcardMemo
  else if frmTools.dbRcardMemo.Focused               then Result:= 15
   // lbCountries
  else if frmTools.lbCountries.Focused               then Result:= 16
   // dbgRmirrors
  else if frmTools.dbgRmirrors.Focused               then Result:= 17
   // dbeRmirrorsURL
  else if frmTools.dbeRmirrorsURL.Focused            then Result:= 18
  // lbCompletion
  else if frmTools.lbCompletion.Focused              then Result:= 19
  // dbgCompletion
  else if frmTools.dbgCompletion.Focused             then Result:= 20
  // dbCompletionMemo
  else if frmTools.dbCompletionMemo.Focused          then Result:= 21
  // dbgComments
  else if frmTools.dbgComments.Focused               then Result:= 22
  // lbShortcuts
  else if frmTools.lbShortcuts.Focused               then Result:= 23
  // dbgShortcuts
  else if frmTools.dbgShortcuts.Focused              then Result:= 24
  // dbShortcutsMemo
  else if frmTools.dbShortcutsMemo.Focused           then Result:= 25
  // lvRexplorer
  else if (frmTools.lvRexplorer.Focused = True)      then Result:= 26;
end;

procedure TfrmMain.actFontIncreaseExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin  // Font.Size < 50
  iFocus:= fGetFocus;
  
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          if (Font.Size < 50) then begin
            Font.Size:= Font.Size + 1;
            pUpdateHexViewer;
          end;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          if (Font.Size < 50) then begin
            Font.Size:= Font.Size + 1;
            pUpdateHexViewer;
          end;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do begin
          if (Font.Size < 50) then Font.Size:= Font.Size + 1;
          frmRterm.pgRtermResize(nil);
        end;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          if (Font.Size < 50) then Font.Size:= Font.Size + 1;
     // jvdlbWinExplorer
     5: with frmTools.jvdlbWinExplorer do
          if (Font.Size < 20) then Font.Size:= Font.Size + 2;
     // jvflbWinExplorer
     6: with frmTools.jvflbWinExplorer do
          if (Font.Size < 20) then Font.Size:= Font.Size + 2;
     // jvdlbWorkExplorer
     7: with frmTools.jvdlbWorkExplorer do
          if (Font.Size < 20) then Font.Size:= Font.Size + 2;
     // jvflbWorkExplorer
     8: with frmTools.jvflbWorkExplorer do
          if (Font.Size < 20) then Font.Size:= Font.Size + 2;
     // tvProject
     9: with frmTools.tvProject do
          if (Font.Size < 20) then Font.Size:= Font.Size + 2;
     // memIniLog
    10: with frmTools.memIniLog do
          if (Font.Size < 50) then Font.Size:= Font.Size + 1;
     // tvSearch
    11: with frmTools.tvSearch do
          if (Font.Size < 20) then Font.Size:= Font.Size + 2;
     // memSpell
    12: with frmTools.memSpell do
          if (Font.Size < 50) then Font.Size:= Font.Size + 1;
     // lbRcard
    13: with frmTools.lbRcard do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbgRcard
    14: with frmTools.dbgRcard do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbRcardMemo
    15: with frmTools.dbRcardMemo do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // lbCountries
    16: with frmTools.lbCountries do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbgRmirrors
    17: with frmTools.dbgRmirrors do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbeRmirrorsURL
    18: with frmTools.dbeRmirrorsURL do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // lbCompletion
    19: with frmTools.lbCompletion do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbgCompletion
    20: with frmTools.dbgCompletion do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbCompletionMemo
    21: with frmTools.dbCompletionMemo do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbgComments
    22: with frmTools.dbgComments do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // lbShortcuts
    23: with frmTools.lbShortcuts do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbgShortcuts
    24: with frmTools.dbgShortcuts do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
     // dbShortcutsMemo
    25: with frmTools.dbShortcutsMemo do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
    // lvRexplorer
    26: with frmTools.lvRexplorer do
          if (Font.Size < 20) then Font.Size:= Font.Size + 1;
  end;
end;

procedure TfrmMain.actFontDecreaseExecute(Sender: TObject);
var
  iFocus: integer;

  seLog: TSynEdit;

begin  //Font.Size > 02
  iFocus:= fGetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor do
          if (Font.Size > 02) then begin
            Font.Size:= Font.Size - 1;
            pUpdateHexViewer;
          end;
     // synEditor2
     2: with (Self.MDIChildren[fFindTopWindow] as TfrmEditor).synEditor2 do
          if (Font.Size > 02) then begin
            Font.Size:= Font.Size - 1;
            pUpdateHexViewer;
          end;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do begin
          if (Font.Size > 02) then Font.Size:= Font.Size - 1;
          frmRterm.pgRtermResize(nil);
        end;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          if (Font.Size > 02) then Font.Size:= Font.Size - 1;
     // jvdlbWinExplorer
     5: with frmTools.jvdlbWinExplorer do
          if (Font.Size > 06) then Font.Size:= Font.Size - 2;
     // jvflbWinExplorer
     6: with frmTools.jvflbWinExplorer do
          if (Font.Size > 06) then Font.Size:= Font.Size - 2;
     // jvdlbWorkExplorer
     7: with frmTools.jvdlbWorkExplorer do
          if (Font.Size > 06) then Font.Size:= Font.Size - 2;
     // jvflbWorkExplorer
     8: with frmTools.jvflbWorkExplorer do
          if (Font.Size > 06) then Font.Size:= Font.Size - 2;
     // tvProject
     9: with frmTools.tvProject do
          if (Font.Size > 06) then Font.Size:= Font.Size - 2;
     // memIniLog
    10: with frmTools.memIniLog do
          if (Font.Size > 02) then Font.Size:= Font.Size - 1;
     // tvSerach
    11: with frmTools.tvSearch do
          if (Font.Size > 06) then Font.Size:= Font.Size - 2;
     // memSpell
    12: with frmTools.memSpell do
          if (Font.Size > 02) then Font.Size:= Font.Size - 1;
     // lbRcard
    13: with frmTools.lbRcard do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbgRcard
    14: with frmTools.dbgRcard do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbRcardMemo
    15: with frmTools.dbRcardMemo do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // lbCountries
    16: with frmTools.lbCountries do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbgRmirrors
    17: with frmTools.dbgRmirrors do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbeRmirrorsURL
    18: with frmTools.dbeRmirrorsURL do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // lbCompletion
    19: with frmTools.lbCompletion do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbgCompletion
    20: with frmTools.dbgCompletion do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbCompletionMemo
    21: with frmTools.dbCompletionMemo do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbgComments
    22: with frmTools.dbgComments do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // lbShortcuts
    23: with frmTools.lbShortcuts do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbgShortcuts
    24: with frmTools.dbgShortcuts do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
     // dbShortcutsMemo
    25: with frmTools.dbShortcutsMemo do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
    // lvRexplorer
    26: with frmTools.lvRexplorer do
          if (Font.Size > 06) then Font.Size:= Font.Size - 1;
  end;
end;

procedure TfrmMain.actFormatRExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  sTmp,
   sToSend,
   sSel: string;

  i: integer;

  procedure pSendToRReformat(bFile: boolean);
  begin
    if (sFormatR = EmptyStr) then
      sTmp:= 'tidy_source(' +
             sToSend +
             ', ' +
             'file=' +
             '.paths[9]' +
             ')'
    else
      sTmp:= 'tidy_source(' +
             sToSend +
             ', ' +
             'file=' +
             '.paths[9]' +
             ', ' +
             sFormatR +
             ')';

    pDoSend(sTmp);

    if bFile then  // Do not remove from the end of the procedure!
      iRFormatted:= 0
    else
      iRFormatted:= 1;
  end;

  // File to reformat
  procedure pRReformatFile;
  begin
    sToSend:= fGetFileToReformat;
    if (sToSend = EmptyStr) then Exit;
    pSendToRReformat(True);
  end;

  // Selection to reformat
  procedure pRReformatSelection;
  begin
    with (Self.MDIChildren[i] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;

    with seEditor do begin
      if SelAvail then begin
        sSel:= SelText;
      end;

      sToSend:= fGetSelectionToReformat(sSel);
      if (sToSend = EmptyStr) then Exit;
      pSendToRReformat(False);
    end;
  end;

begin
  i:= fFindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    if not SelAvail then pRReformatFile
                    else pRReformatSelection;
  end;
end;

function TfrmMain.fCheckConnection: boolean;
begin
  if fIsConnected then Result:= True
  else begin
    with stbMain do begin
      Panels[8].Text:= 'Warning';
      Panels[9].Text:= 'Please, check your internet connection!';
    end;
    Application.ProcessMessages;

    Result:= False;
  end;
end;

procedure TfrmMain.pUpdateHexViewer;

  procedure pSetMode(sMode: string);
  begin
    with frmTools do begin
      if (sMode = 'ANSI') or
         (sMode = 'UTF-8') then begin
        with rgHexViewerMode do begin
          Controls[0].Enabled:= True;
          Controls[1].Enabled:= True;
          Controls[2].Enabled:= True;
          Controls[3].Enabled:= False;
          Controls[4].Enabled:= False;
          ItemIndex:= 2;
        end;

        ATBinHex.Mode:= vbmodeHex;
      end
      else begin
        with rgHexViewerMode do begin
          Controls[0].Enabled:= False;
          Controls[1].Enabled:= False;
          Controls[2].Enabled:= False;
          Controls[3].Enabled:= True;
          Controls[4].Enabled:= True;
          ItemIndex:= 4;
        end;

        ATBinHex.Mode:= vbmodeUHex;
      end;
    end;
  end;

var
  seTmp: TSynEdit;

  sTmp: string;

begin
  // Low cost
  if (pgFiles.PageCount = 0) or
  not frmTools.Visible or
  (frmTools.pgResults.ActivePage <> frmTools.tbsHexViewer) then Exit;

  try
    // low cost
    if Assigned(msHexViewer) then FreeAndNil(msHexViewer);

    msHexViewer:= TMemoryStream.Create;

    with (Self.MDIChildren[fFindTopWindow] as TfrmEditor) do
      seTmp:= SynEditor;

    seTmp.Lines.SaveToStream(msHexViewer);

    with frmTools.ATBinHex do begin
      // Appearance
      Font      := seTmp.Font;
      FontGutter:= seTmp.Gutter.Font;

      // It is necessary to know the file encoding
      sTmp:= fGetSaveFormat(seTmp.Lines);

      // It is necessary some retriction in the interface
      case fStringToCase_Select(sTmp,
                                ['ANSI',
                                 'UTF-8',
                                 'UTF16-LE',
                                 'UTF16-BE']) of
        0: begin
             TextEncoding:= vEncANSI;
             pSetMode('ANSI');
           end;
        1: begin
             TextEncoding:= vEncUTF8;
             pSetMode('UTF-8');
           end;
        2: begin
             TextEncoding:= vEncUnicodeLE;
             pSetMode('UTF16-LE');
           end;
        3: begin
             TextEncoding:= vEncUnicodeBE;
             pSetMode('UTF16-BE');
           end;
      end;

      // Load
      OpenStream(msHexViewer);
    end;
  except
    //TODO
  end;
end;

Initialization
  WM_FINDINSTANCE:= RegisterWindowMessage('Editor: find previous instance');
  if (WM_FINDINSTANCE = 0) then raise Exception.Create('Initialization failed');
  RHistory:= TRHistory.Create;
  //RSend_Smart:= TRSend_Smart.Create;

Finalization
  FreeAndNil(RHistory);
  FreeAndNil(RSend_Smart);
end.

