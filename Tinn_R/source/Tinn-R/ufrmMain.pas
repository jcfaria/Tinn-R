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
fd  = TFOntDialog                  ex: fdMain
h   = handle                       ex: hMyHandle
hk  = TfrmHotKeys                  ex: hkMyHotkeys
i   = integer                      ex: iMyInteger
if  = TIniFile                     ex: ifMyFile
im  = im                           ex: imMyImage
ks  = TKeyboardState               ex: ksMyState
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
rs  = TRegExpr                     ex: rsMyReg
s   = string                       ex: sMyString
sd  = TSaveDialog                  ex: sdMain
se  = TSynEdit                     ex: seMySynEdit
see = TSynEncoding                 ex: seeANSI
sef = TSaveFormat                  ex: sefUTF8
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
  ufrmHotKeys, trRHistory,
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
  IdHTTP, IdException, IdStack, JvUpDown;

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

type
  TfrmTinnMain = class(TForm)
    a1: TMenuItem;
    act1: TMenuItem;
    actAbout: TAction;
    actANSI: TAction;
    actAplicationExit: TAction;
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
    actMacroPlay: TAction;
    actMacroRecord: TAction;
    actMarkupVisible: TAction;
    actMatchBracket: TAction;
    actMiscVisible: TAction;
    actNormalSelect: TAction;
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
    actRContGuiStartClose: TAction;
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
    actFormatR: TAction;
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
    actRSendSourceBlockMarked: TAction;
    actRSendSourceClipboard: TAction;
    actRSendSourceContiguous: TAction;
    actRSendSourceFile: TAction;
    actRSendSourceSelection: TAction;
    actRSendSweave: TAction;
    actRSimpleDefault: TAction;
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
    actRtermSetIOSyntaxToR: TAction;
    actRtermSetIOSyntaxToText: TAction;
    actRtermSetLOGSyntaxToR: TAction;
    actRtermSetLOGSyntaxToText: TAction;
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
    actUnmarkAll: TAction;
    actUpperCaseSelection: TAction;
    actUpperCaseWord: TAction;
    actUTF16BE: TAction;
    actUTF16LE: TAction;
    actUTF8: TAction;
    actWindowArrange: TWindowArrange;
    actWindowCascade: TWindowCascade;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWinExplVisible: TAction;
    actWorkExplVisible: TAction;
    alMain: TActionList;
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
    Clipboard2: TMenuItem;
    Closeallselectedgroup2: TMenuItem;
    Commentsshowhide1: TMenuItem;
    Completionshowhide1: TMenuItem;
    Contiguous1: TMenuItem;
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
    MagicPoint1: TMenuItem;
    Makeindexmakeindex1: TMenuItem;
    Manpage1: TMenuItem;
    memRTCPConnection: TMenuItem;
    menChaLinEndMAC: TMenuItem;
    menChaLinEndUNIX: TMenuItem;
    menChaLinEndWIN: TMenuItem;
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
    menEncConANSI: TMenuItem;
    menEncConUTF16BE: TMenuItem;
    menEncConUTF16LE: TMenuItem;
    menEncConUTF8: TMenuItem;
    menEncConvert: TMenuItem;
    menEncDefANSI: TMenuItem;
    menEncDefault: TMenuItem;
    menEncDefUTF16BE: TMenuItem;
    menEncDefUTF16LE: TMenuItem;
    menEncDefUTF8: TMenuItem;
    menEncoding: TMenuItem;
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
    menFormat: TMenuItem;
    menFormatBlockIndent: TMenuItem;
    menFormatBlockUnident: TMenuItem;
    menFormatDelimiter: TMenuItem;
    menFormatSelection: TMenuItem;
    menFormatWord: TMenuItem;
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
    menHelpStatJournalStatisticalSoftware: TMenuItem;
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
    menMarks: TMenuItem;
    menMarksBlock: TMenuItem;
    menMarksMark: TMenuItem;
    menMarksUnmark: TMenuItem;
    menMarksUnmarkAll: TMenuItem;
    menOptionAlwaysOnTop: TMenuItem;
    menOptionColorPreference: TMenuItem;
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
    menREditorCurrentLineToTop: TMenuItem;
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
    menSendToRFile: TMenuItem;
    menSendToRKnitr: TMenuItem;
    menSendToRLine: TMenuItem;
    menSendToRLinesToEndPage: TMenuItem;
    menSendToRSelection: TMenuItem;
    menSendToRSourceBlockMarked: TMenuItem;
    menSendToRSourceSelection: TMenuItem;
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
    menViewToobars: TMenuItem;
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
    menWebRguiJGR: TMenuItem;
    menWebRguiProjects: TMenuItem;
    menWebRguiRComander: TMenuItem;
    menWebRguiRpad: TMenuItem;
    menWebRGuiRStudio: TMenuItem;
    menWebRguiSciViews: TMenuItem;
    menWebRguiTinnR: TMenuItem;
    menWebRGuiTinnRLEC: TMenuItem;
    menWebRguiTinnRSciViews: TMenuItem;
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
    menWebSSearch: TMenuItem;
    menWebSSearchMailling: TMenuItem;
    menWebSSearchSel: TMenuItem;
    menWebSSearchSelArchives: TMenuItem;
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
    N12: TMenuItem;
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
    N131: TMenuItem;
    N132: TMenuItem;
    N133: TMenuItem;
    N134: TMenuItem;
    N135: TMenuItem;
    N136: TMenuItem;
    N137: TMenuItem;
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
    N173: TMenuItem;
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
    N184: TMenuItem;
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
    N2: TMenuItem;
    N20: TMenuItem;
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
    N33: TMenuItem;
    N34: TMenuItem;
    N34_OLD: TMenuItem;
    N35: TMenuItem;
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
    N71: TMenuItem;
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
    pmemRResSendSourceBlockMarked: TMenuItem;
    pmemRResSendSourceClipboard: TMenuItem;
    pmemRResSendSourceContiguous: TMenuItem;
    pmemRResSendSourceFile: TMenuItem;
    pmemRResSendSourceSelection: TMenuItem;
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
    pmenRResContGuiStartClose: TMenuItem;
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
    R1: TMenuItem;
    ReformatRfileorselection1: TMenuItem;
    Results2: TMenuItem;
    Right1: TMenuItem;
    Right2: TMenuItem;
    Rshowhide1: TMenuItem;
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
    synEditor2DataCompletion: TSynCompletionProposal;
    synEditor2Tip: TSynCompletionProposal;
    synEditorDataCompletion: TSynCompletionProposal;
    synEditorTip: TSynCompletionProposal;
    synEditPrint: TSynEditPrint;
    SynEditSearch: TSynEditSearch;
    synExporterHtml: TSynExporterHtml;
    synExporterRtf: TSynExporterRtf;
    synExporterTeX: TSynExporterTeX;
    synIODataCompletion: TSynCompletionProposal;
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
    TBItem29: TTBItem;
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
    TBItem47: TTBItem;
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
    TBRSendSourceBlockMarked: TTBItem;
    TBRSendSourceSelection: TTBItem;
    TBRSetWorkDir: TTBItem;
    tbSave: TToolButton;
    tbSaveAll: TToolButton;
    TBSConvertion: TTBSubmenuItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem10: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBSeparatorItem15: TTBSeparatorItem;
    TBSeparatorItem16: TTBSeparatorItem;
    TBSeparatorItem17: TTBSeparatorItem;
    TBSeparatorItem18: TTBSeparatorItem;
    TBSeparatorItem19: TTBSeparatorItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSeparatorItem20: TTBSeparatorItem;
    TBSeparatorItem21: TTBSeparatorItem;
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
    UpperCaseSelection1: TMenuItem;
    Uppercaseselection2: TMenuItem;
    UppercaseWord1: TMenuItem;
    Uppercaseword2: TMenuItem;
    VimRplugin1: TMenuItem;
    Wikipedia1: TMenuItem;
    Windowsexplorer1: TMenuItem;
    Wordwrap1: TMenuItem;
    Workexpl1: TMenuItem;
    xt1: TMenuItem;
    zipKit: TAbZipKit;
    actHexViewerVisible: TAction;
    Hewviewershowhide1: TMenuItem;
    actNotification: TAction;
    actNotification_US: TAction;
    N199: TMenuItem;
    Enablenotification1: TMenuItem;
    Updatesilently1: TMenuItem;
    actRtermAutoHide: TAction;
    actToolsAutoHide: TAction;
    Rtermautohideonoff1: TMenuItem;
    Rtermautohideonoff2: TMenuItem;
    N200: TMenuItem;

    procedure actAboutExecute(Sender: TObject);
    procedure actANSIExecute(Sender: TObject);
    procedure actAplicationExitExecute(Sender: TObject);
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
    procedure actMacroPlayExecute(Sender: TObject);
    procedure actMacroRecordExecute(Sender: TObject);
    procedure actMarkupVisibleExecute(Sender: TObject);
    procedure actMatchBracketExecute(Sender: TObject);
    procedure actMiscVisibleExecute(Sender: TObject);
    procedure actNormalSelectExecute(Sender: TObject);
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
    procedure actRContGuiStartCloseExecute(Sender: TObject);
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
    procedure actFormatRExecute(Sender: TObject);
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
    procedure actRSendSourceBlockMarkedExecute(Sender: TObject);
    procedure actRSendSourceClipboardExecute(Sender: TObject);
    procedure actRSendSourceContiguousExecute(Sender: TObject);
    procedure actRSendSourceFileExecute(Sender: TObject);
    procedure actRSendSourceSelectionExecute(Sender: TObject);
    procedure actRSendSweaveExecute(Sender: TObject);
    procedure actRSimpleDefaultExecute(Sender: TObject);
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
    procedure actRtermSetIOSyntaxToRExecute(Sender: TObject);
    procedure actRtermSetIOSyntaxToTextExecute(Sender: TObject);
    procedure actRtermSetLOGSyntaxToRExecute(Sender: TObject);
    procedure actRtermSetLOGSyntaxToTextExecute(Sender: TObject);
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
    procedure menChaLinEndMACClick(Sender: TObject);
    procedure menChaLinEndUNIXClick(Sender: TObject);
    procedure menChaLinEndWINClick(Sender: TObject);
    procedure menEncConANSIClick(Sender: TObject);
    procedure menEncConUTF16BEClick(Sender: TObject);
    procedure menEncConUTF16LEClick(Sender: TObject);
    procedure menEncConUTF8Click(Sender: TObject);
    procedure menFileTemplateRdocDatasetClick(Sender: TObject);
    procedure menFileTemplateRdocEmptyClick(Sender: TObject);
    procedure menFileTemplateRdocFunctionClick(Sender: TObject);
    procedure menFileTemplateRhtmlClick(Sender: TObject);
    procedure menFileTemplateRmarkdownClick(Sender: TObject);
    procedure menFileTemplateRscriptClick(Sender: TObject);
    procedure menFileTemplateRsweaveClick(Sender: TObject);
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
    procedure menHelpStatJournalStatisticalSoftwareClick(Sender: TObject);
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
    procedure menWebRguiJGRClick(Sender: TObject);
    procedure menWebRguiProjectsClick(Sender: TObject);
    procedure menWebRguiRComanderClick(Sender: TObject);
    procedure menWebRguiRpadClick(Sender: TObject);
    procedure menWebRGuiRStudioClick(Sender: TObject);
    procedure menWebRguiSciViewsClick(Sender: TObject);
    procedure menWebRGuiTinnRLECClick(Sender: TObject);
    procedure menWebRguiTinnRSciViewsClick(Sender: TObject);
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
    procedure menWebSSearchMaillingClick(Sender: TObject);
    procedure menWebSSearchSelArchivesClick(Sender: TObject);
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
    procedure pmemRResSendSourceBlockMarkedClick(Sender: TObject);
    procedure pmemRResSendSourceClipboardClick(Sender: TObject);
    procedure pmemRResSendSourceContiguousClick(Sender: TObject);
    procedure pmemRResSendSourceFileClick(Sender: TObject);
    procedure pmemRResSendSourceSelectionClick(Sender: TObject);
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
    procedure pmenRResContGuiStartCloseClick(Sender: TObject);
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
    procedure synEditorDataCompletionCodeCompletion(Sender: TObject; var Value: string; Shift: TShiftState; Index: Integer;  EndToken: Char);
    procedure synEditorDataCompletionExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: WideString; var x, y: Integer; var CanExecute:  Boolean);
    procedure synIOClick(Sender: TObject);
    procedure synIOEnter(Sender: TObject);
    procedure synMRStateChange(Sender: TObject);
    procedure synPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
    procedure synRtipExecute(Kind: SynCompletionType; Sender: TObject; var CurrentInput: WideString; var x, y: Integer; var CanExecute: Boolean);
    procedure tbFilterClick(Sender: TObject);
    procedure tbiPandocClick(Sender: TObject);
    procedure tbReloadClick(Sender: TObject);
    procedure TBRMainMove(Sender: TObject);
    procedure tRRuningTimer(Sender: TObject);
    procedure tUpdateOptionsTimer(Sender: TObject);
    procedure VimRplugin1Click(Sender: TObject);
    procedure actHexViewerVisibleExecute(Sender: TObject);
    procedure actNotificationExecute(Sender: TObject);
    procedure actNotification_USExecute(Sender: TObject);
    procedure pgFilesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure pgFilesMouseLeave(Sender: TObject);
    procedure actRtermAutoHideExecute(Sender: TObject);
    procedure actToolsAutoHideExecute(Sender: TObject);

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
    bRestored                      : boolean;
    bRestoreIniDock                : boolean;
    bRsetget_Info                  : boolean;
    bRKnitr                        : boolean;
    bRmirros_Update                : boolean;
    bRRequireKnitr                 : boolean;
    bRSendAll                      : boolean;
    bRSetWorkDir_Starting          : boolean;
    bRSmartSend                    : boolean;
    bRsvSocket_Connect             : boolean;  // Variáveis de controle do TinnRcom e dependências
    bRtermCanFloat                 : boolean;
    bRtermCloseWithoutAsk          : boolean;
    bRtermHorizontal               : boolean;  // IO disposition for IO and Log in the same view
    bRtermOptionCancel             : boolean;
    bRtermSimple                   : boolean;  // IO and Log in the same view
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
    bStartOptionsWithProcessingPage: boolean;
    bStartOptionsWithRPage         : boolean;
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
    iIOSyntax                      : integer;
    iLastFile                      : integer;
    iLastSearch                    : integer;
    iLatexDimensionalElement       : integer;
    iLogSyntax                     : integer;
    iMaxDeparseLength              : integer;
    iReformatRSplit                : integer;
    iRFormatted                    : integer;
    iRguiTinnRDisposition          : integer;
    iRguiTinnRProportion           : integer;
    iRows                          : integer;
    iTimerCounter                  : integer;
    iViewStyleRExplorer            : integer;
    mrTinnRcom_Install             : TModalResult;
    msHexViewer                    : TMemoryStream;
    rsSearch                       : TRegExpr;
    sAppData                       : string;
    sCurrentVersion_Cache          : string;
    sCurrentVersion_Comments       : string;
    sCurrentVersion_Completion     : string;
    sCurrentVersion_Latex          : string;
    sCurrentVersion_Project        : string;
    sCurrentVersion_Rcard          : string;
    sCurrentVersion_Rmirrors       : string;
    sCurrentVersion_Shortcuts      : string;
    sCurrentVersion_TinnRcom       : string;
    sDataCompletion                : string;
    sEncodingDefault               : string;
    sFileLatexOrigin               : string;
    sFileProjectOrigin             : string;
    sGuiRRunning                   : string;
    sIniDockFilePath               : string;
    slFileMRU                      : TStringList;
    slProject                      : TStringList;
    slProjectChanges               : TStringList;
    slprojectMRU                   : TStringList;
    slRLibPaths                    : TStringList;
    slTextDiff                     : TStringList;
    sOldPreferencesTmp             : string;
    sParDeplate                    : string;
    sParDviBibtex                  : string;
    sParDviSingle                  : string;
    sParPdfBibtex                  : string;
    sParPdfSingle                  : string;
    sParRgui                       : string;
    sParRterm                      : string;
    sParTxt2tags                   : string;
    sPath_Pandoc                   : string;
    sPathBkp                       : string;
    sPathDeplate_Converter         : string;
    sPathDeplate_Interpreter       : string;
    sPathEditor                    : string;
    sPathIni                       : string;
    sPathIniEditor_Tmp             : string;
    sPathIniTinn_Tmp               : string;
    sPathLatex                     : string;
    sPathProject                   : string;
    sPathR                         : string;
    sPathR_Connected               : string;
    sPathRgui                      : string;
    sPathRterm                     : string;
    sPathTinnRcom_Installed        : string;
    sPathTxt2tags_Converter        : string;
    sPathTxt2tags_Interpreter      : string;
    sProjectName                   : string;
    sformatR                       : string;
    sformatRd                      : string;
    sRIOSaved                      : string;
    sRLogSaved                     : string;
    sSearchDirHistory              : string;
    sSearchFileMaskHistory         : string;
    sTipFromRServer                : string;
    sTriggerRDataCompletion        : string;
    sTriggerRtip                   : string;
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

    function ActivePanel: integer;
    function CheckConnection: boolean;
    function CloseAllFilesOfProject: boolean;
    function FileExistsAsNode(var iPos: integer; sFile: string): boolean;
    function FindWindowByName(sName: string): integer;
    function FindWord: string;
    function GenericGroupExists: boolean;
    function GetBlockMarked(var bSingleLine: boolean): string;
    function GetClipboard(var bSingleLine: boolean): string;
    function GetContiguous(var bSingleLine: boolean): string;
    function GetCursorTo(sWay: string): string;
    function GetEncodingDefault: string;
    function GetFile(var bSingleLine: boolean): string;
    function GetFileToReformat: string;
    function GetFocus: integer;
    function GetLine(bGoToNextValidLine: boolean): string;
    function GetLinesToEndPage(var bSingleLine: boolean): string;
    function GetPathFile(bFull: boolean = False): string;
    function GetSaveFormat(usTmp: TUnicodeStrings): string;
    function GetSelection(var bSingleLine: boolean): string;
    function GetSelectionToReformat(sSel: string): string;
    function GroupExistsAsNode(sGroupName: string): boolean;
    function MessageDlg(const sMsg: string; mdType: TMsgDlgType; mdButtons: TMsgDlgButtons; iHelp: Integer): Integer;
    function RWorkDir: string;
    function SingleLine(sTmp: string): boolean;
    function StripRegExPower(sSearchText: string): string;
    procedure AddFile(iFile: string);
    procedure BackupSystemConfiguration(bStarting: boolean);
    procedure BuildMRU(var miItem: TMenuItem);
    procedure BuildProjectMRU(var miItem: TMenuItem);
    procedure CheckData;
    procedure CheckEditorOptions;
    procedure CheckIfProjectWasChanged;
    procedure CheckIni;
    procedure CheckIniDock;
    procedure CheckLatex(bReload: boolean);
    procedure CheckOrigin;
    procedure CheckProcessingPath(sPath: string);
    procedure CheckProject;
    procedure CheckTemporary;
    procedure RSetGet_Info;
    procedure CheckTop;
    procedure CheckVersion;
    procedure ClearStatusBarProject;
    procedure CloseAllFilesOfGroup;
    procedure CompileLaTeX(sMikPar, sBibPar, sExtension: string; bWait: boolean);
    procedure ControlResources(bOption: boolean);
    procedure CreateGroup(sGroupName: string);
    procedure CreateProject;
    procedure DatasetToActionList(Sender: TObject);
    procedure DoClearConsole;
    procedure DoIPConnection(sIPHost: string; iIPPort: integer; bActive: boolean);
    procedure DoTxt2Tag(iButton: integer);
    procedure FileConversion(sParameter, sExtension, sPathConversor: string; sPathInterpreter: string = ''; bWait: boolean = True);
    procedure FileSaveGeneric(sFile: string; synEditor: TSynEdit);
    procedure GetCallTip(var sRObject, sRPackage, sRTip: string; var bTipFound: boolean);
    procedure GetComments;
    procedure GetCompletion(var sRObject, sRPackage, sCompletion: string);
    procedure GetTinnRcom_Info;
    procedure InsertLatexMath(sFunction: string; iCaretControl: integer);
    procedure LoadEditorKeystrokes;
    procedure MakeItem(sRObjName, sRObjDim, sRObjGroup, sRObjClass: string; iIndex: integer);
    procedure MakeRenvironment(slRObjects: TStringList);
    procedure MakeTemplate(sFile: string);
    procedure MakeTree(sRObjName, sRObjDim, sRObjGroup, sRObjClass: string);
    procedure MakeTreeRExplorer_TmpFile(slRObjects: TStringList);
    procedure MatchBracket(seActive: TSynEdit);
    procedure MySort(iSort: integer);
    procedure OnTop(hHandle: HWND);
    procedure OpenFileWithViewer(sFilter, sDefaultExt: string);
    procedure OpenHelpFile(sFileToOpen: string);
    procedure OpenProject;
    procedure OpenProjectIntoTinn(sProjectName: string);
    procedure PandocConversion(sPandocInstruction, sPandocFrom, sPandocTo: string; bWait: boolean = True);
    procedure RecentProjectFileClick(Sender: TObject);
    procedure RecordActions(baAction: TBasicAction; var bHandled: Boolean);
    procedure RemoveLine_Commented(var sTmp: string);
    procedure RemoveLine_Empty(var sTmp: string);
    procedure RMenu(bOption: boolean);
    procedure RmirrorsInterface_Update;
    procedure RToolbar(bOption: boolean);
    procedure SaveEditorKeystrokes;
    procedure SaveNewIni_Application;
    procedure SaveNewIni_Editor;
    procedure SavePreferencesOfOldVersion;
    procedure SaveProject;
    procedure SearchInDirectories(const sDir, sMask: string; var iFileCount, iMatchCount, iTotFileCount: integer);
    procedure SearchInOpenFiles(var iFileCount, iMatchCount: integer);
    procedure SendResources(bOption: boolean);
    procedure SetBuffer_FileFormat(ff: TSynEditFileFormat);
    procedure SetBuffer_SaveFormat(sf: TSaveFormat);
    procedure SetCompletion;
    procedure SetEncodingDefault(sTmp: string);
    procedure SetIniStructure;
    procedure SetInterfaceSize(frm: TForm; iSize: integer);
    procedure SetPreferences_Application;
    procedure SetPreferences_Editor;
    procedure SetRcard;
    procedure SetRExplorer(bOption: boolean);
    procedure SetRmirrors;
    procedure SetShortcuts;
    procedure SetupSearchParameters(sSearchText: string);
    procedure SortProject;
    procedure StartSocketServer_svSocket;
    procedure TabMenuPopup(pcTmp: TPageControl; X, Y: Integer);
    procedure TinnRcomInstall_AskUser(bMessageDlg: boolean = True);
    procedure ToolsProjectControls(bOption: boolean);
    procedure ToolsSearchControls(bOption: boolean);
    procedure TraverseDir(sPath: string; var tsFileList: TStringList; sMask: string);
    procedure UdatePgFiles;
    procedure UnpackFile(sFile, sPath, sChoice: string);
    procedure UpdateBars(bOption: boolean);
    procedure UpdateCloseFileOptions;
    procedure UpdateFile(var seEditor: TSynEdit; var smOption: TSynSelectionMode);
    procedure UpdateFileIntoTinn(sFile: string; iLineNumberJump: integer = 0);
    procedure UpdateOptions;
    procedure UpdateProjectMRU(var miItem: TMenuItem; sFileName: string);
    procedure UpdateRFileReformatted(Stmp: string);
    procedure UpdateRSelectionReformatted(Stmp: string);
    Procedure UpdateRterm_Appearance(bUpdate_FontSize: boolean = True);
    procedure WMCopyData(var msg: TWMCopyData); message WM_COPYDATA;
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WriteIniFile_Application(bMakingBackup: boolean);
    procedure WriteIniFile_Editor(bMakingBackup: boolean);

  public
    { Public declarations }
    ajavHK                    : array[1..20] of TJvApplicationHotKey;  // R Hotkeys
    ajavHKC                   : array[1..20] of TJvApplicationHotKey;  // R Hotkeys Custom
    aRC                       : array[1..20] of string;                // R Custom
    bActiveLine               : boolean;
    bAllNames                 : boolean;
    bbBOM                     : boolean;
    bCloseCanceled            : boolean;
    bConnectionBeepOnError    : boolean;
    bDatabaseRestored         : boolean;
    bEditorLineWrap           : boolean;
    bIPLocal                  : boolean;  // It controls the type of TCPIP connection: False: Remote, True: Local
    bIPRemoteConnected        : boolean;
    bPrintColors              : boolean;
    bPrintFileName            : boolean;
    bPrintLineNumber          : boolean;
    bPrintLineWrap            : boolean;
    bPrintPageNumber          : boolean;
    bPrintSyntaxColor         : boolean;
    bProjectChanged           : boolean;
    bRArchitecture64          : boolean;
    bRAsServer                : boolean;
    bRememberFileState        : boolean;
    bRememberSearchList       : boolean;
    bRemoveExtension          : boolean;
    bRguiReturnFocus          : boolean;
    bRTCPIPConsoleEcho        : boolean;
    bRTCPIPConsoleUse         : boolean;
    bRtermBeepOnError         : boolean;
    bRtermFindError           : boolean;
    bRtermWidth               : boolean;
    bSearchBackwards          : boolean;
    bSearchCaseSensitive      : boolean;
    bSearchFromCursor         : boolean;
    bSearchRegExp             : boolean;
    bSearchWholeWords         : boolean;
    bselectedToPreview        : boolean;
    bTinnRHotKeysActive       : boolean;
    bUndoAfterSave            : boolean;
    clActiveLine              : TColor;
    clBGApplication           : TColor;
    clBGForAllHighlighters    : TColor;
    clBGPreferred             : TColor;
    clBGTabSelectedNew        : TColor;
    clBrackets                : TColor;
    clFGApplication           : TColor;
    coEditor                  : TSynEditorOC;
    hRgui                     : HWND;
    iAlphaBlendValue          : integer;
    iCommentsBeforeChanges    : integer;
    iCompletionBeforeChanges  : integer;
    iCompletionFilter         : integer;
    iCountriesFilter          : integer;
    iDelay                    : integer;
    iDragLevel                : integer;
    iFileCount                : integer;
    iFilterToSaveAs           : integer;
    iIPPortLocal              : integer;
    iIPPortRemote             : integer;
    iLatexDimensionalAlign    : integer;
    iPandocFrom               : integer;
    iPandocTo                 : integer;
    iProjecSelected           : integer;
    iRcardBeforeChanges       : integer;
    iRcardFilter              : integer;
    iRguiRecognitionCaption   : integer;
    iRguiRecognitionType      : integer;
    iRmirrorsBeforeChanges    : integer;
    iRtipBeforeChanges        : integer;
    iRtipFilter               : integer;
    iScaleMode                : integer;
    iShortcutsBeforeChanges   : integer;
    iShortcutsFilter          : integer;
    iSynWithFocus             : integer;
    iTransparency             : integer;
    iZoomPreview              : integer;
    RHistory                  : TRHistory;
    sAppSelected              : string;
    sBeginComment             : string;
    sCommentsBookMark         : string;
    sCompletionBookMark       : string;
    sDragSource               : string;
    sDragSourceLine           : string;
    seeEncoding               : TSynEncoding;
    seeEncoding_NewFile       : TSynEncoding;
    sefDefault                : TSaveFormat;
    sEndComment               : string;
    sFileDataOrigin           : string;
    sFileExtensions           : string;
    sIPHostLocal              : string;
    sIPHostRemote             : string;
    slFilters                 : TStringList;
    sLineComment              : string;
    sPandocHistory            : string;
    sPandocHistoryFrom        : string;
    sPandocHistoryTo          : string;
    sPathApp                  : string;
    sPathColor                : string;
    sPathColor_Custom         : string;
    sPathData                 : string;
    sPathIniEditor_File       : string;
    sPathIniTinn_File         : string;
    sPathSyntax               : string;
    sPathSyntaxBKP            : string;
    sPathTinnR                : string;
    sPathTinnRcom             : string;
    sPathTmp                  : string;
    sRcardBookMark            : string;
    sRmirror                  : string;
    sRmirrorsBookMark         : string;
    sRtipBookMark             : string;
    sRversion                 : string;
    sSaveAsFileExt            : string;
    sSearchTextHistory        : string;
    sShortcutsInUse           : string;
    sTipToWrite               : string;
    sUtilsOrigin              : string;
    sWorkingDir               : string;
    slFileNotify              : TStringList;
    //iRtermSize                : integer;

    function FindTopWindow: integer;
    function GetBuildInfo: string;
    function Rgui_Running: boolean;
    function Rterm_Running: boolean;
    function UseTCPIP: boolean;
    function ValidRRunning: boolean;
    procedure AppActivate(Sender: TObject);
    procedure CheckIfFileFromDvi(sFile: string);
    procedure CheckRterm;
    procedure ClearMRU;
    procedure ClearStatusBar;
    procedure DefaultHandler(var message); override;
    procedure DoRConnection(sTmp: string; bActive, bSendTask: boolean);
    procedure DoRguiConnection(sTmp: string; bActive: boolean);
    procedure DoSend(var sTmp: string; bSendToSynIO: boolean = True);
    procedure DrawSelectionMode(iSelMode: integer);
    procedure GetFile_Info(sFileName: string; usTmp: TUnicodeStrings; bConverting: boolean = False);
    procedure InsertLatexSymbol(sSymbol: string; iCaretControl: integer);
    procedure LoadFile(sFileName: string; bCreateNewChild: boolean = True; bUpdateMRU: boolean = True);
    procedure MinimizeTinnAfterLastFile;
    procedure OpenAllFiles;
    procedure OpenAllFilesOfGroup;
    procedure OpenFileFromSearch;
    procedure OpenFileIntoTinn(sFile: string; iLineNumberJump: integer = 0; bOpenProjetcText: boolean = False; bUpdateMRU: boolean = True);
    procedure OpenUserGuidePDF(sWhere: string);
    procedure PrintMessage(sInstruction: string; bNewLine: boolean; sSignal: string = '> ');
    procedure RemoveTab(sTabCaption: string);
    procedure SendRCustom(sRC: string);
    procedure SendToConsole(sTmp: string);
    procedure SetFileSize_StatusBar(sFileName: string);
    procedure SetFocus_Main;
    procedure SetFocus_Rgui(iDelay: integer);
    procedure SetPathRgui;
    procedure SetPathRTerm;
    procedure SetSyntaxComboBox(sSynName: string);
    procedure SetSyntaxMenuItem(sSynName: string);
    procedure SetTabTitle(sStat: string);
    procedure SetToolbarProcessing(sFileExtension: string);
    procedure UpdateAppearance(bFontSize: boolean = True);
    procedure UpdateCursorPos(Sender: TSynEdit);
    procedure UpdateHexViewer;
    procedure UpdateMRU(var miItem: TMenuItem; sFileName: string);


end;

var
  frmTinnMain: TfrmTinnMain;

implementation

uses
  StrUtils,
  trCodeSender,
  trUtils,
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
  ufrmRmirrors;

{$R *.DFM}

(*
----------------------------------------------------
 SetShortcuts: It is very important for developers!
----------------------------------------------------
*)
procedure TfrmTinnMain.SetShortcuts;
begin
(*
----------------------------------------------------------------------------------------------
  Will update (from dataset shortcut.xml) all actions inside of alMain:
   1- Comment the line below (DatasetToActionList(nil)) when was done any change in the alMain;
   2- Run Tinn-R;
   3- Generate a new Dataset: Tools/Utils/Actionlist to dataset
      (This menu is visible only when compiled in debug mode and running under the IDE);
   4- Close Tinn-R;
   5- Change the version of sCurrentVersion_Shortcuts in procedure TfrmTinnMain.CheckVersion
      (It is very important to the user version be updated!);
   6- Uncomment this line newly (DatasetToActionList(nil));
   7- It is all!
----------------------------------------------------------------------------------------------
*)

(*-------------------------*)
  DatasetToActionList(nil);
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

procedure TfrmTinnMain.CheckVersion;
begin
  sVersion_Cache     := ifTinn.ReadString('App', 'sVersion_Cache'     , '0.0.0.0');
  sVersion_Comments  := ifTinn.ReadString('App', 'sVersion_Comments'  , '0.0.0.0');
  sVersion_Completion:= ifTinn.ReadString('App', 'sVersion_Completion', '0.0.0.0');
  sVersion_Ini       := ifTinn.ReadString('App', 'sVersion_Ini'       , '0.0.0.0');
  sVersion_Latex     := ifTinn.ReadString('App', 'sVersion_Latex'     , '0.0.0.0');
  sVersion_Project   := ifTinn.ReadString('App', 'sVersion_Project'   , '0.0.0.0');
  sVersion_Rcard     := ifTinn.ReadString('App', 'sVersion_Rcard'     , '0.0.0.0');
  sVersion_Rmirrors  := ifTinn.ReadString('App', 'sVersion_Rmirrors'  , '0.0.0.0');
  sVersion_Shortcuts := ifTinn.ReadString('App', 'sVersion_Shortcuts' , '0.0.0.0');

  // Current versions
  sCurrentVersion_Cache     := '2.03.02.04';
  sCurrentVersion_Comments  := '3.00.02.01';
  sCurrentVersion_Completion:= '4.00.00.04';
  sCurrentVersion_Latex     := '2.01.01.01';
  sCurrentVersion_Project   := '4.00.03.06';
  sCurrentVersion_Rcard     := '2.03.00.00';
  sCurrentVersion_Rmirrors  := '4.00.03.04';
  sCurrentVersion_Shortcuts := '4.00.03.06';
  sCurrentVersion_TinnRcom  := '1.0.18';  // Released joinly with Tinn-R setup program

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

  // Rmirrors
  if (AnsiCompareStr(sVersion_Rmirrors,
                     sCurrentVersion_Rmirrors) < 0) then begin
    bUpdate_Rmirrors := True;
    sVersion_Rmirrors:= sCurrentVersion_Rmirrors;
  end;

  // Shortcuts
  if (AnsiCompareStr(sVersion_Shortcuts,
                     sCurrentVersion_Shortcuts) < 0) then begin
    sVersion_Shortcuts:= sCurrentVersion_Shortcuts;
    if FileExists(sPathData +
                  '\Shortcuts.xml') then
      bUpdate_Shortcuts:= True;
  end;

  // SynUnihighlighter: It was removed from the project!
  if DirectoryExists(sPathIni +
                     '\unihighlighter') then DeleteDir(sPathIni +
                                                       '\unihighlighter');
  // It was removed from the project!
  if DirectoryExists(sPathIni +
                     '\editor shortcuts') then DeleteDir(sPathIni +
                                                         '\editor shortcuts');
end;

// SynEdit_UNICODE
procedure TfrmTinnMain.synPaintTransient(Sender: TObject;
                                         Canvas: TCanvas;
                                         TransientType: TTransientType);
var
  seEditor: TSynEdit;

  aOpenChar,
   aCloseChar: Array of WideChar;

  Attri: TSynHighlighterAttributes;

  procedure SetCanvasFont;
  begin
    seEditor.Canvas.Font.Assign(seEditor.Font);
    seEditor.Canvas.Font.Style:= Attri.Style;

    if (TransientType = ttAfter) then begin  // Occur just when FIND a symbol (going to right/up or left/down)
      if (Attri.Foreground = clRed) then
        with seEditor.Canvas.Font do begin
          Style:= [fsBold];
          Color:= ContrastColor(Attri.Foreground)
        end
        else
          with seEditor.Canvas.Font do begin
            Style:= [fsBold];
            Color:= clBrackets;
          end;

     {
      with seEditor.Canvas.Font do begin  // Users request me more visual definition
        Style:= [fsBold];
        if Color:= ContrastColor(clActiveLine);
      end;
     }

      if bActiveLine then seEditor.Canvas.Brush.Color:= clActiveLine
                     else seEditor.Canvas.Brush.Color:= Attri.Background;
    end
    else begin  // Occur just when LEAVE from a symbol (going to right/up or left/down)
      seEditor.Canvas.Font.Color:= Attri.Foreground;
      if bActiveLine then seEditor.Canvas.Brush.Color:= clActiveLine
                     else seEditor.Canvas.Brush.Color:= Attri.Background;
    end;
  end;

  function CharToPixels(BC: TBufferCoord): TPoint;
  begin
    Result:= seEditor.RowColumnToPixels(seEditor.BufferToDisplayPos(BC));
  end;

var
  bcP,
   bcMatchBracketPos: TBufferCoord;
  wcCharA,
   wcCharB          : WideChar;
  i,
   iArrayLength     : integer;
  pP                : TPoint;
  sTmp              : WideString;

const
  AllBrackets = ['{',
                 '[',
                 '(',
                 '<',
                 '}',
                 ']',
                 ')',
                 '>'];

begin
  seEditor:= TSynEdit(Sender);
  if TSynEdit(Sender).SelAvail then Exit;
  iArrayLength:= 4;

  SetLength(aOpenChar,
            iArrayLength);

  SetLength(aCloseChar,
            iArrayLength);

  for i:= 0 to (iArrayLength - 1) do
    case i of
      0: begin
           aOpenChar[i] := '(';
           aCloseChar[i]:= ')';
         end;
      1: begin
           aOpenChar[i] := '{';
           aCloseChar[i]:= '}';
         end;
      2: begin
           aOpenChar[i] := '[';
           aCloseChar[i]:= ']';
         end;
      3: begin
           aOpenChar[i] := '<';
           aCloseChar[i]:= '>';
         end;
    end;

  bcP:= seEditor.CaretXY;

  if (seEditor.CaretXY.Line <= seEditor.Lines.Count) and
     ((seEditor.CaretXY.Char - 1) <= Length(seEditor.Lines[seEditor.CaretXY.Line - 1])) and
     (Length(seEditor.Lines[seEditor.CaretXY.Line - 1]) > 0) then wcCharA:= seEditor.Lines[seEditor.CaretXY.Line - 1][seEditor.CaretXY.Char-1]
  else wcCharA:= #0;

  if (seEditor.CaretXY.Line <= seEditor.Lines.Count) and
     ((seEditor.CaretXY.Char - 1) <= Length(seEditor.Lines[seEditor.CaretXY.Line - 1])) and
     (Length(seEditor.Lines[seEditor.CaretXY.Line - 1]) > 0) then wcCharB:= seEditor.Lines[seEditor.CaretXY.Line - 1][seEditor.CaretXY.Char]
  else wcCharB:= #0;

  if not(CharInSet(wcCharA, AllBrackets)) and
     not(CharInSet(wcCharB, AllBrackets)) then Exit;

  sTmp:= wcCharB;
  if not(CharInSet(wcCharB, AllBrackets)) then begin
    bcP.Char:= bcP.Char - 1;
    sTmp:= wcCharA;
  end;

  seEditor.GetHighlighterAttriAtRowCol(bcP,
                                       sTmp,
                                       Attri);

  if (seEditor.Highlighter.SymbolAttribute = Attri) then begin
    for i:= low(aOpenChar) to High(aOpenChar) do begin
      if (sTmp = aOpenChar[i]) or
         (sTmp = aCloseChar[i]) then begin
        pP:= CharToPixels(bcP);

        if (pP.X < TMySynEdit(seEditor).Gutter.Width) then Exit;

        SetCanvasFont;
        seEditor.Canvas.TextOut(pP.X,
                                pP.Y,
                                sTmp);

        bcMatchBracketPos:= seEditor.GetMatchingBracketEx(bcP);

        if (bcMatchBracketPos.Line = 0) or
           (bcMatchBracketPos.Char = 0) then Exit;

        {
        if (seEditor.CaretY = bcMatchBracketPos.Line) then begin
          if bActiveLine then seEditor.Canvas.Brush.Color:= clActiveLine;
        end
        else seEditor.Canvas.Brush.Color:= Attri.Background;
        }

        if (bcP.Char > 0) and
           (bcP.Line > 0) then begin
          pP:= CharToPixels(bcMatchBracketPos);

          if (pP.X > TMySynEdit(seEditor).Gutter.Width) then begin
            SetCanvasFont;

            if (sTmp = aOpenChar[i]) then
              with seEditor do
                Canvas.TextOut(pP.X,
                               pP.Y,
                               aCloseChar[i])
            else
              with seEditor do
                Canvas.TextOut(pP.X,
                               pP.Y,
                               aOpenChar[i]);
          end;
        end;  // if (bcP.Char > 0)
      end;  // if (sTmp = aOpenChar[i])
    end;  // for i:= low(aOpenChar) to High(aOpenChar)
  end;  // if (seEditor.Highlighter.SymbolAttribute = Attri)
end;

procedure TfrmTinnMain.OpenFileIntoTinn(sFile: string;
                                        iLineNumberJump: integer = 0;
                                        bOpenProjetcText: boolean = False;
                                        bUpdateMRU: boolean = True);
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
   sFileExt: string;

  userOption: TModalResult;

  cTmp: char;

  IdHTTP: TIdHTTP;

begin
  // Check if sFile is a valid url
  // If yes will open the url content
  if IsURL(sFile) then begin
    IdHTTP:= TIdHTTP.Create;
    try
      try
        if (CheckConnection = False) then Exit;

        sTmp:= IdHTTP.Get(sFile);

        actFileNewExecute(nil);

        sFileExt:= ExtractFileExt(sFile);

        i:= FindTopWindow;
        with (Self.MDIChildren[i] as TfrmEditor) do begin
          synEditor.Text:= sTmp;
          synEditor.Modified:= True;
          SetHighlighterFromFileExt(sFileExt);
        end;

        with pgFiles.ActivePage do
          Tag:= (Self.MDIChildren[i] as TfrmEditor).SetHighlighterID;
      except
        // this exception class covers the HTTP protocol errors; you may read the
        // response code using ErrorCode property of the exception object, or the
        // same you can read from the ResponseCode property of the TIdHTTP object
        on E: EIdHTTPProtocolException do
          ShowMessage('Indy raised a protocol error!' + sLineBreak +
                      'HTTP status code: ' + IntToStr(E.ErrorCode) + sLineBreak +
                      'Error message' + E.Message);

        // this exception class covers the cases when the server side closes the
        // connection with a client in a "peaceful" way
        on E: EIdConnClosedGracefully do
          ShowMessage('Indy reports, that connection was closed gracefully!');

        // this exception class covers all the low level socket exceptions
        on E: EIdSocketError do
          ShowMessage('Indy raised a socket error!' + sLineBreak +
                      'Error code: ' + IntToStr(E.LastError) + sLineBreak +
                      'Error message' + E.Message);

        // this exception class covers all exceptions thrown by Indy library
        on E: EIdException do
          ShowMessage('Indy raised an exception!' + sLineBreak +
                      'Exception class: ' + E.ClassName + sLineBreak +
                      'Error message: ' + E.Message);

        // this exception class is a base Delphi exception class and covers here
        // all exceptions different from those listed above
        on E: Exception do
          ShowMessage('A non-Indy related exception has been raised!');
      end;
    finally
        IdHTTP.Free;
    end;
    sWorkingDir:= EmptyStr;
    UpdateHexViewer;
    Exit;
  end;

  // Check if is *.tps file, if yes, open it in the project interface
  sFileExt:= lowerCase(ExtractFileExt(sFile));

  if (sFileExt = '.tps') then begin
    frmTools.pgTools.ActivePage:= frmTools.tbsMisc;
    frmTools.pgMisc.ActivePage := frmTools.tbsProject;

    CheckIfProjectWasChanged;
    Application.ProcessMessages;

    sProjectName:= sFile;
    // Bring to front the textual project, if it is opened
    i:= FindWindowByName(sProjectName);

    if (i > -1) then Self.MDIChildren[i].BringToFront;

    OpenProjectIntoTinn(sProjectName);
    Application.ProcessMessages;

    if not bOpenProjetcText then Exit;  // The textual project file (*.tps) will not be opened!
  end;

  ControlResources(False);

  // Init of the variables
  bLoadFileFromDisk        := True;
  bOverwriteCurrentContents:= False;

  // Check to see if the file is already opened
  sTmp:= sFile;

  i:= FindWindowByName(sTmp);
  if (i > -1) then begin  // if the file is already open, bring it to the front
    // !! removed, done in activate and btw, do not change if user set it manually
    if bUpdateMRU then UpdateMRU(menFileRecentFiles,
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
      userOption:= MessageDlg('The file was changed.' + #13 +
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
      if ((Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor.Modified = False) then LoadFile(sTmp,
                                                                                                    False,
                                                                                                    bUpdateMRU)
                                                                                      else LoadFile(sTmp,
                                                                                                    True,
                                                                                                    bUpdateMRU);
    end
    else LoadFile(sTmp,
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

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

    with seEditor do begin
      TopLine:= iLineNumberJump;

      ExecuteCommand(ecGotoXY,
                     'A',
                     @iLineNumber);
    end;
  end;

  i:= FindTopWindow;
  synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;

  (Self.MDIChildren[i] as TfrmEditor).CheckSaveStatus;

  if bRememberFileState then
    // Load file state from Cache.xml
    if modDados.LoadFileState(sFile,
                              sMarks,
                              iTopLine,
                              iCaretX,
                              iCaretY) then begin
      // Restore all marks
      if (sMarks <> EmptyStr) then begin
        slTmp1:= TStringList.Create;
        StrSplit(' ',
                 sMarks,
                 slTmp1);

        if (slTmp1.Count >= 0) then
          for j:= 0 to (slTmp1.Count - 1) do begin
            slTmp2:= TStringList.Create;
            StrSplit(':',
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

procedure TfrmTinnMain.UpdateFileIntoTinn(sFile: string;
                                          iLineNumberJump: integer = 0);
var
  bFileExists,
   bLoadFileFromDisk,
   bOverwriteCurrentContents: boolean;

  i,
   j         : integer;
  pLineNumber: TPoint;
  seEditor   : TSynEdit;
  slNewFile  : TUnicodeStringList;
  sTmp       : string;

begin
  ControlResources(False);

  // Init of the variables
  bLoadFileFromDisk        := True;
  bOverwriteCurrentContents:= False;

  // Check to see if the file is already opened
  sTmp:= sFile;
  i:= FindWindowByName(sTmp);
  if (i > -1) then begin// If the file is already open, bring it to the front
    // !! Removed, done in activate and btw, do not change if user set it manually
    UpdateMRU(menFileRecentFiles,
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
      if ((Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor.Modified = False) then LoadFile(sTmp,
                                                                                                    False)
                                                                                      else LoadFile(sTmp,
                                                                                                    True);
    end
    else LoadFile(sTmp,
                  not bOverwriteCurrentContents); // Boolean added
  end;

  if (iLineNumberJump > 0) then begin
    pLineNumber.y:= iLineNumberJump;
    pLineNumber.x:= 1;
    (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor.ExecuteCommand(ecGotoXY,
                                                                             'A',
                                                                             @pLineNumber);
  end;

  i:= FindTopWindow;
  synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;
  (Self.MDIChildren[i] as TfrmEditor).CheckSaveStatus;
end;

procedure SetDataCompletion(synDataCompletion: TSynCompletionProposal;
                            editor: TSynEdit;
                            sShortCut: string);
begin
  // Don't use 'with synDataCompletion' where: because it don't works
  synDataCompletion.Editor  := editor;
  synDataCompletion.ShortCut:= TextToShortCut(sShortCut);
end;

procedure TfrmTinnMain.LoadFile(sFileName: string;
                                bCreateNewChild: boolean = True;
                                bUpdateMRU: boolean = True);
var
  sTmp       : string;
  wAttributes: word;

begin
  if bCreateNewChild then begin
    TfrmEditor.Create(Self);

    with TTabSheet.Create(Self) do begin
      PageControl:= pgFiles;
      pgFiles.ActivePageIndex:= pgFiles.PageCount -1;
    end;
  end;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    sActiveFile:= sFileName;
    sWorkingDir:= ExtractFilePath(sFileName);
    if FileExists(sFileName) then begin
      seeEncoding:= LoadFromFile(synEditor.Lines,
                                 sActiveFile,
                                 GetEncoding(sActiveFile,
                                             bbBOM),
                                 bbBOM);

      GetFile_Info(sActiveFile,
                   synEditor.Lines);

      wAttributes:= FileGetAttr(sActiveFile);

      if (((wAttributes and SysUtils.faReadOnly) = SysUtils.faReadOnly) = True) then begin
        synEditor.ReadOnly    := True;
        stbMain.Panels[3].Text:= 'Read only';
        actReadOnly.Checked   := True;
      end;

      SetFileSize_StatusBar(sActiveFile);
    end;

    synEditor.WordWrap:= actEditorLineWrap.Checked;
    if synEditor.WordWrap then synEditor.Options:= synEditor.Options - [eoTrimTrailingSpaces]
                          else synEditor.Options:= synEditor.Options + [eoTrimTrailingSpaces];

    synEditor.OnPaintTransient:= synPaintTransient;

    SetDataCompletion(synEditorTip,
                      synEditor,
                      sTriggerRtip);

    SetDataCompletion(synEditorDataCompletion,
                      synEditor,
                      sTriggerRDataCompletion);

    SetHighlighterFromFileExt(ExtractFileExt(sFileName));
    SetTitle;

    if bActiveLine then synEditor.ActiveLineColor:= TColor(clActiveLine)
                   else synEditor.ActiveLineColor:= TColor(clNone);

    synEditor.Modified:= False;
    UpdateCursorPos(synEditor);

    with synEditor do
      if CanFocus then SetFocus;

    // File notify: Start
    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= FileChanged;
    NotifyFile_Start(sFileName);
  end;

  sTmp:= StringReplace(sFileName,
                       '&',
                       '&&',
                       [rfReplaceAll]);

  pgFiles.ActivePage.Hint:= sTmp;

  if actReadOnly.Checked then pgFiles.ActivePage.Caption:= '<' +
                                                            StripPath(pgFiles.ActivePage.Hint) +
                                                            '>'
                         else pgFiles.ActivePage.Caption:= StripPath(sFileName);

  pgFiles.ActivePage.Tag:= -1;

  if bUpdateMRU then UpdateMRU(menFileRecentFiles,
                               sFileName);

  UpdateHexViewer;
end;

procedure TfrmTinnMain.SaveNewIni_Application;
var
  slSearch,
   slPandocHistory,
   slPandocHistoryFrom,
   slPandocHistoryTo  : TStringList;

  i: integer;

begin
  // Application
  if not DirectoryExists(sPathApp) then begin
    try
      CreateDir(sPathApp);
    except
      MessageDlg(sPathApp + #13 + #13 +
                 'The path above is no allowed for your system previleges.' + #13 +
                 'The necessary ".ini" files related to "Application" will not be saved!',
                 mtError,
                 [mbOk],
                 0);
      Exit;
    end;
  end;

  // Aplication
  ifTinn_Tmp      := TIniFile.create(sPathApp + '\Tinn.tmp');
  sPathIniTinn_Tmp:= (sPathApp + '\Tinn.tmp');
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
    WriteString('App', 'sVersion_Ini'       , GetBuildInfo);
    WriteString('App', 'sVersion_Latex'     , sVersion_Latex);
    WriteString('App', 'sVersion_Project'   , sVersion_Project);
    WriteString('App', 'sVersion_Rcard'     , sVersion_Rcard);
    WriteString('App', 'sVersion_Rmirrors'  , sVersion_Rmirrors);
    WriteString('App', 'sVersion_Shortcuts' , sVersion_Shortcuts);

    // Last path
    WriteString('App', 'sWorkingDir', sWorkingDir);

    // On top
    WriteBool('App', 'bAlwaysOnTop', actOnTop.Checked);

    // Max files in fileMRU
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
    WriteBool('App', 'bRtermCloseWithoutAsk', bRtermCloseWithoutAsk);
    WriteBool('App', 'bRtermHorizontal', bRtermHorizontal);
    WriteBool('App', 'bRtermSimple', bRtermSimple);
    WriteInteger('App', 'iIOSyntax', iIOSyntax);
    WriteInteger('App', 'iLogSyntax', iLogSyntax);
    WriteInteger('App', 'iSynLog2.Height', frmRterm.iSynLog2Height);
    WriteInteger('App', 'iSynLog2.Width', frmRterm.iSynLog2Width);
    WriteInteger('App', 'iRterm.Size', frmRterm.iSize);

    // Tools
    WriteBool('App', 'bToolsCanFloat', bToolsCanFloat);
    WriteInteger('App', 'iDatabase.TabIndex', frmTools.pgDatabase.TabIndex);
    WriteInteger('App', 'iLatex.TabIndex', frmTools.pgLatex.TabIndex);
    WriteInteger('App', 'iMarkup.TabIndex', frmTools.pgMarkup.TabIndex);
    WriteInteger('App', 'iMisc.TabIndex', frmTools.pgMisc.TabIndex);
    WriteInteger('App', 'iR.TabIndex', frmTools.pgR.TabIndex);
    WriteInteger('App', 'iResults.TabIndex', frmTools.pgResults.TabIndex);
    WriteInteger('App', 'iTools.TabIndex', frmTools.pgTools.TabIndex);
    WriteInteger('App', 'iTxt2tags.TabIndex', frmTools.pgTxt2tags.TabIndex);
    WriteInteger('App', 'iTools.Size', frmTools.iSize);

    // Tools visibility
    WriteBool('App', 'bDatabase.Visible', actDatabaseVisible.Checked);
    WriteBool('App', 'bDataComments.Visible', actDataCommentsVisible.Checked);
    WriteBool('App', 'bDataCompletion.Visible', actDataCompletionVisible.Checked);
    WriteBool('App', 'bDataRcard.Visible', actDataRcardVisible.Checked);
    WriteBool('App', 'bDataRmirrors.Visible', actDataRmirrorsVisible.Checked);
    WriteBool('App', 'bDataShortcuts.Visible', actDataShortcutsVisible.Checked);
    WriteBool('App', 'bIniLog.Visible', actIniLogVisible.Checked);
    WriteBool('App', 'bLatex.Visible', actLatexVisible.Checked);
    WriteBool('App', 'bMarkup.Visible', actMarkupVisible.Checked);
    WriteBool('App', 'bMisc.Visible', actMiscVisible.Checked);
    WriteBool('App', 'bProject.Visible', actProjectVisible.Checked);
    WriteBool('App', 'bR.Visible', actRVisible.Checked);
    WriteBool('App', 'bResults.Visible', actResultsVisible.Checked);
    WriteBool('App', 'bRExplorer.Visible', actRExplorerVisible.Checked);
    WriteBool('App', 'bTxt2tags.Visible', actTxt2tagsVisible.Checked);
    WriteBool('App', 'bWinExpl.Visible', actWinExplVisible.Checked);
    WriteBool('App', 'bWorkExpl.Visible', actWorkExplVisible.Checked);
    WriteBool('App', 'bHexViewer.Visible', actHexViewerVisible.Checked);
    WriteBool('App', 'bSearch.Visible', actSearchVisible.Checked);
    WriteBool('App', 'bSpell.Visible', actSpellVisible.Checked);

    // Misc
    WriteBool('App', 'bActiveLine', bActiveLine);
    WriteBool('App', 'bAllNames', bAllNames);
    WriteBool('App', 'bCloseDVIViewer', actCloseDVIViewer.Checked);
    WriteBool('App', 'bClosePDFViewer', actClosePDFViewer.Checked);
    WriteBool('App', 'bComAutoDetect_Language', frmTools.cbComAutoDetect_Language.Checked);
    WriteBool('App', 'bComPriority_Line', frmTools.cbComPriority_Line.Checked);
    WriteBool('App', 'bConnectionBeepOnError', bConnectionBeepOnError);
    WriteBool('App', 'bDataCompletionAnywhere', bDataCompletionAnywhere);
    WriteBool('App', 'bDosMinimizedAlways', actDosMinimizedAlways.Checked);
    WriteBool('App', 'bDviOpenAlways', actDviOpenAlways.Checked);
    WriteBool('App', 'bEditorLineWrap', actEditorLineWrap.Checked);
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
    WriteBool('App', 'bFormatR', actFormatR.Visible);
    WriteBool('App', 'bRememberFileState', bRememberFileState);
    WriteBool('App', 'bRemoveExtension', bRemoveExtension);
    WriteBool('App', 'bRestoreIniDock', bRestoreIniDock);
    WriteBool('App', 'bRsetget_Info', bRsetget_Info);
    WriteBool('App', 'bRguiReturnFocus', bRguiReturnFocus);
    WriteBool('App', 'bRmirros_Update', bRmirros_Update);
    WriteBool('App', 'bRSendAll', bRSendAll);
    WriteBool('App', 'bRSetWorkDir_Starting', bRSetWorkDir_Starting);
    WriteBool('App', 'bRSimpleDefault', actRSimpleDefault.Checked);
    WriteBool('App', 'bRSmartSend', bRSmartSend);
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
    WriteBool('App', 'bTinnRHotKeysActive', bTinnRHotKeysActive);
    WriteBool('App', 'bUndoAfterSave', bUndoAfterSave);
    WriteInteger('App', 'clActiveLine', Tcolor(clActiveLine));
    WriteInteger('App', 'clBGApplication', Tcolor(clBGApplication));
    WriteInteger('App', 'clBGForAllHighlighters', Tcolor(clBGForAllHighlighters));
    WriteInteger('App', 'clBGPreferred', Tcolor(clBGPreferred));
    WriteInteger('App', 'clBGTabSelectedNew', Tcolor(clBGTabSelectedNew));
    WriteInteger('App', 'clBrackets', Tcolor(clBrackets));
    WriteInteger('App', 'clFGApplication', Tcolor(clFGApplication));
    WriteInteger('App', 'Delay', iDelay);
    WriteInteger('App', 'iIPPortLocal', iIPPortLocal);
    WriteInteger('App', 'iIPPortRemote', iIPPortRemote);
    WriteInteger('App', 'iMaxDeparseLength', iMaxDeparseLength);
    WriteInteger('App', 'iPandocFrom', iPandocFrom);
    WriteInteger('App', 'iPandocTo', iPandocTo);
    WriteInteger('App', 'iPgFiles.TabsPosition', integer(pgFiles.TabsPosition));
    WriteInteger('App', 'iPgRterm.TabsPosition', integer(frmRterm.pgRterm.TabsPosition));
    WriteInteger('App', 'iPgTools.TabsPosition', integer(frmTools.pgTools.TabsPosition));
    WriteInteger('App', 'iReformatRSplit', iReformatRSplit);
    WriteInteger('App', 'iRguiRecognitionCaption', iRguiRecognitionCaption);
    WriteInteger('App', 'iRguiRecognitionType', iRguiRecognitionType);
    WriteInteger('App', 'iRguiTinnRDisposition', iRguiTinnRDisposition);
    WriteInteger('App', 'iRguiTinnRProportion', iRguiTinnRProportion);
    WriteInteger('App', 'iTransparency', iTransparency);
    WriteInteger('App', 'iViewStyleRExplorer', iViewStyleRExplorer);
    WriteString('App', 'sAppSelected', sAppSelected);
    WriteString('App', 'sEncodingDefault', GetEncodingDefault);
    WriteString('App', 'sEndComment', sEndComment);
    WriteString('App', 'sIPHostLocal', sIPHostLocal);
    WriteString('App', 'sIPHostRemote', sIPHostRemote);
    WriteString('App', 'sParDeplate', sParDeplate);
    WriteString('App', 'sParDviBibtex', sParDviBibtex);
    WriteString('App', 'sParDviSingle', sParDviSingle);
    WriteString('App', 'sParPdfBibtex', sParPdfBibtex);
    WriteString('App', 'sParPdfSingle', sParPdfSingle);
    WriteString('App', 'sParRgui', sParRgui);
    WriteString('App', 'sParRterm', sParRterm);
    WriteString('App', 'sParTxt2tags', sParTxt2tags);
    WriteString('App', 'sPath_Pandoc', sPath_Pandoc);
    WriteString('App', 'sPathDeplate_Converter', sPathDeplate_Converter);
    WriteString('App', 'sPathDeplate_Interpreter', sPathDeplate_Interpreter);
    WriteString('App', 'sPathRgui', sPathRgui);
    WriteString('App', 'sPathRterm', sPathRterm);
    WriteString('App', 'sPathTxt2tags_Converter', sPathTxt2tags_Converter);
    WriteString('App', 'sPathTxt2tags_Interpreter', sPathTxt2tags_Interpreter);
    WriteString('App', 'sFormatR', sFormatR);
    WriteString('App', 'sFormatRd', sFormatRd);
    WriteString('App', 'sRmirror', sRmirror);
    WriteString('App', 'sShortcutsInUse', sShortcutsInUse);
    WriteString('App', 'sTriggerRDataCompletion', sTriggerRDataCompletion);
    WriteString('App', 'sTriggerRtip', sTriggerRtip);

    // Search settings
    WriteBool('Search', 'bRememberSearchList', bRememberSearchList);
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
    WriteBool('Roptions', 'bRCurrentLineToTop', actRCurrentLineToTop.Visible);
    WriteBool('Roptions', 'bRKnitr', bRKnitr);
    WriteBool('Roptions', 'bRSendBlockMarked', actRSendBlockMarked.Visible);
    WriteBool('Roptions', 'bRSendClipboard', actRSendClipboard.Visible);
    WriteBool('Roptions', 'bRSendContiguous', actRSendContiguous.Visible);
    WriteBool('Roptions', 'bRSendCursorToBeginningLine', actRSendCursorToBeginningLine.Visible);
    WriteBool('Roptions', 'bRSendCursorToEndLine', actRSendCursorToEndLine.Visible);
    WriteBool('Roptions', 'bRSendFile', actRSendFile.Visible);
    WriteBool('Roptions', 'bRSendLine', actRSendLine.Visible);
    WriteBool('Roptions', 'bRSendLinesToEndPage', actRSendLinesToEndPage.Visible);
    WriteBool('Roptions', 'bRSendSelection', actRSendSelection.Visible);
    WriteBool('Roptions', 'bRSendSourceBlockMarked', actRSendSourceBlockMarked.Visible);
    WriteBool('Roptions', 'bRSendSourceClipboard', actRSendSourceClipboard.Visible);
    WriteBool('Roptions', 'bRSendSourceContiguous', actRSendSourceContiguous.Visible);
    WriteBool('Roptions', 'bRSendSourceFile', actRSendSourceFile.Visible);
    WriteBool('Roptions', 'bRSendSourceSelection', actRSendSourceSelection.Visible);
    WriteBool('Roptions', 'bRSweave', actRSendSweave.Visible);

    // Controlling R alphabetically ordered
    WriteBool('Roptions', 'bRClearAll', actRContClearAll.Visible);
    WriteBool('Roptions', 'bRClearConsole', actRContClearConsole.Visible);
    WriteBool('Roptions', 'bRCloseAllGraphics', actRContCloseAllGraphics.Visible);
    WriteBool('Roptions', 'bREditVariable', actRContEditVariable.Visible);
    WriteBool('Roptions', 'bREscape', actRContEscape.Visible);
    WriteBool('Roptions', 'bRExampleSelectedWord', actRContExampleSelectedWord.Visible);
    WriteBool('Roptions', 'bRFixVariable', actRContFixVariable.Visible);
    WriteBool('Roptions', 'bRguiStartClose', actRContGuiStartClose.Visible);
    WriteBool('Roptions', 'bRHelp', actRContHelp.Visible);
    WriteBool('Roptions', 'bRHelpSelectedWord', actRContHelpSelectedWord.Visible);
    WriteBool('Roptions', 'bRListAllObjects', actRContListAllObjects.Visible);
    WriteBool('Roptions', 'bRListVariableNames', actRContListVariableNames.Visible);
    WriteBool('Roptions', 'bRListVariableStructure', actRContListVariableStructure.Visible);
    WriteBool('Roptions', 'bRPackages', actRContPackages.Visible);
    WriteBool('Roptions', 'bRPlotVariable', actRContPlotVariable.Visible);
    WriteBool('Roptions', 'bRPrintVariableContent', actRContPrintVariableContent.Visible);
    WriteBool('Roptions', 'bRRemoveAllObjects', actRContRemoveAllObjects.Visible);
    WriteBool('Roptions', 'bRSetWorkDir', actRContSetWorkDirectory.Visible);
    WriteBool('Roptions', 'bRTCPConnection', actRContTCPConnection.Visible);
    WriteBool('Roptions', 'bRtermStartClose', actRContTermStartClose.Visible);

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
      ifTinn_Tmp.WriteString('PandocHistory',
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
      ifTinn_Tmp.WriteString('PandocHistoryFrom',
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
      ifTinn_Tmp.WriteString('PandocHistoryTo',
                             IntToStr(i),
                             slPandocHistoryTo.Strings[0]);
      inc(i);
    end;
    slPandocHistoryTo.Delete(0);
  end;
  FreeAndNil(slPandocHistoryTo);

  if bRememberSearchList then begin
    slSearch     := TStringList.Create;
    slSearch.Text:= sSearchTextHistory;

    i:= 0;
    while (slSearch.Count >= 1) and
          (i < iLastSearch) do begin
      if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
        ifTinn_Tmp.WriteString('SearchTextHistory',
                               IntToStr(i),
                               slSearch.Strings[0]);
        inc(i);
      end;
      slSearch.Delete(0);
    end;
    FreeAndNil(slSearch);
  end;

  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchDirHistory;
  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('SearchDirHistory',
                             IntToStr(i),
                             slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchFileMaskHistory;

  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn_Tmp.WriteString('SearchFileMaskHistory',
                             IntToStr(i),
                             slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  for i:= 0 to (frmTools.cbExplorerFavorites.Items.Count-1) do
    ifTinn_Tmp.WriteString('ExplorerFavorites',
                           IntToStr(i),
                           frmTools.cbExplorerFavorites.Items.Strings[i]);

  i:= 0;
  while (slFileMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn_Tmp.WriteString('FileMRU',
                           IntToStr(i),
                           slFileMRU.Values[IntToStr(i)]);
    inc(i);
  end;

  i:= 0;
  while (slprojectMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn_Tmp.WriteString('ProjectMRU',
                           IntToStr(i),
                           slprojectMRU.Values[IntToStr(i)]);
    inc(i);
  end;

  with slTextDiff do begin
    if (Count >= 1) then
      for i:= 0 to (Count-1) do
        ifTinn_Tmp.WriteString('Options TextDiff',
                               Names[i],
                               ValueFromIndex[i]);
    FreeAndNil(slTextDiff);
  end;

  for i:= 1 to 20 do
    ifTinn_Tmp.WriteString('R Hotkeys',
                           ('RHK' + IntToStr(i)),
                           hkTinnR.strgDefault.Cells[1, i]);

  for i:= 1 to 20 do
    ifTinn_Tmp.WriteString('R Custom',
                           ('RC' + IntToStr(i)),
                           hkTinnR.strgCustom.Cells[0, i]);

  for i:= 1 to 20 do
    ifTinn_Tmp.WriteString('R Hotkeys Custom',
                           ('RHKC' + IntToStr(i)),
                           hkTinnR.strgCustom.Cells[1, i]);
end;

procedure TfrmTinnMain.SaveNewIni_Editor;
begin
  // Editor
  if not DirectoryExists(sPathEditor) then begin
    try
      CreateDir(sPathEditor);
    except
      MessageDlg(sPathEditor + #13 + #13 +
                 'The path above is no allowed for your system previleges.' + #13 +
                 'The necessary ".ini" files related to "Editor" will not be saved!',
                 mtError,
                 [mbOk],
                 0);
      Exit;
    end;
  end;

  // Editor
  ifEditor_Tmp       := TIniFile.create(sPathEditor + '\Editor.tmp');
  sPathIniEditor_Tmp := (sPathEditor + '\Editor.tmp');
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

procedure TfrmTinnMain.WriteIniFile_Application(bMakingBackup: boolean);
var
  slSearch,
   slPandocHistory,
    slPandocHistoryFrom,
    slPandocHistoryTo  : TStringList;

  i: integer;

begin
  // Application
  if not DirectoryExists(sPathApp) then begin
    try
      CreateDir(sPathApp);
    except
      MessageDlg(sPathApp + #13 + #13 +
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

    // Max files in fileMRU
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
    WriteBool('App', 'bRtermCloseWithoutAsk', bRtermCloseWithoutAsk);
    WriteBool('App', 'bRtermHorizontal', bRtermHorizontal);
    WriteBool('App', 'bRtermSimple', bRtermSimple);
    WriteInteger('App', 'iIOSyntax', iIOSyntax);
    WriteInteger('App', 'iLogSyntax', iLogSyntax);
    WriteInteger('App', 'iSynLog2.Height', frmRterm.iSynLog2Height);
    WriteInteger('App', 'iSynLog2.Width', frmRterm.iSynLog2Width);
    WriteInteger('App', 'iRterm.Size', frmRterm.iSize);

    // Tools
    WriteBool('App', 'bToolsCanFloat', bToolsCanFloat);
    WriteInteger('App', 'iDatabase.TabIndex', frmTools.pgDatabase.TabIndex);
    WriteInteger('App', 'iLatex.TabIndex', frmTools.pgLatex.TabIndex);
    WriteInteger('App', 'iMarkup.TabIndex', frmTools.pgMarkup.TabIndex);
    WriteInteger('App', 'iMisc.TabIndex', frmTools.pgMisc.TabIndex);
    WriteInteger('App', 'iR.TabIndex', frmTools.pgR.TabIndex);
    WriteInteger('App', 'iResults.TabIndex', frmTools.pgResults.TabIndex);
    WriteInteger('App', 'iTools.TabIndex', frmTools.pgTools.TabIndex);
    WriteInteger('App', 'iTxt2tags.TabIndex', frmTools.pgTxt2tags.TabIndex);
    WriteInteger('App', 'iTools.Size', frmTools.iSize);

    // Tools visibility
    WriteBool('App', 'bDatabase.Visible', actDatabaseVisible.Checked);
    WriteBool('App', 'bDataComments.Visible', actDataCommentsVisible.Checked);
    WriteBool('App', 'bDataCompletion.Visible', actDataCompletionVisible.Checked);
    WriteBool('App', 'bDataRcard.Visible', actDataRcardVisible.Checked);
    WriteBool('App', 'bDataRmirrors.Visible', actDataRmirrorsVisible.Checked);
    WriteBool('App', 'bDataShortcuts.Visible', actDataShortcutsVisible.Checked);
    WriteBool('App', 'bIniLog.Visible', actIniLogVisible.Checked);
    WriteBool('App', 'bLatex.Visible', actLatexVisible.Checked);
    WriteBool('App', 'bMarkup.Visible', actMarkupVisible.Checked);
    WriteBool('App', 'bMisc.Visible', actMiscVisible.Checked);
    WriteBool('App', 'bProject.Visible', actProjectVisible.Checked);
    WriteBool('App', 'bR.Visible', actRVisible.Checked);
    WriteBool('App', 'bResults.Visible', actResultsVisible.Checked);
    WriteBool('App', 'bRExplorer.Visible', actRExplorerVisible.Checked);
    WriteBool('App', 'bTxt2tags.Visible', actTxt2tagsVisible.Checked);
    WriteBool('App', 'bWinExpl.Visible', actWinExplVisible.Checked);
    WriteBool('App', 'bWorkExpl.Visible', actWorkExplVisible.Checked);
    WriteBool('App', 'bHexViewer.Visible', actHexViewerVisible.Checked);
    WriteBool('App', 'bSearch.Visible', actSearchVisible.Checked);
    WriteBool('App', 'bSpell.Visible', actSpellVisible.Checked);

    // Misc
    WriteBool('App', 'bActiveLine', bActiveLine);
    WriteBool('App', 'bAllNames', bAllNames);
    WriteBool('App', 'bCloseDVIViewer', actCloseDVIViewer.Checked);
    WriteBool('App', 'bClosePDFViewer', actClosePDFViewer.Checked);
    WriteBool('App', 'bComAutoDetect_Language', frmTools.cbComAutoDetect_Language.Checked);
    WriteBool('App', 'bComPriority_Line', frmTools.cbComPriority_Line.Checked);
    WriteBool('App', 'bConnectionBeepOnError', bConnectionBeepOnError);
    WriteBool('App', 'bDataCompletionAnywhere', bDataCompletionAnywhere);
    WriteBool('App', 'bDosMinimizedAlways', actDosMinimizedAlways.Checked);
    WriteBool('App', 'bDviOpenAlways', actDviOpenAlways.Checked);
    WriteBool('App', 'bEditorLineWrap', actEditorLineWrap.Checked);
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
    WriteBool('App', 'bFormatR', actFormatR.Visible);
    WriteBool('App', 'bRememberFileState', bRememberFileState);
    WriteBool('App', 'bRemoveExtension', bRemoveExtension);
    WriteBool('App', 'bRestoreIniDock', bRestoreIniDock);
    WriteBool('App', 'bRsetget_Info', bRsetget_Info);
    WriteBool('App', 'bRguiReturnFocus', bRguiReturnFocus);
    WriteBool('App', 'bRmirros_Update', bRmirros_Update);
    WriteBool('App', 'bRSendAll', bRSendAll);
    WriteBool('App', 'bRSetWorkDir_Starting', bRSetWorkDir_Starting);
    WriteBool('App', 'bRSimpleDefault', actRSimpleDefault.Checked);
    WriteBool('App', 'bRSmartSend', bRSmartSend);
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
    WriteBool('App', 'bTinnRHotKeysActive', bTinnRHotKeysActive);
    WriteBool('App', 'bUndoAfterSave', bUndoAfterSave);
    WriteInteger('App', 'clActiveLine', Tcolor(clActiveLine));
    WriteInteger('App', 'clBGApplication', Tcolor(clBGApplication));
    WriteInteger('App', 'clBGForAllHighlighters', Tcolor(clBGForAllHighlighters));
    WriteInteger('App', 'clBGPreferred', Tcolor(clBGPreferred));
    WriteInteger('App', 'clBGTabSelectedNew', Tcolor(clBGTabSelectedNew));
    WriteInteger('App', 'clBrackets', Tcolor(clBrackets));
    WriteInteger('App', 'clFGApplication', Tcolor(clFGApplication));
    WriteInteger('App', 'Delay', iDelay);
    WriteInteger('App', 'iIPPortLocal', iIPPortLocal);
    WriteInteger('App', 'iIPPortRemote', iIPPortRemote);
    WriteInteger('App', 'iMaxDeparseLength', iMaxDeparseLength);
    WriteInteger('App', 'iPandocFrom', iPandocFrom);
    WriteInteger('App', 'iPandocTo', iPandocTo);
    WriteInteger('App', 'iPgFiles.TabsPosition', integer(pgFiles.TabsPosition));
    WriteInteger('App', 'iPgRterm.TabsPosition', integer(frmRterm.pgRterm.TabsPosition));
    WriteInteger('App', 'iPgTools.TabsPosition', integer(frmTools.pgTools.TabsPosition));
    WriteInteger('App', 'iReformatRSplit', iReformatRSplit);
    WriteInteger('App', 'iRguiRecognitionCaption', iRguiRecognitionCaption);
    WriteInteger('App', 'iRguiRecognitionType', iRguiRecognitionType);
    WriteInteger('App', 'iRguiTinnRDisposition', iRguiTinnRDisposition);
    WriteInteger('App', 'iRguiTinnRProportion', iRguiTinnRProportion);
    WriteInteger('App', 'iTransparency', iTransparency);
    WriteInteger('App', 'iViewStyleRExplorer', iViewStyleRExplorer);
    WriteString('App', 'sAppSelected', sAppSelected);
    WriteString('App', 'sEncodingDefault', GetEncodingDefault);
    WriteString('App', 'sEndComment', sEndComment);
    WriteString('App', 'sIPHostLocal', sIPHostLocal);
    WriteString('App', 'sIPHostRemote', sIPHostRemote);
    WriteString('App', 'sParDeplate', sParDeplate);
    WriteString('App', 'sParDviBibtex', sParDviBibtex);
    WriteString('App', 'sParDviSingle', sParDviSingle);
    WriteString('App', 'sParPdfBibtex', sParPdfBibtex);
    WriteString('App', 'sParPdfSingle', sParPdfSingle);
    WriteString('App', 'sParRgui', sParRgui);
    WriteString('App', 'sParRterm', sParRterm);
    WriteString('App', 'sParTxt2tags', sParTxt2tags);
    WriteString('App', 'sPath_Pandoc', sPath_Pandoc);
    WriteString('App', 'sPathDeplate_Converter', sPathDeplate_Converter);
    WriteString('App', 'sPathDeplate_Interpreter', sPathDeplate_Interpreter);
    WriteString('App', 'sPathRgui', sPathRgui);
    WriteString('App', 'sPathRterm', sPathRterm);
    WriteString('App', 'sPathTxt2tags_Converter', sPathTxt2tags_Converter);
    WriteString('App', 'sPathTxt2tags_Interpreter', sPathTxt2tags_Interpreter);
    WriteString('App', 'sFormatR', sFormatR);
    WriteString('App', 'sFormatRd', sFormatRd);
    WriteString('App', 'sRmirror', sRmirror);
    WriteString('App', 'sShortcutsInUse', sShortcutsInUse);
    WriteString('App', 'sTriggerRDataCompletion', sTriggerRDataCompletion);
    WriteString('App', 'sTriggerRtip', sTriggerRtip);

    // Search settings
    WriteBool('Search', 'bRememberSearchList', bRememberSearchList);
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

    ifTinn.EraseSection('PandocHistory');
    ifTinn.EraseSection('PandocHistoryFrom');
    ifTinn.EraseSection('PandocHistoryTo');
    ifTinn.EraseSection('SearchTextHistory');

    // Send To R alphabetically ordered
    WriteBool('Roptions', 'bRCurrentLineToTop', actRCurrentLineToTop.Visible);
    WriteBool('Roptions', 'bRKnitr', bRKnitr);
    WriteBool('Roptions', 'bRSendBlockMarked', actRSendBlockMarked.Visible);
    WriteBool('Roptions', 'bRSendClipboard', actRSendClipboard.Visible);
    WriteBool('Roptions', 'bRSendContiguous', actRSendContiguous.Visible);
    WriteBool('Roptions', 'bRSendCursorToBeginningLine', actRSendCursorToBeginningLine.Visible);
    WriteBool('Roptions', 'bRSendCursorToEndLine', actRSendCursorToEndLine.Visible);
    WriteBool('Roptions', 'bRSendFile', actRSendFile.Visible);
    WriteBool('Roptions', 'bRSendLine', actRSendLine.Visible);
    WriteBool('Roptions', 'bRSendLinesToEndPage', actRSendLinesToEndPage.Visible);
    WriteBool('Roptions', 'bRSendSelection', actRSendSelection.Visible);
    WriteBool('Roptions', 'bRSendSourceBlockMarked', actRSendSourceBlockMarked.Visible);
    WriteBool('Roptions', 'bRSendSourceClipboard', actRSendSourceClipboard.Visible);
    WriteBool('Roptions', 'bRSendSourceContiguous', actRSendSourceContiguous.Visible);
    WriteBool('Roptions', 'bRSendSourceFile', actRSendSourceFile.Visible);
    WriteBool('Roptions', 'bRSendSourceSelection', actRSendSourceSelection.Visible);
    WriteBool('Roptions', 'bRSweave', actRSendSweave.Visible);

    // Controlling R alphabetically ordered
    WriteBool('Roptions', 'bRClearAll', actRContClearAll.Visible);
    WriteBool('Roptions', 'bRClearConsole', actRContClearConsole.Visible);
    WriteBool('Roptions', 'bRCloseAllGraphics', actRContCloseAllGraphics.Visible);
    WriteBool('Roptions', 'bREditVariable', actRContEditVariable.Visible);
    WriteBool('Roptions', 'bREscape', actRContEscape.Visible);
    WriteBool('Roptions', 'bRExampleSelectedWord', actRContExampleSelectedWord.Visible);
    WriteBool('Roptions', 'bRFixVariable', actRContFixVariable.Visible);
    WriteBool('Roptions', 'bRguiStartClose', actRContGuiStartClose.Visible);
    WriteBool('Roptions', 'bRHelp', actRContHelp.Visible);
    WriteBool('Roptions', 'bRHelpSelectedWord', actRContHelpSelectedWord.Visible);
    WriteBool('Roptions', 'bRListAllObjects', actRContListAllObjects.Visible);
    WriteBool('Roptions', 'bRListVariableNames', actRContListVariableNames.Visible);
    WriteBool('Roptions', 'bRListVariableStructure', actRContListVariableStructure.Visible);
    WriteBool('Roptions', 'bRPackages', actRContPackages.Visible);
    WriteBool('Roptions', 'bRPlotVariable', actRContPlotVariable.Visible);
    WriteBool('Roptions', 'bRPrintVariableContent', actRContPrintVariableContent.Visible);
    WriteBool('Roptions', 'bRRemoveAllObjects', actRContRemoveAllObjects.Visible);
    WriteBool('Roptions', 'bRSetWorkDir', actRContSetWorkDirectory.Visible);
    WriteBool('Roptions', 'bRTCPConnection', actRContTCPConnection.Visible);
    WriteBool('Roptions', 'bRtermStartClose', actRContTermStartClose.Visible);

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
      ifTinn.WriteString('PandocHistory',
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
      ifTinn.WriteString('PandocHistoryFrom',
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
      ifTinn.WriteString('PandocHistoryTo',
                         IntToStr(i),
                         slPandocHistoryTo.Strings[0]);
      inc(i);
    end;
    slPandocHistoryTo.Delete(0);
  end;
  FreeAndNil(slPandocHistoryTo);

  if bRememberSearchList then begin
    slSearch     := TStringList.Create;
    slSearch.Text:= sSearchTextHistory;
    i:= 0;
    while (slSearch.Count >= 1) and
          (i < iLastSearch) do begin
      if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
        ifTinn.WriteString('SearchTextHistory',
                           IntToStr(i),
                           slSearch.Strings[0]);
        inc(i);
      end;
      slSearch.Delete(0);
    end;
    FreeAndNil(slSearch);
  end;

  ifTinn.EraseSection('SearchDirHistory');
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchDirHistory;

  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('SearchDirHistory',
                         IntToStr(i),
                         slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  ifTinn.EraseSection('SearchFileMaskHistory');
  slSearch     := TStringList.Create;
  slSearch.Text:= sSearchFileMaskHistory;

  i:= 0;
  while (slSearch.Count >= 1) do begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then begin
      ifTinn.WriteString('SearchFileMaskHistory',
                         IntToStr(i),
                         slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  SaveEditorKeystrokes;

  ifTinn.EraseSection('ExplorerFavorites');
  for i:= 0 to (frmTools.cbExplorerFavorites.Items.Count - 1) do
    ifTinn.WriteString('ExplorerFavorites',
                       IntToStr(i),
                       frmTools.cbExplorerFavorites.Items.Strings[i]);

  ifTinn.EraseSection('FileMRU');

  i:= 0;
  while (slFileMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn.WriteString('FileMRU',
                       IntToStr(i),
                       slFileMRU.Values[IntToStr(i)]);
    inc(i);
    if not bMakingBackup then slFileMRU.Delete(0);
  end;

  ifTinn.EraseSection('ProjectMRU');

  i:= 0;
  while (slprojectMRU.Count >= 1) and
        (i < iLastFile) do begin
    ifTinn.WriteString('ProjectMRU',
                       IntToStr(i),
                       slprojectMRU.Values[IntToStr(i)]);
    inc(i);
    if not bMakingBackup then slprojectMRU.Delete(0);
  end;

  for i:= 1 to 20 do
    ifTinn.WriteString('R Hotkeys',
                       ('RHK' +
                        IntToStr(i)),
                       hkTinnR.strgDefault.Cells[1, i]);

  for i:= 1 to 20 do
    ifTinn.WriteString('R Custom',
                       ('RC' +
                        IntToStr(i)),
                       hkTinnR.strgCustom.Cells[0, i]);

  for i:= 1 to 20 do
    ifTinn.WriteString('R Hotkeys Custom',
                       ('RHKC' +
                        IntToStr(i)),
                       hkTinnR.strgCustom.Cells[1, i]);

  if not bMakingBackup then begin
    if Assigned(hkTinnR) then FreeAndNil(hkTinnR);
    if Assigned(ifTinn) then FreeAndNil(ifTinn);
  end;
end;

procedure TfrmTinnMain.WriteIniFile_Editor(bMakingBackup: boolean);
begin
  // Editor
  if not DirectoryExists(sPathEditor) then begin
    try
      CreateDir(sPathEditor);
    except
      MessageDlg(sPathEditor + #13 + #13 +
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

function TfrmTinnMain.GetEncodingDefault: string;
begin
  if      actANSI.Checked    then Result:= 'ANSI'
  else if actUTF8.Checked    then Result:= 'UTF8'
  else if actUTF16LE.Checked then Result:= 'UTF16LE'
  else if actUTF16BE.Checked then Result:= 'UTF16BE';
end;

procedure TfrmTinnMain.SetEncodingDefault(sTmp: string);
begin
  case StringToCaseSelect(sTmp,
                          ['ANSI',
                           'UTF8',
                           'UTF16LE',
                           'UTF16BE']) of
    0: begin
        sefDefault:= sfANSI;
        actANSIExecute(Self);
       end;
    1: begin
         sefDefault:= sfUTF8;
         actUTF8Execute(Self);
       end;
    2: begin
         sefDefault:= sfUTF16LSB;
         actUTF16LEExecute(Self);
       end;
    3: begin
         sefDefault:= sfUTF16MSB;
         actUTF16BEExecute(Self);
       end;
  end;
end;

function TfrmTinnMain.GetSaveFormat(usTmp: TUnicodeStrings): string;
var
  sf: TSaveFormat;
  
begin
  sf:= TSynEditStringList(usTmp).SaveFormat;

  case sf of
    sfANSI:     Result:= 'ANSI';
    sfUTF8:     Result:= 'UTF-8';
    sfUTF16LSB: Result:= 'UTF16-LE';
    sfUTF16MSB: Result:= 'UTF16-BE';
  end;
end;

procedure TfrmTinnMain.GetFile_Info(sFileName: string;
                                    usTmp: TUnicodeStrings;
                                    bConverting: boolean = False);
var
  ff: TSynEditFileFormat;

  //sf: TSaveFormat;

  sff,
   ssf: string;
{
  function GetSaveFormat: string;
  begin
    sf:= TSynEditStringList(usTmp).SaveFormat;
    case sf of
      sfANSI:     ssf:= 'ANSI';
      sfUTF8:     ssf:= 'UTF-8';
      sfUTF16LSB: ssf:= 'UTF16-LE';
      sfUTF16MSB: ssf:= 'UTF16-BE';
    end;
    Result:= ssf;
  end;
}
begin
  if (ExtractFileExt(sFileName) = EmptyStr) and
     (pos('Untitled',
          sFileName) > 0) then begin // The file does not exist (physically in the HD) yet!
    ssf:= GetSaveFormat(usTmp);

    with stbMain do begin
      Panels[0].Text:= ssf;
      Panels[1].Text:= 'WIN';
    end;
  end  // if (ExtractFileExt(sFileName) = EmptyStr) and
  else begin
    // The file should already exist (physically in the HD)!
    if not FileExists(sFileName) then
      Exit;

    seeEncoding:= GetEncoding(sFileName,
                              bbBOM);

    ssf:= GetSaveFormat(usTmp);

    ff:= TSynEditStringList(usTmp).FileFormat;
    case ff of
      sffDOS:  sff:= 'WIN';
      sffUNIX: sff:= 'UNIX';
      sffMAC:  sff:= 'MAC';
      else     sff:= 'UNK';
    end;

    with stbMain do begin
      if (not bConverting and bbBOM) then Panels[0].Text:= ssf + ' BOM'
                                     else Panels[0].Text:= ssf;
      Panels[1].Text:= sff;
    end;
  end;
end;

procedure TfrmTinnMain.SetBuffer_SaveFormat(sf: TSaveFormat);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    TSynEditStringList(synEditor.Lines).SaveFormat:= sf;
    synEditor.Modified:= True;
    SetTabTitle('*');
    CheckSaveStatus;
    GetFile_Info(sActiveFile,
                 synEditor.Lines,
                 True);  // True because is converting
  end;
end;

procedure TfrmTinnMain.SetBuffer_FileFormat(ff: TSynEditFileFormat);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    TSynEditStringList(synEditor.Lines).FileFormat:= ff;
    synEditor.Modified:= True;
    SetTabTitle('*');
    CheckSaveStatus;
    GetFile_Info(sActiveFile,
                 synEditor.Lines,
                 True);  // True because is converting
  end;
end;

procedure TfrmTinnMain.SetPreferences_Application;

  function ReadRegEntry(strSubKey,
                        strValueName: string): string;
  var
   Key   : HKey;
   Buffer: array[0..255] of char;
   Size  : cardinal;

  begin
   Result:= 'ERROR';
   Size := SizeOf(Buffer);
   if RegOpenKeyEx(HKEY_LOCAL_MACHINE,
                   PChar(strSubKey),
                   0,
                   KEY_READ,
                   Key) = ERROR_SUCCESS then

     if RegQueryValueEx(Key,
                        PChar(strValueName),
                        nil,
                        nil,
                        @Buffer,
                        @Size) = ERROR_SUCCESS then Result := Buffer;

   RegCloseKey(Key);
  end;

var
  i,
   iPos,
   iTmp: integer;

  slTmpFavoriteFolders,
   slFavoriteFolders,
   slSearch,
   slPandocHistory,
   slPandocHistoryFrom,
   slPandocHistoryTo  : TStringList;
   slSubkeys          : TStringList;

  sTmp: string;
  bTop: boolean;

begin
  TBIniLoadPositions(Self,
                     sPathIniTinn_File,
                     EmptyStr);

  actTobRVisible.Checked:= ifTinn.ReadBool('TBRMain',
                                           'bTobVisible',
                                           True);

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
  actIniLogVisible.Checked           := ifTinn.ReadBool('App', 'bIniLog.Visible', True);
  actLatexVisible.Checked            := ifTinn.ReadBool('App', 'bLatex.Visible', True);
  actMarkupVisible.Checked           := ifTinn.ReadBool('App', 'bMarkup.Visible', True);
  actMiscVisible.Checked             := ifTinn.ReadBool('App', 'bMisc.Visible', True);
  actProjectVisible.Checked          := ifTinn.ReadBool('App', 'bProject.Visible', True);
  actRVisible.Checked                := ifTinn.ReadBool('App', 'bR.Visible', True);
  actResultsVisible.Checked          := ifTinn.ReadBool('App', 'bResults.Visible', True);
  actRExplorerVisible.Checked        := ifTinn.ReadBool('App', 'bRExplorer.Visible', True);
  actTxt2tagsVisible.Checked         := ifTinn.ReadBool('App', 'bTxt2tags.Visible', True);
  actWinExplVisible.Checked          := ifTinn.ReadBool('App', 'bWinExpl.Visible', True);
  actWorkExplVisible.Checked         := ifTinn.ReadBool('App', 'bWorkExpl.Visible', True);
  actHexViewerVisible.Checked        := ifTinn.ReadBool('App', 'bHexViewer.Visible', True);
  actSearchVisible.Checked           := ifTinn.ReadBool('App', 'bSearch.Visible', True);
  actSpellVisible.Checked            := ifTinn.ReadBool('App', 'bSpell.Visible', True);

  frmTools.tbsComments.TabVisible    := actDataCommentsVisible.Checked;
  frmTools.tbsCompletion.TabVisible  := actDataCompletionVisible.Checked;
  frmTools.tbsDatabase.TabVisible    := actDatabaseVisible.Checked;
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
  frmTools.tbsHexViewer.TabVisible   := actHexViewerVisible.Checked;
  frmTools.tbsShortcuts.TabVisible   := actDataShortcutsVisible.Checked;
  frmTools.tbsSpell.TabVisible       := actSpellVisible.Checked;
  frmTools.tbsTxt2tags.TabVisible    := actTxt2tagsVisible.Checked;
  frmTools.tbsWinExplorer.TabVisible := actWinExplVisible.Checked;
  frmTools.tbsWorkExplorer.TabVisible:= actWorkExplVisible.Checked;

  actShowAllBars.Checked:= ifTinn.ReadBool('App', 'bShowAllBars', True);
  UpdateBars(actShowAllBars.Checked);

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
  sShortcutsInUse       := trim(ifTinn.ReadString('App', 'sShortcutsInUse', sPathData + '\Shortcuts.xml'));

  bIPLocal     := ifTinn.ReadBool('App', 'bIPLocal', True);
  iIPPortLocal := ifTinn.ReadInteger('App', 'iIPPortLocal', 8889);
  iIPPortRemote:= ifTinn.ReadInteger('App', 'iIPPortLocal', 8889);
  sIPHostLocal := ifTinn.ReadString('App', 'sIPHostLocal', '127.0.0.1');
  sIPHostRemote:= ifTinn.ReadString('App', 'sIPHostRemote', '000.000.000.000');

  sParDeplate              := trim(ifTinn.ReadString('App', 'sParDeplate', '-f'));
  sParDviBibtex            := trim(ifTinn.ReadString('App', 'sParDviBibtex', 'bibtex --src-specials'));
  sParDviSingle            := trim(ifTinn.ReadString('App', 'sParDviSingle', 'latex -c-style-errors --src-specials'));
  sParPdfBibtex            := trim(ifTinn.ReadString('App', 'sParPdfBibtex', 'bibtex'));
  sParPdfSingle            := trim(ifTinn.ReadString('App', 'sParPdfSingle', 'pdflatex -c-style-errors'));
  sParRgui                 := trim(ifTinn.ReadString('App', 'sParRgui', '--sdi'));
  sParRterm                := trim(ifTinn.ReadString('App', 'sParRterm', '--ess'));
  sParTxt2tags             := trim(ifTinn.ReadString('App', 'sParTxt2tags', '-t'));
  sPath_Pandoc             := trim(ifTinn.ReadString('App', 'sPath_Pandoc', EmptyStr));
  sPathDeplate_Converter   := trim(ifTinn.ReadString('App', 'sPathDeplate_Converter', EmptyStr));
  sPathDeplate_Interpreter := trim(ifTinn.ReadString('App', 'sPathDeplate_Interpreter', EmptyStr));
  sPathTxt2tags_Converter  := trim(ifTinn.ReadString('App', 'sPathTxt2tags_Converter', EmptyStr));
  sPathTxt2tags_Interpreter:= trim(ifTinn.ReadString('App', 'sPathTxt2tags_Interpreter', EmptyStr));
  sFormatR                 := trim(ifTinn.ReadString('App', 'sFormatR', EmptyStr));
  sFormatRd                := trim(ifTinn.ReadString('App', 'sFormatRd', 'Sorry, this feature is not available yet!'));

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
  if (Is64Bit_OS) and
     ifTinn.ReadBool('App', 'bRArchitecture64', True) then bRArchitecture64:= True
                                                      else bRArchitecture64:= False;

  bRAsServer             := ifTinn.ReadBool('App', 'bRAsServer', True);
  bRestoreIniDock        := ifTinn.ReadBool('App', 'bRestoreIniDock', False);
  bRsetget_Info          := ifTinn.ReadBool('App', 'bRsetget_Info', True);
  bRguiReturnFocus       := ifTinn.ReadBool('App', 'bRguiReturnFocus', True);
  bRmirros_Update        := ifTinn.ReadBool('App', 'bRmirros_Update', False);
  bRSendAll              := ifTinn.ReadBool('App', 'bRSendAll', False);
  bRSetWorkDir_Starting  := ifTinn.ReadBool('App', 'bRSetWorkDir_Starting', True);
  bRSmartSend            := ifTinn.ReadBool('App', 'bRSmartSend', True);
  bRsvSocket_Connect     := ifTinn.ReadBool('App', 'bRsvSocketConnect', True);
  bRTCPIPConsoleEcho     := ifTinn.ReadBool('App', 'bRTCPIPConsoleEcho', False);
  bRTCPIPConsoleUse      := ifTinn.ReadBool('App', 'bRTCPIPConsoleUse', False);
  bRtermBeepOnError      := ifTinn.ReadBool('App', 'bRtermBeepOnError', True);
  bRtermFindError        := ifTinn.ReadBool('App', 'bRtermFindError', False);
  bRtermWidth            := ifTinn.ReadBool('App', 'bRtermWidth', True);
  bRTinnRcom_Install     := ifTinn.ReadBool('App', 'bRTinnRcomInstall', True);
  bRTinnRcom_Load        := ifTinn.ReadBool('App', 'bRTinnRcomLoad', True);
  bRUseLatest            := ifTinn.ReadBool('App', 'bRUseLatest', True);
  bScrollSendingLines    := ifTinn.ReadBool('App', 'bScrollSendingLines', True);
  bTinnRHotKeysActive    := ifTinn.ReadBool('App', 'bTinnRHotKeysActive', False);
  iReformatRSplit        := ifTinn.ReadInteger('App', 'iReformatRSPlit', 1);
  iRguiRecognitionCaption:= ifTinn.ReadInteger('App', 'iRguiRecognitionCaption', 2);
  iRguiRecognitionType   := ifTinn.ReadInteger('App', 'iRguiRecognitionType', 0);
  iRguiTinnRDisposition  := ifTinn.ReadInteger('App', 'iRguiTinnRDisposition', 0);
  iRguiTinnRProportion   := ifTinn.ReadInteger('App', 'iRguiTinnRProportion', 58);
  sTriggerRDataCompletion:= trim(ifTinn.ReadString('App', 'sTriggerRDataCompletion', 'SHIFT+CTRL+D'));
  sTriggerRtip           := trim(ifTinn.ReadString('App', 'sTriggerRtip', 'CTRL+D'));

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

  if (trim(sFormatRd) <> 'Sorry, this feature is not available yet!') then
    sFormatRd:= 'Sorry, this feature is not available yet!';

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
  frmTools.pgDatabase.TabIndex:= ifTinn.ReadInteger('App', 'iDatabase.TabIndex', 0);
  frmTools.pgLatex.TabIndex   := ifTinn.ReadInteger('App', 'iLatex.TabIndex', 0);
  frmTools.pgMarkup.TabIndex  := ifTinn.ReadInteger('App', 'iMarkup.TabIndex', 0);
  frmTools.pgMisc.TabIndex    := ifTinn.ReadInteger('App', 'iMIsc.TabIndex', 0);
  frmTools.pgR.TabIndex       := ifTinn.ReadInteger('App', 'iR.TabIndex', 0);
  frmTools.pgResults.TabIndex := ifTinn.ReadInteger('App', 'iResults.TabIndex', 0);
  frmTools.pgTools.TabIndex   := ifTinn.ReadInteger('App', 'iTools.TabIndex', 0);
  frmTools.pgTxt2tags.TabIndex:= ifTinn.ReadInteger('App', 'iTxt2tags.TabIndex', 0);
  frmTools.iSize              := ifTinn.ReadInteger('App', 'iTools.Size', 310);

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
  bRtermCloseWithoutAsk  := ifTinn.ReadBool('App', 'bRtermCloseWithoutAsk', False);
  bRtermHorizontal       := ifTinn.ReadBool('App', 'bRtermHorizontal', True);
  bRtermSimple           := ifTinn.ReadBool('App', 'bRtermSimple', True);
  frmRterm.iSynLog2Height:= ifTinn.ReadInteger('App', 'iSynLog2.Height', 90);
  frmRterm.iSynLog2Width := ifTinn.ReadInteger('App', 'iSynLog2.Width', 140);
  frmRterm.iSize         := ifTinn.ReadInteger('App', 'iRterm.Size', 480);
  iIOSyntax              := ifTinn.ReadInteger('App', 'iIOSyntax', 1);   // .R
  iLogSyntax             := ifTinn.ReadInteger('App', 'iLogSyntax', 0);  // .txt

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
  sEncodingDefault:=  ifTinn.ReadString('App', 'sEncodingDefault', 'ANSI');
  SetEncodingDefault(sEncodingDefault);

  // Search Settings
  bRememberSearchList := ifTinn.ReadBool('Search', 'bRememberSearchList', True);
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
  pmemRResCurrentLineToTop.Checked         := ifTinn.ReadBool('Roptions', 'bRCurrentLineToTop', True);
  pmemRResSendBlockMarked.Checked          := ifTinn.ReadBool('Roptions', 'bRSendBlockMarked', True);
  pmemRResSendClipboard.Checked            := ifTinn.ReadBool('Roptions', 'bRSendClipboard', True);
  pmemRResSendContiguous.Checked           := ifTinn.ReadBool('Roptions', 'bRSendContiguous', True);
  pmemRResSendCursorToBeginningLine.Checked:= ifTinn.ReadBool('Roptions', 'bRSendCursorToBeginningLine', True);
  pmemRResSendCursorToEndLine.Checked      := ifTinn.ReadBool('Roptions', 'bRSendCursorToEndLine', True);
  pmemRResSendFile.Checked                 := ifTinn.ReadBool('Roptions', 'bRSendFile', True);
  pmemRResSendKnitr.Checked                := ifTinn.ReadBool('Roptions', 'bRKnitr', True);
  pmemRResSendLine.Checked                 := ifTinn.ReadBool('Roptions', 'bRSendLine', True);
  pmemRResSendLinesToEndPage.Checked       := ifTinn.ReadBool('Roptions', 'bRSendLinesToEndPage', True);
  pmemRResSendSelection.Checked            := ifTinn.ReadBool('Roptions', 'bRSendSelection', True);
  pmemRResSendSourceBlockMarked.Checked    := ifTinn.ReadBool('Roptions', 'bRSendSourceBlockMarked', True);
  pmemRResSendSourceClipboard.Checked      := ifTinn.ReadBool('Roptions', 'bRSendSourceClipboard', True);
  pmemRResSendSourceContiguous.Checked     := ifTinn.ReadBool('Roptions', 'bRSendSourceContiguous', True);
  pmemRResSendSourceFile.Checked           := ifTinn.ReadBool('Roptions', 'bRSendSourceFile', True);
  pmemRResSendSourceSelection.Checked      := ifTinn.ReadBool('Roptions', 'bRSendSourceSelection', True);
  pmemRResSendSweave.Checked               := ifTinn.ReadBool('Roptions', 'bRSweave', True);

  actRCurrentLineToTop.Visible         := ifTinn.ReadBool('Roptions', 'bRCurrentLineToTop', True);
  actRSendBlockMarked.Visible          := ifTinn.ReadBool('Roptions', 'bRSendBlockMarked', True);
  actRSendClipboard.Visible            := ifTinn.ReadBool('Roptions', 'bRSendClipboard', True);
  actRSendContiguous.Visible           := ifTinn.ReadBool('Roptions', 'bRSendContiguous', True);
  actRSendCursorToBeginningLine.Visible:= ifTinn.ReadBool('Roptions', 'bRSendCursorToBeginningLine', True);
  actRSendCursorToEndLine.Visible      := ifTinn.ReadBool('Roptions', 'bRSendCursorToEndLine', True);
  actRSendFile.Visible                 := ifTinn.ReadBool('Roptions', 'bRSendFile', True);
  actRSendLine.Visible                 := ifTinn.ReadBool('Roptions', 'bRSendLine', True);
  actRSendLinesToEndPage.Visible       := ifTinn.ReadBool('Roptions', 'bRSendLinesToEndPage', True);
  actRSendSelection.Visible            := ifTinn.ReadBool('Roptions', 'bRSendSelection', True);
  actRSendSourceBlockMarked.Visible    := ifTinn.ReadBool('Roptions', 'bRSendSourceBlockMarked', True);
  actRSendSourceClipboard.Visible      := ifTinn.ReadBool('Roptions', 'bRSendSourceClipboard', True);
  actRSendSourceContiguous.Visible     := ifTinn.ReadBool('Roptions', 'bRSendSourceContiguous', True);
  actRSendSourceFile.Visible           := ifTinn.ReadBool('Roptions', 'bRSendSourceFile', True);
  actRSendSourceSelection.Visible      := ifTinn.ReadBool('Roptions', 'bRSendSourceSelection', True);
  actRSendSweave.Visible               := ifTinn.ReadBool('Roptions', 'bRSweave', True);
  bRKnitr                              := ifTinn.ReadBool('Roptions', 'bRKnitr', True);

  // Controlling R alphabetically ordered
  pmenRResContClearAll.Checked             := ifTinn.ReadBool('Roptions', 'bRClearAll', True);
  pmenRResContClearConsole.Checked         := ifTinn.ReadBool('Roptions', 'bRClearConsole', True);
  pmenRResContCloseAllGraphics.Checked     := ifTinn.ReadBool('Roptions', 'bRCloseAllGraphics', True);
  pmenRResContEditVariable.Checked         := ifTinn.ReadBool('Roptions', 'bREditVariable', True);
  pmenRResContEscape.Checked               := ifTinn.ReadBool('Roptions', 'bREscape', True);
  pmenRResContExampleSelectedWord.Checked  := ifTinn.ReadBool('Roptions', 'bRExampleSelectedWord', True);
  pmenRResContFixVariable.Checked          := ifTinn.ReadBool('Roptions', 'bRFixVariable', True);
  pmenRResContGuiStartClose.Checked        := ifTinn.ReadBool('Roptions', 'bRguiStartClose', True);
  pmenRResContHelp.Checked                 := ifTinn.ReadBool('Roptions', 'bRHelp', True);
  pmenRResContHelpSelectedWord.Checked     := ifTinn.ReadBool('Roptions', 'bRHelpSelectedWord', True);
  pmenRResContListAllObjects.Checked       := ifTinn.ReadBool('Roptions', 'bRListAllObjects', True);
  pmenRResContListVariableNames.Checked    := ifTinn.ReadBool('Roptions', 'bRListVariableNames', True);
  pmenRResContListVariableStructure.Checked:= ifTinn.ReadBool('Roptions', 'bRListVariableStructure', True);
  pmenRResContPackages.Checked             := ifTinn.ReadBool('Roptions', 'bRPackages', True);
  pmenRResContPlotVariable.Checked         := ifTinn.ReadBool('Roptions', 'bRPlotVariable', True);
  pmenRResContPrintVariableContent.Checked := ifTinn.ReadBool('Roptions', 'bRPrintVariableContent', True);
  pmenRResContRemoveAllObjects.Checked     := ifTinn.ReadBool('Roptions', 'bRRemoveAllObjects', True);
  pmenRResContSetWorkDirectory.Checked     := ifTinn.ReadBool('Roptions', 'bRSetWorkDir', True);
  pmenRResContTCPConnection.Checked        := ifTinn.ReadBool('Roptions', 'bRTCPConnection', True);
  pmenRResContTermStartClose.Checked       := ifTinn.ReadBool('Roptions', 'bRtermStartClose', True);

  actRContClearAll.Visible             := ifTinn.ReadBool('Roptions', 'bRClearAll', True);
  actRContClearConsole.Visible         := ifTinn.ReadBool('Roptions', 'bRClearConsole', True);
  actRContCloseAllGraphics.Visible     := ifTinn.ReadBool('Roptions', 'bRCloseAllGraphics', True);
  actRContEditVariable.Visible         := ifTinn.ReadBool('Roptions', 'bREditVariable', True);
  actRContEscape.Visible               := ifTinn.ReadBool('Roptions', 'bREscape', True);
  actRContExampleSelectedWord.Visible  := ifTinn.ReadBool('Roptions', 'bRExampleSelectedWord', True);
  actRContFixVariable.Visible          := ifTinn.ReadBool('Roptions', 'bRFixVariable', True);
  actRContGuiStartClose.Visible        := ifTinn.ReadBool('Roptions', 'bRguiStartClose', True);
  actRContHelp.Visible                 := ifTinn.ReadBool('Roptions', 'bRHelp', True);
  actRContHelpSelectedWord.Visible     := ifTinn.ReadBool('Roptions', 'bRHelpSelectedWord', True);
  actRContListAllObjects.Visible       := ifTinn.ReadBool('Roptions', 'bRListAllObjects', True);
  actRContListVariableNames.Visible    := ifTinn.ReadBool('Roptions', 'bRListVariableNames', True);
  actRContListVariableStructure.Visible:= ifTinn.ReadBool('Roptions', 'bRListVariableStructure', True);
  actRContPackages.Visible             := ifTinn.ReadBool('Roptions', 'bRPackages', True);
  actRContPlotVariable.Visible         := ifTinn.ReadBool('Roptions', 'bRPlotVariable', True);
  actRContPrintVariableContent.Visible := ifTinn.ReadBool('Roptions', 'bRPrintVariableContent', True);
  actRContRemoveAllObjects.Visible     := ifTinn.ReadBool('Roptions', 'bRRemoveAllObjects', True);
  actRContSetWorkDirectory.Visible     := ifTinn.ReadBool('Roptions', 'bRSetWorkDir', True);
  actRContTCPConnection.Visible        := ifTinn.ReadBool('Roptions', 'bRTCPConnection', True);
  actRContTermStartClose.Visible       := ifTinn.ReadBool('Roptions', 'bRtermStartClose', True);
  actRSendSweave.Visible               := ifTinn.ReadBool('Roptions', 'bRSweave', True);

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
  ifTinn.ReadSectionValues('PandocHistory',
                           slPandocHistory);
  if (slPandocHistory.Count > 0) then begin
    for i:= 0 to (slPandocHistory.Count - 1) do begin
      sTmp:= slPandocHistory.Strings[i];

      iPos:= pos('=',
                 sTmp);

      sTmp:= copy(sTmp,
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
  ifTinn.ReadSectionValues('PandocHistoryFrom',
                           slPandocHistoryFrom);

  if (slPandocHistoryFrom.Count > 0) then begin
    for i:= 0 to (slPandocHistoryFrom.Count - 1) do begin
      sTmp:= slPandocHistoryFrom.Strings[i];

      iPos:= pos('=',
                 sTmp);

      sTmp:= copy(sTmp,
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
  ifTinn.ReadSectionValues('PandocHistoryTo',
                           slPandocHistoryTo);

  if (slPandocHistoryTo.Count > 0) then begin
    for i:= 0 to (slPandocHistoryTo.Count - 1) do begin
      sTmp:= slPandocHistoryTo.Strings[i];

      iPos:= pos('=',
                 sTmp);

      sTmp:= copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sPandocHistoryTo:= sTmp
                 else sPandocHistoryTo:= sPandocHistoryTo +
                                         #10 +
                                         sTmp;
    end;
  end
  else sPandocHistoryTo:= EmptyStr;

  if bRememberSearchList then begin
    slSearch:= TStringList.Create;
    ifTinn.ReadSectionValues('SearchTextHistory',
                             slSearch);
    if (slSearch.Count > 0) then begin
      for i:= 0 to (slSearch.Count - 1) do begin
        sTmp:= slSearch.Strings[i];

        iPos:= pos('=',
                   sTmp);

        sTmp:= copy(sTmp,
                    iPos + 1,
                    length(sTmp));

        if (i = 0) then sSearchTextHistory:= sTmp
                   else sSearchTextHistory:= sSearchTextHistory +
                                             #10 +
                                             sTmp;
      end;
    end
    else sSearchTextHistory:= EmptyStr;
  end;

  slSearch:= TStringList.Create;
  sSearchDirHistory:= EmptyStr;
  ifTinn.ReadSectionValues('SearchDirHistory',
                           slSearch);

  if (slSearch.Count > 0) then begin
    for i:= 0 to (slSearch.Count - 1) do begin
      sTmp:= slSearch.Strings[i];

      iPos:= pos('=',
                 sTmp);


      sTmp:= copy(sTmp,
                  iPos + 1,
                  length(sTmp));

      if (i = 0) then sSearchDirHistory:= sTmp
                 else sSearchDirHistory:= sSearchDirHistory +
                                          #10 +
                                          sTmp;
    end;
  end
  else sSearchDirHistory:= EmptyStr;

  slSearch:= TStringList.Create;
  ifTinn.ReadSectionValues('SearchFileMaskHistory',
                           slSearch);

  if (slSearch.Count > 0) then begin
    for i:= 0 to (slSearch.Count - 1) do begin
      sTmp:= slSearch.Strings[i];

      iPos:= pos('=',
                 sTmp);

      sTmp:= copy(sTmp,
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
  ifTinn.ReadSectionValues('ExplorerFavorites',
                           slTmpFavoriteFolders);
  if (slTmpFavoriteFolders.Count > 0) then begin
    for i:= 0 to (slTmpFavoriteFolders.Count - 1) do begin
      sTmp:= slTmpFavoriteFolders.Strings[i];

      iPos:= pos('=',
                 sTmp);

      sTmp:= copy(sTmp,
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

  // Read the list of fileMRU docs and add them to the menu and the drop down menu
  ifTinn.ReadSectionValues('FileMRU', slFileMRU);
  BuildMRU(menFileRecentFiles);

  // Do the same for Projects
  ifTinn.ReadSectionValues('ProjectMRU', slprojectMRU);
  BuildProjectMRU(menProjRecent);

  slTextDiff:= TStringList.Create;
  ifTinn.ReadSectionValues('Options TextDiff', slTextDiff);

  // Paths and version of R
  sPathR   := GetRegistryValue('SOFTWARE\R-core\R');
  sRversion:= StripNonConforming(sPathR, ['.', '0'..'9']);

  bRArchitecture64:= bRArchitecture64 and
                     DirectoryExists(sPathR +
                                     '\bin\x64');

  // Check the latest R version installed
  if bRUseLatest then begin
    if (sPathR <> EmptyStr) then begin
      SetPathRTerm;
      SetPathRgui;
    end;
  end
  else begin
    // Will read from INI because the user choice is not to use the latest instaled version of R
    sPathRterm:= trim(ifTinn.ReadString('App', 'sPathRterm', EmptyStr));
    if (sPathRterm = EmptyStr) or
       not FileExists(sPathRterm) then begin
         sPathR    := 'UNKNOWN';
         sRversion := 'UNKNOWN';
         sPathRterm:= 'UNKNOWN';
    end;

    sPathRgui:= trim(ifTinn.ReadString('App', 'sPathRgui', EmptyStr));
    if (sPathRgui = EmptyStr) or
       not FileExists(sPathRgui) then begin
         sPathR   := 'UNKNOWN';
         sRversion:= 'UNKNOWN';
         sPathRgui:= 'UNKNOWN';
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

procedure TfrmTinnMain.SetPreferences_Editor;
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

procedure TfrmTinnMain.GetCallTip(var sRObject,
                                      sRPackage,
                                      sRTip: string;
                                  var bTipFound: boolean);

  // Function to receive and adequate tip from R under TCPIP
  function ReceiveTipFromTCPIP(): string;
  var
    iPosDoubleCote: integer;
    sRes          : string;

  begin
    sRes:= csRtip.Socket.ReceiveText;

    iPosDoubleCote:= pos('"',
                         sRes);

    Delete(sRes,
           1,
           iPosDoubleCote);

    sRes:= InvertString(sRes);

    iPosDoubleCote:= pos('"',
                         sRes);

    Delete(sRes,
           1,
           iPosDoubleCote);

    sRes:= InvertString(sRes);

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

  procedure GetTipFrom_TCPIP(sRClassFor: string);
  var
    sCmd: string;
    i   : integer;

  begin
    // Try to find tip from TCPIP
    if UseTCPIP then begin
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

        sRTip:= ReceiveTipFromTCPIP;

        inc(i);
      until (sRTip <> EmptyStr) or
            (i = 5);

      if (sRTip <> EmptyStr) then begin
        bTipFound      := True;
        sTipFromRServer:= 'TCP/IP';
      end
      else begin
        stbMain.Panels[7].Text:= 'Tip not found';

        if UseTCPIP then stbMain.Panels[8].Text:= '<' +
                                                  sRObject +
                                                  '>' +
                                                  ' R server linked: YES'
                    else stbMain.Panels[8].Text:= '<' +
                                                  sRObject +
                                                  '>' +
                                                  ' R server linked: NOT';
      end;
    end  // UseTCPIP
  end;

var
  i,
   j: integer;

  sLocline,
   sRClassFor: string;

  seEditor: TSynEdit;

  procedure GetLocLine(se: TSynEdit);
  begin
    with se do begin
      i:= CaretX;
      sLocLine:= LineText;
      sLocLine:= trim(copy(sLocLine,
                           1,
                           i - 1));
    end;
  end;

begin
  seEditor:= nil;

  sTipFromRServer:= EmptyStr;

  i:= FindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

  if (iSynWithFocus = 3) then GetLocLine(frmRTerm.synIO)
                         else GetLocLine(seEditor);

  if (sLocLine <> EmptyStr) then begin
    // Find the text immediately before the last open-parenthesis (the function)
    // that doesn't have a matching close-parenthesis
    // Basic RegEx from: http://stackoverflow.com/questions/16952821/regex-word-immediately-before-the-last-opened-parenthesis?lq=1
    sRObject:= RegEx(sLocLine,
                     '[_a-zA-Z0-9.-]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)',  // R has function with complex names: '_' '.' '-' 'numbers', ...
                     False);

    if (sRObject = EmptyStr) then Exit;  // Nothing to do!

    // Find the text immediately before ::: (the package) considering
    // the last open-parenthesis that doesn't have a matching close-parenthesis
    // Basic RegEx adapted from: http://stackoverflow.com/questions/16952821/regex-word-immediately-before-the-last-opened-parenthesis?lq=1
    sRPackage:= RegEx(sLocLine,
                      '\w+(?=:{3}\w+(?=\((?:[^()]*\([^()]*\))*[^()]*$))',
                      False);

    // Find the text immediately after the latst open-parenthesis (the object) considering
    // the last open-parenthesis that doesn't have a matching close-parenthesis.
    // Basic RegEx from: http://stackoverflow.com/questions/17065448/regex-text-immediately-after-the-last-opened-parenthesis?lq=1

    {
     The regex '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)'
     is nice, but, not match this cases:
       mean(iris[1:10,1:4]            -> mean(iris[1:10
       cov(iris[1:10,1:4],            -> cov(iris[1:10
       plot(iris[1:10, 1:4]           -> plot(iris[1:10
       plot(iris[1:10, -c(4:5)],      -> plot(iris[1:10
       plot(iris[1:10, 1],            -> plot(iris[1:10
     and is very hard (for me) to fix this regex!

     So, my option was to use a more generic regex: '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*'
     and to do parts of the job using Delete function (as below).
    }

    sRClassFor:= RegEx(sLocLine,
                       //'(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)',
                       '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*',
                       False);

    if (sRClassFor <> EmptyStr) then begin
      i:= GetPosMatchingForward(sRClassFor,
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

    if (sRClassFor <> EmptyStr) then begin
      if (sRClassFor[length(sRClassFor)] = ',') then
        Delete(sRClassFor,
               length(sRClassFor),
               1);

      sRClassFor:= StringReplace(sRClassFor,
                                 '''',
                                 '"',
                                 [rfReplaceAll]);  // Avoid problem with read.table(file='test',
    end;

    try
      GetTipFrom_TCPIP(sRClassFor);
    finally
      //TODO
    end;
  end;
 (*
  // To debug only
  ShowMessage('OBJ=' +
              sRObject +
              #10#13 +
              'PKG=' +
              sRPackage +
              #10#13 +
              'CLF=' +
              sClassfor);
 *)
end;

procedure TfrmTinnMain.synRtipExecute(Kind: SynCompletionType;
                                      Sender: TObject;
                                      var CurrentInput: WideString;
                                      var x,
                                          y: Integer;
                                      var CanExecute: Boolean);

  function TipToShowAdequation(str: string): string;
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

        if (i >= iPosClosePar) then iPosClosePar:= ((i-1) + GetPosMatchingForward(sTmp,
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

  function TipToWriteAdequation(sTr: string): string;
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
   sTip     : string;
  slTmp     : TStringList;

const
  NMC_RServer = '"[..] NOT MATCHED: Check integrity of the parameter(s) for this function in the R Server!"';
  NMP_RServer = '"(..) NOT MATCHED: Check integrity of the parameter(s) for this function in the R Server!"';

begin
  sRObject  := EmptyStr;
  sRPackage := EmptyStr;
  sRTip     := EmptyStr;

  bTipFound:= False;

  GetCallTip(sRObject,
             sRPackage,
             sRTip,
             bTipFound);

  if (not bTipFound) then Exit;

  TSynCompletionProposal(Sender).ItemList.Clear;
  if (sTipFromRServer <> EmptyStr) then GetRInfo(sRTip,
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

  sTipToWrite:= TipTowriteAdequation(sRTip);  // Will be available to be inserted (Ctrl + *)

  if (sTipFromRServer <> EmptyStr) then begin
    if (sRPackage = EmptyStr) then sRPackage:= ' [.ClobalEnv]';

    sTip:= 'R -> ' +
           sTipFromRServer +
           ' ' +
           sRPackage;

    stbMain.Panels[7].Text:= sTip;
    stbMain.Panels[8].Text:= sRObject;
  end;
end;

procedure TfrmTinnMain.GetCompletion(var sRObject,
                                         sRPackage,
                                         sCompletion: string);

  procedure GetInfo_ClearCompletion;
  begin
    GetRInfo(sCompletion,
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
  procedure ReceiveCompletionFromTCPIP;
  var
    i: integer;

  begin
    sCompletion:= csRtip.Socket.ReceiveText;

    GetInfo_ClearCompletion;

    // Remove first "
    i:= pos('"',
            sCompletion);

    Delete(sCompletion,
           1,
           i);

    // Remove latest "
    sCompletion:= InvertString(sCompletion);

    i:= pos('"',
            sCompletion);

    Delete(sCompletion,
           1,
           i);

    // Remove latest |
    i:= pos('|',
            sCompletion);

    Delete(sCompletion,
           1,
           i);

    sCompletion:= InvertString(sCompletion);
    sCompletion:= trim(sCompletion);
  end;

  procedure CompletionGetFromTCPIP(var sCmd,
                                       sPattern: string;
                                   var bFound: boolean);
  var
    i: integer;

  begin
    // Try to use TCPIP
    if UseTCPIP then begin
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
        ReceiveCompletionFromTCPIP;
        inc(i);
      until (sCompletion <> EmptyStr) or
            (i = 5);

      if (sCompletion <> EmptyStr) then begin
        bFound         := True;
        sDataCompletion:= 'TCP/IP';
      end
      else begin
        stbMain.Panels[7].Text:= 'Completion not found';
        if UseTCPIP then stbMain.Panels[8].Text:= '<' +
                                                  sRObject +
                                                  '>' +
                                                  ' R server linked: YES'
                    else stbMain.Panels[8].Text:= '<' +
                                                  sRObject +
                                                  '>' +
                                                  ' R server linked: NOT';
      end;
    end;
  end;

var
  bFound   : Boolean;
  i,
   iX,
   iSavepos,
   iStartX : Integer;
  sTmp,
  sLocline,
   sPattern: string;
  seEditor : TSynEdit;

  procedure GetLocLine(se: TSynEdit);
  begin
    with se do begin
      i:= CaretX;
      sLocLine:= LineText;
      sLocLine:= trim(copy(sLocLine,
                           1,
                           iX - 1));
    end;
  end;

begin
  seEditor       := nil;
  sPattern       := EmptyStr;
  sDataCompletion:= EmptyStr;

  i:= FindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

  if (iSynWithFocus = 3) then GetLocLine(frmRTerm.synIO)
                         else GetLocLine(seEditor);

  // Go back from the cursor and find the first '$'
  if (iX > length(sLocLine)) then iX:= length(sLocLine)
                             else dec(iX);

  bFound:= False;

  // This is a good place to RegEx
  while (iX > 0) and
        not(bFound) do begin
    if (sLocLine[iX] = '$') then begin

      // Get the pattern after $
      sTmp:= InvertString(sLocLine);

      i:= pos('$',
              sTmp);

      if (i > 0) then begin
        sTmp:= copy(sTmp,
                    1,
                    i - 1);

        if bDataCompletionAnywhere then sPattern:= InvertString(sTmp)
                                   else sPattern:= '^' +
                                                   InvertString(sTmp)
      end;

      // We have a valid symbol '$' to completion, lets see what the word before it is
      iStartX:= iX;

      {
      while (iX > 0) and
            not(sLocLine[iX] in TSynValidStringChars) do Dec(iX);
      }

      if (iX > 0) then begin
        iSavePos:= iX;

        // Changed in version 2.2.1.0 to avoid problem with words that has '.' inside of the name
        while (iX > 0) and
              //(sLocLine[iX] in TSynValidStringChars) do dec(iX);
              (sLocLine[iX] <> ' ') do dec(iX);
        inc(iX);

        sRObject:= copy(sLocLine,
                        iX,
                        iSavePos - iX);

        CompletionGetFromTCPIP(sRObject,
                               sPattern,
                               bFound);

        if not bFound then begin
          iX:= iStartX;
          dec(iX);
        end;
      end;  // if tmpX > 0
    end
    else dec(iX)  // else if locLine[iX] = '$'
  end;  // while (iX > 0) and not(foundMatch)
end;

procedure TfrmTinnMain.synEditorDataCompletionExecute(Kind: SynCompletionType;
                                                      Sender: TObject;
                                                      var CurrentInput: WideString;
                                                      var x,
                                                          y: Integer;
                                                      var CanExecute: Boolean);
var
  sRObject,
   sRPackage,
   sCompletion: string;
  slTmp       : TStringList;

begin
  sRObject   := EmptyStr;
  sRPackage  := EmptyStr;
  sCompletion:= EmptyStr;

  GetCompletion(sRObject,
                sRPackage,
                sCompletion);

  if CanExecute then begin
    slTmp:= TStringList.Create;
    StrSplit('|',
             sCompletion,
             slTmp);

    with TSynCompletionProposal(Sender) do begin
      ClearList;
      NbLinesInWindow:= slTmp.Count;
      ItemList.AddStrings(slTmp);
    end;

    FreeAndNil(slTmp);

    if (sDataCompletion <> EmptyStr) then begin
      with stbMain do begin
        Panels[7].Text:= 'R-' +
                         sDataCompletion +
                         ' ' +
                         sRPackage;
        Panels[8].Text:= sRObject;
      end;
    end;
  end
  else TSynCompletionProposal(Sender).ClearList;
end;


(* The below enable Tinn-R to open files by Enter or Double click from Windwos Explorer *)
procedure TfrmTinnMain.DefaultHandler(var message);
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

function TfrmTinnMain.GetBuildInfo: string;
var
  VerInfoSize,
   VerValueSize,
   Dummy       : DWORD;

  VerInfo : Pointer;
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

procedure TfrmTinnMain.actFileNewExecute(Sender: TObject);
begin
  inc(iFileCount);

  with TfrmEditor.Create(Self) do begin
    synEditor.OnPaintTransient:= synPaintTransient;

    SetDataCompletion(synEditorTip,
                      (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor,
                      sTriggerRtip);

    SetDataCompletion(synEditorDataCompletion,
                      (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor,
                      sTriggerRDataCompletion);

    (Self.MDIChildren[FindTopWindow] as tfrmEditor).ToogleWordWrap(actEditorLineWrap.Checked);

    synEditor.ReadOnly:= False;

    if (bActiveLine) then synEditor.ActiveLineColor:= TColor(clActiveLine)
                     else synEditor.ActiveLineColor:= TColor(clNone);

    actReadOnly.Checked:= False;
  end;

  seeEncoding:= seeEncoding_NewFile;  (* Do not remove!
                                         By default (SynUnidoce) it is seUTF8 on creating!
                                         Syn Unicode Line 381: TSynEncoding = (seUTF8, seUTF16LE, seUTF16BE, seAnsi);
                                      *)

  with TTabSheet.Create(Self) do begin
    PageControl:= pgFiles;
    Caption    := 'Untitled' +
                  IntToStr(iFileCount);
    Hint       := Caption;
  end;

  pgFiles.ActivePageIndex:= pgFiles.PageCount - 1;
  pgFiles.ActivePage.Tag := -1;

  UpdateHexViewer;
end;

procedure TfrmTinnMain.actFileOpenExecute(Sender: TObject);
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
        OpenFileIntoTinn(Files[i]);

    Options:= Options -
              [ofAllowMultiSelect];
  end;
end;

procedure TfrmTinnMain.RMenu(bOption: boolean);
begin
  menR.Visible          := bOption;
  actTobRVisible.Visible:= bOption;
end;

procedure TfrmTinnMain.RToolbar(bOption: boolean);
begin
  TBRDockTop.Visible   := bOption;
  TBRMain.Visible      := bOption;
end;

procedure TfrmTinnMain.ControlResources(bOption: boolean);
begin
  // Main R menu and R toolbar alphabetically ordered
  actRContClearAll.Enabled             := bOption;
  actRContClearConsole.Enabled         := bOption;
  actRContCloseAllGraphics.Enabled     := bOption;
  actRContEditVariable.Enabled         := bOption and (pgFiles.PageCount > 0);
  actRContEscape.Enabled               := bOption and not Rterm_Running;
  actRContExampleSelectedWord.Enabled  := bOption;
  actRContFixVariable.Enabled          := bOption and (pgFiles.PageCount > 0);
  actRContHelp.Enabled                 := bOption;
  actRContHelpSelectedWord.Enabled     := bOption;
  actRContListAllObjects.Enabled       := bOption;
  actRContListVariableNames.Enabled    := bOption and (pgFiles.PageCount > 0);
  actRContListVariableStructure.Enabled:= bOption and (pgFiles.PageCount > 0);
  actRContPacInstall.Enabled           := bOption;
  actRContPacInstalled.Enabled         := bOption;
  actRContPacInstallZip.Enabled        := bOption;
  actRContPacInstTinnRcom.Enabled      := bOption;
  actRContPacLoad.Enabled              := bOption;
  actRContPacLoadTinnRcom.Enabled      := bOption;
  actRContPacNew.Enabled               := bOption;
  actRContPacRemove.Enabled            := bOption;
  actRContPacStatus.Enabled            := bOption;
  actRContPacUpdate.Enabled            := bOption;
  actRContPlotVariable.Enabled         := bOption and (pgFiles.PageCount > 0);
  actRContPrintVariableContent.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContRemoveAllObjects.Enabled     := bOption;
  actRContTCPConnection.Enabled        := bOption or not bIPLocal;
  actRSendClipboard.Enabled            := bOption;
  actRSendSourceClipboard.Enabled      := bOption;

  // Rterm
  actRtermIOHistoryNext.Enabled := bOption and Rterm_Running;
  actRtermIOHistoryPrior.Enabled:= bOption and Rterm_Running;
  actRtermLoadHistory.Enabled   := bOption and Rterm_Running;
  actRtermLoadWorkspace.Enabled := bOption and Rterm_Running;
  actRtermSaveHistory.Enabled   := bOption and Rterm_Running;
  actRtermSaveWorkspace.Enabled := bOption and Rterm_Running;
  menRtermHistoryNext.Enabled   := bOption and Rterm_Running;
  menRtermHistoryPrior.Enabled  := bOption and Rterm_Running;

  // Rcard
  actRcardExampleSelected.Enabled:= bOption;
  actRcardHelpSelected.Enabled   := bOption;

  // Rcompletion
  actCompletionExampleSelected.Enabled:= bOption;
  actCompletionHelpSelected.Enabled   := bOption;

  // Rmirrors
  actRmirrorsSetRepos.Enabled:= bOption;
  actRmirrorsUpdate.Enabled  := bOption;

  // R explorer
  actREnvironmentRefresh.Enabled:= bOption;
  actRExplorerRefresh.Enabled   := bOption;
  actRFilterRefresh.Enabled     := bOption;

  if Assigned(frmTools) then
    with frmTools.lvRexplorer.Items do
      if (Count = 0) then SetRExplorer(False)
                     else SetRExplorer(bOption);

  // Project
  pmenProjRSendToR.Enabled   := bOption;
  pmenProjRSetWorkDir.Enabled:= bOption and (iProjecSelected = 2);

  // Menu R
  menRGet_Info.Enabled   := bOption;
  menRSet_trPAths.Enabled:= bOption;
end;

procedure TfrmTinnMain.SendResources(bOption: boolean);
var
  bMark: boolean;

  i: integer;

  seEditor: TSynEdit;

begin
  i:= 0;
  bMark:= False;
  if (pgFiles.PageCount > 0) then begin
    i:= FindTopWindow;
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;
    with seEditor do
      if (Marks.Count <> 0) then bMark:= True;
  end;

// Alphabetically ordered
  actRContSetWorkDirectory.Enabled     := bOption and FileExists((Self.MDIChildren[i] as TfrmEditor).sActiveFile);
  actRCurrentLineToTop.Enabled         := bOption;
  actFormatR.Enabled                   := bOption;
  actRSendBlockMarked.Enabled          := bOption and bMark;
  actRSendContiguous.Enabled           := bOption;
  actRSendCursorToBeginningLine.Enabled:= bOption;
  actRSendCursorToEndLine.Enabled      := bOption;
  actRSendFile.Enabled                 := bOption;
  actRSendKnitHtml.Enabled             := bOption;
  actRSendKnitPdf.Enabled              := bOption;
  actRSendLine.Enabled                 := bOption;
  actRSendLinesToEndPage.Enabled       := bOption;
  actRSendSourceBlockMarked.Enabled    := bOption and bMark;
  actRSendSourceContiguous.Enabled     := bOption;
  actRSendSourceFile.Enabled           := bOption;
  actRSendSweave.Enabled               := bOption;
end;

procedure TfrmTinnMain.actWindowArrangeExecute(Sender: TObject);
begin
  ArrangeIcons;
  sWindowOption:= 'Arranje icons';
end;

procedure TfrmTinnMain.actWindowCascadeExecute(Sender: TObject);
begin
  Cascade;
  sWindowOption:= 'Cascade';
end;

procedure TfrmTinnMain.actWindowMinimizeAllExecute(Sender: TObject);
var
  i: integer;

begin
  for i:= (Self.MDIChildCount - 1) downto 0 do
    Self.MDIChildren[i].WindowState:= wsMinimized;
  sWindowOption:= 'Minimize all';
end;

procedure TfrmTinnMain.actWindowTileHorizontalExecute(Sender: TObject);
begin
  TileMode     := tbHorizontal;
  sWindowOption:= 'Tiled horizontal';
  Tile;
end;

procedure TfrmTinnMain.actWindowTileVerticalExecute(Sender: TObject);
begin
  TileMode     := tbVertical;
  sWindowOption:= 'Tiled vertical';
  Tile;
end;

procedure TfrmTinnMain.HighlighterSelection(Sender: TObject);
var
  i   : integer;
  sTmp: string;

begin
  if (Self.MDIChildCount > 0) then begin
    for i:= (Self.MDIChildCount - 1) downto 0 do
      if Self.MDIChildren[i].Active then break;
    (Self.MDIChildren[i] as TfrmEditor).SetHighlighterStatus(Sender);
    pgFiles.ActivePage.Tag:= (Self.MDIChildren[i] as TfrmEditor).SetHighlighterID;
  end
  else begin
    if Sender is TComboBox then begin
      sTmp:= trim((Sender as TComboBox).Text);
      SetSyntaxMenuItem(sTmp)
    end
    else begin
      sTmp:= StringReplace((Sender as TMenuItem).Caption,
                           '&',
                           EmptyStr,
                           []); // [rfReplaceAll])
      SetSyntaxComboBox(sTmp);
    end;
  end;
end;

procedure TfrmTinnMain.OpenUserGuidePDF(sWhere: string);
var
  sFile,
   sViewerDefault,
   sPathSumatra,
   sParameter: string;

begin
  sFile:= sPathTinnR +
          '\doc\User guide.pdf';

  sParameter:= '-view "continuous single page" ' + 
               '-reuse-instance ' +
               '-named-dest ' +
               sWhere;

  try
    sViewerDefault:= GetAssociation('.pdf');

    if pos('Sumatra',
           sViewerDefault) > 0 then
      // Open default PDF viewer
      ShellExecute(0,
                   'open',
                   Pchar(sFile),
                   Pchar(sParameter),
                   nil,
                   sw_shownormal)
    else begin
      sPathSumatra:= sPathTinnR +
                     '\sumatra\SumatraPDF.exe';

      // Open SumatraPDF viewer
      OpenCmdLine(sPathSumatra +
                  ' "' +
                  sFile +
                  '" ' +
                  sParameter,
                  sw_shownormal);
    end;
  except
    MessageDlg('PDF viewer is not accessible!',
               mtInformation,
               [mbOk],
               0);
  end;
end;

procedure TfrmTinnMain.menHelUserGuideClick(Sender: TObject);
begin
  OpenUserGuidePDF('"Contents"');
end;

procedure TfrmTinnMain.menHelUserListClick(Sender: TObject);
begin
  OpenUrl('http://groups.google.com/forum/?fromgroups#!forum/tinn-r');
end;

procedure TfrmTinnMain.actTobSearchVisibleExecute(Sender: TObject);
begin
  tobSearch.Visible             := not(tobSearch.Visible);
  menViewToolbarsSearch.Checked := tobSearch.Visible;
  pmenViewToolbarsSearch.Checked:= tobSearch.Visible;
end;

procedure TfrmTinnMain.actTobSyntaxVisibleExecute(Sender: TObject);
begin
  tobSyntax.Visible             := not(tobSyntax.Visible);
  menViewToolbarsSyntax.Checked := tobSyntax.Visible;
  pmenViewToolbarsSyntax.Checked:= tobSyntax.Visible;
end;

procedure TfrmTinnMain.actTobFilesVisibleExecute(Sender: TObject);
begin
  tobFile.Visible             := not(tobFile.Visible);
  menViewToolbarsFile.Checked := tobFile.Visible;
  pmenViewToolbarsFile.Checked:= tobFile.Visible;
end;

procedure TfrmTinnMain.actTobFilterVisibleExecute(Sender: TObject);
begin
  tobFilter.Visible             := not(tobFilter.Visible);
  menViewToolbarsFilter.Checked := tobFilter.Visible;
  pmenViewToolbarsFilter.Checked:= tobFilter.Visible;
end;

procedure TfrmTinnMain.actAboutExecute(Sender: TObject);
begin
  with TfrmAbout.Create(Self) do
    try
      ShowModal;
    finally
      frmTinnMain.Refresh;
      FreeAndNil(frmAbout);
      SetFocus_Main;
    end;
end;

procedure TfrmTinnMain.WMDropFiles(var Msg: TWMDropFiles);
var
  chTmp  : PChar;
  i,
   iSize,
   iCount: integer;
  slFile : TStringList;

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
        OpenFileIntoTinn(slFile.Strings[i]);

    finally
      FreeAndNil(slFile);
    end;
  finally
    DragFinish(Msg.Drop);
  end;
end;

procedure TfrmTinnMain.WMCopyData(var msg: TWMCopyData);
var
  chReceived   : PChar;
  sPathReceived: string;

begin
  chReceived   := msg.CopyDataStruct.lpData;
  sPathReceived:= AnsiExtractQuotedStr(chReceived,
                                       '"');
  CheckIfFileFromDvi(StringReplace(sPathReceived,
                                   '/',
                                   '\',
                                   [rfReplaceAll]));
end;

procedure TfrmTinnMain.SetFileSize_StatusBar(sFileName: string);

  // Return the exact file size for a file. Return zero if the file is not found.
  function FileSize(FileName : string) : Int64;
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

  function BytesToString(Bytes: real;
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
     (pos('Untitled',
          sFileName) > 0) then begin
    stbMain.Panels[5].Text:= EmptyStr;
    Exit;
  end
  else dSize:= FileSize(sFileName);

  if (dSize > 0) and
     (pgFiles.PageCount > 0) then begin
      sSize:= 'Size: ' +
              BytesToString(dSize);
      stbMain.Panels[5].Text:= sSize;
  end
  else stbMain.Panels[5].Text:= EmptyStr;
end;

procedure TfrmTinnMain.actReadOnlyExecute(Sender: TObject);
var
  bReadOnly: boolean;
  i        : integer;

begin
  i:= FindTopWindow;
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

  if not bReadOnly then (Self.MDIChildren[i] as TfrmEditor).EnableSave;

  actReadOnly.Checked:= not(actReadOnly.Checked);

  with (Self.MDIChildren[i] as tfrmEditor) do
  begin
    if synEditor.Modified then begin
      SetTabTitle('*');
      CheckSaveStatus;
    end
    else begin
      SetTabTitle(EmptyStr);
      CheckSaveStatus;
    end
  end;
end;

procedure TfrmTinnMain.actEditCopyExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          CopyToClipboard;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          CopyToClipboard;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          CopyToClipboard;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          CopyToClipboard;
  end;
end;

procedure TfrmTinnMain.actEditCutExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          CutToClipboard;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          CutToClipboard;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          CutToClipboard;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          CutToClipboard;
  end;
end;

procedure TfrmTinnMain.actEditPasteExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          PasteFromClipboard;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          PasteFromClipboard;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          PasteFromClipboard;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          PasteFromClipboard;
  end;
end;

procedure TfrmTinnMain.actEditRedoExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          Redo;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          Redo;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          Redo;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          Redo;
  end;
end;

procedure TfrmTinnMain.actEditSelectAllExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          SelectAll;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          SelectAll;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          SelectAll;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          SelectAll;
  end;
end;

procedure TfrmTinnMain.actTobEditVisibleExecute(Sender: TObject);
begin
  tobEdit.Visible             := not(tobEdit.Visible);
  menViewToolbarsEdit.Checked := tobEdit.Visible;
  pmenViewToolbarsEdit.Checked:= tobEdit.Visible;
end;

procedure TfrmTinnMain.FormCreate(Sender: TObject);
var
  i,
   j      : integer;
  miItem  : TMenuItem;
  sName,
   sFilter: string;

begin
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
  ToolsProjectControls(False);
  ToolsSearchControls(False);
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

    CheckOrigin;

    SetIniStructure;
    frmSplash.pb.Position:= 3;

    CheckVersion;

    sOldPreferencesTmp:= sPathIni +
                         '_tmp';

    SavePreferencesOfOldVersion;

    frmRterm:= TfrmRterm.Create(nil);
    frmSplash.pb.Position:= 4;

    SetPreferences_Application;
    SetPreferences_Editor;

    CheckIni;

    SetDataCompletion(synIOTip,
                      frmRterm.synIO,
                      sTriggerRtip);

    SetDataCompletion(synIODataCompletion,
                      frmRterm.synIO,
                      sTriggerRDataCompletion);

    CheckIniDock;
    frmSplash.pb.Position:= 5;

    CheckData;

    Application.CreateForm(TmodDados,
                           modDados);
    frmSplash.pb.Position:= 6;

    SetRcard;
    frmSplash.pb.Position:= 7;

    SetCompletion;
    SetRmirrors;
    frmSplash.pb.Position:= 8;

    SetShortcuts;

    frmTools.tbsLatex.TabVisible:= actLatexVisible.Checked;
    CheckLatex(False);

    CheckProject;

    CheckEditorOptions;

    CheckTemporary;
    
    frmSplash.pb.Position:= 9;

    DeleteDir(sOldPreferencesTmp);
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
    SaveNewIni_Application;                                                   // Will create a new and clean Tinn.tmp
    if FileExists(sPathIniTinn_File) then DeleteFile(sPathIniTinn_File);      // Delete old Tinn.ini

    RenameFile(sPathIniTinn_Tmp,
               sPathIniTinn_File);                                            // Set the new Tinn.ini

    // Editor
    SaveNewIni_Editor;                                                        // Will create a new and clean Tinn.tmp
    if FileExists(sPathIniEditor_File) then DeleteFile(sPathIniEditor_File);  // Delete old Tinn.ini

    RenameFile(sPathIniEditor_Tmp,
               sPathIniEditor_File);                                          // Set the new Editor.ini

    frmSplash.pb.Position:= 11;
  except
    MessageDlg(sPathIni + #13 + #13 +
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

  case iIOSyntax of
    0: actRtermSetIOSyntaxToTextExecute(nil);  // .txt
    1: actRtermSetIOSyntaxToRExecute(nil);     // .R
  end;

  case iLogSyntax of
    0: actRtermSetLogSyntaxToTextExecute(nil);  // .txt
    1: actRtermSetLogSyntaxToRExecute(nil);     // .R
  end;

  iRFormatted:= -1;

  Application.OnActivate:= AppActivate; // It controls when the application receives the focus.
                                        // It is necessary to procedure TfrmEditor.FileChanged
  slFileNotify:= TStringList.Create;

  with slFileNotify do begin
    Sorted:= True;
    Duplicates:= dupIgnore;
  end;
end;

procedure TfrmTinnMain.AppActivate(Sender: TObject);
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
          if MessageDlg(sTmp + #13 + #13 +
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

procedure TfrmTinnMain.LoadEditorKeystrokes;
var
  sEditor: string;
  stream : TStream;

begin
  sEditor:= (sPathEditor +
             '\Editor.kst');

  if FileExists(sEditor) then begin
    stream:= TFileStream.Create(sEditor,
                                fmOpenRead);

    with coEditor.Keystrokes do
      LoadFromStream(stream);

    FreeAndNil(stream);
  end;
end;

procedure TfrmTinnMain.SaveEditorKeystrokes;
var
  sEditor: string;
  stream : TStream;

begin
  sEditor:= sPathEditor +
            '\Editor.kst';

  if FileExists(sEditor) then
    DeleteFile(sEditor);

  stream:= TFileStream.Create(sEditor,
                              fmCreate);

  with coEditor.Keystrokes do
    SaveToStream(stream);

  FreeAndNil(stream);
end;

procedure TfrmTinnMain.UnpackFile(sFile,
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

procedure TfrmTinnMain.CheckOrigin;
begin
  with frmTools.memIniLog.Lines do begin
    Add('Version - ' +
        GetBuildInfo);

    Add('Started - ' +
        DateTimeToStr(Now));

    Add(EmptyStr);

    Add('1. Path of executable and sources (origin)');

    Add('  Tinn-R        - ' +
        Application.ExeName);
  end;

  sPathTinnR:= ExtractFilePath(Application.ExeName);

  Delete(sPathTinnR,
         length(sPathTinnR) - 4,
         5);  // Exclude '\bin\' of Tinn-R path

  sPathTinnRcom:= sPathTinnR +
                  '\package';

  sFileDataOrigin:= sPathTinnR +
                    '\data\data.zip';

  sUtilsOrigin:= sPathTinnR +
                 '\utils';

  sFileLatexOrigin:= sPathTinnR +
                     '\latex\latex.zip';

  sFileProjectOrigin:= sPathTinnR +
                       '\project\project.zip';

  with frmTools.memIniLog.Lines do begin
    Add('  data          - ' +
        sFileDataOrigin);

    Add('  utils         - ' +
        sUtilsOrigin);

    Add('  \Rinfo_b      - ' +
        sUtilsOrigin +
        '\Rinfo_b.R');

    Add('  \Rinfo_c      - ' +
        sUtilsOrigin +
        '\Rinfo_c.R');

    Add('  \Rinfo_load_b - ' +
        sUtilsOrigin +
        '\Rinfo_load_b.R');

    Add('  \Rinfo_load_c - ' +
        sUtilsOrigin +
        '\Rinfo_load_c.R');

    Add('  \Rinstall     - ' +
        sUtilsOrigin +
        '\Rinstall.R');

    Add('  latex         - ' +
        sFileLatexOrigin);
  end;
end;

procedure TfrmTinnMain.SavePreferencesOfOldVersion;

  function MakeBackup(sPathSource,
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
  if not FileExists(sPathIni +
                    '\colors\Custom_colors.ini') then Exit;

  sPathColors_OldVersion:= sPathIni +
                           '\colors';

  if DirectoryExists(sPathColors_OldVersion) then begin
    if MakeBackup(sPathColors_OldVersion,
                  sOldPreferencesTmp +
                  '\colors_bkp.zip',
                  '\*.ini') then bColors_OldVersion:= True;
  end;

  // Syntax of old version
  sPathSyntax_OldVersion:= sPathIni +
                           '\syntax';

  if DirectoryExists(sPathSyntax_OldVersion) then begin
    if MakeBackup(sPathSyntax_OldVersion,
                  sOldPreferencesTmp +
                  '\syntax_bkp.zip',
                  '\*.ini') then bSyntax_OldVersion:= True;
  end;
end;

procedure TfrmTinnMain.SetIniStructure;
begin
  sAppData      := GetSpecialFolder(CSIDL_APPDATA);
  sPathIni      := sAppData + '\Tinn-R';
  sPathApp      := sPathIni + '\app';
  sPathBkp      := sPathIni + '\bkp';
  sPathColor    := sPathIni + '\colors';
  sPathData     := sPathIni + '\data';
  sPathEditor   := sPathIni + '\editor';
  sPathLatex    := sPathIni + '\latex';
  sPathProject  := sPathIni + '\project';
  sPathSyntax   := sPathIni + '\syntax';
  sPathSyntaxBKP:= sPathIni + '\syntax bkp';
  sPathTmp      := GetEnvironmentVariable('TEMP') + '\Tinn-R';

  // Ini files
  sPathIniTinn_File  := sPathApp + '\Tinn.ini';
  sPathIniEditor_File:= sPathEditor + '\Editor.ini';

  ifTinn  := TIniFile.Create(sPathIniTinn_File);
  ifEditor:= TIniFile.Create(sPathIniEditor_File);

  sPathColor_Custom:= sPathColor + '\Custom_colors.ini';  // To cdMain

  with frmTools.memIniLog.Lines do begin
    Add(EmptyStr);
    Add('2. Path of ini folders');
    Add('  Tinn-R - ' + sPathIni);
    Add('  \' + ExtractFileName(sPathApp));
    Add('  \' + ExtractFileName(sPathBkp));
    Add('  \' + ExtractFileName(sPathColor));
    Add('  \' + ExtractFileName(sPathData));
    Add('  \' + ExtractFileName(sPathEditor));
    Add('  \' + ExtractFileName(sPathProject));
    Add('  \' + ExtractFileName(sPathLatex));
    Add('  \' + ExtractFileName(sPathSyntax));
    Add('  \' + ExtractFileName(sPathSyntaxBKP));
  end;
end;

procedure TfrmTinnMain.CheckIni;

  procedure CheckPriorTo_2(sPathUser,
                           sPathIni: string);
  begin
    try
      if DirectoryExists(sPathUser) and
        (StrToInt(sVersion_Ini[1]) < 2) then begin
        BackupSystemConfiguration(True);
        DeleteDir(sPathUser);
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
    Add('3.1. Tinn-R, bkp, colors, ini, syntax, syntax bkp and tmp');
  end;

  try
    CheckPriorTo_2(sPathIni,
                   sPathApp);

    // Tinn-R
    if (not DirectoryExists(sPathIni)) then begin
      CreateDir(sPathIni);
      frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                   sPathIni +
                                   ': CREATED');
    end
    else frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                      sPathIni +
                                      ': OK');

    // Tinn-R\app
    if (not DirectoryExists(sPathApp)) then begin
      CreateDir(sPathApp);
      frmTools.memIniLog.Lines.Add('  \' +
                                   ExtractFileName(sPathApp) +
                                   '        : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('  \' +
                                      ExtractFileName(sPathApp) +
                                      '        : OK');

    // Tinn-R\bkp
    if (not DirectoryExists(sPathBkp)) then begin
      CreateDir(sPathBkp);
      frmTools.memIniLog.Lines.Add('  \' +
                                   ExtractFileName(sPathBkp) +
                                   '        : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('  \' +
                                      ExtractFileName(sPathBkp) +
                                      '        : OK');

    // Tinn-R\colors
    if (not DirectoryExists(sPathColor)) then begin
      CreateDir(sPathColor);
      frmTools.memIniLog.Lines.Add('  \' +
                                   ExtractFileName(sPathColor) +
                                   '     : CREATED');
      // Recover colors from old version
      if bColors_OldVersion then UnpackFile(sOldPreferencesTmp +
                                            '\colors_bkp.zip',
                                            sPathColor,
                                            '*.*');
    end
    else frmTools.memIniLog.Lines.Add('  \' +
                                      ExtractFileName(sPathColor) +
                                      '     : OK');

    // Tinn-R\editor
    if (not DirectoryExists(sPathEditor)) then begin
      CreateDir(sPathEditor);
      frmTools.memIniLog.Lines.Add('  \' +
                                   ExtractFileName(sPathEditor) +
                                   '     : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('  \' +
                                      ExtractFileName(sPathEditor) +
                                      '     : OK');

    // Tinn-R\Syntax
    if (not DirectoryExists(sPathSyntax)) then begin
      CreateDir(sPathSyntax);
      frmTools.memIniLog.Lines.Add('  \' +
                                   ExtractFileName(sPathSyntax) +
                                   '     : CREATED');
      // Recover syntax from old version
      if bSyntax_OldVersion then UnpackFile(sOldPreferencesTmp +
                                            '\syntax_bkp.zip',
                                            sPathSyntax,
                                            '*.*');
    end
    else frmTools.memIniLog.Lines.Add('  \' +
                                      ExtractFileName(sPathSyntax) +
                                      '     : OK');

    // Tinn-R\syntax bkp
    if (not DirectoryExists(sPathSyntaxBKP)) then begin
      CreateDir(sPathSyntaxBKP);
      frmTools.memIniLog.Lines.Add('  \' +
                                   ExtractFileName(sPathSyntaxBKP) +
                                   ' : CREATED');
    end
    else frmTools.memIniLog.Lines.Add('  \' +
                                      ExtractFileName(sPathSyntaxBKP) +
                                      ' : OK');
  except
    raise;
    Exit;
  end;

  Application.ProcessMessages;

  // Main ini
  DeleteFilesOfPath(sPathIni);  // Necessary to remove trashes from previous versions related
                                // to fixed bug in drag and drop from R explorer interface.
  
  sPathReadme_User:= sPathIni +
                     '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_User);
  Rewrite(tfTmp);
    WriteLn(tfTmp, 'This main folder stores:' + #13 +
                   '''app'', ''bkp'', ''colors'', ''data'', ''editor'', ''latex'', ''project'', ''syntax'' and ''syntax bkp''.');
  CloseFile(tfTmp);


  // app
  sPathReadme_App:= sPathApp +
                    '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_App);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            '''Tinn.ini'' and ''Tinn_dock.ini'' files.');
  CloseFile(tfTmp);


  // bkp
  sPathReadme_Bkp:= sPathBkp +
                    '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_Bkp);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'Backups of old ini files.');
  CloseFile(tfTmp);


  // colors
  sPathReadme_Color:= sPathColor +
                      '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_Color);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'The ''Custom_colors.ini'' file.');
  CloseFile(tfTmp);


  // syntax
  sPathReadme_Syntax:= sPathSyntax +
                       '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_Syntax);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'All syntax user preferences.');
  CloseFile(tfTmp);


  // syntax bkp
  sPathReadme_SyntaxBKP:= sPathSyntaxBKP +
                          '\Readme.txt';
  AssignFile(tfTmp,
             sPathReadme_SyntaxBKP);
  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'Temporary backups of syntax preferences.');
  CloseFile(tfTmp);
end;

procedure TfrmTinnMain.CheckTemporary;
begin
  // Tinn-R: temporary folder
  with frmTools.memIniLog.Lines do begin
    Add(EmptyStr);
    Add('3.6. Temporary folder');
  end;

  if (DirectoryExists(sPathTmp)) then DeleteDir(sPathTmp);  // Tinn-R was terminated abnormally

  CreateDir(sPathTmp);

  frmTools.memIniLog.Lines.Add(' Tinn-R - ' +
                               sPathTmp +
                               ': CREATED');
end;

procedure TfrmTinnMain.CheckIniDock;
begin
  sIniDockFilePath:= (sPathApp +
                      '\Tinn_dock.ini');

  JvAppIniFileStorage.FileName:= sIniDockFilePath;
end;

procedure TfrmTinnMain.CheckData;

  procedure CreateDataDir;
  begin
    CreateDir(sPathData);
    zipKit.FileName:= sFileDataOrigin;
    zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

    with zipKit do begin
      BaseDirectory:= sPathData;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' +
                                 sPathData +
                                 ': CREATED');
  end;

  procedure MakeDataBackup(sFile: string);
  begin
    zipKit.StoreOptions:= [soRecurse];  // soRecurse: will include all files of all folders and sub-folders
    with zipKit do begin
      FileName:= sPathBkp +
                 RemoveFileExtension(sFile) +
                 '_bkp_' +
                 IntToStr(Integer(MonthOf(Date))) +
                 '.' +
                 IntToStr(Integer(DayOf(Date))) +
                 '.' +
                 IntToStr(Integer(YearOf(Date))) +
                 '.zip';
      AddFiles(sPathData + sFile,
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
   sFileCache     : string;

  tfTmp: TextFile;

begin
  sFileCache     := sPathData + '\Cache.xml';
  sFileRcard     := sPathData + '\Rcard.xml';
  sFileRmirrors  := sPathData + '\Rmirrors.xml';
  sFileComments  := sPathData + '\Comments.xml';
  sFileCompletion:= sPathData + '\Completion.xml';
  sFileShortcuts := sPathData + '\Shortcuts.xml';

  try
    with frmTools.memIniLog.Lines do begin
      Add(EmptyStr);
      Add('3.2. Data');
    end;

    if not DirectoryExists(sPathData) then CreateDataDir
    else begin
      frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                   sPathData +
                                   ': OK');

      if (bUpdate_Cache)      then MakeDataBackup('\Cache.xml');
      if (bUpdate_Rcard)      then MakeDataBackup('\Rcard.xml');
      if (bUpdate_Rmirrors)   then MakeDataBackup('\Rmirrors.xml');
      if (bUpdate_Comments)   then MakeDataBackup('\Comments.xml');
      if (bUpdate_Completion) then MakeDataBackup('\Completion.xml');
      if (bUpdate_Shortcuts)  then begin
        MakeDataBackup('\Shortcuts.xml');
        // Shortcuts in use: = Shortcuts.xml
        if (sShortcutsInUse = sPathdata +
            '\Shortcuts.xml') then begin
          RenameFile(sPathdata +
                     '\Shortcuts.xml',
                     sPathdata +
                     '\OldShortcuts.xml');

          UnpackFile(sFileDataOrigin,
                     sPathData,
                     'Shortcuts.xml');  // It is necessary to make a new copy from origin

          with modDados do              // All useful information related to user preferences (shortcuts) will be add int the new Shortcuts.xml
            ShortcutsValidation(sPathdata +
                                '\OldShortcuts.xml',
                                sPathdata +
                                '\Shortcuts.xml');
          DeleteFile(sPathdata +
                     '\OldShortcuts.xml');
        end
        // Shortcuts in use: <> Shortcuts.xml
        else begin
          UnpackFile(sFileDataOrigin,
                     sPathData,
                     'Shortcuts.xml');  // It is necessary to make a new copy from origin

          with modDados do              // All useful information related to user preferences (shortcuts) will be add int the new Shortcuts.xml
            ShortcutsValidation(sShortcutsInUse,
                                sPathdata +
                                '\Shortcuts.xml');
          DeleteFile(sShortcutsInUse);
        end;

        sShortcutsInUse:= sPathdata +
                          '\Shortcuts.xml';
      end;
    end;

    // Cache
    if not FileExists(sFileCache)  then begin
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Cache.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileCache) +
                                   '(version = ' +
                                   sCurrentVersion_Cache +
                                   ')' +
                                   ': CREATED');
    end
    else begin
    if bUpdate_Cache then
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Cache.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileCache) +
                                   '(version = ' +
                                   sCurrentVersion_Cache +
                                   ')' +
                                   ': OK');
    end;

    // Rcard
    if not FileExists(sFileRcard) then begin
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Rcard.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileRcard) +
                                   '(version = ' +
                                   sCurrentVersion_Rcard +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Rcard then
        UnpackFile(sFileDataOrigin,
                   sPathData,
                   'Rcard.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileRcard) +
                                   '(version = ' +
                                   sCurrentVersion_Rcard +
                                   ')' +
                                   ': OK');
    end;

    // Rmirrors
    if not FileExists(sFileRmirrors) then begin
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Rmirrors.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileRmirrors) +
                                   '(version = ' +
                                   sCurrentVersion_Rmirrors +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Rmirrors then
        UnpackFile(sFileDataOrigin,
                   sPathData,
                   'Rmirrors.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileRmirrors) +
                                   '(version = ' +
                                   sCurrentVersion_Rmirrors +
                                   ')' +
                                   ': OK');
    end;

    // Comments
    if not FileExists(sFileComments)  then begin
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Comments.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileComments) +
                                   '(version = ' +
                                   sCurrentVersion_Comments +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Comments then
        UnpackFile(sFileDataOrigin,
                   sPathData,
                   'Comments.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileComments) +
                                   '(version = ' +
                                   sCurrentVersion_Comments +
                                   ')' +
                                   ': OK');
    end;

    // Completion
    if not FileExists(sFileCompletion)  then begin
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Completion.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileCompletion) +
                                   '(version = ' +
                                   sCurrentVersion_Completion +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Completion then
        UnpackFile(sFileDataOrigin,
                   sPathData,
                   'Completion.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileCompletion) +
                                   '(version = ' +
                                   sCurrentVersion_Completion +
                                   ')' +
                                   ': OK');
    end;

    // Shortcuts
    if not FileExists(sShortcutsInUse) then sShortcutsInUse:= sPathdata +
                                                              '\Shortcuts.xml';
    if not FileExists(sFileShortcuts)  then begin
      UnpackFile(sFileDataOrigin,
                 sPathData,
                 'Shortcuts.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
                                   ExtractFileName(sFileShortcuts) +
                                   '(version = ' +
                                   sCurrentVersion_Shortcuts +
                                   ')' +
                                   ': CREATED');
    end
    else begin
      if bUpdate_Shortcuts then
        UnpackFile(sFileDataOrigin,
                   sPathData,
                   'Shortcuts.xml');

      frmTools.memIniLog.Lines.Add('  File - ' +
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
  sPathReadmeDB:= sPathData +
                  '\Readme.txt';

  AssignFile(tfTmp,
             sPathReadmeDB);

  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores (by default):' + #13 +
            'The XML files ''Cache.xmk'', ''Comments.xml'', ''Completion.xml'', ''Rcard.xlm'',  ''Rmirrors.xml'' and ''Shortcuts.xml''.');
  CloseFile(tfTmp);
end;

procedure TfrmTinnMain.CheckLatex(bReload: boolean);

  procedure CheckLatexDir(sDir: string;
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

  procedure CreateLatexDir;
  begin
    CreateDir(sPathLatex);
    zipKit.FileName:= sFileLatexOrigin;
    zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

    with zipKit do begin
      BaseDirectory:= sPathLatex;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' +
                                 sPathLatex +
                                 ': CREATED');
  end;

  procedure LoadSymbols(jviTmp: TJvImagesViewer;
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
      if DirectoryExists(sPathLatex) then begin  // Will make a backup of old latex folder
        zipKit.StoreOptions:= [soRecurse];       // soRecurse: will include all files of all folders and sub-folders

        with zipKit do begin
          FileName:= sPathBkp +
                     '\latex_bkp_' +
                     IntToStr(Integer(MonthOf(Date))) +
                     '.' +
                     IntToStr(Integer(DayOf(Date))) +
                     '.' +
                     IntToStr(Integer(YearOf(Date))) +
                     '.zip';
          AddFiles(sPathLatex +
                   '\*.*',
                   0);
          frmTools.memIniLog.Lines.Add('  Backup - ' +
                                       zipKit.FileName +
                                       ': DONE');
          CloseArchive;
        end;
      end;
      
      DeleteDir(sPathLatex);
      CreateLatexDir;
    end
    else
      if DirectoryExists(sPathLatex) then frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                                                       sPathLatex +
                                                                       ': OK')
                                     else CreateLatexDir;

    // Loading LaTeX Symbols
    // 01. accents
    CheckLatexDir(sPathLatex +
                  '\' +
                  '01. accents',
                  True);
    LoadSymbols(frmTools.jvivAccents,
                sPathLatex +
                '\' +
                '01. accents');

    // 02. arrow
    CheckLatexDir(sPathLatex + '\' + '02. arrow', True);
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '01. right');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '02. down');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '03. left');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '04. up');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '05. sloped');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '06. both');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '07. box');
    LoadSymbols(frmTools.jvivArrowRight,  sPathLatex + '\' + '02. arrow' + '\' + '01. right');
    LoadSymbols(frmTools.jvivArrowDown,   sPathLatex + '\' + '02. arrow' + '\' + '02. down');
    LoadSymbols(frmTools.jvivArrowLeft,   sPathLatex + '\' + '02. arrow' + '\' + '03. left');
    LoadSymbols(frmTools.jvivArrowUp,     sPathLatex + '\' + '02. arrow' + '\' + '04. up');
    LoadSymbols(frmTools.jvivArrowSloped, sPathLatex + '\' + '02. arrow' + '\' + '05. sloped');
    LoadSymbols(frmTools.jvivArrowBoth,   sPathLatex + '\' + '02. arrow' + '\' + '06. both');
    LoadSymbols(frmTools.jvivArrowBox,    sPathLatex + '\' + '02. arrow' + '\' + '07. box');

    // 03. bar
    CheckLatexDir(sPathLatex + '\' + '03. bar', True);
    LoadSymbols(frmTools.jvivBar, sPathLatex + '\' + '03. bar');

    // 04. bracket
    CheckLatexDir(sPathLatex + '\' + '04. bracket', True);
    LoadSymbols(frmTools.jvivBracket, sPathLatex + '\' + '04. bracket');

    // 05. dot
    CheckLatexDir(sPathLatex + '\' + '05. dot', True);
    LoadSymbols(frmTools.jvivDot, sPathLatex + '\' + '05. dot');

    // 06. geometry
    CheckLatexDir(sPathLatex + '\' + '06. geometry', True);
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '01. line');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '02. angle');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '03. triangle');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '04. star');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '05. box');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '06. diamond');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '07. circle');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '08. var');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '09. misc');
    LoadSymbols(frmTools.jvivGeometryLine,     sPathLatex + '\' + '06. geometry' + '\' + '01. line');
    LoadSymbols(frmTools.jvivGeometryAngle,    sPathLatex + '\' + '06. geometry' + '\' + '02. angle');
    LoadSymbols(frmTools.jvivGeometryTriangle, sPathLatex + '\' + '06. geometry' + '\' + '03. triangle');
    LoadSymbols(frmTools.jvivGeometryStar,     sPathLatex + '\' + '06. geometry' + '\' + '04. star');
    LoadSymbols(frmTools.jvivGeometryBox,      sPathLatex + '\' + '06. geometry' + '\' + '05. box');
    LoadSymbols(frmTools.jvivGeometryDiamond,  sPathLatex + '\' + '06. geometry' + '\' + '06. diamond');
    LoadSymbols(frmTools.jvivGeometryCircle,   sPathLatex + '\' + '06. geometry' + '\' + '07. circle');
    LoadSymbols(frmTools.jvivGeometryVar,      sPathLatex + '\' + '06. geometry' + '\' + '08. var');
    LoadSymbols(frmTools.jvivGeometryMisc,     sPathLatex + '\' + '06. geometry' + '\' + '09. misc');

    // 07. greek
    CheckLatexDir(sPathLatex + '\' + '07. greek', True);
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '01. lower');
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '02. upper');
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '03. var');
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '04. misc');
    LoadSymbols(frmTools.jvivGreekLower, sPathLatex + '\' + '07. greek' + '\' + '01. lower');
    LoadSymbols(frmTools.jvivGreekUpper, sPathLatex + '\' + '07. greek' + '\' + '02. upper');
    LoadSymbols(frmTools.jvivGreekVar,   sPathLatex + '\' + '07. greek' + '\' + '03. var');
    LoadSymbols(frmTools.jvivGreekMisc,  sPathLatex + '\' + '07. greek' + '\' + '04. misc');

    // 08. math
    CheckLatexDir(sPathLatex + '\' + '08. math', True);
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '01. function');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '02. logical');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '03. set');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '04. var');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '05. misc');
    LoadSymbols(frmTools.jvivMathFunction, sPathLatex + '\' + '08. math' + '\' + '01. function');
    LoadSymbols(frmTools.jvivMathLogical,  sPathLatex + '\' + '08. math' + '\' + '02. logical');
    LoadSymbols(frmTools.jvivMathSet,      sPathLatex + '\' + '08. math' + '\' + '03. set');
    LoadSymbols(frmTools.jvivMathVar,      sPathLatex + '\' + '08. math' + '\' + '04. var');
    LoadSymbols(frmTools.jvivMathMisc,     sPathLatex + '\' + '08. math' + '\' + '05. misc');

    // 09. misc
    CheckLatexDir(sPathLatex + '\' + '09. misc', True);
    LoadSymbols(frmTools.jvivMisc, sPathLatex + '\' + '09. misc');

    // 10. negation
    CheckLatexDir(sPathLatex + '\' + '10. negation', True);
    LoadSymbols(frmTools.jvivNegation, sPathLatex + '\' + '10. negation');

    // 11. operator
    CheckLatexDir(sPathLatex + '\' + '11. operator', True);
    LoadSymbols(frmTools.jvivOperator, sPathLatex + '\' + '11. operator');

    // 12. relation
    CheckLatexDir(sPathLatex + '\' + '12. relation', True);
    LoadSymbols(frmTools.jvivRelation, sPathLatex + '\' + '12. relation');

    // 13. sky
    CheckLatexDir(sPathLatex + '\' + '13. sky', True);
    CheckLatexDir(sPathLatex + '\' + '13. sky' + '\' + '01. solar');
    CheckLatexDir(sPathLatex + '\' + '13. sky' + '\' + '02. astrology');
    CheckLatexDir(sPathLatex + '\' + '13. sky' + '\' + '03. var');
    LoadSymbols(frmTools.jvivSkySolar,     sPathLatex + '\' + '13. sky' + '\' + '01. solar');
    LoadSymbols(frmTools.jvivSkyAstrology, sPathLatex + '\' + '13. sky' + '\' + '02. astrology');
    LoadSymbols(frmTools.jvivSkyVar,       sPathLatex + '\' + '13. sky' + '\' + '03. var');

    // 14. user_custom
    CheckLatexDir(sPathLatex + '\' + '14. user_custom', True);
    LoadSymbols(frmTools.jvivUserCustom, sPathLatex + '\' + '14. user_custom');
  except
    raise;
    Exit;
  end;
  sPathReadmeLatex:= sPathLatex +
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

procedure TfrmTinnMain.CheckProject;
var
  tfTmp: TextFile;

  procedure CreateProjectDemo;
  begin
    AssignFile(tfTmp,
               sPathProject +
               '\pDemo.tps');

    Rewrite(tfTmp);
      WriteLn(tfTmp,
              '\1. doc'                                           + #13 +
              '  ' + sPathProject + '\licence_gpl2.txt'           + #13 +
              '  ' + sPathProject + '\licence_gpl3.txt'           + #13 +
              '  ' + sPathProject + '\Tinn-R_recognized words.R'  + #13 +
              '\2. sample'                                        + #13 +
              '  ' + sPathProject + '\deplate.dplt'               + #13 +
              '  ' + sPathProject + '\pandoc.markdown'            + #13 +
              '  ' + sPathProject + '\Tinn-R_example of script.R' + #13 +
              '  ' + sPathProject + '\txt2tags.t2t'               + #13 +
              '\3. templates'                                     + #13 +
              '  ' + sPathProject + '\R doc_dataset.Rd'           + #13 +
              '  ' + sPathProject + '\R doc_empty.Rd'             + #13 +
              '  ' + sPathProject + '\R doc_function.Rd'          + #13 +
              '  ' + sPathProject + '\R html.Rhtml'               + #13 +
              '  ' + sPathProject + '\R markdown.Rmd'             + #13 +
              '  ' + sPathProject + '\R script.R'                 + #13 +
              '  ' + sPathProject + '\R_noweb.Rnw'                + #13 +
              '\4. utils'                                         + #13 +
              '  ' + sPathProject + '\Rinfo_b.R'                  + #13 +
              '  ' + sPathProject + '\Rinfo_c.R'                  + #13 +
              '  ' + sPathProject + '\Rinfo_load_b.R'             + #13 +
              '  ' + sPathProject + '\Rinfo_load_c.R'             + #13 +
              '  ' + sPathProject + '\Rinstall.R'                 + #13
              );

    CloseFile(tfTmp);
  end;

  procedure CreateProjectDir;
  begin
    CreateDir(sPathProject);
    zipKit.FileName:= sFileProjectOrigin;
    zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

    with zipKit do begin
      BaseDirectory:= sPathProject;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' +
                                 sPathProject +
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
      DeleteDir(sPathProject);
      CreateProjectDir;
      CreateProjectDemo;
    end
    else
      if DirectoryExists(sPathProject) then frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                                                         sPathProject +
                                                                         ': OK')
                                       else begin  // User may have removed manually!
                                         CreateProjectDir;
                                         CreateProjectDemo;
                                       end;
      if not FileExists(sPathProject +            // User may have removed manually or with remove project!
                        '\pDemo.tps') then
        CreateProjectDemo;
  except
    raise;
    Exit;
  end;

  AssignFile(tfTmp,
             sPathProject +
             '\Readme.txt');

  Rewrite(tfTmp);
    WriteLn(tfTmp,
            'This folder stores:' + #13 +
            'All files related to project demo of Tinn-R.' + #13 +
            'It is user customizable!');

  CloseFile(tfTmp);
end;

procedure TfrmTinnMain.CheckEditorOptions;

  procedure UpdateShortcutsDir;
  begin
    DeleteDir(sAppData +
              '\Tinn-R\shortcuts'); // Related to old versions of Tinn-R
        DeleteDir(sAppData +
              '\Tinn-R\editor shortcuts'); // Related to old versions of Tinn-R

    DeleteDir(sPathEditor);
    CreateDir(sPathEditor);
  end;

var
  sPathReadmeEditor: string;
  tfTmp            : TextFile;

begin
  try
    with frmTools.memIniLog.Lines do begin
      Add(EmptyStr);
      Add('3.5. Editor options');
    end;

    LoadEditorKeystrokes;
    UpdateShortcutsDir;
    frmTools.memIniLog.Lines.Add('  Main folder - ' +
                                 sPathEditor +
                                 ': CREATED');

    frmTools.memIniLog.Lines.Add('  File - ' +
                                 'Editor.kst' +
                                 ': OK');  // Created in other place
  except
    raise;
    Exit;
  end;
  sPathReadmeEditor:= sPathEditor +
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

procedure TfrmTinnMain.SetPathRTerm;
begin
  if (sRversion <> EmptyStr) and
     IsValidNumber_RVersion(sRversion) and
     // In the R version 2.12.0 the path of executables was changed
     (AnsiCompareStr(sRversion,
                     '2.12.0') < 0) then sPathRterm:= sPathR +
                                                      '\bin\Rterm.exe'
  else
    if bRArchitecture64 then sPathRterm:= sPathR +
                                          '\bin\x64\Rterm.exe'
                        else sPathRterm:= sPathR +
                                          '\bin\i386\Rterm.exe';
end;

procedure TfrmTinnMain.SetPathRgui;
begin
  if (sRversion <> EmptyStr) and
     IsValidNumber_RVersion(sRversion) and
     // In the R version 2.12.0 the path of executables was changed
     (AnsiCompareStr(sRversion,
                     '2.12.0') < 0) then sPathRgui:= sPathR +
                                                     '\bin\Rgui.exe'
  else
    if bRArchitecture64 then sPathRgui:= sPathR +
                                         '\bin\x64\Rgui.exe'
                        else sPathRgui:= sPathR +
                                         '\bin\i386\Rgui.exe';
end;

procedure TfrmTinnMain.SetRcard;
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

procedure TfrmTinnMain.SetCompletion;
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

procedure TfrmTinnMain.SetRmirrors;
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

procedure TfrmTinnMain.BuildMRU(var miItem: TMenuItem);
var
  i    : integer;
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

procedure TfrmTinnMain.UpdateMRU(var miItem: TMenuItem;
                                 sFileName: string);
var
  i,
   j   : integer;
  slTmp: TStringList;
  sTmp : string;

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
 BuildMRU(miItem);
 FreeAndNil(slTmp);
end;

procedure TfrmTinnMain.RecentFileClick(Sender: TObject);
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
 
  if FileExists(sTmp) then OpenFileIntoTinn(sTmp)
  else
    // Takes it off the fileMRU list
    if (MessageDlg(sTmp + #13 + #13 +
                   'File does not exist.' + #13 +
                   'Would you like to remove it from MRU (Most Recent Used) list?',
                   mtInformation,
                   [mbYes, mbNo],
                   0) = mrYes) then UpdateMRU(menFileRecentFiles,
                                              sTmp);
end;

function TfrmTinnMain.FindWindowByName(sName: string): integer;
var
  i       : integer;
  bFound  : boolean;
  sCaption: string;

begin
  bFound:= False;
 
  for i:= (Self.MDIChildCount - 1) downto 0 do begin
    sCaption:= frmEditor.ScrubCaption(Self.MDIChildren[i].Caption);
    if (UpperCase(sCaption) = UpperCase(sName)) then begin
      bFound:= True;
      break;
    end;
  end;
 
  if bFound then Result:= i
            else Result:= -1;
end;

function TfrmTinnMain.FindTopWindow: integer;
var
  i     : integer;
  bFound: boolean;

begin
  bFound:= False;
  for i:= (Self.MDIChildCount-1) downto 0 do begin
    if (Self.MDIChildren[i].Active = True) then begin
      bFound:= True;
      break;
    end;
  end;
  if bFound then Result:=  i
            else Result:= -1;
end;

procedure TfrmTinnMain.actRguiReturnFocusExecute(Sender: TObject);
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

procedure TfrmTinnMain.actRmirrorsCopyHostExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdRmirrorsHost.Text;
end;

procedure TfrmTinnMain.actRmirrorsCopyURLExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdRmirrorsURL.Text;
end;

procedure TfrmTinnMain.actRmirrorsEditExecute(Sender: TObject);
begin
  sRmirrorsBookMark:= modDados.cdRmirrors.Bookmark;
  menToolsDatabaseMirrorsRClick(nil);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actRmirrorsHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Mirrors (R)"');
end;

procedure TfrmTinnMain.actRmirrorsOpenURLDefaultExecute(Sender: TObject);
begin
  OpenUrl(frmTools.stbRMirrors.Panels[1].Text);
end;

procedure TfrmTinnMain.actRmirrorsOpenURLCurrentExecute(Sender: TObject);
begin
  OpenUrl(frmTools.dbeRmirrorsURL.Text);
end;

procedure TfrmTinnMain.actRmirrorsSetReposExecute(Sender: TObject);
var
  sTmp: string;
  
begin
  sRmirror:= modDados.cdRmirrorsURL.Text;

  sTmp:= 'options(''repos''=' +
                  '''' +
                  sRmirror +
                  '''' +
                  ')';

  DoSend(sTmp);

  frmTools.stbRMirrors.Panels[1].Text:= sRmirror;
end;

procedure TfrmTinnMain.RmirrorsInterface_Update;
begin
  // TfrmRmirrors.FormActivate
  with ModDados do begin
    cdRmirrors.Filtered:= False;

    with frmTinnMain do
      frmTools.lbCountries.Selected[iCountriesFilter]:= False;

    cdRmirrors.Bookmark:= frmTinnMain.sRmirrorsBookMark;
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
    RmirrorsCountriesFilter(nil);

    with frmTinnMain do begin
      frmTools.lbCountries.Items:= slRmirrors_Countries;
      frmTools.lbCountries.Refresh;
    end;

    FreeAndNil(slRmirrors_Countries);
  end;

  // TfrmRmirrors.FormClose
  with frmTools do begin
    lbCountries.ItemIndex:= frmTinnMain.iCountriesFilter;
    lbCountriesClick(Self);
  end;

  with stbMain do begin
    Panels[7].Text:= 'Done!';
    Panels[8].Text:= 'The file ' +
                     '''mirrors.xml'' ' +
                     'was updated in ' +
                     sPathData;
  end;
end;

procedure TfrmTinnMain.actRmirrorsUpdateExecute(Sender: TObject);
var
  i    : integer;
  sPath,
   sTmp: string;

begin
  if Rterm_Running and
     (not frmRTerm.cRterm.bRterm_Ready) then Exit
                                        else Sleep(10*iDelay);

  sPath:= sUtilsOrigin +
          '\Rinfo_c.R';  // c: complete (will update CRAN mirrors)

  sTmp:= 'source('''+
          sPath +
          ''')';

  sTmp:= DosPathToUnixPath(sTmp);
  DoSend(sTmp);

  sPath:= sPathTmp +
          '\Rmirrors.txt';

  i:= 1;
  repeat
    Sleep(iDelay);
    if FileExists(sPath) then Break
                         else inc(i);
  until (i = 20);

  if (FileExists(sPath)) then
    with modDados do
      if (not Rmirrors_Update(sPath)) then begin
        MessageDlg('Sorry, it was not possible to update the dataset from CRAN mirrors!',
                   mtWarning,
                   [mbOk],
                   0);
        Exit;
      end;

  RmirrorsInterface_Update;
end;

procedure TfrmTinnMain.actDataRmirrorsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsRmirrors do begin
    TabVisible:= not TabVisible;
    actDataRmirrorsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.OnTop(hHandle: HWND);
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

procedure TfrmTinnMain.actOnTopExecute(Sender: TObject);
begin
  if not actOnTop.Checked then begin
    bOnTop:= True;
    OnTop(Application.Handle);
    actOnTop.Checked:= bOnTop;
  end
  else begin
    bOnTop:= False;
    OnTop(Application.Handle);
    actOnTop.Checked:= bOnTop;
  end;
end;

procedure TfrmTinnMain.UpdateCursorPos(Sender: TSynEdit);
var
  bcCol     : TDisplayCoord;
  bcLin     : TBufferCoord;
  iLineCount: Integer;

begin
  bcLin     := Sender.CaretXY;
  bcCol     := Sender.DisplayXY;
  iLineCount:= Sender.Lines.Count;
  if (iLineCount = 0) then iLineCount:= 1;
  stbMain.Panels[2].Text:= Format('%d/%d: %d',
                                  [bcLin.Line, iLineCount, bcCol.Column]);
end;

procedure TfrmTinnMain.SetSyntaxMenuItem(sSynName: string);
var
  i   : integer;
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

procedure TfrmTinnMain.SetSyntaxComboBox(sSynName: string);
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

procedure TfrmTinnMain.FormCloseQuery(Sender: TObject;
                                      var bCanClose: Boolean);
begin
  bRtermOptionCancel:= False;

  if Rterm_Running then actRContTermStartCloseExecute(nil);
  bCanClose:= not bRtermOptionCancel;  // If the choice is 'Cancel' don't close

  if bCanClose then begin
    CheckIfProjectWasChanged;
    Application.ProcessMessages;

    DeleteDir(sPathTmp);

    if not bRestored then begin  // If it was made a restore will not save to ini!
      WriteIniFile_Application(False);

      WriteIniFile_Editor(False);

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

    // Save custom colors
    if FileExists(sPathColor_Custom) then cdMain.CustomColors.SaveToFile(sPathColor_Custom);

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

procedure TfrmTinnMain.DrawSelectionMode(iSelMode: integer);
var
  iLeft: integer;

begin
  with stbMain do
  iLeft:= Panels[0].Width +
          Panels[1].Width +
          Panels[2].Width +
          Panels[3].Width + 4;

  imlStatusBar.Draw(stbMain.Canvas,
                iLeft,
                2,
                3);

  imlStatusBar.Draw(stbMain.Canvas,
                iLeft,
                2,
                iSelMode);
end;

procedure TfrmTinnMain.pgFilesChange(Sender: TObject);
var
  i: integer;

  sTmp,
   sNodeToSelect,
   sPageSelected : string;

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
    Panels[7].Text:= EmptyStr;
    Panels[8].Text:= EmptyStr;
  end;

  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  sTmp:= pgFiles.ActivePage.Hint;
  i:= FindWindowByName(sTmp);

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

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
      case synEDitor.SelectionMode of
       {smNormal: DrawSelectionMode(0);
        smLine  : DrawSelectionMode(1);
        smColumn: DrawSelectionMode(2);}
        smNormal: stbMain.Panels[4].Text:= 'Normal';
        smLine  : stbMain.Panels[4].Text:= 'Line';
        smColumn: stbMain.Panels[4].Text:= 'Column';
      end;
    end;
  end;

  i:= FindTopWindow;
  synMR.Editor:= (Self.MDIChildren[i] as TfrmEditor).synEditor;

  SetDataCompletion(synEditorTip,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor,
                    sTriggerRtip);

  SetDataCompletion(synEditor2Tip,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                    sTriggerRtip);

  SetDataCompletion(synEditorDataCompletion,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor,
                    sTriggerRDataCompletion);

  SetDataCompletion(synEditor2DataCompletion,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                    sTriggerRDataCompletion);

  UpdateHexViewer;
end;

procedure TfrmTinnMain.actPrintExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
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
        with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
          if (sActiveEditor = 'synEditor')       then ShowDialog(synEditor)
          else if (sActiveEditor = 'synEditor2') then ShowDialog(synEditor2);
        end;
      end;
    finally
      FreeAndNil(frmConfigurePrint);
      frmTinnMain.Repaint;
      SetFocus_Main;
    end;
  end;
end;

procedure TfrmTinnMain.actFilesTabsTopExecute(Sender: TObject);
begin
  with pgFiles do begin
    Align       := alTop;
    TabsPosition:= fsdTop;
  end;
  actFilesTabsTop.Checked:= True;
  //if (Self.MDIChildCount > 0) then UdatePgFiles;
end;

procedure TfrmTinnMain.actFilesTabsBottomExecute(Sender: TObject);
begin
  with pgFiles do begin
    Align       := alBottom;
    TabsPosition:= fsdBottom;
  end;
  actFilesTabsBottom.Checked:= True;
  //if (Self.MDIChildCount > 0) then UdatePgFiles;
end;

procedure TfrmTinnMain.actGutterVisibleExecute(Sender: TObject);
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
  UpdateRterm_Appearance(False);
end;

procedure TfrmTinnMain.actLineNumbersVisibleExecute(Sender: TObject);
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

procedure TfrmTinnMain.actOpenMaximizedExecute(Sender: TObject);
begin
  actOpenMaximized.Checked:= not(actOpenMaximized.Checked);
end;

procedure TfrmTinnMain.actFileSaveAllExecute(Sender: TObject);
var
  i,
   iChildID,
   iActivePage: integer;
  sTmp        : string;

begin
  if (pgFiles.PageCount > 0) then begin
    // Get the starting window ID
    iActivePage:= pgFiles.ActivePageIndex;

    // Loop through all windows and save files
    for i:= 0 to (pgFiles.PageCount - 1) do begin
      pgFiles.ActivePageIndex:= i;
      sTmp    := pgFiles.ActivePage.Hint;
      iChildID:= FindWindowByName(sTmp);
      MDIChildren[iChildID].BringToFront;
      Application.ProcessMessages;
      iChildID:= FindWindowByName(sTmp);
      with (Self.MDIChildren[iChildID] as tfrmEditor) do
        if synEditor.Modified then
      	  actFileSaveExecute(Sender);
    end;

    // Bring back the starting window
    pgFiles.ActivePageIndex:= iActivePage;
    sTmp    := pgFiles.ActivePage.Hint;
    iChildID:= FindWindowByName(sTmp);
    MDIChildren[iChildID].BringToFront;
  end;
  actFileSaveAll.Enabled:= False;

  UpdateHexViewer;
end;

procedure TfrmTinnMain.tbFilterClick(Sender: TObject);
var
  i,
   iStartFile,
    iNewFile  : integer;

  rsGrep: TRegExpr;
  slTmp : TStringList;
  sTmp  : string;

begin
  if (pgFiles.PageCount = 0) then begin
    MessageDlg('No archive is opened!',
               mtInformation,
               [mbOk],
               0);
    edFilter.Text:= EmptyStr;
    Exit;
  end;

  if (edFilter.TexT = EmptyStr) then begin
    MessageDlg('You need to define a RegEx filter before running it!',
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
    iStartFile:= FindTopWindow;
    slTmp.Text:= (Self.MDIChildren[iStartFile] as tfrmEditor).synEditor.Lines.text;
    // Create new tab and window
    actFileNewExecute(Sender);
    iNewFile         := FindTopWindow;
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

procedure TfrmTinnMain.tbiPandocClick(Sender: TObject);
begin
  menToolsConversionPandocClick(nil);
end;

procedure TfrmTinnMain.actColorsPreferenceExecute(Sender: TObject);
var
  dlg: TfrmColors;

  i: integer;

  sSyntaxBackupFile : string;

begin
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
      sSyntaxBackupFile:= sPathSyntaxBKP +
                          '\syntax_bkp.zip';

      try
        DeleteDir(sPathSyntax);
        zipKit.ExtractOptions:= [eoCreateDirs, eoRestorePath];

        with zipKit do begin
          FileName     := sSyntaxBackupFile;
          BaseDirectory:= ExtractFileDrive(sPathIni) +
                                           '\';
          ExtractFiles('*.*');
        end;

        zipKit.CloseArchive;
        if FileExists(sSyntaxBackupFile) then DeleteFile(sSyntaxBackupFile);
      except
        // TODO
      end;
      dmSyn.LoadSyntaxFromIni;
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

  UpdateAppearance(False);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actStatusBarVisibleExecute(Sender: TObject);
begin
  stbMain.Visible            := not(stbMain.Visible);
  actStatusBarVisible.Checked:= stbMain.Visible;
  //iConsoleHeight:= frmConsole.pgConsole.Height;
end;

procedure TfrmTinnMain.actSpecialCharVisibleExecute(Sender: TObject);
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

procedure TfrmTinnMain.SetTabTitle(sStat: string);
begin
  if (pgFiles.PageCount > 0) then begin
    if (not actReadOnly.Checked) then pgFiles.ActivePage.Caption:= StripPath(pgFiles.ActivePage.Hint) +
                                                                   sStat
                                 else pgFiles.ActivePage.Caption:= '<' +
                                                                   StripPath(pgFiles.ActivePage.Hint) +
                                                                   sStat +
                                                                   '>'
  end;
end;

procedure TfrmTinnMain.actPgFilesVisibleExecute(Sender: TObject);
begin
  pgFiles.Visible          := not pgFiles.Visible;
  actPgFilesVisible.Checked:= pgFiles.Visible;
end;

procedure TfrmTinnMain.RemoveTab(sTabCaption: string);
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

procedure TfrmTinnMain.actOpenMRUExecute(Sender: TObject);
var
  i    : integer;
  slTmp: TStringList;

begin
  // Open all files in fileMRU
  slTmp:= TStringList.Create;
 
  for i:= 0 to (menFileRecentFiles.Count - 1) do
    slTmp.Add(menFileRecentFiles.Items[i].Caption);
 
  for i:= 0 to (slTmp.Count - 1) do begin
    if FileExists(slTmp.Strings[i]) then OpenFileIntoTinn(slTmp.Strings[i])
    else begin
      // Take it off the fileMRU list
      if (MessageDlg(slTmp.Strings[i] + #13 + #13 +
                     'File does not exist.' + #13 +
                     'Would you like to remove it from MRU (Most Recent Used) list?',
                     mtInformation,
                     [mbYes, mbNo],
                     0) = mrYes) then
        UpdateMRU(menFileRecentFiles,
                  slTmp.Strings[i]);
    end;
  end;
 
  FreeAndNil(slTmp);
end;

procedure TfrmTinnMain.actProjectOpenNodeExecute(Sender: TObject);
begin
  with frmTools do
    DoProjectOpenNode;
end;

procedure TfrmTinnMain.SearchInOpenFiles(var iFileCount,
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
      sFileName:= frmEditor.ScrubCaption((Self.MDIChildren[i] as TfrmEditor).Caption);
 
      with stbMain do begin
        Panels[7].Text:= 'Search in file(s)';
        if (Length(sFileName) > 100) then Panels[8].Text:= ExtractFileDrive(sFileName) +
                                                           '\...\' +
                                                           ExtractFileName(sFileName)
                                     else Panels[8].Text:= sFileName;
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
    Panels[7].Text:= EmptyStr;
    Panels[8].Text:= EmptyStr;
    Refresh;
  end;

  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

end;

procedure TfrmTinnMain.ClearMRU;
begin
  slFileMRU.Clear;
  pmenMainMRU.Items.Clear;
  while (menFileRecentFiles.Count > 0) do
    menFileRecentFiles.Delete(0);
end;

procedure TfrmTinnMain.MinimizeTinnAfterLastFile;
begin
  if bMinimizeTinnAfterLastFile then Application.Minimize;
end;

procedure TfrmTinnMain.SearchInDirectories(const sDir,
                                                 sMask: string;
                                           var iFileCount,
                                               iMatchCount,
                                               iTotFileCount: integer);
var
  bFileFind   : boolean;

  i,
   j,
   iPosSlash,
   iDirLen,
   iLinePos : integer;

  seTmp : TSynEdit;
  slFile: TStringList;

  sPath,
   lastChar,
   tmpLine : string;

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
      iDirLen  := Length(sDir);
      lastChar := copy(sDir,
                       iDirLen,
                       1);

      iPosSlash:= pos('\',
                      lastChar);

      if (iPosSlash = 0) then sPath:= sDir +
                                      '\'
                         else sPath:= sDir;

      // Get a file list
      TraverseDir(sPath,
                  slFile,
                  sMask);

      for i:= 0 to (slFile.Count - 1) do begin
        with stbMain do begin
          Panels[7].Text:= 'Search in directory(ies)';
          if (Length(slFile[i]) > 100) then Panels[8].Text:= ExtractFileDrive(slFile[i]) +
                                                             '\...\' +
                                                             ExtractFileName(slFile[i])
                                       else Panels[8].Text:= slFile[i];
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
      Panels[7].Text:= EmptyStr;
      Panels[8].Text:= EmptyStr;
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

procedure TfrmTinnMain.menToolsUtilsStringReplaceClick(Sender: TObject);
var
  i: integer;

  seEditor,
   seTmp  : TSynEdit;

begin
  i:= FindTopWindow;
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

  SavePriorClipboardText;
  seTmp.CutToClipboard;
  seEditor.PasteFromClipboard;
  RestorePriorClipboardText;

  FreeAndNil(seTmp);
end;

function TfrmTinnMain.StripRegExPower(sSearchText: string): string;
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

procedure TfrmTinnMain.SetupSearchParameters(sSearchText: string);
begin
  if rsSearch = nil then rsSearch:= TRegExpr.Create;
  if (Length(trim(sSearchText)) = 0) then sSearchText:= ' ';
  if not bSearchRegExp then sSearchText:= StripRegExPower(sSearchText);
  if bSearchWholeWords then sSearchText:= sSearchText +
                                          '\W';
  rsSearch.ModifierI := not bSearchCaseSensitive;
  rsSearch.Expression:= sSearchText;
end;

procedure TfrmTinnMain.TraverseDir(sPath: string;
                                   var tsFileList: TStringList;
                                   sMask: string);
var
  curFile: WIN32_FIND_DATA;
  hHandle: THandle;

  i,
   iDirFound: integer;

  slPath: TStringList;
  srDir : TSearchRec;
  sTmp  : string;

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
        TraverseDir(sTmp,
                    tsFileList,
                    sMask);
      end;
    finally
      FreeAndNil(slPath);
    end;
  end;
end;

procedure TfrmTinnMain.synMRStateChange(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if (synMR.State = msRecording) then alMain.OnExecute:= RecordActions
    else if Assigned(alMain.OnExecute) then alMain.OnExecute:= nil;
end;

procedure TfrmTinnMain.RecordActions(baAction: TBasicAction;
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

      with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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
      MessageDlg(e.message,
                 mtError,
                 [mbOk],
                 0);
  end;
end;

procedure TfrmTinnMain.tbReloadClick(Sender: TObject);
begin
  actReloadExecute(nil);
end;

procedure TfrmTinnMain.panProjectDockSiteDockDrop(Sender: TObject;
                                                  Source: TDragDockObject;
                                                  X,
                                                  Y: Integer);
begin
  panProjectDockSite.Constraints.MinWidth:= 20;
  panProjectDockSite.Width               := 150;
  //splTools.Visible                       := True;
end;

procedure TfrmTinnMain.actProjectNewExecute(Sender: TObject);
var
  sFileExt: string;

begin
  // New Project
  CheckIfProjectWasChanged;
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
        if (MessageDlg(sProjectName + #13 + #13 +
                       'Do you want to overwrite this file?',
                       mtConfirmation,
                       [mbYes, mbCancel],
                       0) <> idYes) then Exit;

      CreateProject;
      SaveProject;
      UpdateProjectMRU(menProjRecent,
                       sProjectName);
      ToolsProjectControls(True);
    end;
    sdMain.Filter:= slFilters.Text;
  end;
end;

procedure TfrmTinnMain.panProjectDockSiteUnDock(Sender: TObject;
                                                Client: TControl;
                                                NewTarget: TWinControl;
                                                var Allow: Boolean);
begin
  panProjectDockSite.Constraints.MinWidth:= 1;
  panProjectDockSite.Width               := 0;
  //splTools.Visible                       := False;
end;

procedure TfrmTinnMain.actFilesAddCurrentExecute(Sender: TObject);
var
  i: integer;

begin
  // Add the current file to the project
  if (pgFiles.PageCount = 0) then Exit;
  if (frmTools.tvProject.SelectionCount <= 0) then Exit;
  if (frmTools.tvProject.Selected.Level = 1) or
     (frmTools.tvProject.Selected.Level = 2) then begin
    if (slProjectChanges = nil) then slProjectChanges:= TStringList.Create;

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
      slProjectChanges.Add(sActiveFile);
      i:= slProjectChanges.IndexOf(sActiveFile);
    end;

    AddFile(slProjectChanges[i]);
  end;
end;

procedure TfrmTinnMain.actProjectOpenDemoExecute(Sender: TObject);
var
  fTmp: string;

begin
  fTmp:= sPathProject +
         '\pDemo.tps';

  if FileExists(fTmp) then
    OpenFileIntoTinn(fTmp)
  else
    MessageDlg(fTmp + #13 + #13 +
               'The file was not found.' + #13 +
               'Please, contact developers!',
               mtWarning,
               [mbOk],
               0);
end;

procedure TfrmTinnMain.actProjectOpenExecute(Sender: TObject);
var
  od   : TOpenDialog;
  sFile: string;

begin
  // Open an existing project
  od:= TOpenDialog.Create(Self);
  try
    od.InitialDir:= sWorkingDir;
    od.Filter:= 'Tinn project space (*.tps)|*.tps';

    if od.Execute then begin
      sFile:= od.FileName;
      OpenFileIntoTinn(sFile);
    end;
  finally
    FreeAndNil(od);
  end;
  Self.Repaint;
end;

procedure TfrmTinnMain.actProjectSaveExecute(Sender: TObject);
begin
  SaveProject;
  UpdateProjectMRU(menProjRecent,
                   sProjectName);
end;

procedure TfrmTinnMain.actFilesRemoveExecute(Sender: TObject);
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

procedure TfrmTinnMain.CheckIfProjectWasChanged;
var
  i: integer;

begin
  if not bProjectChanged then Exit;

  // Bring to front the textual project, if it is opened
  i:= FindWindowByName(sProjectName);
  if (i > -1) then Self.MDIChildren[i].BringToFront;

  if (MessageDlg(sProjectName + #13 + #13 +
                 'This project was changed!' + #13 +
                 'Do you like to save the changes?',
                 mtConfirmation,
                 [mbYes, mbNo],
                 0) = mrYes) then actProjectSaveExecute(nil);
end;

procedure TfrmTinnMain.ClearStatusBar;
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

procedure TfrmTinnMain.ClearStatusBarProject;
begin
  with frmTools.stbProject do begin
    Panels[1].Text:= EmptyStr;
    Panels[3].Text:= EmptyStr;
    Panels[5].Text:= EmptyStr;
    Refresh;
  end;
end;

procedure TfrmTinnMain.actProjectCloseExecute(Sender: TObject);
var
  iPos: integer;

begin
  CheckIfProjectWasChanged;
  Application.ProcessMessages;
  if not CloseAllFilesOfProject then Exit;

  // Close also the *.tps project file
  iPos:= FindWindowByName(sProjectName);
  try
    if (iPos > -1) then (Self.MDIChildren[iPos] as TfrmEditor).Close;
    if (pgFiles.PageCount = 0) then ClearStatusBar
  except
    MessageDlg(sProjectName + #13 + #13 +
               'The project file above was not found!',
               mtInformation,
               [mbOk],
               0);
  end;

  ToolsProjectControls(False);

  with frmTools.tvProject.Items do begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;

  if Assigned(slProjectChanges) then slProjectChanges.Clear;
  bProjectChanged:= False;
  ClearStatusBarProject;
end;

procedure TfrmTinnMain.actFilesOpenAllExecute(Sender: TObject);
begin
  OpenAllFiles;
end;

procedure TfrmTinnMain.actFilesCloseAllExecute(Sender: TObject);
begin
  // Close all files of the active project;
  CloseAllFilesOfProject;
end;

procedure TfrmTinnMain.OpenProjectIntoTinn(sProjectName: string);
begin
  // If not panTools.Visible then actToolsVisibleToogleExecute(nil);
  if not frmTools.tbsProject.TabVisible then actProjectVisibleExecute(nil);
  Application.ProcessMessages;
  frmTools.pgTools.ActivePage:= frmTools.tbsMisc;
  frmTools.pgMisc.ActivePage:= frmTools.tbsProject;
  OpenProject;
  bProjectChanged:= False;
  ToolsProjectControls(True);

  UpdateProjectMRU(menProjRecent,
                   sProjectName);
  SortProject;
  ClearStatusBarProject;

  with frmTools.stbProject do begin
    Panels[1].Text:= IntToStr(frmTools.tvProject.Items.Count);
    Refresh;
  end;

  with frmTools.tvProject do
    Selected:= Items.GetFirstNode;
end;

procedure TfrmTinnMain.BuildProjectMRU(var miItem: TMenuItem);
var
  i     : integer;
  miMRU : TMenuItem;
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
                          RecentProjectFileClick,
                          0,
                          format('File%d',
                                 [i]));
          miMRU.Tag:= i;

          miItem.Add(miMRU);

          miMRU:= newItem(slprojectMRU.Values[IntToStr(i)],
                          0,
                          False,
                          True,
                          RecentProjectFileClick,
                          0,
                          format('File%d',
                                 [i]));

          pmenProjectMRU.Items.Add(miMRU);
        end;
      end;
    end;
  end;
end;

procedure TfrmTinnMain.UpdateProjectMRU(var miItem: TMenuItem;
                                        sFileName: string);
var
  i,
   j: integer;

  slTmp: TStringList;
  sTmp : string;

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
  BuildProjectMRU(miItem);
  FreeAndNil(slTmp);
end;

procedure TfrmTinnMain.RecentProjectFileClick(Sender: TObject);
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
    OpenFileIntoTinn(sTmp)
  else begin
    // Take it off the fileMRU list
    if (MessageDlg(sTmp + #13 + #13 +
                   'File does not exist.' + #13 +
                   'Would you like to remove it from MRU (Most Recent Used) list?',
                   mtInformation,
                   [mbYes, mbNo],
                   0) = mrYes) then
      UpdateProjectMRU(menProjRecent,
                       sTmp);
  end;
end;

procedure TfrmTinnMain.pgFilesMouseDown(Sender: TObject;
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
     (pgFiles.ActivePageIndex = i) then TabMenuPopup(pgFiles,
                                                     X,
                                                     Y);
end;

procedure TfrmTinnMain.pgFilesMouseLeave(Sender: TObject);
begin
  with pgFiles do begin
    Hint:= '';
    ShowHint:= false;
  end;
end;

procedure TfrmTinnMain.pgFilesMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
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

procedure TfrmTinnMain.pgFilesDragDrop(Sender,
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

procedure TfrmTinnMain.pgFilesDragOver(Sender,
                                       Source: TObject;
                                       X,
                                       Y: Integer;
                                       State: TDragState;
                                       var Accept: Boolean);
begin
  if Sender is TPageControl then Accept:= True;
end;

function TfrmTinnMain.UseTCPIP: boolean;
begin
  Result:= False;
  if bRAsServer then
    if csREnvironment.Active and
       csRExplorer.Active    and
       csRGeneral.Active     and
       csRtip.Active then Result:= True;
end;

procedure TfrmTinnMain.menToolsUtilsActionlistToClipboardClick(Sender: TObject);
var
  i,
   iImage  : integer;

  sShortcut,
   sGroup,
   sCaption,
   sHint,
   sTmp1,
   sTmp2,
   sBegin,
   sEnd    : string;

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
  stbMain.Panels[7].Text:= 'Done!';
end;

// Tinn-R version (3.0.2.9): I was a bit tired of doing the below manually!
procedure TfrmTinnMain.menToolsUtilsActionlistToDatasetClick(Sender: TObject);

  procedure MakeNewData_Zip;
    var
      sBackup: string;

  begin
    sBackup:= sPathTinnR +
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
          AddFiles(sPathData + '\*.*',
                   0);
          CloseArchive;
        end;
      end;
      MessageDlg(sBackup + #13 + #13 +
                 'The new file "data.zip" was created' + #13 +
                 'successfully in the path above!',
                 mtInformation,
                 [mbOk],
                 0);
    except
      MessageDlg(sBackup + #13 + #13 +
                 'A problem occurred while trying to copy the file.' + #13 +
                 'The "data.zip" file wall not be copied!',
                 mtError,
                 [mbOk],
                 0);
      Exit;
    end;  // try
  end;

  procedure DoMessage (sTmp: string);
  begin
    MessageDlg(sTmp + #13 + #13 +
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
    if not ActionlistToDataset then Exit;

  sOrigin:= sPathData +
            '\' +
            'Shortcuts.xml';

  sDest:= sPathTinnR +
          '\data\' +
          'Shortcuts.xml';

  try
    if not (CopyFile(PChar(sOrigin),
                     PChar(sDest),
                     False)) then begin  // False: replace the old file
      DoMessage(sDest);
      Exit;
    end;
  except
    DoMessage(sDest);
    Exit;
  end;

  MakeNewData_Zip;

  with stbMain do begin
    Panels[7].Text:= 'Done!';
    Panels[8].Text:= 'Shortcuts.xml replaced: ' +
                     sPathData;
  end;
end;

procedure TfrmTinnMain.DatasetToActionList(Sender: TObject);

  procedure Update_Action(i: integer;
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
   sHint   :string;

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
      Update_Action(i,
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

procedure TfrmTinnMain.menToolsUtilsDatasetToActionlistClick(Sender: TObject);
begin
  DatasetToActionList(nil);
  stbMain.Panels[7].Text:= 'Done!';
end;

procedure TfrmTinnMain.CheckTop;
begin
  OnTop(Application.Handle);
end;

procedure TfrmTinnMain.SetFocus_Rgui(iDelay: integer);
begin
  Sleep(iDelay);
  if bRguiReturnFocus then SetForegroundWindow(Application.Handle);
end;

function TfrmTinnMain.FindWord: string;
var
  seTmp: TSynEdit;

begin
  seTmp:= nil;
  case iSynWithFocus of
    0: Exit;
    1: seTmp:= (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor;
    2: seTmp:= (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2;
    3: seTmp:= frmRterm.synIO;
    4: with frmRterm do
         if Assigned(synLog2) then seTmp:= synLog2
                              else seTmp:= synLog;
  end;

  with seTmp do
    if SelAvail and
      (BlockBegin.Line = BlockEnd.Line) then Result:= SelText
                                        else Result:= GetWordAtRowCol(WordStartEx(CaretXY));  // Avoid return empty wheter cursor is at the end of word
end;

procedure TfrmTinnMain.menRget_InfoClick(Sender: TObject);
begin
  GetTinnRcom_Info;
end;

procedure TfrmTinnMain.menRHotKeysClick(Sender: TObject);
begin
  hkTinnR.ShowModal;
  SetFocus_Main;
end;

procedure TfrmTinnMain.actEditorLineWrapExecute(Sender: TObject);
var
  i: integer;

begin
  // Toogle Word wrap
  actEditorLineWrap.Checked:= not actEditorLineWrap.Checked;

  if (Self.MDIChildCount > 0) then
    for  i:= (Self.MDIChildCount - 1) downto 0 do
      (Self.MDIChildren[i] as tfrmEditor).ToogleWordWrap(actEditorLineWrap.Checked);
end;

procedure TfrmTinnMain.TBRMainMove(Sender: TObject);
begin
  TBIniSavePositions(Self,
                     sPathIniTinn_File,
                     EmptyStr);
end;

procedure TfrmTinnMain.menToolsUtilsTesteRegexClick(Sender: TObject);
var
  res: string;

begin
  res:= RegEx('Teste,,,',
              '[,]*$',
              True,
              ': RegEx OK!');

  ShowMessage(res);
end;

procedure TfrmTinnMain.UpdateRFileReformatted(sTmp: string);
var
  i,
    iTopLine : Integer;

  bcPos   : TBufferCoord;
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

  i:= FindTopWindow;
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
      sFormatted:= FileToString(sTmp);
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
    CheckSaveStatus;

  DeleteFile(sTmp);

  iRFormatted:= -1;
end;

procedure TfrmTinnMain.UpdateRSelectionReformatted(sTmp: string);
var
  seEditor: TSynEdit;

  sPrior,
   sFormatted: string;

  i: integer;

begin
  i:= FindTopWindow;

  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    if SelAvail then begin
      sPrior    := SelText;
      sFormatted:= FileToString(sTmp);
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

procedure TfrmTinnMain.tUpdateOptionsTimer(Sender: TObject);
begin
  try
    UpdateOptions;
  except
    // TODO
  end;
end;

procedure TfrmTinnMain.TinnRcomInstall_AskUser(bMessageDlg: boolean = True);
var
  mrOption: TModalResult;

begin
  // Without Internet it will no be possible to install TinnRcom dependencies from CRAN repositories!
  if (CheckConnection = False) then Exit;

  if (mrTinnRcom_Install = mrNo) then Exit;

  tRRuning.Enabled:= False;  // It is important!

  if (bMessageDlg) then
    mrTinnRcom_Install:= MessageDlg('Tinn-R requires the R package TinnRcom to be installed.' + #13#13 +
                                    'It will be installed now!',
                                    mtConfirmation,
                                    [mbOK],
                                    0);

  case mrTinnRcom_Install of
    mrOK: begin
            Screen.Cursor:= crHourglass;
            actRContPacInstTinnRcomExecute(nil);

            if (not bRTinnRcom_Installed) then begin
              mrOption:= MessageDlg('The TinnRcom package (and its dependencies)' + #13 +
                                    'apparently was not installed successfully!' + #13 + #13 +
                                    'Do you like to repeat the automatic installation?',
                                    mtWarning,
                                    [mbYes, mbCancel],
                                    0);

              if (mrOption = mrYes) then TinnRcomInstall_AskUser(False)
                                    else begin
                                      mrTinnRcom_Install:= mrNo;
                                      RSetGet_Info;
                                    end;
            end;

            Screen.Cursor:= crDefault;
          end;

    mrCancel: begin
                MessageDlg('Some important resources of Tinn-R related to R' + #13 +
                           'are provided by TinnRcom package!' + #13 + #13 +
                           'The package is provided at ' +
                           sPathTinnR + '\package\' + 'TinnRcom_' + sCurrentVersion_TinnRcom + '.zip' + #13 + #13 +
                           'It is really important to install it!',
                           mtWarning,
                           [mbOk],
                           0);

                tRRuning.Enabled:= True;
              end;
  end;
end;

procedure TfrmTinnMain.RSetGet_Info;
begin
  // Get Info
  if (not bRTinnRcom_Info) then
    if Rterm_Running and
       (frmRTerm.cRterm.bRterm_Ready) then GetTinnRcom_Info
    else if Rgui_Running then GetTinnRcom_Info;

  // Ask to install
  if (bRTinnRcom_Install) and
     (not bRTinnRcom_Installed) then
    if Rterm_Running and
       (frmRTerm.cRterm.bRterm_Ready) then TinnRcomInstall_AskUser
    else if Rgui_Running then TinnRcomInstall_AskUser;

  // Start socket
  if bRTinnRcom_Installed and
     bRTinnRcom_Load and  // The package (if installed) it is loaded aotomatically by: GetTinnRcom_Info
     bRsvSocket_Connect and
     not bTCPIPRunning then StartSocketServer_svSocket;

  // Update TinnRcom package
  if (AnsiCompareStr(sVersion_TinnRcomInstalled,
                     sCurrentVersion_TinnRcom) < 0) then
    if Rterm_Running and
       (frmRTerm.cRterm.bRterm_Ready) then begin
      bRTinnRcom_Updating:= True;
      actRContPacInstTinnRcomExecute(nil);
    end
    else if Rgui_Running then begin
      bRTinnRcom_Updating:= True;
      actRContPacInstTinnRcomExecute(nil);
    end;
end;

procedure TfrmTinnMain.GetTinnRcom_Info;

  procedure SetRepos(var sInfo: string);
  begin
    sInfo:= StringReplace(sInfo,
                          '%repos',
                          sRmirror,
                          []);
  end;

  procedure ReturnPreviousStates;
  begin
    // On Top
    if bOnTop then begin
      OnTop(Application.Handle);
      actOnTop.Checked:= True;
      CheckTop;
    end
    else begin
      OnTop(Application.Handle);
      actOnTop.Checked:= False;
    end;

    // ReturnFocus
    if bRguiReturnFocus then begin
      actRguiReturnFocus.Checked:= True;
      SetFocus_Rgui(iDelay);
    end
    else actRguiReturnFocus.Checked:= False;
  end;

var
  i,
   iWidth: integer;

  sInfo,
   sToSend,
   sFilePath,
   sPath    : string;

  slTmp: TStringList;

begin
  try
    CheckConnection;

    if bRTinnRcom_Load then
      if (not bRmirros_Update) then sInfo:= FileToString(sUtilsOrigin +
                                                         '\Rinfo_load_b.R')  // b: basic info and load TinnRcom
                               else sInfo:= FileToString(sUtilsOrigin +
                                                         '\Rinfo_load_c.R')  // c: complete info (will update CRAN mirrors) and load TinnRcom
    else
      if (not bRmirros_Update) then sInfo:= FileToString(sUtilsOrigin +
                                                         '\Rinfo_b.R')       // b: basic
                               else sInfo:= FileToString(sUtilsOrigin +
                                                         '\Rinfo_c.R');      // c: complete (will update CRAN mirrors)

      sFilePath:= sPathTmp +
                  '\sgInfo.R';

      SetRepos(sInfo);

      if Rterm_Running then begin
        with frmRterm do
         iWidth:= (synIO.Width - synIO.Gutter.Width - 20) div synIO.CharWidth;

        if (iWidth >= 20) then
          sInfo:= sInfo + #13#10 +
                  '# Set width: Rterm' + #13#10 +
                  'options(''width''=' +
                  IntToStr(iWidth) +
                  ')';
      end;

      if FileSaveFast(sFilePath,
                      sInfo) then sToSend:= 'source(' +
                                            '''' +
                                            DosPathToUnixPath(sFilePath) +
                                            '''' +
                                            ')';

    // Disable ReturnFocus: Temporary to avoid a flicker in the TBRMain
    if Rgui_Running and
       bRguiReturnFocus then actRguiReturnFocus.Checked:= False;
    Application.ProcessMessages;

    DoSend(sToSend);

    if Rterm_Running then frmRTerm.cRterm.bRterm_Ready:= False;

    if (not bRmirros_Update) then sPath:= sPathTmp +
                                          '\Rinfo.txt'      // b: basic
                             else sPath:= sPathTmp +
                                          '\Rmirrors.txt';  // c: complete (will update also CRAN mirrors)

    i:= 1;
    repeat
      Sleep(5*iDelay);
      if FileExists(sPath) then Break
                           else inc(i);
    until (i = 50);

    if (not FileExists(sPath)) then Exit
                               else bRTinnRcom_Info:= True;

    slRLibPaths:= TStringList.Create;
    slTmp      := TStringList.Create;

    Sleep(30*iDelay);  // It is important when installing packages!
                       // and it is calibrated to 50 ms.

    slTmp.LoadFromFile(sPathTmp +
                       '\Rinfo.txt');

    if DirectoryExists(trim(slTmp.Strings[0])) then begin  // R running path
      sPathR_Connected          := UnixPathToDosPath(trim(slTmp.Strings[0]));
      sPathTinnRcom_Installed   := UnixPathToDosPath(trim(slTmp.Strings[1]));
      sVersion_TinnRcomInstalled:= trim(slTmp.Strings[2]);

      if (slTmp.Count > 3) then  // .libPaths has more than one folder!
        for i:= 0 to (slTmp.Count - 4) do
          slRLibPaths.Add(UnixPathToDosPath(trim(slTmp.Strings[i + 3])));
    end
    else begin
      sPathR_Connected          := 'UNKNOWN';
      sPathTinnRcom_Installed   := 'UNKNOWN';
      sVersion_TinnRcomInstalled:= 'UNKNOWN';
      slRLibPaths.Add('UNKNOWN');
    end;

    if (sPathTinnRcom_Installed = 'Not installed!') or
       (sPathTinnRcom_Installed = 'UNKNOWN') then bRTinnRcom_Installed:= False
                                             else bRTinnRcom_Installed:= True;

    if bRmirros_Update then
      if FileExists(sPathTmp +
                   '\Rmirrors.txt') then begin
        if (not modDados.Rmirrors_Update(sPathTmp +
                                       '\Rmirrors.txt')) then
          MessageDlg('It was not possible to update the dataset from CRAN mirrors!',
                     mtWarning,
                     [mbOk],
                     0)
        else RmirrorsInterface_Update;
      end  // FileExists(sPathTmp +
      else
        MessageDlg('It was not possible to update the dataset from CRAN mirrors!',
                   mtWarning,
                   [mbOk],
                   0);

  finally
    FreeAndNil(slTmp);
    if Rgui_Running and
       bRguiReturnFocus then ReturnPreviousStates;
  end;
end;

procedure TfrmTinnMain.StartSocketServer_svSocket;
begin
  if (not bRTinnRcom_Installed) then Exit;

  Screen.Cursor:= crHourglass;

  if Rterm_Running and
    frmRTerm.cRterm.bRterm_Ready then begin
    Sleep(5*iDelay);
    actRContTCPConnectionExecute(nil);
  end
  else if Rgui_Running then begin
    Sleep(20*iDelay);
    actRContTCPConnectionExecute(nil);
  end;

  Screen.Cursor:= crDefault;
end;

procedure TfrmTinnMain.tRRuningTimer(Sender: TObject);

  procedure Rgui(bRunning: boolean);
  begin
    with actRContGuiStartClose do
      if bRunning then begin
        Caption   := 'Rgui (close)';
        ImageIndex:= 82
      end
      else begin
        Caption   := 'Rgui (start)';
        ImageIndex:= 81;
      end;

    actRContGuiStartClose.Update;

    if bRunning               and
       (frmAppOptions = nil)  and
       bOrganizeAutomatically and
       not bAlreadyOrganized  then actOrganizeScreenExecute(Self);
  end;

  procedure Rterm(bRunning: boolean);
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
  procedure R_Is_Running;
  var
    seEditor: TSynEdit;

  begin
    RMenu(True);

    ControlResources(True);

    if (pgFiles.PageCount = 0) then SendResources(False)
    else begin
      SendResources(True);
      with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
        if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                         else seEditor:= synEditor2;
      with seEditor do begin
        actRSendSelection.Enabled      := SelAvail;
        actRSendSourceSelection.Enabled:= SelAvail;
      end;
    end;

    if bTinnRHotKeysActive then stbMain.Panels[6].Text:= 'R hotkeys active'
                           else stbMain.Panels[6].Text:= 'R hotkeys inactive';

    menControlRClearConsole.Enabled:= True;
    menControlRHelp.Enabled        := True;
    TBRClearConsole.Enabled        := True;
    TBRRHelp.Enabled               := True;

    if bRsetget_Info then RSetGet_Info;

    case iRFormatted of
      -1: Exit;
       0: UpdateRFileReformatted(sPathTmp +
                                 '\reformat-output.r');
       1: UpdateRSelectionReformatted(sPathTmp +
                                      '\reformat-output.r');
    end;
  end;

  // R isn't running
  procedure R_Not_Running;
  begin
    RMenu(True);

    ControlResources(False);

    SendResources(False);

    if (stbMain.Panels[6].Text <> EmptyStr) then stbMain.Panels[6].Text:= EmptyStr;

    actRSendSelection.Enabled      := False;
    actRSendSourceSelection.Enabled:= False;
    bAlreadyOrganized              := False;
    bTCPIPRunning                  := False;
    bRTinnRcom_Loaded              := False;
    bRTinnRcom_Info                := False;
    sPathR_Connected               := 'UNKNOWN';
    sPathTinnRcom_Installed        := 'UNKNOWN';
    sVersion_TinnRcomInstalled     := 'UNKNOWN';
    if Assigned(slRLibPaths) then
      FreeAndNil(slRLibPaths);
    actRContTCPConnection.ImageIndex:= 168;  
  end;

begin
  try
      if Rgui_Running then Rgui(True)
                      else Rgui(False);

      Rterm(Rterm_Running);

      if Rgui_Running or
         Rterm_Running or
         bIPRemoteConnected then R_Is_Running
                            else R_Not_Running;
  except
     // TODO
  end;
end;

procedure TfrmTinnMain.OpenHelpFile(sFileToOpen: string);
var
  sPathFile: string;

begin
  sPathFile:= sPathTinnR + sFileToOpen;
  if FileExists(sPathFile) then OpenFileIntoTinn(sPathFile)
  else MessageDlg(sPathFile + #13 + #13 +
                  'The file was not found.' + #13 +
                  'Please, reinstall the program!',
                  mtWarning,
                  [mbOk],
                  0);
end;

function TfrmTinnMain.MessageDlg(const sMsg:
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

procedure TfrmTinnMain.sdMainShow(Sender: TObject);
begin
  sdMainTypeChange(Self);
end;

procedure TfrmTinnMain.sdMainTypeChange(Sender: TObject);
var
  iSelectedIndex,
   iPeriodPos,
   iEndPos      : integer;

  sFileName,
   sTmp    : string;

begin
  // This is a good place to ReGex!
  sFileName      := sdMain.FileName;
  sTmp           := EmptyStr;
  iSelectedIndex := sdMain.FilterIndex;
  sTmp           := slFilters.Strings[iSelectedIndex -1];
  sFileExtensions:= sTmp;  // All extensions of the highlighter

  iPeriodPos:= pos('*',
                   sTmp);

  iEndPos:= pos(';',  // With SynEdit_ANSI: ','
                sTmp);

  if (iEndPos = 0) then iEndPos:= pos(')',
                                      sTmp);

  sTmp:= copy(sTmp,
              iPeriodPos + 1,
              (iEndPos - iPeriodPos) - 1);

  sSaveAsFileExt:= sTmp;  // First file extension
end;

procedure TfrmTinnMain.menWebRInformationsCRANClick(Sender: TObject);
begin
  OpenUrl('cran.r-project.org/');
end;

procedure TfrmTinnMain.menWebRInformationsWebSiteClick(Sender: TObject);
begin
  OpenUrl('www.r-project.org/');
end;

procedure TfrmTinnMain.menWebRInformationsZoonekyndClick(Sender: TObject);
begin
  OpenUrl('http://zoonek2.free.fr/UNIX/48_R/all.html');
end;

procedure TfrmTinnMain.menWebRInformationsBioconductorClick(Sender: TObject);
begin
  OpenUrl('www.bioconductor.org/');
end;

procedure TfrmTinnMain.menWebRInformationsNewsClick(Sender: TObject);
begin
  OpenUrl('cran.r-project.org/doc/Rnews/');
end;

procedure TfrmTinnMain.menWebRInformationsOmegaClick(Sender: TObject);
begin
  OpenUrl('http://www.omegahat.org/');
end;

procedure TfrmTinnMain.menWebRguiProjectsClick(Sender: TObject);
begin
  OpenUrl('www.sciviews.org/_rgui/');
end;

procedure TfrmTinnMain.menWebRInformationsRWikiClick(Sender: TObject);
begin
  OpenUrl('http://wiki.r-project.org');
end;

procedure TfrmTinnMain.menWebRInformationsTutorialClick(Sender: TObject);
begin
  OpenUrl('http://www.r-tutor.com/');
end;

procedure TfrmTinnMain.menWebRguiSciViewsClick(Sender: TObject);
begin
  OpenUrl('http://www.sciviews.org/SciViews-K/index.html');
end;

procedure TfrmTinnMain.menWebRguiRpadClick(Sender: TObject);
begin
  OpenUrl('http://rpad.googlecode.com/svn-history/r76/Rpad_homepage/index.html');
end;

procedure TfrmTinnMain.menWebRGuiRStudioClick(Sender: TObject);
begin
  OpenUrl('http://www.rstudio.org/');
end;

procedure TfrmTinnMain.menWebRguiJGRClick(Sender: TObject);
begin
  OpenUrl('http://stats.math.uni-augsburg.de/JGR/');
end;

procedure TfrmTinnMain.menWebRSearchMailingListArchivesClick(Sender: TObject);
begin
  OpenUrl('http://tolstoy.newcastle.edu.au/R/');
end;

procedure TfrmTinnMain.menWebRSearchSiteClick(Sender: TObject);
begin
  OpenUrl('finzi.psych.upenn.edu/search.html');
end;

procedure TfrmTinnMain.menWebRSearchRseekClick(Sender: TObject);
begin
  OpenUrl('http://www.rseek.org/');
end;

procedure TfrmTinnMain.menWebRSearchHelpForRClick(Sender: TObject);
begin
  OpenUrl('finzi.psych.upenn.edu/');
end;

procedure TfrmTinnMain.menHelpStatJournalStatisticalSoftwareClick(Sender: TObject);
begin
  OpenUrl('www.jstatsoft.org/');
end;

procedure TfrmTinnMain.menWebStatVLPSClick(Sender: TObject);
begin
  OpenUrl('www.math.uah.edu/stat/');
end;

procedure TfrmTinnMain.menWebStatVirtualLabVESTACClick(Sender: TObject);
begin
  OpenUrl('www.kuleuven.ac.be/ucs/java/');
end;

procedure TfrmTinnMain.menWebStatVirtualLabRiceClick(Sender: TObject);
begin
  OpenUrl('onlinestatbook.com/rvls.html');
end;

procedure TfrmTinnMain.menWebStatVirtualStatisticalJavaClick(Sender: TObject);
begin
  OpenUrl('www.causeweb.org/repository/statjava/');
end;

procedure TfrmTinnMain.menHelpStatHyperstatClick(Sender: TObject);
begin
  OpenUrl('davidmlane.com/hyperstat/index.html');
end;

procedure TfrmTinnMain.menHelpStatStatSoftClick(Sender: TObject);
begin
  OpenUrl('www.statsoftinc.com/textbook/stathome.html');
end;

procedure TfrmTinnMain.menHelSecretsClick(Sender: TObject);
begin
  OpenUserGuidePDF('"Some Secrets for an Efficient Use"');
end;

procedure TfrmTinnMain.menWebSearchSelGoogleClick(Sender: TObject);
var
  sTmp,
   sWord: string;

begin
  if (pgFiles.PageCount = 0) then Exit;
  sWord:= FindWord;

  if (sWord = EmptyStr) then begin
    MessageDlg('No valid word selected from the file!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;

  sTmp:= 'www.google.com/search?q='+
         sWord +
         '&domains=r-project.org&sitesearch=r-project.org&btnG=Google+Search';
  OpenUrl(sTmp);
end;

procedure TfrmTinnMain.menWebSearchSelRArchivesClick(Sender: TObject);
var
  sTmp,
   sSelWord: string;

begin
  if (pgFiles.PageCount = 0) then Exit;
  sSelWord:= FindWord;

  if (sSelWord = EmptyStr) then begin
    MessageDlg('No valid word selected from the file!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;

  sTmp:= 'www.google.com/u/newcastlemaths?q=' +
         sSelWord +
         '&sa=Google+Search';
  OpenUrl(sTmp);
end;

procedure TfrmTinnMain.menWebSearchSelRSiteClick(Sender: TObject);
var
  sTmp,
   sSelWord: string;

begin
  if (pgFiles.PageCount = 0) then Exit;
  sSelWord:= FindWord;

  if (sSelWord = EmptyStr) then begin
    MessageDlg('No valid word selected from the file!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;

  sTmp:= 'finzi.psych.upenn.edu/cgi-bin/namazu.cgi?query=' +
          sSelWord +
          '&max=20&Result=normal&sort=score&idxname=functions&idxname=docs&idxname=Rhelp02a';

  OpenUrl(sTmp);
end;

procedure TfrmTinnMain.menWebSSearchSelArchivesClick(Sender: TObject);
var
  sTmp,
   sSelWord: string;

begin
  if (pgFiles.PageCount = 0) then Exit;
  sSelWord:= FindWord;

  if (sSelWord = EmptyStr) then begin
    MessageDlg('No valid word selected from the file!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;

  sTmp:= 'www.biostat.wustl.edu/archives/cgi-bin/namazu.cgi?query=' +
         sSelWord +
         '&submit=Search&idxname=s-news';

  OpenUrl(sTmp);
end;

procedure TfrmTinnMain.menWebSSearchMaillingClick(Sender: TObject);
begin
  OpenUrl('www.biostat.wustl.edu/archives/html/s-news/');
end;

procedure TfrmTinnMain.menWebRguiRComanderClick(Sender: TObject);
begin
  OpenUrl('socserv.socsci.mcmaster.ca/jfox/Misc/Rcmdr/index.html');
end;

procedure TfrmTinnMain.FormDragOver(Sender,
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

procedure TfrmTinnMain.FormDragDrop(Sender,
                                    Source: TObject;
                                    X,
                                    Y: Integer);
var
  i: integer;
  
begin
  // The below will avoid to try to open file (and related error message)
  // when dragging any selection inside of the editor
  i:= FindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    if (Source = (Self.MDIChildren[i] as TfrmEditor).synEditor) or
       (Source = (Self.MDIChildren[i] as TfrmEditor).synEditor2) then Exit;

  // Object was draged from Search interface
  if (Source = frmTools.tvSearch) then begin
    if not (iDragLevel = 2) then Exit;
    if FileExists(trim(sDragSource)) then OpenFileIntoTinn(sDragSource,
                                                           StrToIntDef(sDragSourceLine,
                                                                       0))
                                     else MessageDlg(trim(sDragSource) + #13 + #13 +
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
      OpenFileIntoTinn(sDragSource,
                       0,
                       False,
                       False);
      DeleteFile(sDragSource);
    end
    else MessageDlg(sDragSource + #13 + #13 +
                    'The file above was not found!',
                    mtWarning,
                    [mbOk],
                    0);
    Exit;
  end;

  // Object was draged from Project interface
  if (Source = frmTools.tvProject) then begin
    if (iDragLevel = 0) then OpenAllFiles;
    if (iDragLevel = 1) then OpenAllFilesOfGroup;
    if (sDragSource = EmptyStr) then Exit;
  end;

  if FileExists(sDragSource) then OpenFileIntoTinn(sDragSource)
                             else MessageDlg(sDragSource + #13 + #13 +
                                             'The file above was not found!',
                                             mtWarning,
                                             [mbOk],
                                             0);
end;

procedure TfrmTinnMain.menHelpEnglishChanges_t2tClick(Sender: TObject);
begin
  OpenHelpFile('\doc\Tinn-R_changes.t2t');
end;

{$HINTS OFF}
procedure TfrmTinnMain.CreateProject;
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
function TfrmTinnMain.GenericGroupExists: boolean;
var
  i    : integer;
  meTmp: TMemo;
  sTmp : string;

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
        if (pos('generic group*',
                lowerCase(sTmp)) <> 0) then begin
          Result:= True;
          Exit;
        end;
      end;
    except
      on E: EFOpenError do
      begin
        MessageDlg(sProjectName + #13 + #13 +
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

procedure TfrmTinnMain.SortProject;
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

procedure TfrmTinnMain.OpenProject;
var
  sTmp,
   sGroupName: string;

  tnProject,
   tnGroupToAdd,
   tnFileToAdd: TTreeNode;

  procedure makeTree;
  var
    i: integer;

  begin
    tnProject:= nil; tnGroupToAdd:= nil; tnFileToAdd:= nil;
    frmTools.tvProject.SortType:= stText;
    tnProject:= frmTools.tvProject.Items.Add(tnProject,
                                             ExtractFileName(sProjectName));
    if not GenericGroupExists then begin
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
      MessageDlg(sProjectName + #13 + #13 +
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
    makeTree;
    Items[0].Expanded:= True;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.AddFile(iFile: string);

  function VerifyGenericGroup: boolean;
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
  iGroupPos  : integer;
  tnChildNode: TTreeNode;

begin
  if (frmTools.tvProject.Selected = nil) then Exit;

  // Check to see if the file has already been added
  if (FileExistsAsNode(iGroupPos,
                       iFile)) then begin
    if (MessageDlg(iFile + #13 + #13 +
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
    if VerifyGenericGroup then begin  // Generic group exists then select it
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
      if (MessageDlg(iFile + #13 + #13 +
                     'No group was selected to this task!' + #13 +
                     'So, is not possible to add the file above because not exists a generic group*.' + #13 +
                     'Would you like to do this now?',
                     mtConfirmation,
                     [mbYes,mbCancel],
                     0) = mrYes) then begin
        CreateGroup('generic group*');
        AddFile(iFile);
      end;
  end;
end;

procedure TfrmTinnMain.SaveProject;
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
  i:= FindWindowByName(sProjectName);
  if (i > -1) then begin
    Self.MDIChildren[i].BringToFront;
    actReloadExecute(nil);
  end;
end;

function TfrmTinnMain.GroupExistsAsNode(sGroupName: string): boolean;
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

function TfrmTinnMain.FileExistsAsNode(var iPos: integer;
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

procedure TfrmTinnMain.CreateGroup(sGroupName: string);
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
      MessageDlg('It is necessary first to open or to create a project!',
                 mtWarning,
                 [mbOk],
                 0);
  end;
end;

procedure TfrmTinnMain.OpenAllFiles;
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

        if FileExists(sTmp) then OpenFileIntoTinn(sTmp)
        else if not bIgnoreAll then begin
          userOption:= MessageDlg(sTmp + #13 + #13 +
                                  'The file above was not found!' + #13 +
                                  'Would you like to ignore it?',
                                  mtConfirmation,
                                  [mbYes, mbYesToAll, mbCancel],
                                  0);

          i:= FindTopWindow;
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

procedure TfrmTinnMain.OpenAllFilesOfGroup;
var
  bIgnoreAll: boolean;

  i,
   j,
   iFiles: integer;

  sTmp: string;

  tnCurNode : TTreeNode;
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

      if FileExists(sTmp) then OpenFileIntoTinn(sTmp)
      else if not bIgnoreAll then begin
        userOption:= MessageDlg(sTmp + #13 + #13 +
                                'The file above was not found!' + #13 +
                                'Would you like to ignore it?',
                                mtConfirmation,
                                [mbYes, mbYesToAll, mbCancel],
                                0);
        i:= FindTopWindow;
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

function TfrmTinnMain.CloseAllFilesOfProject: boolean;
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
        iPos:= FindWindowByName(sFileName);
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
          MessageDlg(sFileName + #13 + #13 +
                     'The file above occurs more than a time in the project!',
                     mtInformation,
                     [mbOk],
                     0);
        end;
      end;
end;

procedure TfrmTinnMain.CloseAllFilesOfGroup;
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
      iPos     := FindWindowByName(sTmp);
      try
        if (iPos > -1) then (MDIChildren[iPos] as TfrmEditor).Close;
      except
        MessageDlg(sTmp + #13 + #13 +
                   'The file above occurs more than a time in this group!',
                   mtInformation,
                   [mbOk],
                   0);
      end;
      dec(iFiles);
    end;
  end;
end;

procedure TfrmTinnMain.actGrouptNewExecute(Sender: TObject);
var
  newGroup: TfrmNewGroup;

begin
  newGroup:= TfrmNewGroup.Create(Self);
  with newGroup do begin
    if (ShowModal = mrOK) then begin
      if (edtNewGroup.Text <> EmptyStr) then begin
        if not GroupExistsAsNode(edtNewGroup.Text) then begin
          CreateGroup(edtNewGroup.Text);
          bProjectChanged:= True;
        end
        else MessageDlg(edtNewGroup.Text + #13 + #13 +
                        'A group with this name already exists in this project!',
                        mtError,
                        [mbOk],
                        0);
      end;
      Close;
    end;
  end;
  FreeAndNil(newGroup);
  SortProject;
end;

Procedure TfrmTinnMain.UpdateRterm_Appearance(bUpdate_FontSize: boolean = True);
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
    Options:= Options - [eoScrollPastEol,      // It is more confortable
                         eoShowSpecialChars];  // Not necessary

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

Procedure TfrmTinnMain.UpdateAppearance(bFontSize: boolean = True);
begin
  // Update transparency
  AlphaBlendValue:= iAlphaBlendValue;

  UpdateRterm_Appearance(bFontSize);

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

procedure TfrmTinnMain.FormShow(Sender: TObject);
begin
  with frmTools.jvflbWinExplorer do begin
    Items.BeginUpdate;
    Refresh;
    Items.EndUpdate;
  end;
  if (frmTools.pgTools.ActivePage = frmTools.tbsMisc) and
     (frmTools.pgMisc.ActivePage = frmTools.tbsRcard) then frmTools.lbRcard.SetFocus;

  ctbMain.Realign;  // Don't remove!
  UpdateAppearance;

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
    SetInterfaceSize(frmTools,
                     350);
  end;

{ // For tests only!
  ifTinn_Tmp:= TIniFile.create(sPathApp + '\Tinn_dock.ini');
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
  if bRtermSimple then  // IO and Log in the same view
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

procedure TfrmTinnMain.actGroupDeleteCurrentExecute(Sender: TObject);
begin
  with frmTools.tvProject do
    if (Selected = nil) or
       (Selected.Level <> 1) then Exit;

  with frmTools.tvProject.Selected do
    if (Level = 1) then begin
      Delete;
      bProjectChanged:= True;
      SortProject;
    end;
end;

procedure TfrmTinnMain.actGroupDeleteAllExecute(Sender: TObject);
begin
  with frmTools.tvProject.Items[0] do
    if (Count > 0) then begin
      DeleteChildren;
      bProjectChanged:= True;
    end;
end;

procedure TfrmTinnMain.actProjectDeleteCurrentExecute(Sender: TObject);
var
  intPos: integer;

begin
  if (MessageDlg(sProjectName + #13 + #13 +
                 'Confirm the delection of the current project?',
                 mtConfirmation,
                 [mbOk, mbCancel],
                 0) = mrOk) then begin
    CloseAllFilesOfProject;

    ToolsProjectControls(False);
    if Assigned(slProjectChanges) then slProjectChanges.Clear;
    frmTools.tvProject.Items.Clear;
    DeleteFile(sProjectName);

    // Close project file if is open.
    intPos:= FindWindowByName(sProjectName);
    if (intPos > -1) then (MDIChildren[intPos] as TfrmEditor).Close;
    UpdateMRU(menFileRecentFiles,
              sProjectName);

    UpdateProjectMRU(menProjRecent,
                     sProjectName);
    with frmTools.jvflbWinExplorer do begin
      Items.BeginUpdate;
      Refresh;
      Items.EndUpdate;
    end;
  end;
end;

procedure TfrmTinnMain.actGroupRenameExecute(Sender: TObject);
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
      if not GroupExistsAsNode(edtNewGroupName.Text) then begin
        frmTools.tvProject.Selected.Text:= edtNewGroupName.Text;
        bProjectChanged:= True;
      end
      else MessageDlg(edtNewGroupName.Text + #13 + #13 +
                      'A group with this name already exists in this project!',
                      mtError,
                      [mbOk],
                      0);
      Close;
    end;
  end;

  FreeAndNil(renGroup);
  SortProject;
end;

procedure TfrmTinnMain.actProjectSaveAsExecute(Sender: TObject);
var
  i: integer;

  meTmp: TMemo;

  sName,
   sTmpData,
   sTmpText: string;

  wFileAtt : word;

begin
  sdMain.InitialDir:= sWorkingDir;
  sName:= StringReplace(sProjectName,
                        '*',
                        EmptyStr,
                        [rfReplaceAll]);
  if bRemoveExtension then sName:= RemoveFileExtension(sName);

  with sdMain do begin
    fileName  := sName;
    Filter    := 'Tinn-R project space (*.tps)|*.tps';
    DefaultExt:= '*.tps';
  end;

  if sdMain.Execute then begin
    sName:= sdMain.FileName;

    if FileExists(sName) then
      if (MessageDlg(sName + #13 + #13 +
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

    UpdateProjectMRU(menProjRecent,
                     sName);

    with frmTools.tvProject do begin
      Items[0].Collapse(True);
      Items.Clear;
    end;
    Sleep(iDelay div 3);
    sProjectName:= sName;
    OpenFileIntoTinn(sProjectName);
  end;
  sdMain.Filter:= slFilters.Text;
end;

{$WARNINGS ON}
procedure TfrmTinnMain.actFilesRemoveAllOfProjectExecute(Sender: TObject);
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

procedure TfrmTinnMain.actFilesRemoveAllOfGroupExecute(Sender: TObject);
begin
  with frmTools.tvProject.Selected do
    if (level = 1) then begin
      DeleteChildren;
      bProjectChanged:= True;
    end;
end;

procedure TfrmTinnMain.actFilesAddExecute(Sender: TObject);
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
              AddFile(slProjectChanges[j]);
            end;
          end;
        Options:= Options - [ofAllowMultiSelect];
      end;
    end;
  end;
end;

procedure TfrmTinnMain.actFilesOpenAllOfGroupExecute(Sender: TObject);
begin
  OpenAllFilesOfGroup;
end;

procedure TfrmTinnMain.actFilesCloseAllOfGroupExecute(Sender: TObject);
begin
  CloseAllFilesOfGroup;
end;

procedure TfrmTinnMain.ToolsProjectControls(bOption: boolean);
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

procedure TfrmTinnMain.ToolsSearchControls(bOption: boolean);
begin
  actSearchCollapseAll.Enabled:= bOption;
  actSearchCollapseOne.Enabled:= bOption;
  actSearchExpandAll.Enabled  := bOption;
  actSearchExpandOne.Enabled  := bOption;
end;

procedure TfrmTinnMain.edFilterKeyDown(Sender: TObject;
                                       var Key: Word;
                                       Shift: TShiftState);
begin
  if (Key = VK_RETURN) then tbFilterClick(nil);
end;

procedure TfrmTinnMain.ESS1Click(Sender: TObject);
begin
  OpenUrl('http://ess.r-project.org/');
end;

procedure TfrmTinnMain.actGroupExpandAllExecute(Sender: TObject);
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

procedure TfrmTinnMain.actGroupCollapseAllExecute(Sender: TObject);
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

procedure TfrmTinnMain.menHelExampleOfScriptClick(Sender: TObject);
begin
  OpenHelpFile('\sample\Tinn-R_example of script.R');
end;

procedure TfrmTinnMain.menHelpRecognizedWordsClick(Sender: TObject);
begin
  OpenHelpFile('\doc\Tinn-R_recognized words.R');
end;

procedure TfrmTinnMain.menOptionsShortcutsClick(Sender: TObject);
begin
  actShortcutsEditExecute(nil);
end;

procedure TfrmTinnMain.actTobMiscVisibleExecute(Sender: TObject);
begin
  tobMisc.Visible          := not(tobMisc.Visible);
  actTobMiscVisible.Checked:= tobMisc.Visible;
end;

procedure TfrmTinnMain.actTobViewVisibleExecute(Sender: TObject);
begin
  tobView.Visible         := not(tobView.Visible);
  actTobViewVisible.Checked:= tobView.Visible;
end;

procedure TfrmTinnMain.actTobRVisibleExecute(Sender: TObject);
begin
  actTobRVisible.Checked:= not actTobRVisible.Checked;
  RToolbar(actTobRVisible.Checked and actShowAllBars.Checked);
  Application.ProcessMessages;
  TBIniSavePositions(Self,
                     (sPathIniTinn_File),
                     EmptyStr);
end;

procedure TfrmTinnMain.actBlockMarkExecute(Sender: TObject);
var
  bb,
   be: TBufferCoord;

  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    bb:= BlockBegin;
    be:= BlockEnd;
    if (bb.Line <> be.Line) then begin
      CaretX:= 1;
      SetBookMark(0,
                  1,
                  bb.Line);
      SetBookMark(1,
                  1,
                  be.Line);
    end;
  Refresh;
  end;
end;

procedure TfrmTinnMain.actBlockUnmarkExecute(Sender: TObject);
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  end;
  with seEditor do begin
    ClearBookMark(0);
    ClearBookMark(1);
  end;
end;

procedure TfrmTinnMain.actUnmarkAllExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  i: integer;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  end;

  with seEditor do
    for i:= 0 to 9 do
      ClearBookMark(i);
end;

procedure TfrmTinnMain.menWebR_helpClick(Sender: TObject);
begin
  OpenUrl('www.mail-archive.com/r-help@stat.math.ethz.ch/info.html');
end;

procedure TfrmTinnMain.menWebRGuiTinnRLECClick(Sender: TObject);
begin
  OpenUrl('nbcgib.uesc.br/lec/software/editores/tinn-r/en');
end;

procedure TfrmTinnMain.menWebRguiTinnRSourceForgeClick(Sender: TObject);
begin
  OpenUrl('sourceforge.net/projects/tinn-r');
end;

procedure TfrmTinnMain.menWebRGuiTinnRUserListClick(Sender: TObject);
begin
  OpenUrl('http://groups.google.com/forum/?fromgroups#!forum/tinn-r');
end;

procedure TfrmTinnMain.menWebRguiTinnRSciViewsClick(Sender: TObject);
begin
  OpenUrl('www.sciviews.org/Tinn-R');
end;

procedure TfrmTinnMain.menHelCitationClick(Sender: TObject);
begin
  Clipboard.AsText:= 'Tinn-R Team (2015). Tinn-R Editor - GUI for R Language and Environment.' + #13 +
                     'URL http://nbcgib.uesc.br/lec/software/editores/tinn-r/en';

  MessageDlg('Many thanks for cite Tinn-R.' + #13 + #13 +
             'The citation was put on clipboard!',
             mtWarning,
             [mbOk],
             0);

  SetFocus_Main;             
end;

procedure TfrmTinnMain.actShowAppOptionsExecute(Sender: TObject);
var
  dlg: TfrmAppOptions;
  i  : integer;

begin
  coEditor.Gutter.Visible        := actGutterVisible.Checked;
  coEditor.Gutter.ShowLineNumbers:= actLineNumbersVisible.Checked;

  if actSpecialCharVisible.Checked then coEditor.Options:= coEditor.Options +
                                                           [eoShowSpecialChars]
                                   else coEditor.Options:= coEditor.Options -
                                                           [eoShowSpecialChars];

  try
    dlg:= TfrmAppOptions.Create(Self);
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
      cbRememberFileState.Checked        := bRememberFileState;
      cbRememberSearchList.Checked       := bRememberSearchList;
      cbRemoveExtension.Checked          := bRemoveExtension;
      cbRsetget_Info.Checked             := bRsetget_Info;
      cbRguiOrganizeAutomatically.Checked:= bOrganizeAutomatically;
      cbRguiReturnFocus.Checked          := bRguiReturnFocus;
      cbRmirros_Update.Checked           := bRmirros_Update;
      cbRSendAll.Checked                 := bRSendAll;
      cbRSetWorkDir_Starting.Checked     := bRSetWorkDir_Starting;
      cbRSmartSend.Checked               := bRSmartSend;
      cbRsvSocket_Connect.Checked        := bRsvSocket_Connect;
      cbRTCPIPConsoleEcho.Checked        := bRTCPIPConsoleEcho;
      cbRTCPIPConsoleUse.Checked         := bRTCPIPConsoleUse;
      cbRtermCanFloat.Checked            := bRtermCanFloat;
      cbRTinnRcom_Install.Checked        := bRTinnRcom_Install;
      cbRTinnRcom_Load.Checked           := bRTinnRcom_Load;
      cbScrollSendingLines.Checked       := bScrollSendingLines;
      cbToolsCanFloat.Checked            := bToolsCanFloat;
      cbUndoAfterSave.Checked            := bUndoAfterSave;
      edMaxDeparseLength.Text            := IntToStr(iMaxDeparseLength);
      edParDeplate.Text                  := sParDeplate;
      edParDviBibtex.Text                := sParDviBibtex;
      edParDviSingle.Text                := sParDviSingle;
      edParPdfBibtex.Text                := sParPdfBibtex;
      edParPdfSingle.Text                := sParPdfSingle;
      edParRgui.Text                     := sParRgui;
      edParRterm.Text                    := sParRterm;
      edParTxt2tags.Text                 := sParTxt2tags;
      edPath_Pandoc.Text                 := sPath_Pandoc;
      edPathDeplate_Converter.Text       := sPathDeplate_Converter;
      edPathDeplate_Interpreter.Text     := sPathDeplate_Interpreter;
      edPathR_Connected.Text             := sPathR_Connected;
      edPathRgui.Text                    := sPathRgui;
      edPathRterm.Text                   := sPathRterm;
      edPathTinnRcom_Installed.Text      := sPathTinnRcom_Installed;
      edPathTxt2tags_Converter.Text      := sPathTxt2tags_Converter;
      edPathTxt2tags_Interpreter.Text    := sPathTxt2tags_Interpreter;
      edFormatR.Text                     := sFormatR;
      edFormatRd.Text                    := sFormatRd;
      edtIPHostLocal.Text                := sIPHostLocal;
      edtIPHostRemote.Text               := sIPHostRemote;
      edtIPPortLocal.Text                := intToStr(iIPPortLocal);
      edtIPPortRemote.Text               := intToStr(iIPPortRemote);
      edVersion_TinnRcomInstalled.Text   := sVersion_TinnRcomInstalled;
      rgRguiTinnRDisposition.ItemIndex   := iRguiTinnRDisposition;
      shBGApplication.Brush.Color        := clBGApplication;
      shBGApplication.Font.Color         := ContrastColor(clBGApplication);
      shBGTabSelected.Brush.Color        := clBGTabSelectedNew;
      shBGTabSelected.Font.Color         := ContrastColor(clBGTabSelectedNew);
      shFGApplication.Brush.Color        := clFGApplication;
      shFGApplication.Font.Color         := ContrastColor(clFGApplication);
      shSampleApplication.Brush.Color    := clBGApplication;
      shSampleApplication.Font.Color     := clFGApplication;
      tbDelay.Position                   := iDelay;
      tbLastFile.Position                := iLastFile;
      tbLastSearch.Position              := iLastSearch;
      tbRguiTinnRProportion.Position     := iRguiTinnRProportion;
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
      cbRSendSourceBlockMarked.Checked    := actRSendSourceBlockMarked.Visible;
      cbRSendSourceClipboard.Checked      := actRSendSourceClipboard.Visible;
      cbRSendSOurceClipboard.Checked      := actRSendSourceClipboard.Visible;
      cbRSendSourceContiguous.Checked     := actRSendSourceContiguous.Visible;
      cbRSendSourceFile.Checked           := actRSendSourceFile.Visible;
      cbRSendSourceSelection.Checked      := actRSendSourceSelection.Visible;
      cbRSendSweave.Checked               := actRSendSweave.Visible;

      // Controlling R
      cbRClearAll.Checked             := actRContClearAll.Visible;
      cbRClearConsole.Checked         := actRContClearConsole.Visible;
      cbRCloseAllGraphics.Checked     := actRContCloseAllGraphics.Visible;
      cbREditVariable.Checked         := actRContEditVariable.Visible;
      cbREscape.Checked               := actRContEscape.Visible;
      cbRExampleSelectedWord.Checked  := actRContExampleSelectedWord.Visible;
      cbRFixVariable.Checked          := actRContFixVariable.Visible;
      cbRguiStartClose.Checked        := actRContGuiStartClose.Visible;
      cbRHelp.Checked                 := actRContHelp.Visible;
      cbRHelpSelectedWord.Checked     := actRContHelpSelectedWord.Visible;
      cbRListAllObjects.Checked       := actRContListAllObjects.Visible;
      cbRListVariableNames.Checked    := actRContListVariableNames.Visible;
      cbRListVariableStructure.Checked:= actRContListVariableStructure.Visible;
      cbRPackages.Checked             := actRContPackages.Visible;
      cbRPlotVariable.Checked         := actRContPlotVariable.Visible;
      cbRPrintVariableContent.Checked := actRContPrintVariableContent.Visible;
      cbRRemoveAllObjects.Checked     := actRContRemoveAllObjects.Visible;
      cbRSetWorkDirectory.Checked     := actRContSetWorkDirectory.Visible;
      cbRTCPConnection.Checked        := actRContTCPConnection.Visible;
      cbRtermStartClose.Checked       := actRContTermStartClose.Visible;

      // Tips
      with cbbTriggerRtip do begin
        if      (sTriggerRtip = 'CTRL+D') then ItemIndex:= 0
        else if (sTriggerRtip = 'CTRL+Q') then ItemIndex:= 1
        else ItemIndex:= -1;
      end;

      // Data completion
      with cbbTriggerRDataCompletion do begin
        if      (sTriggerRDataCompletion = 'SHIFT+CTRL+D') then ItemIndex:= 0
        else if (sTriggerRDataCompletion = 'SHIFT+CTRL+Q') then ItemIndex:= 1
        else ItemIndex:= -1;
      end;

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

      rdgRguiRecognitionCaption.ItemIndex:= iRguiRecognitionCaption;
      rdgRguiRecognitionType.ItemIndex   := iRguiRecognitionType;
      rdgReformatRSplit.ItemIndex        := iReformatRSplit;

      with rdgLineWraping do
        if actEditorLineWrap.Checked then ItemIndex:= 0
                                     else ItemIndex:= 1;

      with rdgRtermType do
        if bRtermSimple then ItemIndex:= 0
                        else ItemIndex:= 1;

      rdgRtermDisposition.Enabled:= bRtermSimple;

      with rdgRtermWidth do
        if bRtermWidth then ItemIndex:= 0
                       else ItemIndex:= 1;

      with rdgRtermDisposition do
        if bRtermHorizontal then ItemIndex:= 0
                            else ItemIndex:= 1;

      with rdgRtermIOSyntax do
        if (frmRterm.synIO.Highlighter = dmSyn.synText_term) then ItemIndex:= 0
                                                             else ItemIndex:= 1;
      with rdgRtermLogSyntax do
        if (frmRterm.synLog.Highlighter = dmSyn.synText_term) then ItemIndex:= 0
                                                              else ItemIndex:= 1;

      with rdgRtermClose do
        if bRtermCloseWithoutAsk then ItemIndex:= 0
                                 else ItemIndex:= 1;

      ckAutocomplete.Checked:= actAutoCompletion.Checked;

      if Assigned(slRLibPaths) then mRLibPaths.Lines.Assign(slRLibPaths);

      if Assigned(slFilters) then mFiles.Lines.Assign(slFilters);

      tbLastFileChange(nil);
      tbLastSearchChange(nil);
      tbRguiTinnRProportionChange(nil);

      Status_Editor(coEditor);
      iAlphaBlendValue:= 255 - (255 * tbTransparency.Position) Div 100;
    end;

    if bStartOptionsWithRPage then begin
      sAppSelected:= 'Path (R)';
      bStartOptionsWithRPage:= False;
    end
    else if bStartOptionsWithProcessingPage then begin
      sAppSelected:= 'Processing';
      bStartOptionsWithProcessingPage:= False;
    end;

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
        actRSendSourceBlockMarked.Visible    := cbRSendSourceBlockMarked.Checked;
        actRSendSourceClipboard.Visible      := cbRSendSourceClipboard.Checked;
        actRSendSourceClipboard.Visible      := cbRSendSourceClipboard.Checked;
        actRSendSourceContiguous.Visible     := cbRSendSourceContiguous.Checked;
        actRSendSourceFile.Visible           := cbRSendSourceFile.Checked;
        actRSendSourceSelection.Visible      := cbRSendSourceSelection.Checked;
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
        pmemRResSendSourceBlockMarked.Checked    := cbRSendSourceBlockMarked.Checked;
        pmemRResSendSourceClipboard.Checked      := cbRSendSourceClipboard.Checked;
        pmemRResSendSOurceContiguous.Checked     := cbRSendSourceContiguous.Checked;
        pmemRResSendSourceFile.Checked           := cbRSendSourceFile.Checked;
        pmemRResSendSourceSelection.Checked      := cbRSendSourceSelection.Checked;
        pmemRResSendSweave.Checked               := cbRSendSweave.Checked;

        // Controlling R alphabetically ordered
        actRContClearAll.Visible             := cbRClearAll.Checked;
        actRContClearConsole.Visible         := cbRClearConsole.Checked;
        actRContCloseAllGraphics.Visible     := cbRCloseAllGraphics.Checked;
        actRContEditVariable.Visible         := cbREditVariable.Checked;
        actRContEscape.Visible               := cbREscape.Checked;
        actRContExampleSelectedWord.Visible  := cbRExampleSelectedWord.Checked;
        actRContFixVariable.Visible          := cbRFixVariable.Checked;
        actRContGuiStartClose.Visible        := cbRguiStartClose.Checked;
        actRContHelp.Visible                 := cbRHelp.Checked;
        actRContHelpSelectedWord.Visible     := cbRHelpSelectedWord.Checked;
        actRContListAllObjects.Visible       := cbRListAllObjects.Checked;
        actRContListVariableNames.Visible    := cbRListVariableNames.Checked;
        actRContListVariableStructure.Visible:= cbRListVariableStructure.Checked;
        actRContPackages.Visible             := cbRPackages.Checked;
        actRContPlotVariable.Visible         := cbRPlotVariable.Checked;
        actRContPrintVariableContent.Visible := cbRPrintVariableContent.Checked;
        actRContRemoveAllObjects.Visible     := cbRRemoveAllObjects.Checked;
        actRContSetWorkDirectory.Visible     := cbRSetWorkDirectory.Checked;
        actRContTCPConnection.Visible        := cbRTCPConnection.Checked;
        actRContTermStartClose.Visible       := cbRtermStartClose.Checked;

        pmenRResContClearAll.Checked             := cbRClearAll.Checked;
        pmenRResContClearConsole.Checked         := cbRClearConsole.Checked;
        pmenRResContCloseAllGraphics.Checked     := cbRCloseAllGraphics.Checked;
        pmenRResContEditVariable.Checked         := cbREditVariable.Checked;
        pmenRResContEscape.Checked               := cbREscape.Checked;
        pmenRResContExampleSelectedWord.Checked  := cbRExampleSelectedWord.Checked;
        pmenRResContFixVariable.Checked          := cbRFixVariable.Checked;
        pmenRResContGuiStartClose.Checked        := cbRguiStartClose.Checked;
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
        bRememberFileState            := cbRememberFileState.Checked;
        bRememberSearchList           := cbRememberSearchList.Checked;
        bRemoveExtension              := cbRemoveExtension.Checked;
        bRestoreIniDock               := cbRestoreIniDock.Checked;
        bRsetget_Info                 := cbRsetget_Info.Checked;
        bRguiReturnFocus              := cbRguiReturnFocus.Checked;
        bRmirros_Update               := cbRmirros_Update.Checked;
        bRSendAll                     := cbRSendAll.Checked;
        bRSetWorkDir_Starting         := cbRSetWorkDir_Starting.Checked;
        bRSmartSend                   := cbRSmartSend.Checked;
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
        frmTinnMain.clBGTabSelectedNew:= shBGTabSelected.Brush.Color;
        iIPPortLocal                  := StrToInt(edtIPPortLocal.Text);
        iIPPortRemote                 := StrToInt(edtIPPortRemote.Text);
        iLastFile                     := tbLastFile.Position;
        iLastSearch                   := tbLastSearch.Position;
        iMaxDeparseLength             := StrToInt(edMaxDeparseLength.Text);
        iRguiTinnRDisposition         := rgRguiTinnRDisposition.ItemIndex;
        iRguiTinnRProportion          := tbRguiTinnRProportion.Position;
        sIPHostLocal                  := edtIPHostLocal.Text;
        sIPHostRemote                 := edtIPHostRemote.Text;
        sParDeplate                   := edParDeplate.Text;
        sParDviBibtex                 := edParDviBibtex.Text;
        sParDviSingle                 := edParDviSingle.Text;
        sParPdfBibtex                 := edParPdfBibtex.Text;
        sParPdfSingle                 := edParPdfSingle.Text;
        sParRgui                      := edParRgui.Text;
        sParRterm                     := edParRterm.Text;
        sParTxt2tags                  := edParTxt2tags.Text;
        sPath_Pandoc                  := edPath_Pandoc.Text;
        sPathDeplate_Converter        := edPathDeplate_Converter.Text;
        sPathDeplate_Interpreter      := edPathDeplate_Interpreter.Text;
        sPathRgui                     := edPathRgui.Text;
        sPathRterm                    := edPathRterm.Text;
        sPathTxt2tags_Converter       := edPathTxt2tags_Converter.Text;
        sPathTxt2tags_Interpreter     := edPathTxt2tags_Interpreter.Text;
        sFormatR                      := edFormatR.Text;
        sFormatRd                     := edFormatRd.Text;

        frmTools.cbComPriority_Line.Checked      := cbComPriority_Line.Checked;
        frmTools.cbComAutoDetect_Language.Checked:= cbComAutoDetect_Language.Checked;

        if (rdgRTCPIPType.ItemIndex = 0) then bIPLocal:= True
                                         else bIPLocal:= False;

        // Set the 'Tip' configuration in run tyme
        case cbbTriggerRtip.ItemIndex of
          0: sTriggerRtip:= 'CTRL+D';
          1: sTriggerRtip:= 'CTRL+Q';
        end;

        i:= FindTopWindow;
        if Assigned(Self.MDIChildren[i] as TfrmEditor) then begin
          SetDataCompletion(synEditorTip,
                            (Self.MDIChildren[i] as TfrmEditor).synEditor,
                            sTriggerRtip);

          SetDataCompletion(synEditor2Tip,
                            (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                            sTriggerRtip);
        end;

        SetDataCompletion(synIOTip,
                          frmRterm.synIO,
                          sTriggerRtip);

        // Set the 'Data Completion' configuration in run tyme
        case cbbTriggerRDataCompletion.ItemIndex of
          0: sTriggerRDataCompletion:= 'SHIFT+CTRL+D';
          1: sTriggerRDataCompletion:= 'SHIFT+CTRL+Q';
        end;

        if Assigned(Self.MDIChildren[i] as TfrmEditor) then begin
          SetDataCompletion(synEditorDataCompletion,
                            (Self.MDIChildren[i] as TfrmEditor).synEditor,
                            sTriggerRDataCompletion);

          SetDataCompletion(synEditor2DataCompletion,
                             (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                             sTriggerRDataCompletion);
        end;

        SetDataCompletion(synIODataCompletion,
                          frmRterm.synIO,
                          sTriggerRDataCompletion);

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

        if (rdgRtermClose.ItemIndex = 0) then bRtermCloseWithoutAsk:= True
                                         else bRtermCloseWithoutAsk:= False;

        if (rdgDataCompletion_Pattern.ItemIndex = 0) then bDataCompletionAnywhere:= True
                                                     else bDataCompletionAnywhere:= False;

        if (rdgRtermWidth.ItemIndex = 0) then bRtermWidth:= True
                                         else bRtermWidth:= False;

        iRguiRecognitionCaption:= rdgRguiRecognitionCaption.ItemIndex;
        iRguiRecognitionType   := rdgRguiRecognitionType.ItemIndex;
        iReformatRSplit        := rdgReformatRSplit.ItemIndex;


        case rdgRtermType.ItemIndex of
          0: case rdgRtermDisposition.ItemIndex of
               0: actRtermIOSplitHorizontalExecute(nil);
               1: actRtermIOSplitVerticalExecute(nil);
             end;
          1: actRtermIOSplitRemoveExecute(nil);
        end;

        case rdgRtermIOSyntax.ItemIndex of
          0: actRtermSetIOSyntaxToTextExecute(nil);
          1: actRtermSetIOSyntaxToRExecute(nil);
        end;

        case rdgRtermLogSyntax.ItemIndex of
          0: actRtermSetLogSyntaxToTextExecute(nil);
          1: actRtermSetLogSyntaxToRExecute(nil);
        end;

        actAutoCompletion.Checked:= ckAutocomplete.Checked;

        actRguiReturnFocus.Checked:= bRguiReturnFocus;
        iDelay:= tbDelay.Position;

        iTransparency   := tbTransparency.Position;
        iAlphaBlendValue:= 255 - (255 * iTransparency) Div 100;
        frmTinnMain.AlphaBlendValue:= iAlphaBlendValue;

        frmTools.tbsLatex.TabVisible:= actLatexVisible.Checked;

        NewStatus_Editor(coEditor);

        tbKnitr.Visible:= bRKnitr;
      end;

      actGutterVisible.Checked     := coEditor.Gutter.Visible;
      actLineNumbersVisible.Checked:= coEditor.Gutter.ShowLineNumbers;
      actSpecialCharVisible.Checked:= (eoShowSpecialChars in coEditor.Options);

      // Update all opened files
      for i:= (Self.MDIChildCount - 1) downto 0 do begin
        // Line wraping
        (Self.MDIChildren[i] as tfrmEditor).ToogleWordWrap(actEditorLineWrap.Checked);

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
      UpdateAppearance;

      // Update Rterm
      UpdateRterm_Appearance;

      // Update hex viewer
      UpdateHexViewer;
    end;
  finally
    FreeAndNil(dlg);
    SetFocus_Main;
  end;
end;

procedure TfrmTinnMain.WMSysCommand;
begin
  inherited;
  CheckTop;
end;

procedure TfrmTinnMain.SetRExplorer(bOption: boolean);
begin
  actRExplorerContent.Enabled            := bOption;
  actRExplorerEdit.Enabled               := bOption;
  actRExplorerExampleSelected.Enabled    := bOption;
  actRExplorerExpAscii.Enabled           := bOption;
  //actRExplorerExpHtml.Enabled            := bOption;
  actRExplorerExpRaw.Enabled             := bOption;
  //actRExplorerExpTeX.Enabled             := bOption;
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

procedure TfrmTinnMain.MakeRenvironment(slRObjects: TStringList);
var
  i,
   j: integer;

  slTmp: TStringList;
  sTmp : string;

begin
  frmTools.cbbToolsREnvironment.Clear;
  try
    slTmp:= TStringList.Create;
    for i:= 0 to (slRObjects.Count - 1) do begin
      sTmp:= slRObjects.Strings[i];

      StrSplit(' ',
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

procedure TfrmTinnMain.MakeItem(sRObjName,
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

procedure TfrmTinnMain.MakeTree(sRObjName,
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

  case StringToCaseSelect(sRObjGroup,
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
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    2);
       end;
    1: begin  // vector
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 3) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    3);
       end;
    2: begin  // matrix
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 4) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    4);
       end;
    3: begin  // data.frame
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 5) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    5);
       end;
    4: begin  // array
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 6) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    6);
       end;
    5: begin  // list
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 7) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    7);
       end;
    6: begin  // table
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 8) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    8);
       end;
    7: begin  // other
         if (frmTools.cbbToolsRExplorer.ItemIndex = 0) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 1) or
            (frmTools.cbbToolsRExplorer.ItemIndex = 9) then
           MakeItem(sRObjName,
                    sRObjDim,
                    sRObjGroup,
                    sRObjClass,
                    9);
       end;
  end;
end;

(*
procedure TfrmTinnMain.MakeTreeRExplorer_TCPIP(slRObjects: TStringList);
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
    StrSplit(' ',
             sTmp,
             slTmp);
    for i:= 0 to (slRObjects.Count-1) do begin
      sTmp:= slRObjects.Strings[i];
      StrSplit(' ',
               sTmp,
               slTmp) ;
      if (slTmp.Count >= 5) then begin
        sRObjName := slTmp[1]; // Name of R object
        sRObjDims := slTmp[2]; // Dims of R object
        sRObjGroup:= slTmp[3]; // Group of R object
        sRObjClass:= slTmp[4]; // Class of R object
        MakeTree(sRObjName,
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

procedure TfrmTinnMain.MakeTreeRExplorer_TmpFile(slRObjects: TStringList);

  procedure DefineObjectStructure(var sTmp,
                                      RobjName,
                                      RobjDim,
                                      RobjGroup,
                                      RobjClass: string;
                                   var tslTmp: TstringList);
  begin
    StrSplit(' ',
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
      DefineObjectStructure(sTmp,
                            sRObjName,
                            sRObjDim,
                            sRObjGroup,
                            sRObjClass,
                            slTmp);

      MakeTree(sRObjName,
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

procedure TfrmTinnMain.menRServerClick(Sender: TObject);
begin
  try
    frmRServer:= TfrmRServer.Create(nil);
    frmRServer.ShowModal;
  finally
    FreeAndNil(frmRServer);
    SetFocus_Main;
  end;
  frmTinnMain.Refresh;
end;

procedure TfrmTinnMain.menRSet_trPathsClick(Sender: TObject);
var
  sTinnRPaths: string;
  
begin

sTinnRPaths:= '.trPaths <- file.path(Sys.getenv(''TEMP''), ' +
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

DoSend(sTinnRPaths);
end;

procedure TfrmTinnMain.menRtermHistoryNextClick(Sender: TObject);
begin
  if not frmTinnMain.Rterm_Running then Exit;

  with frmRterm.synIO do begin
       CaretY:= Lines.Count;
       if (SelText <> EmptyStr) then Exit;
       if frmRterm.bRterm_Plus then LineText:= '+ ' +
                                               frmTinnMain.RHistory.GetNext
       else
         if frmRterm.bRUnderDebug_Function or
            frmRterm.bRUnderDebug_Package then LineText:= frmRterm.sRDebugPrefix +
                                                          ' ' +
                                                          frmTinnMain.RHistory.GetNext
                                 else LineText:= '> ' +
                                                 frmTinnMain.RHistory.GetNext;
       ExecuteCommand(ecLineEnd,
                      #0,
                      nil);
  end;
end;

procedure TfrmTinnMain.menRtermHistoryPriorClick(Sender: TObject);
begin
  if not frmTinnMain.Rterm_Running then Exit;

  with frmRterm do begin
       synIO.CaretY:= synIO.Lines.Count;
       if (synIO.SelText <> EmptyStr) then Exit;
       if bRterm_Plus then synIO.LineText:= '+ ' +
                                            frmTinnMain.RHistory.GetPrior
       else
         if bRUnderDebug_Function or
            bRUnderDebug_Package then synIO.LineText:= sRDebugPrefix +
                                                       ' ' +
                                                       frmTinnMain.RHistory.GetPrior
                                 else synIO.LineText:= '> ' +
                                                 frmTinnMain.RHistory.GetPrior;
       synIO.ExecuteCommand(ecLineEnd,
                            #0,
                            nil);
  end;
end;

procedure TfrmTinnMain.lvRexplorerDblClick(Sender: TObject);
var
  i: integer;
  
begin
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  actRExplorerSendNameToEditorExecute(nil);

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmTinnMain.csRGeneralConnect(Sender: TObject;
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

procedure TfrmTinnMain.csRGeneralDisconnect(Sender: TObject;
                                            Socket: TCustomWinSocket);
var
  i   : integer;
  sTmp: string;

begin
  if bConectionError then Exit;
  actRContTCPConnection.Checked:= False;
  // The server sends '' when disconnect fine
  sTmp:= Socket.ReceiveText;

  i   := pos(#$D,
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

procedure TfrmTinnMain.csREnvironmentError(Sender: TObject;
                                           Socket: TCustomWinSocket;
                                           ErrorEvent: TErrorEvent;
                                           var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  Socket.Close;
end;

procedure TfrmTinnMain.csRExplorerError(Sender: TObject;
                                        Socket: TCustomWinSocket;
                                        ErrorEvent: TErrorEvent;
                                        var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  Socket.Close;
end;

procedure TfrmTinnMain.csRGeneralError(Sender: TObject;
                                       Socket: TCustomWinSocket;
                                       ErrorEvent: TErrorEvent;
                                       var ErrorCode: Integer);
begin
  if (ErrorCode = 10061) then
    MessageDlg('Error: ' + IntToStr(ErrorCode) + #13 + #13 +
               'R is not in server mode.' + #13 +
               'Please, start R and/or run the startSocketServer() function' + #13 +
               'available in svSocket package!',
               mtError,
               [mbOk],
               0)
  else if (ErrorCode = 10053) and
          not bRsvSocket_Connect then
    MessageDlg('Error: ' + IntToStr(ErrorCode) + #13 + #13 +
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

procedure TfrmTinnMain.csREnvironmentRead(Sender: TObject;
                                          Socket: TCustomWinSocket);
var
  iRemoteIP,
   iPriorMessage: integer;
  slFromRServer : TStringList;
  sTmp          : string;

begin
  sTmp:= trim(Socket.ReceiveText);
  iRemoteIP:= pos(csRtip.Host,
                  sTmp);

  if (iRemoteIP <> 0) or
     (sTmp = EmptyStr) then Exit;  // Exit if message is of the connection or #$D#$A
  iPriorMessage:= pos('[',
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
  MakeRenvironment(slFromRServer);
  FreeAndNil(slFromRServer);
end;

procedure TfrmTinnMain.csRGeneralRead(Sender: TObject;
                                      Socket: TCustomWinSocket);
var
  aBuffer  : array [0..4095] of char;
  buf      : PChar;
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

procedure TfrmTinnMain.csRtipError(Sender: TObject;
                                   Socket: TCustomWinSocket;
                                   ErrorEvent: TErrorEvent;
                                   var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  Socket.Close;
end;

procedure TfrmTinnMain.PrintMessage(sInstruction: string;
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

procedure TfrmTinnMain.pmenProjRSendToRClick(Sender: TObject);

  procedure SendToR(var Stmp: string);
  begin
    DoSend(sTmp);
  end;

  procedure PrepareToSendToR(sFilePath: string;
                             var sTmp: string);
  var
    sUnixPath,
      sToSend: string;

  begin
    sUnixPath:= DosPathToUnixPath(sFilePath);
    if Rterm_Running or
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
      DoSend(sToSend);
  end;

var
  bIgnoreAll: boolean;

  j,
   iFiles   : integer;

  sFilePath,
    sTmp    : string;

  tnCurNode : TTreeNode;
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
          if FileExists(sFilePath) then PrepareToSendToR(sFilePath,
                                                         sTmp)
          else if not bIgnoreAll then begin
            userOption:= MessageDlg(sFilePath + #13 + #13 +
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
        if FileExists(sFilePath) then PrepareToSendToR(sFilePath,
                                                       sTmp)
        else if not bIgnoreAll then begin
          userOption:= MessageDlg(sFilePath + #13 + #13 +
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
      if FileExists(sFilePath) then PrepareToSendToR(sFilePath,
                                                     sTmp)
                               else MessageDlg(trim(sFilePath) + #13 + #13 +
                                               'File not found!',
                                               mtWarning,
                                               [mbOk],
                                               0);
    end;

    if (sTmp <> EmptyStr) then SendToR(sTmp);
  end;
end;

procedure TfrmTinnMain.pmenProjRSetWorkDirClick(Sender: TObject);

  procedure SendToR(filePath: string);
  var
    unixPath,
     sToSend : string;

  begin
    unixPath:= DosPathToUnixPath(filePath);
    sToSend := 'setwd(''' +
               unixPath +
               ''')';
    DoSend(sToSend);
  end;

var
  sFilePath : string;

begin
  with frmTools.tvProject do begin
    if (Selected = nil) then Exit;
    // Send selected file to R
    if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then SendToR(ExtractFilePath(sFilePath))
                               else MessageDlg(trim(sFilePath) + #13 + #13 +
                                               'File not found!',
                                               mtWarning,
                                               [mbOk],
                                               0);
    end;
  end;
end;

procedure TfrmTinnMain.pmenWinExplorerFilesRefreshClick(Sender: TObject);
begin
  frmTools.bbtWinExplorerFilterRefreshClick(nil);
end;

procedure TfrmTinnMain.pmenWinExplorerFoldersRefreshClick(Sender: TObject);
begin
  frmTools.bbtWinExplorerRefreshClick(nil);
end;

procedure TfrmTinnMain.pmenWorkExplorerFilesRefreshClick(Sender: TObject);
begin
  frmTools.bbtWorkExplorerFileterRefreshClick(nil);
end;

procedure TfrmTinnMain.pmenWorkExplorerFoldersRefreshClick(Sender: TObject);
begin
  frmTools.bbtWorkExplorerRefreshClick(nil);
end;

procedure TfrmTinnMain.actRExplorerHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Tools interface"');
end;

procedure TfrmTinnMain.actRExplorerHelpSelectedExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'help(''' +
         frmTools.lvRexplorer.Selected.Caption +
         ''')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExampleSelectedExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'example(''' +
         frmTools.lvRexplorer.Selected.Caption +
         ''')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerNamesExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'names(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerStructureExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'str(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerSummaryExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'summary(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerEditExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'edit(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerFixExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'fix(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerPlotExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'plot(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerRemoveExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'rm(' +
         frmTools.lvRexplorer.Selected.Caption +
         ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerRemoveAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Items.Count = 0) then Exit;
  //sTmp:= 'rm(list=ls(all=TRUE))';
  sTmp:= 'rm(list=ls())';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerContentExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= frmTools.lvRexplorer.Selected.Caption;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerSendNameToEditorExecute(Sender: TObject);
var
  seEditor: TSynEdit;

  i: integer;

begin
  if Assigned(frmTools.lvRexplorer.Selected) then begin
    if not SavePriorClipboardText then Exit;
    Clipboard.AsText:= frmTools.lvRexplorer.Selected.Caption;

    i:= FindTopWindow;
    if Assigned(Self.MDIChildren[i] as TfrmEditor) then begin
      with (Self.MDIChildren[i] as TfrmEditor) do begin
        if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                         else seEditor:= synEditor2;
        seEditor.PasteFromClipboard;
        EnableSave;
      end;
    end;

    RestorePriorClipboardText;
  end;
end;

procedure TfrmTinnMain.actRExplorerSendNameToClipboardExecute(Sender: TObject);
begin
  if Assigned(frmTools.lvRexplorer.Selected) then Clipboard.AsText:= frmTools.lvRexplorer.Selected.Caption;
end;

procedure TfrmTinnMain.actRExplorerExpRawExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'trExport(''' +
         frmTools.lvRexplorer.Selected.Caption +
         '''' +
         ', ' +
         'type=''raw'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExpAsciiExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'trExport(''' +
         frmTools.lvRexplorer.Selected.Caption +
         '''' +
         ', ' +
         'type=''ascii'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRCardHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Card (R)"');
end;

procedure TfrmTinnMain.actRCardHelpSelectedExecute(Sender: TObject);

  function GetWord: string;
  var
    iPos: integer;
    sTmp: string;

  begin
    Result:= EmptyStr;

    sTmp:= modDados.cdRcardFunction.Value;

    iPos:= pos('(',
               sTmp);

    if (iPos <> 0) then sTmp:= copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      MessageDlg('No valid word selected!',
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
  sTmp:= GetWord;
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRcardInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then Exit;
  i:= FindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    DoCardInsert;
  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmTinnMain.actRCardExampleSelectedExecute(Sender: TObject);

  function GetWord: string;
  var
    iPos: integer;
    sTmp: string;

  begin
    Result:= EmptyStr;

    sTmp:= modDados.cdRcardFunction.Value;

    iPos:= pos('(',
               sTmp);

    if (iPos <> 0) then sTmp:= copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      MessageDlg('No valid word selected!',
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
  sTmp:= GetWord;
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRcardCopyFunctionExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdRcardFunction.Text;
end;

procedure TfrmTinnMain.actRcardEditExecute(Sender: TObject);
begin
  sRcardBookMark:= modDados.cdRcard.Bookmark;
  menToolsDatabaseCardRClick(nil);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actRcardCopyDescritionExecute(Sender: TObject);
begin
  with modDados do
    if frmTools.dbRcardMemo.SelLength <> 0 then Clipboard.AsText:= frmTools.dbRcardMemo.SelText
                                           else Clipboard.AsText:= cdRcardDescription.Value;
end;

procedure TfrmTinnMain.UpdateOptions;
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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
  UpdateCloseFileOptions;
end;

procedure TfrmTinnMain.actSplitVerticalExecute(Sender: TObject);
var
  i: integer;

begin
  synURIOpener.Editor:= nil;
  i:= FindTopWindow;

  with (Self.MDIChildren[i] as TfrmEditor) do
    EditorSplit(False);

  SetDataCompletion(synEditor2Tip,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                    sTriggerRtip);

  SetDataCompletion(synEditor2DataCompletion,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                    sTriggerRDataCompletion);

  SetFocus_Main;                    
end;

procedure TfrmTinnMain.actSplitHorizontalExecute(Sender: TObject);
var
  i: integer;

begin
  synURIOpener.Editor:= nil;

  i:= FindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    EditorSplit;

  SetDataCompletion(synEditor2Tip,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                    sTriggerRtip);

  SetDataCompletion(synEditor2DataCompletion,
                    (Self.MDIChildren[i] as TfrmEditor).synEditor2,
                    sTriggerRDataCompletion);

  SetFocus_Main;                    
end;

procedure TfrmTinnMain.actSplitRemoveExecute(Sender: TObject);
begin
  synURIOpener.Editor:= nil;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    EditorRemoveSplit;

  with synEditor2Tip do begin
    Editor       := nil;
    EndOfTokenChr:= EmptyStr;
    ShortCut     := TextToShortCut(EmptyStr);
  end;
end;

procedure TfrmTinnMain.actRExplorerStyleExecute(Sender: TObject);
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

{$WARNINGS OFF}
procedure TfrmTinnMain.actSearchInFilesExecute(Sender: TObject);
var
  dlg: TfrmSearchInFiles;

  iMatchCount,
   iFoundFileCount,
   iTotFileCount  : integer;

  lSavedCursor: TCursor;

  sSearchText,
   sSearchDirectoryText,
   sSearchFileMask     : string;

  seEditor: TSynEdit;

begin
  dlg:= TfrmSearchInFiles.Create(Self);

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
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

    with seEditor do
      if SelAvail and
        (BlockBegin.Line = BlockEnd.Line) then dlg.SearchText:= SelText
                                          else dlg.SearchText:= GetWordAtRowCol(WordStartEx(CaretXY));  // Avoid return empty wheter cursor is at the end of word
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
        SetupSearchParameters(sSearchText);
        if bSearchOpenFiles then begin
          SearchInOpenFiles(iFoundFileCount,
                            iMatchCount);
          iTotFileCount:= Self.MDIChildCount;
        end;
        if bSearchDirectory then begin
          SearchInDirectories(sSearchDirectoryText,
                              sSearchFileMask,
                              iFoundFileCount,
                              iMatchCount,
                              iTotFileCount);
        end;
        sSearchTextHistory:= dlg.SearchTextHistory;
      end;
    finally
      if (MDIChildCount > 0) then TfrmEditor(frmTinnMain.MDIChildren[0]).synEditor.cursor:= lSavedCursor
                             else Screen.cursor:= crDefault;

      with frmTools.stbSearch do
        Panels[1].Text:= IntToStr(frmTools.tvSearch.Items.Count);

      FreeAndNil(dlg);

      with frmTools.tvSearch do begin
        Selected:= Items.GetFirstNode;
        actSearchExpandOneExecute(Self);
        if (Items.Count > 2) then ToolsSearchControls(True)
                             else ToolsSearchControls(False);
      end;
    end;
  end;
end;
{$WARNINGS ON}

function TfrmTinnMain.ValidRRunning: boolean;
begin
  Result:= True;
  if not Rterm_Running and
     not Rgui_Running  and
     not bIPRemoteConnected then Result:= False;
end;

procedure TfrmTinnMain.VimRplugin1Click(Sender: TObject);
begin
  OpenURL('http://www.vim.org/scripts/script.php?script_id=2628')
end;

procedure TfrmTinnMain.SendToConsole(sTmp: string);
var
  iPos     : integer;
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
        iPos:= pos('>',
                   sTmpPrior);
        if (iPos <> 0) then Delete(sTmpPrior,
                                   iPos + 1,
                                   length(sTmpPrior));

        // Check if under debug function
        iPos:= pos(']>',
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
  end;
end;

procedure TfrmTinnMain.CheckRterm;
begin
  if not GetFormVisible(frmRterm) then ShowDockForm(frmRterm);

  actRtermVisible.Checked:= GetFormVisible(frmRterm);
end;

procedure TfrmTinnMain.DoSend(var sTmp: string;
                              bSendToSynIO: boolean = True);
var
  sToSend: string;

begin
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  // Rterm: priority 1
  if Rterm_Running then begin
    CheckRterm;
    sToSend:= sTmp + #13#10;
    frmRterm.cRterm.SendInput(sToSend);
    if bSendToSynIO then SendToConsole(sTmp);
    //Exit;
  end
  // Rgui: priority 2
  else if Rgui_Running then begin
    sToSend:= sTmp;
    fCodeSender.SendChar(sToSend,
                         hRgui,
                         iDelay);
    CheckTop;
    SetFocus_Rgui(iDelay div 4);
  end
  // R server remote: priority 3
  else if bIPRemoteConnected then begin
    if not UseTCPIP then Exit;
    CheckRterm;
    sToSend:= sTmp + #13#10;

    if bSendToSynIO then PrintMessage(sTmp,
                                      True);
    csRGeneral.Socket.SendText(sToSend);
    SetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmTinnMain.RemoveLine_Commented(var sTmp: string);
begin
  sTmp:= RegEx_Multiline(sTmp,
                         //'^[ \{\}\(\)"''''_a-zA-Z0-9,.=-].*' // Get all lines not started by # (R is a language quite promiscuous!!!)
                         '^((?!^#)).*$');                      // \o/
end;

procedure TfrmTinnMain.RemoveLine_Empty(var sTmp: string);
begin
  sTmp:= RegEx_Multiline(sTmp,
                         '.*$');  // \o/
end;

function TfrmTinnMain.GetFile(var bSingleLine: boolean): string;
var
  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;
  sTmp:= (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor.Text;
  if not bRSendAll then RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if bRSmartSend and
     SingleLine(sTmp) then begin
    bSingleLine:= True;
    Result     := StringReplace(sTmp,
                                #13#10,
                                EmptyStr,
                                [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPathTmp + '\file.r';
  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[4]';
  end;
end;

function TfrmTinnMain.GetSelectionToReformat(sSel: string): string;
var
  sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;

  sFilePath:= sPathTmp + '\reformat-input.r';

  if FileSaveFast(sFilePath,
                  sSel) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[8]';
  end;
end;

function TfrmTinnMain.GetFileToReformat: string;
var
  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;

  sTmp:= (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor.Text;

  sFilePath:= sPathTmp + '\reformat-input.r';
  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[8]';
  end;
end;

function TfrmTinnMain.SingleLine(sTmp: string): boolean;
begin
  Result:= False;
  if (pos(#13#10,
          sTmp) <=0) or
     ((length(sTmp) - 1) = pos(#13#10,
                               sTmp)) then Result:= True;
end;

function TfrmTinnMain.GetClipboard(var bSingleLine: boolean): string;
var
  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;

  sTmp:= Clipboard.AsText;
  if not bRSendAll then RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if bRSmartSend and
     SingleLine(sTmp) then begin
    bSingleLine:= True;
    Result     := StringReplace(sTmp,
                                #13#10,
                                EmptyStr,
                                [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPathTmp + '\selection.r';
  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[5]';
  end;
end;

function TfrmTinnMain.GetSelection(var bSingleLine: boolean): string;
var
  seEditor: TSynEdit;

  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then sTmp:= SelText
                else Exit;

  if not bRSendAll then RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if bRSmartSend and
     SingleLine(sTmp) then begin
    bSingleLine:= True;
    Result     := StringReplace(sTmp,
                                #13#10,
                                EmptyStr,
                                [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPathTmp + '\selection.r';
  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[5]';
  end;
end;

function TfrmTinnMain.GetBlockMarked(var bSingleLine: boolean): string;
var
  aMarks: array of array of integer;

  bcPos: TBufferCoord;

  i,
   iLine,
   iLineBlockBegin,
   iLineBlockEnd  : integer;

  seEditor: TSynEdit;
  smOption: TSynSelectionMode;

  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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

    BlockEnd  := BufferCoord(0,
                             iLineBlockEnd);

    if SelAvail then sTmp:= SelText
                else Exit;

    SelectionMode:= smOption;
    TopLine:= iLine;
    CaretXY:= bcPos;
    EndUpdate;
  end;

  if not bRSendAll then RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if bRSmartSend and
     SingleLine(sTmp) then begin
    bSingleLine:= True;
    Result     := StringReplace(sTmp,
                                #13#10,
                                EmptyStr,
                                [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPathTmp + '\block.r';
  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[6]';
  end;
end;

function TfrmTinnMain.GetContiguous(var bSingleLine: boolean): string;
var
  bEmptyLine,
   bEndOfChunk,
   bValidLine : boolean;

  cTmp: char;

  iCurrent,
   iLines,
   iResult,
   iLineContiguousBegin,
   iLineContiguousEnd  : integer;

  seEditor: TSynEdit;

  sLine,
   sTmp,
   sFilePath: string;

  smOption: TSynSelectionMode;

  synSearchOptions: TSynSearchOptions;

  procedure GoToNextLine;
  begin
    bEmptyLine:= False;
    with seEditor do begin
      CaretX  := 0;
      CaretY  := CaretY + 1;
      iCurrent:= CaretY;
    end;
  end;

  procedure GoToNextValidLine(iLine: integer);
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
          #32: GoToNextLine;                        // Nothing
          #35: if bRSendAll then bValidLine:= True  // #
                            else GoToNextLine;
          else
            bValidLine:= True;
        end;
      end;
    end;
  end;

  procedure Others_GoToNextEmptyLine(iLine: integer);
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
          #10..#13: bEmptyLine:= True;  // LF .. CR,
          #32     : bEmptyLine:= True;  // Nothing
          #35     : GoToNextLine;       // #
          else
            GoToNextLine;
        end;
      end;
    end;
  end;

  procedure Sweave_GoToNextEmptyLine(iLine: integer);
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
          #10..#13: bEmptyLine:= True;  // LF .. CR,
          #32     : bEmptyLine:= True;  // Nothing
          #35     : GoToNextLine;       // #
          #64     : begin               // @ (end of chunk)
                     bEmptyLine := True;
                     CaretY     := CaretY - 1;
                     bEndOfChunk:= True;
                    end
          else
            GoToNextLine;
        end;
      end;
    end;
  end;

  function FindNextChunk: boolean;
  begin
    Result:= True;
    with seEditor do begin
      SearchEngine:= SynEditSearch;
      synSearchOptions:= [];
      iResult:= SearchReplace('>>=',
                              EmptyStr,
                              synSearchOptions);  // It will search the next chunk of Sweave

      if (iResult > 0) then GoToNextLine
                       else Result:= False;  // It was found the last line of the last chunk
    end;
  end;

begin
  Result:= EmptyStr;
  bEndOfChunk:= False;
  if not ValidRRunning then Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    BeginUpdate;
    smOption:= SelectionMode;

    if (SelectionMode <> smLine) then SelectionMode:= smLine;
    CaretX:= 0;
    iLineContiguousBegin:= CaretY;

    if (cbSyntax.Text = 'Sweave') then Sweave_GoToNextEmptyLine(CaretY)
                                  else Others_GoToNextEmptyLine(CaretY);
    iLineContiguousEnd:= CaretY;
    BlockBegin:= BufferCoord(0,
                             iLineContiguousBegin);

    BlockEnd  := BufferCoord(0,
                             iLineContiguousEnd);

    if SelAvail then sTmp:= SelText
    else begin
      EndUpdate;
      SelectionMode:= smOption;
      Exit;
    end;

    CaretX:= 0;
    if (cbSyntax.Text = 'Sweave') and
       bEndOfChunk then FindNextChunk;

    GoToNextValidLine(CaretY);
    SelectionMode:= smOption;
    EndUpdate;
  end;
  if not bRSendAll then RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if (sTmp = EmptyStr) then Exit;

  if bRSmartSend and
     SingleLine(sTmp) then begin
    bSingleLine:= True;
    Result     := StringReplace(sTmp,
                                #13#10,
                                EmptyStr,
                                [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPathTmp + '\selection.r';

  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[5]';
  end;
end;

function TfrmTinnMain.GetLine(bGoToNextValidLine: boolean): string;
var
  bValidLine,
   bLineWrap: boolean;

  cTmp: char;

  iCurrent,
   iLines,
   iResult: integer;

  seEditor: TSynEdit;

  sLine,
   sTmp: string;

  smOption: TSynSelectionMode;

  synSearchOptions: TSynSearchOptions;

  procedure Others_GoToNextValidLine(iLine: integer);

    procedure GoToNextLine;
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
          #10..#13,                                 // LF .. CR,
          #32: GoToNextLine;                        // Nothing
          #35: if bRSendAll then bValidLine:= True  // #
                            else GoToNextLine;
          else
            bValidLine:= True;
        end;
      end;
    end;
  end;

  procedure Sweave_GoToNextValidLine(iLine: integer);

    procedure GoToNextLine;
    begin
      bValidLine:= False;
      with seEditor do begin
        CaretX  := 0;
        CaretY  := CaretY + 1;
        iCurrent:= CaretY;
      end;
    end;

    function FindNextChunk: boolean;
    begin
      Result:= True;

      with seEditor do begin
        SearchEngine:= SynEditSearch;
        synSearchOptions:= [];
        iResult:= SearchReplace('>>=',
                                EmptyStr,
                                synSearchOptions);  // It will search the next chunk of Sweave
        if (iResult > 0) then GoToNextLine
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
          #10..#13,                                 // LF .. CR,
          #32: GoToNextLine;                        // Nothing
          #35: if bRSendAll then bValidLine:= True  // #
                            else GoToNextLine;
          #64: if not FindNextChunk then Break;
          else
            bValidLine:= True;
        end;
      end;
    end;
  end;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;
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
      if (cbSyntax.Text = 'Sweave') then Sweave_GoToNextValidLine(CaretY)
                                    else Others_GoToNextValidLine(CaretY);
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
      if (cbSyntax.Text = 'Sweave') then Sweave_GoToNextValidLine(CaretY + 1)
                                    else Others_GoToNextValidLine(CaretY + 1);
    SelectionMode:= smOption;
    EndUpdate;
  end;

  Result:= sTmp;
end;

function TfrmTinnMain.GetLinesToEndPage(var bSingleLine: boolean): string;
var
  seEditor: TSynEdit;
  smOption: TSynSelectionMode;

  sTmp,
   sFilePath: string;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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

  if not bRSendAll then RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if bRSmartSend and
     SingleLine(sTmp) then begin
    bSingleLine:= True;
    Result     := StringReplace(sTmp,
                                #13#10,
                                EmptyStr,
                                [rfReplaceAll]);
    Exit;
  end;

  sFilePath:= sPathTmp + '\lines.r';

  if FileSaveFast(sFilePath,
                  sTmp) then begin
    //if (RHistory = nil) then RHistory:= TRHistory.Create;
    //RHistory.LoadFromFile(sFilePath);
    Result:= '.trPaths[7]';
  end;
end;

function TfrmTinnMain.GetCursorTo(sWay: string): string;
var
  bLineWrapOption: boolean;

  iPos: integer;

  seEditor: TSynEdit;

  smOption: TSynSelectionMode;

begin
  Result:= EmptyStr;
  if not ValidRRunning then Exit;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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

function TfrmTinnMain.GetPathFile(bFull: boolean = False): string;
var
  sDos: string;
  i   : integer;

begin
  Result:= EmptyStr;

  if not ValidRRunning then Exit;
  i:= FindTopWindow;

  if ((Self.MDIChildren[i] as TfrmEditor).synEditor.Modified = True) then actFileSaveExecute(Self);
  sDos:= (Self.MDIChildren[i] as TfrmEditor).sActiveFile;

  if bFull then Result:= DosPathToUnixPath(sDos)
           else Result:= DosPathToUnixPath(ExtractFilePath(sDos));
end;

procedure TfrmTinnMain.actRSendSourceFileExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetFile(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendFileExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetFile(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ', echo=TRUE' +
           ', max.deparse.length=' +
           IntToStr(iMaxDeparseLength) +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendSourceSelectionExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetSelection(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendSelectionExecute(Sender: TObject);
var
  sTmp,
   sToSend: string;
  bSingleLine: boolean;

begin
  sToSend:= GetSelection(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ', echo=TRUE' +
           ', max.deparse.length=' +
           IntToStr(iMaxDeparseLength) +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendSourceClipboardExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetClipboard(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendClipboardExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetClipboard(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ', echo=TRUE' +
           ', max.deparse.length=' +
           IntToStr(iMaxDeparseLength) +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendSourceBlockMarkedExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetBlockMarked(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendBlockMarkedExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetBlockMarked(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ', echo=TRUE' +
           ', max.deparse.length=' +
           IntToStr(iMaxDeparseLength) +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendSourceContiguousExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetContiguous(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendContiguousExecute(Sender: TObject);
var
  sTmp,
   sToSend   : string;
  bSingleLine: boolean;

begin
  sToSend:= GetContiguous(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ', echo=TRUE' +
           ', max.deparse.length=' +
           IntToStr(iMaxDeparseLength) +
           ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendLineExecute(Sender: TObject);
var
  bGoToNextValidLine: boolean;

  sTmp: string;
  i   : integer;

begin
  i:= FindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    bGoToNextValidLine:= not bSendToREditing;

  sTmp:= GetLine(bGoToNextValidLine);
  if (sTmp = EmptyStr) then Exit;

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendLinesToEndPageExecute(Sender: TObject);
var
  bSingleLine: boolean;

  sTmp,
   sToSend: string;

begin
  sToSend:= GetLinesToEndPage(bSingleLine);
  if (sToSend = EmptyStr) then Exit;

  if bSingleLine then
    sTmp:= sToSend
  else
    sTmp:= 'source(' +
           sToSend +
           ', echo=TRUE' +
           ', max.deparse.length=' +
           IntToStr(iMaxDeparseLength) +
           ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRCurrentLineToTopExecute(Sender: TObject);
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  with seEditor do begin
    TopLine:= CaretY;
    CaretX := 0;
  end;

  CheckTop;
  SetFocus_Rgui(iDelay);
end;

procedure TfrmTinnMain.actRSendCursorToBeginningLineExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= GetCursorTo('BeginningLine');
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendCursorToEndLineExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= GetCursorTo('EndLine');
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRSendSweaveExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sUnix,
   sLatexFile: string;

begin
  sUnix:= GetPathFile(True);

  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
          GetPathFile(False) +
          ''')' + #13#10;

  if (csRGeneral.Active) then csRGeneral.Socket.SendText(sTmp);
  Application.ProcessMessages;

  sTmp:= 'Sweave(''' +
         sUnix +
         ''')';

  DoSend(sTmp);

  sLatexFile:= ChangeFileExt(sUnix,
                             '.tex');

  i:= 1;
  repeat
    Sleep(5*iDelay);

    if FileExists(UnixPathToDosPath(sLatexFile)) then begin
      UpdateFileIntoTinn(UnixPathToDosPath(sLatexFile));
      Break;
    end;

    inc(i);
  until (i = 20);
end;

procedure TfrmTinnMain.actRSendKnitPdfExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sUnix,
   sLatexFile: string;

begin
  sUnix:= GetPathFile(True);
  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
          GetPathFile(False) +
          ''')' + #13#10;

  if (csRGeneral.Active) then csRGeneral.Socket.SendText(sTmp);
  Application.ProcessMessages;

  if (bRRequireKnitr) then begin
    bRRequireKnitr:= False;
    sTmp:= 'require(knitr); knit(''' +
           sUnix +
           ''')';
  end
  else begin
    sTmp:= 'knit(''' +
           sUnix +
           ''')';
  end;

  DoSend(sTmp);

  sLatexFile:= ChangeFileExt(UnixPathToDosPath(sUnix),
                             '.tex');
  i:= 1;
  repeat
    Sleep(5*iDelay);

    if FileExists(sLatexFile) then begin
      Sleep(10*iDelay);  // It is important!
      UpdateFileIntoTinn(sLatexFile);
      Break;
    end;

    inc(i);
  until (i = 20);
end;

procedure TfrmTinnMain.actRSendKnitHtmlExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sUnix,
   sMarkdownFile,
   sHtmlFile: string;

begin
  sUnix:= GetPathFile(True);
  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
          GetPathFile(False) +
          ''')' + #13#10;

  if (csRGeneral.Active) then csRGeneral.Socket.SendText(sTmp);
  Application.ProcessMessages;

  if (bRRequireKnitr) then begin
    bRRequireKnitr:= False;
    sTmp:= 'require(knitr); knit2html(''' +
           sUnix +
           ''')';
  end
  else begin
    sTmp:= 'knit2html(''' +
           sUnix +
           ''')';
  end;

  DoSend(sTmp);

  sMarkdownFile:= ChangeFileExt(sUnix,
                                '.md');

  sHtmlFile:= ChangeFileExt(sUnix,
                            '.html');

  i:= 1;
  repeat
    Sleep(5*iDelay);
    // Do not change the order of the UpdateFileIntoTinn
    if FileExists(UnixPathToDosPath(sHtmlFile)) then begin
      Sleep(10*iDelay);  // It is important!
      if FileExists(UnixPathToDosPath(sMarkdownFile)) then  // file.Rhtml do not generate file.md
        UpdateFileIntoTinn(UnixPathToDosPath(sMarkdownFile));

      UpdateFileIntoTinn(UnixPathToDosPath(sHtmlFile));

      if (actHtmlOpenAlways.Checked) then actHtmlOpenCurrentFileExecute(nil);
      Break;
    end;

    inc(i);
  until (i = 20);
end;

procedure TfrmTinnMain.actRContSetWorkDirectoryExecute(Sender: TObject);
var
  sTmp,
   sUnix: string;

begin
  sUnix:= GetPathFile;
  if (sUnix = EmptyStr) then Exit;

  sTmp:= 'setwd(''' +
         sUnix +
         ''')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContListAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= 'ls()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPrintVariableContentExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= FindWord;

  if (sTmp = EmptyStr) then begin
    MessageDlg('No valid word selected!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContListVariableNamesExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= FindWord;

  if (sTmp = EmptyStr) then begin
    MessageDlg('No valid word selected!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;
  sTmp:= 'names(' +
          sTmp +
          ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContListVariableStructureExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= FindWord;

  if (sTmp = EmptyStr) then begin
    MessageDlg('No valid word selected!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;
  sTmp:= 'str(' +
          sTmp +
          ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContEditVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= FindWord;

  if (sTmp = EmptyStr) then begin
    MessageDlg('No valid word selected!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;
  sTmp:= 'edit(' +
          sTmp +
          ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContFixVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= FindWord;

  if (sTmp = EmptyStr) then begin
    MessageDlg('No valid word selected!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;
  sTmp:= 'fix(' +
          sTmp +
          ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPlotVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= FindWord;

  if (sTmp = EmptyStr) then begin
    MessageDlg('No valid word selected!',
               mtInformation,
               [mbOk],
               0);
    Exit;
  end;
  sTmp:= 'plot(' +
          sTmp +
          ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.SendRCustom(sRC: string);
var
  bSingleLine: boolean;

  sTmp,
   sToSend: string;

begin
  if not ValidRRunning then Exit;

  if (pos('%f',
          sRC) > 0) then begin
    if (pgFiles.PageCount = 0) then Exit;
    sToSend:= GetFile(bSingleLine);       // Get file
    if (sToSend = EmptyStr) then Exit;

    sTmp:= StringReplace(sRC,
                         '%f',
                         sToSend,
                         [rfReplaceAll]);
  end
  else if (pos('%s',
               sRC) > 0) then begin
    if (pgFiles.PageCount = 0) then Exit;
    sToSend:= GetSelection(bSingleLine);  // Get slection

    if (sToSend = EmptyStr) then begin
      sToSend:= FindWord;                 // Get word

      if (sToSend = EmptyStr) then begin
        MessageDlg('No valid word selected!',
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

  DoSend(sTmp);
end;

procedure TfrmTinnMain.DoClearConsole;
var
  sToSend: string;

begin
  if not ValidRRunning then Exit;

  // Rterm: priority 1
  if Rterm_Running then begin
    CheckRterm;

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
  if Rgui_Running then begin
    sToSend:= '^l';
    fCodeSender.DoPrepare;
    fCodeSender.SendString(sToSend);
    CheckTop;
    SetFocus_Rgui(iDelay);
    Exit;
  end;

  // R remote: priority 3
  if bIPRemoteConnected then begin
    if not UseTCPIP then Exit;
    frmRterm.synIO.Clear;
    sToSend:= EmptyStr + #13#10;
    csRGeneral.Socket.SendText(sToSend);
    SetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmTinnMain.actRContClearConsoleExecute(Sender: TObject);
begin
  actRtermIOandLogClearExecute(nil);
end;

procedure TfrmTinnMain.actRContCloseAllGraphicsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= 'graphics.off()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContRemoveAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= 'rm(list=ls())';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContClearAllExecute(Sender: TObject);
var
  i: integer;

  sTmp,
   sToSend: string;

  seLog: TSynEdit;
  
begin
  if not ValidRRunning then Exit;
  sTmp:= 'rm(list=ls()); graphics.off()';
  DoSend(sTmp);
  // Rterm: priority 1
  if Rterm_Running then begin
    Sleep(2*iDelay);

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

    Exit;
  end;

  // Rgui: priority 2
  if Rgui_Running then begin
    sToSend:= '^l';
    fCodeSender.DoPrepare;
    fCodeSender.SendString(sToSend);
    CheckTop;
    SetFocus_Rgui(iDelay div 2);
    Exit;
  end;

  // R remote: priority 3
  if bIPRemoteConnected then begin
    if not UseTCPIP then Exit;
    with frmRterm.synIO do begin
      for i:= 0 to 9 do
        ClearBookMark(i);
      Clear;
    end;

    sToSend:= EmptyStr + #13#10;
    csRGeneral.Socket.SendText(sToSend);
    SetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmTinnMain.actRContEscapeExecute(Sender: TObject);
var
  sTmp: string;

begin
  stbMain.Panels[8].Text:= EmptyStr;
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;

  if not (Rgui_Running) then Exit;
  //if UseTCPIP then Exit;
  sTmp:= '{ESC}';
  fCodeSender.DoPrepare;
  fCodeSender.SendString(sTmp);
  CheckTop;
  SetFocus_Rgui(iDelay);
end;

procedure TfrmTinnMain.actRContHelpSelectedWordExecute(Sender: TObject);

  function GetWord: string;
  var
    sTmp: string;

  begin
    Result:= EmptyStr;
    if not ValidRRunning then Exit;
    sTmp:= FindWord;

    if (sTmp = EmptyStr) then begin
      MessageDlg('No valid word selected!',
                 mtInformation,
                 [mbOk],
                 0);
      Exit;
    end;
    Result:= 'help(' +
             sTmp +
             ')';
  end;

var
  sTmp: string;

begin
  sTmp:= GetWord;
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContExampleSelectedWordExecute(Sender: TObject);

  function GetWord: string;
  var
    sTmp: string;

  begin
    Result:= EmptyStr;
    if not ValidRRunning then Exit;
    sTmp:= FindWord;

    if (sTmp = EmptyStr) then begin
      MessageDlg('No valid word selected!',
                 mtInformation,
                 [mbOk],
                 0);
      Exit;
    end;

    Result:= 'example(' +
             sTmp +
             ')';
   end;

var
  sTmp: string;

begin
  sTmp:= GetWord;
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContHelpExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then Exit;
  sTmp:= 'help.start(update=FALSE)';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actREnvironmentRefreshExecute(Sender: TObject);

 procedure ReadTmpFile(sRFile: string);
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
  stbMain.Panels[8].Text:= EmptyStr;

  iFocus:= GetFocus;

  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;
  try
    sRFile:= sPathTmp + '\Search.txt';
    sTmp:= 'trObjSearch(' +
           'path=.trPaths[2]' +
           ')';

    // Rterm: priority 2.1
    if Rterm_Running then begin
      sToSend:= sTmp + #13#10;

      if (csREnvironment.Active) then csREnvironment.Socket.SendText(sToSend)
      else begin
        CheckRterm;
        frmRterm.cRterm.SendInput(sToSend);
        SendToConsole(sTmp);
      end;

    end
    else // Rgui: priority 2.2
      if Rgui_Running then begin
        sToSend:= sTmp;

        if (csREnvironment.Active) then csREnvironment.Socket.SendText(sToSend +
                                                                       #13#10)
                                   else fCodeSender.SendChar(sToSend,
                                                             hRgui);

        SetFocus_Rgui(iDelay div 4);
      end;

    i:= 0;
    repeat
      bFileExists:= False;
      Sleep(iDelay);
      if FileExists(sRFile) then begin
        bFileExists:= True;
        ReadTmpFile(sRFile);
      end;
      inc(i);
    until bFileExists or
          (i = 10);

    DeleteFile(sRFile);

    CheckTop;

    if Rgui_Running then SetFocus_Rgui(iDelay)
    else begin
      case iFocus of
         // synEditor1
         1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
              if CanFocus then SetFocus;
         // synEditor2
         2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
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

procedure TfrmTinnMain.actRExplorerRefreshExecute(Sender: TObject);
var
  i,
   iFocus: integer;

  bFileExists: boolean;

  sRFile,
   sTmp,
   sToSend,
   sGroup,
   sAllNames: string;

  procedure ReadTmpFile(resRFile: string);
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
          ReadTmpFile(sRFile);
        end;
        //strlFromRServer.Delete(0);
        MakeTreeRExplorer_TmpFile(strlFromR);
      except
       on EFOpenError do begin
         FreeAndNil(strlFromR);
         Sleep(iDelay);
         ReadTmpFile(sRFile);
       end;
      end;
    finally
      FreeAndNil(strlFromR);
    end;
 end;

begin
  iFocus:= GetFocus;

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

    sRFile:= sPathTmp + '\objects.txt';
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
             'path=.trPaths[3]' +
             sAllNames +
             ')';

    // Rterm: priority 2.1
    if Rterm_Running then begin
      sToSend:= sTmp + #13#10;

      if (csRExplorer.Active) then csRExplorer.Socket.SendText(sToSend)
      else begin
        CheckRterm;
        frmRterm.cRterm.SendInput(sToSend);
        SendToConsole(sTmp);
      end;
    end
    else // Rgui: priority 2.2
      if Rgui_Running then begin
        sToSend:= sTmp;

        if (csRExplorer.Active) then csRExplorer.Socket.SendText(sToSend +
                                                                 #13#10)
                                else fCodeSender.SendChar(sToSend,
                                                          hRgui);

        SetFocus_Rgui(iDelay div 4);
      end;

    i:= 0;
    repeat
      bFileExists:= False;
      Sleep(iDelay);
      if FileExists(sRFile) then begin
        bFileExists:= True;
        ReadTmpFile(sRFile);
      end;
      inc(i);
    until bFileExists or
          (i = 10);

    DeleteFile(sRFile);

    CheckTop;

    if Rgui_Running then SetFocus_Rgui(iDelay)
    else begin
      case iFocus of
         // synEditor1
         1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
              if CanFocus then SetFocus;
         // synEditor2
         2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
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

procedure TfrmTinnMain.actProjectReloadExecute(Sender: TObject);
begin
  CheckIfProjectWasChanged;
  Application.ProcessMessages;

  ToolsProjectControls(False);
  with frmTools.tvProject.Items do begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;
  if Assigned(slProjectChanges) then slProjectChanges.Clear;
  bProjectChanged:= False;

  ClearStatusBarProject;
  OpenFileIntoTinn(sProjectName);
end;

procedure TfrmTinnMain.actProjectEditExecute(Sender: TObject);
begin
  OpenFileIntoTinn(sProjectName,
                   0,
                   True);
end;

procedure TfrmTinnMain.BackupSystemConfiguration(bStarting: boolean);
var
  sBackup: string;

  sd: TSaveDialog;

begin
  sd:= TSaveDialog.Create(Self);

  with sd do begin
    InitialDir:= sWorkingDir;
    if not bStarting then FileName:= 'Tinn-R_' + GetBuildInfo + '_full_bkp'
                     else FileName:= 'Tinn-R_prior_to2_bkp';
    Filter    := 'Tinn backup (*.zip)|*.zip';
    DefaultExt:= '.zip';
  end;

  try
    if sd.Execute then begin
      if not bStarting then frmTinnMain.Refresh;
      sBackup:= sd.FileName;
      if FileExists(sBackup) then begin
        if (MessageDlg(sBackup + #13 + #13 +
                       'Do you want to overwrite this file?',
                       mtConfirmation,
                       [mbYes, mbCancel],
                       0) <> idYes) then Exit;
        DeleteFile(sBackup);
      end;

      try
        if not bStarting then begin
          WriteIniFile_Application(True);
          WriteIniFile_Editor(True);
        end;

        with zipKit do begin
          StoreOptions:= [soRecurse];  // soRecurse: will include all files of all folders and sub-folders
          FileName:= sBackup;
          BaseDirectory:= sPathIni;
          AddFiles('*.*',
                   faAnyFile);
          Save;
        end;

        if not bStarting then
          MessageDlg(sBackup + #13 + #13 +
                     'The backup of Tinn-R INI was done' + #13 +
                     'successfully in the file above!',
                     mtInformation,
                     [mbOk],
                     0)
        else
          MessageDlg(sBackup + #13 + #13 +
                     'The backup of old Tinn-R INI was done' + #13 +
                     'successfully in the file above!',
                     mtInformation,
                     [mbOk],
                     0);
      except
        if not bStarting then
          MessageDlg(sBackup + #13 + #13 +
                     'The path above is no allowed for your system previleges.' + #13 +
                     'It is not possible to make a backup of the Tinn-R INI!',
                     mtError,
                     [mbOk],
                     0)
        else
          MessageDlg(sBackup + #13 + #13 +
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

procedure TfrmTinnMain.actBackupSystemConfigurationExecute(Sender: TObject);
begin
  BackupSystemConfiguration(False);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actBackupDatabaseExecute(Sender: TObject);
var
  sBackup: string;

  sd: TSaveDialog;

begin
  sd           := TSaveDialog.Create(Self);
  sd.InitialDir:= sWorkingDir;
  sd.FileName  := 'Tinn-R_' + GetBuildInfo + '_database_bkp';
  sd.Filter    := 'Tinn backup (*.zip)|*.zip';
  sd.DefaultExt:= '.zip';

  try
    if sd.Execute then begin
      frmTinnMain.Refresh;
      sBackup:= sd.FileName;

      if FileExists(sBackup) then begin
        if (MessageDlg(sBackup + #13 + #13 +
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
            AddFiles(sPathData + '\*.*',
                     0);
            CloseArchive;
          end;
        end;
        MessageDlg(sBackup + #13 + #13 +
                   'The backup of DATABASE was done' + #13 +
                   'successfully in the path above!',
                   mtInformation,
                   [mbOk],
                   0);
      except
        MessageDlg(sBackup + #13 + #13 +
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
    SetFocus_Main;
  end;
end;

procedure TfrmTinnMain.actRestoreSystemConfigurationExecute(Sender: TObject);
var
  bRestart: boolean;

  cTinnR: PChar;

  i,
   j: integer;

  od: TOpenDialog;

  sBackup,
   sTmp   : string;

begin
  od           := TOpenDialog.Create(Self);
  od.InitialDir:= sWorkingDir;
  od.FileName  := EmptyStr;
  od.Filter    := 'Tinn backup (*.zip)|*.zip';
  try
    if od.Execute then begin
      frmTinnMain.Refresh;
      sBackup:= od.FileName;

      if FileExists(sBackup) then begin
        zipKit.FileName:= sBackup;

        j:= 0;
        for i:=0 to (zipKit.Count - 1) do begin
          sTmp:= zipKit.Items[i].FileName;
          if (pos('Tinn.ini',
                  sTmp) > 0) or
             (pos('Editor.ini',
                  sTmp) > 0) then inc(j);
        end;

        if (j < 2) then begin
          MessageDlg(sBackup + #13 + #13 +
                     'Restore of Tinn-R INI' + #13 +
                     'The file above isn''t a valid backup of the Tinn-R!' + #13 +
                     'Please, try another file.',
                     mtWarning,
                     [mbOk],
                     0);
          Exit;
        end;

        stbMain.Panels[7].Text:= 'Please, wait...';
        stbMain.Panels[8].Text:= 'Restoring ' + sBackup;
        Application.ProcessMessages;

        try
          //DeleteDir(sPathIni); // Will remove all ini files and subfolders
          DeleteFilesOfPath(sPathIni);
          DeleteFilesOfPath(sPathApp);
          DeleteFilesOfPath(sPathBkp);
          DeleteFilesOfPath(sPathColor);
          DeleteFilesOfPath(sPathData);
          DeleteFilesOfPath(sPathEditor);
          DeleteFilesOfPath(sPathLatex);
          DeleteFilesOfPath(sPathProject);
          DeleteFilesOfPath(sPathSyntax);
          DeleteFilesOfPath(sPathSyntaxBKP);
          DeleteFilesOfPath(sPathTmp);

          with zipKit do begin
            ExtractOptions:= [eoRestorePath];
            BaseDirectory:= sPathIni;
            ExtractFiles('*.*');
            CloseArchive;
            bRestart:= True;
          end;

          if bRestart then begin
          bRestored:= True;  // Will be used in OnCloseQuery event

          with ModDados do
            DataModuleCreate(nil);
            if (MessageDlg('The full Tinn-R INI was successfully restored.' + #13 +
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
        MessageDlg(ExtractFilePath(sBackup) + #13 + #13 +
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
    stbMain.Panels[7].Text:= '';
    stbMain.Panels[8].Text:= '';
  end;
end;

procedure TfrmTinnMain.actRestoreDatabaseExecute(Sender: TObject);
var
  i,
   j: integer;

  od: TOpenDialog;

  sBackup,
   sTmp  : string;

begin
  try
    od           := TOpenDialog.Create(Self);
    od.InitialDir:= sWorkingDir;
    od.FileName  := EmptyStr;
    od.Filter    := 'Tinn backup (*.zip)|*.zip';

    if od.Execute then begin
      frmTinnMain.Refresh;
      sBackup:= od.FileName;

      if FileExists(sBackup) then begin
        zipKit.FileName:= sBackup;

        j:= 0;
        for i:= 0 to (zipKit.Count - 1) do begin
          sTmp:= zipKit.Items[i].FileName;
          if (pos('Cache.xml',
                  sTmp) > 0)  or
             (pos('Comments.xml',
                  sTmp) > 0) or
             (pos('Completion.xml',
                  sTmp) > 0) or
             (pos('Rcard.xml',
                  sTmp) > 0) or
             (pos('Rmirrors.xml',
                  sTmp) > 0) or
             (pos('Shortcuts.xml',
                  sTmp) > 0) then inc(j);
        end;

        if (j < 6) then begin
          MessageDlg(sBackup + #13 + #13 +
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
        DeleteDir(sPathData);
        CreateDir(sPathData);

        zipKit.ExtractOptions:= [];
        with zipKit do begin
          BaseDirectory:= sPathData + '\';
          ExtractFiles('*.*');
        end;
        zipKit.CloseArchive;

        bDatabaseRestored:= True;
        with ModDados do
          DataModuleCreate(nil);
        MessageDlg('The DATABASE was successfully restored.' + #13 + #13 +
                   'You can continue your work normally!',
                   mtInformation,
                   [mbOk],
                   0);
      end
      else
        MessageDlg(ExtractFilePath(sBackup) + #13 + #13 +
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

procedure TfrmTinnMain.actMacroRecordExecute(Sender: TObject);
var
  i: integer;
  
begin
  synMR.Editor:= frmRterm.synIO;
  i:= FindTopWindow;
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

procedure TfrmTinnMain.actMacroPlayExecute(Sender: TObject);
begin
  synMR.PlaybackMacro(synMR.Editor);
end;

procedure TfrmTinnMain.actAsciiChartExecute(Sender: TObject);
var
  dlgAscii: TfrmAsciiChart;

begin
  dlgAscii:= TfrmAsciiChart.Create(Self);
  dlgAscii.Show;
end;

procedure TfrmTinnMain.actAutoCompletionExecute(Sender: TObject);
begin
  actAutoCompletion.Checked:= not actAutoCompletion.Checked;
end;

procedure TfrmTinnMain.actDifferencesExecute(Sender: TObject);
begin
  if (frmDiffMain = nil) then Application.CreateForm(TfrmDiffMain,
                                                     frmDiffMain);
  frmDiffMain.Show;
end;

procedure TfrmTinnMain.actTobMacroVisibleExecute(Sender: TObject);
begin
  tobMacro.Visible:= not(tobMacro.Visible);
  menViewToolbarsMacro.Checked := tobMacro.Visible;
  pmenViewToolbarsMacro.Checked:= tobMacro.Visible;
end;

procedure TfrmTinnMain.actTobSpellVisibleExecute(Sender: TObject);
begin
  tobSpell.Visible:= not(tobSpell.Visible);
  menViewToolbarsSpell.Checked := tobSpell.Visible;
  pmenViewToolbarsSpell.Checked:= tobSpell.Visible;
end;

procedure TfrmTinnMain.actTobProcessingVisibleExecute(Sender: TObject);
begin
  tobProcessing.Visible:= not(tobProcessing.Visible);
  menViewToolbarsProcessing.Checked := tobProcessing.Visible;
  pmenViewToolbarsProcessing.Checked:= tobProcessing.Visible;
end;

procedure TfrmTinnMain.actTobFormatVisibleExecute(Sender: TObject);
begin
  tobFormat.Visible:= not(tobFormat.Visible);
  menViewToolbarsFormat.Checked := tobFormat.Visible;
  pmenViewToolbarsFormat.Checked:= tobFormat.Visible;
end;

procedure TfrmTinnMain.CheckProcessingPath(sPath: string);
begin
  if (sPath = EmptyStr) then begin
    if (MessageDlg('The path of interpreter, conversor or viewer was not defined.' + #13 +
                   'Do you desire to do this now?',
                   mtConfirmation,
                   [mbYes, mbNo],
                   0) = mrYes) then begin

      bStartOptionsWithProcessingPage:= True;
      actShowAppOptionsExecute(Self);
      frmTinnMain.Refresh;
    end
    else Exit;
  end;
end;

procedure TfrmTinnMain.FileConversion(sParameter,
                                      sExtension,
                                      sPathConversor: string;
                                      sPathInterpreter: string = '';
                                      bWait: boolean = True);

  procedure CopyFile(const sourcefilename,
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
   sNewFile  : string;

  i: integer;

 procedure LatexToSweave;
 begin
   sNewFile  := ChangeFileExt(sTmpFile,
                              '.rnw');
   sLatexFile:= ChangeFileExt(sTmpFile,
                              '.tex');

   if FileExists(sLatexFile) then begin
     CopyFile(sLatexFile,
              sNewFile);
     DeleteFile(sLatexFile);
   end;
 end;

begin
  i:= FindTopWindow;
  sTmpFile:= (Self.MDIChildren[i] as TfrmEditor).sActiveFile;

  oldCursor:= (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= crHourGlass;
  actFileSaveExecute(Self);

  CheckProcessingPath(sPathInterpreter);
  CheckProcessingPath(sPathConversor);

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
      if ExecCmdLineAndWait(sTmpPar,
                            SW_HIDE) then begin
        if (sExtension = '.rnw') then LatexToSweave
                                 else sNewFile:= ChangeFileExt(sTmpFile,
                                                               sExtension);
        UpdateFileIntoTinn(sNewFile);
      end
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        MessageDlg(sTmpPar + #13 + #13 +
                   'Sorry, it wasn''t possible to do the conversion!',
                   mtError,
                   [mbOK],
                   0);
      end;
    end
    else begin
      if OpenCmdLine(sTmpPar,
                     SW_HIDE) then begin
        if (sExtension = '.rnw') then LatexToSweave
      end
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        MessageDlg(sTmpPar + #13 + #13 +
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

procedure TfrmTinnMain.PandocConversion(sPandocInstruction,
                                        sPandocFrom,
                                        sPandocTo: string;
                                        bWait: boolean = True);
var
  oldCursor: TCursor;

  i: integer;

begin
  i:= FindTopWindow;
  oldCursor:= (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= crHourGlass;
  actFileSaveExecute(Self);

  CheckProcessingPath(sPath_Pandoc);

  sPandocInstruction:= StringReplace(sPandocInstruction,
                                     'pandoc',
                                     sPath_Pandoc,
                                     []);
  try
    if bWait then
      if ExecCmdLineAndWait(sPandocInstruction,
                            SW_HIDE) then UpdateFileIntoTinn(sPandocTo)
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        MessageDlg(sPandocInstruction + #13 + #13 +
                   'Sorry, it wasn''t possible to do the conversion!',
                   mtError,
                   [mbOk],
                   0);
      end
    else begin
      if OpenCmdLine(sPandocInstruction,
                     SW_HIDE) then
      else begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
        MessageDlg(sPandocInstruction + #13 + #13 +
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

procedure TfrmTinnMain.actDeplateToLaTeXDramatistExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' latex-dramatist',
                 '.tex',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToLaTeXExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' latex',
                 '.tex',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToPhpExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' php',
                 '.php',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToPlainExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' plain',
                 '.text',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToLatexExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' tex',
                 '.tex',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToLoutExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' lout',
                 '.lout',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToManExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' man',
                 '.man',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToMgpExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' mgp',
                 '.mgp',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToMoinExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' moin',
                 '.moin',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToPm6Execute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' pm6',
                 '.pm6',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToSweaveExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' latex',
                 '.rnw',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToXhtmlMathMlExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' xhtml11m',
                 '.xhtml',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToXhtmlTransitionalExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' xhtml10t',
                 '.xhtml',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToSgmlExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' sgml',
                 '.sgml',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.actTxt2tagsToSweaveExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' tex',
                 '.rnw',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToTxtExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' txt',
                 '.txt',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToWikiExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' wiki',
                 '.wiki',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToXhtmlExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' xhtml',
                 '.xhtml',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.actDeplateToDocbookArticleExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' dbk-article',
                 '.xml',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToDocbookBookExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' dbk-book',
                 '.xml',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToDocbookReferenceExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' dbk-ref',
                 '.xml',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToHtmlExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' html',
                 '.html',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.actDeplateToHtmlSiteExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' htmlsite',
                 '.html',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter,
                 False);
end;

procedure TfrmTinnMain.actDeplateToHtmlSlidesExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' htmlslides',
                 '.html',
                 sPathDeplate_Converter,
                 sPathDeplate_Interpreter,
                 False);
end;

procedure TfrmTinnMain.actTxt2tagsToDokuExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' doku',
                 '.doku',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToGwikiExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' gwiki',
                 '.gwiki',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToHtmlExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' html',
                 '.html',
                 sPathTxt2tags_Converter,
                 sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.CompileLaTeX(sMikPar,
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

  procedure CloseCompileLaTeX;
  begin
    (Self.MDIChildren[FindTopWindow] as TfrmEditor).Cursor:= oldCursor;
    MessageDlg('Sorry, it wasn''t possible to do the compilation!',
               mtInformation,
               [mbOk],
               0);
    Abort;
  end;

  procedure ProblemOpeningCompiled;
  begin
    MessageDlg('Sorry, it wasn''t possible to open the file: ' + sTmpDir + sTmpFile + #13 + #13 +
               'The instruction sent to the OS was: ' + sTmpParameter,
               mtInformation,
               [mbOk],
               0);
    Abort;
  end;

  procedure CheckViewer(sTmp1,
                        sTmp2: string;
                        actTmp:TAction);
  begin
    if (sTmp1 = sTmp2) and
       actTMp.Checked then begin          // Avoid multiple instance of viewer and break compiling Pdf files
      tmpHandle:= GetWindowHandle(Pchar(ChangeFileExt(sTmpFile,
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
  i:= FindTopWindow;
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

    CheckViewer(sExtension,
                '.dvi',
                actCloseDVIViewer);

    CheckViewer(sExtension,
                '.pdf',
                actClosePDFViewer);

    if bWait then begin
      if (sBibPar <> 'N') then begin
        sBibParameter:= sBibPar + ' ' + RemoveFileExtension(sTmpFile);
        // The three steps below are necessary to incorporate the complete citations from bibtex resource

        if ExecCmdLineAndWait(sMikParameter,
                              wOption) then
        else CloseCompileLaTeX;

        if ExecCmdLineAndWait(sBibParameter,
                              wOption) then
        else CloseCompileLaTeX;

        if ExecCmdLineAndWait(sMikParameter,
                              wOption) then
        else CloseCompileLaTeX;
      end;

      if ExecCmdLineAndWait(sMikParameter,
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
      else CloseCompileLaTeX;
    end
    else begin
      if OpenCmdLine(sMikParameter,
                      wOption) then // Nothing to do
      else ProblemOpeningCompiled;
    end;
  except
  // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
end;

procedure TfrmTinnMain.menToolsDatabaseShortcutsClick(Sender: TObject);
begin
  actShortcutsEditExecute(nil);
end;

procedure TfrmTinnMain.menToolsConversionPandocClick(Sender: TObject);
var
  dlg: TfrmPandoc;

begin
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
        PandocConversion(sPandocInstruction,
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

procedure TfrmTinnMain.menToolsDatabaseCommentsClick(Sender: TObject);
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
      frmTinnMain.Refresh;
      FreeAndNil(frmComments);
    end;

  with modDados.cdComments do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmTinnMain.menToolsDatabaseCompletionClick(Sender: TObject);
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
      frmTinnMain.Refresh;
      FreeAndNil(frmCompletion);
    end;

  with modDados.cdCompletion do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmTinnMain.menToolsDatabaseCardRClick(Sender: TObject);
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
      frmTinnMain.Refresh;
      FreeAndNil(frmRcard);
    end;

  with modDados.cdRcard do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmTinnMain.menToolsDatabaseMirrorsRClick(Sender: TObject);
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
      frmTinnMain.Refresh;
      FreeAndNil(frmRmirrors);
    end;

  with modDados.cdRmirrors do begin
    if BookmarkValid(pTmp) then GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmTinnMain.actLatexToDviSingleExecute(Sender: TObject);
begin
  CompileLaTeX(sParDviSingle,
               'N',
               '.dvi',
               actDviOpenAlways.Checked);
end;

procedure TfrmTinnMain.actLatexToDviBibtexExecute(Sender: TObject);
begin
  CompileLaTeX(sParDviSingle,
               sParDviBibtex,
               '.dvi',
               actDviOpenAlways.Checked);
end;

procedure TfrmTinnMain.actLatexToPdfSingleExecute(Sender: TObject);
begin
  CompileLaTeX(sParPdfSingle,
               'N',
               '.pdf',
               actPdfOpenAlways.Checked)
end;

procedure TfrmTinnMain.actLatexToPdfBibtexExecute(Sender: TObject);
begin
  CompileLaTeX(sParPdfSingle,
               sParPdfBibtex,
               '.pdf',
               actPdfOpenAlways.Checked)
end;

// Reload file from disk
procedure TfrmTinnMain.actReloadExecute(Sender: TObject);
var
  bcPos: TBufferCoord;

  i,
   iResp,
   iTopLine: integer;

begin
  // Check for modification
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor).synEditor.Modified) then begin
    iResp:= MessageDlg((Self.MDIChildren[i] as TfrmEditor).sActiveFile + #13 + #13 +
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
    if Assigned(fNotif) then NotifyFile_Stop;

    synEditor.BeginUpdate;
    iTopLine:= synEditor.TopLine;
    bcPos:= synEditor.CaretXY;

    //synEditor.Lines.LoadFromFile(sActiveFile);
    seeEncoding:= LoadFromFile(synEditor.Lines,
                           sActiveFile,
                           GetEncoding(sActiveFile,
                                       bbBOM),
                           bbBOM);

    GetFile_Info(sActiveFile,
                 synEditor.Lines);

    synEditor.Modified:= False;
    SetFileSize_StatusBar(sActiveFile);
    CheckSaveStatus;
    SetTitle;

    synEditor.ExecuteCommand(ecGotoXY,
                             'A',
                             @bcPos);
    synEditor.TopLine:= iTopLine;
    synEditor.EndUpdate;

    // File notify: Start
    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= FileChanged;
    NotifyFile_Start(sActiveFile);

    stbMain.Panels[7].Text:= 'Reloaded file';
    stbMain.Panels[8].Text:= sActiveFile;
  end;

  UpdateHexViewer;
end;

(*
// It is not working nice for PDF under Windows 7 -> replaced for the below
procedure TfrmTinnMain.OpenFileWithViewer(sFilter, sDefaultExt, sPathViewer: string);
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
      frmTinnMain.Refresh;
      sFile:= od.FileName;
      if FileExists(sFile) then begin
        try
          CheckProcessingPath(sPathViewer);
          if (ExtractFileExt(sFile)= '.pdf') then begin
            sParameter:= sPathViewer + ' ' + sFile;
            OpenCmdLine(sParameter, SW_SHOWNORMAL);
          end
          else begin
            sParameter:= sPathViewer + ' --single-instance ' + sFile;
            OpenCmdLine(sParameter, SW_HIDE);
          end;
        except
          MessageDlg(sFile + #13 + #13 +
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

procedure TfrmTinnMain.OpenFileWithViewer(sFilter,
                                          sDefaultExt: string);
var
  od   : TOpenDialog;
  sFile: string;

begin
  od           := TOpenDialog.Create(Self);
  od.InitialDir:= sWorkingDir;
  od.FileName  := EmptyStr;
  od.Filter    := sFilter;
  od.DefaultExt:= sDefaultExt;
  try
    if od.Execute then begin
      frmTinnMain.Refresh;
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
          MessageDlg(sFile + #13 + #13 +
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

procedure TfrmTinnMain.actDviOpenFileExecute(Sender: TObject);
begin
  OpenFileWithViewer('Dvi (*.dvi)|*.dvi',
                     '.dvi');
end;

procedure TfrmTinnMain.actPdfOpenFileExecute(Sender: TObject);
begin
  OpenFileWithViewer('Pdf (*.pdf)|*.pdf',
                     '.pdf');
end;

procedure TfrmTinnMain.actHtmlOpenFileExecute(Sender: TObject);
begin
  OpenFileWithViewer('Html (*.html, *.htm)|*.html; *.htm',
                     '.html; .htm')
end;

procedure TfrmTinnMain.actHtmlOpenCurrentFileExecute(Sender: TObject);
var
  sFile: string;
  i    : integer;

begin
  i:= FindTopWindow;

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
    MessageDlg('Browser is not accessible!',
               mtInformation,
               [mbOk],
               0);
  end;
end;

procedure TfrmTinnMain.actDviOpenAlwaysExecute(Sender: TObject);
begin
  actDviOpenAlways.Checked:= not actDviOpenAlways.Checked;
end;

procedure TfrmTinnMain.actPdfOpenAlwaysExecute(Sender: TObject);
begin
  actPdfOpenAlways.Checked:= not actPdfOpenAlways.Checked;
end;

procedure TfrmTinnMain.actHexViewerVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsHexViewer do begin
    TabVisible:= not TabVisible;
    actHexViewerVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actHtmlOpenAlwaysExecute(Sender: TObject);
begin
  actHtmlOpenAlways.Checked:= not actHtmlOpenAlways.Checked;
end;

procedure TfrmTinnMain.SetToolbarProcessing(sFileExtension: string);

  function MatchExtension(sTmp: string;
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

  procedure SetBrowser(bTmp: boolean);
  begin
    actHtmlOpenCurrentFile.Enabled:= bTmp;
  end;

  procedure SetDeplate (bTmp: boolean);
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

  procedure SetMarkdown(bTmp: boolean);
  begin
    // TODO
  end;

  procedure SetTxt2tags(bTmp: boolean);
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

  procedure SetTex(bTmp: boolean);
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
  if (MatchExtension(sExt,
                     aBrowser)) then SetBrowser(True)
                                else SetBrowser(False);

  // Deplate
  if (MatchExtension(sExt, aDeplate)) then SetDeplate(True)
                                      else SetDeplate(False);
  //SetDeplate(True);   // any file extension

  // Txt2tags
  if (MatchExtension(sExt, aTxt2tags)) then SetTxt2tags(True)
                                       else SetTxt2tags(False);
  //SetTxt2tags(True);  // any file extension

  // MikTeX
  if (sExt = '.tex') then SetTex(True)
                     else SetTex(False);
end;

procedure TfrmTinnMain.menHelFileConversionDeplateClick(Sender: TObject);
begin
  OpenHelpFile('\sample\deplate.dplt');
end;

procedure TfrmTinnMain.menHelFileConversionPandocClick(Sender: TObject);
begin
  OpenHelpFile('\sample\pandoc.markdown');
end;

procedure TfrmTinnMain.menHelFileConversionTxt2tagsClick(Sender: TObject);
begin
  OpenHelpFile('\sample\txt2tags.t2t');
end;

procedure TfrmTinnMain.menWebtProcessingMikTeXClick(Sender: TObject);
begin
  OpenUrl('miktex.org/');
end;

procedure TfrmTinnMain.menWebtProcessingPandocClick(Sender: TObject);
begin
  OpenUrl('http://johnmacfarlane.net/pandoc/');
end;

procedure TfrmTinnMain.menWebtProcessingDeplateClick(Sender: TObject);
begin
  OpenUrl('deplate.sourceforge.net/index.php');
end;

procedure TfrmTinnMain.menWebtProcessingTxt2tagsClick(Sender: TObject);
begin
  OpenUrl('txt2tags.sourceforge.net');
end;

procedure TfrmTinnMain.actDosMinimizedAlwaysExecute(Sender: TObject);
begin
  actDosMinimizedAlways.Checked:= not actDosMinimizedAlways.Checked;
end;

procedure TfrmTinnMain.pmenResultsOpenLinkMeasureItem(Sender: TObject;
                                                      ACanvas: TCanvas;
                                                      var Width,
                                                          Height: Integer);
begin
  with frmTools.tvSearch do
    if (Selected = nil) or
       (Selected.Level < 2) then pmenResultsOpenLink.Enabled:= False
                            else pmenResultsOpenLink.Enabled:= True;
end;

procedure TfrmTinnMain.pmemRResSendSourceFileClick(Sender: TObject);
begin
  with actRSendSourceFile do
    Visible:= not Visible;
  pmemRResSendSourceFile.Checked:= actRSendSourceFile.Visible;
end;

procedure TfrmTinnMain.pmemRResSendFileClick(Sender: TObject);
begin
  with actRSendFile do
    Visible:= not Visible;
  pmemRResSendFile.Checked:= actRSendFile.Visible;
end;

procedure TfrmTinnMain.pmemRResSendSourceSelectionClick(Sender: TObject);
begin
  with actRSendSourceSelection do
    Visible:= not Visible;
  pmemRResSendSourceSelection.Checked:= actRSendSourceSelection.Visible;
end;

procedure TfrmTinnMain.pmemRResSendSelectionClick(Sender: TObject);
begin
  with actRSendSelection do
    Visible:= not Visible;
  pmemRResSendSelection.Checked:= actRSendSelection.Visible;
end;

procedure TfrmTinnMain.pmemRResSendSourceClipboardClick(Sender: TObject);
begin
  with actRSendSourceClipboard do
    Visible:= not Visible;
  pmemRResSendSourceClipboard.Checked:= actRSendSourceClipboard.Visible;
end;

procedure TfrmTinnMain.pmemRResSendClipboardClick(Sender: TObject);
begin
  with actRSendClipboard do
    Visible:= not Visible;
  pmemRResSendClipboard.Checked:= actRSendClipboard.Visible;
end;

procedure TfrmTinnMain.pmemRResSendSourceBlockMarkedClick(Sender: TObject);
begin
  with actRSendSourceBlockMarked do
    Visible:= not Visible;
  pmemRResSendSourceBlockMarked.Checked:= actRSendSourceBlockMarked.Visible;
end;

procedure TfrmTinnMain.pmemRResCurrentLineToTopClick(Sender: TObject);
begin
  with actRCurrentLineToTop do
    Visible:= not Visible;
  pmemRResCurrentLineToTop.Checked:= actRCurrentLineToTop.Visible;
end;

procedure TfrmTinnMain.pmemRResSendBlockMarkedClick(Sender: TObject);
begin
  with actRSendBlockMarked do
    Visible:= not Visible;
  pmemRResSendBlockMarked.Checked:= actRSendBlockMarked.Visible;
end;

procedure TfrmTinnMain.pmemRResSendSourceContiguousClick(Sender: TObject);
begin
  with actRSendSourceContiguous do
    Visible:= not Visible;
  pmemRResSendSourceContiguous.Checked:= actRSendSourceContiguous.Visible;
end;

procedure TfrmTinnMain.pmemRResSendContiguousClick(Sender: TObject);
begin
  with actRSendContiguous do
    Visible:= not Visible;
  pmemRResSendContiguous.Checked:= actRSendContiguous.Visible;
end;

procedure TfrmTinnMain.pmemRResSendLineClick(Sender: TObject);
begin
  with actRSendLine do
    Visible:= not Visible;
  pmemRResSendLine.Checked:= actRSendLine.Visible;
end;

procedure TfrmTinnMain.pmemRResSendLinesToEndPageClick(Sender: TObject);
begin
  with actRSendLinesToEndPage do
    Visible:= not Visible;
  pmemRResSendLinesToEndPage.Checked:= actRSendLinesToEndPage.Visible;
end;

procedure TfrmTinnMain.pmemRResSendCursorToBeginningLineClick(Sender: TObject);
begin
  with actRSendCursorToBeginningLine do
    Visible:= not Visible;
  pmemRResSendCursorToBeginningLine.Checked:= actRSendCursorToBeginningLine.Visible;
end;

procedure TfrmTinnMain.pmemRResSendCursorToEndLineClick(Sender: TObject);
begin
  with actRSendCursorToEndLine do
    Visible:= not Visible;
  pmemRResSendCursorToEndLine.Checked:= actRSendCursorToEndLine.Visible;
end;

procedure TfrmTinnMain.pmemRResSendSweaveClick(Sender: TObject);
begin
  with actRSendSweave do
    Visible:= not Visible;
  pmemRResSendSweave.Checked:= actRSendSweave.Visible;
end;

procedure TfrmTinnMain.pmemRResSendKnitrClick(Sender: TObject);
begin
  with tbKnitr do
    Visible:= not Visible;
  pmemRResSendKnitr.Checked:= tbKnitr.Visible;
  bRKnitr:= tbKnitr.Visible;
end;

procedure TfrmTinnMain.pmenRResContSetWorkDirectoryClick(Sender: TObject);
begin
  with actRContSetWorkDirectory do
    Visible:= not Visible;
  pmenRResContSetWorkDirectory.Checked:= actRContSetWorkDirectory.Visible;
end;

procedure TfrmTinnMain.pmenRResContListAllObjectsClick(Sender: TObject);
begin
  with actRContListAllObjects do
    Visible:= not Visible;
  pmenRResContListAllObjects.Checked:= actRContListAllObjects.Visible;
end;

procedure TfrmTinnMain.pmenRResContPrintVariableContentClick(Sender: TObject);
begin
  with actRContPrintVariableContent do
    Visible:= not Visible;
  pmenRResContPrintVariableContent.Checked:= actRContPrintVariableContent.Visible;
end;

procedure TfrmTinnMain.pmenRResContPlotVariableClick(Sender: TObject);
begin
  with actRContPlotVariable do
    Visible:= not Visible;
  pmenRResContPlotVariable.Checked:= actRContPlotVariable.Visible;
end;

procedure TfrmTinnMain.pmenRResContListVariableNamesClick(Sender: TObject);
begin
  with actRContListVariableNames do
    Visible:= not Visible;
  pmenRResContListVariableNames.Checked:= actRContListVariableNames.Visible;
end;

procedure TfrmTinnMain.pmenRResContListVariableStructureClick(Sender: TObject);
begin
  with actRContListVariableStructure do
    Visible:= not Visible;
  pmenRResContListVariableStructure.Checked:= actRContListVariableStructure.Visible;
end;

procedure TfrmTinnMain.pmenRResContEditVariableClick(Sender: TObject);
begin
  with actRContEditVariable do
    Visible:= not Visible;
  pmenRResContEditVariable.Checked:= actRContEditVariable.Visible;
end;

procedure TfrmTinnMain.pmenRResContFixVariableClick(Sender: TObject);
begin
  with actRContFixVariable do
    Visible:= not Visible;
  pmenRResContFixVariable.Checked:= actRContFixVariable.Visible;
end;

procedure TfrmTinnMain.pmenRResContClearConsoleClick(Sender: TObject);
begin
  with actRContClearConsole do
    Visible:= not Visible;
  pmenRResContClearConsole.Checked:= actRContClearConsole.Visible;
end;

procedure TfrmTinnMain.pmenRResContCloseAllGraphicsClick(Sender: TObject);
begin
  with actRContCloseAllGraphics do
    Visible:= not Visible;
  pmenRResContCloseAllGraphics.Checked:= actRContCloseAllGraphics.Visible;
end;

procedure TfrmTinnMain.pmenRResContRemoveAllObjectsClick(Sender: TObject);
begin
  with actRContRemoveAllObjects do
    Visible:= not Visible;
  pmenRResContRemoveAllObjects.Checked:= actRContRemoveAllObjects.Visible;
end;

procedure TfrmTinnMain.pmenRResContClearAllClick(Sender: TObject);
begin
  with actRContClearAll do
    Visible:= not Visible;
  pmenRResContClearAll.Checked:= actRContClearAll.Visible;
end;

procedure TfrmTinnMain.pmenRResContEscapeClick(Sender: TObject);
begin
  with actRContEscape do
    Visible:= not Visible;
  pmenRResContEscape.Checked:= actRContEscape.Visible;
end;

procedure TfrmTinnMain.pmenRResContHelpSelectedWordClick(Sender: TObject);
begin
  with actRContHelpSelectedWord do
    Visible:= not Visible;
  pmenRResContHelpSelectedWord.Checked:= actRContHelpSelectedWord.Visible;
end;

procedure TfrmTinnMain.pmenRResContExampleSelectedWordClick(Sender: TObject);
begin
  with actRContExampleSelectedWord do
    Visible:= not Visible;
  pmenRResContExampleSelectedWord.Checked:= actRContExampleSelectedWord.Visible;
end;

procedure TfrmTinnMain.pmenRResContHelpClick(Sender: TObject);
begin
  with actRContHelp do
    Visible:= not Visible;
  pmenRResContHelp.Checked:= actRContHelp.Visible;
end;

procedure TfrmTinnMain.pmenRResContGuiStartCloseClick(Sender: TObject);
begin
  with actRContGuiStartClose do
    Visible:= not Visible;
  pmenRResContGuiStartClose.Checked:= actRContGuiStartClose.Visible;
end;

procedure TfrmTinnMain.pmenRResContTermStartCloseClick(Sender: TObject);
begin
  with actRContTermStartClose do
    Visible:= not Visible;
  pmenRResContTermStartClose.Checked:= actRContTermStartClose.Visible;
end;

procedure TfrmTinnMain.pmenRResContPackagesClick(Sender: TObject);
begin
  with actRContPackages do
    Visible:= not Visible;
  pmenRResContPackages.Checked:= actRContPackages.Visible;
end;

procedure TfrmTinnMain.pmenRResContTCPConnectionClick(Sender: TObject);
begin
  with actRContTCPConnection do
    Visible:= not Visible;
  pmenRResContTCPConnection.Checked:= actRContTCPConnection.Visible;
end;

procedure TfrmTinnMain.UpdateFile(var seEditor: TSynEdit;
                                  var smOption: TSynSelectionMode);
var
  bcPos: TBufferCoord;
  iLine: integer;
  pMemo: Tpoint;

begin
  if (pgFiles.PageCount < 1) or
     not SavePriorClipboardText then begin
    seEditor.SelectionMode:= smOption;
    MessageDlg('No memory available.' + #13 +
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
  RestorePriorClipboardText;
end;

procedure TfrmTinnMain.actSpellExecute(Sender: TObject);
var
  seEditor: TSynEdit;
  smOption: TSynSelectionMode;

begin
  if not actToolsVisible.Checked then actToolsVisibleExecute(nil);
  if not actSpellVisible.Checked then actSpellVisibleExecute(nil);
  frmTools.pgTools.ActivePage:= frmTools.tbsSpell;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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
  UpdateFile(seEditor,
             smOption);
end;

procedure TfrmTinnMain.pmemSpellCutClick(Sender: TObject);
begin
  frmTools.memSpell.CutToClipboard;
end;

procedure TfrmTinnMain.pmemSpellCopyClick(Sender: TObject);
begin
  frmTools.memSpell.CopyToClipboard;
end;

procedure TfrmTinnMain.pmemSpellPasteClick(Sender: TObject);
begin
  frmTools.memSpell.PasteFromClipboard;
end;

procedure TfrmTinnMain.pmemSpellDeleteClick(Sender: TObject);
begin
  frmTools.memSpell.ClearSelection;
end;

procedure TfrmTinnMain.pmemSpellSelectAllClick(Sender: TObject);
begin
  frmTools.memSpell.SelectAll;
end;

procedure TfrmTinnMain.pmemSpellClearAllClick(Sender: TObject);
begin
  frmTools.memSpell.Clear;
end;

procedure TfrmTinnMain.TabMenuPopup(pcTmp: TPageControl;
                                    X,
                                    Y: Integer);
var
  hi: TTCHitTestInfo;
  p : TPoint;

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

procedure TfrmTinnMain.actAplicationExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTinnMain.actShortcutsCustomizationSaveExecute(Sender: TObject);
begin
  //
end;

procedure TfrmTinnMain.actShortcutsEditExecute(Sender: TObject);
var
  pTmp: pointer;
  n   : integer;

  sShortcuts: array of string;
  
  procedure RemoveShortcuts;
  var
    i: integer;
    
  begin
    // Reset all shortcuts
    with frmTinnMain.alMain do begin
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
      RemoveShortcuts;
      ShowModal;
      with modDados.cdShortcuts do begin
        if BookmarkValid(pTmp) then GoToBookmark(pTmp);
        FreeBookmark(pTmp);
      end;
    finally
      frmTinnMain.Refresh;
      FreeAndNil(frmShortcuts);
      DatasetToActionList(Self);
      SetFocus_Main;
    end;
end;

procedure TfrmTinnMain.actShortcutsHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Shortcuts"');
end;

procedure TfrmTinnMain.actFindExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Find;
end;

procedure TfrmTinnMain.actFindAgainExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    FindAgain;
end;

procedure TfrmTinnMain.actReplaceExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Replace;
end;

procedure TfrmTinnMain.actGotoLineExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    GotoLine;
end;

procedure TfrmTinnMain.actCopyFormattedRtfExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    CopyFormattedRtf;
end;

procedure TfrmTinnMain.actCopyFormattedHtmlExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    CopyFormattedHtml;
end;

procedure TfrmTinnMain.actCopyFormattedTeXExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    CopyFormattedTeX;
end;

procedure TfrmTinnMain.actFileSaveExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    // File notify: Stop
    if Assigned(fNotif) then NotifyFile_Stop;

    FileSave(Self);

    GetFile_Info(sActiveFile,
                 synEditor.Lines);

    // File notify: Start
    if (ExtractFileExt(sActiveFile) = EmptyStr) and
       ExecRegExpr('^Untitled',
                   sActiveFile) then Exit;  // The file wasn't saved: cancel in save dlg

    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= FileChanged;
    NotifyFile_Start(sActiveFile);
  end;
  UpdateHexViewer;
end;

procedure TfrmTinnMain.actFileSaveAsExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    // File notify: Stop
    if Assigned(fNotif) then NotifyFile_Stop;

    FileSaveAs(Self);

    GetFile_Info(sActiveFile,
                 synEditor.Lines);

    // File notify: Start
    if (ExtractFileExt(sActiveFile) = EmptyStr) and
       ExecRegExpr('^Untitled',
                   sActiveFile) then Exit;  // The file wasn't saved: cancel in save dlg

    fNotif:= TATFileNotificationSimple.Create(Self);
    fNotif.OnChanged:= FileChanged;
    NotifyFile_Start(sActiveFile);
  end;

  UpdateHexViewer;
end;

procedure TfrmTinnMain.actFullPathUnixExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    FullPathUnix;

  SetFocus_Main;  
end;

procedure TfrmTinnMain.actFullPathWindowsExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    FullPathWindows;

  SetFocus_Main;  
end;

procedure TfrmTinnMain.actDatabaseVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsDatabase do begin
    TabVisible:= not TabVisible;
    actDatabaseVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actDateStampExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    DateStamp;
end;

procedure TfrmTinnMain.actIndentBlockExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    IndentBlock;
end;

procedure TfrmTinnMain.actEditUndoExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          Undo;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          Undo;
     // synIO
     3: with (frmRterm.synIO as TSynEdit) do
          Undo;
     // synLog and synLog2
     4: with (seLog as TSynEdit) do
          Undo;
  end;
end;

procedure TfrmTinnMain.actUnindentBlockExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    UnindentBlock;
end;

procedure TfrmTinnMain.actUpperCaseWordExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    UpperCaseWord;
end;

procedure TfrmTinnMain.actANSIExecute(Sender: TObject);
begin
  actANSI.Checked    := True;
  seeEncoding_NewFile:= seANSI;
  sefDefault         := sfANSI;
end;

procedure TfrmTinnMain.actUTF8Execute(Sender: TObject);
begin
  actUTF8.Checked    := True;
  seeEncoding_NewFile:= seUTF8;
  sefDefault         := sfUTF8;
end;

procedure TfrmTinnMain.actUTF16LEExecute(Sender: TObject);
begin
  actUTF16LE.Checked := True;
  seeEncoding_NewFile:= seUTF16LE;
  sefDefault         := sfUTF16LSB;
end;

procedure TfrmTinnMain.actUTF16BEExecute(Sender: TObject);
begin
  actUTF16BE.Checked := TRue;
  seeEncoding_NewFile:= seUTF16BE;
  sefDefault         := sfUTF16MSB;
end;

procedure TfrmTinnMain.actLowerCaseWordExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    LowerCaseWord;
end;

procedure TfrmTinnMain.actInvertCaseWordExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    InvertCase;
end;

procedure TfrmTinnMain.MatchBracket(seActive: TSynEdit);
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
  att : TSynHighlighterAttributes;
  bc  : TBufferCoord;
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

    bc:= CaretXY;
    GetHighlighterAttriAtRowCol(bc,
                                sAtCursor,
                                att);

    if (Highlighter.SymbolAttribute = att) then ExecuteCommand(ecMatchBracket,
                                                               #0,
                                                               nil)
  end
end;

procedure TfrmTinnMain.menChaLinEndWINClick(Sender: TObject);
begin
  SetBuffer_FileFormat(sffDOS);
end;

procedure TfrmTinnMain.menChaLinEndMACClick(Sender: TObject);
begin
  SetBuffer_FileFormat(sffMAC);
end;

procedure TfrmTinnMain.menChaLinEndUNIXClick(Sender: TObject);
begin
  SetBuffer_FileFormat(sffUNIX);
end;

procedure TfrmTinnMain.menEncConANSIClick(Sender: TObject);
begin
  SetBuffer_SaveFormat(sfANSI);
end;

procedure TfrmTinnMain.menEncConUTF8Click(Sender: TObject);
begin
  SetBuffer_SaveFormat(sfUTF8);
end;

procedure TfrmTinnMain.MakeTemplate(sFile: string);
var
  i: integer;

  sContent,
   sFileExt: string;

begin
  actFileNewExecute(nil);

  sContent:= FileToString(sFile);
  sFileExt:= ExtractFileExt(sFile);

  i:= FindTopWindow;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
    synEditor.Text:= sContent;
    synEditor.Modified:= True;
    SetHighlighterFromFileExt(sFileExt);
  end;

  with pgFiles.ActivePage do
    Tag:= (Self.MDIChildren[i] as TfrmEditor).SetHighlighterID;
end;

procedure TfrmTinnMain.menFileTemplateRdocDatasetClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R doc_dataset.Rd');
end;

procedure TfrmTinnMain.menFileTemplateRdocEmptyClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R doc_empty.Rd');
end;

procedure TfrmTinnMain.menFileTemplateRdocFunctionClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R doc_function.Rd');
end;

procedure TfrmTinnMain.menFileTemplateRhtmlClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R html.Rhtml');
end;

procedure TfrmTinnMain.menFileTemplateRmarkdownClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R markdown.Rmd');
end;

procedure TfrmTinnMain.menFileTemplateRscriptClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R script.R');
end;

procedure TfrmTinnMain.menFileTemplateRsweaveClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR +
               '\templates\R_noweb.Rnw');
end;

procedure TfrmTinnMain.menEncConUTF16LEClick(Sender: TObject);
begin
  SetBuffer_SaveFormat(sfUTF16LSB);
end;

procedure TfrmTinnMain.menEncConUTF16BEClick(Sender: TObject);
begin
  SetBuffer_SaveFormat(sfUTF16MSB)
end;

procedure TfrmTinnMain.actMatchBracketExecute(Sender: TObject);
var
  seEditor,
   seLog   : TSynEdit;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;

  case GetFocus of
        // synEditor or synEditor2
    1..2: MatchBracket(seEditor);
        // synIO
       3: MatchBracket(frmRterm.synIO);
        // synLog and synLog2
       4: MatchBracket(seLog);
  end;
end;

procedure TfrmTinnMain.actMiscVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsMisc do begin
    TabVisible:= not TabVisible;
    actMiscVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actCommentsEditExecute(Sender: TObject);
begin
  sCommentsBookMark:= modDados.cdComments.Bookmark;
  menToolsDatabaseCommentsClick(nil);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actCommentsHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Comments"');
end;

procedure TfrmTinnMain.actCompletionCopyDescritionExecute(Sender: TObject);
begin
  with modDados do
    if frmTools.dbCompletionMemo.SelLength <> 0 then Clipboard.AsText:= frmTools.dbCompletionMemo.SelText
                                                else Clipboard.AsText:= cdCompletionCompletion.Value;
end;

procedure TfrmTinnMain.actCompletionCopyFunctionExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText:= cdCompletionFunction.Text;
end;

procedure TfrmTinnMain.actCompletionEditExecute(Sender: TObject);
begin
  sCompletionBookMark:= modDados.cdCompletion.Bookmark;
  menToolsDatabaseCompletionClick(nil);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actCompletionExampleSelectedExecute(Sender: TObject);

  function GetWord: string;
  var
    iPos: integer;
    sTmp: string;

  begin
    Result:= EmptyStr;
    sTmp:= modDados.cdCompletionFunction.Value;
    iPos:= pos(',',
               sTmp);

    if (iPos <> 0) then sTmp:= copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      MessageDlg('No valid word selected!',
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
  sTmp:= GetWord;
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actCompletionExecute(Sender: TObject);
var
  i: integer;
  
begin
  i:= FindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    DoCompletionInsert(True);

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmTinnMain.actCompletionHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Completion"');
end;

procedure TfrmTinnMain.actCompletionHelpSelectedExecute(Sender: TObject);

  function GetWord: string;
  var
    iPos: integer;
    sTmp: string;

  begin
    Result:= EmptyStr;
    sTmp:= modDados.cdCompletionFunction.Value;
    iPos:= pos(',',
               sTmp);

    if (iPos <> 0) then sTmp:= copy(sTmp,
                                    0,
                                    (iPos - 1));

    if (sTmp = EmptyStr) then begin
      MessageDlg('No valid word selected!',
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
  sTmp:= GetWord;
  if (sTmp = EmptyStr) then Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actCompletionInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then Exit;
  i:= FindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    DoCompletionInsert;

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmTinnMain.actDataCommentsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsComments do begin
    TabVisible:= not TabVisible;
    actDataCommentsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actDataCompletionVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsCompletion do begin
    TabVisible:= not TabVisible;
    actDataCompletionVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actNormalSelectExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    NormalSelect;
end;

procedure TfrmTinnMain.actNotificationExecute(Sender: TObject);
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

procedure TfrmTinnMain.actNotification_USExecute(Sender: TObject);
begin
  with actNotification_US do
    Checked:= Not Checked;
end;

procedure TfrmTinnMain.actLineSelectExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    LineSelect;
end;

procedure TfrmTinnMain.actColumnSelectExecute(Sender: TObject);
begin
  with (MDIChildren[FindTopWindow] as TfrmEditor) do
    ColumnSelect;
end;

procedure TfrmTinnMain.actUpperCaseSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    UpperCaseSelection;
end;

procedure TfrmTinnMain.actRtermLOGLineWrapExecute(Sender: TObject);
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

procedure TfrmTinnMain.actLowerCaseSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    LowerCaseSelection;
end;

procedure TfrmTinnMain.actInvertSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    InvertSelection;
end;

procedure TfrmTinnMain.actRtermIOLineWrapExecute(Sender: TObject);
begin
  with actRtermIOLineWrap do
    Checked:= not Checked;

  with frmRterm.synIO do
    WordWrap:= actRtermIOLineWrap.Checked;
end;

procedure TfrmTinnMain.GetComments;
var
  scHighlighter,
   scBBHighlighter,
   scBEHighlighter: TSynCustomHighlighter;

  sLanguage: string;

begin
  // Get Highlighter (and check for mistake selection in multisyn case)
  if frmTools.cbComAutoDetect_Language.Checked then begin
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
      if (synEditor.SelText <> '') then begin
        scBBHighlighter:= GetBBHighLighter;                 // Highlighter of the block begin
        scBEHighlighter:= GetBEHighLighter;                 // Highlighter of the block end

        if (scBBHighlighter <> scBEHighlighter) then Exit;  // Will no be commented!
      end;

      scHighlighter:= GetCurrentHighLighter;
    end;

    sLanguage:= scHighlighter.GetFriendlyLanguageName;
    modDados.SetCurrentHighlighter(sLanguage);
  end;

  with modDados do begin
    //SetCurrentHighlighter(sLanguage);
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

procedure TfrmTinnMain.actCommentExecute(Sender: TObject);
begin
  sBeginComment:= EmptyStr;  // Initial status

  GetComments;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Comment(sBeginComment,
            sEndComment);
end;

procedure TfrmTinnMain.actUncommentFirstExecute(Sender: TObject);
begin
  sBeginComment:= EmptyStr;  // Initial status

  GetComments;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Uncomment(sBeginComment,
              sEndComment);
end;

procedure TfrmTinnMain.actUncommentExecute(Sender: TObject);
begin
  sBeginComment:= EmptyStr;  // Initial status

  GetComments;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Uncomment(sBeginComment,
              sEndComment,
              [rfReplaceAll]);
end;

procedure TfrmTinnMain.actFileCloseExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).Close;
  if (pgFiles.PageCount > 0) then pgFilesChange(nil);
end;

procedure TfrmTinnMain.actFileCloseOthersExecute(Sender: TObject);
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
      iChildID:= FindWindowByName(sTmp);

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

procedure TfrmTinnMain.actFileCloseAllExecute(Sender: TObject);
var
  iChildID: integer;
  sTmp    : string;

begin
  while (pgFiles.PageCount > 0) do begin
    pgFiles.ActivePageIndex:= 0;
    sTmp    := pgFiles.ActivePage.Hint;
    iChildID:= FindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
      bCloseCanceled:= False;
      Close;
      if bCloseCanceled then Exit;;
    end;

  end;
  if (pgFiles.PageCount = 0) then ClearStatusBar;
end;

procedure TfrmTinnMain.actFileCloseRightExecute(Sender: TObject);
var
  iTotPages,
   iPos,
   iNumToClose,
   iChildID   : integer;
  sTmp        : string;

begin
  iPos       := pgFiles.ActivePageIndex;
  iTotPages  := pgFiles.PageCount - 1;
  iNumToClose:= iTotPages - iPos;
  if (iNumToClose = 0) then Exit;
  repeat
    sTmp    := pgFiles.Pages[iPos + 1].Hint;
    iChildID:= FindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
      bCloseCanceled:= False;
      Close;
      if bCloseCanceled then Exit;
    end;

    dec(iNumToClose);
  until (iNumToClose = 0);
  pgFiles.ActivePageIndex:= iPos;
end;

procedure TfrmTinnMain.actFileCloseLeftExecute(Sender: TObject);
var
  iPos,
   iChildID: integer;
  sTmp     : string;

begin
  iPos:= pgFiles.ActivePageIndex;
  if (iPos = 0) then Exit;
  repeat
    sTmp    := pgFiles.Pages[iPos - 1].Hint;
    iChildID:= FindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as tfrmEditor) do begin
      bCloseCanceled:= False;
      Close;
      if bCloseCanceled then Exit;;
    end;

    dec(iPos);
  until (iPos = 0);
  pgFiles.ActivePageIndex:= iPos;
end;

procedure TfrmTinnMain.actCopyFormattedExecute(Sender: TObject);
begin
  // Nothing, but don't remove!
end;

procedure TfrmTinnMain.actRExplorerBasicExecute(Sender: TObject);
begin
  // Nothing, but don't remove!
end;

procedure TfrmTinnMain.actToolsTabsBottomExecute(Sender: TObject);
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

procedure TfrmTinnMain.actToolsTabsLeftExecute(Sender: TObject);
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

procedure TfrmTinnMain.actToolsTabsRightExecute(Sender: TObject);
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

procedure TfrmTinnMain.actToolsTabsTopExecute(Sender: TObject);
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

procedure TfrmTinnMain.menHelIniFilesClick(Sender: TObject);
begin
  MessageDlg(sPathIni + #13 + #13 +
             'The main folder above stores all ini files.' + #13 +
             'Each ini file is located in the respective sub-folder (data, syntax, etc)!',
             mtInformation,
             [mbOk],
             0);

  SetFocus_Main;             
end;

procedure TfrmTinnMain.menHelNewsClick(Sender: TObject);
begin
  OpenUserGuidePDF('"What is new?"');
end;

procedure TfrmTinnMain.actRFilterRefreshExecute(Sender: TObject);
begin
  actRExplorerRefreshExecute(nil);
end;

procedure TfrmTinnMain.MySort(iSort: integer);

  procedure UpdateSort;
  var
    tmpTopLine: integer;
    seEditor  : TSynEdit;
    
  begin
    if (pgFiles.PageCount < 1) then Exit;
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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
  bSorted : boolean;

  meTmp: TMemo;

  seEditor: TSynEdit;

  slTmp   : TStringList;

  function SortMemo: boolean;
  var
    sStructure: string;
    wYear,
     wMonth,
     wDay     : Word;

  begin
    Result := False;
    bSorted:= False;
    try
      slTmp.Text:= TrimRight(meTmp.Text);
      case iSort of
        1: slTmp.Sort;
        2: slTmp.CustomSort(SortInteger);
        3: slTmp.CustomSort(SortDate);
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

        MessageDlg(E.Message + '!' + #13 + #13 +
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
  if not SavePriorClipboardText then Exit;
  try
    slTmp       := TStringList.Create;
    meTmp       := TMemo.Create(nil);
    meTmp.Parent:= panInvisibleParent;
    
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;
    
    with seEditor do begin
      if SelAvail then meTmp.Text := SelText;
                  //else meTmp.Lines:= Lines;

      if SortMemo then begin
          meTmp.SelectAll;
          meTmp.CopyToClipboard;
      end;

    end;
    
    if bSorted then UpdateSort;
  finally
    RestorePriorClipboardText;
    FreeAndNil(slTmp);
    FreeAndNil(meTmp);
  end;
end;

procedure TfrmTinnMain.menWebRSearchNabbleRbrClick(Sender: TObject);
begin
  OpenUrl('http://r-br.2285057.n4.nabble.com/');
end;

procedure TfrmTinnMain.menWebRSearchNabbleRClick(Sender: TObject);
begin
  OpenUrl('r.789695.n4.nabble.com/');
end;

procedure TfrmTinnMain.actSortStringExecute(Sender: TObject);
begin
  MySort(1); // String
end;

procedure TfrmTinnMain.actSortNumberExecute(Sender: TObject);
begin
  MySort(2); // Number
end;

procedure TfrmTinnMain.actSortDateExecute(Sender: TObject);
begin
  MySort(3); // Date
end;

procedure TfrmTinnMain.actOrganizeScreenExecute(Sender: TObject);
var
  i: integer;

begin
  if not Rgui_Running then Exit;

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
    case iRguiTinnRDisposition of
      0: begin  // 0: Tinn-R on top
           // Set Tinn-R position
           SetWindowPos(frmTinnMain.Handle,
                        HWND_TOP,
                        0,
                        0,
                        Screen.Width,
                        (Screen.Height * iRguiTinnRProportion div 100),
                        SWP_SHOWWINDOW);

           // Set Rgui position
           SetWindowPos(hRgui,
                        HWND_TOP,
                        0,
                        (Screen.Height * iRguiTinnRProportion div 100),
                        Screen.Width,
                        Screen.Height - (Screen.Height * iRguiTinnRProportion div 100) -30,
                        SWP_SHOWWINDOW);
         end;
      1: begin  // 1: Tinn-R on bottom
           // Tinn-R
           SetWindowPos(frmTinnMain.Handle,
                        HWND_TOP,
                        0,
                        Screen.Height - (Screen.Height * iRguiTinnRProportion div 100),
                        Screen.Width,
                        (Screen.Height * iRguiTinnRProportion div 100) - 30,
                        SWP_SHOWWINDOW);

           // Rgui
           SetWindowPos(hRgui,
                        HWND_TOP,
                        0,
                        0,
                        Screen.Width,
                        Screen.Height - (Screen.Height * iRguiTinnRProportion div 100),
                        SWP_SHOWWINDOW);
         end;
      2: begin  // 2: Tinn-R on left
           // Tinn-R
           SetWindowPos(frmTinnMain.Handle,
                        HWND_TOP,
                        0,
                        0,
                        (Screen.Width * iRguiTinnRProportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);

           // Rgui
           SetWindowPos(hRgui,
                        HWND_TOP,
                        (Screen.Width * iRguiTinnRProportion div 100),
                        0,
                        Screen.Width - (Screen.Width * iRguiTinnRProportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);
         end;
      3: begin  // 3: Tinn-R on right
           // Tinn-R
           SetWindowPos(frmTinnMain.Handle,
                        HWND_TOP,
                        Screen.Width - (Screen.Width * iRguiTinnRProportion div 100),
                        0,
                        (Screen.Width * iRguiTinnRProportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);

           // Rgui
           SetWindowPos(hRgui,
                        HWND_TOP,
                        0,
                        0,
                        Screen.Width - (Screen.Width * iRguiTinnRProportion div 100),
                        Screen.Height - 30,
                        SWP_SHOWWINDOW);
         end;
    end;

  bAlreadyOrganized:= True;
  Self.WindowState := wsNormal;
  SetFocus_Rgui(iDelay);
end;

procedure TfrmTinnMain.DoIPConnection(sIPHost: string;
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

procedure TfrmTinnMain.DoRConnection(sTmp: string;
                                     bActive,
                                     bSendTask: boolean);
var
  sToSend: string;

begin
  if bSendTask then begin  // Rterm local must be running!
    CheckRterm;
    sToSend:= sTmp + #13#10;
    frmRterm.cRterm.SendInput(sToSend);
    SendToConsole(sTmp);
  end;

  SetFocus_Rgui(iDelay div 4);
  if bIPLocal then DoIPConnection(sIPHostLocal,
                                  iIPPortLocal,
                                  bActive)
              else DoIPConnection(sIPHostRemote,
                                  iIPPortRemote,
                                  bActive);
end;

procedure TfrmTinnMain.DoRguiConnection(sTmp: string;
                                        bActive: boolean);
begin
  if not Rgui_Running then Exit;
  fCodeSender.SendChar(sTmp,
                       hRgui);

  Sleep(2*iDelay div 3);
  if bIPLocal then DoIPConnection(sIPHostLocal,
                                  iIPPortLocal,
                                  bActive)
              else DoIPConnection(sIPHostRemote,
                                  iIPPortRemote,
                                  bActive);
end;

procedure TfrmTinnMain.actRContTCPConnectionExecute(Sender: TObject);
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
      if Rterm_Running and
         bIPLocal then begin
        DoRConnection(sStart,
                      True,
                      True);
        actRContTCPConnection.ImageIndex:= 293;
        Exit;
      end;

      // Related to R (gui or term) remote
      if not bIPLocal then begin
        DoRConnection(sStart,
                      True,
                      False);
        if (RHistory = nil) then RHistory:= TRHistory.Create;
        actRContTCPConnection.ImageIndex:= 293;
        Exit;
      end;

      // Related to Rgui local
      if Rgui_Running then begin
        DoRguiConnection(sStart,
                         True);
        actRContTCPConnection.ImageIndex:= 293;
      end;
    end
    // It will disconnect
    else begin
      bTCPIPRunning:= False;  // For all R

      // Related to Rterm local
      if Rterm_Running and
         bIPLocal then begin
        DoRConnection(sStop,
                      False,
                      True);
        actRContTCPConnection.ImageIndex:= 168;
        Exit;
      end;

      // Related to R (gui or term) remote
      if not bIPLocal then begin
        DoRConnection(sStop,
                      False,
                      False);
        actRContTCPConnection.ImageIndex:= 168;
        Exit;
      end;

      // Related to Rgui local
      if Rgui_Running then begin
        DoRguiConnection(sStop,
                         False);
        actRContTCPConnection.ImageIndex:= 168;
      end;
    end;
  except
    // TODO
  end
end;

function TfrmTinnMain.RWorkDir: string;
begin
  with pgFiles do
    if (PageCount > 0) and
       FileExists(ActivePage.Hint) and
       bRSetWorkDir_Starting then Result:= ExtractFilePath(ActivePage.Hint)
                             else Result:= ExtractFilePath(sPathRgui);
end;

procedure TfrmTinnMain.actRContGuiStartCloseExecute(Sender: TObject);

  function IsRQuestionRunning(sCaption: string): Boolean;
  var
    tmpHandle: HWND;

  begin
    Result:= False;
    tmpHandle:= GetWindowHandle(Pchar(sCaption));
    if (tmpHandle <> 0) then Result:= True;
  end;

  procedure ReturnPreviousStates;
  begin
    // On Top
    if bOnTop then begin
      OnTop(Application.Handle);
      actOnTop.Checked:= True;
      CheckTop;
    end
    else begin
      OnTop(Application.Handle);
      actOnTop.Checked:= False;
    end;

    // ReturnFocus
    if bRguiReturnFocus then begin
      actRguiReturnFocus.Checked:= True;
      SetFocus_Rgui(iDelay);
    end
    else actRguiReturnFocus.Checked:= False;
  end;

var
  resShellExecute: HINST;

  sTmp: string;

begin
  if (actRContGuiStartClose.Caption = 'Rgui (start)') then begin
    // Will check the path of Rgui executable
    if (sPathRgui = EmptyStr) then begin
      if (MessageDlg('The preferred Rterm was not defined.' + #13 +
                     'Do you desire to set this now?',
                     mtConfirmation,
                     [mbYes, mbNo],
                     0) = mrYes) then begin

        bStartOptionsWithRPage:= True;

        actShowAppOptionsExecute(Self);
      end
      else Exit;
    end;

    if not FileExists(sPathRgui) or
       (ExtractFileExt(sPathRgui) <> '.exe') then begin
      sTmp:= sPathRgui;

      if (sTmp = EmptyStr) then sTmp:= 'Empty';

      MessageDlg(sTmp + #13 + #13 +
                 'The file above is not executable!' + #13 +
                 'Please, set Rgui path at: Options/Application/R/Path (R)/Rgui',
                 mtError,
                 [mbOk],
                 0);
      Exit;
    end;

    // Will open preferred Rgui
    resShellExecute:= RunFile(sPathRgui,
                              sParRgui,
                              RWorkDir);

    if (resShellExecute <= 32) then PSendMessage(resShellExecute); // function fail

    if (RHistory = nil) then RHistory:= TRHistory.Create;

    bRRequireKnitr:= True;
  end
  else begin // Close preferred Rgui
    // Disable OnTop (Temporary)
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

    if UseTCPIP then begin
      sTmp:= 'q()' + #13#10;

      PrintMessage(sTmp,
                   True);

      csRGeneral.Socket.SendText(sTmp)
    end
    else if Rgui_Running then begin
      sTmp:= 'q()';

      fCodeSender.SendChar(sTmp,
                           hRgui);

      bRRequireKnitr   := False;
    end;

    Sleep(iDelay);
    while IsRQuestionRunning('Question') do;

    ReturnPreviousStates;
  end;
end;

procedure TfrmTinnMain.actFilesFullPathUnixExecute(Sender: TObject);
var
  sFilePath: string;

begin
  with frmTools.tvProject do begin
    SetFocus;

    if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then ClipBoard.AsText:= DosPathToUnixPath(sFilePath)
                               else MessageDlg(trim(sFilePath) + #13 + #13 +
                                               'File not found!',
                                               mtWarning,
                                               [mbOk],
                                               0);
    end
    else
      MessageDlg('Please, choice a valid file!',
                 mtWarning,
                 [mbOk],
                 0);
  end;
end;

procedure TfrmTinnMain.actFilesFullPathWindowsExecute(Sender: TObject);
var
  sFilePath: string;

begin
  with frmTools.tvProject do begin
    SetFocus;

    if (Selected.Level = 2) then begin
      sFilePath:= trim(string(Selected.Data));
      if FileExists(sFilePath) then ClipBoard.AsText:= sFilePath
                               else MessageDlg(trim(sFilePath) + #13 + #13 +
                                               'File not found!',
                                               mtWarning,
                                               [mbOk],
                                               0);
    end
    else
      MessageDlg('Please, choice a valid file!',
                 mtWarning,
                 [mbOk],
                 0);
  end;
end;

procedure TfrmTinnMain.DoTxt2Tag(iButton: integer);
var
  seEditor: TSynEdit;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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

procedure TfrmTinnMain.LabelClick(Sender: TObject);
var
  i: integer;
  
begin
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;
  DoTxt2Tag((Sender as TLabel).Tag);
  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmTinnMain.actWinExplVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsWinExplorer do begin
    TabVisible:= not TabVisible;
    actWinExplVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actWorkExplVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsWorkExplorer do begin
    TabVisible:= not TabVisible;
    actWorkExplVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actProjectVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsProject do begin
    TabVisible:= not TabVisible;
    actProjectVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actMarkupVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsMarkup do begin
    TabVisible:= not TabVisible;
    actMarkupVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actTxt2tagsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsTxt2tags do begin
    TabVisible:= not TabVisible;
    actTxt2tagsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actLatexVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsLatex do begin
    TabVisible:= not TabVisible;
    actLatexVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actResultsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsResults do begin
    TabVisible:= not TabVisible;
    actResultsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actIniLogVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsIniLog do begin
    TabVisible:= not TabVisible;
    actIniLogVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actSearchVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsSearch do begin
    TabVisible:= not TabVisible;
    actSearchVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actSpellVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsSpell do begin
    TabVisible:= not TabVisible;
    actSpellVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actDataRcardVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsRcard do begin
    TabVisible:= not TabVisible;
    actDataRcardVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actRExplorerVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsRExplorer do begin
    TabVisible:= not TabVisible;
    actRExplorerVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.UdatePgFiles;
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

procedure TfrmTinnMain.UpdateBars(bOption: boolean);
begin
  RToolbar(bOption and actTobRVisible.Checked);
  with ctbMain do begin
    Align  := alTop;
    Visible:= bOption;
  end;
  UdatePgFiles;
end;

procedure TfrmTinnMain.actShowAllBarsExecute(Sender: TObject);
begin
  with actShowAllBars do begin
    Checked:= not Checked;
    UpdateBars(Checked)
  end;
end;

procedure TfrmTinnMain.actRContPackagesExecute(Sender: TObject);
begin
  // Don't remove!
end;

procedure TfrmTinnMain.actRContPacAvailableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then Exit;

  sTmp:= 'available.packages()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacInstallExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then Exit;

  sTmp:= 'utils:::menuInstallPkgs()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacInstallZipExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= 'utils:::menuInstallLocal()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacInstalledExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= 'installed.packages()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacLoadExecute(Sender: TObject);
var
  sTmp: string;

begin
(* Don't working inside of Rterm
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE)))' + #13 +
         '  if(nchar(pkg)) library(pkg, character.only=TRUE)})';' +
*)
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE))); if(nchar(pkg)) library(pkg, character.only=TRUE)})';
  DoSend(sTmp);
end;

// Install TinnRcom from TinnRcom_X.X.X.zip
procedure TfrmTinnMain.actRContPacInstTinnRcomExecute(Sender: TObject);

  function IsPackageInstalled(sName: string): boolean;
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

  procedure InstallPackage(var sName: string);
  var
    sTmp,
     sDepends,
     sFull,
     sFilePath,
     sToSend  : string;

  begin
    // Will install the package
    // This instruction was changed to be compatible with old and new version of R (3.2.0)
    // Thanks to Duncam Murdoch for the tip
    sTmp:= 'install.packages(' +
           '''' +
           sName +
           '''' +
           ', ' +
           'type=''binary''' +
           ', ' +
           'repos=NULL' +
           ')';

    sDepends:= FileToString(sUtilsOrigin +
                           '\Rinstall.R');

    sDepends:= StringReplace(sDepends,
                             '%repos',
                             sRmirror,
                             []);

    sFull:= sDepends + #13 +
            sTmp;

    sFilePath:= sPathTmp +
                '\fTmp.R';

    if FileSaveFast(sFilePath,
                    sFull) then sToSend:= 'source(' +
                                          '''' +
                                          DosPathToUnixPath(sFilePath) +
                                          '''' +
                                          ')';

    DoSend(sToSend);

    stbMain.Panels[7].Text:= 'Please, wait...';
    stbMain.Panels[8].Text:= 'Installing package: ' +
                             sName;

    Application.ProcessMessages;
  end;

var
  i: integer;

  sToInstall,
   sLatest  : string;

  uOption: TModalResult;
  srTmp  : TSearchRec;
  bNot   : boolean;

const
  sName = '\TinnRcom';

begin
  uOption:= mrNone;

  if (CheckConnection = False) then begin
    Beep;
    Exit;
  end;

  Screen.Cursor:= crHourglass;

  tRRuning.Enabled:= False;  // It is important!

  bNot:= False;

  // The user can be more than one source of the package.
  // So will install the latest version
  sLatest:= 'TinnRcom_00.00.00.zip';

  try
    // Try to find the source of TinnRcom package
    if FindFirst(sPathTinnRcom +
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
      MessageDlg(sPathTinnRcom + '\' + #13 + #13 +
                 'It was not possible to found a valid version of TinnRcom package in the path above.' + #13 + #13 +
                 'If it was manual (or accidentally) removed, please make a dowload and try it again!',
                 mtError,
                 [mbOk],
                 0);
      bNot:= True;
      Exit;
    end;

    // TinnRcom package
    sToInstall:= DosPathToUnixPath(sPathTinnRcom +
                                   '\' +
                                   sLatest);

    if not Assigned(slRLibPaths) then begin
      MessageDlg('The necessary information about ''TinnRcom package'' from R are not available.' + #13 + #13 +
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
          MessageDlg('Package to install: '+
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
        uOption:= MessageDlg('Package to install: '+
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

    InstallPackage(sToInstall);

    bRTinnRcom_Installed:= IsPackageInstalled(sName);

    if (bRTinnRcom_Installed) then begin
      Sleep(5*iDelay);  // R is not fast to install TinnRcom package

      stbMain.Panels[7].Text:= 'Done!';
      stbMain.Panels[8].Text:= 'Installed package: TinnRcom';

      bRTinnRcom_Updating:= False;
      Application.ProcessMessages;
    end
    else begin
      stbMain.Panels[7].Text:= 'Error!';
      stbMain.Panels[8].Text:= 'Not installed package: TinnRcom';

      Application.ProcessMessages;
    end;
  finally
    tRRuning.Enabled:= True;

    if (not bNot) then
      if bRTinnRcom_Installed then GetTinnRcom_Info;

    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
  end;
end;

procedure TfrmTinnMain.actRContPacLoadTinnRcomExecute(Sender: TObject);
var
  sTmp: string;

begin
  Screen.Cursor:= crHourglass;
  sTmp:= 'library(TinnRcom)';
  DoSend(sTmp);
  Sleep(10*iDelay);
  bRTinnRcom_Loaded:= True;
  Screen.Cursor:= crDefault;
end;

procedure TfrmTinnMain.actRContPacNewExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then Exit;

  sTmp:= 'new.packages()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacRemoveExecute(Sender: TObject);
var
  sTmp: string;

begin
(*  Don't working inside of Rterm
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE)))' + #13 +
         '  if(nchar(pkg)) remove.packages(pkg)})';
*)
  sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE))); if(nchar(pkg)) remove.packages(pkg)})';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacStatusExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then Exit;

  sTmp:= 'packageStatus()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacUpdateExecute(Sender: TObject);
var
  sTmp: string;

begin
  // sTmp:= 'update.packages(ask=''graphics'')';
  if (CheckConnection = False) then Exit;

  sTmp:= 'update.packages(checkBuilt=TRUE, ask=FALSE)';
  DoSend(sTmp);
end;

function TfrmTinnMain.ActivePanel: integer;
var
  x,
   i : integer;
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

procedure TfrmTinnMain.stbMainClick(Sender: TObject);

  function OpenedFile: boolean;
  begin
    Result:= True;
    if ((Self.MDIChildren[FindTopWindow] as TfrmEditor) = nil) then Result:= False;
  end;

begin
  case ActivePanel of
     2: begin
          if OpenedFile then actGotoLineExecute(nil);
        end;

     3: begin
          if OpenedFile then actReadOnlyExecute(nil);
        end;

     4: begin
          if OpenedFile then begin
            with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
              if actNormalSelect.Checked      then actLineSelectExecute(nil)
              else if actLineSelect.Checked   then actColumnSelectExecute(nil)
              else if actColumnSelect.Checked then actNormalSelectExecute(nil)
            end;
          end;
        end;

     6: begin
          bTinnRHotKeysActive:= not bTinnRHotKeysActive;
          with frmHotkeys do
            SetHotkeys(bTinnRHotKeysActive);
        end;

     8: actRtermWarningErrorExecute(nil);
  end;
end;

procedure TfrmTinnMain.stbMainDrawPanel(StatusBar: TStatusBar;
                                        Panel: TStatusPanel;
                                        const Rect: TRect);
var
  cTmp: Tcolor;

begin
  if bTinnRHotKeysActive then cTmp:= clMaroon
                         else cTmp:= clGray;

  with stbMain.Canvas do begin
       case Panel.Index of
         0: begin
              Brush.Color:= clCream;
              Font.Color := clMaroon;
              //Font.Style := [fsBold];
           end;
         1: begin
              Brush.Color:= clCream;
              Font.Color := clMaroon;
              //Font.Style := [fsBold];
           end;
         6: begin
              Brush.Color:= clCream;
              Font.Color := cTmp;
              //Font.Style := [fsItalic];
           end;
         7: begin
              Brush.Color:= clCream;
              Font.Color := clGreen;
              //Font.Style := [fsItalic];
           end;
         8: begin
              Brush.Color:= clCream;
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
end;

procedure TfrmTinnMain.UpdateCloseFileOptions;
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

procedure TfrmTinnMain.InsertLatexSymbol(sSymbol: string;
                                         iCaretControl: integer);
var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= FindTopWindow;
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

function TfrmTinnMain.Rterm_Running: boolean;
begin

  Result:= False;

  if Assigned(frmRterm) then
    with frmRterm do
      Result:= bRterm_Running;

  with actRguiReturnFocus do
    if Result then Enabled:= False
              else Enabled:= True
end;

function TfrmTinnMain.Rgui_Running: boolean;
begin
  Result:= IsGuiRunning(hRgui,
                        sGuiRRunning,
                        iRguiRecognitionCaption,
                        iRguiRecognitionType);

  if Result then begin
    fCodeSender.GuiHandle := hRgui;
    fCodeSender.GuiCaption:= sGuiRRunning;
  end;
end;

procedure TfrmTinnMain.LatexAccents(Sender: TObject;
                                    Button: TMouseButton;
                                    Shift: TShiftState;
                                    X,
                                    Y: Integer);
var
  i: integer;

  seEditor: TSynEdit;

  sAccent: string;

  procedure SetEditor;
  begin
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
  end;

  procedure InsertAccentSimple;
  begin
    with seEditor do begin
      SelText:= sAccent;
      ExecuteCommand(ecLineEnd,
                     #0,
                     nil);
      CaretX := CaretX - 1;
    end;
  end;

  procedure InsertAccent;
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
      else InsertAccentSimple;
    end;

    PostMessage(TWinControl(Self.MDIChildren[FindTopWindow] as TfrmEditor).Handle,
                WM_SETFOCUS,
                0,
                0);
  end;

  procedure FormatAccent;
  var
    ipos: integer;

  begin
    sAccent:= ChangeFileExt(sAccent,
                            EmptyStr);
    
    iPos   := pos('_',
                  sAccent);
    
    sAccent:= copy(sAccent,
                   iPos + 1,
                   length(sAccent));
    
    sAccent:= '\' + sAccent + '{}';
  end;

begin
  if ((Self.MDIChildren[FindTopWindow] as TfrmEditor) = nil) then Exit;
  
  SetEditor;
  
  with Sender as TJvImagesViewer do begin
    i:= SelectedIndex;
    if (i < 0) then Exit;
    sAccent:= ExtractFileName(Items[i].FileName);
    FormatAccent;
    InsertAccent;
  end;
end;

procedure TfrmTinnMain.actLatexDimensionalExecute(Sender: TObject);
var
  seEditor: TSynEdit;
  bcCurPos: TBufferCoord;

  synSearchOptions: TSynSearchOptions;

  dlg: TfrmLatexDimensional;

  sTmp: string;

  function MakeContent(sType: string): string;
  var
    i,
     j: integer;

    sResult,
     sLine,
     sCab,
     sPrior,
     sFill : string;

  begin
    case StringToCaseSelect(sType,
                            ['Array',
                             'Matrix',
                             'Tabular',
                             'Tabbing']) of
      0: begin // Array
           sPrior:= ' ';
           sFill := ' . &';
         end;

      1: begin // Matrix
           sPrior:= '   ';
           sFill := ' . &';
         end;

      2: begin // Tabular
           sPrior:= ' ';
           sFill := ' . &';
         end;

      3: begin // Tabbing
           sPrior:= ' ';
           sCab  := ' . \=';
           sFill := ' . \>';

           i:= 0;
           repeat
             sLine:= sLine + sCab;
             inc(i);
           until(i = iCols - 1);
           sResult:= sPrior + sLine + ' . \kill' + #13;
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
        sLine:= sPrior + sLine + ' . \\' + #13;
      end
      else sLine:= '  . \\' + #13;
      sResult:= sResult + sLine;
      sLine  := EmptyStr;
      inc(i);
      j:= 0;
    until(i = iRows);
  
    Result:= (sResult);
  end;

  function MakeFormat(sTmp: string): string;
  var
    sResult: string;

  begin
    repeat
      sResult:= sResult + sTmp;
    until (Length(sResult) = iCols);
    Result:= (sResult);
  end;

  procedure MakeDimensional(sType: string;
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

    case StringToCaseSelect(sType,
                            ['Array',
                             'Matrix',
                             'Tabular',
                             'Tabbing']) of
      0: begin // Array
           sTmp:=
             '\begin{array}{' + MakeFormat(sAlign) + '}' + #13 +
             MakeContent(sType)                          +
             '\end{array}';
         end;
      1: begin // Matrix
           sTmp:=
             '\left('                                      + #13 +
             '  \begin{array}{' + MakeFormat(sAlign) + '}' + #13 +
             MakeContent(sType)                            +
             '  \end{array}'                               + #13 +
             '\right)';
         end;
      2: begin // Tabular
           sTmp:=
             '\begin{tabular}{' + MakeFormat(sAlign) + '}' + #13 +
             '  \hline'                                    + #13 +
             MakeContent(sType)                            +
             '  \hline'                                    + #13 +
             '\end{tabular}';
         end;
      3: begin // Tabbing
           sTmp:=
             '\begin{tabbing}'   + #13 +
             MakeContent(sType)  +
             '\end{tabbing}';
         end;
    end;
  end;

begin
  if ((Self.MDIChildren[FindTopWindow] as TfrmEditor) = nil) then Exit;

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

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;
  
    with seEditor do
      bcCurPos:= BlockBegin;

    iLatexDimensionalAlign  := dlg.rdgAlign.ItemIndex;
    iLatexDimensionalElement:= dlg.rdgType.ItemIndex;
  
    case iLatexDimensionalElement of
      0: begin // Array
           MakeDimensional('Array',
                           iRows,
                           iCols,
                           iLatexDimensionalAlign);
           with seEditor do begin
             if SelAvail then SelText:= sTmp
                         else SelText:= sTmp;
           end;
         end;

      1: begin // Matrix
           MakeDimensional('Matrix',
                           iRows,
                           iCols,
                           iLatexDimensionalAlign);
           with seEditor do begin
             if SelAvail then SelText:= sTmp
                         else SelText:= sTmp;
           end;
         end;

      2: begin  // Tabular
           MakeDimensional('Tabular',
                           iRows,
                           iCols,
                           iLatexDimensionalAlign);
           with seEditor do begin
             if SelAvail then SelText:= sTmp
                         else SelText:= sTmp;
           end;
         end;

      3: begin  // Tabbing
           with seEditor do begin
             MakeDimensional('Tabbing',
                              iRows,
                              iCols,
                              iLatexDimensionalAlign);
             if SelAvail then SelText:= sTmp
                         else SelText:= sTmp;
           end;
         end;
    end;
  finally
    FreeAndNil(dlg);
  end;

  with seEditor do begin
    CaretXY         := bcCurPos;
    SearchEngine    := SynEditSearch;
    synSearchOptions:= [];
    SearchReplace('.',
                  EmptyStr,
                  synSearchOptions);
  end;
end;

procedure TfrmTinnMain.actLatexMakeIndexExecute(Sender: TObject);
var
  i,
   iPos: integer;

  oldCursor: TCursor;

  sTmpFile,
   sTmpDir: string;

  wOption: word;

begin
  i:= FindTopWindow;
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

    ExecCmdLineAndWait('makeindex ' +
                       sTmpFile,
                       wOption)
  finally
    (Self.MDIChildren[i] as TfrmEditor).Cursor:= oldCursor;
  end;
end;

procedure TfrmTinnMain.LatexHeader(Sender: TObject);

  procedure InsertLatex(iHeader: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sHeader: string;

    i: integer;

  begin
    i:= FindTopWindow;
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
    InsertLatex(Tag);
end;


procedure TfrmTinnMain.LatexFont(Sender: TObject);

  procedure InsertLatex(iFont: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sFont  : string;

    i: integer;

  begin
    i:= FindTopWindow;
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
    InsertLatex(Tag);
end;

procedure TfrmTinnMain.LatexFontSize(Sender: TObject);

  procedure InsertLatex(iSize: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sSize  : string;

    i: integer;

  begin
    i:= FindTopWindow;
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
    InsertLatex(Tag);
end;

procedure TfrmTinnMain.LatexFormat(Sender: TObject);

  function MakeContent(sType,
                       sPrior: string;
                       iTabWidth: integer): string;
  var
    sTmp,
     sTab: string;

    function FormatPrior(sPrior,
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

    case StringToCaseSelect(sType,
                            ['Itemization',
                             'Enumeration',
                             'Left',
                             'Center',
                             'Right']) of
      0: begin // Itemization
           if (sPrior = EmptyStr) then Result:= sTab +
                                                '\item .' + #13#10
                                  else Result:= FormatPrior(sPrior,
                                                            sTab +
                                                           '\item ');
         end;
      1: begin // Enumeration
           if (sPrior = EmptyStr) then Result:= sTab +
                                                '\item .' + #13
                                  else Result:= FormatPrior(sPrior,
                                                            sTab +
                                                            '\item ');
         end;
      2: begin // Left
           if (sPrior = EmptyStr) then Result:= sTab + #13
                                  else Result:= FormatPrior(sPrior,
                                                            sTab);
         end;
      3: begin // Center
           if (sPrior = EmptyStr) then Result:= sTab + #13
                                  else Result:= FormatPrior(sPrior,
                                                            sTab);
         end;
      4: begin // Right
           if (sPrior = EmptyStr) then Result:= sTab + #13
                                  else Result:= FormatPrior(sPrior,
                                                            sTab);
         end;
    end;
  end;

  function MakeType(sType,
                    sPrior: string;
                    iTabWidth: integer): string;
  begin
    case StringToCaseSelect(sType,
                            ['Itemization',
                             'Enumeration',
                             'Left',
                             'Center',
                             'Right']) of
      0: begin // Itemization
           Result:=
             '\begin{itemize}' + #13 +
             MakeContent(sType,
                         sPrior,
                         iTabWidth) +
             '\end{itemize}';
         end;
      1: begin // Enumeration
           Result:=
             '\begin{enumerate}' + #13 +
             MakeContent(sType,
                         sPrior,
                         iTabWidth) +
             '\end{enumerate}';
         end;
      2: begin // Left
           Result:=
             '\begin{flushleft}' + #13 +
             MakeContent(sType,
                         sPrior,
                         iTabWidth) +
             '\end{flushleft}';
         end;
      3: begin // Center
           Result:=
             '\begin{center}' + #13 +
             MakeContent(sType,
                         sPrior,
                         iTabWidth) +
             '\end{center}';
         end;
      4: begin // Right
           Result:=
             '\begin{flushright}' + #13 +
             MakeContent(sType,
                         sPrior,
                         iTabWidth) +
             '\end{flushright}';
         end;
    end;
  end;

  procedure InsertLatex(iType: integer);
  var
    seEditor: TSynEdit;

    sPrior,
     sType: string;

    i,
      iTabWidth: integer;

    synSearchOptions: TSynSearchOptions;

  begin
    i:= FindTopWindow;

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
        SelText  := MakeType(sType,
                             sPrior,
                             iTabWidth);
      end
      else begin
        SelText:= MakeType(sType,
                           EmptyStr,
                           iTabWidth);
        CaretY := CaretY - 1;
        ExecuteCommand(ecLineStart,
                       #0,
                       nil);
        SearchEngine    := SynEditSearch;
        synSearchOptions:= [];
        SearchReplace('.',
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
    InsertLatex(Tag);
end;

procedure TfrmTinnMain.actCountExecute(Sender: TObject);

  function StripSpaces(s: string): string;
  var
    i,
     j,
     l: integer;

  begin
    i:= 1;
    j:= 1;
    l:= Length(s);

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

  function Seps(cTmp: Char): Boolean;
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

  function WordsCount(sTmp: string): longint;
  var
    i,
     iCount: longint;

  begin
    i     := 1;
    iCount:= 0;

    while (i <= Length(sTmp)) do begin
      while (i <= Length(sTmp)) and
            Seps(sTmp[i]) do inc(i);

      if (i <= Length(sTmp)) then begin
        inc(iCount);
        while (i <= Length(sTmp)) and
              (not Seps(sTmp[i])) do inc(i);
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
  if ((Self.MDIChildren[FindTopWindow] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then sTmp:= SelText
                else sTmp:= Text;

  dlg:= TfrmCount.Create(Self);

  with dlg do begin
    iChars:= Length(sTmp);

    if (sTmp <> EmptyStr) then iCharsStripSpaces:= Length(StripSpaces(sTmp))
                          else iCharsStripSpaces:= 0;

    dWords:= WordsCount(sTmp);
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

procedure TfrmTinnMain.actReloadLatexSymbolsExecute(Sender: TObject);
begin
  CheckLatex(True);
end;

procedure TfrmTinnMain.InsertLatexMath(sFunction: string;
                                       iCaretControl: integer);
var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= FindTopWindow;
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

procedure TfrmTinnMain.actLatexAlgebricFracExecute(Sender: TObject);

  function CountStrings(sTmp: string): integer;
  var
    slTmp: TStringList;

  begin
    try
      slTmp:= TStringList.Create;
      StrSplit(' ',
               sTmp,
               slTmp);
    finally
      Result:= slTmp.Count;
      FreeAndNil(slTmp);
    end;
  end;

  function FormatFrac(sTmp: string): string;
  var
    slTmp : TStringList;
    sArg1,
     sArg2: string;

  begin
    try
      slTmp:= TStringList.Create;
      
      StrSplit(' ',
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
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then begin
      if (CountStrings(SelText) = 2) then
        InsertLatexMath('\frac' +
                        FormatFrac(SelText),
                        0)
      else
        InsertLatexMath('\frac' +
                        FormatFrac(SelText),
                        -3);
    end
    else
      InsertLatexMath('\frac' +
                      FormatFrac(EmptyStr),
                      -3);
end;

procedure TfrmTinnMain.actLatexAlgebricSqrtExecute(Sender: TObject);

  function FormatSqrt(sTmp: string): string;
  begin
    Result:= '{' +
             sTmp +
             '}';
  end;

var
  seEditor: TSynEdit;

  i: integer;

begin
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then
      InsertLatexMath('\sqrt' +
                      FormatSqrt(SelText),
                      0)
    else
      InsertLatexMath('\sqrt' +
                      FormatSqrt(EmptyStr),
                      -1);
end;

procedure TfrmTinnMain.actLatexAlgebricSqrtNExecute(Sender: TObject);

  function CountStrings(sTmp: string): integer;
  var
    slTmp: TStringList;

  begin
    try
      slTmp:= TStringList.Create;
      StrSplit(' ',
               sTmp,
               slTmp);
    finally
      Result:= slTmp.Count;
      FreeAndNil(slTmp);
    end;
  end;

  function FormatSqrtN(sTmp: string): string;
  var
    slTmp : TStringList;
    sArg1,
     sArg2: string;

  begin
    try
      slTmp:= TStringList.Create;
      
      StrSplit(' ',
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
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if SelAvail then begin
      if (CountStrings(SelText) = 2) then
        InsertLatexMath('\sqrt' +
                        FormatSqrtN(SelText),
                        0)
      else
        InsertLatexMath('\sqrt' +
                        FormatSqrtN(SelText),
                        -3);
    end
    else
      InsertLatexMath('\sqrt' +
                      FormatSqrtN(EmptyStr),
                      -3);
end;

procedure TfrmTinnMain.actRContTermStartCloseExecute(Sender: TObject);

  procedure CloseRterm;
  begin
    if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Clear
                                  else frmRterm.synLog.Clear;

    stbMain.Panels[8].Text:= EmptyStr;


    with actRtermWarningError do begin
      Visible:= False;
      Checked:= False;
    end;

    frmRterm.cRterm.StopProcess;
    frmRterm.bRterm_Plus:= False;
    bRRequireKnitr:= False;
  end;

var
  sTmp: string;

  userOption: TModalResult;

begin
  if not Rterm_Running then begin
    // Will check the path of Rterm executable
    if (sPathRterm = EmptyStr) then begin
      if (MessageDlg('The preferred Rterm was not defined.' + #13 +
                     'Do you desire to set this now?',
                     mtConfirmation,
                     [mbYes, mbNo],
                     0) = mrYes) then begin

        bStartOptionsWithRPage:= True;

        actShowAppOptionsExecute(Self);
      end
      else Exit;
    end;

    if not FileExists(sPathRterm) or
       (ExtractFileExt(sPathRterm) <> '.exe') then begin
      sTmp:= sPathRterm;

      if (sTmp = EmptyStr) then sTmp:= 'Empty';

      MessageDlg(sTmp + #13 + #13 +
                 'The file above is not executable!' + #13 +
                 'Please, set Rterm path at: Options/Application/R/Path (R)/Rterm',
                 mtError,
                 [mbOk],
                 0);
      Exit;
    end;

    // Will open preferred Rterm
    if (RHistory = nil) then RHistory:= TRHistory.Create;

    CheckRterm;

    if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Clear
                                  else frmRterm.synLog.Clear;

    with frmRterm do begin
      synIO.Clear;

      iSynWithFocus:= 3;

      cRterm.RunProcess(sPathRterm +
                        ' ' +
                        sParRterm,
                        RWorkDir);
    end;

    bRRequireKnitr:= True;
  end
  else begin
    CheckRterm;

    if bRtermCloseWithoutAsk then CloseRterm
    else begin
      userOption:= MessageDlg('Save workspace image (Rhistory and Rdata)' + #13 +
                              'in the current R work directory?',
                              mtConfirmation,
                              [mbYes, mbNo, mbCancel],
                              0);

      case userOption of
        mrYes: begin
                 with frmRterm.synIO do begin
                   sTmp:= 'save.image()';
                   DoSend(sTmp);
                 end;

                 CloseRterm;
               end;

        mrNo: CloseRterm;

        mrCancel: begin
                    bRtermOptionCancel:= True;
                    Exit;
                  end;
      end;
    end;
  end;
end;

procedure TfrmTinnMain.SetInterfaceSize(frm: TForm;
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

procedure TfrmTinnMain.actRtermMaximizeExecute(Sender: TObject);
const
  iW = 13;   // experimental
  iH = 143;

begin
  if not GetFormVisible(frmRterm) then Exit;

  if GetFormVisible(frmTools) then HideDockForm(frmTools);
  actToolsVisible.Checked:= GetFormVisible(frmTools);

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmRterm)   then SetInterfaceSize(frmRterm, frmTinnMain.Width  - iW)  // Left
    else if TopDockPanel.ContainsControl(frmRterm)    then SetInterfaceSize(frmRterm, frmTinnMain.Height - iH)  // Top
    else if RightDockPanel.ContainsControl(frmRterm)  then SetInterfaceSize(frmRterm, frmTinnMain.Width  - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then SetInterfaceSize(frmRterm, frmTinnMain.Height - iH); // Bottom

  SetFocus_Main;
end;

procedure TfrmTinnMain.actRtermAutoHideExecute(Sender: TObject);
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

procedure TfrmTinnMain.actRtermDivideExecute(Sender: TObject);
const
  iW = 20;   // experimental
  iH = 74;

begin
  if not GetFormVisible(frmRterm) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmRterm)   then SetInterfaceSize(frmRterm, frmTinnMain.Width  div 2 - iW)  // Left
    else if TopDockPanel.ContainsControl(frmRterm)    then SetInterfaceSize(frmRterm, frmTinnMain.Height div 2 - iH)  // Top
    else if RightDockPanel.ContainsControl(frmRterm)  then SetInterfaceSize(frmRterm, frmTinnMain.Width  div 2 - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then SetInterfaceSize(frmRterm, frmTinnMain.Height div 2 - iH); // Bottom

  SetFocus_Main;
end;

procedure TfrmTinnMain.actRtermMinimizeExecute(Sender: TObject);
const
  iK = 20;

begin
  if not GetFormVisible(frmRterm) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmRterm)   then SetInterfaceSize(frmRterm, frmTinnMain.Width  div iK)  // Left
    else if TopDockPanel.ContainsControl(frmRterm)    then SetInterfaceSize(frmRterm, frmTinnMain.Height div iK)  // Top
    else if RightDockPanel.ContainsControl(frmRterm)  then SetInterfaceSize(frmRterm, frmTinnMain.Width  div iK)  // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then SetInterfaceSize(frmRterm, frmTinnMain.Height div iK); // Bottom

  SetFocus_Main;
end;

procedure TfrmTinnMain.actToolsMaximizeExecute(Sender: TObject);
const
  iW = 13;   // experimental
  iH = 143;

begin
  if not GetFormVisible(frmTools) then Exit;

  if GetFormVisible(frmRterm) then HideDockForm(frmRterm);
  actRtermVisible.Checked:= GetFormVisible(frmRterm);

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmTools)   then SetInterfaceSize(frmTools, frmTinnMain.Width  - iW)  // Left
    else if TopDockPanel.ContainsControl(frmTools)    then SetInterfaceSize(frmTools, frmTinnMain.Height - iH)  // Top
    else if RightDockPanel.ContainsControl(frmTools)  then SetInterfaceSize(frmTools, frmTinnMain.Width  - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmTools) then SetInterfaceSize(frmTools, frmTinnMain.Height - iH); // Bottom
end;

procedure TfrmTinnMain.actToolsAutoHideExecute(Sender: TObject);
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

procedure TfrmTinnMain.actToolsDivideExecute(Sender: TObject);
const
  iW = 20;   // experimental
  iH = 74;

begin
  if not GetFormVisible(frmTools) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmTools)   then SetInterfaceSize(frmTools, frmTinnMain.Width  div 2 - iW)  // Left
    else if TopDockPanel.ContainsControl(frmTools)    then SetInterfaceSize(frmTools, frmTinnMain.Height div 2 - iH)  // Top
    else if RightDockPanel.ContainsControl(frmTools)  then SetInterfaceSize(frmTools, frmTinnMain.Width  div 2 - iW)  // Right
    else if BottomDockPanel.ContainsControl(frmTools) then SetInterfaceSize(frmTools, frmTinnMain.Height div 2 - iH); // Bottom
end;

procedure TfrmTinnMain.actToolsMinimizeExecute(Sender: TObject);
const
  iK = 20;

begin
  if not GetFormVisible(frmTools) then Exit;

  with JvDockServer do
    if      LeftDockPanel.ContainsControl(frmTools)   then SetInterfaceSize(frmTools, frmTinnMain.Width  div iK)  // Left
    else if TopDockPanel.ContainsControl(frmTools)    then SetInterfaceSize(frmTools, frmTinnMain.Height div iK)  // Top
    else if RightDockPanel.ContainsControl(frmTools)  then SetInterfaceSize(frmTools, frmTinnMain.Width  div iK)  // Right
    else if BottomDockPanel.ContainsControl(frmTools) then SetInterfaceSize(frmTools, frmTinnMain.Height div iK); // Bottom
end;

procedure TfrmTinnMain.CheckIfFileFromDvi(sFile: string);
var
  iPos       : integer;
  sLineNumber,
   sTmp      : string;

begin
  iPos:= pos(';',
             sFile);
  if (iPos > 0) then begin
    sLineNumber:= copy(sFile,
                       iPos + 1,
                       Length(sFile));

    sFile:= copy(sFile,
                 0,
                 iPos - 1);

    // Clear complex path
    sTmp:= InvertString(sFile);
    iPos := pos(':',
                sTmp);
    if (iPos <> 0) then begin
      sTmp := copy(sTmp,
                   0,
                   iPos + 1);

      sFile:= InvertString(sTmp);
    end;

    if FileExists(trim(sFile)) then begin
      OpenFileIntoTinn(sFile,
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
  else if FileExists(trim(sFile)) then OpenFileIntoTinn(sFile);
end;

procedure TfrmTinnMain.OpenFileFromSearch;
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
    
    iPos:= pos('(',
               sTmp);
    
    if (iPos > 0) then begin
      iEnd:= pos('):',
                 sTmp);
    
      sLineNumber:= copy(sTmp,
                         iPos + 1,
                         ((iEnd - iPos) - 1));
    end;
  end;

  if FileExists(trim(sFile)) then OpenFileIntoTinn(sFile,
                                                   StrToIntDef(sLineNumber,
                                                               0))
                             else MessageDlg(trim(sFile) + #13 + #13 +
                                             'The file above was not found!',
                                             mtWarning,
                                             [mbOk],
                                             0);

  Sleep(iDelay div 2);

  seEditor:= nil;

  if (pgFiles.PageCount > 0) then
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
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

procedure TfrmTinnMain.pmenResultsOpenLinkClick(Sender: TObject);
begin
  OpenFileFromSearch;
end;

procedure TfrmTinnMain.actSearchExpandOneExecute(Sender: TObject);
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

procedure TfrmTinnMain.actSearchExpandAllExecute(Sender: TObject);
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

procedure TfrmTinnMain.actSearchCollapseOneExecute(Sender: TObject);
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

procedure TfrmTinnMain.actSearchCollapseAllExecute(Sender: TObject);
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


procedure TfrmTinnMain.synEditorDataCompletionCodeCompletion(Sender: TObject;
                                                             var Value: string;
                                                             Shift: TShiftState;
                                                             Index: Integer;
                                                             EndToken: Char);
begin
  with TSynCompletionProposal(Sender).Editor do
    CaretX:= CaretX;
end;

procedure TfrmTinnMain.actRtermVisibleExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  
  if GetFormVisible(frmRterm) then HideDockForm(frmRterm)
                              else begin
                                ShowDockForm(frmRterm);

                                SetInterfaceSize(frmRterm,         // It was necessary due to a bug in the component (hard to fix for simple users like me)
                                                 frmRterm.iSize);  // http://stackoverflow.com/questions/27696359/delphi-jedi-docking-storage-remember
                              end;

  actRtermVisible.Checked:= GetFormVisible(frmRterm);
end;

procedure TfrmTinnMain.actToolsVisibleExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then Exit;

  if GetFormVisible(frmTools) then HideDockForm(frmTools)
                              else begin
                                ShowDockForm(frmTools);

                                SetInterfaceSize(frmTools,         // It was necessary due to a bug in the component (hard to fix for simple users like me)
                                                 frmTools.iSize);  // http://stackoverflow.com/questions/27696359/delphi-jedi-docking-storage-remember
                              end;

  actToolsVisible.Checked:= GetFormVisible(frmTools);
end;

procedure TfrmTinnMain.actRtermTabsBottomExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdBottom;
  actRtermTabsBottom.Checked:= True;
end;

procedure TfrmTinnMain.actRtermTabsLeftExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdLeft;
  actRtermTabsLeft.Checked:= True;
end;

procedure TfrmTinnMain.actRtermTabsRightExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdRight;
  actRtermTabsRight.Checked:= True;
end;

procedure TfrmTinnMain.actRtermTabsTopExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;
  with frmRterm.pgRterm do
    TabsPosition:= fsdTop;
  actRtermTabsTop.Checked:= True;
end;

procedure TfrmTinnMain.actRtermWarningErrorExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then Exit;

  actRtermWarningError.Visible:= False;
  stbMain.Panels[8].Text:= EmptyStr; 

  ShowDockForm(frmRterm);
  if actRtermIOSplitRemove.Checked then frmRterm.pgRterm.ActivePage:= frmRterm.tbsLog
                                   else frmRterm.pgRterm.ActivePage:= frmRterm.tbsIO;

  actRtermVisible.Checked:= GetFormVisible(frmRterm);
end;

procedure TfrmTinnMain.actRtipInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then Exit;
  i:= FindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    DoTipInsert;

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);
end;

procedure TfrmTinnMain.actRVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsR do begin
    TabVisible:= not TabVisible;
    actRVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.actRtermIOSetFocusExecute(Sender: TObject);
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

procedure TfrmTinnMain.actRtermIOSplitHorizontalExecute(Sender: TObject);
var
  sPriorLog: string;

begin
  if Assigned(frmRterm.synLog2) then sPriorLog:= frmRterm.synLog2.Text
                                else sPriorLog:= frmRterm.synLog.Text;

  frmRterm.RtermSplit;
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
  bRtermSimple    := True;
  bRtermHorizontal:= True;
end;

procedure TfrmTinnMain.actRtermIOSplitVerticalExecute(Sender: TObject);
var
  sPriorLog: string;

begin
  if Assigned(frmRterm.synLog2) then sPriorLog:= frmRterm.synLog2.Text
                                else sPriorLog:= frmRterm.synLog.Text;
  
  frmRterm.RtermSplit(False);

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
  bRtermSimple    := True;
  bRtermHorizontal:= False;
end;

procedure TfrmTinnMain.actRtermIOSplitRemoveExecute(Sender: TObject);
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
  bRtermSimple:= False;
  UpdateRterm_Appearance;
  //frmRterm.TBToolbarRterm.Left:= 92;
end;

procedure TfrmTinnMain.actRtermLOGSetFocusExecute(Sender: TObject);
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

procedure TfrmTinnMain.actRtermEditorSetFocusExecute(Sender: TObject);
var
  i: integer;
  
begin
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
              WM_SETFOCUS,
              0,
              0);

  actRtermEditorSetFocus.Checked := True;
end;

procedure TfrmTinnMain.synIOClick(Sender: TObject);
begin
  actRtermIOSetFocus.Checked:= True;
end;

procedure TfrmTinnMain.synIOEnter(Sender: TObject);
begin
  actRtermIOSetFocus.Checked:= True;
end;

procedure TfrmTinnMain.actRtermSetIOSyntaxToTextExecute(Sender: TObject);
begin
  frmRterm.synIO.Highlighter:= dmSyn.synText_term;
  iIOSyntax:= 0;
  actRtermSetIOSyntaxToText.Checked:= True;
end;

procedure TfrmTinnMain.actRtermSetLOGSyntaxToTextExecute(Sender: TObject);
begin
  if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Highlighter:= dmSyn.synText_term;
  frmRterm.synLog.Highlighter:= dmSyn.synText_term;
  iLogSyntax:= 0;
  actRtermSetLogSyntaxToText.Checked:= True;
end;

procedure TfrmTinnMain.actRtermSetIOSyntaxToRExecute(Sender: TObject);
begin
  frmRterm.synIO.Highlighter:= dmSyn.synR_term;
  iIOSyntax:= 1;
  actRtermSetIOSyntaxToR.Checked:= True;
end;

procedure TfrmTinnMain.actRtermSetLOGSyntaxToRExecute(Sender: TObject);
begin
  if Assigned(frmRterm.synLog2) then frmRterm.synLog2.Highlighter:= dmSyn.synR_term;
  frmRterm.synLog.Highlighter:= dmSyn.synR_term;
  iLogSyntax:= 1;
  actRtermSetLogSyntaxToR.Checked:= True;
end;

procedure TfrmTinnMain.actRtermIOClearExecute(Sender: TObject);
var
  i: integer;

begin
  stbMain.Panels[8].Text:= EmptyStr;
  with actRtermWarningError do begin
    Visible:= False;
    Checked:= False;
  end;
  with frmRterm.synIO do begin
    for i:= 0 to 9 do
      ClearBookMark(i);
    Clear;
  end;
  DoClearConsole;
end;

procedure TfrmTinnMain.actRtermIOHistoryNextExecute(Sender: TObject);
begin
  if not Rterm_Running then Exit;
  with frmRterm do begin
    synIO.CaretY:= synIO.Lines.Count;
    if (synIO.SelText <> EmptyStr) then Exit;
    if bRterm_Plus then synIO.LineText:= '+ ' +
                                         RHistory.GetNext
    else
      if bRUnderDebug_Function or
         bRUnderDebug_Package then synIO.LineText:= frmRterm.sRDebugPrefix +
                                                    ' ' +
                                                    RHistory.GetNext
                              else synIO.LineText:= '> ' +
                                                    RHistory.GetNext;
    synIO.ExecuteCommand(ecLineEnd,
                         #0,
                         nil);
   end;
end;

procedure TfrmTinnMain.actRtermIOHistoryPriorExecute(Sender: TObject);
begin
  if not Rterm_Running then Exit;
  
  with frmRterm do begin
    synIO.CaretY:= synIO.Lines.Count;
    if (synIO.SelText <> EmptyStr) then Exit;
    if bRterm_Plus then synIO.LineText:= '+ ' +
                                         RHistory.GetPrior
    else
      if bRUnderDebug_Function or
         bRUnderDebug_Package then synIO.LineText:= frmRterm.sRDebugPrefix +
                                                    ' ' +
                                                    RHistory.GetPrior
                              else synIO.LineText:= '> ' +
                                                    RHistory.GetPrior;

    synIO.ExecuteCommand(ecLineEnd,
                         #0,
                         nil);
   end;
end;

procedure TfrmTinnMain.actRtermLOGClearExecute(Sender: TObject);
var
  i    : integer;
  seLog: TSynEdit;

begin
  stbMain.Panels[8].Text:= EmptyStr;
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

procedure TfrmTinnMain.actRtermIOandLOGClearExecute(Sender: TObject);
begin
  actRtermIOClearExecute(nil);
  actRtermLogClearExecute(nil);
end;

procedure TfrmTinnMain.actRtermIOPrintExecute(Sender: TObject);
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
      frmTinnMain.Repaint;
    end;
  end;
end;

procedure TfrmTinnMain.actRtermLOGPrintExecute(Sender: TObject);
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
      frmTinnMain.Repaint;
    end;
  end;
end;

procedure TfrmTinnMain.actRtermIOSaveExecute(Sender: TObject);
begin
  if FileExists(sRIOSaved) then frmRterm.synIO.Lines.SaveToFile(sRIOSaved)
                           else actRtermIOSaveAsExecute(nil);
end;

procedure TfrmTinnMain.actRtermLOGSaveExecute(Sender: TObject);
begin
  if FileExists(sRLogSaved) then frmRterm.synIO.Lines.SaveToFile(sRLogSaved)
                            else actRtermLogSaveAsExecute(nil);
end;

procedure TfrmTinnMain.actRtermIOSaveAsExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp:= RemoveFileExtension(pgFiles.ActivePage.Caption);
  
  FileSaveGeneric(sTmp +
                  '_io.txt',
                  frmRterm.synIO);
end;

procedure TfrmTinnMain.actRtermLOGSaveAsExecute(Sender: TObject);
var
  sTmp : string;
  seLog: TSynEdit;

begin
  sTmp:= RemoveFileExtension(pgFiles.ActivePage.Caption);
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;

  FileSaveGeneric(sTmp + 
                  '_log.txt',
                  seLog);
end;

procedure TfrmTinnMain.FileSaveGeneric(sFile: string;
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
      if (MessageDlg(sFile + #13 + #13 +
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
    sWorkingDir:= StripFileName(sFile);
  end;

  if (frmRterm.pgRterm.ActivePage = frmRterm.tbsIO) then sRIOSaved := sFile
                                                    else sRLogSaved:= sFile;
  sSaveAsFileExt:= EmptyStr;
  sdMain.Filter := slFilters.Text;
end;

procedure TfrmTinnMain.actRSimpleDefaultExecute(Sender: TObject);
begin
  actRSimpleDefault.Checked:= True;
  if (pgFiles.PageCount > 0) then (Self.MDIChildren[FindTopWindow] as tfrmEditor).FormActivate(nil);
end;

procedure TfrmTinnMain.actRComplexDefaultExecute(Sender: TObject);
begin
  actRComplexDefault.Checked:= True;
  if (pgFiles.PageCount > 0) then (Self.MDIChildren[FindTopWindow] as tfrmEditor).FormActivate(nil);
end;

procedure TfrmTinnMain.actTextDefaultExecute(Sender: TObject);
begin
  actTextDefault.Checked:= True;
  if (pgFiles.PageCount > 0) then (Self.MDIChildren[FindTopWindow] as tfrmEditor).FormActivate(nil);
end;

procedure TfrmTinnMain.actRtermSaveWorkspaceExecute(Sender: TObject);
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
      if (MessageDlg(sFile + #13 + #13 +
                     'Do you want to overwrite this file?',
                     mtConfirmation,
                     [mbYes, mbCancel],
                     0) <> idYes) then Exit;

      DeleteFile(sFile);
    end;

    sTmp:= 'save.image(''' +
                       DosPathToUnixPath(sFile) +
                       ''')';
    DoSend(sTmp);
  end;
  sdMain.Filter:= slFilters.Text;
end;

procedure TfrmTinnMain.actRtermSaveHistoryExecute(Sender: TObject);
var
  sFile: string;

begin
  sdMain.InitialDir:= sWorkingDir;
  sdMain.fileName:= '.Rhistory';
  sdMain.Filter  := '.Rhistory';

  if sdMain.Execute then begin
    sFile:= sdMain.fileName;

    if FileExists(sFile) then begin
      if (MessageDlg(sFile + #13 + #13 +
                     'Do you want to overwrite this file?',
                     mtConfirmation,
                     [mbYes, mbCancel],
                     0) <> idYes) then Exit;

      DeleteFile(sFile);
    end;

    if RHistory.SaveToFile(sFile) then
      MessageDlg(sFile + #13 + #13 +
                 'The R history was saved to the file above!',
                 mtInformation,
                 [mbOk],
                 0);
  end;
  sdMain.Filter:= slFilters.Text;
end;

procedure TfrmTinnMain.actRtermLoadWorkspaceExecute(Sender: TObject);
var
  sFile,
   sTmp : string;

begin
  odMain.InitialDir:= sWorkingDir;
  odMain.fileName:= '.RData';
  odMain.Filter:= slFilters.Text;

  if odMain.Execute then begin
    sFile:= odMain.fileName;
  
    sTmp := 'load(''' +
                  DosPathToUnixPath(sFile) +
                  ''')';
  
    DoSend(sTmp);
  end;
end;

procedure TfrmTinnMain.actRtermLoadHistoryExecute(Sender: TObject);
var
  sFile: string;

begin
  odMain.InitialDir:= sWorkingDir;
  odMain.fileName:= '.Rhistory';
  odMain.Filter:= slFilters.Text;

  if odMain.Execute then begin
    sFile:= odMain.fileName;
  
    if RHistory.LoadFromFile(sFile) then
      MessageDlg(sFile + #13 + #13 +
                 'The R history was loaded from the file above!',
                 mtInformation,
                 [mbOk],
                 0);
  end;
end;

procedure TfrmTinnMain.actDataShortcutsVisibleExecute(Sender: TObject);
begin
  with frmTools.tbsShortcuts do begin
    TabVisible:= not TabVisible;
    actDataShortcutsVisible.Checked:= TabVisible;
  end;
end;

procedure TfrmTinnMain.SetFocus_Main;
var
  i: integer;

begin
  case iSynWithFocus of
    1..2: begin
            i:= FindTopWindow;
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

function TfrmTinnMain.GetFocus: integer;
var
  seLog: TSynEdit;

begin
  Result:= 0;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  // Editors
  if (pgFiles.PageCount <> 0) then
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do begin
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

procedure TfrmTinnMain.actFontIncreaseExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin  // Font.Size < 50
  iFocus:= GetFocus;
  
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          if (Font.Size < 50) then begin
            Font.Size:= Font.Size + 1;
            UpdateHexViewer;
          end;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          if (Font.Size < 50) then begin
            Font.Size:= Font.Size + 1;
            UpdateHexViewer;
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

procedure TfrmTinnMain.actFontDecreaseExecute(Sender: TObject);
var
  iFocus: integer;
  seLog : TSynEdit;

begin  //Font.Size > 02
  iFocus:= GetFocus;
  if Assigned(frmRterm.synLog2) then seLog:= frmRterm.synLog2
                                else seLog:= frmRterm.synLog;
  case iFocus of
     // synEditor1
     1: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor do
          if (Font.Size > 02) then begin
            Font.Size:= Font.Size - 1;
            UpdateHexViewer;
          end;
     // synEditor2
     2: with (Self.MDIChildren[FindTopWindow] as TfrmEditor).synEditor2 do
          if (Font.Size > 02) then begin
            Font.Size:= Font.Size - 1;
            UpdateHexViewer;
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

procedure TfrmTinnMain.actFormatRExecute(Sender: TObject);
var
  seEditor : TSynEdit;

  sTmp,
   sToSend,
   sSel    : string;

  i: integer;

  procedure SendToRReformat(bFile: boolean);
  begin
    sTmp:= 'tidy_source(' +
           sToSend +
           ', ' +
           'file=' +
           '.trPaths[9]' +
           ', ' +
           sFormatR +
           ')';

    DoSend(sTmp);

    if bFile then  // Do not remove from the end of the procedure!
      iRFormatted:= 0
    else
      iRFormatted:= 1;
  end;

  // File to reformat
  procedure RReformatFile;
  begin
    sToSend:= GetFileToReformat;
    if (sToSend = EmptyStr) then Exit;
    SendToRReformat(True);
  end;

  // Selection to reformat
  procedure RReformatSelection;
  begin
    with (Self.MDIChildren[i] as TfrmEditor) do
      if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                     else seEditor:= synEditor2;

    with seEditor do begin
      if SelAvail then begin
        sSel:= SelText;
      end;

      sToSend:= GetSelectionToReformat(sSel);
      if (sToSend = EmptyStr) then Exit;
      SendToRReformat(False);
    end;
  end;

begin
  i:= FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if sActiveEditor = 'synEditor' then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    if not SelAvail then RReformatFile
                    else RReformatSelection;
  end;
end;

function TfrmTinnMain.CheckConnection: boolean;
begin
  if IsConnected then Result:= True
  else begin
    with stbMain do begin
      Panels[7].Text:= 'Warning';
      Panels[8].Text:= 'Please, check your internet connection!';
    end;
    Application.ProcessMessages;

    Result:= False;
  end;
end;

procedure TfrmTinnMain.UpdateHexViewer;

  procedure SetMode(sMode: string);
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

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      seTmp:= SynEditor;

    seTmp.Lines.SaveToStream(msHexViewer);

    with frmTools.ATBinHex do begin
      // Appearance
      Font      := seTmp.Font;
      FontGutter:= seTmp.Gutter.Font;

      // It is necessary to know the file encoding
      sTmp:= GetSaveFormat(seTmp.Lines);

      // It is necessary some retriction in the interface
      case StringToCaseSelect(sTmp,
                              ['ANSI',
                               'UTF-8',
                               'UTF16-LE',
                               'UTF16-BE']) of
        0: begin
             TextEncoding:= vEncANSI;
             SetMode('ANSI');
           end;
        1: begin
             TextEncoding:= vEncUTF8;
             SetMode('UTF-8');
           end;
        2: begin
             TextEncoding:= vEncUnicodeLE;
             SetMode('UTF16-LE');
           end;
        3: begin
             TextEncoding:= vEncUnicodeBE;
             SetMode('UTF16-BE');
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
end.

(*
procedure TfrmTinnMain.CheckCapsLockBeginning;
begin
  bCapsLock:= False;
  GetKeyboardState(ksState);
  if (ksState[VK_CAPITAL] > 0) then begin  // Turn Caps Lock OFF
    bCapsLock:= True;
    // Simulate a "CAPS LOCK" key release
    Keybd_Event(VK_CAPITAL, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    // Simulate a "CAPS LOCK" key press
    Keybd_Event(VK_CAPITAL, 0, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;
*)

(*
procedure TfrmTinnMain.CheckCapsLockEnd;
begin
  if bCapsLock then begin  // Turn Caps Lock ON
    // Simulate a "CAPS LOCK" key release
    Keybd_Event(VK_CAPITAL, 1, KEYEVENTF_EXTENDEDKEY or 0, 0);
    // Simulate a "CAPS LOCK" key press
    Keybd_Event(VK_CAPITAL, 1, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
  end;
end;
*)

(*
procedure RunDosInMemo(sToSend: string; memTmp:TMemo);
  const
    ReadBuffer = 2400;

  var
    Security   : TSecurityAttributes;
    ReadPipe,
     WritePipe : THandle;
    start      : TStartUpInfo;
    ProcessInfo: TProcessInformation;
    Buffer     : Pchar;
    BytesRead  : DWord;
    Apprunning : DWord;

  begin
    With Security do begin
      nlength:= SizeOf(TSecurityAttributes);
      binherithandle:= true;
      lpsecuritydescriptor:= nil;
    end;
    if Createpipe (ReadPipe, WritePipe, @Security, 0) then begin
      Buffer:= AllocMem(ReadBuffer + 1);
      FillChar(Start, Sizeof(Start), #0);
      start.cb:= SizeOf(start);
      start.hStdOutput:= WritePipe;
      start.hStdInput:= ReadPipe;
      start.dwFlags:= STARTF_USESTDHANDLES +
                      STARTF_USESHOWWINDOW;
      start.wShowWindow:= SW_HIDE;

    if CreateProcess(nil,
                     PChar(sToSend),
                     @Security,
                     @Security,
                     //true,
                     False,
                     CREATE_NEW_CONSOLE or
                     NORMAL_PRIORITY_CLASS,
                     nil,
                     nil,
                     start,
                     ProcessInfo)

    then begin
      repeat
        Apprunning:= WaitForSingleObject(ProcessInfo.hProcess, 100);
        Application.ProcessMessages;
      until (Apprunning <> WAIT_TIMEOUT);

      repeat
        BytesRead:= 0;
        ReadFile(ReadPipe,
                 Buffer[0],
                 ReadBuffer,
                 BytesRead,
                 nil);
        Buffer[BytesRead]:= #0;
        OemToAnsi(Buffer, Buffer);
        memTmp.Text:= memTmp.text + string(Buffer);
      until (BytesRead < ReadBuffer);
    end;
    FreeMem(Buffer);
    CloseHandle(ProcessInfo.hProcess);
    CloseHandle(ProcessInfo.hThread);
    CloseHandle(ReadPipe);
    CloseHandle(WritePipe);
  end;
end;
*)

(*
procedure TfrmTinnMain.actRContPacInstTinnRcomExecute(Sender: TObject);
var
  sTmp,
   sPath: string;
  i,
   j: integer;
  {
  function CheckPackage(sPkg: string): Boolean;
  begin
    Result:= DirectoryExists(sPersonalR_Folder +
                             \sPkg);
  end;
  }

  procedure InstallPackage(sName: string);
  begin
    // Will install the package
    sTmp:= 'install.packages(' +
           '''' +
           sName +
           '''' +
           ', ' +
           'repos=''http://cran.at.r-project.org/'')';

    DoSend(sTmp);
    stbMain.Panels[7].Text:= 'Please, wait...';
    stbMain.Panels[8].Text:= 'Installing package: ' +
                             sName;

    Application.ProcessMessages;
  end;

begin
{
  // Install all dependences of TinnRcom
  InstallPackage('R2HTML');
  InstallPackage('svSocket');
  InstallPackage('Hmisc');
  InstallPackage('formatR');
}
  if (CheckConnection = False) then Exit;
  Screen.Cursor:= crHourglass;

  try
    tRRuning.Enabled:= False;  // It is important!
    sPath:= (sPathTmp) +
            '\TinnRcom_1.0-13.tar.gz''';

    sTmp:= 'download.file(''http://nbcgib.uesc.br/lec/download/R/TinnRcom_1.0-13.tar.gz'', ' +
                          'destfile=''' +
                          DosPathToUnixPath(sPath) +
                          ')';

    stbMain.Panels[7].Text:= 'Please, wait...';
    stbMain.Panels[8].Text:= 'Downloading package: TinnRcom';
    Application.ProcessMessages;

    DoSend(sTmp);

{
    i:= 1;
    repeat
      Sleep(5*iDelay);

      if FileExists(sPathTmp +
                    '\TinnRcom') then begin
        stbMain.Panels[7].Text:= 'Done!';
        stbMain.Panels[8].Text:= 'Download package: TinnRcom';
        Application.ProcessMessages;
        Break;
      end
      else inc(i);
    until (i = 20);
}

    {
    if (RtermRunning) and
       (not frmRTerm.cRterm.bRtermReady) then begin
      ShowMessage('Sorry, the dowload was not possible!');
      Exit;
    end
    else Sleep(10*iDelay);
}

    sTmp:= 'install.packages(''' +
                             DosPathToUnixPath(sPath) +
                             ', ' +
                             'repos=NULL, ' +
                             'type=''source'')';

    stbMain.Panels[7].Text:= 'Please, wait...';
    stbMain.Panels[8].Text:= 'Installing package: TinnRcom';
    Application.ProcessMessages;

    DoSend(sTmp);

    i:= 1;
    repeat
      Sleep(5*iDelay);

      for j:= 0 to (slRLibPaths.Count - 1) do
        if DirectoryExists(slRLibPaths.Strings[j] +
                           '\TinnRcom') then begin
          bRTinnRcom_Installed:= True;
          Break;
        end;

      if (bRTinnRcom_Installed = True) then begin
        stbMain.Panels[7].Text:= 'Done!';
        stbMain.Panels[8].Text:= 'Installed package: TinnRcom';
        Application.ProcessMessages;
        Break;
      end;
      inc(i);
    until (i = 20);

    if (bRTinnRcom_Installed) then begin
      stbMain.Panels[7].Text:= 'Done!';
      stbMain.Panels[8].Text:= 'Installed package: TinnRcom';
      Application.ProcessMessages;
    end
    else begin
      stbMain.Panels[7].Text:= 'Error!';
      stbMain.Panels[8].Text:= 'Not installed package: TinnRcom';
      Application.ProcessMessages;
    end;
  finally
    tRRuning.Enabled:= True;
    GetTinnRcom_Info;
    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
  end;
end;
*)

(*
procedure TfrmTinnMain.TinnRcom_Load;
var
  sTmp: string;

begin
  if (not bRTinnRcom_Installed) or
     (not bRTinnRcom_Load) or
     (bRTinnRcom_Loaded) or
     (mrTinnRcom_Install = mrNo) then Exit;

  Screen.Cursor:= crHourglass;

  // Will load TinnRcom
  if Rterm_Running and
     (not frmRTerm.cRterm.bRterm_Ready) then Exit
                                        else Sleep(10*iDelay);

  sTmp:= 'library(TinnRcom)';
  DoSend(sTmp);
  bRTinnRcom_Loaded:= True;

  if Rterm_Running then frmRTerm.cRterm.bRterm_Ready:= False;
  Screen.Cursor:= crDefault;
end;
*)

(* // Install TinnRcom from TinnRcom_X.X-X.tar.gz
procedure TfrmTinnMain.actRContPacInstTinnRcomExecute(Sender: TObject);

  function IsPackageInstalled(sName: string): boolean;
  var
    i,
     j: integer;

  begin
    Result:= False;

    i:= 1;
    repeat
      Sleep(5*iDelay);

      for j:= 0 to (slRLibPaths.Count - 1) do
        if DirectoryExists(slRLibPaths.Strings[j] +
                           sName) then begin
          Result:= True;
          Exit;
        end;

      inc(i);
    until (i = 100);
  end;

  procedure InstallPackage(var sName: string);
  var
    sTmp,
     sDepends,
     sFull,
     sFilePath,
     sToSend,
     sMirror  : string;

  begin
    // Will install the package
    sTmp:= 'install.packages(' +
           '''' +
           sName +
           '''' +
           ', ' +
           'repos=NULL' +
           ', ' +
           'type=''source''' +
           ')';

    sDepends:= FileToString(sUtilsOrigin +
                           '\Rinstall.R');

    sMirror:= 'options(repos=' +
              '''' +
              sRmirror_Default +
              '''' +
              ')';

    sDepends:= StringReplace(sDepends,
                             '%repos',
                             sMirror,
                             []);

    sFull:= sDepends + #13 +
            sTmp;

    sFilePath:= sPathTmp +
                '\fTmp.R';

    if FileSaveFast(sFilePath,
                    sFull) then sToSend:= 'source(' +
                                          '''' +
                                          DosPathToUnixPath(sFilePath) +
                                          '''' +
                                          ')';

    DoSend(sToSend);

    stbMain.Panels[7].Text:= 'Please, wait...';
    stbMain.Panels[8].Text:= 'Installing package: ' +
                             sName;

    Application.ProcessMessages;
  end;

var
  i         : integer;
  sToInstall,
   sLatest  : string;
  uOption   : TModalResult;
  srTmp     : TSearchRec;
  bNot      : boolean;

const
  sName = '\TinnRcom';

begin
  if (CheckConnection = False) then Exit;
  Screen.Cursor:= crHourglass;

  tRRuning.Enabled:= False;  // It is important!

  //uOption:= mrNo;
  bNot   := False;

  // The user can be more than one source of the package.
  // So will install the latest version
  sLatest:= 'TinnRcom_00.00-00.tar.gz';

  try
    // Try to find the source of TinnRcom package
    if FindFirst(sPathTinnRcom +
                 '\TinnRcom_*',
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

    if (sLatest = 'TinnRcom_0.0-0.tar.gz') then begin
      MessageDlg(sPathTinnRcom + '\' + #13 + #13 +
                 'It was not possible to found a valid version of TinnRcom package in the path above.' + #13 + #13 +
                 'If it was manual (or accidentally) removed, please make a dowload and try it again!',
                 mtError,
                 [mbOk],
                 0);
      bNot:= True;
      Exit;
    end;

    // TinnRcom package
    sToInstall:= DosPathToUnixPath(sPathTinnRcom +
                                   '\' +
                                   sLatest);

    if not Assigned(slRLibPaths) then begin
      MessageDlg('The necessary information about ''TinnRcom package'' from R are not available.' + #13 + #13 +
                 'Please, enable it at: ''Options/Application/R/Basic/Get information/TinnRcom (package)''!',
                 mtWarning,
                 [mbOk],
                 0);
      Exit;
    end;

    for i:= 0 to (slRLibPaths.Count - 1) do
      if DirectoryExists(slRLibPaths.Strings[i] +
                         sName) then begin
        uOption:= MessageDlg('Package to install: '+
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

    InstallPackage(sToInstall);

    bRTinnRcom_Installed:= IsPackageInstalled(sName);

    if (bRTinnRcom_Installed) then begin
      Sleep(30*iDelay);  // R is not fast to install TinnRcom package
      stbMain.Panels[7].Text:= 'Done!';
      stbMain.Panels[8].Text:= 'Installed package: TinnRcom';
      Application.ProcessMessages;
    end
    else begin
      stbMain.Panels[7].Text:= 'Error!';
      stbMain.Panels[8].Text:= 'Not installed package: TinnRcom';
      Application.ProcessMessages;
    end;
  finally
    tRRuning.Enabled:= True;

    if (not bNot) then
      if bRTinnRcom_Installed then GetTinnRcom_Info;

    Screen.Cursor:= crDefault;
    Application.ProcessMessages;
  end;
end;


procedure TfrmTinnMain.actRExplorerExpHtmlExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'trExport(''' +
         frmTools.lvRexplorer.Selected.Caption +
         '''' +
         ', ' +
         'type=''html'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExpTeXExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (frmTools.lvRexplorer.Selected = nil) then Exit;
  sTmp:= 'trExport(''' +
         frmTools.lvRexplorer.Selected.Caption +
         '''' +
         ', ' +
         'type=''latex'')';
  DoSend(sTmp);
end;
*)
