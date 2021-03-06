(*
 frm_ConfigPrint - Confira��es pr�-impress�o e impress�o do documento atual.

 Notes, http://notes.codigolivre.org.br
 Copyright (C) 2003-2004, Equipe do Notes.

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

(*
@abstract(frm_ConfigPrint - Configura��es de impress�o e impress�o do documento.)
@author(Josimar Silva <josimar_me@yahoo.com.br>)
@author(Anderson R. Barbieri <notesnr@ig.com.br>)
*)

(*
 The original code of this unit was made by Notes team and was modified under
 the GPL by Jos� Cl�udio Faria
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
 (http://cran.r-project.org). The project is coordened by Jos� Cl�udio Faria
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

unit ufrmPrint_Configure;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, SynEditPrint, SynEditPrintTypes, SynEdit,
  Buttons, Mask, ActnList;

type
  TfrmPrint_Configure = class(TForm)
    acConfigurePrint: TActionList;
    actFileName: TAction;
    actImpressionColored: TAction;
    actLineNumber: TAction;
    actPageNumber: TAction;
    actPrint: TAction;
    actPrintConfig: TAction;
    actSyntaxColor: TAction;
    actLineWrap: TAction;
    bbtClose: TBitBtn;
    bbtPreview: TBitBtn;
    bbtPrint: TBitBtn;
    bbtPrintConfig: TBitBtn;
    chkColors: TCheckBox;
    chkFileName: TCheckBox;
    chkLineNumber: TCheckBox;
    chkPageNumber: TCheckBox;
    chkSyntaxColor: TCheckBox;
    chkWordWrap: TCheckBox;
    edEndPage: TEdit;
    edStartPage: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    rbAll: TRadioButton;
    rbSelection: TRadioButton;
    procedure actFileNameExecute(Sender: TObject);
    procedure actImpressionColoredExecute(Sender: TObject);
    procedure actLineNumberExecute(Sender: TObject);
    procedure actPageNumberExecute(Sender: TObject);
    procedure actPrintConfigExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actSyntaxColorExecute(Sender: TObject);
    procedure actLineWrapExecute(Sender: TObject);
    procedure bbtCloseClick(Sender: TObject);
    procedure bbtPreviewClick(Sender: TObject);
    procedure edEndPageKeyPress(Sender: TObject; var Key: Char);
    procedure edStartPageKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure rbAllClick(Sender: TObject);
    procedure rbSelectionClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public
    iFontSize: integer;

    procedure ShowDialog(const seEditor: TSynEdit);

  private
    prnConfigureDlg: TPrinterSetupDialog;
    prnOptions     : TSynEditPrint;
    seEditorPrint  : TSynEdit;

    procedure LoadOptions(Header: boolean);
  end;

var
  frmPrint_Configure: TfrmPrint_Configure;

implementation

uses
  ufrmMain,
  ufrmEditor,
  ufrmPrint_Preview;

{$R *.dfm}

procedure TfrmPrint_Configure.LoadOptions(Header: boolean);
var
  aFont: TFont;

begin
  prnOptions             := TSynEditPrint.Create(Self);
  prnOptions.Title       := frmMain.Caption;
  prnOptions.SynEdit     := seEditorPrint;
  prnOptions.LineNumbers := actLineNumber.Checked;
  prnOptions.Wrap        := actLineWrap.Checked;
  prnOptions.Highlight   := actSyntaxColor.Checked;
  prnOptions.Colors      := actImpressionColored.Checked;
  prnOptions.SelectedOnly:= rbSelection.Checked;
  prnOptions.Font.Size   := iFontSize;
  AFont:= TFont.Create;
  if Header then begin
    if actFileName.Checked then begin
      prnOptions.Header.Clear;
      prnOptions.Header.Add('$TITLE$',
                            aFont,
                            taLeftJustify,
                            1);
    end;
    if actPageNumber.Checked then prnOptions.Header.Add('$PAGENUM$/$PAGECOUNT$',
                                                        aFont,
                                                        taRightJustify,
                                                        1);
  end;
end;

procedure TfrmPrint_Configure.bbtPreviewClick(Sender: TObject);
begin
  LoadOptions(False);
  try
    frmPrint_Preview:= TfrmPrint_Preview.Create(Self);
    frmPrint_Preview.synPP.SynEditPrint:= prnOptions;
    frmPrint_Preview.synPP.UpdatePreview;
    frmPrint_Preview.ShowModal;
  finally
    frmPrint_Preview.Close;
    FreeAndNil(frmPrint_Preview);
    frmMain.Repaint;
  end;
end;

procedure TfrmPrint_Configure.ShowDialog(const seEditor: TSynEdit);
begin
  iFontSize:= seEditor.Font.Size;  // Iy can be changed by user in ufrmPrint_Preview interface

  seEditorPrint:= seEditor;

  Caption:= 'Print ' +
            frmMain.Caption;

  ShowModal;
end;

procedure TfrmPrint_Configure.bbtCloseClick(Sender: TObject);
begin
  FreeAndNil(prnOptions);
  FreeAndNil(prnConfigureDlg);

  with frmMain do begin
    bPrint_FileName   := actFileName.Checked;
    bPrint_LineNumber := actLineNumber.Checked;
    bPrint_PageNumber := actPageNumber.Checked;
    bPrint_Colors     := actImpressionColored.Checked;
    bPrint_SyntaxColor:= actSyntaxColor.Checked;
    bPrint_LineWrap   := actLineWrap.Checked;
  end;
  Close;
end;

procedure TfrmPrint_Configure.FormCreate(Sender: TObject);
begin
  with frmMain do begin
    actFileName.Checked         := bPrint_FileName;
    actLineNumber.Checked       := bPrint_LineNumber;
    actPageNumber.Checked       := bPrint_PageNumber;
    actImpressionColored.Checked:= bPrint_Colors;
    actSyntaxColor.Checked      := bPrint_SyntaxColor;
    actLineWrap.Checked         := bPrint_LineWrap;
    rbSelection.Checked         := bselectedToPreview;
  end;
  bbtPrintConfig.Glyph:= nil;
  bbtPrint.Glyph      := nil;
end;

procedure TfrmPrint_Configure.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmPrint_Configure.rbAllClick(Sender: TObject);
begin
  edStartPage.Text:= '';
  edEndPage.Text  := '';
end;

procedure TfrmPrint_Configure.rbSelectionClick(Sender: TObject);
begin
  edStartPage.Text:= '';
  edEndPage.Text  := '';
end;

procedure TfrmPrint_Configure.edStartPageKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0
  else begin
    rbAll.Checked      := False;
    rbSelection.Checked:= False;
  end;
end;

procedure TfrmPrint_Configure.edEndPageKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then Key := #0
  else begin
    rbAll.Checked      := False;
    rbSelection.Checked:= False;
  end;
end;

procedure TfrmPrint_Configure.actFileNameExecute(Sender: TObject);
begin
  with actFileName do
    Checked:= not Checked;
end;

procedure TfrmPrint_Configure.actPageNumberExecute(Sender: TObject);
begin
  with actPageNumber do
    Checked:= not Checked;
end;

procedure TfrmPrint_Configure.actLineNumberExecute(Sender: TObject);
begin
  with actLineNumber do
    Checked:= not Checked;
  if Assigned(frmPrint_Preview) then begin
    prnOptions.LineNumbers:= actLineNumber.Checked;
    frmPrint_Preview.synPP.UpdatePreview;
  end;
end;

procedure TfrmPrint_Configure.actLineWrapExecute(Sender: TObject);
begin
  with actLineWrap do
    Checked:= not Checked;
  if Assigned(frmPrint_Preview) then begin
    prnOptions.Wrap:= actLineWrap.Checked;
    frmPrint_Preview.synPP.UpdatePreview;
  end;
end;

procedure TfrmPrint_Configure.actSyntaxColorExecute(Sender: TObject);
begin
  with actSyntaxColor do
    Checked:= not Checked;
  if Assigned(frmPrint_Preview) then begin
    prnOptions.Highlight:= actSyntaxColor.Checked;
    frmPrint_Preview.synPP.UpdatePreview;
  end;
end;

procedure TfrmPrint_Configure.actImpressionColoredExecute(Sender: TObject);
begin
  with actImpressionColored do
    Checked:= not Checked;
  if Assigned(frmPrint_Preview) then begin
    prnOptions.Colors:= actImpressionColored.Checked;
    frmPrint_Preview.synPP.UpdatePreview;
  end;
end;

procedure TfrmPrint_Configure.actPrintConfigExecute(Sender: TObject);
begin
  prnConfigureDlg:= TPrinterSetupDialog.Create(Self);
  try
    prnConfigureDlg.Execute;
  except
    raise
      Exception.Create('Error opening the Printer Configuration Dialog.' + #13 +
                       #13 + 'Please, check if the printer is ok!');
  end;
end;

procedure TfrmPrint_Configure.actPrintExecute(Sender: TObject);
begin
  LoadOptions(True);
  if (edStartPage.Text <> '') or
     (edStartPage.Text <> '') then prnOptions.PrintRange(StrToInt(edStartPage.Text),
                                                         StrToInt(edEndPage.Text))
  else begin
    if rbSelection.Checked then prnOptions.SelectedOnly:= True
                           else prnOptions.SelectedOnly:= False;
    try
      prnOptions.Print;
    except
    // TO DO
    end;
  end;

  frmPrint_Configure.Hide;

  if Assigned(frmPrint_Preview) then begin
    frmPrint_Preview.Hide;
    frmPrint_Preview.Close;
  end;

  frmPrint_Configure.Close;
  frmMain.Refresh;
end;

end.
