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

unit ufrmTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdActns, ActnList, Grids, DBGrids, DBCtrls, StdCtrls,
  SynEdit, SynEditTypes, SynEditSearch, JvExForms,
  JvCustomItemViewer, JvImagesViewer, ToolWin, TB2Item, TB2Dock, TB2Toolbar,
  FileCtrl, JvDriveCtrls, JvExStdCtrls, JvListBox, JvCombobox, Buttons,
  ShellCtrls, ExtCtrls, JvDockTree, JvDockControlForm, 
  JvComponentBase, SynEditKeyCmds, JvgPage, Clipbrd, JvExControls,
  JvPoweredBy, JvExComCtrls, JvHotKey, SynEditMiscClasses, JvStatusBar,
  JvExButtons, JvBitBtn, Mask, ATBinHex, JvDBControls, TB2ExtItems;

type
  TfrmTools = class(TForm)
    ATBinHex: TATBinHex;
    Basic: TTBSubmenuItem;
    bbtExplorerAddFavorites: TBitBtn;
    bbtExplorerRemoveFavorites: TBitBtn;
    bbtREnvironmentRefresh: TBitBtn;
    bbtRExplorerRefresh: TBitBtn;
    bbtRFilterRefresh: TBitBtn;
    bbtWinExplorerFilterRefresh: TBitBtn;
    bbtWinExplorerRefresh: TBitBtn;
    bbtWorkExplorerFileterRefresh: TBitBtn;
    bbtWorkExplorerRefresh: TBitBtn;
    cbbToolsREnvironment: TComboBox;
    cbbToolsRExplorer: TComboBox;
    cbComAutoDetect_Language: TCheckBox;
    cbComPriority_Line: TCheckBox;
    cbExplorerFavorites: TComboBox;
    Collapse: TTBSubmenuItem;
    dbCompletionMemo: TDBMemo;
    dbeRmirrorsCode: TDBEdit;
    dbeRmirrorsHost: TDBEdit;
    dbeRmirrorsURL: TDBEdit;
    dbgComments: TDBGrid;
    dbgCompletion: TDBGrid;
    dbgRcard: TDBGrid;
    dbgRmirrors: TDBGrid;
    dbgApp_Shortcuts: TDBGrid;
    dbRcardMemo: TDBMemo;
    dbApp_ShortcutsMemo: TDBMemo;
    edToolsRExplorerFilter: TEdit;
    edWinExplorerFilter: TEdit;
    edWorkExplorerFilter: TEdit;
    Expand: TTBSubmenuItem;
    fcbbToolsWinExplorer: TFilterComboBox;
    fcbbToolsWorkExplorer: TFilterComboBox;
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
    GroupBox22: TGroupBox;
    GroupBox23: TGroupBox;
    GroupBox24: TGroupBox;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    GroupBox27: TGroupBox;
    GroupBox28: TGroupBox;
    GroupBox29: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    imgShortcut: TImage;
    JvDBNavigator1: TJvDBNavigator;
    JvDBNavigator2: TJvDBNavigator;
    JvDBNavigator3: TJvDBNavigator;
    JvDBNavigator4: TJvDBNavigator;
    JvDBNavigator5: TJvDBNavigator;
    jvdcWinExplorer: TJvDriveCombo;
    jvdcWorkExplorer: TJvDriveCombo;
    jvdlbWinExplorer: TJvDirectoryListBox;
    jvdlbWorkExplorer: TJvDirectoryListBox;
    jvflbWinExplorer: TJvFileListBox;
    jvflbWorkExplorer: TJvFileListBox;
    jvivAccents: TJvImagesViewer;
    jvivArrowBoth: TJvImagesViewer;
    jvivArrowBox: TJvImagesViewer;
    jvivArrowDown: TJvImagesViewer;
    jvivArrowLeft: TJvImagesViewer;
    jvivArrowRight: TJvImagesViewer;
    jvivArrowSloped: TJvImagesViewer;
    jvivArrowUp: TJvImagesViewer;
    jvivBar: TJvImagesViewer;
    jvivBracket: TJvImagesViewer;
    jvivDot: TJvImagesViewer;
    jvivGeometryAngle: TJvImagesViewer;
    jvivGeometryBox: TJvImagesViewer;
    jvivGeometryCircle: TJvImagesViewer;
    jvivGeometryDiamond: TJvImagesViewer;
    jvivGeometryLine: TJvImagesViewer;
    jvivGeometryMisc: TJvImagesViewer;
    jvivGeometryStar: TJvImagesViewer;
    jvivGeometryTriangle: TJvImagesViewer;
    jvivGeometryVar: TJvImagesViewer;
    jvivGreekLower: TJvImagesViewer;
    jvivGreekMisc: TJvImagesViewer;
    jvivGreekUpper: TJvImagesViewer;
    jvivGreekVar: TJvImagesViewer;
    jvivMathFunction: TJvImagesViewer;
    jvivMathLogical: TJvImagesViewer;
    jvivMathMisc: TJvImagesViewer;
    jvivMathSet: TJvImagesViewer;
    jvivMathVar: TJvImagesViewer;
    jvivMisc: TJvImagesViewer;
    jvivNegation: TJvImagesViewer;
    jvivOperator: TJvImagesViewer;
    jvivRelation: TJvImagesViewer;
    jvivSkyAstrology: TJvImagesViewer;
    jvivSkySolar: TJvImagesViewer;
    jvivSkyVar: TJvImagesViewer;
    jvivUserCustom: TJvImagesViewer;
    JvPoweredByJCL1: TJvPoweredByJCL;
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
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lbCompletion: TListBox;
    lbCountries: TListBox;
    lbRcard: TListBox;
    lbApp_Shortcuts: TListBox;
    lvRexplorer: TListView;
    memIniLog: TMemo;
    memSpell: TMemo;
    N102: TTBSeparatorItem;
    N34: TTBSeparatorItem;
    N37: TTBSeparatorItem;
    N38: TTBSeparatorItem;
    N43: TTBSeparatorItem;
    N44: TTBSeparatorItem;
    n45: TTBSeparatorItem;
    N47: TTBSeparatorItem;
    N56: TTBSeparatorItem;
    N59: TTBSeparatorItem;
    pan: TPanel;
    panCompletion: TPanel;
    panCountries: TPanel;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel2: TPanel;
    Panel20: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    panProject: TPanel;
    panRCard: TPanel;
    panRcard1: TPanel;
    panRcard3: TPanel;
    panRcard4: TPanel;
    panRExplorer: TPanel;
    panRFilter: TPanel;
    panApp_Shortcuts: TPanel;
    panWinExplorer: TPanel;
    panWinExplorer1: TPanel;
    panWorkExplorer: TPanel;
    panWorkExplorer2: TPanel;
    panWorkExplorer3: TPanel;
    pgDatabase: TJvgPageControl;
    pgLatex: TJvgPageControl;
    pgMarkup: TJvgPageControl;
    pgMisc: TJvgPageControl;
    pgR: TJvgPageControl;
    pgResults: TJvgPageControl;
    pgTools: TJvgPageControl;
    pgTxt2tags: TJvgPageControl;
    pmenFiles: TTBSubmenuItem;
    pmenFilesAdd: TTBItem;
    pmenFilesAddCurrent: TTBItem;
    pmenFilesCloseAll: TTBItem;
    pmenFilesCloseAllOfGroup: TTBItem;
    pmenFilesDeleteAllOfGroup: TTBItem;
    pmenFilesDeleteAllOfProject: TTBItem;
    pmenFilesDeleteCurrent: TTBItem;
    pmenFilesOpenAll: TTBItem;
    pmenFilesOpenAllOfGroup: TTBItem;
    pmenGroup: TTBSubmenuItem;
    pmenGroupDeleteAll: TTBItem;
    pmenGroupDeleteCurrent: TTBItem;
    pmenGroupNew: TTBItem;
    pmenGroupRename: TTBItem;
    pmenProject: TTBSubmenuItem;
    pmenProjectClose: TTBItem;
    pmenProjectDeleteCurrent: TTBItem;
    pmenProjectSave: TTBItem;
    pmenProjectSaveAs: TTBItem;
    pmenProjNew: TTBItem;
    pmenProjOpen: TTBItem;
    pmenProjOpenDemo: TTBItem;
    rgHexViewerMode: TRadioGroup;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    Splitter1: TSplitter;
    splRcard: TSplitter;
    splRExplorer: TSplitter;
    splShortcuts: TSplitter;
    splWindows: TSplitter;
    splWork: TSplitter;
    stbProject: TStatusBar;
    stbRexplorer: TStatusBar;
    stbRMirrors: TStatusBar;
    stbSearch: TStatusBar;
    TBControlItem1: TTBControlItem;
    TBDLatex: TTBDock;
    TBDock1: TTBDock;
    TBDock2: TTBDock;
    TBDProject: TTBDock;
    TBDRcard: TTBDock;
    TBDRexplorer: TTBDock;
    TBDSearch: TTBDock;
    TBD_App_Shortcuts: TTBDock;
    TBEditProject: TTBItem;
    tbiFont: TTBItem;
    tbiFormat: TTBItem;
    tbiHeader: TTBItem;
    TBItem1: TTBItem;
    TBItem10: TTBItem;
    TBItem100: TTBItem;
    TBItem106: TTBItem;
    TBItem107: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem2: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    tbiHelp_Shortcut: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    tbiAppShortcuts_Edit: TTBItem;
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
    TBItem46: TTBItem;
    TBItem47: TTBItem;
    TBItem5: TTBItem;
    TBItem59: TTBItem;
    TBItem6: TTBItem;
    TBItem60: TTBItem;
    TBItem61: TTBItem;
    TBItem62: TTBItem;
    TBItem63: TTBItem;
    TBItem64: TTBItem;
    TBItem65: TTBItem;
    TBItem66: TTBItem;
    TBItem67: TTBItem;
    TBItem68: TTBItem;
    TBItem69: TTBItem;
    TBItem7: TTBItem;
    TBItem70: TTBItem;
    TBItem71: TTBItem;
    TBItem72: TTBItem;
    TBItem73: TTBItem;
    TBItem74: TTBItem;
    TBItem75: TTBItem;
    TBItem76: TTBItem;
    TBItem77: TTBItem;
    TBItem78: TTBItem;
    TBItem79: TTBItem;
    TBItem8: TTBItem;
    TBItem80: TTBItem;
    TBItem81: TTBItem;
    TBItem82: TTBItem;
    TBItem83: TTBItem;
    TBItem84: TTBItem;
    TBItem85: TTBItem;
    TBItem86: TTBItem;
    TBItem87: TTBItem;
    TBItem88: TTBItem;
    TBItem9: TTBItem;
    TBItem97: TTBItem;
    TBItem99: TTBItem;
    TBProject: TTBToolbar;
    TBRcard: TTBToolbar;
    tbRecent: TToolButton;
    tbRecentBar: TToolBar;
    TBReloadProject: TTBItem;
    TBRexplorer: TTBToolbar;
    tbsComments: TTabSheet;
    tbsCompletion: TTabSheet;
    tbsDatabase: TTabSheet;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem11: TTBSeparatorItem;
    TBSeparatorItem12: TTBSeparatorItem;
    TBSeparatorItem13: TTBSeparatorItem;
    TBSeparatorItem14: TTBSeparatorItem;
    TBSeparatorItem15: TTBSeparatorItem;
    TBSeparatorItem16: TTBSeparatorItem;
    TBSeparatorItem17: TTBSeparatorItem;
    TBSeparatorItem18: TTBSeparatorItem;
    TBSeparatorItem19: TTBSeparatorItem;
    TBSeparatorItem20: TTBSeparatorItem;
    TBSeparatorItem26: TTBSeparatorItem;
    TBSeparatorItem29: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem30: TTBSeparatorItem;
    TBSeparatorItem31: TTBSeparatorItem;
    TBSeparatorItem34: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem41: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    tbsHexViewer: TTabSheet;
    tbsIniLog: TTabSheet;
    tbsLatex: TTabSheet;
    tbsLatexAccent: TTabSheet;
    tbsLatexArrow: TTabSheet;
    tbsLatexBar: TTabSheet;
    tbsLatexBracket: TTabSheet;
    tbsLatexDot: TTabSheet;
    tbsLatexGeometry: TTabSheet;
    tbsLatexGreek: TTabSheet;
    tbsLatexMath: TTabSheet;
    tbsLatexMisc: TTabSheet;
    tbsLatexNegation: TTabSheet;
    tbsLatexOperator: TTabSheet;
    tbsLatexRelation: TTabSheet;
    tbsLatexSky: TTabSheet;
    tbsLatexUserCustom: TTabSheet;
    tbsMarkup: TTabSheet;
    tbsMisc: TTabSheet;
    tbsProject: TTabSheet;
    tbsR: TTabSheet;
    tbsRcard: TTabSheet;
    tbsResults: TTabSheet;
    tbsRExplorer: TTabSheet;
    tbsRMirrors: TTabSheet;
    tbsSearch: TTabSheet;
    tbsApp_Shortcuts: TTabSheet;
    tbsSpell: TTabSheet;
    tbsTxt2tags: TTabSheet;
    tbsTxt2tagsMacros: TTabSheet;
    tbsTxt2tagsMarks: TTabSheet;
    tbsTxt2tagsSettings: TTabSheet;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSubmenuItem11: TTBSubmenuItem;
    TBSubmenuItem13: TTBSubmenuItem;
    TBSubmenuItem14: TTBSubmenuItem;
    TBSubmenuItem15: TTBSubmenuItem;
    TBSubmenuItem16: TTBSubmenuItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBSubmenuItem4: TTBSubmenuItem;
    TBSubmenuItem5: TTBSubmenuItem;
    tbsWinExplorer: TTabSheet;
    tbsWorkExplorer: TTabSheet;
    TBTLatex: TTBToolbar;
    TBToolbar1: TTBToolbar;
    TBToolbar2: TTBToolbar;
    TBToolbar3: TTBToolbar;
    TBToolbar4: TTBToolbar;
    tvProject: TTreeView;
    tvSearch: TTreeView;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    tbsEditor_Keystrokes: TTabSheet;
    tbsR_Hotkeys: TTabSheet;
    JvDBNavigator6: TJvDBNavigator;
    dbgEditor_Keystrokes: TDBGrid;
    Panel17: TPanel;
    TBDock3: TTBDock;
    TBToolbar5: TTBToolbar;
    tbiHelp_Keystrokes: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    tbiEditorKeystrokes_Edit: TTBItem;
    edEditor_Keystrokes_Filter: TEdit;
    pgRH: TJvgPageControl;
    tbsRH_Send: TTabSheet;
    tbsRH_Control: TTabSheet;
    tbsRH_Custom: TTabSheet;
    Panel21: TPanel;
    TBDock4: TTBDock;
    TBToolbar6: TTBToolbar;
    tbiHelp_RH_Send: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    tbiRH_Send_Edit: TTBItem;
    edRH_Send_Filter: TEdit;
    Panel22: TPanel;
    TBDock5: TTBDock;
    TBToolbar7: TTBToolbar;
    tbiHelp_RH_Control: TTBItem;
    TBSeparatorItem10: TTBSeparatorItem;
    tbiRH_Control_Edit: TTBItem;
    edRH_Control_Filter: TEdit;
    Panel23: TPanel;
    TBDock6: TTBDock;
    TBToolbar8: TTBToolbar;
    tbiHelp_RH_Custom: TTBItem;
    TBSeparatorItem21: TTBSeparatorItem;
    tbiRH_Custom_Edit: TTBItem;
    edRH_Custom_Filter: TEdit;
    JvDBNavigator7: TJvDBNavigator;
    dbgRH_Send: TDBGrid;
    JvDBNavigator8: TJvDBNavigator;
    dbgRH_Control: TDBGrid;
    JvDBNavigator9: TJvDBNavigator;
    dbgRH_Custom: TDBGrid;
    JvDockClientTools: TJvDockClient;
    edApp_Shortcuts_Filter: TEdit;
    edCompletion_Filter: TEdit;
    edComments_Filter: TEdit;
    edRcard_Filter: TEdit;
    edRmirrors_Filter: TEdit;

    procedure bbtExplorerAddFavoritesClick(Sender: TObject);
    procedure bbtExplorerRemoveFavoritesClick(Sender: TObject);
    procedure bbtREnvironmentRefreshClick(Sender: TObject);
    procedure bbtRExplorerRefreshClick(Sender: TObject);
    procedure bbtRFilterRefreshClick(Sender: TObject);
    procedure bbtWinExplorerFilterRefreshClick(Sender: TObject);
    procedure bbtWinExplorerRefreshClick(Sender: TObject);
    procedure bbtWorkExplorerFileterRefreshClick(Sender: TObject);
    procedure bbtWorkExplorerRefreshClick(Sender: TObject);
    procedure cbbToolsREnvironmentKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbbToolsREnvironmentSelect(Sender: TObject);
    procedure cbbToolsRExplorerChange(Sender: TObject);
    procedure cbbToolsRExplorerDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure cbbToolsRExplorerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbbToolsRExplorerMeasureItem(Control: TWinControl; Index: Integer; var Height: Integer);
    procedure cbbToolsRExplorerSelect(Sender: TObject);
    procedure cbExplorerFavoritesChange(Sender: TObject);
    procedure dbeRmirrorsURLClick(Sender: TObject);
    procedure dbeRmirrorsURLMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure dbgCommentsDblClick(Sender: TObject);
    procedure dbgCompletionDblClick(Sender: TObject);
    procedure dbgCompletionKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgRcardDblClick(Sender: TObject);
    procedure dbgRCardKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgRmirrorsDblClick(Sender: TObject);
    procedure dbgRtipDblClick(Sender: TObject);
    procedure dbgRtipKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgApp_ShortcutsDblClick(Sender: TObject);
    procedure edToolsRExplorerFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edWinExplorerFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edWorkExplorerFilterKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure fcbbToolsWinExplorerChange(Sender: TObject);
    procedure fcbbToolsWorkExplorerChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure jvflbWinExplorerDblClick(Sender: TObject);
    procedure jvflbWinExplorerEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure jvflbWinExplorerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure jvflbWinExplorerStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure jvflbWorkExplorerDblClick(Sender: TObject);
    procedure jvflbWorkExplorerEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure jvflbWorkExplorerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure jvflbWorkExplorerStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure jvhkShortcutsEnter(Sender: TObject);
    procedure jvhkShortcutsExit(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LatexAccents(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure LatexHint(Sender: TObject; Index: Integer; var HintInfo: THintInfo; var Handled: Boolean);
    procedure LatexMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LatexSymbol(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure lbCompletionClick(Sender: TObject);
    procedure lbCountriesClick(Sender: TObject);
    procedure lbRcardClick(Sender: TObject);
    procedure lbApp_ShortcutsClick(Sender: TObject);
    procedure lvRexplorerDblClick(Sender: TObject);
    procedure lvRexplorerKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvRexplorerKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lvRexplorerSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvRexplorerStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure pgDatabaseChange(Sender: TObject);
    procedure pgMiscChange(Sender: TObject);
    procedure pgResultsChange(Sender: TObject);
    procedure pgToolsChange(Sender: TObject);
    procedure rgHexViewerModeClick(Sender: TObject);
    procedure slvExplorerAddFolder(Sender: TObject; AFolder: TShellFolder; var CanAdd: Boolean);
    procedure slvExplorerStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure splRExplorerMoved(Sender: TObject);
    procedure splRExplorerPaint(Sender: TObject);
    procedure stbRMirrorsClick(Sender: TObject);
    procedure stbRMirrorsDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel; const Rect: TRect);
    procedure stbRMirrorsMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure tbRecentClick(Sender: TObject);
    procedure tvProjectAddition(Sender: TObject; Node: TTreeNode);
    procedure tvProjectChange(Sender: TObject; Node: TTreeNode);
    procedure tvProjectDblClick(Sender: TObject);
    procedure tvProjectDeletion(Sender: TObject; Node: TTreeNode);
    procedure tvProjectDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvProjectDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvProjectEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvProjectKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tvProjectStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure tvSearchChange(Sender: TObject; Node: TTreeNode);
    procedure tvSearchDblClick(Sender: TObject);
    procedure tvSearchDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure tvSearchEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvSearchStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure edRH_Send_FilterChange(Sender: TObject);
    procedure edRH_Control_FilterChange(Sender: TObject);
    procedure edRH_Custom_FilterChange(Sender: TObject);
    procedure pgRHChange(Sender: TObject);
    procedure edApp_Shortcuts_FilterChange(Sender: TObject);
    procedure tbiHelp_KeystrokesClick(Sender: TObject);
    procedure tbiHelp_RH_SendClick(Sender: TObject);
    procedure tbiHelp_RH_ControlClick(Sender: TObject);
    procedure tbiHelp_RH_CustomClick(Sender: TObject);
    procedure edEditor_Keystrokes_FilterChange(Sender: TObject);
    procedure edApp_Shortcuts_FilterClick(Sender: TObject);
    procedure edEditor_Keystrokes_FilterClick(Sender: TObject);
    procedure edRH_Send_FilterClick(Sender: TObject);
    procedure edRH_Control_FilterClick(Sender: TObject);
    procedure edRH_Custom_FilterClick(Sender: TObject);
    procedure edCompletion_FilterClick(Sender: TObject);
    procedure edComments_FilterClick(Sender: TObject);
    procedure edRcard_FilterClick(Sender: TObject);
    procedure edRmirrors_FilterClick(Sender: TObject);
    procedure edCompletion_FilterChange(Sender: TObject);
    procedure edComments_FilterChange(Sender: TObject);
    procedure edRcard_FilterChange(Sender: TObject);
    procedure edRmirrors_FilterChange(Sender: TObject);
    procedure edEditor_Keystrokes_FilterDblClick(Sender: TObject);
    procedure edRH_Custom_FilterDblClick(Sender: TObject);
    procedure dbgEditor_KeystrokesDblClick(Sender: TObject);
    procedure dbgRH_SendDblClick(Sender: TObject);
    procedure dbgRH_ControlDblClick(Sender: TObject);
    procedure dbgRH_CustomDblClick(Sender: TObject);
    procedure tbiAppShortcuts_EditClick(Sender: TObject);
    procedure tbiEditorKeystrokes_EditClick(Sender: TObject);
    procedure tbiRH_Send_EditClick(Sender: TObject);
    procedure tbiRH_Control_EditClick(Sender: TObject);
    procedure tbiRH_Custom_EditClick(Sender: TObject);

  private
    { Private declarations }
    sApp_Shortcuts_BM    : string;
    sEditor_Keystrokes_BM: string;
    sRH_Send_BM          : string;
    sRH_Control_BM       : string;
    sRH_Custom_BM        : string;
    sCompletion_BM       : string;
    sComments_BM         : string;
    sRmirrors_BM         : string;
    sRcard_BM            : string;

    procedure pAdjustColumnWidths(DBGrid: TDBGrid);

  public
    { Public declarations }
    iSize: integer;

    procedure pDoProjectOpenNode;
  end;

var
  frmTools: TfrmTools;

implementation

uses
  ufrmMain,
  trCodeSender,
  ufrmEditor,
  ufrmRterm,
  uModDados,
  trUtils,
  Menus;

{$R *.dfm}

procedure TfrmTools.bbtExplorerAddFavoritesClick(Sender: TObject);
begin
  with cbExplorerFavorites do begin
    if (jvdlbWinExplorer.Directory <> '') and
       (Items.IndexOf(jvdlbWinExplorer.Directory) < 0) then Items.Add(jvdlbWinExplorer.Directory);
    ItemIndex:= Items.IndexOf(jvdlbWinExplorer.Directory)
  end;
end;

procedure TfrmTools.bbtWinExplorerRefreshClick(Sender: TObject);
begin
  with jvdlbWinExplorer do begin
    Items.BeginUpdate;
    Refresh;
    Items.EndUpdate;
  end;
end;

procedure TfrmTools.bbtExplorerRemoveFavoritesClick(Sender: TObject);
begin
  with cbExplorerFavorites do
    if (Text <> '') then Items.Delete(ItemIndex);
end;

procedure TfrmTools.bbtREnvironmentRefreshClick(Sender: TObject);
begin
  frmMain.actRExpl_EnvironmentRefreshExecute(nil);
end;

procedure TfrmTools.bbtRExplorerRefreshClick(Sender: TObject);
begin
  frmMain.actRExpl_RefreshExecute(nil);
end;

procedure TfrmTools.bbtRFilterRefreshClick(Sender: TObject);
begin
  frmMain.actRExpl_FilterRefreshExecute(nil);
end;

procedure TfrmTools.bbtWinExplorerFilterRefreshClick(Sender: TObject);
begin
  if (trim(edWinExplorerFilter.Text) = '*.*') then jvflbWinExplorer.Mask:= '*.*'
                                              else jvflbWinExplorer.Mask:= trim(edWinExplorerFilter.Text);
end;

procedure TfrmTools.bbtWorkExplorerFileterRefreshClick(Sender: TObject);
begin
  if (trim(edWorkExplorerFilter.Text) = '*.*') then jvflbWorkExplorer.Mask:= '*.*'
                                               else jvflbWorkExplorer.Mask:= trim(edWorkExplorerFilter.Text);
end;

procedure TfrmTools.bbtWorkExplorerRefreshClick(Sender: TObject);
begin
  with jvdlbWorkExplorer do begin
    Items.BeginUpdate;
    Refresh;
    Items.EndUpdate;
  end;
end;

procedure TfrmTools.cbbToolsREnvironmentKeyDown(Sender: TObject;
                                                var Key: Word;
                                                Shift: TShiftState);
begin
  if (Key = VK_RETURN) then frmMain.actRExpl_EnvironmentRefreshExecute(nil);
end;

procedure TfrmTools.cbbToolsREnvironmentSelect(Sender: TObject);
begin
  frmMain.actRExpl_RefreshExecute(nil);
end;

procedure TfrmTools.cbbToolsRExplorerChange(Sender: TObject);
begin
  frmMain.actRExpl_RefreshExecute(nil);
end;

procedure TfrmTools.cbbToolsRExplorerDrawItem(Control: TWinControl;
                                              Index: Integer;
                                              Rect: TRect;
                                              State: TOwnerDrawState);
var
  bmp : TBitmap;
  cmb : TComboBox;
  iOff: Integer;

begin
  cmb:= (Control as TComboBox);

  with cmb.Canvas do begin
    FillRect(Rect);
    iOff:= 0;
    bmp:= TBitmap(cbbToolsRExplorer.Items.Objects[Index]);

    if (bmp <> nil) then begin
       BrushCopy(Bounds(Rect.Left+2,
                        Rect.Top,
                        bmp.Width,
                        bmp.Height),
                 bmp,
                 Bounds(0,
                        0,
                        bmp.Width,
                        bmp.Height),
                 clOlive);
       iOff:= bmp.Width + 10;
    end;

    TextOut(Rect.Left + iOff,
            Rect.Top,
            cbbToolsRExplorer.Items[Index]);
  end;
end;

procedure TfrmTools.cbbToolsRExplorerKeyDown(Sender: TObject;
                                             var Key: Word;
                                             Shift: TShiftState);
begin
  if (Key = VK_RETURN) then frmMain.actRExpl_RefreshExecute(nil);
end;

procedure TfrmTools.cbbToolsRExplorerMeasureItem(Control: TWinControl;
                                                 Index: Integer;
                                                 var Height: Integer);
begin
  Height:= 15;
end;

procedure TfrmTools.cbbToolsRExplorerSelect(Sender: TObject);
begin
  frmMain.actRExpl_RefreshExecute(nil);
end;

procedure TfrmTools.cbExplorerFavoritesChange(Sender: TObject);
var
  sTmp: string;

begin
  try
    with jvdlbWinExplorer do begin
      sTmp:= trim(cbExplorerFavorites.Text);
      if DirectoryExists(sTmp) then Directory:= sTmp
      else
        if (MessageDlg(trim(cbExplorerFavorites.Text) + #13 + #13 +
                 'The path above wasn''t found.' + #13 +
                 'Would you like to remove it from the favorites?',
                 mtConfirmation,
                 [mbYes, mbNo],
                 0) = mrYes) then bbtExplorerRemoveFavoritesClick(nil);
      //TopIndex := Selected;
    end;
  except
    On EInvalidPath do
        if (MessageDlg(trim(cbExplorerFavorites.Text) + #13 + #13 +
                       'The path above wasn''t found.' + #13 +
                       'Would you like to remove it from the favorites?',
                       mtConfirmation,
                       [mbYes, mbNo],
                       0) = mrYes) then bbtExplorerRemoveFavoritesClick(nil);
  end;
end;

procedure TfrmTools.dbeRmirrorsURLClick(Sender: TObject);
begin
  with frmMain do
    actRmirrors_OpenURLCurrentExecute(nil);
end;

procedure TfrmTools.dbeRmirrorsURLMouseMove(Sender: TObject;
                                            Shift: TShiftState;
                                            X,
                                             Y: Integer);
begin
  dbeRmirrorsURL.Cursor:= crHandPoint;
end;

procedure TfrmTools.dbgCommentsDblClick(Sender: TObject);
begin
  with frmMain do
    actComments_EditExecute(nil);
end;

procedure TfrmTools.dbgCompletionDblClick(Sender: TObject);
begin
  with frmMain do
    actCompletion_EditExecute(nil);
end;

procedure TfrmTools.dbgCompletionKeyDown(Sender: TObject;
                                         var Key: Word;
                                         Shift: TShiftState);
begin
//  case Key of
//    VK_RETURN: with frmMain do
//                 actCompletionInsertExecute(nil);
//  end;
end;

procedure TfrmTools.dbgEditor_KeystrokesDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.dbgRcardDblClick(Sender: TObject);
begin
  with frmMain do 
    actRcard_InsertExecute(nil);
end;

procedure TfrmTools.dbgRCardKeyDown(Sender: TObject;
                                    var Key: Word;
                                    Shift: TShiftState);
begin
  case Key of
    VK_RETURN: with frmMain do
                 actRcard_InsertExecute(nil);
  end;
end;

procedure TfrmTools.dbgRH_ControlDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.dbgRH_CustomDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.dbgRH_SendDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.dbgRmirrorsDblClick(Sender: TObject);
begin
  with frmMain do
    actRmirrors_SetReposExecute(nil);
end;

procedure TfrmTools.dbgRtipDblClick(Sender: TObject);
begin
  with frmMain do
    actRtipInsertExecute(nil);
end;

procedure TfrmTools.dbgRtipKeyDown(Sender: TObject;
                                   var Key: Word;
                                   Shift: TShiftState);
begin
  case Key of
    VK_RETURN: with frmMain do
                 actRtipInsertExecute(nil);
  end;
end;

procedure TfrmTools.edApp_Shortcuts_FilterChange(Sender: TObject);
begin
  if (edApp_Shortcuts_Filter.Text = EmptyStr) then begin
    lbApp_ShortcutsClick(Self);
    with modDados.cdApp_Shortcuts do
      Bookmark:= sApp_Shortcuts_BM;
    lbApp_Shortcuts.Enabled:= True;
    Exit;
  end;

  try
    lbApp_Shortcuts.Enabled:= False;
    with modDados.cdApp_Shortcuts do begin
      Filtered:= False;
      Filter:= 'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edApp_Shortcuts_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edApp_Shortcuts_FilterClick(Sender: TObject);
begin
  sApp_Shortcuts_BM:= modDados.cdApp_Shortcuts.Bookmark;
end;

procedure TfrmTools.edComments_FilterChange(Sender: TObject);
begin
  if (edComments_Filter.Text = EmptyStr) then begin
    with modDados.cdComments do begin
      Filtered:= False;
      Bookmark:= sComments_BM;
    end;
    Exit;
  end;

  try
    with modDados.cdComments do begin
      Filtered:= False;
      Filter:= 'UPPER(Language) Like ' +
               UpperCase(QuotedStr('%' + edComments_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edComments_FilterClick(Sender: TObject);
begin
  sComments_BM:= modDados.cdComments.Bookmark;
end;

procedure TfrmTools.edCompletion_FilterChange(Sender: TObject);
begin
  if (edCompletion_Filter.Text = EmptyStr) then begin
    lbCompletionClick(Self);
    with modDados.cdCompletion do
      Bookmark:= sCompletion_BM;
    lbCompletion.Enabled:= True;
    Exit;
  end;

  try
    lbCompletion.Enabled:= False;
    with modDados.cdCompletion do begin
      Filtered:= False;
      Filter:= 'UPPER(Function) Like ' +
               UpperCase(QuotedStr('%' + edCompletion_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edCompletion_FilterClick(Sender: TObject);
begin
  sCompletion_BM:= modDados.cdCompletion.Bookmark;
end;

procedure TfrmTools.edEditor_Keystrokes_FilterChange(Sender: TObject);
begin
  if (edEditor_Keystrokes_Filter.Text = EmptyStr) then begin
    with modDados.cdEditor_Keystrokes do begin
      Filtered:= False;
      Bookmark:= sEditor_Keystrokes_BM;
    end;
    Exit;
  end;

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

procedure TfrmTools.edEditor_Keystrokes_FilterClick(Sender: TObject);
begin
  sEditor_Keystrokes_BM:= modDados.cdEditor_Keystrokes.Bookmark;
end;

procedure TfrmTools.edEditor_Keystrokes_FilterDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.edRH_Send_FilterChange(Sender: TObject);
begin
  if (edRH_Send_Filter.Text = EmptyStr) then begin
    with modDados.cdRH_Send do begin
      Filtered:= False;
      Bookmark:= sRH_Send_BM;
    end;
    Exit;
  end;

  try
    with modDados.cdRH_Send do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + 'Send' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edRH_Send_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edRH_Send_FilterClick(Sender: TObject);
begin
  sRH_Send_BM:= modDados.cdRH_Send.Bookmark;
end;

procedure TfrmTools.edRmirrors_FilterChange(Sender: TObject);
begin
  if (edRmirrors_Filter.Text = EmptyStr) then begin
    lbCountriesClick(Self);
    with modDados.cdRmirrors do
      Bookmark:= sRmirrors_BM;
    lbCountries.Enabled:= True;
    Exit;
  end;

  try
    lbCountries.Enabled:= False;
    with modDados.cdRmirrors do begin
      Filtered:= False;
      Filter:= 'UPPER(City) Like ' +
               UpperCase(QuotedStr('%' + edRmirrors_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edRmirrors_FilterClick(Sender: TObject);
begin
  sRmirrors_BM:= modDados.cdRmirrors.Bookmark;
end;

procedure TfrmTools.edRcard_FilterChange(Sender: TObject);
begin
  if (edRcard_Filter.Text = EmptyStr) then begin
    lbRcardClick(Self);
    with modDados.cdRcard do
      Bookmark:= sRcard_BM;
    lbRcard.Enabled:= True;
    Exit;
  end;

  try
    lbRcard.Enabled:= False;
    with modDados.cdRcard do begin
      Filtered:= False;
      Filter:= 'UPPER(Function) Like ' +
               UpperCase(QuotedStr('%' + edRcard_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edRcard_FilterClick(Sender: TObject);
begin
  sRcard_BM:= modDados.cdRcard.Bookmark;
end;

procedure TfrmTools.edRH_Control_FilterChange(Sender: TObject);
begin
  if (edRH_Control_Filter.Text = EmptyStr) then begin
    with modDados.cdRH_Control do begin
      Filtered:= False;
      Bookmark:= sRH_Control_BM;
    end;
    Exit;
  end;

  try
    with modDados.cdRH_Control do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + 'Control' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edRH_Control_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edRH_Control_FilterClick(Sender: TObject);
begin
  sRH_Control_BM:= modDados.cdRH_Control.Bookmark;
end;

procedure TfrmTools.edRH_Custom_FilterChange(Sender: TObject);
begin
  if (edRH_Custom_Filter.Text = EmptyStr) then begin
    with modDados.cdRH_Custom do begin
      Filtered:= False;
      Bookmark:= sRH_Custom_BM;
    end;
    Exit;
  end;

  try
    with modDados.cdRH_Custom do begin
      Filtered:= False;
      Filter:= 'UPPER(Group) Like ' +
               UpperCase(QuotedStr('%' + 'Custom' + '%')) +
               ' AND ' +
               'UPPER(Caption) Like ' +
               UpperCase(QuotedStr('%' + edRH_Custom_Filter.Text + '%'));
      Filtered:= True;
    end;
  except
    //TODO
  end;
end;

procedure TfrmTools.edRH_Custom_FilterClick(Sender: TObject);
begin
  sRH_Custom_BM:= modDados.cdRH_Custom.Bookmark;
end;

procedure TfrmTools.edRH_Custom_FilterDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.dbgApp_ShortcutsDblClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.edToolsRExplorerFilterKeyDown(Sender: TObject;
                                                  var Key: Word;
                                                  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    with frmMain do
      actRExpl_RefreshExecute(nil);
    edToolsRExplorerFilter.SetFocus;
  end;
end;

procedure TfrmTools.edWinExplorerFilterKeyDown(Sender: TObject;
                                               var Key: Word;
                                               Shift: TShiftState);
begin
  case Key of
    VK_RETURN: if (trim(edWinExplorerFilter.Text) = '*.*') then
                 jvflbWinExplorer.Mask:= '*.*'
               else
                 jvflbWinExplorer.Mask:= trim(edWinExplorerFilter.Text);
    VK_ESCAPE: begin
                 edWinExplorerFilter.Text:= '*.*';
                 bbtWinExplorerFilterRefreshClick(nil);
               end;
  end;
end;

procedure TfrmTools.edWorkExplorerFilterKeyDown(Sender: TObject;
                                                var Key: Word;
                                                Shift: TShiftState);
begin
  case Key of
    VK_RETURN: if (trim(edWorkExplorerFilter.Text) = '*.*') then
                 jvflbWorkExplorer.Mask:= '*.*'
               else
                 jvflbWorkExplorer.Mask:= trim(edWorkExplorerFilter.Text);
    VK_ESCAPE: begin
                 edWorkExplorerFilter.Text:= '*.*';
                 bbtWorkExplorerFileterRefreshClick(nil);
               end;
  end;
end;

procedure TfrmTools.fcbbToolsWinExplorerChange(Sender: TObject);
begin
  with jvflbWinExplorer do begin
    Items.BeginUpdate;
    if (trim(fcbbToolsWinExplorer.Mask) = '*.*') then
      jvflbWinExplorer.Mask:= '*.*'
    else
      jvflbWinExplorer.Mask:= trim(fcbbToolsWinExplorer.Mask);
    Items.EndUpdate;
  end;
end;

procedure TfrmTools.fcbbToolsWorkExplorerChange(Sender: TObject);
begin
  with jvflbWorkExplorer do begin
    Items.BeginUpdate;
    if (trim(fcbbToolsWorkExplorer.Mask) = '*.*') then
      jvflbWorkExplorer.Mask:= '*.*'
    else
      jvflbWorkExplorer.Mask:= trim(fcbbToolsWorkExplorer.Mask);
    Items.EndUpdate;
  end;
end;

procedure TfrmTools.FormActivate(Sender: TObject);
begin
  // It is necessary to show only the glyph
  bbtREnvironmentRefresh.Caption:= '';
  bbtRExplorerRefresh.Caption:= '';
  bbtRFilterRefresh.Caption:= '';
end;

procedure TfrmTools.FormHide(Sender: TObject);
begin
  with frmMain do begin
    if not actToolsVisible.Checked then Exit;  // LoadDockTreeFromAppStorage call FormHide when starting and the form is not visible.
                                               // Do not remove from here!

    actToolsVisible.Checked:= False;  // It is necessary here due the user can close the form manually pressing the x icon.

    with JvDockServer do begin
      with LeftDockPanel do  // Left
        if ContainsControl(frmTools) then begin
          iSize:= Width;
          Exit;
        end;
      with TopDockPanel do  // Top
        if ContainsControl(frmTools) then begin
          iSize:= Height;
          Exit;
        end;
      with RightDockPanel do // Right
        if ContainsControl(frmTools) then begin
          iSize:= Width;
          Exit;
        end;
      with BottomDockPanel do // Bottom
        if ContainsControl(frmTools) then begin
          iSize:= Height;
          Exit;
        end;
    end;
  end;
end;

procedure TfrmTools.FormResize(Sender: TObject);
begin
  pAdjustColumnWidths(dbgApp_Shortcuts);
  pAdjustColumnWidths(dbgEditor_Keystrokes);
  pAdjustColumnWidths(dbgRH_Send);
  pAdjustColumnWidths(dbgRH_Control);
  pAdjustColumnWidths(dbgRH_Custom);
  pAdjustColumnWidths(dbgRmirrors);
  pAdjustColumnWidths(dbgCompletion);
  pAdjustColumnWidths(dbgComments);
end;

procedure TfrmTools.FormShow(Sender: TObject);
begin
  pAdjustColumnWidths(dbgApp_Shortcuts);
  pAdjustColumnWidths(dbgEditor_Keystrokes);
  pAdjustColumnWidths(dbgRH_Send);
  pAdjustColumnWidths(dbgRH_Control);
  pAdjustColumnWidths(dbgRH_Custom);
  pAdjustColumnWidths(dbgRmirrors);
  pAdjustColumnWidths(dbgCompletion);
  pAdjustColumnWidths(dbgComments);

  frmMain.pUpdate_HexViewer;
  
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmTools.jvflbWorkExplorerEndDrag(Sender,
                                             Target: TObject;
                                             X,
                                             Y: Integer);
begin
  frmMain.sDragSource:= '';
end;

procedure TfrmTools.jvflbWorkExplorerStartDrag(Sender: TObject;
                                               var DragObject: TDragObject);
begin
  frmMain.sDragSource:= (Sender as TJvFileListBox).FileName;
end;

procedure TfrmTools.pgRHChange(Sender: TObject);
begin
  pAdjustColumnWidths(dbgRH_Send);
  pAdjustColumnWidths(dbgRH_Control);
  pAdjustColumnWidths(dbgRH_Custom);
end;

procedure TfrmTools.jvhkShortcutsEnter(Sender: TObject);
begin
  frmMain.alMain.State:= asSuspended;
end;

procedure TfrmTools.jvhkShortcutsExit(Sender: TObject);
begin
  frmMain.alMain.State:= asNormal;
end;

procedure TfrmTools.slvExplorerAddFolder(Sender: TObject;
                                         AFolder: TShellFolder;
                                         var CanAdd: Boolean);
var
  sFilterExt,
   sExt     : string;

begin
  if fcbbToolsWinExplorer.Mask <> '*.*' then begin
    sFilterExt:= lowerCase(fcbbToolsWinExplorer.Mask);
    sExt      := lowerCase(ExtractFileExt(AFolder.PathName));
    // Only accept filter and folders
    if (Pos(sExt,
            sFilterExt) <> 0) or
       AFolder.IsFolder then CanAdd:= True
                        else CanAdd:= False;
  end;
end;

procedure TfrmTools.jvflbWinExplorerDblClick(Sender: TObject);
var
  sTmp: string;
  
begin
  sTmp:= jvflbWinExplorer.FileName;
  if FileExists(sTmp) then frmMain.pOpen_FileIntoTinn(sTmp);
end;

procedure TfrmTools.jvflbWinExplorerEndDrag(Sender,
                                            Target: TObject;
                                            X,
                                            Y: Integer);
begin
  frmMain.sDragSource:= '';
end;

procedure TfrmTools.jvflbWinExplorerKeyDown(Sender: TObject;
                                            var Key: Word;
                                            Shift: TShiftState);
var
  sTmp: string;
  
begin
  case Key of
    VK_RETURN: begin
                 sTmp:= jvflbWinExplorer.FileName;
                 if FileExists(sTmp) then frmMain.pOpen_FileIntoTinn(sTmp);
               end;
  end;
end;

procedure TfrmTools.jvflbWinExplorerStartDrag(Sender: TObject;
                                              var DragObject: TDragObject);
begin
  frmMain.sDragSource:= (Sender as TJvFileListBox).FileName;
end;

procedure TfrmTools.jvflbWorkExplorerDblClick(Sender: TObject);
var
  sTmp: string;
  
begin
  sTmp:= jvflbWorkExplorer.FileName;
  if FileExists(sTmp) then frmMain.pOpen_FileIntoTinn(sTmp);
end;

procedure TfrmTools.jvflbWorkExplorerKeyDown(Sender: TObject;
                                             var Key: Word;
                                             Shift: TShiftState);
var
  sTmp: string;

begin
  case Key of
    VK_RETURN: begin
                 sTmp:= jvflbWorkExplorer.FileName;
                 if FileExists(sTmp) then frmMain.pOpen_FileIntoTinn(sTmp);
               end;
  end;
end;

procedure TfrmTools.slvExplorerStartDrag(Sender: TObject;
                                         var DragObject: TDragObject);
begin
  frmMain.sDragSource:= (Sender as TShellListView).SelectedFolder.PathName;
end;

procedure TfrmTools.splRExplorerMoved(Sender: TObject);
begin
  cbbToolsRExplorer.Width     := (panRExplorer.Width - 35);
  edToolsRExplorerFilter.Width:= (panRFilter.Width - 29);
end;

procedure TfrmTools.splRExplorerPaint(Sender: TObject);
begin
  cbbToolsRExplorer.Width     := (panRExplorer.Width - 35);
  edToolsRExplorerFilter.Width:= (panRFilter.Width - 29);
end;

procedure TfrmTools.stbRMirrorsClick(Sender: TObject);
begin
  with frmMain do
    actRmirrors_OpenURLDefaultExecute(nil);
end;

procedure TfrmTools.stbRMirrorsDrawPanel(StatusBar: TStatusBar;
                                         Panel: TStatusPanel;
                                         const Rect: TRect);
begin
  with stbRMirrors.Canvas do begin
       case Panel.Index of
         0: begin
              Brush.Color:= clCream;
              Font.Color := clGreen;
              //Font.Style := [fsBold];
           end;
         1: begin
              Brush.Color:= clCream;
              Font.Color := clGreen;
              Font.Style := [fsBold];
           end;
       end;

       TextOut(Rect.left + 2,
               Rect.top + 1,
               Panel.Text);
  end;
end;

procedure TfrmTools.stbRMirrorsMouseMove(Sender: TObject;
                                         Shift:
                                         TShiftState;
                                         X,
                                          Y: Integer);
begin
  stbRMirrors.Cursor:= crHandPoint;
end;

procedure TfrmTools.tbiHelp_KeystrokesClick(Sender: TObject);
begin
  with frmMain do
    pOpen_UserGuidePDF('"Keystrokes"');
end;

procedure TfrmTools.tbiHelp_RH_SendClick(Sender: TObject);
begin
  with frmMain do
    pOpen_UserGuidePDF('"RH_Send"');
end;

procedure TfrmTools.tbiRH_Control_EditClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.tbiRH_Custom_EditClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.tbiRH_Send_EditClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.tbiAppShortcuts_EditClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.tbiEditorKeystrokes_EditClick(Sender: TObject);
begin
  with frmMain do
    actSKH_mapExecute(nil);
end;

procedure TfrmTools.tbiHelp_RH_ControlClick(Sender: TObject);
begin
  with frmMain do
    pOpen_UserGuidePDF('"RH_Control"');
end;

procedure TfrmTools.tbiHelp_RH_CustomClick(Sender: TObject);
begin
  with frmMain do
    pOpen_UserGuidePDF('"RH_Custom"');
end;

procedure TfrmTools.tbRecentClick(Sender: TObject);
begin
  with frmMain do
    frmMain.actProject_OpenExecute(nil);
end;

procedure TfrmTools.tvProjectAddition(Sender: TObject;
                                      Node: TTreeNode);
begin
  with stbProject do begin
    Panels[1].Text:= IntToStr(tvProject.Items.Count);
    Refresh;
  end;
end;

procedure TfrmTools.tvProjectChange(Sender: TObject;
                                    Node: TTreeNode);
begin
  with stbProject do begin
    Panels[1].Text:= IntToStr(tvProject.Items.Count);
    Panels[3].Text:= IntToStr(tvProject.Selected.AbsoluteIndex + 1);
    Panels[5].Text:= Node.Text;
    Refresh;
  end;
  frmMain.iProjecSelected:= tvProject.Selected.Level;
end;

procedure TfrmTools.pDoProjectOpenNode;
var
  i   : integer;
  sTmp: string;

begin
  with tvProject do
    if (Selected = nil) then Exit;

  with tvProject do
    case Selected.level of
      0: frmMain.pOpen_AllFiles;
      1: frmMain.pOpen_AllFilesOfGroup;
      2: begin
           sTmp:= string(tvProject.Selected.Data);
           for i:= 1 to (Items.Count -1) do
             if Items[i].Level = 2 then
               if (Items[i].Selected) then Items[i].ImageIndex:= 3
               else if (Items[i].ImageIndex = 3) then Items[i].ImageIndex:= 2;
           if FileExists(Trim(sTmp)) then frmMain.pOpen_FileIntoTinn(Trim(sTmp))
                                      else MessageDlg(Trim(sTmp) + #13 + #13 +
                                                      'File not found!',
                                                      mtWarning,
                                                      [mbOK],
                                                      0);
         end;
    end;
end;

procedure TfrmTools.tvProjectDblClick(Sender: TObject);
begin
  pDoProjectOpenNode;
end;

procedure TfrmTools.tvProjectDeletion(Sender: TObject;
                                      Node: TTreeNode);
begin
  with stbProject do begin
    Panels[1].Text:= IntToStr(tvProject.Items.Count);
    Refresh;
  end;
end;

// Adapted from http://delphi.about.com/cs/adptips2001/a/bltip0901_3.htm
procedure TfrmTools.tvProjectDragDrop(Sender,
                                      Source: TObject;
                                      X,
                                      Y: Integer);
var
  attachMode: TNodeAttachMode;
  hT        : THitTests;
  tnItem    : TTreeNode;

begin
  attachMode:= naInsert;

  try
    with tvProject do
      if (Selected = nil) or
         (Selected.Level <> 2) then Exit;
    hT    := tvProject.GetHitTestInfoAt(X,
                                        Y) ;
    tnItem:= tvProject.GetNodeAt(X,
                                 Y) ;
    if (hT - [htOnItem,
              htOnIcon,
              htNowhere,
              htOnIndent] <> hT) then begin
      if (htOnItem in hT) or
         (htOnIcon in hT) then AttachMode:= naAddChild
      else if (htNowhere in hT) then AttachMode := naAdd
      else if (htOnIndent in hT) then AttachMode:= naInsert;
      if (tnItem <> nil) then begin
        if (tnItem.Level = 1) then begin
          tvProject.Selected.MoveTo(tnItem,
                                    attachMode);
          tnItem.AlphaSort(True);
          frmMain.bProjectChanged:= True;
        end;
      end;
    end;

  except
    MessageDlg('Last task not done with success!' + #13 + #13 +
               'Please, repeat it.',
               mtError,
               [mbOK],
               0);
  end;
end;

procedure TfrmTools.tvProjectDragOver(Sender,
                                      Source: TObject;
                                      X,
                                      Y: Integer;
                                      State: TDragState;
                                      var Accept: Boolean);
begin
  if Sender is TTreeView then Accept:= True;
end;

procedure TfrmTools.tvProjectEndDrag(Sender,
                                     Target: TObject;
                                     X,
                                     Y: Integer);
begin
  frmMain.sDragSource:= '';
end;

procedure TfrmTools.tvProjectKeyDown(Sender: TObject;
                                     var Key: Word;
                                     Shift: TShiftState);
begin
  if (Sender is TTreeView) then
    // Remove selected group or file from Delete key
    with tvProject do
      if (Key = VK_Delete) then begin
        if (Selected.Level = 1) or
           (Selected.Level = 2) then begin
          Selected.Delete;
          frmMain.bProjectChanged:= True;
        end;
      end;

  case Key of
    VK_RETURN: pDoProjectOpenNode;
  end;
end;

procedure TfrmTools.tvProjectStartDrag(Sender: TObject;
                                       var DragObject: TDragObject);
begin
  frmMain.iDragLevel:= -1;
  with tvProject do
    case Selected.level of
      0: frmMain.iDragLevel := 0;
      1: frmMain.iDragLevel := 1;
      2: frmMain.sDragSource:= Trim(string((Sender as TTreeView).Selected.Data));
    end;
end;

procedure TfrmTools.tvSearchChange(Sender: TObject;
                                   Node: TTreeNode);
begin
  with stbSearch do begin
    Panels[1].Text:= IntToStr(tvSearch.Items.Count);
    Panels[3].Text:= IntToStr(tvSearch.Selected.AbsoluteIndex + 1);
    Panels[5].Text:= Node.Text;
    Refresh;
  end;
end;

procedure TfrmTools.tvSearchDblClick(Sender: TObject);
begin
  frmMain.pOpen_FileFromSearch;
end;

procedure TfrmTools.tvSearchDragOver(Sender,
                                     Source: TObject;
                                     X,
                                     Y: Integer;
                                     State: TDragState;
                                     var Accept: Boolean);
begin
  if Sender is TTreeView then Accept:= True;
end;

procedure TfrmTools.tvSearchEndDrag(Sender,
                                    Target: TObject;
                                    X,
                                    Y: Integer);
begin
  frmMain.sDragSource:= '';
end;

procedure TfrmTools.tvSearchStartDrag(Sender: TObject;
                                      var DragObject: TDragObject);
var
  iPos,
   iEnd: integer;
  sTmp : string;

begin
  frmMain.iDragLevel:= -1;
  with tvSearch do begin
    case Selected.level of
      0: frmMain.iDragLevel:= 0;
      1: frmMain.iDragLevel:= 1;
      2: frmMain.iDragLevel:= 2;
    end;
    if (Selected = nil) or
       (Selected.Level < 2) then Exit;
    sTmp:= Selected.Text;
    frmMain.sDragSource:= Selected.Parent.Text;
    iPos := Pos('(',
                sTmp);
    if (iPos > 0) then begin
      iEnd:= Pos('):',
                 sTmp);
      frmMain.sDragSourceLine:= Copy(sTmp,
                                         iPos + 1,
                                         (iEnd - iPos) - 1);
    end;
  end;

end;

procedure TfrmTools.LatexSymbol(Sender: TObject;
                                Button: TMouseButton;
                                Shift: TShiftState;
                                X,
                                Y: Integer);
var
  i   : integer;
  sTmp: string;

  procedure FormatSymbol;
  var
    ipos: integer;

  begin
    sTmp:= ChangeFileExt(sTmp,
                         '');
    iPos:= Pos('_',
               sTmp);
    sTmp:= Copy(sTmp,
                iPos + 1,
                length(sTmp));
    sTmp:= '\' +
           sTmp;
  end;

begin
  if not (Sender is TJvImagesViewer) then Exit;
  with Sender as TJvImagesViewer do begin
    i:= SelectedIndex;
    if (i < 0) then Exit;
    sTmp:= ExtractFileName(Items[i].FileName);
    FormatSymbol;
    frmMain.pInsert_LatexSymbol(sTmp,
                                0);
  end;
end;

procedure TfrmTools.lbRcardClick(Sender: TObject);
begin
  frmMain.iRcardFilter:= lbRcard.ItemIndex;
  with ModDados.cdRcard do begin
    Filter  := 'Group = ' +
               QuotedStr(lbRcard.Items.Strings[frmMain.iRcardFilter]);
    Filtered:= True;
    First;
  end;
end;

procedure TfrmTools.lbApp_ShortcutsClick(Sender: TObject);
begin
  frmMain.iApp_ShortcutsFilter:= lbApp_Shortcuts.ItemIndex;
  with ModDados. cdApp_Shortcuts do begin
    Filter  := 'Group = ' +
               QuotedStr(lbApp_Shortcuts.Items.Strings[frmMain.iApp_ShortcutsFilter]);
    Filtered:= True;
    First;
  end;
end;

procedure TfrmTools.lbCompletionClick(Sender: TObject);
begin
  with lbCompletion do
    if (ItemIndex < 0) or
       (ItemIndex > Count - 1) then ItemIndex:= 0;

  frmMain.iCompletionFilter:= lbCompletion.ItemIndex;
  with ModDados.cdCompletion do begin
    Filter  := 'Group = ' +
               QuotedStr(lbCompletion.Items.Strings[frmMain.iCompletionFilter]);
    Filtered:= True;
    First;
  end;
end;

procedure TfrmTools.lbCountriesClick(Sender: TObject);
begin
  with lbCountries do
    if (ItemIndex < 0) or
       (ItemIndex > Count - 1) then ItemIndex:= 0;

  frmMain.iCountriesFilter:= lbCountries.ItemIndex;
  with ModDados.cdRmirrors do begin
    DisableControls;
    Filter:= 'Country = ' +
             QuotedStr(lbCountries.Items.Strings[frmMain.iCountriesFilter]);
    Filtered:= True;

    // Try to locate the R mirror default
    Locate('URL',
           frmMain.sRmirror,
           []);

    EnableControls;
  end;
end;

procedure TfrmTools.lvRexplorerDblClick(Sender: TObject);
begin
  frmMain.lvRexplorerDblClick(nil);
end;

procedure TfrmTools.lvRexplorerKeyDown(Sender: TObject;
                                       var Key: Word;
                                       Shift: TShiftState);
begin
  if Key = VK_DELETE then frmMain.actRExpl_RemoveExecute(nil);
end;

procedure TfrmTools.lvRexplorerKeyUp(Sender: TObject;
                                     var Key: Word;
                                     Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and (Upcase(Char(Key)) = 'C') then
    if Assigned(frmTools.lvRexplorer.Selected) then Clipboard.AsText:= frmTools.lvRexplorer.Selected.Caption;
end;

procedure TfrmTools.lvRexplorerSelectItem(Sender: TObject;
                                          Item: TListItem;
                                          Selected: Boolean);
begin
  if Selected then begin
    stbRexplorer.Panels[3].Text:= ' ' +
                                  IntToStr(lvRexplorer.Selected.Index + 1);
    stbRexplorer.Panels[5].Text:= lvRexplorer.Selected.Caption;
  end;

end;

procedure TfrmTools.lvRexplorerStartDrag(Sender: TObject;
                                         var DragObject: TDragObject);

   function GetItem: string;
    var
       sExtension,
        sItem,
        sTmp,
        sEnvironment: string;

   begin
     Result:= '';

     with lvRexplorer do begin
       if (Selected = nil) then Exit;
       if (Selected.SubItems.Strings[1] = 'function') then sExtension:= '.R'
                                                      else sExtension:= '.txt';
     end;

     sItem:= lvRexplorer.Selected.Caption;

     // It will get the R environment of the selected object
     if (Pos(':',
             cbbToolsREnvironment.Text) > 0) then sEnvironment:= fRegEx(cbbToolsREnvironment.Text, // It will get all from latest ':' to the end of string
                                                                        '[^:]+$',
                                                                        False)
                                             else sEnvironment:= EmptyStr;

     sTmp:= sItem + sExtension;

     with frmMain do
       if (sEnvironment = EmptyStr) then sDragSource:= sPath_Tmp +
                                                       '\' +
                                                       sTmp
       else begin
         sDragSource:= sPath_Tmp +
                       '\' +
                       sEnvironment +
                       '_' +
                       sTmp;

         sTmp:= sEnvironment +
                '_' +
                sTmp;

         sEnvironment:= sEnvironment +
                        '::';
       end;

     Result:= 'trExport(' +
              sEnvironment +
              sItem +
              ', ' +
              'type=''ascii''' +
              ', ' +
              'file=paste(.paths[1], ' +
              '''' +
              sTmp +
              '''' +
              ', sep=''\\''))';
   end;

var
  i: integer;

  sTmp,
   sToSend: string;

begin
  sTmp:= GetItem;

  if (sTmp = '') then Exit;

  //frmMain.pDoSend(sTmp);
  with frmMain do
    // Rterm: priority 2.1
    if fRterm_Running then begin
      sToSend:= sTmp + #13#10;

      if (csRExplorer.Active) then csRExplorer.Socket.SendText(sToSend)
      else begin
        pCheck_Rterm;
        pSend_ToConsole(sTmp);
        frmRterm.cRterm.SendInput(sToSend);
      end;

    end
    else // Rgui: priority 2.2
      if fRgui_Running then begin
        sToSend:= sTmp;

        if (csRExplorer.Active) then csRExplorer.Socket.SendText(sToSend +
                                                                 #13#10)
                                else fCodeSender.pSend_Char(sToSend,
                                                            hRgui);

        pSet_Focus_Rgui(iDelay div 4);
      end;

  i:= 0;
  repeat
    Sleep(frmMain.iDelay div 4);
    if FileExists(frmMain.sDragSource) and
       not fFile_InUse(frmMain.sDragSource) then Break;
    inc(i);
  until (i = 10);  // To avoid infinite loop

  frmMain.pSet_Focus_Rgui(0);
end;

procedure TfrmTools.pgDatabaseChange(Sender: TObject);
begin
  with pgDatabase do
    if      (ActivePage = tbsRcard)      then lbRcard.SetFocus
    else if (ActivePage = tbsCompletion) then lbCompletion.SetFocus
    else if (ActivePage = tbsRMirrors)   then lbCountries.SetFocus;

  pAdjustColumnWidths(dbgApp_Shortcuts);
  pAdjustColumnWidths(dbgEditor_Keystrokes);
  pAdjustColumnWidths(dbgRH_Send);
  pAdjustColumnWidths(dbgRH_Control);
  pAdjustColumnWidths(dbgRH_Custom);
  pAdjustColumnWidths(dbgCompletion);
  pAdjustColumnWidths(dbgRmirrors);
  pAdjustColumnWidths(dbgComments);
end;

procedure TfrmTools.pgMiscChange(Sender: TObject);
begin
  with pgMisc do
    if      (ActivePage = tbsWinExplorer)  then jvdlbWinExplorer.SetFocus
    else if (ActivePage = tbsWorkExplorer) then jvdlbWorkExplorer.SetFocus
    else if (ActivePage = tbsProject)      then tvProject.SetFocus;
end;

procedure TfrmTools.pgResultsChange(Sender: TObject);
begin
  frmMain.pUpdate_HexViewer;
end;

procedure TfrmTools.pgToolsChange(Sender: TObject);
begin
  pAdjustColumnWidths(dbgApp_Shortcuts);
  pAdjustColumnWidths(dbgEditor_Keystrokes);
  pAdjustColumnWidths(dbgRH_Send);
  pAdjustColumnWidths(dbgRH_Control);
  pAdjustColumnWidths(dbgRH_Custom);
  pAdjustColumnWidths(dbgCompletion);
  pAdjustColumnWidths(dbgRmirrors);
  pAdjustColumnWidths(dbgComments);
end;

procedure TfrmTools.rgHexViewerModeClick(Sender: TObject);
begin
  case rgHexViewerMode.ItemIndex of
    0: ATBinHex.Mode:= vbmodeText;    // Text
    1: ATBinHex.Mode:= vbmodeBinary;  // Binary
    2: ATBinHex.Mode:= vbmodeHex;     // Hex
    3: ATBinHex.Mode:= vbmodeUnicode; // Unicode
    4: ATBinHex.Mode:= vbmodeUHex;    // Unicode/Hex
  end;
end;

procedure TfrmTools.LabelClick(Sender: TObject);
begin
  frmMain.LabelClick(Sender);
end;

procedure TfrmTools.LabelMouseEnter(Sender: TObject);
begin
  with (Sender as TLabel).Font do begin
    Color:= clBlue;
    Style:= [fsUnderline];
  end;
end;

procedure TfrmTools.LabelMouseLeave(Sender: TObject);
begin
  with (Sender as TLabel).Font do begin
    Color:= clMenuText;
    Style:= [];
  end;
end;

procedure TfrmTools.LatexAccents(Sender: TObject;
                                 Button: TMouseButton;
                                 Shift: TShiftState;
                                 X,
                                 Y: Integer);
begin
  frmMain.LatexAccents(Sender,
                           Button,
                           Shift,
                           X,
                           Y);
end;

procedure TfrmTools.LatexHint(Sender: TObject;
                              Index: Integer;
                              var HintInfo: THintInfo;
                              var Handled: Boolean);
var
  sTmp: string;

  procedure FormatSymbol;
  var
    ipos: integer;

  begin
    sTmp:= ChangeFileExt(sTmp,
                         '');
    iPos:= Pos('_',
               sTmp);
    sTmp:= Copy(sTmp,
                iPos + 1,
                length(sTmp));
  end;

begin
  with Sender as TJvImagesViewer do begin
    sTmp:= ExtractFileName(Items[Index].FileName);
    FormatSymbol;
    Hint:= sTmp;
  end;
end;

procedure TfrmTools.LatexMouseMove(Sender: TObject;
                                   Shift: TShiftState;
                                   X,
                                   Y: Integer);
begin
  if not (Sender is TJvImagesViewer) then Exit;
  with Sender as TJvImagesViewer do
    Hint:= '';
end;

(*
// Adapted from From http://edn.embarcadero.com/article/27548
procedure TfrmTools.pAdjustColumnWidths(DBGrid: TDBGrid);
var
  iTotalColumnWidth,
   iColumnCount,
   iGridClientWidth,
   iFiller,
   i               : Integer;
begin
  iColumnCount:= DBGrid.Columns.Count;
  if (iColumnCount = 0) then Exit;

  // compute total width used by grid columns and vertical lines if any
  iTotalColumnWidth:= 0;
  for i:= 0 to iColumnCount-1 do
    iTotalColumnWidth:= iTotalColumnWidth + DBGrid.Columns[i].Width;
  if dgColLines in DBGrid.Options then
    // include vertical lines in total (one per column)
    iTotalColumnWidth:= iTotalColumnWidth + iColumnCount;

  // compute grid client width by excluding vertical scroll bar, grid indicator,
  // and grid border
  iGridClientWidth:= DBGrid.Width - GetSystemMetrics(SM_CXVSCROLL);
  if dgIndicator in DBGrid.Options then begin
    iGridClientWidth:= iGridClientWidth - IndicatorWidth;
    if dgColLines in DBGrid.Options then Dec(iGridClientWidth);
  end;
  if (DBGrid.BorderStyle = bsSingle) then begin
    if DBGrid.Ctl3D then // border is sunken (vertical border is 2 pixels wide)
      iGridClientWidth:= iGridClientWidth - 4
    else // border is one-dimensional (vertical border is one pixel wide)
      iGridClientWidth:= iGridClientWidth - 2;
  end;

  // adjust column widths
  if (iTotalColumnWidth < iGridClientWidth) then begin
    iFiller:= (iGridClientWidth - iTotalColumnWidth) div iColumnCount;
    for i:= 0 to iColumnCount-2 do
      DBGrid.Columns[i].Width:= DBGrid.Columns[i].Width + iFiller;
  end
  else if (iTotalColumnWidth > iGridClientWidth) then begin
    iFiller:= (iTotalColumnWidth - iGridClientWidth) div iColumnCount;
    if ((iTotalColumnWidth - iGridClientWidth) mod iColumnCount <> 0) then Inc(iFiller);
    for i:= 0 to iColumnCount-2 do
      DBGrid.Columns[i].Width:= DBGrid.Columns[i].Width - iFiller;
  end;
end;
*)

// Not too elegant than above, but works better!
procedure TfrmTools.pAdjustColumnWidths(DBGrid: TDBGrid);
begin                                     
  if (DBGrid.Name = 'dbgCompletion') or
     (DBGrid.Name = 'dbgApp_Shortcuts') or
     (DBGrid.Name = 'dbgEditor_Keystrokes') or
     (DBGrid.Name = 'dbgRH_Send') or
     (DBGrid.Name = 'dbgRH_Control') or
     (DBGrid.Name = 'dbgRH_Custom') or
     (DBGrid.Name = 'dbgRmirrors') then begin
    DBGrid.Columns[1].Width:= 100;
    DBGrid.Columns[0].Width:= DBGrid.Width -
                              (DBGrid.Columns[1].Width + 28)
  end
  else begin
    DBGrid.Columns[1].Width:= 50;
    DBGrid.Columns[2].Width:= 40;
    DBGrid.Columns[3].Width:= 40;
    DBGrid.Columns[0].Width:= DBGrid.Width -
                              (DBGrid.Columns[1].Width +
                               DBGrid.Columns[2].Width +
                               DBGrid.Columns[3].Width + 28)
  end;
end;

end.
