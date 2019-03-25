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

unit trCodeSender;

interface

uses Classes, SysUtils, Windows, Messages;

type
  TCodeSender = class (TObject)
  protected
    constructor CreateInstance;
    class function AccessInstance(Request: Integer): TCodeSender;

  public
    constructor Create;
    destructor Destroy; override;
    class function Instance: TCodeSender;
    class procedure ReleaseInstance;

    procedure pSendString(const sValue: string; const iDelay: Integer = 0); virtual; abstract;
    procedure pSendCommand(const sValue: string; const iDelay: Integer = 0); virtual; abstract;
  end;

  TKeySender = class(TCodeSender)
  private
    FGuiCaption: string;
    FGuiHandle: Cardinal;

    procedure pSendCommand(const sValue: string; const iDelay: Integer = 0); override;
    procedure pSendEnter;
    procedure pSendPaste;

  public
    procedure pDoPrepare;
    procedure pSendChar(const sValue: string; const RHandle: HWND; const iDelay: Integer = 0);
    procedure pSendString(const sValue: string; const iDelay: Integer = 0); override;
    property pGuiCaption: string read FGuiCaption write FGuiCaption;
    property pGuiHandle: Cardinal read FGuiHandle write FGuiHandle;
  end;

var
  fCodeSender: TKeySender;

implementation

uses
  sndkey32,
  trUtils,
  ufrmMain;

{ TCodeSender }

class function TCodeSender.AccessInstance(Request: Integer): TCodeSender;
{$J+}
  const FInstance: TCodeSender = nil;
{$J-}
begin
  case Request of
    0: ;
    1: if not Assigned(FInstance) then FInstance:= CreateInstance;
    2: FInstance:= nil;
  else
    raise Exception.CreateFmt('Illegal request %d in AccessInstance',
                              [Request]);
  end;
  Result:= FInstance;
end;

constructor TCodeSender.Create;
begin
  inherited Create;
  raise Exception.CreateFmt('Access class %s through Instance only',
                            [ClassName]);
end;

constructor TCodeSender.CreateInstance;
begin
  inherited Create;
end;

destructor TCodeSender.Destroy;
begin
  if (AccessInstance(0) = Self) then AccessInstance(2);
  inherited Destroy;
end;

class function TCodeSender.Instance: TCodeSender;
begin
  Result:= AccessInstance(1);
end;

class procedure TCodeSender.ReleaseInstance;
begin
  AccessInstance(0).Free;
end;

{ TKeySender }
procedure TKeySender.pDoPrepare;
begin
  AppActivate(FGuiHandle);
  //if (GetGUIType(FGuiCaption) = gtSciViewsR) then fCodeSender.pSendString('%w1', 50);   //switch to R console window
  pSendString('^u',
              50); //Clear R line in edition
end;

procedure TKeySender.pSendCommand(const sValue: string;
                                  const iDelay: Integer = 0);
begin
  pSendString(sValue,
              iDelay);
  pSendEnter;
end;

procedure TKeySender.pSendEnter;
begin
  SendKeys('{ENTER}',
           True);
end;

procedure TKeySender.pSendPaste;
begin
  SendKeys('^v',
           True);
end;

procedure TKeySender.pSendString(const sValue: string;
                                 const iDelay: Integer = 0);
begin
  SendKeys(PChar(sValue),
           True);
  Sleep(iDelay);
end;

procedure TKeySender.pSendChar(const sValue: string;
                               const RHandle: HWND;
                               const iDelay: Integer = 0);
var
  i: integer;

begin
  pDoPrepare;
  for i:= 1 to Length(sValue) do
    PostMessage(RHandle,
                WM_CHAR,
                Ord(sValue[i]),
                0);
  pSendEnter;
  Sleep(iDelay div 4);
end;

initialization
  fCodeSender:= TKeySender.Instance as TKeySender;

end.