(*
 The original code of this unit was made by ... and was modified under
 the GPL by José Cláudio Faria
*) 

(*
 Tinn is a ASCII file editor primarily intended as a better replacement
 of the default Notepad.exe under Windows.

 The contents of this file are subject to the terms and conditions found under
 the GNU General Public License Version 2 or later (the "GPL").
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
  Tinn-R team April/2005

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

unit clMultiStream;

interface

uses
  Classes;

type
  TMultiStream = class(TStream)
  private
    FPosition: Integer;
    FList: TList;
    function GetStream(Index: Integer): TStream;
    function GetTotalSize: Longint;
  protected
    procedure SetSize(NewSize: Longint); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddStream(AStream: TStream);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

implementation

{ TMultiStream }
procedure TMultiStream.AddStream(AStream: TStream);
begin
  FList.Add(AStream);
end;

constructor TMultiStream.Create;
begin
  inherited Create();
  FList:= TList.Create();
  FPosition:= 0;
end;

destructor TMultiStream.Destroy;
// JCFaria
{
var
  i: Integer;
}

begin
// JCFaria
{
  for i:= FList.Count - 1 downto 0 do
    GetStream(i).Free();
}
  FList.Free();
  inherited Destroy();
end;

function TMultiStream.GetStream(Index: Integer): TStream;
begin
  Result:= TStream(FList[Index]);
end;

function TMultiStream.GetTotalSize: Longint;
var
  i: Integer;

begin
  Result:= 0;
  for i:= 0 to FList.Count - 1 do
  begin
    Result:= Result + GetStream(i).Size;
  end;
end;

function TMultiStream.Read(var Buffer; Count: Integer): Longint;
var
  i          : Integer;
  buf_pos    : PChar;
  len,
    bytesRead: Longint;

begin
  len:= 0;
  Result:= 0;
  buf_pos:= PChar(@Buffer);
  for i:= 0 to FList.Count - 1 do begin
    if (FPosition < (len + GetStream(i).Size)) then begin
      GetStream(i).Position := FPosition - len;
      bytesRead := GetStream(i).Read(buf_pos^, Count);
      Inc(Result, bytesRead);
      buf_pos := buf_pos + bytesRead;
      Inc(FPosition, bytesRead);
      if (bytesRead < Count) then Dec(Count, bytesRead)
                             else break;
    end;
    Inc(len, GetStream(i).Size);
  end;
end;

function TMultiStream.Seek(Offset: Integer; Origin: Word): Longint;
var
  len: Integer;

begin
  len:= GetTotalSize();
  case Origin of
    soFromBeginning: FPosition:= Offset;
    soFromCurrent: FPosition  := FPosition + Offset;
    soFromEnd: FPosition      := len - Offset;
  end;
  if (FPosition > len) then FPosition:= len
  else
    if (FPosition < 0) then FPosition:= 0;
  Result:= FPosition;
end;

procedure TMultiStream.SetSize(NewSize: Integer);
begin
end;

function TMultiStream.Write(const Buffer; Count: Integer): Longint;
begin
  Result:= 0;
end;

end.
