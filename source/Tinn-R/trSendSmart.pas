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

(*
 Class    : TRSend_Smart
 Objective: To send find an entire block of coomplex instructions to R in complex context
            (functions, first intruction out of correct order, etc)
 Version  : v1.0
 Author   : José Cláudio Faria/UESC/DCET/Brasil (joseclaudio.faria@gmail.com)
 Date     : nov/2018
*)

unit trSendSmart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Menus, Clipbrd, ShellCtrls, PerlRegEx,

  SynEdit, SynRegExpr, SynEditHighlighter,
  SynHighlighterMulti, SynEditTypes, SynEditRegExSearch,
  SynEditMiscClasses, SynEditSearch, SynExportTeX, SynExportRTF,
  SynEditExport, SynExportHTML, SynCompletionProposal,
  SynHighlighterURI, SynUnicode, SynEditTextBuffer, SynEditKeyCmds,

  trRUtils;

type
  TRSend_Smart = class

  protected
    iOpenBrk_CaretY: integer;
    iCloseBrk_CaretY: integer;
    iCur_CaretY: integer;
    sLocLine: string;
    iTopLine: integer;
    bcPos: TBufferCoord;
    iOpenBrk: integer;
    iCloseBrk: integer;
    iCaretX: integer;

    function fFirst_ValidLine_Above_End_With_Coma: boolean;
    function fBrackets_Check: boolean;
    function fComma_Begin_or_End_Occur(sLocLine: string): boolean;
    //function fClear_Comment(sLocLine: string): string;
    function fBlank_Line(sLocLine: string): boolean;
    function fSanitize_Line(sTmp: string): string;
    function fCommented_Line(sTmp: string): boolean;

    procedure pDoPrepare;
    procedure pDoFinalize;

  private
    seEditor: TSynEdit;

  public
    constructor Create;
    destructor Free;
    function fIsSmart_Context(ruTmp: TR_Useful): boolean;
    function fGetSmart_Block(var iBegin, iEnd, iLen: integer): boolean;

    procedure pSet_Editor(seTmp: TSynEdit);
  end;

implementation

uses
  trUtils;

constructor TRSend_Smart.Create;
begin
end;

destructor TRSend_Smart.Free;
begin
end;

function TRSend_Smart.fFirst_ValidLine_Above_End_With_Coma: boolean;
var
  sLocLine: string;

  i: integer;

begin
  Result:= False;

  i:= 0;
  with seEditor do begin
    ExecuteCommand(ecUp,
                   #0,
                   nil);
    repeat
      sLocLine:= Trim(LineText);

      if (fReGeX(sLocLine,
                 ',$',
                 False) <> EmptyStr) then begin
        Result:= True;
        Exit;
      end;

      ExecuteCommand(ecUp,
                     #0,
                     nil);
      Inc(i);

    until (i = 10) or
          (CaretY = 0);
  end;
end;

function TRSend_Smart.fGetSmart_Block(var iBegin,
                                          iEnd,
                                          iLen: integer): boolean;
var
  sLocLine: string;

  i,
   j: integer;

  bcBegin,
    bcEnd: TBufferCoord;

begin
  Result:= False;

  with seEditor do begin
    CaretX:= 0;
    CaretY:= iOpenBrk_CaretY;

    sLocLine:= Trim(fSanitize_Line(LineText));

    i:= 1;
    j:= Length(sLocLine);
    repeat
      ExecuteCommand(ecRight,
                     #0,
                     nil);

      if (sLocLine[i] = '(') then begin
        CaretX:= i;
        bcBegin:= BlockBegin;

        ExecuteCommand(ecMatchBracket,
                       #0,
                       nil);
        bcEnd:= CaretXY;

        BlockBegin:= bcBegin;
        BlockEnd:= bcEnd;

        if SelAvail then begin
          iBegin:= BlockBegin.Line;
          iEnd  := BlockEnd.Line;
          iLen  := BlockEnd.Char;

          Result:= True;
          Exit;
        end;
      end;
      Inc(i)
    until (i = j);
  end;
end;

//function TRSend_Smart.fClear_Comment(sLocLine: string): string;
//var
//  iPos: integer;
//
//begin
//  iPos:= Pos('#',
//             sLocLine);
//
//  if (iPos <> 0) then
//    sLocLine:= Copy(sLocLine,
//                    1,
//                    iPos - 1);
//
//  sLocLine:= Trim(sLocLine);
//  Result:= sLocLine;
//end;

function TRSend_Smart.fComma_Begin_or_End_Occur(sLocLine: string): boolean;
begin
  Result:= False;

  if (fReGeX(sLocLine,
             ',$',
             False) <> EmptyStr) or
     (fReGeX(sLocLine,
             '^,',
             False) <> EmptyStr) then
    Result:= True;
end;

function TRSend_Smart.fBlank_Line(sLocLine: string): boolean;
begin
  if (sLocLine = EmptyStr) then
    Result:= True
  else
    Result:= False;
end;

function TRSend_Smart.fSanitize_Line(sTmp: string): string;
begin
  Result:= sTmp;

  //https://regex101.com/r/pyMojZ/4
  //$re = '/(?<=.)#.*/';
  //$str = '#! Um caso simples, mas alterando a posição da vírgula
  //#sd(rnorm(1e3,
  //#         m=10           #!?        2 (acima)
  //#         ,sd=2)
  //#)
  //                         #!?       2 (acima
  //sd(rnorm(1e3,
  //         m=10            #!?       2 (acima)
  //         ,sd=2           #!?       2
  //)
  //)
  //#   XXX_ZZZ #(~´[+%@¨\\|
  //#
  //v1 <- sd(rnorm(1e3       #!?
  //               ,m=10     #!?      2
  //               ,sd=2))
  //
  //v1 <- sd(rnorm(1e1       #!?
  //               ,m=10     #!?      2
  //                         #!?      2 (acima)
  //               ,sd=2)
  //)';
  //
  //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
  //
  //// Print the entire match result
  //var_dump($matches);

  // Existe caracter de comentário no meio de uma linha válida
  if (fRegEx(sTmp,
             '(?<=.)#.*',
             False) <> EmptyStr) then
    Result:= fRegEx(sTmp,
                    '(?<=.)#.*',
                    True)
end;


function TRSend_Smart.fCommented_Line(sTmp: string): boolean;
begin
  Result:= False;

  // Linha começa cm comentário
  if (fRegEx(Trim(sTmp),
             '^#',
             False) <> EmptyStr) then
    Result:= True;
end;

// if (iCloseBrk > iOpenBrk)
function TRSend_Smart.fBrackets_Check: boolean;
var
  i,
   iOpenBrk,
   iCloseBrk: integer;

  sLocLine: string;

  bComma_Begin_or_End_Occur_Prior: boolean;

begin
  Result:= False;

  with seEditor do begin
    i:= 0;
    iOpenBrk:= 0;
    iCloseBrk:= 0;
    bComma_Begin_or_End_Occur_Prior:= False;

    repeat
      // Not consider commented or
      // blank lines
      while fCommented_Line(Trim(LineText)) or
            fBlank_Line(Trim(LineText)) do
        if (CaretY > 1) then
          ExecuteCommand(ecUp,
                         #0,
                         nil)
        else
          Exit;

      sLocLine:= Trim(fSanitize_Line(LineText));

      iOpenBrk:= iOpenBrk +
                 fCount_Char(sLocLine,
                             '(');

      iCloseBrk:= iCloseBrk +
                  fCount_Char(sLocLine,
                              ')');

      // Main decision block
      // An algorithm not very easy to build!
      // In the future it will be better to couple a specialist system
      // that the set of rules can be improved by the user, according to their programming habits.
      if (iOpenBrk >= iCloseBrk) then begin
        if (iCloseBrk > 0) then begin
          if fComma_Begin_or_End_Occur(sLocLine) then begin
            iOpenBrk_CaretY:= CaretY;
            Result:= True;
            Exit;
          end
          else begin
            if bComma_Begin_or_End_Occur_Prior then begin
              iOpenBrk_CaretY:= CaretY;
              Result:= True;
              Exit;
            end;
          end;
        end  // (iCloseBrk > 0)
        else begin  // (iCloseBrk = 0)
          if (iOpenBrk > iCloseBrk) then begin
            iOpenBrk_CaretY:= CaretY;
            Result:= True;
            Exit;
          end;
        end;
      end;  // (iOpenBrk >= iCloseBrk)

      // It is necessary to control of comma in prior line, due to habit of some useres
      // for example:
      // sd(rnorm(1e3
      //      |   ,m=10))
      bComma_Begin_or_End_Occur_Prior:= fComma_Begin_or_End_Occur(sLocLine);

      Inc(i);
      ExecuteCommand(ecUp,
                     #0,
                     nil);

    until (i = 40);  // 40 is the number of lines limit to search above the CaretY of the line sent.
                     // It also circumvents possible situations not provided for the algorithm in big files.
                     // It is the max visible lines of Tinn-R using my second monitor. ;)
  end;
end;

procedure TRSend_Smart.pDoPrepare;
begin
  with seEditor do begin
    iTopLine:= TopLine;
    bcPos   := CaretXY;

    iOpenBrk := 0;       // It stores the number of char '('
    iCloseBrk:= 0;       // It stores the number of char ')'

    iCaretX:= CaretX;     // It stores CaretX in the first call. It is useful to this cases: sd(|), lm(|)

    BeginUpdate;         // To freeze the editor
  end;
end;

procedure TRSend_Smart.pDoFinalize;
begin
  with seEditor do begin
    TopLine:= iTopLine;
    CaretXY:= bcPos;
    EndUpdate;
  end;
end;

procedure TRSend_Smart.pSet_Editor(seTmp: TSynEdit);
begin
  seEditor:= seTmp;
  //ShowMessage(seEditor.Lines.Text);
end;

function TRSend_Smart.fIsSmart_Context(ruTmp: TR_Useful): boolean;
begin //function fIsSmart_Context: boolean;
  Result:= False;

  pDoPrepare;
    if fBrackets_Check then Result:= True;
//    Result:= ruTmp.bIncomplete;
  pDoFinalize;
end;

end.
