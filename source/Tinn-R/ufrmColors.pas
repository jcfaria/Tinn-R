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

unit ufrmColors;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, ComCtrls, SynEdit, ColorGrd,
  SynEditHighlighter, SynHighlighterMulti, SynHighlighterPas,
  ActnList, AbArcTyp, AbUtils, AbZipper,
  AbZipKit, AbZipTyp, AbZBrows, AbMeter, AbDlgDir, AbView, AbZView, AbBrowse,
  AbBase, AbUnzper, DBCtrls, trShape, StrUtils;

type
  TfrmColors = class(TForm)
    actTextAttributes: TAction;
    alAttributes: TActionList;
    bbHelp: TBitBtn;
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    bbtSetBGForAllIdentifiers: TBitBtn;
    bbtSetBGForAllIHighlighters: TBitBtn;
    Bevel1: TBevel;
    cbActiveLineBG: TCheckBox;
    cbBold: TCheckBox;
    cbItalic: TCheckBox;
    cbUnderline: TCheckBox;
    cgColors: TColorGrid;
    gpbAttributes: TGroupBox;
    gpbHighlighters: TGroupBox;
    gpbIdentifiers: TGroupBox;
    gpbMorColors: TGroupBox;
    gpbSample: TGroupBox;
    gpbText: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    lbHighlighters: TListBox;
    lbIdentifiers: TListBox;
    lHighlighters: TLabel;
    lWarning_1: TLabel;
    lWarning_2: TLabel;
    lWarning_3: TLabel;
    shActiveLine: TtrShape;
    shBG: TtrShape;
    shBGAllHighlighters: TtrShape;
    shBGPreferred: TtrShape;
    shBrackets: TtrShape;
    shFG: TtrShape;
    synSample: TSynEdit;

    procedure actTextAttributesExecute(Sender: TObject);
    procedure bbHelpClick(Sender: TObject);
    procedure bbtOKClick(Sender: TObject);
    procedure bbtSetBGForAllIdentifiersClick(Sender: TObject);
    procedure bbtSetBGForAllIHighlightersClick(Sender: TObject);
    procedure cbActiveLineBGMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure cgColorsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbHighlightersClick(Sender: TObject);
    procedure lbIdentifiersClick(Sender: TObject);
    procedure panBackgroundColorClick(Sender: TObject);
    procedure shActiveLineMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGAllHighlightersMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBGPreferredMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shBracketsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure shFGMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure synSampleChange(Sender: TObject);
    procedure synSampleClick(Sender: TObject);
    procedure synSampleKeyPress(Sender: TObject; var Key: WideChar);

  private
    { Private declarations }
    procedure pSavePreferences;
    procedure pSetAttr_SavePreferences(var AttrStyle: TFontStyles; att: TSynHighlighterAttributes);
    procedure pShowAttributes;
    procedure pStructureIniSyntaxFiles(clPreferred: TColor);
    procedure pUpdateActiveLine;
    procedure pUpdateColors(shTemp: TtrShape; clTemp: TColor);

  public
    { Public declarations }
  end;

type
  TMySynEdit = class(TSynEdit) end;

var
  frmColors: TfrmColors;

  sFriendlyName: WideString;

implementation

uses
  uDMSyn,
  ufrmMain,
  trSynUtils,
  trUtils;

{$R *.DFM}

procedure TfrmColors.pUpdateColors(shTemp: TtrShape;
                                   clTemp: TColor);
begin
  with shTemp do begin
    Brush.Color:= clTemp;
    Font.Color := fContrast_Color(clTemp);
  end
end;


procedure TfrmColors.pStructureIniSyntaxFiles(clPreferred: TColor);
var
  att: TSynHighlighterAttributes;

  clFG,
   clBG: TColor;

  i,
   j,
   k,
   iHighlighterID: integer;

  attrStyle,
   oldAttrStyle: TFontStyles;

  sName,
   sHighlighter: string;

begin
  lbHighlighters.Items.BeginUpdate;
  lbIdentifiers.Items.BeginUpdate;
  lbHighlighters.ItemIndex:= 0;
  lbIdentifiers.ItemIndex:= 0;

  for i:= 0 to (lbHighlighters.Items.Count - 1) do begin
    sHighlighter:= lbHighlighters.Items.Strings[i];

    // Will show the attribute of the selected highlighter
    iHighlighterID:= -1;
    for j:= 0 to (dmSyn.iHigCount - 1) do begin
      sName:= (dmSyn.Components[j] as TSynCustomHighlighter).GetFriendlyLanguageName;

      if (sName = 'General_Multi-Highlighter') then sName:= (dmSyn.Components[j] as TSynMultiSyn).DefaultLanguageName;

      if (sName = sHighlighter) then begin
        iHighlighterID:= j;
        lbIdentifiers.Clear;

        for k:= 0 to ((dmSyn.Components[j] as TSynCustomHighlighter).AttrCount - 1) do begin
          if ((dmSyn.Components[j] as TSynCustomHighlighter).Attribute[k].Name <> '') then
            lbIdentifiers.Items.Add((dmSyn.Components[j] as TSynCustomHighlighter).Attribute[k].Name);
        end;
        Break;
      end;
    end;

    // Show the sample of the selected highlighter
    if (iHighlighterID > -1) then
      //if ((dmSyn.Components[iHighlighterID] as TSynCustomHighlighter).GetLanguageName = 'General_Multi-Highlighter') then
      if ((dmSyn.Components[iHighlighterID] as TSynCustomHighlighter).GetFriendlyLanguageName = 'General_Multi-Highlighter') then
        synSample.Highlighter:= (dmSyn.Components[iHighlighterID] as TSynMultiSyn)
      else  // not 'General_Multi-Highlighter'
        synSample.Highlighter:= (dmSyn.Components[iHighlighterID] as TSynCustomHighlighter);
    lbIdentifiers.ItemIndex:= 0;

    for j:= 0 to (lbIdentifiers.Items.Count-1) do begin
      if (lbHighlighters.ItemIndex >= 0) then begin

        with synSample.Highlighter do begin
          clFG:= Attribute[lbIdentifiers.ItemIndex].Foreground;
          if (clFG = clNone) then clFG:= clBlack;
          clBG:= clPreferred;
        end;

        att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                               sFriendlyName);
        oldAttrStyle:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Style;

        try
          attrStyle:= [];
          att.ForegRound:= clFG;
          att.Background:= clBG;
          att.Style:= oldAttrStyle;
          synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Assign(att);

        if (synSample.Highlighter.GetFriendlyLanguageName = 'R') then
          with dmSyn.synR_term do begin     // synR_term is related to synR, but is a bit different
            BeginUpdate;
            Attribute[lbIdentifiers.ItemIndex].Assign(att);
            EndUpdate;
          end;

        if (synSample.Highlighter.GetFriendlyLanguageName = 'Text') then
          with dmSyn.synText_term do begin  // synText_term is related to synText, but is a bit different
            BeginUpdate;
            Attribute[lbIdentifiers.ItemIndex].Assign(att);
            EndUpdate;
          end;

        finally
          FreeAndNil(att);
        end;
      end;
      lbIdentifiers.ItemIndex:= (j + 1)
    end;
    pSavePreferences;

    lbHighlighters.ItemIndex:= (i + 1);
  end;

  lbHighlighters.Items.EndUpdate;

  lbIdentifiers.Items.EndUpdate;
end;

procedure TfrmColors.FormCreate(Sender: TObject);

  function CountFiles(pathToSearch: string): integer;
  var
    rec: TSearchRec;

    iFileCount: integer;

  begin
    iFileCount:= 0;
    if (FindFirst(pathToSearch,
                  faAnyFile,
                  rec) = 0) then
    begin
      repeat
        // Exclude directories from the list of files.
        if ((rec.Attr and faDirectory) <> faDirectory) then
          Inc(iFileCount);
      until FindNext(rec) <> 0;
      FindClose(rec);
    end;
    Result:= iFileCount;
  end;

var
  i,
   j,
   iIniSyntaxFiles: integer;

  sName,
   sSyntaxBKP: string;

begin
  // Update the appearance of some components based in public variables (frmTinnMain)
  with frmMain do begin
    pUpdateColors(shActiveLine,
                  clActiveLine);

    pUpdateColors(shBrackets,
                  clBrackets);

    pUpdateColors(shBGPreferred,
                  clBGPreferred);

    pUpdateColors(shBGAllHighlighters,
                  clBGForAllHighlighters);

    cbActiveLineBG.Checked:= bActiveLine;

    with synSample do begin
      OnPaintTransient:= TSyn_Transient.pSynPaintTransient;
      if bActiveLine then ActiveLineColor:= TColor(clActiveLine)
                     else ActiveLineColor:= TColor(clNone);
    end;

    // Update the appearance based in the editor
    coEditor.AssignTo(synSample);
  end;

  // Do a prior backup of all syntax files of ini
  sSyntaxBKP:= frmMain.sPath_SyntaxBKP +
               '\syntax_bkp.zip';
  try
    if FileExists(sSyntaxBKP) then DeleteFile(sSyntaxBKP);
  except
    //todo
  end;
  with frmMain do begin
    zipKit.StoreOptions:= [soRecurse];  // soRecurse: will include all files of all folders and sub-folders
    with zipKit do begin
      FileName:= sSyntaxBKP;
      AddFiles(sPath_Syntax + '\*.*', 0);
      CloseArchive;
    end;
  end;

  // Load the highlighters names into the listbox
  for j:= 0 to (dmSyn.iHigCount - 1) do begin
    sName:= (dmSyn.Components[j] as TSynCustomHighlighter).GetFriendlyLanguageName;
    if (sName = 'General_Multi-Highlighter') then
      sName:= (dmSyn.Components[j] as TSynMultiSyn).DefaultLanguageName;

    // It is necessary to distinguish R from Rterm (and both have name R)
    if ((dmSyn.Components[j] as TSynCustomHighlighter).Tag <> 99) then // Tag = 99 is an atribute of Rterm Highlighter
      lbHighlighters.Items.Add(sName)
  end;

  iIniSyntaxFiles:= CountFiles(frmMain.sPath_Syntax +
                               '\*.*');

  if (iIniSyntaxFiles <= 1) then pStructureIniSyntaxFiles(clWhite);

  // Try to find the language used in the main editor
  sName:= frmMain.cbSyntax.Items[frmMain.cbSyntax.ItemIndex];
  if (sName <> '') then begin
    for i:= 0 to (lbHighlighters.Items.Count - 1) do
      if (sName = lbHighlighters.Items.Strings[i]) then begin
        lbHighlighters.ItemIndex:= i;
        Break;
      end;
  end
  else lbHighlighters.ItemIndex:= 0;  // All Syntax!

  lbHighlightersClick(Self);
end;

procedure TfrmColors.lbHighlightersClick(Sender: TObject);

  // Get all schemes from any TSynMultiSyn
  procedure ShowStructure(synmTmp: TSynMultiSyn);
  var
    i: integer;

    sTmp: string;

  begin
    sTmp:= synmTmp.DefaultHighlighter.GetFriendlyLanguageName;

    i:= 0;
    while (i < synmTmp.Schemes.Count - 1) do begin
      sTmp:= sTmp +
             ', ' +
             synmTmp.Schemes.Items[i].DisplayName;
      inc(i)
    end;

    sTmp:= sTmp +
           ' and ' +
           synmTmp.Schemes.Items[i].DisplayName;

    lHighlighters.Caption:= sTmp;
  end;

var
  i,
   j,
   k,
   iHighlighterID: integer;

  sTemp,
   sHighlighter: string;

begin
  iHighlighterID:= -1;

  for i:= 0 to (lbHighlighters.Items.Count - 1) do
    if lbHighlighters.Selected[i] then begin
       sHighlighter:= lbHighlighters.Items.Strings[i];
       Break;
    end;

  // Will show the attribute of the selected highlighter
  lbIdentifiers.Clear;
  for j:= 0 to (dmSyn.iHigCount - 1) do begin
    sTemp:= (dmSyn.Components[j] as TSynCustomHighlighter).GetFriendlyLanguageName;

    if (sTemp = 'General_Multi-Highlighter') then begin
      sTemp:= (dmSyn.Components[j] as TSynMultiSyn).DefaultLanguageName;
    end;

    if (sTemp = sHighlighter) then begin
      iHighlighterID:= j;
      for k:= 0 to ((dmSyn.Components[j] as TSynCustomHighlighter).AttrCount - 1) do begin
        if ((dmSyn.Components[j] as TSynCustomHighlighter).Attribute[k].Name <> '') then
          lbIdentifiers.Items.Add((dmSyn.Components[j] as TSynCustomHighlighter).Attribute[k].Name);
      end;

      if MatchStr(sHighlighter,
                  aSynMultiSyn) then begin
        //gpbAttributes.Enabled:= False;  // This is so invasive
        lWarning_1.Visible   := True;
        lWarning_2.Visible   := True;
        lWarning_3.Visible   := True;
        lHighlighters.Visible:= True;
        ShowStructure(dmSyn.Components[j] as TSynMultiSyn)
      end
      else begin
        //gpbAttributes.Enabled:= True;  // This is so invasive
        lWarning_1.Visible   := False;
        lWarning_2.Visible   := False;
        lWarning_3.Visible   := False;
        lHighlighters.Visible:= False;
      end;
      Break;
    end;
  end;

  // Will show the sample of the selected highlighter
  if (iHighlighterID > -1) then begin
    if ((dmSyn.Components[iHighlighterID] as TSynCustomHighlighter).GetFriendlyLanguageName = 'General_Multi-Highlighter') then begin
      if (sHighlighter = 'HTML complex')         then synSample.Lines.Text:= sSampleHTMLcomplex
      else if (sHighlighter = 'PHP complex')     then synSample.Lines.Text:= sSamplePHPcomplex
      else if (sHighlighter = 'R complex')       then synSample.Lines.Text:= sSampleRcomplex
      else if (sHighlighter = 'R doc')           then synSample.Lines.Text:= sSampleRdoc
      else if (sHighlighter = 'R html')          then synSample.Lines.Text:= sSampleRhtml
      else if (sHighlighter = 'R markdown')      then synSample.Lines.Text:= sSampleRmarkdown
      else if (sHighlighter = 'R noweb')         then synSample.Lines.Text:= sSampleRnoweb;
      if (synSample.Lines.Count = 0)             then synSample.Lines.Text:= sSampleUnknowed;

      synSample.Highlighter:= (dmSyn.Components[iHighlighterID] as TSynMultiSyn);
    end
    else begin  // If not 'General_Multi-Highlighter'
      synSample.Highlighter:= nil;
      synSample.Lines.Text := (dmSyn.Components[iHighlighterID] as TSynCustomHighlighter).SampleSource;

      //if (synSample.Lines.Count = 0) then begin
        if (sHighlighter = 'C#')                   then synSample.Lines.Text:= sSampleCSharp
        else if (sHighlighter = 'CSS')             then synSample.Lines.Text:= sSampleCSS
        else if (sHighlighter = 'Fortran')         then synSample.Lines.Text:= sSampleFortran
        else if (sHighlighter = 'Structured Text') then synSample.Lines.Text:= sSampleST;
        //else synSample.Lines.Text:= sSampleUnknowed;
      //end;

      if (synSample.Lines.Count = 0) then synSample.Lines.Text:= sSampleUnknowed;
      synSample.Highlighter:= (dmSyn.Components[iHighlighterID] as TSynCustomHighlighter);

    end;
    lbIdentifiers.ItemIndex:= 0;

    pShowAttributes;
  end;
end;

procedure TfrmColors.pShowAttributes;
var
  clFG,
   clBG: TColor;

begin
  with synSample.Highlighter do begin
    //Foreground
    clFG:= Attribute[lbIdentifiers.ItemIndex].Foreground;
    if (clFG = clNone) then begin
      with shFG do begin
        Brush.Color:= clBlack;
        Font.Color := clWhite;
        Refresh;
      end;
      cgColors.ForegroundIndex:= 0 //clBlack
    end
    else begin
      with shFG do begin
        Brush.Color:= clFG;
        Font.Color := fContrast_Color(clFG);
        Refresh;
      end;
      cgColors.ForegroundIndex:= cgColors.ColorToIndex(clFG);
    end;

    //Background
    clBG:= Attribute[lbIdentifiers.ItemIndex].Background;
    if (clBG = clNone) then begin
      with shBG do begin
        Brush.Color:= clWhite;
        Font.Color := clBlack;
        Refresh;
      end;
      cgColors.BackgroundIndex:= 15 //clWhite
    end
    else begin
      with shBG do begin
        Brush.Color:= clBG;
        Font.Color := fContrast_Color(clBG);
        Refresh;
      end;
      cgColors.BackgroundIndex:= cgColors.ColorToIndex(clBG);
    end;

    actTextAttributes.Enabled:= False;  // Do not remove!
    cbBold.Checked     := (fsBold in Attribute[lbIdentifiers.ItemIndex].Style);
    cbItalic.Checked   := (fsItalic in Attribute[lbIdentifiers.ItemIndex].Style);
    cbUnderline.Checked:= (fsUnderline in Attribute[lbIdentifiers.ItemIndex].Style);
    actTextAttributes.Enabled:= True;  // Do not remove!
  end;
  shBGPreferred.Font.Color:= fContrast_Color(shBGPreferred.Brush.Color);
end;

procedure TfrmColors.lbIdentifiersClick(Sender: TObject);
begin
  pShowAttributes;
end;

procedure TfrmColors.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"Highlighters (settings)"');
end;

procedure TfrmColors.bbtOKClick(Sender: TObject);
var
  syntaxBackupFile: string;

begin
  syntaxBackupFile:= frmMain.sPath_SyntaxBKP +
                     '\syntax_bkp.zip';
  try
    frmMain.zipKit.CloseArchive;
    if FileExists(syntaxBackupFile) then DeleteFile(syntaxBackupFile);
  except
    //todo
  end;

  pSavePreferences;
end;

procedure TfrmColors.pSavePreferences;
var
  LanguageName: string;

begin
  //LanguageName:= synSample.Highlighter.GetLanguageName;
  LanguageName:= synSample.Highlighter.GetFriendlyLanguageName;

  if (LanguageName = 'C/C++') then LanguageName:= 'C++';
  synSample.Highlighter.SaveToFile(frmMain.sPath_Syntax +
                                   '\' +
                                   LanguageName +
                                   '.ini');
end;

procedure TfrmColors.pSetAttr_SavePreferences(var AttrStyle: TFontStyles;
                                              att: TSynHighlighterAttributes);
begin
  if cbBold.Checked      then Include(AttrStyle,
                                      FsBold);

  if cbItalic.Checked    then Include(AttrStyle,
                                      FsItalic);

  if cbUnderLine.Checked then Include(AttrStyle,
                                      FsUnderLine);
  att.Style:= AttrStyle;

  with synSample.Highlighter do begin
    BeginUpdate;
    Attribute[lbIdentifiers.ItemIndex].Assign(att);
    EndUpdate;
  end;

  if (synSample.Highlighter.GetFriendlyLanguageName = 'R') then
    // SynR_term has no multline
    with dmSyn.synR_term do begin
      BeginUpdate;
      Attribute[lbIdentifiers.ItemIndex].Assign(att);
      EndUpdate;
    end;

  if (synSample.Highlighter.GetFriendlyLanguageName = 'Text') then
    // SynText_term has no multline
    with dmSyn.synText_term do begin
      BeginUpdate;
      Attribute[lbIdentifiers.ItemIndex].Assign(att);
      EndUpdate;
    end;

  pSavePreferences;
end;

procedure TfrmColors.actTextAttributesExecute(Sender: TObject);
var
  att: TSynHighlighterAttributes;

  AttrStyle: TFontStyles;

  clOldFG,
   clOldBG: TColor;

begin
  if (lbHighlighters.ItemIndex >= 0) then begin
    att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                           sFriendlyName);
    clOldFG:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;
    clOldBG:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Background;
    try
      AttrStyle:= [];
      att.Foreground:= clOldFG;
      att.Background:= clOldBG;

      pSetAttr_SavePreferences(AttrStyle,
                               att);
    finally
      pShowAttributes;
      FreeAndNil(att);
    end;
  end;
end;

procedure TfrmColors.cgColorsMouseUp(Sender: TObject;
                                     Button: TMouseButton;
                                     Shift: TShiftState;
                                     X, Y: Integer);
var
  att: TSynHighlighterAttributes;

  AttrStyle: TFontStyles;

  clOldFG,
   clOldBG: TColor;

begin
  if (lbHighlighters.ItemIndex >= 0) then begin
    att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                           sFriendlyName);
    clOldFG:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;
    clOldBG:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Background;
    try
      AttrStyle:= [];
      if (Button = mbLeft)  then begin  //Left button
        att.Foreground:= cgColors.ForegroundColor;
        att.Background:= clOldBG;
      end;

      if (Button = mbRight) then begin  //Right button
        att.Background:= cgColors.BackgroundColor;
        att.Foreground:= clOldFG;
      end;

      pSetAttr_SavePreferences(AttrStyle,
                               att);
    finally
      with shFG.Brush do begin
        Color:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;
        Color:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Background;
      end;
      FreeAndNil(att);
    end;
    pShowAttributes;
  end;
end;

procedure TfrmColors.shFGMouseUp(Sender: TObject;
                                 Button: TMouseButton;
                                 Shift: TShiftState;
                                 X, Y: Integer);
var
  att: TSynHighlighterAttributes;

  AttrStyle: TFontStyles;

  clOldBG: TColor;

begin
  with frmMain do begin
    cdMain.Color:= shFG.Brush.Color;

    if (cdMain.Execute) then pUpdateColors(shFG,
                                           cdMain.Color)
                        else Exit;
  end;

  if (lbHighlighters.ItemIndex >= 0) then begin
    att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                           sFriendlyName);
    clOldBG:=synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Background;

    try
      AttrStyle:= [];
      att.Foreground:= shFG.Brush.Color;
      att.Background:= clOldBG;

      pSetAttr_SavePreferences(AttrStyle,
                               att);
    finally
      FreeAndNil(att);
      pShowAttributes;
    end;
  end;
end;

procedure TfrmColors.shBGMouseUp(Sender: TObject;
                                 Button: TMouseButton;
                                 Shift: TShiftState;
                                 X, Y: Integer);
var
  att: TSynHighlighterAttributes;

  attrStyle: TFontStyles;

  clOldFG: TColor;

begin
  with frmMain do begin
    cdMain.Color:= shBG.Brush.Color;

    if (cdMain.Execute) then pUpdateColors(shBG,
                                           cdMain.Color)
                        else Exit;
  end;

  if (lbHighlighters.ItemIndex >= 0) then begin
    att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                           sFriendlyName);

    clOldFG:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;

    try
      attrStyle:= [];
      att.Background:= shBG.Brush.Color;
      att.ForegRound:= clOldFG;

      pSetAttr_SavePreferences(AttrStyle,
                               att);
    finally
      FreeAndNil(att);
      pShowAttributes;
    end;
  end;
end;

procedure TfrmColors.shBGPreferredMouseUp(Sender: TObject;
                                          Button: TMouseButton;
                                          Shift: TShiftState;
                                          X, Y: Integer);
begin
  with frmMain do begin
    cdMain.Color:= shBGPreferred.Brush.Color;

    if (cdMain.Execute) then pUpdateColors(shBGPreferred,
                                           cdMain.Color)
                        else Exit;
  end;
end;

procedure TfrmColors.shActiveLineMouseUp(Sender: TObject;
                                         Button: TMouseButton;
                                         Shift: TShiftState;
                                         X, Y: Integer);
begin
  with frmMain do begin
    cdMain.Color:= shActiveLine.Brush.Color;

    if (cdMain.Execute) then pUpdateColors(shActiveLine,
                                           cdMain.Color)
                        else Exit;
  end;

  pUpdateActiveLine;
end;

procedure TfrmColors.shBGAllHighlightersMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X, Y: Integer);
begin
  with frmMain do begin
    cdMain.Color:= shBGAllHighlighters.Brush.Color;

  if (cdMain.Execute) then pUpdateColors(shBGAllHighlighters,
                                         cdMain.Color)
                      else Exit;
  end;
end;

procedure TfrmColors.panBackgroundColorClick(Sender: TObject);
var
  att: TSynHighlighterAttributes;

  AttrStyle: TFontStyles;

  clBGChoice,
   clOldFG: TColor;

begin
  with frmMain do begin
    cdMain.Color:= shBG.Brush.Color;

    if (cdMain.Execute) then begin
      clBGChoice      := cdMain.Color;
      shBG.Brush.Color:= clBGChoice;
    end
    else Exit;
  end;

  if (lbHighlighters.ItemIndex >= 0) then begin
    att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                           sFriendlyName);
    clOldFG:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;

    try
      AttrStyle:= [];
      att.Background:= shBG.Brush.Color;
      att.ForegRound:= clOldFG;

      pSetAttr_SavePreferences(AttrStyle,
                               att);
    finally
      FreeAndNil(att);
      pShowAttributes;
    end;
  end;
end;

procedure TfrmColors.bbtSetBGForAllIdentifiersClick(Sender: TObject);
var
  att: TSynHighlighterAttributes;

  i,
   iOldIndex: integer;

  attrStyle,
   oldAttrStyle: TFontStyles;

  clOldFG: TColor;

begin
  iOldIndex:= lbIdentifiers.ItemIndex;
  lbIdentifiers.Items.BeginUpdate;
  lbIdentifiers.Visible  := False;
  lbIdentifiers.ItemIndex:= 0;

  for i:= 0 to (lbIdentifiers.Items.Count-1) do begin
    if (lbHighlighters.ItemIndex >= 0) then begin
      att:= TSynHighlighterAttributes.Create(lbIdentifiers.Items[lbIdentifiers.ItemIndex],
                                             sFriendlyName);
      clOldFG     := synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;
      oldAttrStyle:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Style;

      try
        attrStyle:= [];
        att.Background:= shBGPreferred.Brush.Color;
        att.ForegRound:= clOldFG;
        att.Style:= oldAttrStyle;

        with synSample.Highlighter do begin
          BeginUpdate;
          Attribute[lbIdentifiers.ItemIndex].Assign(att);
          EndUpdate;
        end;

        if (synSample.Highlighter.GetFriendlyLanguageName = 'R') then
          with dmSyn.synR_term do begin     // synR_term is related to synR, but is a bit different
            BeginUpdate;
            Attribute[lbIdentifiers.ItemIndex].Assign(att);
            EndUpdate;
          end;

        if (synSample.Highlighter.GetFriendlyLanguageName = 'Text') then
          with dmSyn.synText_term do begin  // synText_term is related to synText, but is a bit different
            BeginUpdate;
            Attribute[lbIdentifiers.ItemIndex].Assign(att);
            EndUpdate;
          end;

      finally
        FreeAndNil(att);
      end;
    end;
    lbIdentifiers.ItemIndex:= (i + 1)
  end;

  with lbIdentifiers do begin
    ItemIndex:= iOldIndex;
    Visible  := True;
    Items.EndUpdate;
  end;

  pSavePreferences;
  pShowAttributes;
end;

procedure TfrmColors.synSampleClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synSample;
end;

procedure TfrmColors.synSampleKeyPress(Sender: TObject;
                                       var Key: WideChar);

  function sFormat(sTmp: string;
                   cTmp: char): string;
  begin
    Result:= key +
             sTmp +
             cTmp;
  end;

  procedure InsertText(sTmp: string;
                       i: integer);
  begin
    with synSample do begin
      SelText:= sTmp;
      CaretX := CaretX - i;
    end;

    key:= #0;  // make nul the key pressed
  end;

begin
  if frmMain.actAutoCompletion.Checked then
    with synSample do
      case key of
         '(': if SelAvail then
                InsertText(sFormat(SelText,
                                   ')'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ')'),
                           1);
         '[': if SelAvail then
                InsertText(sFormat(SelText,
                                   ']'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ']'),
                           1);
         '{': if SelAvail then
                InsertText(sFormat(SelText,
                                   '}'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   '}'),
                           1);
        '''': if SelAvail then
                InsertText(sFormat(SelText,
                                   ''''),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ''''),
                           1);
         '"': if SelAvail then
                InsertText(sFormat(SelText,
                                   '"'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   '"'),
                           1);
      end;
end;

procedure TfrmColors.synSampleChange(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synSample;
end;

procedure TfrmColors.bbtSetBGForAllIHighlightersClick(Sender: TObject);
var
  iPos: integer;

begin
  // Set background color for all identifires of all highlighters
  iPos:= lbHighlighters.ItemIndex;

  pStructureIniSyntaxFiles(shBGAllHighlighters.Brush.Color);

  lbHighlighters.ItemIndex:= iPos;

  lbHighlightersClick(nil);
end;

procedure TfrmColors.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    with lbHighlighters do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with lbIdentifiers do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;
end;

procedure TfrmColors.pUpdateActiveLine;
begin
  with synSample do
    if cbActiveLineBG.Checked then ActiveLineColor:= TColor(shActiveLine.Brush.Color)
                              else ActiveLineColor:= TColor(clNone);
end;


procedure TfrmColors.cbActiveLineBGMouseUp(Sender: TObject;
                                           Button: TMouseButton;
                                           Shift: TShiftState;
                                           X, Y: Integer);
begin
  pUpdateActiveLine;
end;

procedure TfrmColors.FormShow(Sender: TObject);
begin
  lbIdentifiers.SetFocus;

  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmColors.shBracketsMouseUp(Sender: TObject;
                                       Button: TMouseButton;
                                       Shift: TShiftState;
                                       X, Y: Integer);
begin
  with frmMain do begin
    cdMain.Color:= shBrackets.Brush.Color;

    if (cdMain.Execute) then
    begin
      pUpdateColors(shBrackets,
                    cdMain.Color);
      clBrackets:= cdMain.Color;
      with synSample do begin
        BeginUpdate;
        Repaint;
        EndUpdate;
      end;
    end
    else Exit;
  end;
end;

end.

