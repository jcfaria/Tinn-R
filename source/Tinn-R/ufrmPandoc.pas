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

unit ufrmPandoc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, EditAlign;

type
  TfrmPandoc = class(TForm)
    bbtCancel: TBitBtn;
    bbtOK: TBitBtn;
    bbtPandocRestoreDefault: TButton;
    cbPandocHistory: TComboBox;
    edFrom: TEditAlign;
    edHistoryFrom: TEditAlign;
    edHistoryTo: TEditAlign;
    edInstruction: TEditAlign;
    edTo: TEditAlign;
    gpbInstruction: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    rdgFrom: TRadioGroup;
    rdgTo: TRadioGroup;

    procedure bbtPandocRestoreDefaultClick(Sender: TObject);
    procedure cbPandocHistorySelect(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rdgFromClick(Sender: TObject);
    procedure rdgToClick(Sender: TObject);

  private
    { Private declarations }
    iToRemove: integer;

    function fCanMakeInstruction: boolean;
    function fGetPandocHistory: string;
    function fGetPandocHistoryFrom: string;
    function fGetPandocHistoryTo: string;
    procedure pMakePandocInstruction(sInstruction, sFrom, sTo: string);
    procedure pPandocDefaultInstruction(iFrom, iTo: integer);
    procedure pSetPandocHistory(sValue: string);
    procedure pSetPandocHistoryFrom(sValue: string);
    procedure pSetPandocHistoryTo(sValue: string);

  public
    { Public declarations }
    sPandocExtension  : string;
    sPandocFrom       : string;
    sPandocInstruction: string;
    sPandocTo         : string;

    property PandocHistory    : string   read fGetPandocHistory       write pSetPandocHistory;
    property PandocHistoryFrom: string   read fGetPandocHistoryFrom   write pSetPandocHistoryFrom;
    property PandocHistoryTo  : string   read fGetPandocHistoryTo     write pSetPandocHistoryTo;
  end;

var
  frmPandoc: TfrmPandoc;

implementation

uses
  ufrmMain,
  ufrmEditor,
  trUtils;

{$R *.dfm}

function TfrmPandoc.fGetPandocHistory: string;
var
  i: integer;

begin
  Result:= '';
  for i:= 0 to (cbPandocHistory.Items.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;
    Result:= Result +
             cbPandocHistory.Items[i];
  end;
end;

function TfrmPandoc.fGetPandocHistoryFrom: string;
var
  i    : integer;
  slTmp: TStringList;

begin
  slTmp:= TStringList.Create;
  slTmp.Text:= frmMain.sPandocHistoryFrom;
  slTmp.Insert(0,
               sPandocFrom);
  if (iToRemove <> -1) then
    slTmp.Delete(iToRemove);

  Result:= '';
  for i:= 0 to (slTmp.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;
    Result:= Result +
             slTmp.Strings[i];
  end;
  FreeAndNil(slTmp)
end;

function TfrmPandoc.fGetPandocHistoryTo: string;
var
  i    : integer;
  slTmp: TStringList;

begin
  slTmp:= TStringList.Create;
  slTmp.Text:= frmMain.sPandocHistoryTo;
  slTmp.Insert(0,
               sPandocTo);

  if (iToRemove <> -1) then
    slTmp.Delete(iToRemove);

  Result:= '';
  for i:= 0 to (slTmp.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;
    Result:= Result +
             slTmp.Strings[i];
  end;
  FreeAndNil(slTmp)
end;

procedure TfrmPandoc.pSetPandocHistory(sValue: string);
begin
  cbPandocHistory.Items.Text:= sValue;
end;

procedure TfrmPandoc.pSetPandocHistoryFrom(sValue: string);
var
  i    : integer;
  sTmp : string;
  slHistory,
   slFrom: TStringList;

begin
  slHistory:= TStringList.Create;
  slFrom   := TStringList.Create;
  slHistory.Text:= frmMain.sPandocHistory;
  slFrom.Text   := frmMain.sPandocHistoryFrom;

  i:= 0;
  while (slHistory.Count >= 1) and
        (i <= 10) do begin
    sTmp:= slHistory.Strings[i];
    if (sTmp = sValue) then begin
      edHistoryFrom.Text:= slFrom.Strings[i];
      break;
    end;
    inc(i);
  end;

  FreeAndNil(slHistory);
  FreeAndNil(slFrom);
end;

procedure TfrmPandoc.pSetPandocHistoryTo(sValue: string);
var
  i    : integer;
  sTmp : string;
  slHistory,
   slTo: TStringList;

begin
  slHistory:= TStringList.Create;
  slTo     := TStringList.Create;
  slHistory.Text:= frmMain.sPandocHistory;
  slTo.Text     := frmMain.sPandocHistoryTo;

  i:= 0;
  while (slHistory.Count >= 1) and
        (i <= 10) do begin
    sTmp:= slHistory.Strings[i];
    if (sTmp = sValue) then begin
      edHistoryTo.Text:= slTo.Strings[i];
      break;
    end;
    inc(i);
  end;

  FreeAndNil(slHistory);
  FreeAndNil(slTo);
end;

function TfrmPandoc.fCanMakeInstruction: boolean;
begin
  Result:= False;
  if (rdgFrom.ItemIndex <> -1) and
     (rdgTo.ItemIndex <> -1) then Result:= True;
end;

procedure TfrmPandoc.cbPandocHistorySelect(Sender: TObject);
begin
  if (cbPandocHistory.Text = '') then Exit;

  // Clear the interface that will not be used
  edInstruction.Text:= '';
  edFrom.Text:= '';
  edTo.Text:= '';

  iToRemove:= cbPandocHistory.ItemIndex + 1;
  with frmMain do begin
    PandocHistoryFrom:= cbPandocHistory.Text;
    PandocHistoryTo  := cbPandocHistory.Text;
  end;
end;

procedure TfrmPandoc.pMakePandocInstruction(sInstruction,
                                            sFrom,
                                            sTo: string);
begin
  sPandocInstruction:= StringReplace(sInstruction,
                                     '%from',
                                     sFrom,
                                     []);

  sPandocInstruction:= StringReplace(sPandocInstruction,
                                     '%to',
                                     sTo,
                                     []);
end;

procedure TfrmPandoc.pPandocDefaultInstruction(iFrom,
                                               iTo: integer);

  function GetName(sTmp: string): string;
  var
    iPos: integer;

  begin
    iPos:= Pos('(',
               sTmp);

    sTmp:= Copy(sTmp,
                0,
                iPos - 2);

    Result:= sTmp;
  end;

  function GetInputFile: string;
  var
    sTmp: string;

  begin
    with frmMain do
      with (MDIChildren[fFindTopWindow] as TfrmEditor) do
        sTmp:= sActiveFile;
    Result:= sTmp;
  end;

begin
  sPandocFrom:= GetInputFile;
  sPandocTo  := ChangeFileExt(sPandocFrom,
                              '.' +
                              GetName(rdgTo.Items[iTo]));
  edFrom.Text:= sPandocFrom;
  edTo.Text  := sPandocTo;

  edInstruction.Text:= 'pandoc'                       +
                        ' -f '                        +
                        GetName(rdgFrom.Items[iFrom]) +
                        ' -t '                        +
                        GetName(rdgTo.Items[iTo])     +
                        ' '                           +
                        '%from'                       +
                        ' -o'                         +
                        ' '                           +
                        '%to';

  pMakePandocInstruction(edInstruction.Text,
                         sPandocFrom,
                         sPandocTo);
end;

procedure TfrmPandoc.bbtPandocRestoreDefaultClick(Sender: TObject);
begin
  with frmMain do begin
    rdgFrom.ItemIndex:= iPandocFrom;
    rdgTo.ItemIndex  := iPandocTo;
    pPandocDefaultInstruction(iPandocFrom,
                              iPandocTo);
  end;
end;

procedure TfrmPandoc.FormCloseQuery(Sender: TObject;
                                    var CanClose: Boolean);
var
  sTmp: string;
  i   : integer;

begin
  if (cbPandocHistory.Text <> '') and
     (edHistoryFrom.Text <> '') and
     (edHistoryTo.Text <> '') then begin

    sPandocFrom:= edHistoryFrom.Text;
    sPandocTo  := edHistoryTo.Text;

    pMakePandocInstruction(cbPandocHistory.Text,
                           sPandocFrom,
                           sPandocTo);

    sTmp:= cbPandocHistory.Text;
    if (ModalResult = mrOK) and
       (sTmp <> '') then begin
      i:= cbPandocHistory.Items.IndexOf(sTmp);
      if (i > -1) then begin
        cbPandocHistory.Items.Delete(i);
        cbPandocHistory.Items.Insert(0,
                                     sTmp);
        cbPandocHistory.Text:= sTmp;
      end
      else cbPandocHistory.Items.Insert(0,
                                        sTmp);
    end;
    Exit;
  end;

  sTmp:= edInstruction.Text;
  if (ModalResult = mrOK) and
     (sTmp <> '') then begin
    i:= cbPandocHistory.Items.IndexOf(sTmp);
    if (i > -1) then begin
      cbPandocHistory.Items.Delete(i);
      cbPandocHistory.Items.Insert(0,
                                   sTmp);
      cbPandocHistory.Text:= sTmp;
    end
    else cbPandocHistory.Items.Insert(0,
                                      sTmp);
    sPandocFrom:= edFrom.Text;
    sPandocTo  := edTo.Text;
  end;
end;

procedure TfrmPandoc.FormCreate(Sender: TObject);
begin
  if not fCanMakeInstruction then Exit;

  with frmMain do
    pPandocDefaultInstruction(iPandocFrom,
                              iPandocTo);
end;

procedure TfrmPandoc.FormShow(Sender: TObject);
begin
  iToRemove:= -1;

  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmPandoc.rdgFromClick(Sender: TObject);
begin
  if not fCanMakeInstruction then Exit;

  pPandocDefaultInstruction(rdgFrom.ItemIndex,
                            rdgTo.ItemIndex);
end;

procedure TfrmPandoc.rdgToClick(Sender: TObject);
begin
  if not fCanMakeInstruction then Exit;

  pPandocDefaultInstruction(rdgFrom.ItemIndex,
                            rdgto.ItemIndex);
end;

end.
