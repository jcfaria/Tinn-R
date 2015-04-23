{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: dlgConfirmReplace.dpr, released 2000-06-23.

The Original Code is part of the SearchReplaceDemo project, written by
Michael Hieke for the SynEdit component suite.
All Rights Reserved.

Contributors to the SynEdit project are listed in the Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: dlgConfirmReplace.pas,v 1.3 2004/03/12 18:46:56 rmay Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}

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

unit ufrmConfirmReplace;

{$I SynEdit.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmConfirmReplaceDialog = class(TForm)
    btnCancel: TButton;
    btnReplace: TButton;
    btnReplaceAll: TButton;
    btnSkip: TButton;
    Image1: TImage;
    lblConfirmation: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  public
    //procedure PrepareShow(AEditorRect: TRect; iX, iY1, iY2: integer; sReplaceText: string);
    procedure PrepareShow(AEditorRect: TRect; iX, iY: integer; sReplaceText: string);
  end;

var
  frmConfirmReplaceDialog: TfrmConfirmReplaceDialog;

implementation

uses ufrmMain;

{$R *.DFM}

resourcestring
  rsReplace = 'Replace: %s';

{ TConfirmReplaceDialog }

procedure TfrmConfirmReplaceDialog.FormCreate(Sender: TObject);
begin
  Image1.Picture.Icon.Handle:= LoadIcon(0,
                                        IDI_QUESTION);
end;

procedure TfrmConfirmReplaceDialog.FormDestroy(Sender: TObject);
begin
  frmConfirmReplaceDialog:= nil;
end;

procedure TfrmConfirmReplaceDialog.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= (frmTinnMain.iAlphaBlendValue * 7) Div 10;  // I want 30% more transparency!
end;

{
procedure TfrmConfirmReplaceDialog.PrepareShow(AEditorRect: TRect;
                                               iX,
                                                iY1,
                                                iY2: integer;
                                               sReplaceText: string);
var
  iW,
   iH: integer;

begin
  lblConfirmation.Caption:= Format(rsReplace,
                                   [sReplaceText]);

  iW:= AEditorRect.Right  -
       AEditorRect.Left;

  iH:= AEditorRect.Bottom -
       AEditorRect.Top;

  if (iW <= Width) then iX:= AEditorRect.Left - (Width - iW) div 2
                   else if (iX + Width > AEditorRect.Right) then iX:= AEditorRect.Right - Width;

  if (iY2 > AEditorRect.Top + MulDiv(iH, 2, 3)) then iY2:= iY1 - Height - 4
                                                else Inc(iY2,
                                                         4);

  SetBounds(iX,
            iY2,
            Width,
            Height);
end;
}

procedure TfrmConfirmReplaceDialog.PrepareShow(AEditorRect: TRect;
                                               iX,
                                                iY: integer;
                                               sReplaceText: string);
begin
  lblConfirmation.Caption:= Format(rsReplace,
                                   [sReplaceText]);

  SetBounds(AEditorRect.Right - Width - $10,
            AEditorRect.Top,
            Width,
            Height);
end;

end.

