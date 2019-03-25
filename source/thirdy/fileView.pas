unit fileView;

// -----------------------------------------------------------------------------
// Application:     TextDiff                                                   .
// Module:          FileView                                                   .
// Version:         4.1                                                        .
// Date:            16-JAN-2004                                                .
// Target:          Win32, Delphi 7                                            .
// Author:          Angus Johnson - angusj-AT-myrealbox-DOT-com                .
// Copyright;       © 2003-2004 Angus Johnson                                  .
// -----------------------------------------------------------------------------

(*
 Changed/adapted by José Cláudio Faria: 05/05/2005
 for use in Tinn-R project
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, CodeEditor, ToolWin, Clipbrd, Searches, FindReplace,
  ufrmDiffMain, HashUnit, DiffUnit, Menus;

type
  TfrmFilesFrame = class(TFrame)
    pnlMain: TPanel;
    Splitter1: TSplitter;
    pnlLeft: TPanel;
    pnlCaptionLeft: TPanel;
    pnlRight: TPanel;
    pnlCaptionRight: TPanel;
    pnlDisplay: TPanel;
    pbDiffMarker: TPaintBox;
    pbScrollPosMarker: TPaintBox;
    fdFiles: TFontDialog;
    procedure pbScrollPosMarkerPaint(Sender: TObject);
    procedure pbDiffMarkerPaint(Sender: TObject);
    procedure FrameResize(Sender: TObject);
  private
    Diff: TDiff;
    Lines1, Lines2: TStrings;
    fn1, fn2: string;
    fa1, fa2: integer;
    fStatusbarStr: string;
    CaretPosY: integer;
    pbDiffMarkerBmp: TBitmap;
    Search: TSearch;
    FindInfo: TFindInfo;
    procedure AppActivate(Sender: TObject);
    procedure DiffProgress(Sender: TObject; percent: integer);
    procedure FileDrop(Sender: TObject;
      const Filename: string; var DropAccepted: boolean);
    procedure UpdateDiffMarkerBmp;
    procedure PaintLeftMargin(Sender: TObject; Canvas: TCanvas;
      MarginRec: TRect; LineNo, Tag: integer);
    procedure SyncScroll(Sender: TObject);
    procedure CodeEditOnEnter(Sender: TObject);
    procedure CodeEditOnExit(Sender: TObject);
    procedure ToggleLinkedScroll(IsLinked: boolean);
    procedure ToggleCodeEditModified(IsCodeEdit1, IsModified: boolean);
    procedure CodeEditLinesOnChange(Sender: TObject);
    function CaretInClrBlk(CodeEdit: TCodeEdit): boolean;
    procedure CodeEditOnCaretPtChange(Sender: TObject);
    function FindNext(CodeEdit: TCodeEdit): boolean;
    function FindPrevious(CodeEdit: TCodeEdit): boolean;
    procedure ReplaceDown(CodeEdit: TCodeEdit);
    procedure ReplaceUp(CodeEdit: TCodeEdit);

    procedure OpenClick(Sender: TObject);
    procedure CompareClick(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure HorzSplitClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure PrevClick(Sender: TObject);
    procedure SaveReportClick(Sender: TObject);
    procedure CodeEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure CopyBlockLeftClick(Sender: TObject);
    procedure CopyBlockRightClick(Sender: TObject);
    procedure UndoClick(Sender: TObject);
    procedure RedoClick(Sender: TObject);
    procedure EditClick(Sender: TObject);
    procedure CutClick(Sender: TObject);
    procedure CopyClick(Sender: TObject);
    procedure PasteClick(Sender: TObject);
    procedure FindClick(Sender: TObject);
    procedure FindNextClick(Sender: TObject);
    procedure ReplaceClick(Sender: TObject);
    procedure FontClick(Sender: TObject);
  public
    CodeEdit1: TCodeEdit;
    CodeEdit2: TCodeEdit;
    FilesCompared: boolean;
    procedure Setup;
    procedure Cleanup;
    procedure DoOpenFile(const Filename: string; IsFile1: boolean);
    procedure SaveFileClick(Sender: TObject);
    procedure SetMenuEventsToFileView;
    procedure DisplayDiffs;
  end;

const
  ISMODIFIED_COLOR = $CCE0E0;

implementation

uses ufrmMain;

{$R *.dfm}

//------------------------------------------------------------------------------
// TFilesFrame methods
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.Setup;
begin
  //the diff engine ...
  Diff := TDiff.create(self);
  Diff.OnProgress := DiffProgress;

  //lines1 & lines2 contain the unmodified files
  Lines1 := TStringList.create;
  Lines2 := TStringList.create;

  //edit windows where color highlighing of diffs and changes are displayed ...
  CodeEdit1 := TCodeEdit.create(self);
  with CodeEdit1 do begin
    parent := pnlLeft;
    Align := alClient;
    Lines.OnChange := CodeEditLinesOnChange;
    OnCaretPtChange := CodeEditOnCaretPtChange;
    OnPaintLeftMargin := PaintLeftMargin;
    OnDropFiles := FileDrop;
    OnEnter := CodeEditOnEnter;
    OnExit := CodeEditOnExit;
    OnKeyDown := CodeEditKeyDown;
    Font := fdFiles.Font;
  end;
  CodeEdit2 := TCodeEdit.create(self);
  with CodeEdit2 do begin
    parent := pnlRight;
    Align := alClient;
    Lines.OnChange := CodeEditLinesOnChange;
    OnCaretPtChange := CodeEditOnCaretPtChange;
    OnPaintLeftMargin := PaintLeftMargin;
    OnDropFiles := FileDrop;
    OnEnter := CodeEditOnEnter;
    OnExit := CodeEditOnExit;
    OnKeyDown := CodeEditKeyDown;
    Font := fdFiles.Font;
  end;
  Search := TSearch.Create(self);

  CaretPosY := -1;
  pbScrollPosMarker.Canvas.Pen.Color := clBlack;
  pbScrollPosMarker.Canvas.Pen.Width := 2;

  pbDiffMarkerBmp := TBitmap.create;
  pbDiffMarkerBmp.Canvas.Brush.Color := clWindow;

  pnlCaptionLeft.Font  := frmDiffMain.Font;
  pnlCaptionRight.Font := frmDiffMain.Font;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.Cleanup;
begin
  Diff.free;
  Lines1.free;
  Lines2.free;
  pbDiffMarkerBmp.free;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.SetMenuEventsToFileView;
begin
  with frmDiffMain do begin
    tbFolder.ImageIndex := ufrmDiffMain.FILEVIEW;
    tbFolder.Hint := 'Toggle to folder view';

    mnuOpen1.OnClick := OpenClick;
    mnuOpen2.OnClick := OpenClick;
    tbOpen1.OnClick := OpenClick;
    tbOpen2.OnClick := OpenClick;
    mnuOpen1.Caption := 'Open file 1';
    mnuOpen2.Caption := 'Open file 2';
    tbOpen1.Hint := 'Open file 1';
    tbOpen2.Hint := 'Open file 2';

    mnucompare.OnClick := CompareClick;
    tbCompare.OnClick := CompareClick;
    mnuCancel.OnClick := CancelClick;
    tbCancel.OnClick :=  CancelClick;

    //workaround of the toggle event ...
    mnuHorzSplit.OnClick := nil;
    mnuHorzSplit.Checked := not mnuHorzSplit.Checked;
    HorzSplitClick(nil);
    mnuHorzSplit.OnClick := HorzSplitClick;
    tbHorzSplit.OnClick := HorzSplitClick;
    mnuHorzSplit.enabled := true;
    tbHorzSplit.enabled := true;

    mnuSave1.OnClick := SaveFileClick;
    mnuSave2.OnClick := SaveFileClick;
    tbSave1.OnClick := SaveFileClick;
    tbSave2.OnClick := SaveFileClick;
    mnuSave1.Enabled := pnlCaptionLeft.Color = ISMODIFIED_COLOR;
    mnuSave2.Enabled := pnlCaptionRight.Color = ISMODIFIED_COLOR;
    tbSave1.Enabled := mnuSave1.Enabled;
    tbSave2.Enabled := mnuSave2.Enabled;

    mnuSaveReport.Enabled := FilesCompared;
    mnuCompare.enabled := (Lines1.Count > 0) and (Lines2.Count > 0);
    tbCompare.enabled := mnuCompare.enabled;

    mnuEdit.Enabled := true;
    mnuEdit.OnClick := EditClick;
    mnuCut.OnClick := CutClick;
    mnuCopy.OnClick := CopyClick;
    mnuPaste.OnClick := PasteClick;
    mnuUndo.OnClick := UndoClick;
    mnuRedo.OnClick := RedoClick;
    mnuSaveReport.OnClick := SaveReportClick;

    mnuSearch.Enabled := true;
    mnuFind.OnClick := FindClick;

    mnuFindNext.OnClick := FindNextClick;
    tbFind.OnClick := FindClick;  //JCFaria
    tbFind.Enabled := true;       //JCFaria
    mnuReplace.OnClick := ReplaceClick;
    tbReplace.OnClick := ReplaceClick;
    tbReplace.enabled := true;

    mnuOptions.Enabled := true;
    mnuFont.OnClick := FontClick;

    mnuNext.OnClick := NextClick;
    tbNext.OnClick := NextClick;
    mnuPrev.OnClick := PrevClick;
    tbPrev.OnClick := PrevClick;

    mnuCompareFiles.Visible := false;
    mnuNext.visible := true;
    mnuPrev.visible := true;
    tbNext.Enabled := FilesCompared;
    tbPrev.Enabled := FilesCompared;

    mnuCopyBlockLeft.OnClick := CopyBlockLeftClick;
    mnuCopyBlockRight.OnClick := CopyBlockRightClick;
    mnuCopyBlockLeft.Visible := true;
    mnuCopyBlockRight.Visible := true;
    N1.Visible := true;

    application.OnActivate := AppActivate;
    if FilesCompared then Statusbar1.Panels[3].text := fStatusbarStr
    else Statusbar1.Panels[3].text := '';
    ActiveControl := CodeEdit1;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.AppActivate(Sender: TObject);
begin
  //if a file change externally after being loaded in TextDiff,
  //then automatically reload that file ...
  if (fa1 <> 0) and fileExists(fn1)and (fa1 <> fileAge(fn1)) then
    DoOpenFile(fn1,true);
  if (fa2 <> 0) and fileExists(fn2)and (fa2 <> fileAge(fn2)) then
    DoOpenFile(fn2,false);
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.FrameResize(Sender: TObject);
begin
  if frmDiffMain.mnuHorzSplit.checked then pnlLeft.height := pnlMain.ClientHeight div 2 -1
  else pnlLeft.width := pnlMain.ClientWidth div 2 -1;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.OpenClick(Sender: TObject);
var
  IsFile1: boolean;

begin
  with frmDiffMain do
    IsFile1 := (Sender = mnuOpen1) or (Sender = tbOpen1);
  //JCFaria
  with frmMain do begin
    with odMain do begin
      if IsFile1 then InitialDir := LastOpenedFolder1
      else InitialDir := LastOpenedFolder2;
      FileName := '';
      Filter   := sdMain.Filter;  //SaveDialog was altered by JCFaria
      if not Execute then exit;
      DoOpenFile(FileName, IsFile1);
    end;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.HorzSplitClick(Sender: TObject);
begin
  with frmDiffMain do
  begin
    mnuHorzSplit.checked := not mnuHorzSplit.checked;
    if mnuHorzSplit.checked then begin
      pnlLeft.Align := alTop;
      pnlLeft.Height := pnlMain.ClientHeight div 2 -1;
      Splitter1.Align := alTop;
      Splitter1.cursor := crVSplit;
      mnuCopyBlockRight.Caption := 'Copy block down';
      mnuCopyBlockRight.ShortCut := Shortcut(ord('D'),[ssCtrl,ssAlt]);
      mnuCopyBlockLeft.Caption := 'Copy block up';
      mnuCopyBlockLeft.ShortCut := Shortcut(ord('U'),[ssCtrl,ssAlt]);
    end
    else begin
      pnlLeft.Align := alLeft;
      pnlLeft.Width := pnlMain.ClientWidth div 2 -1;
      Splitter1.Align := alLeft;
      Splitter1.Left := 10;
      Splitter1.cursor := crHSplit;
      mnuCopyBlockRight.Caption := 'Copy block right';
      mnuCopyBlockRight.ShortCut := Shortcut(ord('R'),[ssCtrl,ssAlt]);
      mnuCopyBlockLeft.Caption := 'Copy block left';
      mnuCopyBlockLeft.ShortCut := Shortcut(ord('L'),[ssCtrl,ssAlt]);
    end;
    if ActiveControl is TCodeEdit then
      TCodeEdit(ActiveControl).ScrollCaretIntoView;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.CompareClick(Sender: TObject);
var
  i: integer;
  HashList1,HashList2: TList;
begin
  if (Lines1.Count = 0) or (Lines2.Count = 0) then exit;

  if (CodeEdit1.Lines.Modified) or (CodeEdit2.Lines.Modified) then begin
    if application.MessageBox(
      'Changes will be lost if you proceed with this compare.'#10+
      'Continue? ...',pchar(application.title),
      MB_YESNO or MB_ICONSTOP or MB_DEFBUTTON2) <> IDYES then exit;
  end;


  CodeEdit1.Color := clWindow;
  CodeEdit2.Color := clWindow;

  //THIS PROCEDURE IS WHERE ALL THE HEAVY LIFTING (COMPARING) HAPPENS ...

  HashList1 := TList.create;
  HashList2 := TList.create;
  try
    //Create the hash lists used to compare line differences.
    //nb - there is a small possibility of different lines hashing to the
    //same value. However the probability of an invalid match occuring
    //in proximity to its invalid partner is remote. Ideally, these hash
    //collisions should be managed by ? incrementing the hash value.
    HashList1.capacity := Lines1.Count;
    HashList2.capacity := Lines2.Count;
    with frmDiffMain do begin
      for i := 0 to Lines1.Count-1 do
        HashList1.add(HashLine(Lines1[i],mnuIgnoreCase.checked,mnuIgnoreBlanks.checked));
      for i := 0 to Lines2.Count-1 do
        HashList2.add(HashLine(Lines2[i],mnuIgnoreCase.checked,mnuIgnoreBlanks.checked));
      mnuCompare.Enabled := false;
      tbCompare.Enabled := false;
      try
        mnuCancel.Enabled := true;
        tbCancel.Enabled := true;
        //CALCULATE THE DIFFS HERE ...
        if not Diff.Execute(PIntArray(HashList1.List),PIntArray(HashList2.List),
          HashList1.count, HashList2.count) then exit;
        FilesCompared := true;
        DisplayDiffs;
      finally
        mnuCompare.Enabled := true;
        tbCompare.Enabled := true;
        mnuCancel.Enabled := false;
        tbCancel.Enabled := false;
      end;
      ToggleLinkedScroll(true);
      ToggleCodeEditModified(true, false);
      ToggleCodeEditModified(false, false);
      frmDiffMain.ActiveControl := CodeEdit1;
      mnuNext.Enabled := true;
      mnuPrev.Enabled := true;
      tbNext.Enabled := true;
      tbPrev.Enabled := true;
      mnuSaveReport.Enabled := true;
    end;
  finally
    HashList1.Free;
    HashList2.Free;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.DiffProgress(Sender: TObject; percent: integer);
begin
  with frmDiffMain do begin
    Statusbar1.Panels[3].text := format('Approx. %d%% complete',[percent] );
    Statusbar1.Refresh;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.CancelClick(Sender: TObject);
begin
  Diff.Cancel;
  frmDiffMain.Statusbar1.Panels[3].text := 'Compare cancelled.'
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.DisplayDiffs;
var
  i,j,k: integer;
  linesAdd, linesMod, linesDel: integer;

  procedure AddAndFormat(CodeEdit: TCodeEdit; const Text: string;
    Color: TColor; num: longint);
  var
    i: integer;
  begin
    i := CodeEdit.Lines.Add(Text);
    with CodeEdit.Lines.LineObj[i] do begin
      BackClr := Color;
      Tag := num;
    end;
  end;

begin

  //THIS IS WHERE THE TDIFF RESULT IS CONVERTED INTO COLOR HIGHLIGHTING ...

  linesAdd := 0; linesMod := 0; linesDel := 0;
  CodeEdit1.Lines.BeginUpdate;
  CodeEdit2.Lines.BeginUpdate;
  try
    CodeEdit1.Lines.Clear;
    CodeEdit2.Lines.Clear;
    CodeEdit1.AutoLineNum := false;
    CodeEdit2.AutoLineNum := false;
    CodeEdit1.GutterWidth := CodeEdit1.CharWidth*(Log10(Lines1.Count)+1);
    CodeEdit2.GutterWidth := CodeEdit2.CharWidth*(Log10(Lines2.Count)+1);

    ////////////////////////////////////////////////////////////////////////
    j := 0; k := 0;
    with frmDiffMain, Diff do
    for i := 0 to ChangeCount-1 do
      with Changes[i] do begin
        //first add preceeding unmodified lines...
        if mnuShowDiffsOnly.Checked then
          inc(k, x - j)
        else
          while j < x do
          begin
             AddAndFormat(CodeEdit1, lines1[j],clWindow,j+1);
             AddAndFormat(CodeEdit2, lines2[k],clWindow,k+1);
             inc(j); inc(k);
          end;
        if Kind = ckAdd then begin
          for j := k to k+Range-1 do begin
           AddAndFormat(CodeEdit1, '',addClr,0);
           AddAndFormat(CodeEdit2,lines2[j],addClr,j+1);
           inc(linesAdd);
          end;
          j := x;
          k := y+Range;
        end
        else if Kind = ckModify then begin
          for j := 0 to Range-1 do begin
           AddAndFormat(CodeEdit1, lines1[x+j],modClr,x+j+1);
           AddAndFormat(CodeEdit2,lines2[k+j],modClr,k+j+1);
           inc(linesMod);
          end;
          j := x+Range;
          k := y+Range;
        end
        else begin
          for j := x to x+Range-1 do begin
           AddAndFormat(CodeEdit1, lines1[j],delClr,j+1);
           AddAndFormat(CodeEdit2,'',delClr,0);
           inc(linesDel);
          end;
          j := x+Range;
        end;
      end;
    //add remaining unmodified lines...
    if not frmDiffMain.mnuShowDiffsOnly.Checked then
      while j < lines1.count do begin
         AddAndFormat(CodeEdit1,lines1[j],clWindow,j+1);
         AddAndFormat(CodeEdit2,lines2[k],clWindow,k+1);
         inc(j); inc(k);
      end;
  finally
    CodeEdit1.Lines.EndUpdate;
    CodeEdit2.Lines.EndUpdate;
    CodeEdit1.Lines.Modified := false;
    CodeEdit2.Lines.Modified := false;
    UpdateDiffMarkerBmp;
    pbScrollPosMarker.Repaint;
  end;

  fStatusbarStr := '';
  if frmDiffMain.mnuIgnoreCase.checked then
    fStatusbarStr := 'Case ignored';
  if frmDiffMain.mnuIgnoreBlanks.checked then
    if fStatusbarStr = '' then
      fStatusbarStr := 'Blanks ignored' else
      fStatusbarStr := fStatusbarStr + ', Blanks Ignored';
  if fStatusbarStr <> '' then
    fStatusbarStr := '  ('+fStatusbarStr+')';

  if (linesAdd = 0) and (linesMod = 0) and (linesDel = 0) then
    fStatusbarStr := format('  No differences.  %s', [ fStatusbarStr])
  else
    fStatusbarStr :=
      format('  %d lines added, %d lines modified, %d lines deleted.  %s',
        [ linesAdd, linesMod, linesDel, fStatusbarStr]);
  frmDiffMain.Statusbar1.Panels[3].text := fStatusbarStr;

end;
//---------------------------------------------------------------------

//Syncronise scrolling of both CodeEdits (once files are compared)...
var IsSyncing: boolean;

procedure TfrmFilesFrame.SyncScroll(Sender: TObject);
begin
  if IsSyncing or not (Sender is TCodeEdit) then exit;
  IsSyncing := true; //stops recursion
  try
    if Sender = CodeEdit1 then
      CodeEdit2.TopVisibleLine := CodeEdit1.TopVisibleLine else
      CodeEdit1.TopVisibleLine := CodeEdit2.TopVisibleLine;
  finally
    IsSyncing := false;
  end;
  pbScrollPosMarkerPaint(self);
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.ToggleCodeEditModified(IsCodeEdit1, IsModified: boolean);
const
  clr: array[boolean] of TColor = (clBtnFace, ISMODIFIED_COLOR);
begin
  //change the color of the filename panel whenever file is modified ...
  if IsCodeEdit1 then begin
    pnlCaptionLeft.Color := clr[IsModified];
    frmDiffMain.mnuSave1.Enabled := IsModified;
    frmDiffMain.tbSave1.Enabled := IsModified;
  end
  else begin
    pnlCaptionRight.Color := clr[IsModified];
    frmDiffMain.mnuSave2.Enabled := IsModified;
    frmDiffMain.tbSave2.Enabled := IsModified;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.CodeEditLinesOnChange(Sender: TObject);
begin
  ToggleCodeEditModified(Sender = CodeEdit1.Lines, true);
end;
//---------------------------------------------------------------------

//detect whenever the caret is moved into a colored difference block
function TfrmFilesFrame.CaretInClrBlk(CodeEdit: TCodeEdit): boolean;
begin
  with CodeEdit do
    Result := FilesCompared and (CaretPt.Y < lines.Count) and
      (lines.LineObj[CaretPt.Y].BackClr <> color);
end;
//---------------------------------------------------------------------

//change menu options depending on whether caret is in a diff color block or not
procedure TfrmFilesFrame.CodeEditOnCaretPtChange(Sender: TObject);
var
  caretInClrBlock: boolean;
begin
  if not FilesCompared or not TCodeEdit(Sender).Focused then exit;
  caretInClrBlock := CaretInClrBlk(TCodeEdit(Sender)); //ie calls function once
  frmDiffMain.mnuCopyBlockRight.Enabled := caretInClrBlock and (Sender = CodeEdit1);
  frmDiffMain.mnuCopyBlockLeft.Enabled := caretInClrBlock and (Sender = CodeEdit2);
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.CodeEditOnEnter(Sender: TObject);
begin
  //keep compared text carets roughly in sync ...
  if FilesCompared and (CaretPosY >= 0) then
    with TCodeEdit(Sender) do CaretPt := Point(0,CaretPosY);
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.CodeEditOnExit(Sender: TObject);
begin
  //keep compared text carets roughly in sync too ...
  with TCodeEdit(Sender) do
    if (CaretPt.Y >= TopVisibleLine) and
      (CaretPt.Y <= TopVisibleLine + VisibleLines) then
      CaretPosY := CaretPt.Y
    else
      CaretPosY := -1;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.ToggleLinkedScroll(IsLinked: boolean);
begin
  if IsLinked then begin//FilesCompared = true
    CodeEdit1.OnScroll := SyncScroll;
    CodeEdit2.OnScroll := SyncScroll;
    SyncScroll(CodeEdit1);
    pnlDisplay.visible := true;
  end
  else begin
    CodeEdit1.OnScroll := nil;
    CodeEdit2.OnScroll := nil;
    pnlDisplay.visible := false;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.pbScrollPosMarkerPaint(Sender: TObject);
var
  yPos: integer;
begin
  //paint a marker indicating the vertical scroll position relative to change map
  if CodeEdit1.Lines.Count = 0 then exit;
  with pbScrollPosMarker do begin
    Canvas.Brush.Color := clWindow;
    Canvas.FillRect(ClientRect);
    with CodeEdit1 do
      yPos := TopVisibleLine + (ClientHeight div LineHeight) div 2;
    yPos := clientHeight*ypos div CodeEdit1.Lines.Count;
    Canvas.MoveTo(0,yPos);
    Canvas.LineTo(ClientWidth,yPos);
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.pbDiffMarkerPaint(Sender: TObject);
begin
  with pbDiffMarker do
    Canvas.StretchDraw(Rect(0,0,width,Height),pbDiffMarkerBmp);
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.FileDrop(Sender: TObject;
    const Filename: string; var DropAccepted: boolean);
begin
  DoOpenFile(Filename, Sender = CodeEdit1);
  setForegroundWindow(application.handle);
  DropAccepted := true;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.DoOpenFile(const Filename: string; IsFile1: boolean);
var
  CodeEdit: TCodeEdit;
begin
  if not fileexists(Filename) then exit;
  FilesCompared := false;
  ToggleLinkedScroll(false);
  if IsFile1 then begin
    CodeEdit := CodeEdit1;
    Lines1.LoadFromFile(filename);
    CodeEdit.Lines.Assign(Lines1);
    fn1 := Filename;
    fa1 := fileAge(fn1);
    pnlCaptionLeft.caption := '  '+ filename;
    LastOpenedFolder1 := extractfilepath(filename);
  end
  else begin
    CodeEdit := CodeEdit2;
    Lines2.LoadFromFile(filename);
    CodeEdit.Lines.Assign(Lines2);
    fn2 := Filename;
    fa2 := fileAge(fn2);
    pnlCaptionRight.caption := '  '+ filename;
    LastOpenedFolder2 := extractfilepath(filename);
  end;
  CodeEdit.AutoLineNum := true;
  ToggleCodeEditModified(IsFile1, false);
  pnlDisplay.visible := false;
  with frmDiffMain do begin
    activeControl := CodeEdit;
    mnuCompare.enabled := (Lines1.Count > 0) and (Lines2.Count > 0);
    tbCompare.enabled := frmDiffMain.mnuCompare.enabled;
    Statusbar1.Panels[3].text := '';
    mnuNext.Enabled := false;
    mnuPrev.Enabled := false;
    tbNext.Enabled := false;
    tbPrev.Enabled := false;
    mnuSaveReport.Enabled := false;
  end;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.UpdateDiffMarkerBmp;
var
  i,y: integer;
  clr: TColor;
  HeightRatio: single;
begin
  //draws a map of the differences ...
  if (CodeEdit1.Lines.Count = 0) or (CodeEdit2.Lines.Count = 0) then exit;
  HeightRatio := Screen.Height/CodeEdit1.Lines.Count;

  pbDiffMarkerBmp.Height := Screen.Height;
  pbDiffMarkerBmp.Width := pbDiffMarker.ClientWidth;
  pbDiffMarkerBmp.Canvas.Pen.Width := 2;
  with pbDiffMarkerBmp do Canvas.FillRect(Rect(0,0,width,height));
  with CodeEdit1 do begin
    for i := 0 to Lines.Count-1 do begin
      clr := CodeEdit1.lines.lineobj[i].BackClr;
      if clr = clWindow then continue;
      pbDiffMarkerBmp.Canvas.Pen.Color := clr;
      y := trunc(i*HeightRatio);
      pbDiffMarkerBmp.Canvas.MoveTo(0,y);
      pbDiffMarkerBmp.Canvas.LineTo(pbDiffMarkerBmp.Width,y);
    end;
  end;
  pbDiffMarker.Invalidate;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.PaintLeftMargin(Sender: TObject; Canvas: TCanvas;
  MarginRec: TRect; LineNo, Tag: integer);
var
  numStr: string;
begin
  //custom numbering of lines based on Tag (tag == 0 means no number) ...
  if tag = 0 then exit;
  numStr := inttostr(tag);
  Canvas.TextOut(MarginRec.Left + TCodeEdit(Sender).GutterWidth -
  Canvas.textwidth(numStr)-4, MarginRec.Top, numStr);
end;
//---------------------------------------------------------------------

function TfrmFilesFrame.FindNext(CodeEdit: TCodeEdit): boolean;
var
  i, PatLen, fndOffset: integer;

  function IsWholeWord(const line: string; xOffset, wordLen: integer): boolean;
  begin
    Result := ((xOffset = 0) or not
      (line[xOffset] in ['A'..'Z','a'..'z','0'..'9'])) and
      ((xOffset + wordLen >= length(line)) or not
      (line[xOffset + wordLen +1] in ['A'..'Z','a'..'z','0'..'9']));
  end;

begin
  Result := false;
  with CodeEdit do begin
    if CaretPt.Y >= lines.Count then exit;
    PatLen := length(Search.Pattern);
    Search.SetData(pchar(lines[CaretPt.Y]),lines.LineObj[CaretPt.Y].LineLen);
    i := CaretPt.Y;
    //search the first line, making sure we've gone beyond the caret ...
    fndOffset := Search.FindFirst;
    repeat
     if (fndOffset < 0) then break //not found
     else if (fndOffset < CaretPt.X) then fndOffset := Search.FindNext
     else if not FindInfo.wholeWords or
       IsWholeWord(lines[CaretPt.Y], fndOffset, PatLen) then break //found!!
     else fndOffset := Search.FindNext;
    until false;
    //if not found, search each subsequent line...
    while (fndOffset < 0) and (i < lines.Count-1) do begin
     inc(i);
     Search.SetData(pchar(lines[i]),lines.LineObj[i].LineLen);
     fndOffset := Search.FindFirst;
     if (fndOffset >= 0) and FindInfo.wholeWords then
       while (fndOffset >= 0) and not IsWholeWord(lines[i], fndOffset, PatLen) do
         fndOffset := Search.FindNext;
    end;
    if fndOffset < 0 then exit; //not found
    CaretPt := Point(fndOffset,i);
    SelLength := length(Search.Pattern);
    ScrollCaretIntoView;
    Result := true;
  end;
end;
//------------------------------------------------------------------------------

function TfrmFilesFrame.FindPrevious(CodeEdit: TCodeEdit): boolean;
var
  i, PatLen, fndOffset, lastFoundXPos: integer;

  function IsWholeWord(const line: string; xOffset, wordLen: integer): boolean;
  begin
    Result := ((xOffset = 0) or not
      (line[xOffset] in ['A'..'Z','a'..'z','0'..'9'])) and
      ((xOffset + wordLen >= length(line)) or not
      (line[xOffset + wordLen +1] in ['A'..'Z','a'..'z','0'..'9']));
  end;

begin
  Result := false;
  with CodeEdit do begin
    if CaretPt.Y >= lines.Count then exit;
    PatLen := length(Search.Pattern);
    //search the first line, going as close to but not beyond the caret ...
    lastFoundXPos := -1;
    fndOffset := Search.FindFirst;
    //avoid finding the same Result with repeated searches ...
    while (fndOffset >= 0) and (fndOffset < CaretPt.X - PatLen) do begin
     if not FindInfo.wholeWords or
       IsWholeWord(lines[CaretPt.Y], fndOffset, PatLen) then
         lastFoundXPos := fndOffset;
     fndOffset := Search.FindNext;
    end;
    i := CaretPt.Y;
    //if not found, search each preceeding line...
    while (lastFoundXPos < 0) and (i > 0) do begin
     dec(i);
     Search.SetData(pchar(lines[i]),lines.LineObj[i].LineLen);
     fndOffset := Search.FindFirst;
     while (fndOffset >= 0) do begin
       if not FindInfo.wholeWords or IsWholeWord(lines[i], fndOffset, PatLen) then
         lastFoundXPos := fndOffset;
       fndOffset := Search.FindNext;
     end;
    end;
    if lastFoundXPos < 0 then exit; //not found
    CaretPt := Point(lastFoundXPos,i);
    SelLength := length(Search.Pattern);
    ScrollCaretIntoView;
    Result := true;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.ReplaceDown(CodeEdit: TCodeEdit);
var
  ReplaceType: TReplaceType;
  CaretCoord: TPoint;
begin
  if FindInfo.replacePrompt then begin
    ReplaceType := rtOK;
    while FindNext(CodeEdit) do begin
      if ReplaceType <> rtAll then begin
        //get the clientcoords of Caret ...
        CaretCoord := CodeEdit.ClientPtFromCharPt(CodeEdit.CaretPt);
        //convert CaretCoord to form's Coords ...
        CaretCoord := CodeEdit.ClientToScreen(CaretCoord);
        CaretCoord := self.ScreenToClient(CaretCoord);
        //now display the replace prompt dialog ...
        ReplaceType := ReplacePrompt(frmDiffMain, CaretCoord);
      end;
      case ReplaceType of
        rtOK:
          begin
            CodeEdit.Selection := FindInfo.replaceStr;
            if not FindInfo.replaceAll then exit; //replace One
          end;
        rtSkip: ; //do nothing
        rtAll:  CodeEdit.Selection := FindInfo.replaceStr;
        rtCancel: exit;
      end;
    end;
  end
  else if FindInfo.replaceAll then
    while FindNext(CodeEdit) do
      CodeEdit.Selection := FindInfo.replaceStr
  else if FindNext(CodeEdit) then //replace One - no prompt
    CodeEdit.Selection := FindInfo.replaceStr;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.ReplaceUp(CodeEdit: TCodeEdit);
var
  ReplaceType: TReplaceType;
  CaretCoord: TPoint;
begin
  if FindInfo.replacePrompt then begin
    ReplaceType := rtOK;
    while FindPrevious(CodeEdit) do begin
      if ReplaceType <> rtAll then begin
        //get the clientcoords of Caret ...
        CaretCoord := CodeEdit.ClientPtFromCharPt(CodeEdit.CaretPt);
        //convert CaretCoord to form's Coords ...
        CaretCoord := CodeEdit.ClientToScreen(CaretCoord);
        CaretCoord := self.ScreenToClient(CaretCoord);
        //now display the replace prompt dialog ...
        ReplaceType := ReplacePrompt(TForm(owner), CaretCoord);
      end;
      case ReplaceType of
        rtOK:
          begin
            CodeEdit.Selection := FindInfo.replaceStr;
            if not FindInfo.replaceAll then exit; //replace One
          end;
        rtSkip: ; //do nothing
        rtAll:  CodeEdit.Selection := FindInfo.replaceStr;
        rtCancel: exit;
      end;
    end;
  end
  else if FindInfo.replaceAll then
    while FindPrevious(CodeEdit) do
      CodeEdit.Selection := FindInfo.replaceStr
  else if FindPrevious(CodeEdit) then //replace One - no prompt
    CodeEdit.Selection := FindInfo.replaceStr;
end;
//------------------------------------------------------------------------------

//go to next color block (only enabled if files have been compared)
procedure TfrmFilesFrame.NextClick(Sender: TObject);
var
  i: integer;
  clr: TColor;
  CodeEdit: TCodeEdit;
begin
  if CodeEdit1.Focused then
    CodeEdit := CodeEdit1
  else if CodeEdit2.Focused then
    CodeEdit := CodeEdit2
  else exit;

  //get next colored block ...
  with CodeEdit do begin
    if lines.Count = 0 then exit;
    i := CaretPt.Y;
    clr := lines.LineObj[i].BackClr;
    repeat
      inc(i);
    until (i = Lines.Count) or (lines.LineObj[i].BackClr <> clr);
    if (i = Lines.Count) then //do nothing here
    else if lines.LineObj[i].BackClr = color then
    repeat
      inc(i);
    until (i = Lines.Count) or (lines.LineObj[i].BackClr <> color);
    if (i = Lines.Count) then begin
      beep;  //not found
      exit;
    end;
    CaretPt := Point(0,i);
    //now make sure as much of the block as possible is visible ...
    clr := lines.LineObj[i].BackClr;
    repeat
      inc(i);
    until(i = Lines.Count) or (lines.LineObj[i].BackClr <> clr);
    if i >= TopVisibleLine + visibleLines then TopVisibleLine := CaretPt.Y;
  end;
end;
//---------------------------------------------------------------------

//go to previous color block (only enabled if files have been compared)
procedure TfrmFilesFrame.PrevClick(Sender: TObject);
var
  i: integer;
  clr: TColor;
  CodeEdit: TCodeEdit;
  label notFound;

begin
  if CodeEdit1.Focused then
    CodeEdit := CodeEdit1
  else if CodeEdit2.Focused then
    CodeEdit := CodeEdit2
  else exit;

  //get prev colored block ...
  with CodeEdit do begin
    i := CaretPt.Y;
    if i = Lines.count then goto notFound;
    clr := lines.LineObj[i].BackClr;
    repeat
      dec(i);
    until (i < 0) or (lines.LineObj[i].BackClr <> clr);
    if i < 0 then goto notFound;
    if lines.LineObj[i].BackClr = Color then
    repeat
      dec(i);
    until (i < 0) or (lines.LineObj[i].BackClr <> Color);
    if i < 0 then goto notFound;
    clr := lines.LineObj[i].BackClr;
    while (i > 0) and (lines.LineObj[i-1].BackClr = clr) do dec(i);
    //'i' now at the beginning of the previous color block.
    CaretPt := Point(0,i);
    exit;
  end;

notFound: beep;
end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.SaveFileClick(Sender: TObject);
var
  i, LineCnt: integer;
  s, fName: string;
  p: PChar;
  CodeEdit: TCodeEdit;

begin
  if (Sender = frmDiffMain.mnuSave1) or (Sender = frmDiffMain.tbSave1) then
  begin
    CodeEdit := CodeEdit1;
    fName := trim(pnlCaptionLeft.Caption);
  end else
  begin
    CodeEdit := CodeEdit2;
    fName := trim(pnlCaptionRight.Caption);
  end;
  if not CodeEdit.Lines.modified then exit;
  //if not SaveDialog1.Execute then exit;
  LineCnt := CodeEdit.lines.Count;

  if not FilesCompared then
  begin
    //just save whatever's there. reload it (to update filenames etc) & exit
    CodeEdit.Lines.SaveToFile(fName);
    DoOpenFile(fName, CodeEdit = CodeEdit1);
    exit;
  end;

  if LineCnt > 0 then
  begin
    //get max possible size
    with CodeEdit.Lines.LineObj[LineCnt-1] do
      i := LineOffset + LineLen + Sizeof(CodeEditor.NEWLINE);
    setLength(s,i);
    p := pchar(s);
    //just copy numbered lines and edited lines ...
    for i := 0 to LineCnt -1 do
    begin
      with CodeEdit.Lines.LineObj[i] do
        if (Tag <> 0) or LineModified then
        begin
          if LineLen > 0 then
          begin
            system.Move(pchar(CodeEdit.Lines[i])^,p^,LineLen);
            inc(p, LineLen);
          end;
          system.Move(CodeEditor.NEWLINE, p^, sizeof(CodeEditor.NEWLINE));
          inc(p, sizeof(CodeEditor.NEWLINE));
        end;
    end;
    setlength(s, p - @s[1]);
  end;
  with TFileStream.Create(fName, fmCreate) do
    try
      WriteBuffer(Pointer(S)^, Length(S));
    finally
      free;
    end;
  //reload the file ...
  DoOpenFile(fName, CodeEdit = CodeEdit1);

end;
//---------------------------------------------------------------------

procedure TfrmFilesFrame.SaveReportClick(Sender: TObject);
var
  i, ln: integer;
  clr: TColor;
  fName, fileExtension : string;

begin
  frmMain.sdMain.InitialDir := extractfilepath(fn1);
  //JCFaria
  //frmMain.dlgSDMain.Filter := 'Text files (*.txt)|*.txt';
  //frmMain.dlgSDMain.DefaultExt := 'txt';
  frmMain.sdMain.FilterIndex := 3;
  if not frmMain.sdMain.execute then exit;
  with TStringList.create do
  try
    beginupdate;
    add('Difference Report - '+ formatdatetime(shortdateformat+', '+ShortTimeFormat, now));
    add('================================================================================');
    add('');
    add(format('File 1: "%s"',[fn1]));
    add('        Last modified on '+
      formatdatetime(shortdateformat +', '+ ShortTimeFormat, filedateToDatetime(fa1)));
    add(format('File 2: "%s"',[fn2]));
    add('        Last modified on '+
      formatdatetime(shortdateformat +', '+ ShortTimeFormat, filedateToDatetime(fa2)));
    add('');

    ln := 0;
    clr := clWindow;
    for i := 0 to CodeEdit1.Lines.count-1 do
      with CodeEdit1.Lines.LineObj[i] do begin
        //nb: 'Tag' is 1 based line index (unless lines added where Tag = 0)
        if Tag > ln then ln := Tag;
        if BackClr <> clr then begin//new color block
          if BackClr = addClr then begin
            add('================================================================================');
            add('Lines added at '+ inttostr(ln+1));
            add('================================================================================');
            add('+ '+ CodeEdit2.Lines[i]);
          end
          else if BackClr = modClr then begin
            add('================================================================================');
            add('Lines modified at '+inttostr(ln));
            add('================================================================================');
            add('- '+ CodeEdit1.Lines[i]);
            add('+ '+ CodeEdit2.Lines[i]);
          end
          else if BackClr = delClr then begin
            add('================================================================================');
            add('Lines deleted at '+inttostr(ln));
            add('================================================================================');
            add('- '+ CodeEdit1.Lines[i]);
          end;
          clr := BackClr;
        end else begin//add line to existing block
          if BackClr = addClr then
            add('+ '+ CodeEdit2.Lines[i])
          else if BackClr = modClr then begin
            add('- '+ CodeEdit1.Lines[i]);
            add('+ '+ CodeEdit2.Lines[i]);
          end
          else if BackClr = delClr then
            add('- '+ CodeEdit1.Lines[i]);
        end;
      end;
    endupdate;
    //JCFaria
    with frmMain do begin
      fName := sdMain.FileName;
      fileExtension := lowerCase(ExtractFileExt(fName));
      if not (fileExtension = frmMain.sSaveAsFileExt) then
        fName := sdMain.FileName + frmMain.sSaveAsFileExt;
    end;

    if FileExists(fName) then
      if MessageDlg(fName + #13 + #13 +
                    'Do you want to overwrite this file?',
                    mtConfirmation, [mbYES, mbCANCEL], 0) <> idYES then Exit;
    savetofile(fName);
  finally
    Free;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.CodeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not FilesCompared or (Shift * [ssAlt,ssCtrl] <> [ssAlt,ssCtrl]) then exit;
  if (key = VK_RIGHT) and CaretInClrBlk(CodeEdit1) then
    CopyBlockRightClick(nil)
  else if (key = VK_LEFT) and CaretInClrBlk(CodeEdit2) then
    CopyBlockLeftClick(nil);
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.CopyBlockRightClick(Sender: TObject);
var
  blockTopLine: integer;
  blockBottomLine: integer;
  clr: TColor;
begin
  frmDiffMain.mnuCopyBlockRight.Enabled := false;
  if frmDiffMain.ActiveControl <> CodeEdit1 then exit;
  with CodeEdit1 do begin
    if lines.Count = 0 then exit;
    blockTopLine := CaretPt.Y;
    clr := lines.LineObj[blockTopLine].BackClr;
    if clr = color then exit; //we're not in a colored block !!!
    blockBottomLine := blockTopLine;
    while (blockTopLine > 0) and
      (lines.LineObj[blockTopLine-1].BackClr = clr) do dec(blockTopLine);
    while (blockBottomLine < Lines.Count-1) and
      (lines.LineObj[blockBottomLine+1].BackClr = clr) do inc(blockBottomLine);
    //make sure color blocks still match up ...
    if (blockBottomLine > CodeEdit2.Lines.Count -1) or
      (CodeEdit2.Lines.LineObj[blockTopLine].BackClr <> clr) or
      (CodeEdit2.Lines.LineObj[blockBottomLine].BackClr <> clr) then exit;
    SelStart := lines.LineObj[blockTopLine].LineOffset;
    SelLength := lines.LineObj[blockBottomLine].LineOffset+
      lines.LineObj[blockBottomLine].LineLen - SelStart +2; //+2 for #13#10
  end;

  //the following line would be quicker but would not handle undoing ...
  //for i := blockTopLine to blockBottomLine do CodeEdit2.Lines[i] := CodeEdit1.Lines[i];

  if CodeEdit1.SelLength = 0 then
  begin
    Clipboard.Open;
    try
      Clipboard.Clear;
    finally
      Clipboard.Close;
    end;
  end else
    CodeEdit1.CopyToClipBoard;

  with CodeEdit2 do
  begin
    SelStart := lines.LineObj[blockTopLine].LineOffset;
    SelLength := lines.LineObj[blockBottomLine].LineOffset+
      lines.LineObj[blockBottomLine].LineLen - SelStart +2; //+2 for #13#10
    PasteFromClipBoard;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.CopyBlockLeftClick(Sender: TObject);
var
  blockTopLine: integer;
  blockBottomLine: integer;
  clr: TColor;
begin
  frmDiffMain.mnuCopyBlockLeft.Enabled := false;
  if frmDiffMain.ActiveControl <> CodeEdit2 then exit;
  with CodeEdit2 do begin
    if lines.Count = 0 then exit;
    blockTopLine := CaretPt.Y;
    clr := lines.LineObj[blockTopLine].BackClr;
    if clr = color then exit; //we're not in a colored block !!!
    blockBottomLine := blockTopLine;
    while (blockTopLine > 0) and
      (lines.LineObj[blockTopLine-1].BackClr = clr) do dec(blockTopLine);
    while (blockBottomLine < Lines.Count-1) and
      (lines.LineObj[blockBottomLine+1].BackClr = clr) do inc(blockBottomLine);
    //make sure color blocks still match up ...
    if (blockBottomLine > CodeEdit1.Lines.Count -1) or
      (CodeEdit1.Lines.LineObj[blockTopLine].BackClr <> clr) or
      (CodeEdit1.Lines.LineObj[blockBottomLine].BackClr <> clr) then exit;
    SelStart := lines.LineObj[blockTopLine].LineOffset;
    SelLength := lines.LineObj[blockBottomLine].LineOffset+
      lines.LineObj[blockBottomLine].LineLen - SelStart +2; //+2 for #13#10
  end;
  //the following would be quicker but does not allow undoing ...
  {for i := blockTopLine to blockBottomLine do
    CodeEdit1.Lines[i] := CodeEdit2.Lines[i];}
  if CodeEdit2.SelLength = 0 then begin
    Clipboard.Open;
    try
      Clipboard.Clear;
    finally
      Clipboard.Close;
    end;
  end
  else
    CodeEdit2.CopyToClipBoard;

  with CodeEdit1 do begin
    SelStart := lines.LineObj[blockTopLine].LineOffset;
    SelLength := lines.LineObj[blockBottomLine].LineOffset+
      lines.LineObj[blockBottomLine].LineLen - SelStart +2; //+2 for #13#10
    PasteFromClipBoard;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.UndoClick(Sender: TObject);
begin
  if frmDiffMain.ActiveControl = CodeEdit1 then CodeEdit1.Undo
  else if frmDiffMain.ActiveControl = CodeEdit2 then CodeEdit2.Undo;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.RedoClick(Sender: TObject);
begin
  if frmDiffMain.ActiveControl = CodeEdit1 then CodeEdit1.Redo
  else if frmDiffMain.ActiveControl = CodeEdit2 then CodeEdit2.Redo;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.EditClick(Sender: TObject);
begin
  with frmDiffMain do begin
    if ActiveControl = CodeEdit1 then begin
      mnuUndo.Enabled := CodeEdit1.CanUndo;
      mnuRedo.Enabled := CodeEdit1.CanRedo;
      mnuCut.Enabled := CodeEdit1.SelLength > 0;
    end
    else if ActiveControl = CodeEdit2 then begin
      mnuUndo.Enabled := CodeEdit2.CanUndo;
      mnuRedo.Enabled := CodeEdit2.CanRedo;
      mnuCut.Enabled := CodeEdit2.SelLength > 0;
    end;
    mnuCopy.Enabled := mnuCut.Enabled;
    Clipboard.Open;
    try
      mnuPaste.Enabled := Clipboard.HasFormat(CF_TEXT);
    finally
      Clipboard.Close;
    end;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.CutClick(Sender: TObject);
begin
  if frmDiffMain.ActiveControl = CodeEdit1 then
    CodeEdit1.CutToClipBoard
  else if frmDiffMain.ActiveControl = CodeEdit2 then
    CodeEdit2.CutToClipBoard;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.CopyClick(Sender: TObject);
begin
  if frmDiffMain.ActiveControl = CodeEdit1 then
    CodeEdit1.CopyToClipBoard
  else if frmDiffMain.ActiveControl = CodeEdit2 then
    CodeEdit2.CopyToClipBoard;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.PasteClick(Sender: TObject);
begin
  if frmDiffMain.ActiveControl = CodeEdit1 then
    CodeEdit1.PasteFromClipBoard
  else if frmDiffMain.ActiveControl = CodeEdit2 then
    CodeEdit2.PasteFromClipBoard;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.FindClick(Sender: TObject);
begin
  if not GetFindInfo(frmDiffMain, FindInfo) then exit;
  Search.Pattern := FindInfo.findStr;
  Search.CaseSensitive := not FindInfo.ignoreCase;
  FindNextClick(nil);
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.FindNextClick(Sender: TObject);
var
  codeEdit: TCodeEdit;
begin
  if FindInfo.findStr = '' then
   FindClick(nil)
  else begin
    if codeEdit2 = frmDiffMain.activeControl then
      codeEdit := codeEdit2 else
      codeEdit := codeEdit1;
    if FindInfo.directionDown then begin
      if not FindNext(CodeEdit) then beep;
    end else
      if not FindPrevious(CodeEdit) then beep;
  end;
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.ReplaceClick(Sender: TObject);
var
  codeEdit: TCodeEdit;
begin
  if not GetReplaceInfo(frmDiffMain, FindInfo) then exit;
  Search.Pattern := FindInfo.findStr;
  Search.CaseSensitive := not FindInfo.ignoreCase;
  if codeEdit2 = frmDiffMain.activeControl then
    codeEdit := codeEdit2 else
    codeEdit := codeEdit1;
  if FindInfo.directionDown then
    ReplaceDown(CodeEdit) else
    ReplaceUp(CodeEdit);
end;
//------------------------------------------------------------------------------

procedure TfrmFilesFrame.FontClick(Sender: TObject);
begin
  if not fdFiles.Execute then exit;
  CodeEdit1.Font := fdFiles.Font;
  CodeEdit2.Font := fdFiles.Font;
end;
//---------------------------------------------------------------------

{ Save as!? 
  //JCFaria
  if (Sender = frmDiffMain.mnuSave1) or (Sender = frmDiffMain.tbSave1) then begin
    CodeEdit := CodeEdit1;
    tmpName := trim(pnlCaptionLeft.Caption);
  end
  else begin
    CodeEdit := CodeEdit2;
    tmpName := trim(pnlCaptionRight.Caption);
  end;

  if not CodeEdit.Lines.modified then Exit;
  fName      := ExtractFileName(tmpName);
  fExtension := lowerCase(ExtractFileExt(tmpName));

  pPos := pos('.', fName);
  if (pPos > 0) then fName := Copy(fName, 1, pPos - 1);  //Remove extension

  with frmMain do begin
    dlgSDMainTypeChange(self);
    if not (fExtension = frmMain.SaveAsFileExt) then begin
      fTemp := fName + frmMain.SaveAsFileExt;
      dlgSDMain.FileName := fName;
      if not dlgSDMain.Execute then Exit;
      if FileExists(fTemp) then
      if MessageDlg(fTemp + #13 +
                    #13 + 'Do you want to overwrite this file?',
                    mtConfirmation, [mbYES, mbCANCEL], 0)<> idYES then Exit;
    end
    else begin
      fTemp := fName + fExtension;
      dlgSDMain.FileName := fName;
      if not dlgSDMain.Execute then Exit;
    end;
  end;

  LineCnt := CodeEdit.lines.Count;

  if not FilesCompared then begin
    //just save whatever's there. reload it (to update filenames etc) & exit
    with frmMain.dlgSDMain do begin
      CodeEdit.Lines.SaveToFile(FileName);
      DoOpenFile(FileName, CodeEdit = CodeEdit1);
    end;
    Exit;
  end;

  if LineCnt > 0 then begin
    //get max possible size
    with CodeEdit.Lines.LineObj[LineCnt-1] do
      i := LineOffset + LineLen + Sizeof(CodeEditor.NEWLINE);
    setLength(s,i);
    p := pchar(s);
    //just copy numbered lines and edited lines ...
    for i := 0 to LineCnt -1 do begin
      with CodeEdit.Lines.LineObj[i] do
        if (Tag <> 0) or LineModified then begin
          if LineLen > 0 then begin
            system.Move(pchar(CodeEdit.Lines[i])^,p^,LineLen);
            inc(p, LineLen);
          end;
          system.Move(CodeEditor.NEWLINE, p^, sizeof(CodeEditor.NEWLINE));
          inc(p, sizeof(CodeEditor.NEWLINE));
        end;
    end;
    setlength(s, p - @s[1]);
  end;
  with TFileStream.Create(fTemp, fmCreate) do
    try
      WriteBuffer(Pointer(S)^, Length(S));
    finally
      free;
    end;
  //reload the file ...
  with frmMain.dlgSDMain do begin
    DoOpenFile(FileName, CodeEdit = CodeEdit1);
    FilterIndex := 1;
  end;
  frmMain.SaveAsFileExt := '';
}

end.

