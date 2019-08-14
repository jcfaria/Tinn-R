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

unit trSynUtils;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, Clipbrd,
  SynEdit, SynRegExpr, SynEditHighlighter,
  SynHighlighterMulti, SynEditTypes, SynEditRegExSearch,
  SynEditMiscClasses, SynEditSearch, SynExportTeX, SynExportRTF,
  SynEditExport, SynExportHTML, SynCompletionProposal,
  ShellCtrls, SynHighlighterURI, SynUnicode, SynEditTextBuffer,
  SynEditKeyCmds,
  PerlRegEx;

type
  TSyn_Transient = class (TObject)

  public
    class procedure pSynPaintTransient(Sender: TObject; Canvas: TCanvas; TransientType: TTransientType);
  end;

  //procedure pGetCallTip(var sRObject, sRPackage, sRTip: string; var bTipFound: boolean);
  function fFindWord_Extended(seTmp: TSynEdit; bDocumentation: boolean = False): string;
  function fTrigger_Find(seTmp: TSynEdit): string;
  function fTrigger_Get_Left(seTmp: TSynEdit): string;
  function fTrigger_Select(seTmp: TSynEdit): boolean;

  procedure pInsertText_Smart(seEditor: TSynEdit; sText: string; iLen: integer = 0);
  procedure pSetDataCompletion(synDC: TSynCompletionProposal; synTmp: TSynEdit; sTmp: string);

implementation

uses
  ufrmMain,
  trUtils,
  ufrmColors;


// This procedure was in the main unit of the projecy for a long time!
// SynEdit_UNICODE
// https://stackoverflow.com/questions/11314641/method-pointer-and-regular-procedure-incompatible
class procedure TSyn_Transient.pSynPaintTransient(Sender: TObject;
                                                  Canvas: TCanvas;
                                                  TransientType: TTransientType);
var
  seEditor: TSynEdit;

  aOpenChar,
   aCloseChar: Array of WideChar;

  Attri: TSynHighlighterAttributes;

  procedure pSetCanvasFont;
  begin
    seEditor.Canvas.Font.Assign(seEditor.Font);
    seEditor.Canvas.Font.Style:= Attri.Style;

    if (TransientType = ttAfter) then begin  // Occur just when FIND a symbol (going to right/up or left/down)
      if (Attri.Foreground = clRed) then
        with seEditor.Canvas.Font do begin
          Style:= [fsBold];
          Color:= fContrast_Color(Attri.Foreground)
        end
        else
          with seEditor.Canvas.Font do begin
            Style:= [fsBold];
            Color:= frmMain.clBrackets;
          end;

     {
      with seEditor.Canvas.Font do begin  // Users request me more visual definition
        Style:= [fsBold];
        if Color:= ContrastColor(clActiveLine);
      end;
     }

      if frmMain.bActiveLine then seEditor.Canvas.Brush.Color:= frmMain.clActiveLine
                             else seEditor.Canvas.Brush.Color:= Attri.Background;
    end
    else begin  // Occur just when LEAVE from a symbol (going to right/up or left/down)
      seEditor.Canvas.Font.Color:= Attri.Foreground;
      if frmMain.bActiveLine then seEditor.Canvas.Brush.Color:= frmMain.clActiveLine
                             else seEditor.Canvas.Brush.Color:= Attri.Background;
    end;
  end;

  function fCharToPixels(BC: TBufferCoord): TPoint;
  begin
    Result:= seEditor.RowColumnToPixels(seEditor.BufferToDisplayPos(BC));
  end;

var
  bcP,
   bcMatchBracketPos: TBufferCoord;

  wcCharA,
   wcCharB: WideChar;

  i,
   iArrayLength: integer;

  pP: TPoint;

  sTmp: WideString;

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
     ((seEditor.CaretXY.Char - 1) <= length(seEditor.Lines[seEditor.CaretXY.Line - 1])) and
     (length(seEditor.Lines[seEditor.CaretXY.Line - 1]) > 0) then wcCharA:= seEditor.Lines[seEditor.CaretXY.Line - 1][seEditor.CaretXY.Char-1]
  else wcCharA:= #0;

  if (seEditor.CaretXY.Line <= seEditor.Lines.Count) and
     ((seEditor.CaretXY.Char - 1) <= length(seEditor.Lines[seEditor.CaretXY.Line - 1])) and
     (length(seEditor.Lines[seEditor.CaretXY.Line - 1]) > 0) then wcCharB:= seEditor.Lines[seEditor.CaretXY.Line - 1][seEditor.CaretXY.Char]
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
        pP:= fCharToPixels(bcP);

        if (pP.X < TMySynEdit(seEditor).Gutter.Width) then Exit;

        pSetCanvasFont;
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
          pP:= fCharToPixels(bcMatchBracketPos);

          if (pP.X > TMySynEdit(seEditor).Gutter.Width) then begin
            pSetCanvasFont;

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

// Get complex words at the cursor: aaa.bbb-ccc_ddd.eee_fff
// from the synEdit workaround the limitations
// of the component by using regular expression
function fFindWord_Extended(seTmp: TSynEdit;
                            bDocumentation: boolean = False): string;
var
  sLine,
   sWord,
   sTmp_1,
   sTmp_2: string;

  smOption: TSynSelectionMode;

  iLines,
   iCaretX,
   iCaretY: integer;

begin
  if (seTmp = nil) then Exit;  // It is important, do not remove!

  with seTmp do
    if SelAvail and
      (BlockBegin.Line = BlockEnd.Line) then Result:= SelText
    else begin
      sWord:= GetWordAtRowCol(WordStartEx(CaretXY));  // A single word!
                                                      // Avoid return empty whether the cursor is at the end of word

      Result:= EmptyStr;

      // Start update
      BeginUpdate;
      smOption:= SelectionMode;
      if (SelectionMode <> smLine) then SelectionMode:= smLine;
      iCaretX:= CaretX;
      iCaretY:= CaretY;

      CaretX:= 0;
      iLines:= Lines.Count;
      if (CaretY = iLines) then sLine:= LineText  // Last line without line endings
      else begin
        if (LineText <> EmptyStr) then
          ExecuteCommand(ecSelLineEnd,
                         #0,
                         nil);

        if SelAvail then sLine:= trim(SelText)
        else begin
          EndUpdate;
          SelectionMode:= smOption;
          Exit;
        end;
      end;

      // End update
      CaretX:= iCaretX;
      CaretY:= iCaretY;
      SelectionMode:= smOption;
      EndUpdate;

      //The ReGex will get complex words from the line of sWord!
      //https://regex101.com/r/mpXnWt/2
      //$re = '/([a-zA-Z0-9]*[_.])*frame([_.]*[a-zA-Z0-9]*)*/';
      //$str = 'frame.table
      //data.frame
      //aggregate.data.frame
      //frame.default
      //as.character.frame_version
      //as.data.frame.numeric_version
      //aspell_frame_personal_dictionary_file
      //xtfrm.numeric_frame
      //as.data.frame.model.matrix
      //as.frame.numeric_version
      //all.frame
      //frame.equal.character
      //all.equal.frame';
      //
      //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
      //
      //// Print the entire match result
      //var_dump($matches);

      if (sWord <> EmptyStr) then
        sTmp_1:= fRegEx(sLine,
                        '([a-zA-Z0-9]*[_.])*' +
                        sWord +
                        '([_.]*[a-zA-Z0-9]*)*',
                        False);

//      ShowMessage(sWord + ' <-> ' + sLine + ' <-> ' + sTmp_1);
//      Exit;

      //The ReGex will get complex words: list and data.frame with operators $, [] and [[]] of the main user selected word!
      //https://regex101.com/r/9NCmVD/4
      //$re = '/word(\$[a-zA-Z.-_$]*|\[(\[)?[-,0-9\'"a-zA-Z\(\): ._]*\](\])?)/m';
      //$str = 'word$Sepal.Length
      //word$Species
      //word$SLotA$SlotB
      //
      //word[1]
      //word[[1]]
      //word[c(1, 2)]
      //word[-c(1, 2)]
      //word[-5]
      //word[1, 2]
      //word[, 1]
      //word[1,]
      //word[1:2,]
      //
      //word[1, 1, 1]
      //
      //word[\'Sepal.Length\']
      //word["Sepal.Length"]
      //';
      //
      //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
      //
      //// Print the entire match result
      //var_dump($matches);

//      sTmp:= fRegEx(sLine,
//                    sTmp + '(\$[a-zA-Z.-_$]*|' +
//                    '\[(\[)?[-,0-9' +
//                    '''' + // '
//                    '"'  + // "
//                    'a-zA-Z\(\): ._]*\](\])?)',
//                    False);
//
//      Result:= sTmp;

      //https://regex101.com/r/P3BLyu/4
      //$re = '/[a-zA-Z-_.]*(\$[a-zA-Z-._$]*|\[(\[)?[-,0-9\'"a-zA-Z\(\): ._]*\](\])?)/';
      //$str = 'iris
      //data.frame$data.frame
      //data-frame$data-frame
      //data_frame$data_frame
      //
      //a $Sepal.Length
      //iris$Sepal.Length
      //iris$Species
      //iris$SLotA$SlotB
      //
      //rock[1]
      //rock[[1]]
      //npk[c(1, 2)]
      //npk[-c(1, 2)]
      //word[-5]
      //word[1, 2]
      //word[, 1]
      //word[1,]
      //word[1:2,]
      //
      //iris3[1, 1, 1]
      //
      //iris[\'Sepal.Length\']
      //iris["Sepal.Length"]
      //';
      //
      //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
      //
      //// Print the entire match result
      //var_dump($matches);

      sTmp_2:= fRegEx(sLine,
                      '[a-zA-Z-0-9_.]*' +
                      '(\$[a-zA-Z-._$]*|' +
                      '\[(\[)?[-,0-9' +
                      '''' + // '
                      '"'  + // "
                      'a-zA-Z\(\): ._]*\](\])?)',
                      False);

//      ShowMessage(sTmp_1 + '   ' + sTmp_2);
//      Exit;

      if bDocumentation then Result:= sTmp_1
      else
        if (sTmp_2 = EmptyStr) then Result:= sTmp_1
                               else Result:= sTmp_2;
    end;
end;

// The function fTrigger_Get_Left(seTmp: TSynEdit): string;
// below is better and more simple!

// Get complex words at the cursor: .aa, ~bb, -cc, _dd, <ee, @ff, !gg
// from the synEdit workaround the limitations
// of the component by using regular expression
function fTrigger_Find(seTmp: TSynEdit): string;
var
  sLine,
   sTrigger,
   sTmp : string;

  smOption: TSynSelectionMode;

  iLines,
   iCaretX,
   iCaretY: integer;

begin
  if (seTmp = nil) then Exit;  // It is important, do not remove!

  with seTmp do
    if SelAvail and
      (BlockBegin.Line = BlockEnd.Line) then Result:= SelText
    else begin
      sTrigger:= GetWordAtRowCol(WordStartEx(CaretXY));  // But: a single word!
                                                         // Avoid return empty wheter cursor is at the end of word

      Result:= EmptyStr;

      // Start update
      BeginUpdate;
      smOption:= SelectionMode;
      if (SelectionMode <> smLine) then SelectionMode:= smLine;
      iCaretX:= CaretX;
      iCaretY:= CaretY;

      CaretX:= 0;
      iLines:= Lines.Count;
      if (CaretY = iLines) then sLine:= LineText  // Last line without line endings
      else begin
        if (LineText <> EmptyStr) then
      //--------------------------------------------------//
          ExecuteCommand(ecSelLineEnd,  // Not good!!!
                         #0,
                         nil);
      //--------------------------------------------------//

        if SelAvail then sLine:= trim(SelText)
        else begin
          EndUpdate;
          SelectionMode:= smOption;
          Exit;
        end;
      end;

      // End update
      CaretX:= iCaretX;
      CaretY:= iCaretY;
      SelectionMode:= smOption;
      EndUpdate;

      //The ReGex will get complex words from the line of sWord!
      sTmp:= fRegEx(sLine,
                    '([a-zA-Z0-9]*[._\-<@!~])*' +
                    sTrigger,
                    False);

      Result:= sTmp;
    end;
end;

function fTrigger_Select(seTmp: TSynEdit): boolean;
var
  iBegin,
   iEnd: integer;

begin
  with seTmp do begin
    // Searching the end (last char) of the trigger
    while (CharInSet(LineText[CaretX], [' ',
                                        ',',
                                        ')'])) and (CaretX > 1) do
      CaretX:= CaretX - 1;

    // The end of the trigger
    iEnd:= CaretX + 1;

    // Searching the begining (first cher) of the trigger
    if (CaretX > 1) then
      repeat
        CaretX:= CaretX - 1;
      until (CharInSet(LineText[CaretX], [' ',
                                          '('])) or (CaretX = 1);
    // The begin of the trigger
    if (CaretX = 1) then iBegin:= CaretX  // An special case
                    else iBegin:= CaretX + 1;

    BlockBegin:= BufferCoord(iBegin,
                             CaretY);

    BlockEnd:= BufferCoord(iEnd,
                           CaretY);
  end;

  with seTmp do
    Result:= SelAvail;
end;

function fTrigger_Get_Left(seTmp: TSynEdit): string;
var
  i: integer;

begin
  try
    Result:= EmptyStr;

    with seTmp do
      if (LineText = EmptyStr) then
        Exit;

    with seTmp do begin
      BeginUpdate;
      i:= CaretX;
      fTrigger_Select(seTmp);
      EndUpdate;
    end;
  finally
    // TODO
  end;

  with seTmp do begin
    if SelAvail then
      Result:= SelText;

    CaretX:= i;
  end;
end;

procedure pSetDataCompletion(synDC: TSynCompletionProposal;
                             synTmp: TSynEdit;
                             sTmp: string);
begin
  // Don't use 'with synDataCompletion' here!
  synDC.Editor:= synTmp;
  synDC.ShortCut:= TextToShortCut(sTmp);
end;

procedure pInsertText_Smart(seEditor: TSynEdit;
                            sText: string;
                            iLen: integer = 0);

  // Return the max length of the line
  function fMax_LineLength(slTmp:TStringList): integer;
  var
    i,
     iLen,
     iMaxLen: integer;

  begin
    iMaxLen:= 0;
    for i:=0 to (slTmp.Count - 1) do begin
      iLen:= Length(slTmp.Strings[i]);
      if (iLen > iMaxLen) then
        iMaxLen:= iLen;
    end;
      Result:= iMaxLen + 1;
  end;

var
  slTmp: TStringList;

  seTmp: TSynEdit;

  j: integer;

  bcPos: TBufferCoord;

  smOption: TSynSelectionMode;
begin
  try
    slTmp:= TStringList.Create();
    slTmp.Text:= sText;

    if (slTmp.Count > 1) then begin
      //The code is not very elegant but it is very, very efficient!
      //This, essencially, uses the method CutToClipboard of the SynEdit Class in smColum mode!
      //In this way the subsequent PasteToClipboard can be used whe the CareX X of the trigger is
      //outside of the 0!
      // For example:
      //
      //                 <trigger_here|
      //
      //------------------------------------------------------//
       seTmp:= TSynEdit.Create(nil);
       with seTmp do begin
         Parent:= frmMain.panInvisibleParent;
         Lines.Text:= sText;

         SelectionMode:= smColumn;  // The order above important!
         BlockBegin:= BufferCoord(0,
                                  0);

         BlockEnd:= BufferCoord(fMax_LineLength(slTmp),
                                slTmp.Count);
         CutToClipboard;  // It will preserve all identation of the code completion!
       end;
       FreeAndNil(seTmp);
      //------------------------------------------------------//

      // Push a possible content of the lines down before entering the completion
      with seEditor do
        for j:=1 to (slTmp.Count - 1) do
          ExecuteCommand(ecInsertLine,
                         #0,
                         nil);
    end // if (slTmp.Count > 1)
    else Clipboard.AsText:= sText;

    with seEditor do begin
      bcPos:= CaretXY;

      BeginUpdate;

      smOption:= SelectionMode;
      if (SelectionMode <> smNormal) then SelectionMode:= smNormal;

      if fTrigger_Select(seEditor) then PasteFromClipboard;

      CaretXY:= bcPos;
      SelectionMode:= smOption;
      EndUpdate;
    end;
  finally
    FreeAndNil(slTmp);
    pRestore_PriorClipboard_Text;
  end;
end;

//procedure pGetCallTip(var sRObject,
//                      sRPackage,
//                      sRTip: string;
//                      var bTipFound: boolean);
//
//  procedure pGetFunction_Completion(seEditor: TSynEdit;
//                                    var sLocLine: string;
//                                    var sContext: string;
//                                    var iOpenBrk: integer;
//                                    var iCloseBrk: integer;
//                                    var iLineCount: integer);
//  var
//    i,
//     iCaret,
//     iTopLine: integer;
//
//    bcPos: TBufferCoord;
//
//  begin
//    with seEditor do begin
//      iTopLine:= TopLine;
//      bcPos   := CaretXY;
//
//      i        := 0;       // Escape
//      iOpenBrk := 0;       // It stores the number of char '('
//      iCloseBrk:= 0;       // It stores the number of char ')'
//
//      iCaret:= CaretX;     // It stores CaretX in the first call. It is useful to this cases: sd(|), lm(|)
//
//      BeginUpdate;         // To freeze the editor
//      repeat
//        if (i = 0) then sLocLine:= Trim(Copy(LineText,
//                                             1,
//                                             iCaret - 1))
//                   else sLocLine:= Trim(LineText);
//
//        sContext:= Trim(LineText) + sContext;  // Stores the all lines of the search down/top
//
//        Inc(i);
//        iLineCount:= i;
//
//        iOpenBrk:= iOpenBrk +
//                   fCountChar(sLocLine,
//                              '(');
//
//        iCloseBrk:= iCloseBrk +
//                    fCountChar(sLocLine,
//                               ')');
//
//        if (iOpenBrk > iCloseBrk) then begin
//          TopLine:= iTopLine;
//          CaretXY:= bcPos;
//          EndUpdate;
//
//          {To debug only
//          stbMain.Panels[9].Text:= sLocLine +
//                                   '  ' +
//                                   IntToStr(iOpen) +
//                                   ':' +
//                                   IntToStr(iClose);;
//          }
//          Exit;
//        end;
//          ExecuteCommand(ecUp,
//                         #0,
//                         nil);
//
//      until (i = 40);  // 40 is the number of lines limit to search above the CaretY of the call.
//                       // It also circumvents possible situations not provided for the algorithm in big files.
//                       // It is the max visible lines of Tinn-R using my second monitor. ;)
//
//      TopLine:= iTopLine;
//      CaretXY:= bcPos;
//      EndUpdate;
//    end;
//  end;
//
//  // Function to receive and adequate tip from R under TCPIP
//  function fReceiveTipFromTCPIP(): string;
//  var
//    iPosDoubleCote: integer;
//
//    sRes: string;
//
//  begin
//    sRes:= frmTinnMain.csRtip.Socket.ReceiveText;
//
//    iPosDoubleCote:= Pos('"',
//                         sRes);
//
//    Delete(sRes,
//           1,
//           iPosDoubleCote);
//
//    sRes:= fInvertString(sRes);
//
//    iPosDoubleCote:= Pos('"',
//                         sRes);
//
//    Delete(sRes,
//           1,
//           iPosDoubleCote);
//
//    sRes:= fInvertString(sRes);
//
//    sRes:= StringReplace(sRes,
//                         '\"',
//                         '''',
//                         [rfReplaceAll]);
//
//    // Particular cases of R
//    // read.table(quote="\"'"  : it is very strange!
//    sRes:= StringReplace(sRes,
//                         '\\''''',
//                         '\"',
//                         [rfReplaceAll]);
//
//    Result:= trim(sRes);
//  end;
//
//  procedure pGetTipFrom_TCPIP(sRClassFor: string);
//  var
//    sCmd: string;
//
//    i: integer;
//
//  begin
//    // Try to find tip from TCPIP
//    if frmTinnMain.fUseTCPIP then begin
//      sCmd:= 'trArgs(' +
//                     'fname=' +
//                     '''' +
//                     sRObject +
//                     '''' +
//                     ', ' +
//                     'txt=' +
//                     '' +
//                     ', ' +
//                     'pkg=' +
//                     '''' +
//                     sRPackage +
//                     '''' +
//                     ', ' +
//                     'classfor=' +
//                     '''' +
//                     sRClassFor +
//                     '''' +
//                     ')' + #13#10;
//      frmTinnMain.csRtip.Socket.SendText(sCmd);
//
//      i:= 0;
//      repeat
//        sRTip:= EmptyStr;
//
//        Sleep(2 * frmTinnMain.iDelay);  // This delay is very important!
//
//        sRTip:= fReceiveTipFromTCPIP;
//
//        inc(i);
//      until (sRTip <> EmptyStr) or
//            (i = 5);
//
//      if (sRTip <> EmptyStr) then begin
//        bTipFound:= True;
//        frmTinnMain.sTipFromRServer:= 'TCP/IP';
//      end
//      else begin
//        frmTinnMain.stbMain.Panels[8].Text:= 'Tip not found';
//
//        if frmTinnMain.fUseTCPIP then frmTinnMain.stbMain.Panels[9].Text:= '<' +
//                                                                           sRObject +
//                                                                           '>' +
//                                                                           ' R server linked: YES'
//                    else frmTinnMain.stbMain.Panels[9].Text:= '<' +
//                                                              sRObject +
//                                                              '>' +
//                                                              ' R server linked: NOT';
//      end;
//    end  // fUseTCPIP
//  end;
//
//var
//  i,
//   iOpenBrk,
//   iCloseBrk,
//   iLineCount: integer;
//
//  sLocline,
//   sRClassFor,
//   sContext: string;
//
//  seEditor: TSynEdit;
//
//{
//  aOcc: array of array of integer;  // Dynamic array
//
//  procedure GetOcc(const S: string;
//                   const C: char);
//  var
//    i,
//     j: Integer;
//  begin
//    j:= 0;
//    for i:= 1 to length(S) do
//      if (S[i] = C) then begin
//        Inc(j);
//        SetLength(aOcc,
//                  j, 2);   // (n.lines, n.columns)
//
//        aOcc[j-1, 0]:= j;  // (Occurrence, Column 0)
//        aOcc[j-1, 1]:= i;  // (Position, Column 1)
//      end;
//  end;
//}
//  aOcc_Open_Brk: array of integer;  // Dynamic array
//  //aOcc_Close: array of integer;  // Dynamic array
//
//  procedure pGetOcc_Open_Brk(const S: string);
//  var
//    i,
//     j: integer;
//
//  begin
//    j:= -1;
//    for i:= 1 to length(S) do
//      if (S[i] = '(') then begin
//        Inc(j);
//        SetLength(aOcc_Open_Brk,
//                  j+1);
//
//        aOcc_Open_Brk[j]:= i;
//      end;
//  end;
//
//  {
//  procedure GetOcc_Close_Brk(const S: string);
//  var
//    i,
//     j: integer;
//
//  begin
//    j:= 0;
//    for i:= 1 to length(S) do
//      if (S[i] = ')') then begin
//        Inc(j);
//        SetLength(aOcc_Close,
//                  j);
//
//        aOcc_Close[j-1]:= i;
//      end;
//  end;
//  }
//
//  procedure pGetObject;
//  begin
//    // Get the Object
//    // Find the text immediately before the last open-parenthesis (the function)
//    // that doesn't have a matching close-parenthesis
//    // Question: http://stackoverflow.com/questions/16952821/regex-word-immediately-before-the-last-opened-parenthesis?lq=1
//    // https://regex101.com/r/pT3aY9/4
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

//
//    {
//    --------------------------
//    Text               I need
//    --------------------------
//    aaa(                  aaa
//    a_aa(                a_aa
//    a.aa(                a.aa
//    a.99(                a.99
//    aaa(x)                 ''
//    aaa(bbb(              bbb
//    aaa(y=b_bb(          b_bb
//    aaa(y=bbb()           aaa
//    aaa(y <- bbb()        aaa
//    aaa(bbb(x)            aaa
//    aaa(bbb(ccc(          ccc
//    aaa(bbb(x), ccc(      ccc
//    aaa(bbb(x), ccc()     aaa
//    aaa(bbb(x), ccc())     ''
//    --------------------------
//    }
//
//    // This is very iportant to coplex multiline
//    if (iLineCount > 1) then begin  // It was necessary to up at last one line to find the condition (iOpen > iClose) to finish the GetFunction_Completion!
//      pGetOcc_Open_Brk(sLocLine);
//
//      sRObject:= fRegEx(Copy(sLocLine,
//                             0,
//                             aOcc_Open_Brk[((iOpenBrk-iCloseBrk)-1)]),
//                        '[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)',  // R has function with complex names: '_', '.', 'numbers', ...
//                        False);
//    end
//    else  //The regex is great for one line cases!
//      sRObject:= fRegEx(sLocLine,
//                        '[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)',  // R has function with complex names: '_', '.', 'numbers', ...
//                        False);
//  end;
//
//  procedure pGetPackage;
//  begin
//    // Get the Package
//    // Find the text immediately before ::: (the package) considering
//    // the last open-parenthesis that doesn't have a matching close-parenthesis
//    // https://regex101.com/r/wQ7eB0/3
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


//
//    {
//    ----------------------------------
//    Text                       I need
//    ----------------------------------
//    aaa(stats:::sd(             stats
//    base:::a_aa(                 base
//    base:::a_a1(                 base
//    base:::a_99(                 base
//    base:::a.aa(                 base
//    base:::a.99(                 base
//    stats:::aaa(x)                 ''
//    aaa(base:::bbb(              base
//    aaa(y=base:::bbb(            base
//    base:::aaa(y=bbb()           base
//    base:::aaa(y <- bbb()        base
//    base:::aaa(bbb(x)            base
//    aaa(bbb(base:::ccc(          base
//    aaa(stats:::bbb(x), ccc(       ''
//    base:::aaa(bbb(x), ccc()     base
//    stats:::aaa(bbb(x), ccc())     ''
//    ----------------------------------
//    }
//
//    // This is very iportant to coplex multiline
//    if (iLineCount > 1) then begin  // It was necessary to up at last one line to find the condition (iOpen > iClose) to finish the GetFunction_Completion!
//      pGetOcc_Open_Brk(sLocLine);
//
//      sRPackage:= fRegEx(Copy(sLocLine,
//                              0,
//                              aOcc_Open_Brk[((iOpenBrk-iCloseBrk)-1)]),
//                         '[a-zA-Z0-9._]+(?=:{3}[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$))',  // R has function with complex names: '_', '.', 'numbers', ...
//                         False);
//    end
//    else  //The regex is great for one line cases!
//      sRPackage:= fRegEx(sLocLine,
//                         '[a-zA-Z0-9._]+(?=:{3}[a-zA-Z0-9._]+(?=\((?:[^()]*\([^()]*\))*[^()]*$))',  // R has function with complex names: '_', '.', 'numbers', ...
//                         False);
//  end;
//
//  function fGetEnd_ClassFor(const S: string): integer;
//  var
//    i,
//     iOpen_Brk,
//     iClose_Brk,
//     iComma: integer;
//
//  begin
//    i         := 0;
//    iOpen_Brk := 0;
//    iClose_Brk:= 0;
//    iComma    := 0;
//    Result:= -1;
//    repeat
//      if (S[i] = '(') then Inc(iOpen_Brk);
//      if (S[i] = ')') then Inc(iClose_Brk);
//      if (S[i] = ',') then Inc(iComma);
//
//      if (iOpen_Brk > 0) then begin
//        if (iOpen_Brk = iClose_Brk) then begin
//          Result:= i;
//          Exit;
//        end
//        else begin
//          // Inc(i);
//        end;
//      end
//      else begin
//        if (iComma > 0) then begin
//          Result:= i-1;
//          Exit;
//        end
//        else begin
//          // Inc(i)
//        end;
//      end;
//
//      Inc(i);
//    until (i = Length(S))
//  end;
//
//  procedure pGetClassFor;
//  begin
//    // Get the ClassFor
//    // Find the text immediately after the latst open-parenthesis (the object) considering
//    // the last open-parenthesis that doesn't have a matching close-parenthesis.
//    // Question: http://stackoverflow.com/questions/17065448/regex-text-immediately-after-the-last-opened-parenthesis?lq=1
//    // https://regex101.com/r/hT5rE2/5
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


//    {
//    ------------------------------------
//    Text                         I need
//    ------------------------------------
//    aaa(xxx                         xxx
//    aaa(xxx,                        xxx
//    aaa(xxx, yyy                    xxx
//    aaa(y=bbb(xxx)           y=bbb(xxx)
//    aaa(y <- bbb(xxx)     y <- bbb(xxx)
//    aaa(bbb(ccc(xxx                 xxx
//    aaa(bbb(x), ccc(xxx             xxx
//    aaa(bbb(x), ccc(x)           bbb(x)
//    aaa(bbb(x), ccc(x),          bbb(x)
//    aaa(?, bbb(??                    ??
//    aaa(bbb(x), ccc(x))              ''
//    aaa(x)                           ''
//    aaa(bbb(                         ''
//    aaa(bbb(x, y)             bbb(x, y)
//    aaa(bbb(x, y, z)       bbb(x, y, z)
//    ------------------------------------
//
//    Fail in all cases below:
//    ------------------------------------
//    mean(iris[1:10,1:4]
//    cov(iris[1:10,1:4],
//    plot(iris[1:10, 1:4]
//    plot(iris[1:10, -c(4:5)],
//    plot(iris[1:10, 1],
//    ------------------------------------
//    }
//
//    {
//    sRClassFor:= fRegEx(sLocLine,
//                        '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)',
//                        False);
//    }
//
//    // This is very iportant to coplex multiline
//    if (iLineCount > 1) then begin  // It was necessary to up at last one line to find the condition (iOpen > iClose) to finish the GetFunction_Completion!
//      pGetOcc_Open_Brk(sContext);
//      //ShowMessage(sContext);
//
//
//
//      sContext:= Copy(sContext,
//                      aOcc_Open_Brk[((iOpenBrk-iCloseBrk)-1)] + 1,
//                      Length(sContext));
//
//      //ShowMessage(sContext);
//
//      sRClassFor:= Copy(sContext,
//                        0,
//                        fGetEnd_ClassFor(sContext));
//
//      //ShowMessage(sRClassFor);
//    end
//    else  //The regex is great for one line cases!
//      sRClassFor:= fRegEx(sLocLine,
//                          '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)',  // R has function with complex names: '_', '.', 'numbers', ...
//                          False);
//  end;
//
//begin
//  seEditor:= nil;
//
//  frmTinnMain.sTipFromRServer:= EmptyStr;
//
//  i:= fFindTopWindow;
//  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
//    with (Self.MDIChildren[i] as TfrmEditor) do
//      if (sActiveEditor = 'synEditor') then seEditor:= synEditor
//                                       else seEditor:= synEditor2;
//
//  if (frmTinnMain.iSynWithFocus = 3) then pGetFunction_Completion(frmRTerm.synIO,
//                                                                  sLocLine,
//                                                                  sContext,
//                                                                  iOpenBrk,
//                                                                  iCloseBrk,
//                                                                  iLineCount)
//                         else pGetFunction_Completion(seEditor,
//                                                      sLocLine,
//                                                      sContext,
//                                                      iOpenBrk,
//                                                      iCloseBrk,
//                                                      iLineCount);
//
//  if (sLocLine <> EmptyStr) and
//     (iOpenBrk > iCloseBrk) then begin
//   {To debug only
//    for i:=0 to High(aOcc_Open_Brk) do
//      ShowMessage(IntToStr(i) +
//                  ' | ' +
//                  IntToStr(iOpen) +
//                  ':' +
//                  IntToStr(iClose) +
//                  ' | ' +
//                  sLocLine +
//                  ' | ' +
//                  IntToStr(aOcc_Open_Brk[i]));
//
//    for i:=0 to High(aOcc_Close) do
//      ShowMessage(IntToStr(i) +
//                  ' | ' +
//                  IntToStr(iOpen) +
//                  ':' +
//                  IntToStr(iClose) +
//                  ' | ' +
//                  sLocLine +
//                  ' | ' +
//                  IntToStr(aOcc_Close[i]));
//
//    ShowMessage(IntToStr(aOcc_Open_Brk[((iOpen-iClose)-1)]));
//   }
//
//    pGetObject;
//
//    {To debug only
//    if (sRObject = EmptyStr) then begin
//      Finalize(aOcc_Open_Brk);
//      Exit;
//    end
//    else begin
//      ShowMessage(sRObject);
//      Finalize(aOcc_Open);
//      Exit;
//    end;
//    }
//
//    pGetPackage;
//
//    {To debug only
//    if (sRPackage = EmptyStr) then
//      ShowMessage(sRObject)
//    else
//      ShowMessage(sRPackage +
//                  ':::' +
//                  sRObject);
//
//    Finalize(aOcc_Open_Brk); Exit;
//    }
//
//    pGetClassFor;
//
//    {To debug only
//    ShowMessage(sRObject +
//                '|' +
//                sRPackage +
//                '|' +
//                sRClassFor);
//    //Finalize(aOcc_Open_Brk); Exit;
//    }
//
//    {
//    // It is necessary to workaround some cases (fails)
//    if (sRClassFor <> EmptyStr) then begin
//      i:= fGetPosMatchingForward(sRClassFor,
//                                 '(',
//                                 ')');
//
//      j:= GetPosMatchingForward(sRClassFor,
//                                 '[',
//                                 ']');
//      if (i <> 0) and
//         (i > j) then
//        Delete(sRClassFor,
//               i + 1,
//               length(sRClassFor));
//    end;
//    }
//
//    if (sRClassFor <> EmptyStr) then
//      sRClassFor:= StringReplace(sRClassFor,
//                                 '''',
//                                 '"',
//                                 [rfReplaceAll]);  // Avoid problem with 'argumet', for example
//                                                   //read.table(file='test',
//
//    try
//      pGetTipFrom_TCPIP(sRClassFor);
//    finally
//      //TODO
//    end;
//  end;
//
//  {To debug only
//  ShowMessage('OBJ=' +
//              sRObject +
//              #10#13 +
//              'PKG=' +
//              sRPackage +
//              #10#13 +
//              'CLF=' +
//              sClassfor);
//  }
//end;

end.
