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

unit ufrmReplace_Dlg;

{$I SynEdit.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ufrmSearch_Dlg;

type
  TfrmReplace_Dlg = class(TfrmSearch_Dlg)
    cbReplaceText: TComboBox;
    Label2: TLabel;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);

  private
    function GetReplaceText: string;
    function GetReplaceTextHistory: string;
    procedure SetReplaceText(sValue: string);
    procedure SetReplaceTextHistory(sValue: string);

  public
    property ReplaceText: string read GetReplaceText write SetReplaceText;
    property ReplaceTextHistory: string read GetReplaceTextHistory write SetReplaceTextHistory;
  end;

implementation

uses ufrmMain;

{$R *.DFM}

{ TTextReplaceDialog }

procedure TfrmReplace_Dlg.FormShow(Sender: TObject);
begin
  inherited;

  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

function TfrmReplace_Dlg.GetReplaceText: string;
begin
  Result:= cbReplaceText.Text;
end;

function TfrmReplace_Dlg.GetReplaceTextHistory: string;
var
  i: integer;

begin
  Result:= '';

  for i:= 0 to (cbReplaceText.Items.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;

    Result:= Result + cbReplaceText.Items[i];
  end;
end;

procedure TfrmReplace_Dlg.SetReplaceText(sValue: string);
begin
  cbReplaceText.Text:= sValue;
end;

procedure TfrmReplace_Dlg.SetReplaceTextHistory(sValue: string);
begin
  cbReplaceText.Items.Text:= sValue;
end;

procedure TfrmReplace_Dlg.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
var
  i    : integer;
  sTemp: string;

begin
  inherited;
  if (ModalResult = mrOK) then begin
    sTemp:= cbReplaceText.Text;

    if (sTemp <> '') then begin
      i:= cbReplaceText.Items.IndexOf(sTemp);

      if (i > -1) then begin
        cbReplaceText.Items.Delete(i);

        cbReplaceText.Items.Insert(0,
                                   sTemp);

        cbReplaceText.Text:= sTemp;
      end
      else cbReplaceText.Items.Insert(0,
                                      sTemp);
    end;
  end;
end;

end.

