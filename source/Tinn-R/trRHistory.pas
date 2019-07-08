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
 Class    : TRHistory
 Objective: To control the R history working with Rterm
 Version  : v2.0
 Author   : José Cláudio Faria/UESC/DCET/Brasil (joseclaudio.faria@gmail.com)
 Date     : jun/2016
*)

unit trRHistory;

interface

uses
  Classes, SysUtils, Windows, Messages, Controls, ExtCtrls;

type
  TRHistory = class

  protected
    aRHistory: array[0..99] of string;  // it will remember the last 100 instructions sended
    iCur: integer;
    sLatest: string;

    function fGetEmpty: integer;
    function fGetFirstNoEmpty(sDirection: string): integer;
    procedure pRestructure;
    procedure pReorder(iPos, iEmpty: integer; sInstruction: string);


  public
    Itens: TStringList;

    constructor Create;
    destructor Free;

    function fGetNext: string;
    function fGetPrior: string;
    function fLoadFromFile(sPath: string): boolean;
    function fSaveToFile(sPath: string): boolean;

    procedure Add(sInstruction: string);
  end;

implementation

constructor TRHistory.Create;
begin
  Itens := TStringList.Create();
  Itens.CaseSensitive := False;
  Itens.Duplicates := dupIgnore;
  Itens.Sorted := True;
end;

destructor TRHistory.Free;
begin
end;

procedure TRHistory.Add(sInstruction: string);
var
  i,
   iPos: integer;

begin
  iCur:= fGetEmpty;

  iPos:= -1;
  // Try to find a prior occurence of sInstruction in the array aRHistory
  for i:= 0 to 99 do begin
    if (aRHistory[i] = sInstruction) then begin
      iPos:= i;
      Break;
    end;
  end;

  if (iPos <> -1) then
  begin  // It was found a prior occurence of sInstruction in the array aRHistory
    if (iPos < (iCur -1)) then pReorder(iPos, iCur, sInstruction);  // It will reorder the array aRHistory
    sLatest:= 'Reorder';
    Exit;
  end;

  sLatest:= 'Add';

  aRHistory[iCur]:= sInstruction;

  Itens.Add(sInstruction);
end;

// It will reorder the array aRHistory
procedure TRHistory.pReorder(iPos, iEmpty: integer; sInstruction: string);
var
  i: integer;

begin
  for i:= iPos to (iEmpty-2) do
    aRHistory[i]:= aRHistory[i + 1];

  aRHistory[iEmpty-1]:= sInstruction;
end;

procedure TRHistory.pRestructure;
var
  i: integer;

begin
  for i:= 0 to 98 do
    aRHistory[i]:= aRHistory[i + 1];

  aRHistory[99]:= '';
end;

function TRHistory.fGetEmpty: integer;
var
  i: integer;

begin
  Result:= -1;
  for i:= 0 to 99 do begin
    if (aRHistory[i] = '') then begin
      Result:= i;
      Break;
    end;
  end;
  if (Result = -1) then begin
    pRestructure;
    Result:= 99;
  end;
end;

function TRHistory.fGetFirstNoEmpty(sDirection: string): integer;
var
  i: integer;

begin
  Result:= -1;
  if (sDirection = 'Prior') then begin
    for i := 99 downto 0 do
      if (aRHistory[i] <> '') then begin
        Result:= i;
        break;
      end;
  end
  else
    for i := 0 to 99 do
      if (aRHistory[i] <> '') then begin
        Result:= i;
        break;
      end;
end;

function TRHistory.fGetPrior: string;
begin
  if (sLatest <> 'Add') then iCur:= iCur - 1;

  if (iCur = -1) then iCur:= fGetFirstNoEmpty('Prior');

  if (iCur < 0) then Exit;

  if (iCur = 0) then begin
    Windows.Beep(500, 800);
    Sleep(100);
  end;

  sLatest:= 'Prior';

  Result := aRHistory[iCur];
end;

function TRHistory.fGetNext: string;
begin
  case iCur of
    0..98: iCur:= iCur + 1;
       99: iCur:= 0;
  end;

  if aRHistory[iCur] = '' then iCur:= fGetFirstNoEmpty('Next');

  if (iCur < 0) then Exit;

  if (iCur = 0) then begin
    Windows.Beep(500,800);
    Sleep(100);
  end;
  
  sLatest:= 'Next';

  Result:= aRHistory[iCur];
end;

function TRHistory.fSaveToFile(sPath: string): boolean;
var
  tfTmp: TextFile;

  i: integer;

begin
  try
    AssignFile(tfTmp,
               sPath);
    ReWrite(tfTmp);
    for i:= 0 to 99 do begin
      if (aRHistory[i] <> '') then
        WriteLn(tfTmp,
                aRHistory[i]);
    end;
    Flush(tfTmp);
    CloseFile(tfTmp);
    Result:= True;
  except
    raise;
    Exit;
  end;
end;

function TRHistory.fLoadFromFile(sPath: string): boolean;
var
  tfTmp: TextFile;

  sTmp: string;

begin
  try
    AssignFile(tfTmp,
               sPath);
    Reset(tfTmp);
    while not EOF(tfTmp) do begin
      ReadLn(tfTmp,
             sTmp);
      Add(sTmp);
    end;
    CloseFile(tfTmp);
    Result:= True;
  except
    raise;
    Exit;
  end;
end;

end.
