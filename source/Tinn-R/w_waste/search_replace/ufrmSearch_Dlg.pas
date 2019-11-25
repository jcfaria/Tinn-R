{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: dlgSearchText.pas, released 2000-06-23.

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

$Id: dlgSearchText.pas,v 1.3 2003/07/10 22:11:10 rmay Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

-------------------------------------------------------------------------------}
(*
 The original code of this unit was made by SynEdit Team and was modified under
 the GPL by José Cláudio Faria
*)

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

unit ufrmSearch_Dlg;

{$I SynEdit.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmSearch_Dlg = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    cbRegularExpression: TCheckBox;
    cbSearchCaseSensitive: TCheckBox;
    cbSearchText: TComboBox;
    cbSearchWholeWords: TCheckBox;
    gbSearchOptions: TGroupBox;
    Label1: TLabel;
    rgSearchDirection: TRadioGroup;
    rgSearchOrigin: TRadioGroup;
    rgSearchScope: TRadioGroup;

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure rgSearchScopeClick(Sender: TObject);

  private
    function fGetSearchBackwards: boolean;
    function fGetSearchCaseSensitive: boolean;
    function fGetSearchFromCursor: boolean;
    function fGetSearchInSelection: boolean;
    function fGetSearchRegularExpression: boolean;
    function fGetSearchText: string;
    function fGetSearchTextHistory: string;
    function fGetSearchWholeWords: boolean;
    procedure pSetSearchBackwards(bValue: boolean);
    procedure pSetSearchCaseSensitive(bValue: boolean);
    procedure pSetSearchFromCursor(bValue: boolean);
    procedure pSetSearchInSelection(bValue: boolean);
    procedure pSetSearchRegularExpression(const bValue: boolean);
    procedure pSetSearchText(sValue: string);
    procedure pSetSearchTextHistory(sValue: string);
    procedure pSetSearchWholeWords(bValue: boolean);

  public
    property SearchBackwards: boolean         read fGetSearchBackwards         write pSetSearchBackwards;
    property SearchCaseSensitive: boolean     read fGetSearchCaseSensitive     write pSetSearchCaseSensitive;
    property SearchFromCursor: boolean        read fGetSearchFromCursor        write pSetSearchFromCursor;
    property SearchInSelectionOnly: boolean   read fGetSearchInSelection       write pSetSearchInSelection;
    property SearchRegularExpression: boolean read fGetSearchRegularExpression write pSetSearchRegularExpression;
    property SearchText: string               read fGetSearchText              write pSetSearchText;
    property SearchTextHistory: string        read fGetSearchTextHistory       write pSetSearchTextHistory;
    property SearchWholeWords: boolean        read fGetSearchWholeWords        write pSetSearchWholeWords;
  end;

implementation

uses ufrmMain;

{$R *.DFM}

{TTextSearchDialog}

function TfrmSearch_Dlg.fGetSearchBackwards: boolean;
begin
  Result:= (rgSearchDirection.ItemIndex = 1);
end;

procedure TfrmSearch_Dlg.pSetSearchBackwards(bValue: boolean);
begin
  rgSearchDirection.ItemIndex:= Ord(bValue);
end;

function TfrmSearch_Dlg.fGetSearchCaseSensitive: boolean;
begin
  Result:= cbSearchCaseSensitive.Checked;
end;

procedure TfrmSearch_Dlg.pSetSearchCaseSensitive(bValue: boolean);
begin
  cbSearchCaseSensitive.Checked:= bValue;
end;

function TfrmSearch_Dlg.fGetSearchFromCursor: boolean;
begin
  Result:= (rgSearchOrigin.ItemIndex = 1);
end;

procedure TfrmSearch_Dlg.pSetSearchFromCursor(bValue: boolean);
begin
  if bValue then rgSearchOrigin.ItemIndex:= 1
            else rgSearchOrigin.ItemIndex:= 0;
end;

function TfrmSearch_Dlg.fGetSearchInSelection: boolean;
begin
  Result:= (rgSearchScope.ItemIndex = 1);
end;

procedure TfrmSearch_Dlg.pSetSearchInSelection(bValue: boolean);
begin
  if not bValue then rgSearchScope.ItemIndex:= 0
                else rgSearchScope.ItemIndex:= 1;
end;

function TfrmSearch_Dlg.fGetSearchRegularExpression: boolean;
begin
  Result:= cbRegularExpression.Checked;
end;

procedure TfrmSearch_Dlg.pSetSearchRegularExpression(const bValue: boolean);
begin
  cbRegularExpression.Checked:= bValue;
end;

function TfrmSearch_Dlg.fGetSearchText: string;
begin
  Result:= cbSearchText.Text;
end;

procedure TfrmSearch_Dlg.pSetSearchText(sValue: string);
begin
  cbSearchText.Text:= sValue;
end;

function TfrmSearch_Dlg.fGetSearchTextHistory: string;
var
  i: integer;

begin
  Result:= '';
  for i:= 0 to (cbSearchText.Items.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result + #13#10;
    Result:= Result + cbSearchText.Items[i];
  end;
end;

procedure TfrmSearch_Dlg.pSetSearchTextHistory(sValue: string);
begin
  cbSearchText.Items.Text:= sValue;
end;

function TfrmSearch_Dlg.fGetSearchWholeWords: boolean;
begin
  Result:= cbSearchWholeWords.Checked;
end;

procedure TfrmSearch_Dlg.pSetSearchWholeWords(bValue: boolean);
begin
  cbSearchWholeWords.Checked:= bValue;
end;

{ event handlers }
procedure TfrmSearch_Dlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  sTmp: string;
  i   : integer;

begin
  if (ModalResult = mrOK) and
     (cbSearchText.Text = '') then begin
    MessageDlg('No valid argument to search!',
               mtWarning, [MBOK], 0);
    Canclose:= False;
    Exit;
  end
  else CanClose:= True;

  sTmp:= cbSearchText.Text;
  if (ModalResult = mrOK) and
     (sTmp <> '') then begin
    i:= cbSearchText.Items.IndexOf(sTmp);
    if (i > -1) then begin
      cbSearchText.Items.Delete(i);
      cbSearchText.Items.Insert(0, sTmp);
      cbSearchText.Text:= sTmp;
    end
    else cbSearchText.Items.Insert(0, sTmp);
  end;
end;

procedure TfrmSearch_Dlg.FormShow(Sender: TObject);
begin
  cbSearchText.SetFocus;

  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmSearch_Dlg.rgSearchScopeClick(Sender: TObject);
begin
  if (rgSearchScope.ItemIndex = 0) then rgSearchOrigin.Enabled:= True
  else begin
    rgSearchOrigin.Enabled  := False;
    rgSearchOrigin.ItemIndex:= 0;
  end;
end;

end.
