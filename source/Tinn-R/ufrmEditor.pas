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
 (http://cran.r-project.org). The project is coordened by Jos� Cl�udio Faria
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

unit ufrmEditor;

//The two directives below is to
//avoide Unit or symbol "Unit FileCtrl or faArchive etc" is specific to a plataform
//under Delphi 7
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEdit, Menus, StdActns, ActnList, SynRegExpr, StdCtrls, SynEditHighlighter,
  SynHighlighterMulti, ExtCtrls, SynEditTypes, SynEditRegExSearch,
  SynEditMiscClasses, SynEditSearch, SynExportTeX, SynExportRTF,
  SynEditExport, SynExportHTML, ClipBrd, SynCompletionProposal, DdeMan,
  ShellCtrls, ComCtrls, Httpapp, SynHighlighterURI, ShellAPI,
  JvDriveCtrls, JvExStdCtrls, SynUnicode, SynEditTextBuffer, ATFileNotificationSimple;

type
  TfrmEditor = class(TForm)
    synEditor: TSynEdit;
    synEditRegExSearch: TSynEditRegExSearch;
    synEditSearch: TSynEditSearch;

    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SplitMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SplitMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SplitMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure synEditorChange(Sender: TObject);
    procedure synEditorClick(Sender: TObject);
    procedure synEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure synEditorDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
    procedure synEditorEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure synEditorEnter(Sender: TObject);
    procedure synEditorGutterClick(Sender: TObject; Button: TMouseButton; X, Y, Line: Integer; Mark: TSynEditMark);
    procedure synEditorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synEditorKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synEditorMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure synEditorReplaceText(Sender: TObject; const ASearch, AReplace: WideString; Line, Column: Integer; var Action: TSynReplaceAction);
    procedure synEditorStatusChange(Sender: TObject; Changes: TSynStatusChanges);
    procedure synEditorKeyPress(Sender: TObject; var Key: WideChar);

  private
    { Private declarations }
    bAddBOM            : boolean;
    bHasFileBeenSaved  : boolean;
    bNeedsErase        : boolean;
    bSizing            : boolean;
    clientDDE          : TDDEClientConv;
    iLine              : integer;
    iSizeStart         : Integer;
    pLine              : TPoint;
    seSaveFormat       : TSynEncoding;
    spEditor           : TSplitter;
    //sReplaceTextHistory: string;


    function fMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
    function fDoSave_ModifiedFileQuery: boolean;
    procedure pDoSave_FileState;
//    procedure pDoSearchReplaceText(bReplace, bSearchAgain: boolean; bMessage: boolean = True);
//    procedure pFileClose;
    procedure pSetHighlighter_FromTag(iTag: integer);
    procedure pSetSyntax_Highlighter(sSynName: string);
    procedure pShowSearchReplaceDialog(bReplace: boolean);
//    procedure pToogleLineNumbers(bOption: boolean);
//    procedure pToogleSpecialChars(bChecked: boolean);


    // not rename the two below!
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

  public
    { Public declarations }
    bSearchSelectionOnly: boolean;
    bSendToREditing     : boolean;
    sActiveEditor       : string;
    sActiveFile         : string;
    sCompletion         : string;
    sReplace_Text       : string;
    sRtip               : string;
    sSearch_Text        : string;
    synEditor2          : TSynEdit;
    fNotif              : TATFileNotificationSimple;

    //procedure pMatchBracket;
    //procedure RtermSplit(bSplitHoriz: boolean = True);
    function fGet_BB_HighLighter: TSynCustomHighlighter;
    function fGet_BE_HighLighter: TSynCustomHighlighter;
    function fGet_Current_HighLighter: TSynCustomHighlighter;
    function fScrubCaption(sCap: string): string;
    function fSetHighlighterID: integer;

    procedure pCheckSaveStatus;
    procedure pColumn_Select;
    procedure pComment(sStartComment, sEndComment: string);
    procedure pCopyFormatted_HTML;
    procedure pCopyFormatted_RTF;
    procedure pCopyFormatted_TeX;
    procedure pCR;
    procedure pDateStamp;
    procedure pDoCardInsert;
    procedure pDoCompletion_Insert(bSearch: boolean = False);
    procedure pDoTip_Insert;
    procedure pEditor_RemoveSplit;
    procedure pEditor_Split(bSplitHoriz: boolean = True);
    procedure pEnableSave;
    procedure pFile_Changed(Sender: TObject);
    procedure pFile_Save(Sender: TObject);
    procedure pFile_SaveAs(Sender: TObject);
    procedure pFind;
    procedure pFindAgain;
    procedure pFullPath_Unix;
    procedure pFullPath_Windows;
    procedure pGetCursorTo(sWay: string);
    procedure pGotoLine;
    procedure pIndent_Block;
    procedure pInvert_Case;
    procedure pInvert_Selection;
    procedure pLine_Select;
    procedure pLowerCase_Selection;
    procedure pLowerCase_Word;
    procedure pNormal_Select;
    procedure pReplace;
    procedure pSearchError(sTmp: string);
    procedure pSetHighlighter_FromFileExt(sExt: string);
    procedure pSetHighlighter_Status(Sender: TObject);
    procedure pSetTitle;
    procedure pLineWrap_Toogle(bChecked: boolean);
    procedure pUncomment(sStartComment, sEndComment: string; rfTmp: TReplaceFlags = []);
    procedure pUnindent_Block;
    procedure pUpperCase_Selection;
    procedure pUpperCase_Word;
    procedure pNotifyFile_Start(sTmp: string);
    procedure pNotifyFile_Stop;
    procedure pDoSearchReplaceText(bReplace, bSearchAgain: boolean; bMessage: boolean = True);

   protected
    procedure Loaded; override;
  end;

(*
type
  TMySynEdit = class(TSynEdit)
end;
*)

var
  frmEditor: TfrmEditor;

implementation

uses
  DB,
  StrUtils,
  synEditKeyCmds,
  trSynUtils,
  trUtils,
  uDMSyn,
  ufrmConfirmReplace,
  ufrmGotoBox,
  ufrmMain,
  ufrmPrintPreview,
  ufrmReplace,
  ufrmSearch,
  uModDados,
  ufrmTools;

{$R *.DFM}

procedure TfrmEditor.pNotifyFile_Start(sTmp: string);
begin
  with fNotif do begin
    Timer.Enabled:= False;
    Timer.Interval:= 100;
    FileName:= sTmp;
    Timer.Enabled:= True;
  end;
end;

procedure TfrmEditor.pNotifyFile_Stop;
begin
  with fNotif do begin
    Timer.Enabled:= False;
  end;
end;

procedure TfrmEditor.pFile_Changed(Sender: TObject);
begin
  // If not totification: remove any prior notification and nothing to do.
  if not frmMain.actNotification.Checked then begin
    frmMain.slFileNotify.Clear;
    Exit;
  end;

  // If the application does not has focus
  // it will store the changes (related to open files) made by another programs.
  if (FindControl(GetForegroundWindow()) = nil) then
    with frmMain.slFileNotify do begin
      BeginUpdate;
      Add(fNotif.FileName);
      EndUpdate;
    end;
end;

procedure TfrmEditor.WMMDIActivate;
var
  iStyle: Longint;

begin
  if (Msg.ActiveWnd = Handle) and
     (biSystemMenu in BorderIcons) then
  begin
    iStyle:= GetWindowLong(Handle,
                           GWL_STYLE);
    if (iStyle and WS_MAXIMIZE <> 0) and
       (iStyle and WS_SYSMENU = 0) then SetWindowLong(Handle,
                                                      GWL_STYLE,
                                                      iStyle or WS_SYSMENU);
  end;
  inherited;
end;

// Save file status in database Cache.xml
procedure TfrmEditor.pDoSave_FileState;
var
  i       : integer;
  sMarks  : string;
  seEditor: TSynEdit;

begin
  if not FileExists(Caption) then Exit;

  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    for i:= 0 to Marks.Count - 1 do begin
      if Marks[i].IsBookmark then sMarks:= sMarks +
                                           ' ' +
                                           IntToStr(Marks[i].BookmarkNumber) +
                                           ':' +
                                           IntToStr(Marks[i].Line);
    end;

    modDados.fSave_FileState(Caption,
                             Trim(sMarks),
                             TopLine,
                             CaretX,
                             CaretY);
  end;
end;

procedure TfrmEditor.FormClose(Sender: TObject;
                               var Action: TCloseAction);
var
  i: integer;

  sNodeSelected: string;

begin
  frmMain.pRemoveTab(fScrubCaption(Caption));  //not remove from here!!!

  with frmMain do begin
    synURIOpener.Editor:= nil;  //don't remove this line!

    if (pgFiles.PageCount = 0) then begin
      pClearStatusBar;
      // The below is alphabetically ordered
      actBlockMark.Enabled                := False;
      actBlockUnmark.Enabled              := False;
      actColumnSelect.Enabled             := False;
      actComment.Enabled                  := False;
      actCompletion.Enabled               := False;
      actCompletionInsert.Enabled         := False;
      actDateStamp.Enabled                := False;
      actFileClose.Enabled                := False;
      actFileSave.Enabled                 := False;
      actFileSave.Enabled                 := False;
      actFileSaveAll.Enabled              := False;
      actFileSaveAs.Enabled               := False;
      actFind.Enabled                     := False;
      actFindAgain.Enabled                := False;
      actFullPathUnix.Enabled             := False;
      actFullPathWindows.Enabled          := False;
      actGotoLine.Enabled                 := False;
      actIndentBlock.Enabled              := False;
      actInvertCaseWord.Enabled           := False;
      actInvertSelection.Enabled          := False;
      actLatexAlgebricFrac.Enabled        := False;
      actLatexAlgebricSqrt.Enabled        := False;
      actLatexAlgebricSqrtN.Enabled       := False;
      actLatexDimensional.Enabled         := False;
      actLatexFontBold.Enabled            := False;
      actLatexFontEnphase.Enabled         := False;
      actLatexFontFootnote.Enabled        := False;
      actLatexFontHuge.Enabled            := False;
      actLatexFontHuger.Enabled           := False;
      actLatexFontItalic.Enabled          := False;
      actLatexFontLarge.Enabled           := False;
      actLatexFontLarger.Enabled          := False;
      actLatexFontLargest.Enabled         := False;
      actLatexFontNormal.Enabled          := False;
      actLatexFontScript.Enabled          := False;
      actLatexFontSlatend.Enabled         := False;
      actLatexFontSmall.Enabled           := False;
      actLatexFontSmallcaps.Enabled       := False;
      actLatexFontTiny.Enabled            := False;
      actLatexFontTypewriter.Enabled      := False;
      actLatexFormatCenter.Enabled        := False;
      actLatexFormatEnumeration.Enabled   := False;
      actLatexFormatItemization.Enabled   := False;
      actLatexFormatLeft.Enabled          := False;
      actLatexFormatRight.Enabled         := False;
      actLatexHeaderChapter.Enabled       := False;
      actLatexHeaderParagraph.Enabled     := False;
      actLatexHeaderPart.Enabled          := False;
      actLatexHeaderSection.Enabled       := False;
      actLatexHeaderSubParagraph.Enabled  := False;
      actLatexHeaderSubSection.Enabled    := False;
      actLatexHeaderSubSubSection.Enabled := False;
      actLineSelect.Enabled               := False;
      actLowercaseSelection.Enabled       := False;
      actLowerCaseWord.Enabled            := False;
      actMacroPlay.Enabled                := False;
      actMacroRecord.Enabled              := False;
      actMatchBracket.Enabled             := False;
      actNormalSelect.Enabled             := False;
      actOpenCurrentFile.Enabled          := False;
      actPrint.Enabled                    := False;
      actRcardInsert.Enabled              := False;
      actReadOnly.Checked                 := False;
      actReadOnly.Enabled                 := False;
      actReload.Enabled                   := False;
      actReplace.Enabled                  := False;
      actRSendSelection.Enabled           := False;
      actSortDate.Enabled                 := False;
      actSortNumber.Enabled               := False;
      actSortString.Enabled               := False;
      actSpell.Enabled                    := False;
      actSplitHorizontal.Enabled          := False;
      actSplitRemove.Enabled              := False;
      actSplitVertical.Enabled            := False;
      actUncomment.Enabled                := False;
      actUncommentFirst.Enabled           := False;
      actUnindentBlock.Enabled            := False;
      actUnmarkAll.Enabled                := False;
      actUpperCaseSelection.Enabled       := False;
      actUpperCaseWord.Enabled            := False;
      menForLinEndConMAC.Enabled          := False;
      menForLinEndConUNIX.Enabled         := False;
      menForLinEndConWIN.Enabled          := False;
      menForEncConANSI.Enabled            := False;
      menForEncConUTF16BE.Enabled         := False;
      menForEncConUTF16LE.Enabled         := False;
      menForEncConUTF8.Enabled            := False;
      menToolsConversionPandoc.Enabled    := False;
      menWebSearchSelGoogle.Enabled       := False;
      menWebSearchSelRArchives.Enabled    := False;
      menWebSearchSelRSite.Enabled        := False;
      tbFilter.Enabled                    := False;
      tbiPandoc.Enabled                   := False;
      pMinimizeTinnAfterLastFile;

      with tUpdateOptions do
        if (Enabled) then Enabled:= False;

      pSetToolbarProcessing('fileAllClosed.disableAll');  // will disable all Deplate, Txt2tags and MikTeX options
      pgFiles.Refresh;

      with frmTools do begin
        ATBinHex.OpenStream(nil);
        rgHexViewerMode.ItemIndex:= -1;
      end;
    end;

    for i:= 1 to (frmTools.tvProject.Items.Count -1) do begin
      sNodeSelected:= string(frmTools.tvProject.Items[i].Text);
      if (sNodeSelected = sActiveFile) then begin
        frmTools.tvProject.Items[i].Selected  := False;
        frmTools.tvProject.Items[i].ImageIndex:= 2;
      end;
    end;
  end;  //with frmMain
  if Assigned(clientDDE) then begin
    clientDDE.CloseLink;
    FreeAndNil(clientDDE);
  end;
  Action:= caFree;
end;

procedure TfrmEditor.pSetTitle;
var
  sStat: string;

begin
  sStat:= EmptyStr;

  if (synEditor.Modified = True) then sStat:= '*';

  Caption:= Format('%s%s',
                   [sActiveFile, sStat]);

  frmMain.pSetTabTitle(sStat);
end;

procedure TfrmEditor.pCheckSaveStatus;
begin
  if (synEditor.Modified = True) then begin
    frmMain.actFileSave.Enabled   := True;
    frmMain.actFileSaveAs.Enabled := True;
    frmMain.actFileSaveAll.Enabled:= True;
  end
  else
    frmMain.actFileSave.Enabled:= False;
end;

procedure TfrmEditor.FormCloseQuery(Sender: TObject;
                                    var CanClose: Boolean);
begin
  if frmMain.bRememberFileState then pDoSave_FileState;

  if not synEditor.Modified then begin
    CanClose:= True;
    Exit;
  end;

  if synEditor.Modified and
     not (synEditor.ReadOnly) then CanClose:= fDoSave_ModifiedFileQuery
  else if synEditor.ReadOnly then begin
    CanClose:= False;
    pFile_Save(Sender);
  end;
end;

function TfrmEditor.fDoSave_ModifiedFileQuery: boolean;
var
  i,
   iSaveResp: Integer;

begin
  Result:= False;

  with frmMain do begin
    for i:= 0 to (pgFiles.PageCount -1) do
      if (pgFiles.Pages[i].Hint = sActiveFile) then begin
        pgFiles.ActivePageIndex:= i;
        pgFilesChange(nil);
      end;
  end;

  iSaveResp:= fMessageDlg(sActiveFile + #13 + #13 +
                          'The file above was changed.' + #13 +
                          'Do you like to save the changes?',
                          mtConfirmation,
                          [mbYes, mbNo, mbCancel],
                          0);

  case iSaveResp of
    idYes   : begin
               pFile_Save(Self);
               Result:= True;
              end;
    idNo    : Result:= True;
    idCancel: begin
                Result:= False;
                frmMain.bCloseCanceled:= True;
              end;
  end;
end;

function fGetEncoding_ToSave(sf: TSaveFormat): TSynEncoding;
var
  se: TSynEncoding;

begin
  case sf of
    sfUTF8:     se:= seUTF8;
    sfUTF16LSB: se:= seUTF16LE;
    sfUTF16MSB: se:= seUTF16BE;
    else
      se:= seANSI;
  end;

  Result:= se;
end;

procedure TfrmEditor.pFile_Save(Sender: TObject);
var
  wFileAtt: Word;

begin
  try
    if ExecRegExpr('^Untitled',
                   sActiveFile) then begin

      pFile_SaveAs(Sender);

      frmMain.sWorkingDir:= fStrip_FileName(frmMain.sdMain.fileName);
    end
    else begin
      if not synEditor.ReadOnly then begin
        wFileAtt:= FileGetAttr(sActiveFile);

        wFileAtt:= wFileAtt and
                   not SysUtils.faReadOnly;

        FileSetAttr(sActiveFile,
                    wFileAtt);

        seSaveFormat:= fGetEncoding_ToSave(TSynEditStringList(synEditor.Lines).SaveFormat);

        if (seSaveFormat = seUTF8) then begin  // UTF-8 can has (or not) the BOM
          if (frmMain.actAlwaysAddBOM.Checked) then bAddBOM:= True   // The user want add the BOM
                                               else bAddBOM:= False; // The user doens't want add the BOM
        end
        else begin
          if (seSaveFormat = seANSI) then bAddBOM:= False  // ANSI never has the BOM
                                     else bAddBOM:= True;  // Always has the BOM: UTF-16LE and UTF-16BE 
        end;

        SaveToFile(synEditor.Lines,
                   sActiveFile,
                   seSaveFormat,
                   bAddBOM);

        synEditor.Modified:= False;
        pSetTitle;
        frmMain.actFileSave.Enabled:= False;

        if (frmMain.pgFiles.ActivePage.Tag = -1) then pSetHighlighter_FromFileExt(ExtractFileExt(sActiveFile));
        frmMain.sWorkingDir:= ExtractFilePath(sActiveFile);

        if (frmMain.bUndoAfterSave = False) then synEditor.UndoList.Clear;
        bHasFileBeenSaved:= True;

        with frmMain do begin
          pSetFileSize_StatusBar(sActiveFile);

          pGetFile_Info(sActiveFile,
                        synEditor.Lines);
        end;

        if frmMain.bRememberFileState then pDoSave_FileState;
      end
      else begin //if ReadOnly
        fMessageDlg(sActiveFile + #13 + #13 +
                    'This file was changed and posteriorly set as read only!' + #13 +
                    'Please, save this file with a different name, or,' + #13 +
                    'change its to not read only.',
                    mtWarning,
                    [mbOK],
                    0);
      end;
    end;
  except
    on e: exception do
      fMessageDlg('Error: ' + e.message,
                  mtError,
                  [mbOK],
                  0);
  end;
end;

procedure TfrmEditor.pFile_SaveAs(Sender: TObject);
var
  sFile: string;

  wFileAtt: word;

begin
  frmMain.sdMain.InitialDir:= frmMain.sWorkingDir;
  sFile:= StringReplace(Self.Caption,
                        '*',
                        EmptyStr,
                        [rfReplaceAll]);

  if frmMain.bRemoveExtension then sFile:= fRemove_FileExtension(sFile);

  frmMain.sdMain.fileName   := sFile;
  frmMain.sdMain.FilterIndex:= frmMain.iFilterToSaveAs;

  if frmMain.sdMain.Execute then begin
    sFile:= frmMain.sdMain.FileName;
    if not (frmMain.sSaveAsFileExt = '.*') then
      if (Pos(lowerCase(ExtractFileExt(sFile)),
              lowerCase(frmMain.sFileExtensions)) = 0) then
        sFile:= frmMain.sdMain.fileName +
                frmMain.sSaveAsFileExt;

    if FileExists(sFile) then begin
      if (fMessageDlg(sFile + #13 + #13 +
                      'Do you want to overwrite this file?',
                      mtConfirmation,
                      [mbYES, mbCANCEL],
                      0) <> idYES) then Exit;

      DeleteFile(sFile);
    end;

    wFileAtt:= FileGetAttr(sFile);

    wFileAtt:= wFileAtt and
               not SysUtils.faReadOnly;

    FileSetAttr(sFile,
                wFileAtt);

    seSaveFormat:= fGetEncoding_ToSave(TSynEditStringList(synEditor.Lines).SaveFormat);

    if (seSaveFormat = seUTF8) then begin  // It can has (or not) the BOM
      if (frmMain.actAlwaysAddBOM.Checked) then bAddBOM:= True
                                           else bAddBOM:= False;
    end
    else begin
      if (seSaveFormat = seANSI) then bAddBOM:= False  // Never has BOM
                                 else bAddBOM:= True;  // Always has BOM
    end;

    SaveToFile(synEditor.Lines,
               sFile,
               seSaveFormat,
               bAddBOM);

    sActiveFile:= sFile;  //Set public variable sFile
    frmMain.pgFiles.Pages[frmMain.pgFiles.ActivePageIndex].Caption:= fStrip_Path(sActiveFile);
    frmMain.pgFiles.Pages[frmMain.pgFiles.ActivePageIndex].Hint:= sActiveFile;

    synEditor.Modified:= False;
    frmMain.sWorkingDir:= fStrip_FileName(sFile);
    pSetHighlighter_FromFileExt(ExtractFileExt(sActiveFile));

    frmMain.actFileSave.Enabled:= False;
    pSetTitle;

    if (frmMain.bUndoAfterSave = False) then synEditor.UndoList.Clear;
    bHasFileBeenSaved:= True;

    with frmMain do begin
      pSetFileSize_StatusBar(sActiveFile);

      pGetFile_Info(sActiveFile,
                    synEditor.Lines);

      pUpdateMRU(menFileRecentFiles,
                 sActiveFile);

      if bRememberFileState then pDoSave_FileState;
    end;
  end;  //if frmMain.dlgSDMain.Execute
  frmMain.sSaveAsFileExt:= EmptyStr;
end;

procedure TfrmEditor.synEditorChange(Sender: TObject);
var
  iTopLine: Integer;

begin
  pEnableSave;

  if Assigned(synEditor2) then begin
    if (sActiveEditor = 'synEditor') then begin
      synEditor2.BeginUpdate;
      iTopLine             := synEditor2.TopLine;
      synEditor2.Lines.Text:= synEditor.Lines.Text;
      synEditor2.TopLine   := iTopLine;
      synEditor2.EndUpdate;
    end
    else begin
      synEditor.BeginUpdate;
      iTopLine            := synEditor.TopLine;
      synEditor.Lines.Text:= synEditor2.Lines.Text;
      synEditor.TopLine   := iTopLine;
      synEditor.EndUpdate;
    end;
  end;

  frmMain.pUpdateHexViewer;
end;

procedure TfrmEditor.FormCreate(Sender: TObject);
begin
  with frmMain do begin
    if actOpenMaximized.Checked then Self.WindowState:= wsMaximized
                                else Self.WindowState:= wsNormal;

    sActiveFile:= 'Untitled' +
                  IntToStr(iFileCount);

    pUpdateCursorPos(synEditor);
  end;

  Caption:= sActiveFile;

  sActiveEditor:= 'synEditor';

  // Set encoding and delimiter default
  synEditor.Lines.SaveFormat:= frmMain.sfDefault;
  TSynEditStringList(synEditor.Lines).FileFormat:= frmMain.ffDefault;

  with frmMain do begin
    // The below is alphabetically ordered
    actBlockMark.Enabled                := True;
    actBlockUnmark.Enabled              := True;
    actColumnSelect.Enabled             := True;
    actComment.Enabled                  := True;
    actCompletion.Enabled               := True;
    actCompletionInsert.Enabled         := True;
    actDateStamp.Enabled                := True;
    actFileClose.Enabled                := True;
    actFileSaveAs.Enabled               := True;
    actFind.Enabled                     := True;
    actFindAgain.Enabled                := True;
    actFullPathUnix.Enabled             := True;
    actFullPathWindows.Enabled          := True;
    actGotoLine.Enabled                 := True;
    actInvertCaseWord.Enabled           := True;
    actLatexAlgebricFrac.Enabled        := True;
    actLatexAlgebricSqrt.Enabled        := True;
    actLatexAlgebricSqrtN.Enabled       := True;
    actLatexDimensional.Enabled         := True;
    actLatexFontBold.Enabled            := True;
    actLatexFontEnphase.Enabled         := True;
    actLatexFontFootnote.Enabled        := True;
    actLatexFontHuge.Enabled            := True;
    actLatexFontHuger.Enabled           := True;
    actLatexFontItalic.Enabled          := True;
    actLatexFontLarge.Enabled           := True;
    actLatexFontLarger.Enabled          := True;
    actLatexFontLargest.Enabled         := True;
    actLatexFontNormal.Enabled          := True;
    actLatexFontScript.Enabled          := True;
    actLatexFontSlatend.Enabled         := True;
    actLatexFontSmall.Enabled           := True;
    actLatexFontSmallcaps.Enabled       := True;
    actLatexFontTiny.Enabled            := True;
    actLatexFontTypewriter.Enabled      := True;
    actLatexFormatCenter.Enabled        := True;
    actLatexFormatEnumeration.Enabled   := True;
    actLatexFormatItemization.Enabled   := True;
    actLatexFormatLeft.Enabled          := True;
    actLatexFormatRight.Enabled         := True;
    actLatexHeaderChapter.Enabled       := True;
    actLatexHeaderParagraph.Enabled     := True;
    actLatexHeaderPart.Enabled          := True;
    actLatexHeaderSection.Enabled       := True;
    actLatexHeaderSubParagraph.Enabled  := True;
    actLatexHeaderSubSection.Enabled    := True;
    actLatexHeaderSubSubSection.Enabled := True;
    actLineSelect.Enabled               := True;
    actLowerCaseWord.Enabled            := True;
    actMacroPlay.Enabled                := True;
    actMacroRecord.Enabled              := True;
    actMatchBracket.Enabled             := True;
    actNormalSelect.Enabled             := True;
    actOpenCurrentFile.Enabled          := True;
    actPrint.Enabled                    := True;
    actRcardInsert.Enabled              := True;
    actReadOnly.Enabled                 := True;
    actReload.Enabled                   := True;
    actReplace.Enabled                  := True;
    actSortDate.Enabled                 := True;
    actSortNumber.Enabled               := True;
    actSortString.Enabled               := True;
    actSpell.Enabled                    := True;
    actSplitHorizontal.Enabled          := True;
    actSplitRemove.Enabled              := True;
    actSplitVertical.Enabled            := True;
    actUncomment.Enabled                := True;
    actUncommentFirst.Enabled           := True;
    actUnmarkAll.Enabled                := True;
    actUpperCaseWord.Enabled            := True;
    menForLinEndConMAC.Enabled          := True;
    menForLinEndConUNIX.Enabled         := True;
    menForLinEndConWIN.Enabled          := True;
    menForEncConANSI.Enabled            := True;
    menForEncConUTF16BE.Enabled         := True;
    menForEncConUTF16LE.Enabled         := True;
    menForEncConUTF8.Enabled            := True;
    menToolsConversionPandoc.Enabled    := True;
    menWebSearchSelGoogle.Enabled       := True;
    menWebSearchSelRArchives.Enabled    := True;
    menWebSearchSelRSite.Enabled        := True;
    synMR.Editor                        := synEditor;
    tbFilter.Enabled                    := True;
    tbiPandoc.Enabled                   := True;

    iSynWithFocus                       := 1;

    if (synEditor.ReadOnly = False) then actFileSave.Enabled:= True;

    with tUpdateOptions do  // Activate the timer who control the R options..
      if not Enabled then Enabled:= True;

    stbMain.Panels[8].Text:= EmptyStr;
    stbMain.Panels[9].Text:= EmptyStr;

    actRtermWarningError.Visible:= False;
  end;

  with frmMain do begin
    coEditor.Gutter.Width:= 15;  // It is necessary to gutter be visible when ShowLineNumbers is False and Gutter.Visible is True;
    coEditor.AssignTo(synEditor);
  end;
end;

procedure TfrmEditor.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmEditor.FormActivate(Sender: TObject);
var
  bDone: boolean;

  i: integer;

  slSynName: TStringList;

  sTmp: string;

begin
  sTmp:= sActiveFile;
  i:= 0;
  bDone:= False;

  while not(bDone) do
    if (i > frmMain.pgFiles.PageCount -1) then
      bDone:= True
    else begin
      if (frmMain.pgFiles.Pages[i].Hint = fScrubCaption(Caption)) then begin
        frmMain.pgFiles.ActivePageIndex:= i;

        bDone:= True;
      end;

      inc(i);
    end;

  frmMain.pUpdateCursorPos(synEditor);

  if Assigned(frmMain.pgFiles.ActivePage) then begin
    if (frmMain.pgFiles.ActivePage.Tag = -1) then pSetHighlighter_FromFileExt(ExtractFileExt(sActiveFile))
                                             else pSetHighlighter_FromTag(frmMain.pgFiles.ActivePage.Tag);
  end
  else begin  //To the first new file
    slSynName:= TStringlist.Create;
    if frmMain.actRSimpleDefault.Checked then
      slSynName.Text:= dmSyn.SynR.GetFriendlyLanguageName
    else if frmMain.actRComplexDefault.Checked then
      slSynName.Text:= dmSyn.SynRComplex.DefaultLanguageName
    else if frmMain.actTextDefault.Checked then
      slSynName.Text:= dmSyn.SynText.GetFriendlyLanguageName
    else
      slSynName.Text:= dmSyn.SynAll.GetFriendlyLanguageName;

    pSetHighlighter_Status(slSynName);

    FreeAndNil(slSynName)
  end;

  if not synEditor.ReadOnly then begin
    with frmMain do begin
      stbMain.Panels[3].Text:= 'Editing';

      actReadOnly.Checked:= False;
    end;
  end
  else begin
    with frmMain do begin
      stbMain.Panels[3].Text:= 'Read only';

      actReadOnly.Checked:= True;
    end;
  end;

  pCheckSaveStatus;

  with frmMain do begin
    pSetFileSize_StatusBar(sActiveFile);

    pGetFile_Info(sActiveFile,
                  synEditor.Lines);

    //stbMain.Panels[4].Text:= 'Normal';
    pDrawSelectionMode(0);
  end;
end;

procedure TfrmEditor.pDoCardInsert;
var
  seEditor: TSynEdit;

  sSearch_OldText,
   sFunction,
   stmp: string;

  slTmp: TStringList;

  iPos,
   iPriPos: integer;

begin
  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  if not fSave_PriorClipboard_Text then Exit;

  with modDados.cdRcard do
    sFunction:= FieldValues['Function'];

  iPos:= Pos('(',
             sFunction);

  sTmp:= Copy(sFunction,
              iPos + 1,
              length(sFunction) - (iPos + 1));

  Clipboard.AsText:= sFunction;

  with seEditor do begin
    iPriPos:= CaretX;
    PasteFromClipboard;
  end;

  if (iPos > 0) then begin
    slTmp:= TStringList.Create;
    pString_Split(',',
                  sTmp,
                  slTmp);
  end;

  sSearch_OldText:= sSearch_Text;
  if Assigned(slTmp) and
     (slTmp.Count >=1) then begin
    sSearch_Text   := slTmp[0];
    seEditor.CaretX:= iPos;
  end
  else begin
    seEditor.CaretX:= iPriPos +
                      iPos;
    FreeAndNil(slTmp);
    pEnableSave;
    pRestore_PriorClipboard_Text;
    Exit;
  end;

  pDoSearchReplaceText(False,
                       True,
                       False);

  sSearch_Text:= sSearch_OldText;

  FreeAndNil(slTmp);
  pEnableSave;
  pRestore_PriorClipboard_Text;
end;

procedure TfrmEditor.pDoTip_Insert;
var
  seEditor: TSynEdit;

  sTip,
   sFunction,
   sSearch_OldText: string;

  slTmp: TStringList;

  iPos: integer;

begin
  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  if not fSave_PriorClipboard_Text then Exit;

  Clipboard.AsText:= sFunction +
                     '(' +
                     sTip +
                     ')';

  with seEditor do begin
    iPos:= CaretX;
    PasteFromClipboard;
    CaretX:= iPos +
             Length(sFunction);
  end;

  slTmp:= TStringList.Create;
  pString_Split(',',
                sTip,
                slTmp);

  sSearch_OldText:= sSearch_Text;
  sSearch_Text   := slTmp[0];

  pDoSearchReplaceText(False,
                       True,
                       False);

  sSearch_Text:= sSearch_OldText;

  FreeAndNil(slTmp);
  pEnableSave;

  pRestore_PriorClipboard_Text;
end;

procedure TfrmEditor.pDoCompletion_Insert(bSearch: boolean = False);
var
  seEditor: TSynEdit;

  sTrigger,
   sCompletion: string;

  bcPos: TBufferCoord;

  pPointer: TBookMark;

begin
  if not fSave_PriorClipboard_Text then Exit;

  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  //ShowMessage(fGetTrigger_Left(seEditor)); Exit;

  bcPos:= seEditor.CaretXY;

  if not bSearch then
    with modDados do
      sCompletion:= cdCompletionCompletion.Value
  else begin
    with modDados do begin
      with cdCompletion do begin
        pPointer:= GetBookMark;
        DisableControls;
        Filtered:= False;
      end;

      //sTrigger:= fFindTrigger(seEditor);
      sTrigger:= fTrigger_Get_Left(seEditor);

      if cdCompletion.Locate('Trigger',
                             sTrigger,
                             []) then sCompletion:= cdCompletionCompletion.Value
                                 else sCompletion:= EmptyStr;

      with cdCompletion do begin
        Filtered:= True;
        EnableControls;
        GoToBookMark(pPointer);
        FreeBookMark(pPointer);
      end;
    end;
  end;

  if (sCompletion = EmptyStr) then begin
    frmMain.stbMain.Panels[8].Text:= 'Completion not found';
    frmMain.stbMain.Panels[9].Text:= '<'+
                                     sTrigger +
                                     '>';
    pRestore_PriorClipboard_Text;
    seEditor.CaretXY:= bcPos;
    seEditor.UpdateCaret;
    Exit;
  end;

  pInsertText_Smart(seEditor,
                    sCompletion,
                    Length(sTrigger));

  // Will search the next '|' as part of the stop of the completion
  sSearch_Text:= '|';

  with frmMain do
    bSearch_RegExp:= False;  // Do not remove due to '|' -> or in fRegEx

  pDoSearchReplaceText(False,
                       True,
                       False);

  pEnableSave;
end;

// Send current line to R when editing
procedure TfrmEditor.pCR;
var
  seEditor: TSynEdit;
  
begin
  if not frmMain.fValidR_Running then
    Exit;

  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  bSendToREditing:= True;
  with seEditor do begin  // The below is redundant (but low cust) and avoid send intermitent final character!
    ExecuteCommand(ecLineEnd,
                   #0,
                   nil);

    ExecuteCommand(ecLineBreak,
                  #0,
                  nil);

    CaretY:= CaretY - 1;

    frmMain.actRSendLineExecute(nil);

    CaretY:= CaretY + 1;
  end;
  bSendToREditing:= False;
  pEnableSave;
end;

procedure TfrmEditor.synEditorKeyDown(Sender: TObject;
                                      var Key: Word;
                                      Shift: TShiftState);
var
  iPosX   : integer;
  seEditor: TSynEdit;

begin
  with frmMain do
    actRtermEditorSetFocus.Checked:= True;

//  case Key of
//    1..15,
//    18..31,
//    33..36,
//    38,
//    40..44,
//    46..67,
//    69..105,
//    108,
//    110..300:
//    begin
//      with frmMain do begin
//        stbMain.Panels[8].Text:= EmptyStr;
//        stbMain.Panels[9].Text:= EmptyStr;
//        actRtermWarningError.Visible:= False;
//      end;
//    end;
//  end;

   with frmMain do begin
     stbMain.Panels[8].Text:= EmptyStr;
     stbMain.Panels[9].Text:= EmptyStr;
     actRtermWarningError.Visible:= False;
   end;

  if frmMain.actReadOnly.Checked then Exit;

  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  // SHIFT + Ins is the default 'paste' shortcut of synEdit
  if (Shift = [ssShift]) and
     (Key = VK_INSERT) then pEnableSave;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_RETURN  : pCR;

      VK_MULTIPLY: begin //Add or replace text by tip: R server or database
                     with seEditor do begin
                       iPosX  := CaretX;
                       SelText:= frmMain.sTipToWrite +
                                 ')';
                       CaretX := iPosX;
                     end;
                     frmMain.sTipToWrite:= EmptyStr;
                     pEnableSave;
                   end;

      // The below avoid problens with undo/redo and eoScrollPastEol (in or not in options)
      VK_ADD     : with seEditor do begin //Add or replace text by attribution symbol: ->
                     SelText:= ' ->';

                     ExecuteCommand(ecChar,
                                    ' ',
                                    nil);
                   end;

      // The below avoid problens with undo/redo and eoScrollPastEol (in or not in options)
      VK_SUBTRACT: with seEditor do begin //Add or replace text by attribution symbol: <-
                     SelText:= ' <-';

                     ExecuteCommand(ecChar,
                                    ' ',
                                    nil);
                   end;
     {// After autocompletion resource the below it is no more necessary !
      48         : with seEditor do
                     SelText:= '()';       // )

      57         : with seEditor do begin  // (
                     SelText:= '()';
                     CaretX := CaretX - 1;
                   end;
     }
    end;
end;

procedure TfrmEditor.synEditorKeyPress(Sender: TObject;
                                       var Key: WideChar);

  function sFormat(sTmp: string;
                   cTmp: char): string;
  begin
    Result:= key +
             sTmp +
             cTmp;
  end;

var
  seEditor: TSynEdit;

  procedure InsertText(seEdt: TSynEdit;
                       sTmp: string;
                       i: integer);
  begin
    with seEdt do begin
      SelText:= sTmp;
      CaretX := CaretX - i;
    end;

    key:= #0;  // make null the key pressed
  end;

begin
  if frmMain.actReadOnly.Checked then Exit;

  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  if frmMain.actAutoCompletion.Checked then
    with seEditor do
      case key of
         '(': if SelAvail then
                InsertText(seEditor,
                           sFormat(SelText,
                                   ')'),
                           0)
              else
                InsertText(seEditor,
                           sFormat(SelText,
                                   ')'),
                           1);
         '[': if SelAvail then
                InsertText(seEditor,
                           sFormat(SelText,
                                   ']'),
                           0)
              else
                InsertText(seEditor,
                           sFormat(SelText,
                                   ']'),
                           1);
         '{': if SelAvail then
                InsertText(seEditor,
                           sFormat(SelText,
                                   '}'),
                           0)
              else
                InsertText(seEditor,
                           sFormat(SelText,
                                   '}'),
                           1);
        '''': if SelAvail then
                InsertText(seEditor,
                           sFormat(SelText,
                                   ''''),
                           0)
              else
                InsertText(seEditor,
                           sFormat(SelText,
                                   ''''),
                           1);
         '"': if SelAvail then
                InsertText(seEditor,
                           sFormat(SelText,
                                   '"'),
                           0)
              else
                InsertText(seEditor,
                           sFormat(SelText,
                                   '"'),
                           1);
      end;
end;

procedure TfrmEditor.synEditorKeyUp(Sender: TObject;
                                    var Key: Word;
                                    Shift: TShiftState);
begin
  if (Sender = synEditor) then frmMain.iSynWithFocus:= 1
                          else frmMain.iSynWithFocus:= 2;

end;

procedure TfrmEditor.synEditorMouseUp(Sender: TObject;
                                      Button: TMouseButton;
                                      Shift: TShiftState;
                                      X,
                                      Y: Integer);
begin
  if (Sender = synEditor) then frmMain.iSynWithFocus:= 1
                          else frmMain.iSynWithFocus:= 2;
end;

procedure TfrmEditor.synEditorReplaceText(Sender: TObject;
                                          const ASearch,
                                          AReplace: WideString;
                                          Line,
                                           Column: Integer;
                                          var Action: TSynReplaceAction);
var
  editRect: TRect;

  pPos: TPoint;

  seEditor: TSynEdit;

begin
  if (ASearch = AReplace) then Action:= raSkip
  else begin
    seEditor:= TSynEdit(Sender);

    pPos:= synEditor.ClientToScreen(seEditor.RowColumnToPixels
                                   (seEditor.BufferToDisplayPos
                                   (BufferCoord(Column,
                                                Line))));

    editRect            := ClientRect;
    editRect.TopLeft    := ClientToScreen(editRect.TopLeft);
    editRect.BottomRight:= ClientToScreen(editRect.BottomRight);

    if (frmConfirm_Replace_Dlg = nil) then
      frmConfirm_Replace_Dlg:= TfrmConfirm_Replace_Dlg.Create(Application);

    {
    // The dialog stay alway near of the ASearch: fine but a bit tired!
    frmConfirmReplaceDialog.PrepareShow(editRect,
                                        pPos.X,
                                        pPos.Y,
                                        pPos.Y + synEditor.LineHeight,
                                        ASearch);
    }


    // The dialog will stay on top and right aligned
    with frmConfirm_Replace_Dlg do
      pPrepareShow(editRect,
                   pPos.X,
                   pPos.Y,
                   ASearch);

    case frmConfirm_Replace_Dlg.ShowModal of
      mrYes     : Action:= raReplace;
      mrYesToAll: Action:= raReplaceAll;
      mrNo      : Action:= raSkip;
      else Action:= raCancel;
    end;
  end;
end;

procedure TfrmEditor.pSetHighlighter_FromFileExt(sExt: string);
var
  i,
   iDelimiter,
   iLenFilter: integer;

  slFilters: TStringList;

  sLine,
   sValidFilters,
   sDefaultFilter: string;

  slSynName: TStringlist;

begin
  frmMain.pSetToolbarProcessing(sExt);
  slSynName:= TStringlist.Create;
  slFilters:= TStringList.Create;
  slSynName.Text:= dmSyn.SynAll.GetFriendlyLanguageName;  //The default

  if (sExt <> EmptyStr) then begin  //Will to try to find the file type
    sExt:= '*' + LowerCase(sExt);
    for i:= 0 to (dmSyn.iHigCount - 1) do begin
      sDefaultFilter:= (dmSyn.Components[i] as TSynCustomHighlighter).DefaultFilter;
      iLenFilter:= length(sDefaultFilter);

      iDelimiter:= Pos('|',
                       sDefaultFilter);

      sValidFilters:= Copy(sDefaultFilter,
                           (iDelimiter + 1),
                           (iLenFilter - iDelimiter));
      pString_Split(';',
                    sValidFilters,
                    slFilters);

      if (slFilters.IndexOf(sExt) > -1) then begin
        if (sExt = '*.txt') then slSynName.Text:= 'Text'
        else if (sExt = '*.r') or
                (sExt = '*.rhistory') or
                (sExt = '*.q') or
                (sExt = '*.s') or
                (sExt = '*.ssc') then
          if frmMain.actRSimpleDefault.Checked then
            slSynName.Text:= 'R'
          else
            slSynName.Text:= 'R complex'
        else begin
          slSynName.Text:= (dmSyn.Components[i] as TSynCustomHighlighter).GetFriendlyLanguageName;

          if (Trim(slSynName.Text) = 'General_Multi-Highlighter') then
            slSynName.Text:= (dmSyn.Components[i] as TSynMultiSyn).DefaultLanguageName;
          Break;
        end;
      end;
    end;
  end
  else begin // Will to check the first few lines to see what is in the file
    sLine:= self.synEditor.Lines.Strings[0];
    sLine:= sLine + self.synEditor.Lines.Strings[1];
    sLine:= sLine + self.synEditor.Lines.Strings[2];
    if (ExecRegExpr('<html>', sLine))              then slSynName.Text:= dmSyn.SynHTMLcomplex.DefaultLanguageName
    else if (ExecRegExpr('<html', sLine))          then slSynName.Text:= dmSyn.SynHTMLcomplex.DefaultLanguageName
    else if (ExecRegExpr('<HTML', sLine))          then slSynName.Text:= dmSyn.SynHTMLcomplex.DefaultLanguageName
    else if (ExecRegExpr('<?php', sLine))          then slSynName.Text:= dmSyn.SynPHP.GetFriendlyLanguageName
    else if frmMain.actRSimpleDefault.Checked  then slSynName.Text:= dmSyn.SynR.GetFriendlyLanguageName
    else if frmMain.actRComplexDefault.Checked then slSynName.Text:= dmSyn.SynRComplex.DefaultLanguageName
    else if frmMain.actTextDefault.Checked     then slSynName.Text:= dmSyn.SynText.GetFriendlyLanguageName;
  end;

  //ShowMessage(slSynName.Text);  //To debug
  pSetHighlighter_Status(slSynName);

  FreeAndNil(slSynName);
  FreeAndNil(slFilters);
end;

procedure TfrmEditor.pSetHighlighter_Status(Sender: TObject);
var
  sSynName: string;

begin
  if (Sender is TMenuItem) then
    sSynName:= StringReplace((Sender as TMenuItem).Caption,
                             '&',
                             EmptyStr,
                             [rfReplaceAll])
  else if (Sender is TComboBox) then
    sSynName:= Trim((Sender as TComboBox).Text)
  else
    sSynName:= Trim((Sender as TStringList).text);

  frmMain.pSetSyntaxMenuItem(sSynName);
  frmMain.pSetSyntaxComboBox(sSynName);

  pSetSyntax_Highlighter(sSynName);
end;

procedure TfrmEditor.pSetSyntax_Highlighter(sSynName: string);
var
  i: integer;

  sHighligh: string;

begin
  for i:= 0 to (dmSyn.iHigCount - 1) do begin
    sHighligh:= (dmSyn.Components[i] as TSynCustomHighlighter).GetFriendlyLanguageName;

    if (sSynName = 'Text') then
      synEditor.Highlighter:= dmSyn.SynText;

    if (sHighligh = sSynName) and
      ((dmSyn.Components[i] as TSynCustomHighlighter).Tag <> 99) then // Tag = 99 is atribute of Rterm
      synEditor.Highlighter:= (dmSyn.Components[i] as TSynCustomHighlighter);

    if (sHighligh = 'General_Multi-Highlighter') then begin
      sHighligh:= (dmSyn.Components[i] as TSynMultiSyn).DefaultLanguageName;

      if (sHighligh = sSynName) then
        synEditor.Highlighter:= (dmSyn.Components[i] as TSynMultiSyn);
    end;
  end;
  if Assigned(synEditor2) then
    synEditor2.Highlighter:= synEditor.Highlighter;
end;

procedure TfrmEditor.synEditorStatusChange(Sender: TObject;
                                           Changes: TSynStatusChanges);
begin
  frmMain.pUpdateCursorPos(Sender as TsynEdit);
  iLine:= (Sender as TsynEdit).CaretX;
end;

procedure TfrmEditor.pFind;
begin
  // Show find box
  pShowSearchReplaceDialog(FALSE);
end;

procedure TfrmEditor.pGotoLine;
var
  gotoBox: TfrmGotoBox;

  pLineNumber: TPoint;

  seEditor: TSynEdit;

begin
  try
    gotoBox:= TfrmGotoBox.Create(application);

    if GotoBox.ShowModal = mrOK then begin
      pLineNumber.y:= gotoBox.spLine.AsInteger;
      pLineNumber.x:= 1;

      // Define the active editor
      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                       else seEditor:= synEditor2;

      seEditor.ExecuteCommand(ecGotoXY,
                              'A',
                              @pLineNumber);
    end;
  finally
    FreeAndNil(gotoBox);
  end;
end;

procedure TfrmEditor.pShowSearchReplaceDialog(bReplace: boolean);
var
  dlg: TfrmSearchDlg;

  seEditor: TSynEdit;

begin
  if bReplace then dlg:= TfrmReplaceDlg.Create(Self)
              else dlg:= TfrmSearchDlg.Create(Self);

  with dlg do try
    // Assign search options
    SearchBackwards        := frmMain.bSearch_Backwards;
    SearchCaseSensitive    := frmMain.bSearch_CaseSensitive;
    SearchFromCursor       := frmMain.bSearch_FromCursor;
    SearchRegularExpression:= frmMain.bSearch_RegExp;
    SearchText             := sSearch_Text; // start with last search text
    SearchTextHistory      := frmMain.sSearch_TextHistory;
    SearchWholeWords       := frmMain.bSearch_WholeWords;

    if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                     else seEditor:= synEditor2;

    with seEditor do begin
      SearchInSelectionOnly:= SelAvail;

      if SelAvail then begin
        rgSearchOrigin.Enabled:= False;
        SearchFromCursor      := False;
        if (BlockBegin.Line = BlockEnd.Line) then SearchText:= SelText
                                             else SearchText:= EmptyStr
      end
      else begin
        rgSearchOrigin.Enabled:= True;

//        SearchText:= GetWordAtRowCol(WordStartEx(CaretXY));  // Avoid return empty wheter cursor is at the end of word
        SearchText:= fFindWord_Extended(seEditor);
      end;
    end;

    if bReplace then
      with dlg as TfrmReplaceDlg do begin
        ReplaceText       := sReplace_Text;
        ReplaceTextHistory:= frmMain.sReplaceTextHistory;
      end;

    if (ShowModal = mrOK) then begin
      bSearchSelectionOnly         := SearchInSelectionOnly;
      frmMain.bSearch_Backwards    := SearchBackwards;
      frmMain.bSearch_CaseSensitive:= SearchCaseSensitive;
      frmMain.bSearch_FromCursor   := SearchFromCursor;
      frmMain.bSearch_RegExp       := SearchRegularExpression;
      frmMain.bSearch_WholeWords   := SearchWholeWords;
      frmMain.sSearch_TextHistory  := SearchTextHistory;
      sSearch_Text                 := SearchText;

      if bReplace then
        with dlg as TfrmReplaceDlg do begin
          sReplace_Text              := ReplaceText;
          frmMain.sReplaceTextHistory:= ReplaceTextHistory;
        end;

      if (sSearch_Text <> EmptyStr) then pDoSearchReplaceText(bReplace,
                                                              False);
    end;

  finally
    FreeAndNil(dlg);
  end;
end;

procedure TfrmEditor.pSearchError(sTmp: string);
var
  synSearchOptions: TSynSearchOptions;

  seEditor: TSynEdit;

begin
  synSearchOptions:= [];

  Include(synSearchOptions,
          ssoMatchCase);

  Include(synSearchOptions,
          ssoEntireScope);

  Include(synSearchOptions,
          ssoWholeWord);

  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    BeginUpdate;
    SearchEngine:= SynEditSearch;

    SearchReplace(sTmp,
                  sReplace_Text,
                  synSearchOptions);

    EndUpdate;
    ExecuteCommand(ecGotFocus,
                   #0,
                   nil);
  end;
end;

procedure TfrmEditor.pDoSearchReplaceText(bReplace,
                                          bSearchAgain: boolean;
                                          bMessage: boolean = True);
var
  synSearchOptions: TSynSearchOptions;

  seEditor: TSynEdit;

  iResult: integer;

begin
  if bReplace then synSearchOptions:= [ssoPrompt,
                                       ssoReplace,
                                       ssoReplaceAll]
              else synSearchOptions:= [];

  if frmMain.bSearch_Backwards        then Include(synSearchOptions,
                                                   ssoBackwards);
  if frmMain.bSearch_CaseSensitive    then Include(synSearchOptions,
                                                   ssoMatchCase);
  if not bSearchAgain then
    if not frmMain.bSearch_FromCursor then Include(synSearchOptions,
                                                   ssoEntireScope);
  if bSearchSelectionOnly                then Include(synSearchOptions,
                                                      ssoSelectedOnly);
  if frmMain.bSearch_WholeWords       then Include(synSearchOptions,
                                                   ssoWholeWord);

  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    if frmMain.bSearch_RegExp then SearchEngine:= SynEditRegExSearch
                              else SearchEngine:= SynEditSearch;

    iResult:= SearchReplace(sSearch_Text,
                            sReplace_Text,
                            synSearchOptions);

    if (iResult = 0) and
       bMessage then begin
      MessageBeep(MB_ICONASTERISK);

      fMessageDlg('Text not found!',
                  mtInformation,
                  [mbOK],
                  0);

      if ssoBackwards in synSearchOptions then BlockEnd  := BlockBegin
                                          else BlockBegin:= BlockEnd;
      CaretXY:= BlockBegin;
    end;

  end;
  if Assigned(frmConfirm_Replace_Dlg) then FreeAndNil(frmConfirm_Replace_Dlg);
end;

procedure TfrmEditor.pFindAgain;
begin
  // For while, it is impossible to search with F3 any old selection!
  bSearchSelectionOnly:= False;

  if (sSearch_Text = EmptyStr) then pShowSearchReplaceDialog(False)
                               else pDoSearchReplaceText(False,
                                                        True);
end;

procedure TfrmEditor.pReplace;
begin
 if not synEditor.ReadOnly then begin
   pShowSearchReplaceDialog(TRUE);

   if (sActiveEditor = 'synEditor2') then synEditor.Lines:= synEditor2.Lines
   else if Assigned(synEditor2) then synEditor2.Lines:= synEditor.Lines;

   frmMain.actFileSave.Enabled:= True;
   pSetTitle;
 end
 else fMessageDlg(sActiveFile + #13 + #13 +
                  'The file is set as read only.' + #13 +
                  'Search/Replace will not work!',
                  mtWarning,
                  [mbOK],
                  0);
end;

function TfrmEditor.fSetHighlighterID: integer;
var
  bFound: boolean;

  j: integer;

  sTmp,
   sSynName: string;

begin
  sSynName:= synEditor.Highlighter.DefaultFilter;
  bFound  := False;

  for j:= 0 to (dmSyn.iHigCount - 1) do begin
    sTmp:= (dmSyn.Components[j] as TSynCustomHighlighter).DefaultFilter;

    if (sTmp = sSynName) then begin
      bFound:= True;
      break;
    end;
  end;

  if bFound then Result:= j
            else Result:= -1;
end;

procedure TfrmEditor.pEnableSave;
begin
  if Assigned(synEditor2) then synEditor2.Modified:= True;

  synEditor.Modified                := True;
  frmMain.actFileSave.Enabled   := True;
  frmMain.actFileSaveAs.Enabled := True;
  frmMain.actFileSaveAll.Enabled:= True;

  pSetTitle;
end;

procedure TfrmEditor.pDateStamp;
var
  seEditor: TSynEdit;

begin
  // Define the active editor
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  if seEditor.ReadOnly then begin
    fMessageDlg(sActiveFile + #13 + #13 +
                'The file is set as read only.' + #13 +
                '''Date/Time stamp'' will not work!',
                mtWarning,
                [mbOK],
                0);

    Exit;
  end;

  seEditor.SelText:= DateTimeToStr(Now);

  pEnableSave;
end;

procedure TfrmEditor.pIndent_Block;
begin
  if not synEditor.ReadOnly then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecBlockIndent,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecBlockIndent,
                                                                    'A',
                                                                    @synEditor.lines);;

    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Block/Indent'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

procedure TfrmEditor.pUpperCase_Word;
begin
  if not synEditor.ReadOnly then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecUpperCase,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecUpperCase,
                                                                    'A',
                                                                    @synEditor.lines);

    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Word/Uppercase'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

procedure TfrmEditor.pLowerCase_Word;
begin
  if not synEditor.ReadOnly then begin;
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecLowerCase,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecLowerCase,
                                                                   'A',
                                                                   @synEditor.lines);

    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Word/Lowercase'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

procedure TfrmEditor.pInvert_Case;
begin
  if not synEditor.ReadOnly then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecToggleCase,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecToggleCase,
                                                                    'A',
                                                                    @synEditor.lines);
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Word/Invert case'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

procedure TfrmEditor.pEditor_Split(bSplitHoriz: boolean = True);
begin
  if Assigned(spEditor) then FreeAndNil(spEditor);

  if Assigned(synEditor2) then FreeAndNil(synEditor2);

  synEditor.Align:= alClient;

  if bSplitHoriz then begin
    synEditor.Align := alBottom;
    synEditor.Height:= (synEditor.Height div 2);
  end
  else begin
    synEditor.Align:= alRight;
    synEditor.Width:= (synEditor.Width div 2);
  end;

  spEditor:= TSplitter.Create(Self);

  with spEditor do begin
    if bSplitHoriz then begin
      Height := 3;
      Color  := clActiveCaption;
      Beveled:= True;
      Align  := alBottom;
      Cursor := crVSplit;
    end
    else begin
      Width  := 3;
      Color  := clActiveCaption;
      Beveled:= True;
      Align  := alRight;
      Cursor := crHSplit;
    end;
    OnMouseDown:= SplitMouseDown;
    OnMouseUp  := SplitMouseUp;
    OnMouseMove:= SplitMouseMove;
    Parent     := Self;
  end;

  synEditor2:= TSynEdit.Create(Self);

  with synEditor2 do begin
    ActiveLineColor       := synEditor.ActiveLineColor;
    Align                 := alClient;
    BorderStyle           := bsNone;
    Color                 := synEditor.Color;
    Font                  := synEditor.Font;
    Gutter                := synEditor.Gutter;
    Gutter.ShowlineNumbers:= synEditor.Gutter.ShowlineNumbers;
    HideSelection         := False;
    Highlighter           := synEditor.Highlighter;
    Lines.text            := synEditor.Lines.Text;
    OnChange              := synEditor.onChange;
    OnClick               := synEditor.onClick;
    OnEndDrag             := synEditor.onEndDrag;
    OnEnter               := synEditor.onEnter;
    OnGutterClick         := synEditor.onGutterClick;
    OnKeyDown             := synEditor.onKeyDown;
    OnKeyUp               := synEditor.onKeyUp;
    OnMouseUp             := synEditor.onMouseUp;
    OnPaintTransient      := TSyn_Transient.pSynPaintTransient;
    OnReplaceText         := synEditor.onReplaceText;
    OnStatusChange        := synEditor.onStatusChange;
    Options               := synEditor.Options;
    Parent                := Self;
    PopupMenu             := frmMain.pmenEditor;
    ReadOnly              := synEditor.ReadOnly;
    RightEdge             := synEditor.RightEdge;
    RightEdgeColor        := synEditor.RightEdgeColor;
    SelectionMode         := synEditor.SelectionMode;
    TabWidth              := synEditor.TabWidth;
    WantTabs              := synEditor.WantTabs;
    WordWrap              := synEditor.WordWrap;
  end;

  with frmMain do
    coEditor.AssignTo(synEditor2);

  sActiveEditor:= 'synEditor';
end;

procedure TfrmEditor.pEditor_RemoveSplit;
begin
  if Assigned(spEditor) then FreeAndNil(spEditor);

  if Assigned(synEditor2) then FreeAndNil(synEditor2);
  synEditor.Align:= alClient;
  sActiveEditor  := 'synEditor';

  with frmMain do begin
    with synURIOpener do begin
      Editor:= nil;
      Editor:= synEditor;
    end;
  end;
end;

procedure TfrmEditor.SplitMouseDown(Sender: TObject;
                                    Button: TMouseButton;
                                    Shift: TShiftState;
                                    X,
                                    Y: Integer);
var
  pPos: TPoint;

begin
  bSizing:= True;

  pPos:= spEditor.ClientToScreen(Point(X,
                                       Y));
  iSizeStart:= pPos.Y;

  pLine:= pPos;
end;

procedure TfrmEditor.SplitMouseUp(Sender: TObject;
                                  Button: TMouseButton;
                                  Shift: TShiftState;
                                  X,
                                  Y: Integer);
var
  dc: hDC;

  iNewHeight: Integer;

begin
  if bNeedsErase then begin
    dc:= GetDC(0);

    PatBlt(dc,
           pLine.X,
           pLine.Y,
           ClientWidth,
           1,
           DstInvert );

    ReleaseDC(0,
              DC);

    bNeedsErase:= False;
  end;
  iNewHeight:= synEditor.Height +
               iSizeStart -
               pLine.Y;

  synEditor.Height:= iNewHeight;
  bSizing:= False;
end;

procedure TfrmEditor.SplitMouseMove(Sender: TObject;
                                    Shift: TShiftState;
                                    X,
                                    Y: Integer);
var
  dc: HDC;

  pPos1,
   pPos2: TPoint;

begin
  if bSizing then begin
    pPos1:= spEditor.ClientToScreen(Point(spEditor.Left,
                                          Y));
    pPos2:= ClientOrigin;

    if (pPos1.Y <= pPos2.Y + 3) then Exit;

    if (pPos1.Y >= pPos2.Y + ClientHeight - 3) then Exit;

    if bNeedsErase then begin
      dc:= GetDC(0);
      PatBlt(dc,
             pPos1.X,
             pLine.Y,
             ClientWidth,
             1,
             DstInvert);

      ReleaseDC(0,
                dc);

      bNeedsErase:= False;
    end;
    dc:= GetDC(0);

    PatBlt(dc,
           pPos1.X,
           pPos1.Y,
           ClientWidth,
           1,
           DstInvert);

    ReleaseDC(0,
              dc);

    bNeedsErase:= True;
    pLine:= pPos1;
  end;
end;

procedure TfrmEditor.synEditorClick(Sender: TObject);
var
  seEditor: TSynEdit;

begin
  with frmMain do begin
    with stbMain do begin
      Panels[8].Text:= EmptyStr;
      Panels[9].Text:= EmptyStr;
    end;

    actRtermEditorSetFocus.Checked:= True;
  end;

  seEditor:= Sender as TsynEdit;
  if (seEditor.Name = 'synEditor') then sActiveEditor:= 'synEditor'
                                   else sActiveEditor:= 'synEditor2';

  with frmMain do begin
    synMR.Editor:= seEditor;

    if (synURIOpener.Editor <> seEditor) then begin
      with seEditor do begin
        BeginUpdate;
        Repaint;
        EndUpdate;
      end;
    end;

    with cbSyntax do
      if (Text <> 'URI') and
         (Text <> 'R complex') then Exit;

    with synURIOpener do begin
      Editor:= nil;
      Editor:= seEditor;
    end;
  end;
end;

procedure TfrmEditor.pSetHighlighter_FromTag(iTag: integer);
var
  slSynName: TStringlist;

  sTmp: string;

begin
  slSynName:= TStringList.Create;
  try
    sTmp:= (dmSyn.Components[iTag] as TSynCustomHighlighter).GetFriendlyLanguageName;
    if (sTmp = 'General_Multi-Highlighter') then sTmp:= (dmSyn.Components[iTag] as TSynMultiSyn).DefaultLanguageName;
    slSynName.Text:= sTmp;
    pSetHighlighter_Status(slSynName);
  finally
    FreeAndNil(slSynName);
  end;
end;

procedure TfrmEditor.pNormal_Select;
begin
  if Assigned(synEditor2) then begin
    synEditor.SelectionMode := smNormal;
    synEditor2.SelectionMode:= smNormal;
  end
  else synEditor.SelectionMode:= smNormal;

  frmMain.actNormalSelect.Checked:= True;
  frmMain.actLineSelect.Checked  := False;
  frmMain.actColumnSelect.Checked:= False;

  //frmMain.stbMain.Panels[4].Text:= 'Normal';
  frmMain.pDrawSelectionMode(0);

  synEditor.Options:= synEditor.Options +
                      [eoAltSetsColumnMode];
end;

procedure TfrmEditor.pLine_Select;
begin
  if Assigned(synEditor2) then begin
    synEditor.SelectionMode := smLine;
    synEditor2.SelectionMode:= smLine;
  end
  else synEditor.SelectionMode:= smLine;

  frmMain.actNormalSelect.Checked:= False;
  frmMain.actLineSelect.Checked  := True;
  frmMain.actColumnSelect.Checked:= False;

  //frmMain.stbMain.Panels[4].Text:= 'Line';
  frmMain.pDrawSelectionMode(1);

  synEditor.Options:= synEditor.Options +
                      [eoAltSetsColumnMode];
end;

procedure TfrmEditor.pColumn_Select;
begin
  if Assigned(synEditor2) then
  begin
    synEditor.SelectionMode := smColumn;
    synEditor2.SelectionMode:= smColumn;
  end
  else synEditor.SelectionMode:= smColumn;

  frmMain.actNormalSelect.Checked:= False;
  frmMain.actLineSelect.Checked  := False;
  frmMain.actColumnSelect.Checked:= True;

  //frmMain.stbMain.Panels[4].Text:= 'Column';
  frmMain.pDrawSelectionMode(2);

  synEditor.Options:= synEditor.Options -
                      [eoAltSetsColumnMode];
end;

//procedure TfrmEditor.pToogleLineNumbers(bOption: boolean);
//begin
//  if Assigned(synEditor2) then begin
//    synEditor.Gutter.ShowlineNumbers := bOption;
//    synEditor2.Gutter.ShowlineNumbers:= bOption;
//  end
//  else synEditor.Gutter.ShowlineNumbers:= bOption;
//end;

//procedure TfrmEditor.pToogleSpecialChars(bChecked: boolean);
//begin
//  if Assigned(synEditor2) then begin
//    if bChecked then begin
//      synEditor.Options := synEditor.Options +
//                           [eoShowSpecialChars];
//      synEditor2.Options:= synEditor2.Options +
//                           [eoShowSpecialChars];
//    end
//    else begin
//      synEditor.Options := synEditor.Options -
//                           [eoShowSpecialChars];
//      synEditor2.Options:= synEditor2.Options -
//                           [eoShowSpecialChars];
//    end;
//  end
//  else begin
//    if bChecked then synEditor.Options:= synEditor.Options +
//                                         [eoShowSpecialChars]
//                else synEditor.Options:= synEditor.Options -
//                                         [eoShowSpecialChars];
//  end;
//end;

procedure TfrmEditor.pUpperCase_Selection;
begin
  if not synEditor.ReadOnly then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecUpperCaseBlock,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecUpperCaseBlock,
                                                                    'A',
                                                                    @synEditor.lines);

    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Selection/Uppercase'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

procedure TfrmEditor.pLowercase_Selection;
begin
  if not synEditor.ReadOnly then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecLowerCaseBlock,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecLowerCaseBlock,
                                                                    'A',
                                                                    @synEditor.lines);
    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Selection/Lowercase'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

procedure TfrmEditor.pInvert_Selection;
begin
  if not synEditor.ReadOnly then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecToggleCaseBlock,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecToggleCaseBlock,
                                                                    'A',
                                                                    @synEditor.lines);

    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Selection/Invert case'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);
end;

function TfrmEditor.fScrubCaption(sCap: string): string;
var
  sTmp: string;

begin
  // Remove fancy markings on the Caption
  sTmp:= sCap;
  sTmp:= StringReplace(sTmp, '*', EmptyStr  , [rfReplaceAll]);
  sTmp:= StringReplace(sTmp, '<', EmptyStr  , [rfReplaceAll]);
  sTmp:= StringReplace(sTmp, '>', EmptyStr  , [rfReplaceAll]);
  sTmp:= StringReplace(sTmp, '&', '&&'      , [rfReplaceAll]);

  Result:= sTmp;
end;

procedure TfrmEditor.synEditorEndDrag(Sender,
                                      Target: TObject;
                                      X,
                                      Y: Integer);
begin
  pEnableSave;
end;

procedure TfrmEditor.synEditorGutterClick(Sender: TObject;
                                          Button: TMouseButton;
                                          X,
                                          Y, Line: Integer;
                                          Mark: TSynEditMark);
var
  seEditor: TSynEdit;

begin
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;
  with seEditor do
    if (BlockBegin.Line = BlockEnd.Line) then begin
      CaretX:= 0;
      ExecuteCommand(ecSelLineEnd,
                     'A',
                     @seEditor.lines)      // One single click
    end
    else ExecuteCommand(ecSelLineStart,
                        'A',
                        @seEditor.lines) // A selection with more than one line
end;

procedure TfrmEditor.WMSysCommand(var Msg: TWMSysCommand);
begin
  case Msg.CmdType of
    SC_NextWindow: begin
                    if (frmMain.pgFiles.ActivePageIndex = frmMain.pgFiles.PageCount -1) then
                      frmMain.pgFiles.ActivePageIndex:= 0
                    else
                      frmMain.pgFiles.ActivePageIndex:= frmMain.pgFiles.ActivePageIndex + 1;
                    frmMain.pgFilesChange(Self);
                   end;

    SC_PREVWINDOW: begin
                     if (frmMain.pgFiles.ActivePageIndex = 0) then
                       frmMain.pgFiles.ActivePageIndex:= frmMain.pgFiles.PageCount - 1
                     else
                       frmMain.pgFiles.ActivePageIndex:= frmMain.pgFiles.ActivePageIndex - 1;
                     frmMain.pgFilesChange(Self);
                   end
    else
      inherited;
   end;
end;

procedure TfrmEditor.Loaded;
begin
  inherited;
  Width := frmMain.Width;
  Height:= frmMain.Height;
end;

procedure TfrmEditor.pLineWrap_Toogle(bChecked: boolean);
begin
  if Assigned(synEditor2) then begin
    synEditor.WordWrap := bChecked;
    synEditor2.WordWrap:= bChecked;

    if bChecked then begin
     synEditor.Options := synEditor.Options -
                          [eoTrimTrailingSpaces];
     synEditor2.Options:= synEditor2.Options -
                          [eoTrimTrailingSpaces];
    end
    else begin
      synEditor.Options := synEditor.Options +
                           [eoTrimTrailingSpaces];
      synEditor2.Options:= synEditor2.Options +
                           [eoTrimTrailingSpaces];
    end;
  end
  else begin
   synEditor.WordWrap:= bChecked;
   if bChecked then synEditor.Options:= synEditor.Options -
                                        [eoTrimTrailingSpaces]
               else synEditor.Options:= synEditor.Options +
                                        [eoTrimTrailingSpaces];
  end;
end;

function TfrmEditor.fGet_BB_HighLighter: TSynCustomHighlighter;
var
  i: integer;

  seEditor: TSynEdit;

begin
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if Highlighter is TSynMultiSyn then
    begin
      i:= (Integer(TSynEditStringList(Lines).Ranges[BlockBegin.Line - 2]) and $F) - 9;

      if (i < 0) or
         (i = 7) then  // R markdown
        Result:= TSynMultiSyn(Highlighter).DefaultHighLighter
      else
        Result:= TSynMultiSyn(Highlighter).Schemes[i].Highlighter
    end
    else
      Result:= Highlighter;
end;

function TfrmEditor.fGet_BE_HighLighter: TSynCustomHighlighter;
var
  i: integer;

  seEditor: TSynEdit;

begin
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if Highlighter is TSynMultiSyn then
    begin
      i:= (Integer(TSynEditStringList(Lines).Ranges[BlockEnd.Line - 2]) and $F) - 9;

      if (i < 0) or
         (i = 7) then  // R markdown
        Result:= TSynMultiSyn(Highlighter).DefaultHighLighter
      else
        Result:= TSynMultiSyn(Highlighter).Schemes[i].Highlighter
    end
    else
      Result:= Highlighter;
end;

function TfrmEditor.fGet_Current_HighLighter: TSynCustomHighlighter;
var
  i: integer;

  seEditor: TSynEdit;

begin
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    if Highlighter is TSynMultiSyn then
    begin
      // Below the more pure Vodoo suggested by Jan Fiala and adapted by me ;)
      // Please, do not change if you do not know what you're doing! :(
      i:= (Integer(TSynEditStringList(Lines).Ranges[BlockEnd.Line - 2]) and $F) - 1;

      case i of
        -99 .. -1: Result:= TSynMultiSyn(Highlighter).DefaultHighLighter;
                7: Result:= TSynMultiSyn(Highlighter).DefaultHighLighter;      // Related to Markdown
                8: Result:= TSynMultiSyn(Highlighter).Schemes[0].Highlighter;  // Related to all R TSynMultiSyn
        else
          Result:= TSynMultiSyn(Highlighter).Schemes[i].Highlighter
      end;
    end //if Highlighter is TSynMultiSyn
    else
      Result:= Highlighter;
end;

procedure TfrmEditor.pGetCursorTo(sWay: string);
var
  bWordWrapOption: boolean;

  iPos: integer;

  seEditor: TSynEdit;
  smOption: TSynSelectionMode;

begin
  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do begin
    beginUpdate;
    smOption:= SelectionMode;
    bWordWrapOption:= WordWrap;

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

    SelectionMode:= smOption;
    WordWrap     := bWordWrapOption;
    CaretX       := iPos;

    EndUpdate;
  end;
end;

procedure TfrmEditor.pComment(sStartComment,
                              sEndComment: string);
var
  iTop,
   iPosX,
   iPosY: integer;

  optSelMode: TSynSelectionMode;

  seEditor: TSynEdit;

  bcBegin,
   bcEnd : TBufferCoord;

  procedure SaveStatus(seEditor: TSynEdit);
  begin
    with seEditor do begin
      optSelMode:= SelectionMode;
      if (optSelMode <> smNormal) then SelectionMode:= smNormal;
      iPosX:= CaretX;
      iPosY:= CaretY;
      iTop := TopLine;
    end;
  end;

  procedure RestoreStatus(seEditor: TSynEdit;
                          iCaret: integer);
  begin
    with seEditor do begin
      SelectionMode:= optSelMode;
      CaretX := iCaret;
      CaretY := iPosY;
      TopLine:= iTop;
      pEnableSave;
    end;
  end;

  // The advantage of to use 'seEditor.SelTex' is the automatic Undo/Redo after the 'StringReplace'!
  procedure CommentBlock(seEditor: TSynEdit);
  var
    i    : integer;
    seTmp: TSynEdit;

  begin
    // Single lines
    if (sEndComment = EmptyStr) then begin

      seTmp:= TSynEdit.Create(Self);
      seTmp.Parent:= frmMain.panInvisibleParent;

      seTmp.Text:= seEditor.SelText;

      i:= 0;
      seTmp.BeginUpdate;

      repeat
        seTmp.Lines.Strings[i]:= sStartComment +
                                 seTmp.Lines.Strings[i];
        inc(i);
      until (i = seTmp.Lines.Count);

      seTmp.EndUpdate;

      fSave_PriorClipboard_Text;

      seTmp.SelectAll;
      seTmp.CutToClipboard;
      FreeAndNil(seTmp);  // All lines on Clipboard

      seEditor.PasteFromClipboard;

      pRestore_PriorClipboard_Text;

      FreeAndNil(seTmp);
    end
    else begin
      // Otherwise, put a Start comment at the beginning of the block and an End comment at the end
      seEditor.SelText:= sStartComment +
                         seEditor.SelText +
                         sEndComment;
    end;
  end;

begin
  if synEditor.ReadOnly then begin
    fMessageDlg(sActiveFile + #13 + #13 +
                'The file is set as read only.' + #13 +
                '''Block/Comment'' will not work!',
                mtWarning,
                [mbOK],
                0);

    Exit;
  end;

  if (sStartComment = EmptyStr) then begin
    fMessageDlg('The comment/uncomment symbol(s) is not defined for' + #13 +
                'this language (or complex selection).' + #13 + #13 +
                'Please, check the database: Comments!',
                mtWarning,
                [mbOk],
                0);

    Exit;
  end;

  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  SaveStatus(seEditor);

  with seEditor do
    if (SelText = EmptyStr) then begin
      iPosX:= iPosX +
              Length(sStartComment);

      CommentBlock(seEditor);
    end
    else begin
      if (iPosX = 1) then begin
        SelLength:= SelLength - 1;  // It prevents to comment the line (when CaretX = 0)
                                    // immediately subsequent to the efective entire last line of an selection

      end
      else
        bcBegin:= BlockBegin;
        bcEnd  := BlockEnd;

        if (sEndComment <> EmptyStr) then
          if (bcBegin.Line = bcEnd.Line) then
            // Selection in the same line
            iPosX:= iPosX +
                    Length(sStartComment) +
                    Length(sEndComment)
          else
            // Selection in more than one line
            iPosX:= iPosX +
                    Length(sStartComment);

      CommentBlock(seEditor);
    end;

  RestoreStatus(seEditor,
                iPosX);
end;

procedure TfrmEditor.pUncomment(sStartComment,
                                sEndComment: string;
                                rfTmp: TReplaceFlags = []);
var
  i,
   iTop,
   iPosX,
   iPosY,
   nStartComment,
   nEndComment  : integer;

  optSelMode: TSynSelectionMode;

  seTmp,
    seEditor: TSynEdit;

  bcBegin,
   bcEnd : TBufferCoord;

  procedure SaveStatus(seEditor: TSynEdit);
  begin
    with seEditor do begin
      optSelMode:= SelectionMode;
      if (optSelMode <> smNormal) then SelectionMode:= smNormal;
      iPosX:= CaretX;
      iPosY:= CaretY;
      iTop := TopLine;
    end;
  end;

  procedure RestoreStatus(seEditor: TSynEdit;
                          iCaret: integer);
  begin
    with seEditor do begin
      SelectionMode:= optSelMode;
      CaretX := iCaret;
      CaretY := iPosY;
      TopLine:= iTop;
      pEnableSave;
    end;
  end;

begin
  if synEditor.ReadOnly then begin
    fMessageDlg(sActiveFile + #13 + #13 +
                'The file is set as read only.' + #13 +
                '''Block/Uncomment first ocurrence'' will not work!',
                mtWarning,
                [mbOK],
                0);

    Exit;
  end;

  if (sStartComment = EmptyStr) then begin
    fMessageDlg('The comment/uncomment symbol(s) is not defined for' + #13 +
                'this language (or complex selection).' + #13 + #13 +
                'Please, check the database: Comments!',
                mtWarning,
                [mbOk],
               0);

    Exit;
  end;

  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  // Current line
  if (seEditor.SelText = EmptyStr) then begin
    SaveStatus(seEditor);
    seEditor.BeginUpdate;
    seEditor.CaretX:= 0;

    seEditor.ExecuteCommand(ecSelLineEnd,
                            #0,
                            nil);


    // Remove sStartComment
    if (rfTmp = [rfReplaceAll]) then
      nStartComment:= fCount_Char(seEditor.SelText,
                                  sStartComment)
    else
      nStartComment:= 1;

    seEditor.SelText:= StringReplace(seEditor.SelText,
                                     sStartComment,
                                     EmptyStr,
                                     rfTmp);
    iPosX:= iPosX -
            nStartComment * Length(sStartComment);

    seEditor.CaretX:= 0;

    seEditor.ExecuteCommand(ecSelLineEnd,
                            #0,
                            nil);

    // Remove sEndComment
    if (rfTmp = [rfReplaceAll]) then
      nEndComment:= fCount_Char(seEditor.SelText,
                                sEndComment)
    else
      nEndComment:= 1;

    if not (sEndComment = EmptyStr) then begin
      seEditor.SelText:= StringReplace(seEditor.SelText,
                                       sEndComment,
                                       EmptyStr,
                                       rfTmp);

      iPosX:= iPosX -
              nEndComment * Length(sEndComment);
    end;

    RestoreStatus(seEditor,
                  iPosX);

    seEditor.EndUpdate;
  end
  else begin
    // Selection
    bcBegin:= seEditor.BlockBegin;
    bcEnd  := seEditor.BlockEnd;

    SaveStatus(seEditor);
    seEditor.BeginUpdate;

    seTmp:= TSynEdit.Create(Self);
    seTmp.Parent:= frmMain.panInvisibleParent;

    seTmp.Text:= seEditor.SelText;

    i:= 0;
    seTmp.BeginUpdate;

    repeat
      // Remove sStartComment
      seTmp.Lines.Strings[i]:= StringReplace(seTmp.Lines.Strings[i],
                                             sStartComment,
                                             EmptyStr,
                                             rfTmp);

      // Remove sEndComment
      if not (sEndComment = EmptyStr) then
        seTmp.Lines.Strings[i]:= StringReplace(seTmp.Lines.Strings[i],
                                               sEndComment,
                                               EmptyStr,
                                               rfTmp);

      inc(i)
    until (i = seTmp.Lines.Count);

    seTmp.EndUpdate;

    fSave_PriorClipboard_Text;

    seTmp.SelectAll;
    seTmp.CutToClipboard;
    FreeAndNil(seTmp);  // All lines on Clipboard

    seEditor.PasteFromClipboard;

    pRestore_PriorClipboard_Text;

    if (bcBegin.Line = bcEnd.Line) then
      iPosX:= iPosX -
              Length(sStartComment) -
              Length(sEndComment)
    else
      iPosX:= iPosX -
              Length(sEndComment);

    RestoreStatus(seEditor,
                  iPosX);

    seEditor.EndUpdate;
  end;
end;

procedure TfrmEditor.pCopyFormatted_RTF;
var
  bcStart,
   bcStop: TBufferCoord;

begin
  try
    Clipboard.Open;
    with Clipboard do
      if HasFormat(CF_TEXT) then Clear;

    with frmMain.SynExporterRTF do begin
      ExportAsText:= False;
      if Assigned(synEditor2) then begin
        if (sActiveEditor = 'synEditor') then begin
          Highlighter:= synEditor.Highlighter;
          bcStart    := synEditor.BlockBegin;
          bcStop     := synEditor.BlockEnd;

          ExportRange(synEditor.Lines,
                      bcStart,
                      bcStop);

          CopyToClipboard;
        end
        else begin
          Highlighter:= synEditor2.Highlighter;
          bcStart    := synEditor2.BlockBegin;
          bcStop     := synEditor2.BlockEnd;

          ExportRange(synEditor2.Lines,
                      bcStart,
                      bcStop);

          CopyToClipboard;
        end
      end
      else begin
        Highlighter:= synEditor.Highlighter;
        bcStart    := synEditor.BlockBegin;
        bcStop     := synEditor.BlockEnd;

        ExportRange(synEditor.Lines,
                    bcStart,
                    bcStop);

        CopyToClipboard;
      end;
    end;
  finally
    Clipboard.Close;
  end;
end;

procedure TfrmEditor.pCopyFormatted_HTML;
var
  bcStart,
   bcStop: TBufferCoord;

begin
  try
    Clipboard.Open;
    with Clipboard do
      if HasFormat(CF_TEXT) then Clear;

    with frmMain.SynExporterHTML do begin
      ExportAsText:= False;
      if Assigned(synEditor2) then begin
        if (sActiveEditor = 'synEditor') then begin
          Highlighter:= synEditor.Highlighter;
          bcStart    := synEditor.BlockBegin;
          bcStop     := synEditor.BlockEnd;

          ExportRange(synEditor.Lines,
                      bcStart,
                      bcStop);

          CopyToClipboard;
        end
        else begin
          Highlighter:= synEditor2.Highlighter;
          bcStart    := synEditor2.BlockBegin;
          bcStop     := synEditor2.BlockEnd;

          ExportRange(synEditor2.Lines,
                      bcStart,
                      bcStop);

          CopyToClipboard;
        end
      end
      else begin
        Highlighter:= synEditor.Highlighter;
        bcStart    := synEditor.BlockBegin;
        bcStop     := synEditor.BlockEnd;

        ExportRange(synEditor.Lines,
                    bcStart,
                    bcStop);

        CopyToClipboard;
      end;
    end;
  finally
    Clipboard.Close;
  end;
end;

procedure TfrmEditor.pCopyFormatted_TeX;
var
  bcStart,
   bcStop: TBufferCoord;

begin
  try
    Clipboard.Open;
    with Clipboard do
      if HasFormat(CF_TEXT) then Clear;

    with frmMain.SynExporterTeX do begin
      ExportAsText:= False;

      if Assigned(synEditor2) then begin
        if (sActiveEditor = 'synEditor') then begin
          Highlighter:= synEditor.Highlighter;
          bcStart    := synEditor.BlockBegin;
          bcStop     := synEditor.BlockEnd;

          ExportRange(synEditor.Lines,
                      bcStart,
                      bcStop);

          CopyToClipboard;
        end
        else begin
          Highlighter:= synEditor2.Highlighter;
          bcStart    := synEditor2.BlockBegin;
          bcStop     := synEditor2.BlockEnd;

          ExportRange(synEditor2.Lines,
                      bcStart,
                      bcStop);

          CopyToClipboard;
        end
      end
      else begin
        Highlighter:= synEditor.Highlighter;
        bcStart    := synEditor.BlockBegin;
        bcStop     := synEditor.BlockEnd;

        ExportRange(synEditor.Lines,
                    bcStart,
                    bcStop);

        CopyToClipboard;
      end;
    end;
  finally
    Clipboard.Close;
  end;
end;

function TfrmEditor.fMessageDlg(const Msg: string;
                                DlgType: TMsgDlgType;
                                Buttons: TMsgDlgButtons;
                                HelpCtx: Integer): Integer;
begin
  with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      Position:= poOwnerFormCenter;
      Result:= ShowModal;
    finally
      Free;
    end
end;

procedure TfrmEditor.synEditorDragOver(Sender,
                                       Source: TObject;
                                       X,
                                       Y: Integer;
                                       State: TDragState;
                                       var Accept: Boolean);
begin
  with frmMain do begin
    Accept:= False;

    if (Source is TTreeView) then Accept:= True
    else if (Source is TShellListView) then Accept:= True
    else if (Source is TListView) then Accept:= True
    else if (Source is TJvFileListBox) then Accept:= True;
  end;
end;

procedure TfrmEditor.synEditorDragDrop(Sender,
                                       Source: TObject;
                                       X,
                                       Y: Integer);
begin
  with frmMain do
    FormDragDrop(Sender,
                 Source,
                 X,
                 Y);
end;

procedure TfrmEditor.pUnindent_Block;
begin
  if not (synEditor.ReadOnly) then begin
    if (sActiveEditor = 'synEditor2') then synEditor2.ExecuteCommand(ecBlockUnindent,
                                                                     'A',
                                                                     @synEditor.lines)
                                      else synEditor.ExecuteCommand(ecBlockUnindent,
                                                                    'A',
                                                                    @synEditor.lines);;

    pEnableSave;
  end
  else fMessageDlg(sActiveFile + #13 + #13 +
                   'The file is set as read only.' + #13 +
                   '''Block/Unindent'' will not work!',
                   mtWarning,
                   [mbOK],
                   0);

end;

procedure TfrmEditor.pFullPath_Unix;
var
  sUnixPath: string;

begin
  sUnixPath:= DosPathToUnixPath(sActiveFile);

  with Clipboard do
    if HasFormat(CF_TEXT) then Clear;

  Clipboard.AsText:= sUnixPath;
end;

procedure TfrmEditor.pFullPath_Windows;
begin
  with Clipboard do
   if HasFormat(CF_TEXT) then Clear;

  Clipboard.AsText:= sActiveFile;
end;

//procedure TfrmEditor.pFileClose;
//begin
//  Close;
//end;

procedure TfrmEditor.synEditorEnter(Sender: TObject);
begin
  with frmMain do
    actRtermEditorSetFocus.Checked:= True;
end;

end.

(*
By Jan Fiala - PSPad editor

This is my function for return current highlighter:

function TPSSynEdit.fGetCurrentHighLighter: TSynCustomHighlighter;
var
  i: Integer;
begin
  if Highlighter is TSynMultiSyn then
  begin
    i := (Integer(TSynEditStringList(Lines).Ranges[CaretY - 1]) and $F) - 2;
    if (i > TSynMultiSyn(HighLighter).Schemes.Count - 1) or (i < 0) then
      Result := TSynMultiSyn(Highlighter).DefaultHighLighter
    else
      Result := TSynMultiSyn(Highlighter).Schemes[i].Highlighter
  end
  else
    Result := Highlighter;
end;

I have this function in descendant of TSynedit.
You need to replace Highlighter e.g. with Editor.Highlighter and Lines with Editor.Lines
or send editor as function parameter and add after begin something like:

with Editor do
begin
...
*)

(* I is very slow to big files!
procedure TfrmEditor.Uncomment(sStartComment,
                               sEndComment: string;
                               rfTmp: TReplaceFlags = []);
var
  i,
   iTop,
   iPosY,
   iPosX,
   iSelLineStart,
   iSelLineEnd  : integer;
  optSelMode    : TSynSelectionMode;
  seEditor      : TSynEdit;

  procedure SaveStatus(seEditor: TSynEdit);
  begin
    with seEditor do begin
      optSelMode:= SelectionMode;
      if (optSelMode <> smNormal) then SelectionMode:= smNormal;
      iPosX:= CaretX;
      iPosY:= CaretY;
      iTop := TopLine;
    end;
  end;

  procedure RestoreStatus(seEditor: TSynEdit;
                          iCaret: integer);
  begin
    with seEditor do begin
      SelectionMode:= optSelMode;
      CaretX := iCaret;
      CaretY := iPosY;
      TopLine:= iTop;
      pEnableSave;
    end;
  end;

begin
  if synEditor.ReadOnly then begin
    fMessageDlg(sActiveFile + #13 + #13 +
                'The file is set as read only.' + #13 +
                '''Block/Uncomment first ocurrence'' will not work!',
                mtWarning,
                [mbOK],
                0);
    Exit;
  end;

  if (sStartComment = EmptyStr) then begin
    fMessageDlg('The comment/uncomment symbol(s) is not defined for' + #13 +
                'this language (or complex selection).' + #13 + #13 +
                'Please, check the database: Comments!',
                mtWarning,
                [mbOk],
                0);
    Exit;
  end;

  if (sActiveEditor = 'synEditor') then seEditor:= synEditor
                                   else seEditor:= synEditor2;

  with seEditor do
    // Current line
    if (SelText = EmptyStr) then begin
      SaveStatus(seEditor);
      BeginUpdate;
      CaretX:= 0;

      ExecuteCommand(ecSelLineEnd,
                     #0,
                     nil);

      // Remove sStartComment
      SelText:= StringReplace(SelText,
                              sStartComment,
                              EmptyStr,
                              rfTmp);

      // Remove sEndComment
      if not (sEndComment = EmptyStr) then
        SelText:= StringReplace(SelText,
                                sEndComment,
                                EmptyStr,
                                rfTmp);

      RestoreStatus(seEditor,
                    iPosX - 1);
      EndUpdate;
    end
    else begin
      // Selection
      SaveStatus(seEditor);
      BeginUpdate;

      iSelLineStart:= BlockBegin.Line;
      iSelLineEnd  := BlockEnd.Line;

      {
      // To debug
      ShowMessage(IntToStr(iSelLineStart) +
                  ' : ' +
                  IntToStr(iSelLineEnd));
      }

      for i:= iSelLineStart to iSelLineEnd do begin
        CaretX:= 0;
        CaretY:= i;

        // Make a selection
        ExecuteCommand(ecSelLineEnd,
                       #0,
                       nil);

        // Remove sStartComment
        SelText:= StringReplace(SelText,
                                sStartComment,
                                EmptyStr,
                                rfTmp);

        CaretX:= 0;
        CaretY:= i;

        // Make a selection
        ExecuteCommand(ecSelLineEnd,
                       #0,
                       nil);

        // Remove sEndComment
        if not (sEndComment = EmptyStr) then
          SelText:= StringReplace(SelText,
                                  sEndComment,
                                  EmptyStr,
                                  rfTmp);
      end;

      RestoreStatus(seEditor,
                    0);
      EndUpdate;
    end;
end;
*)

