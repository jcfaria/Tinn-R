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

unit ufrmSearchText;

{$I SynEdit.inc}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfrmSearchDialog = class(TForm)
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
    function GetSearchBackwards: boolean;
    function GetSearchCaseSensitive: boolean;
    function GetSearchFromCursor: boolean;
    function GetSearchInSelection: boolean;
    function GetSearchRegularExpression: boolean;
    function GetSearchText: string;
    function GetSearchTextHistory: string;
    function GetSearchWholeWords: boolean;
    procedure SetSearchBackwards(bValue: boolean);
    procedure SetSearchCaseSensitive(bValue: boolean);
    procedure SetSearchFromCursor(bValue: boolean);
    procedure SetSearchInSelection(bValue: boolean);
    procedure SetSearchRegularExpression(const bValue: boolean);
    procedure SetSearchText(sValue: string);
    procedure SetSearchTextHistory(sValue: string);
    procedure SetSearchWholeWords(bValue: boolean);

  public
    property SearchBackwards: boolean         read GetSearchBackwards         write SetSearchBackwards;
    property SearchCaseSensitive: boolean     read GetSearchCaseSensitive     write SetSearchCaseSensitive;
    property SearchFromCursor: boolean        read GetSearchFromCursor        write SetSearchFromCursor;
    property SearchInSelectionOnly: boolean   read GetSearchInSelection       write SetSearchInSelection;
    property SearchRegularExpression: boolean read GetSearchRegularExpression write SetSearchRegularExpression;
    property SearchText: string               read GetSearchText              write SetSearchText;
    property SearchTextHistory: string        read GetSearchTextHistory       write SetSearchTextHistory;
    property SearchWholeWords: boolean        read GetSearchWholeWords        write SetSearchWholeWords;
  end;

implementation

uses ufrmMain;

{$R *.DFM}

{TTextSearchDialog}

function TfrmSearchDialog.GetSearchBackwards: boolean;
begin
  Result:= (rgSearchDirection.ItemIndex = 1);
end;

procedure TfrmSearchDialog.SetSearchBackwards(bValue: boolean);
begin
  rgSearchDirection.ItemIndex:= Ord(bValue);
end;

function TfrmSearchDialog.GetSearchCaseSensitive: boolean;
begin
  Result:= cbSearchCaseSensitive.Checked;
end;

procedure TfrmSearchDialog.SetSearchCaseSensitive(bValue: boolean);
begin
  cbSearchCaseSensitive.Checked:= bValue;
end;

function TfrmSearchDialog.GetSearchFromCursor: boolean;
begin
  Result:= (rgSearchOrigin.ItemIndex = 1);
end;

procedure TfrmSearchDialog.SetSearchFromCursor(bValue: boolean);
begin
  if bValue then rgSearchOrigin.ItemIndex:= 1
            else rgSearchOrigin.ItemIndex:= 0;
end;

function TfrmSearchDialog.GetSearchInSelection: boolean;
begin
  Result:= (rgSearchScope.ItemIndex = 1);
end;

procedure TfrmSearchDialog.SetSearchInSelection(bValue: boolean);
begin
  if not bValue then rgSearchScope.ItemIndex:= 0
                else rgSearchScope.ItemIndex:= 1;
end;

function TfrmSearchDialog.GetSearchRegularExpression: boolean;
begin
  Result:= cbRegularExpression.Checked;
end;

procedure TfrmSearchDialog.SetSearchRegularExpression(const bValue: boolean);
begin
  cbRegularExpression.Checked:= bValue;
end;

function TfrmSearchDialog.GetSearchText: string;
begin
  Result:= cbSearchText.Text;
end;

procedure TfrmSearchDialog.SetSearchText(sValue: string);
begin
  cbSearchText.Text:= sValue;
end;

function TfrmSearchDialog.GetSearchTextHistory: string;
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

procedure TfrmSearchDialog.SetSearchTextHistory(sValue: string);
begin
  cbSearchText.Items.Text:= sValue;
end;

function TfrmSearchDialog.GetSearchWholeWords: boolean;
begin
  Result:= cbSearchWholeWords.Checked;
end;

procedure TfrmSearchDialog.SetSearchWholeWords(bValue: boolean);
begin
  cbSearchWholeWords.Checked:= bValue;
end;

{ event handlers }
procedure TfrmSearchDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TfrmSearchDialog.FormShow(Sender: TObject);
begin
  cbSearchText.SetFocus;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmSearchDialog.rgSearchScopeClick(Sender: TObject);
begin
  if (rgSearchScope.ItemIndex = 0) then rgSearchOrigin.Enabled:= True
  else begin
    rgSearchOrigin.Enabled  := False;
    rgSearchOrigin.ItemIndex:= 0;
  end;
end;

end.
