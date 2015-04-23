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

unit ufrmCount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, StdCtrls, Buttons;

type
  TfrmCount = class(TForm)
    bbtOK: TBitBtn;
    GroupBox1: TGroupBox;
    rdgCount: TRadioGroup;
    strGrid: TStringGrid;

    procedure FormShow(Sender: TObject);
    procedure strGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCount: TfrmCount;

implementation

uses ufrmMain;

{$R *.dfm}


// adapted by jcfaria from http://www.swissdelphicenter.ch/torry/showcode.php?id=422
procedure TfrmCount.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmCount.strGridDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);

  procedure WriteText(StringGrid: TStringGrid; ACanvas: TCanvas; const ARect: TRect; const Text: string; Format: Word);
  const
    iX = 2;
    iY = 2;
  var
    cTemp: array[0..255] of Char;

  begin
    with Stringgrid, ACanvas, ARect do
    begin
      case Format of
        DT_LEFT: ExtTextOut(Handle, Left + iX, Top + iY,
                 ETO_OPAQUE or ETO_CLIPPED, @ARect, StrPCopy(cTemp, Text), Length(Text), nil);

        DT_RIGHT: ExtTextOut(Handle, Right - TextWidth(Text) - 3, Top + iY,
                  ETO_OPAQUE or ETO_CLIPPED, @ARect, StrPCopy(cTemp, Text),
                  Length(Text), nil);

        DT_CENTER: ExtTextOut(Handle, Left + (Right - Left - TextWidth(Text)) div 2,
                   Top + iY, ETO_OPAQUE or ETO_CLIPPED, @ARect,
                   StrPCopy(cTemp, Text), Length(Text), nil);
      end;
    end;
  end;

  procedure Display(StringGrid: TStringGrid; const S: string; Alignment: TAlignment);
  const
    Formats: array[TAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);

  begin
    WriteText(StringGrid, StringGrid.Canvas, Rect, S, Formats[Alignment]);
  end;

begin
  if (ACol = 1) then Display(strGrid, strGrid.Cells[ACol, ARow], taRightJustify);
  // Right-justify columns 0-2
  //if ACol in [0..2] then Display(strGrid, strGrid.Cells[ACol, ARow], taRightJustify);
  // Center the first row
  //if ARow = 0 then Display(strGrid, strGrid.Cells[ACol, ARow], taCenter)
end;

end.
