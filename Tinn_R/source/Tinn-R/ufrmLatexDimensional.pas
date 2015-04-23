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

unit ufrmLatexDimensional;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmLatexDimensional = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    edCols: TEdit;
    edRows: TEdit;
    gpbDimension: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    rdgAlign: TRadioGroup;
    rdgType: TRadioGroup;

    procedure FormShow(Sender: TObject);
    procedure rdgTypeClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLatexDimensional: TfrmLatexDimensional;

implementation

uses ufrmMain;

{$R *.dfm}

procedure TfrmLatexDimensional.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmLatexDimensional.rdgTypeClick(Sender: TObject);
begin
  if (rdgType.ItemIndex = 3) then begin
    with rdgAlign do begin
      Enabled  := False;
      ItemIndex:= -1;
    end;
  end
  else begin
    with rdgAlign do begin
      Enabled  := True;
      if (frmTinnMain.iLatexDimensionalAlign < 0) then ItemIndex:= 1
                                                else ItemIndex:= frmTinnMain.iLatexDimensionalAlign;
    end;
  end;
end;

end.
