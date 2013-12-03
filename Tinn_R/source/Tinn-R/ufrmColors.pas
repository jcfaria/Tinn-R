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
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    bbtSetBGForAllIdentifiers: TBitBtn;
    bbtSetBGForAllIHighlighters: TBitBtn;
    cbBold: TCheckBox;
    cbActiveLineBG: TCheckBox;
    cbItalic: TCheckBox;
    cbUnderline: TCheckBox;
    cgColors: TColorGrid;
    gpbAttributes: TGroupBox;
    gpbHighlighters: TGroupBox;
    gpbIdentifiers: TGroupBox;
    gpbMorColors: TGroupBox;
    gpbText: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox6: TGroupBox;
    lbHighlighters: TListBox;
    lbIdentifiers: TListBox;
    lHighlighters: TLabel;
    lWarning: TLabel;
    shActiveLine: TtrShape;
    shBG: TtrShape;
    shBGAllHighlighters: TtrShape;
    shBGPreferred: TtrShape;
    shBrackets: TtrShape;
    shFG: TtrShape;
    gpbSample: TGroupBox;
    synSample: TSynEdit;

    procedure actTextAttributesExecute(Sender: TObject);
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

  private
    { Private declarations }
    procedure SavePreferences;
    procedure SetAttr_SavePreferences(var AttrStyle: TFontStyles; att: TSynHighlighterAttributes);
    procedure ShowAttributes;
    procedure StructureIniSyntaxFiles(clPreferred: TColor);
    procedure UpdateActiveLine;
    procedure UpdateColors(shTemp: TtrShape; clTemp: TColor);

  public
    { Public declarations }
  end;

type
  TMySynEdit = class(TSynEdit) end;

var
  frmColors: TfrmColors;
  sFriendlyName: WideString;

implementation

uses uDMSyn, ufrmMain, trUtils;

{$R *.DFM}

procedure TfrmColors.UpdateColors(shTemp: TtrShape;
                                  clTemp: TColor);
begin
  with shTemp do begin
    Brush.Color:= clTemp;
    Font.Color := ContrastColor(clTemp);
  end
end;


procedure TfrmColors.StructureIniSyntaxFiles(clPreferred: TColor);
var
  att            : TSynHighlighterAttributes;
  clFG,
   clBG          : TColor;
  i,
   j,
   k,
   iHighlighterID: integer;
  oldAttrStyle,
   attrStyle     : TFontStyles;
  sName,
   sHighlighter  : string;

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
        finally
          FreeAndNil(att);
        end;
      end;
      lbIdentifiers.ItemIndex:= (j + 1)
    end;
    SavePreferences;

    lbHighlighters.ItemIndex:= (i + 1);
  end;
  lbHighlighters.Items.EndUpdate;

  lbIdentifiers.Items.EndUpdate;
end;

procedure TfrmColors.FormCreate(Sender: TObject);

  function CountFiles(pathToSearch: string): integer;
  var
    rec       : TSearchRec;
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
   sSyntaxBKP     : string;

begin
  // Update the appearance of some components based in public variables (frmTinnMain)
  with frmTinnMain do begin
    UpdateColors(shActiveLine,
                 clActiveLine);

    UpdateColors(shBrackets,
                 clBrackets);

    UpdateColors(shBGPreferred,
                 clBGPreferred);

    UpdateColors(shBGAllHighlighters,
                 clBGForAllHighlighters);

    cbActiveLineBG.Checked:= bActiveLine;
    with synSample do begin
      OnPaintTransient:= synPaintTransient;
      if bActiveLine then ActiveLineColor:= TColor(clActiveLine)
                     else ActiveLineColor:= TColor(clNone);
    end;
  end;

  // Do a prior backup of all syntax files of ini
  sSyntaxBKP:= frmTinnMain.sPathSyntaxBKP +
               '\syntax_bkp.zip';
  try
    if FileExists(sSyntaxBKP) then DeleteFile(sSyntaxBKP);
  except
    //todo
  end;
  with frmTinnMain do begin
    zipKit.StoreOptions:= [soRecurse];  // soRecurse: will include all files of all folders and sub-folders
    with zipKit do begin
      FileName:= sSyntaxBKP;
      AddFiles(sPathSyntax + '\*.*', 0);
      CloseArchive;
    end;
  end;

  // Load the highlighters names into the listbox
  for j:= 0 to (dmSyn.iHigCount - 1) do begin
    sName:= (dmSyn.Components[j] as TSynCustomHighlighter).GetFriendlyLanguageName;

    if (sName <> 'General_Multi-Highlighter') then begin
      if (sName <> 'R term') and
         (sName <> 'Text term') then
        lbHighlighters.Items.Add(sName)
    end
    else begin
      sName:= (dmSyn.Components[j] as TSynMultiSyn).DefaultLanguageName;
      lbHighlighters.Items.Add(sName)
    end;
  end;

  iIniSyntaxFiles:= CountFiles(frmTinnMain.sPathSyntax +
                               '\*.*');

  if (iIniSyntaxFiles <= 1) then StructureIniSyntaxFiles(clWhite);

  // Try to find the language used in the main editor
  sName:= frmTinnMain.cbSyntax.Items[frmTinnMain.cbSyntax.ItemIndex];
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
    i   : integer;
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
   sHighlighter  : string;

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
        lWarning.Visible     := True;
        lHighlighters.Visible:= True;
        ShowStructure(dmSyn.Components[j] as TSynMultiSyn)
      end
      else begin
        //gpbAttributes.Enabled:= True;  // This is so invasive
        lWarning.Visible     := False;
        lHighlighters.Visible:= False;
      end;
      Break;
    end;
  end;

  // Will show the sample of the selected highlighter
  if (iHighlighterID > -1) then begin
    if ((dmSyn.Components[iHighlighterID] as TSynCustomHighlighter).GetFriendlyLanguageName = 'General_Multi-Highlighter') then begin
      if (sHighlighter = 'HTML complex')         then synSample.Lines.Text:= dmSyn.SynHTML.SampleSource
      else if (sHighlighter = 'PHP complex')     then synSample.Lines.Text:= dmSyn.SynPHP.SampleSource
      else if (sHighlighter = 'R complex')       then synSample.Lines.Text:= sSampleRcomplex
      else if (sHighlighter = 'R doc')           then synSample.Lines.Text:= sSampleRdoc
      else if (sHighlighter = 'R html')           then synSample.Lines.Text:= sSampleRhtml
      else if (sHighlighter = 'R markdown')      then synSample.Lines.Text:= sSampleRmarkdown
      else if (sHighlighter = 'R noweb')         then synSample.Lines.Text:= sSampleRnoweb;
      if (synSample.Lines.Count = 0)             then synSample.Lines.Text:= sSampleUnknowed;

      synSample.Highlighter:= (dmSyn.Components[iHighlighterID] as TSynMultiSyn);
    end
    else begin  // If not 'General_Multi-Highlighter'
      synSample.Highlighter:= nil;
      synSample.Lines.Text := (dmSyn.Components[iHighlighterID] as TSynCustomHighlighter).SampleSource;

      if (synSample.Lines.Count = 0) then begin
        if (sHighlighter = 'Fortran')    then synSample.Lines.Text:= sSampleFortran
        else if (sHighlighter = 'Structured Text') then synSample.Lines.Text:= sSampleST
        else synSample.Lines.Text:= sSampleUnknowed;
      end;

      synSample.Highlighter:= (dmSyn.Components[iHighlighterID] as TSynCustomHighlighter);
    end;
    lbIdentifiers.ItemIndex:= 0;

    ShowAttributes;
  end;
end;

procedure TfrmColors.ShowAttributes;
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
        Font.Color := ContrastColor(clFG);
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
        Font.Color := ContrastColor(clBG);
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
  shBGPreferred.Font.Color:= ContrastColor(shBGPreferred.Brush.Color);
end;

procedure TfrmColors.lbIdentifiersClick(Sender: TObject);
begin
  ShowAttributes;
end;

procedure TfrmColors.bbtOKClick(Sender: TObject);
var
  syntaxBackupFile: string;

begin
  syntaxBackupFile:= frmTinnMain.sPathSyntaxBKP +
                     '\syntax_bkp.zip';
  try
    frmTinnMain.zipKit.CloseArchive;
    if FileExists(syntaxBackupFile) then DeleteFile(syntaxBackupFile);
  except
    //todo
  end;
  SavePreferences;
end;

procedure TfrmColors.SavePreferences;
var
  LanguageName: string;

begin
  //LanguageName:= synSample.Highlighter.GetLanguageName;
  LanguageName:= synSample.Highlighter.GetFriendlyLanguageName;

  if (LanguageName = 'C/C++') then LanguageName:= 'C++';
  synSample.Highlighter.SaveToFile(frmTinnMain.sPathSyntax +
                                   '\' +
                                   LanguageName +
                                   '.ini');
end;

procedure TfrmColors.SetAttr_SavePreferences(var AttrStyle: TFontStyles;
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

  SavePreferences;
end;

procedure TfrmColors.actTextAttributesExecute(Sender: TObject);
var
  att      : TSynHighlighterAttributes;
  AttrStyle: TFontStyles;
  clOldFG,
   clOldBG : TColor;

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

      SetAttr_SavePreferences(AttrStyle,
                              att);
    finally
      ShowAttributes;
      FreeAndNil(att);
    end;
  end;
end;

procedure TfrmColors.cgColorsMouseUp(Sender: TObject;
                                     Button: TMouseButton;
                                     Shift: TShiftState;
                                     X, Y: Integer);
var
  att      : TSynHighlighterAttributes;
  AttrStyle: TFontStyles;
  clOldFG,
   clOldBG : TColor;

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

      SetAttr_SavePreferences(AttrStyle, att);
    finally
      with shFG.Brush do begin
        Color:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Foreground;
        Color:= synSample.Highlighter.Attribute[lbIdentifiers.ItemIndex].Background;
      end;
      FreeAndNil(att);
    end;
    ShowAttributes;
  end;
end;

procedure TfrmColors.shFGMouseUp(Sender: TObject;
                                 Button: TMouseButton;
                                 Shift: TShiftState;
                                 X, Y: Integer);
var
  att      : TSynHighlighterAttributes;
  AttrStyle: TFontStyles;
  clOldBG  : TColor;

begin
  with frmTinnMain do begin
    cdMain.Color:= shFG.Brush.Color;

    if (cdMain.Execute) then UpdateColors(shFG,
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

      SetAttr_SavePreferences(AttrStyle,
                              att);
    finally
      FreeAndNil(att);
      ShowAttributes;
    end;
  end;
end;

procedure TfrmColors.shBGMouseUp(Sender: TObject;
                                 Button: TMouseButton;
                                 Shift: TShiftState;
                                 X, Y: Integer);
var
  att      : TSynHighlighterAttributes;
  attrStyle: TFontStyles;
  clOldFG  : TColor;

begin
  with frmTinnMain do begin
    cdMain.Color:= shBG.Brush.Color;

    if (cdMain.Execute) then UpdateColors(shBG,
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

      SetAttr_SavePreferences(AttrStyle, att);
    finally
      FreeAndNil(att);
      ShowAttributes;
    end;
  end;
end;

procedure TfrmColors.shBGPreferredMouseUp(Sender: TObject;
                                          Button: TMouseButton;
                                          Shift: TShiftState;
                                          X, Y: Integer);
begin
  with frmTinnMain do begin
    cdMain.Color:= shBGPreferred.Brush.Color;

    if (cdMain.Execute) then UpdateColors(shBGPreferred,
                                          cdMain.Color)
                        else Exit;
  end;
end;

procedure TfrmColors.shActiveLineMouseUp(Sender: TObject;
                                         Button: TMouseButton;
                                         Shift: TShiftState;
                                         X, Y: Integer);
begin
  with frmTinnMain do begin
    cdMain.Color:= shActiveLine.Brush.Color;

    if (cdMain.Execute) then UpdateColors(shActiveLine,
                                          cdMain.Color)
                        else Exit;
  end;

  UpdateActiveLine;
end;

procedure TfrmColors.shBGAllHighlightersMouseUp(Sender: TObject;
                                                Button: TMouseButton;
                                                Shift: TShiftState;
                                                X, Y: Integer);
begin
  with frmTinnMain do begin
    cdMain.Color:= shBGAllHighlighters.Brush.Color;

  if (cdMain.Execute) then UpdateColors(shBGAllHighlighters,
                                        cdMain.Color)
                      else Exit;
  end;
end;

procedure TfrmColors.panBackgroundColorClick(Sender: TObject);
var
  att        : TSynHighlighterAttributes;
  AttrStyle  : TFontStyles;
  clBGChoice,
   clOldFG   : TColor;

begin
  with frmTinnMain do begin
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

      SetAttr_SavePreferences(AttrStyle, att);
    finally
      FreeAndNil(att);
      ShowAttributes;
    end;
  end;
end;

procedure TfrmColors.bbtSetBGForAllIdentifiersClick(Sender: TObject);
var
  att          : TSynHighlighterAttributes;
  i,
   iOldIndex   : integer;
  oldAttrStyle,
   attrStyle   : TFontStyles;
  clOldFG      : TColor;

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
          // SynR_term has no multline
          with dmSyn.synR_term do begin
            BeginUpdate;
            Attribute[lbIdentifiers.ItemIndex].Assign(att);
            EndUpdate;
          end;

        if (synSample.Highlighter.GetFriendlyLanguageName = 'Text') then
          // SynText_term has no multline
          with dmSyn.synR_term do begin
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

  SavePreferences;
  ShowAttributes;
end;

procedure TfrmColors.synSampleClick(Sender: TObject);
begin
  frmTinnMain.synURIOpener.Editor:= synSample;
end;

procedure TfrmColors.synSampleChange(Sender: TObject);
begin
  frmTinnMain.synURIOpener.Editor:= synSample;
end;

procedure TfrmColors.bbtSetBGForAllIHighlightersClick(Sender: TObject);
var
  iPos: integer;

begin
  // Set background color for all identifires of all highlighters
  iPos:= lbHighlighters.ItemIndex;

  StructureIniSyntaxFiles(shBGAllHighlighters.Brush.Color);

  lbHighlighters.ItemIndex:= iPos;

  lbHighlightersClick(nil);
end;

procedure TfrmColors.FormActivate(Sender: TObject);
begin
  with frmTinnMain do begin
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

procedure TfrmColors.UpdateActiveLine;
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
  UpdateActiveLine;
end;

procedure TfrmColors.FormShow(Sender: TObject);
begin
  lbIdentifiers.SetFocus;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmColors.shBracketsMouseUp(Sender: TObject;
                                       Button: TMouseButton;
                                       Shift: TShiftState;
                                       X, Y: Integer);
begin
  with frmTinnMain do begin
    cdMain.Color:= shBrackets.Brush.Color;

    if (cdMain.Execute) then UpdateColors(shBrackets,
                                          cdMain.Color)
                        else Exit;
  end;
end;

end.

