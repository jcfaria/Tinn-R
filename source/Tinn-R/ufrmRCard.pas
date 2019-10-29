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

unit ufrmRcard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Mask, Db, DBTables,
  Buttons, ComCtrls, JvDBControls;

type
  TfrmRcard = class(TForm)
    bbHelp: TBitBtn;
    bbtRcardCancel: TBitBtn;
    bbtRcardCancelAll: TBitBtn;
    bbtRcardClose: TBitBtn;
    bbtRcardDelete: TBitBtn;
    bbtRcardEdit: TBitBtn;
    bbtRcardNew: TBitBtn;
    bbtRcardRestoreDefault: TBitBtn;
    bbtRcardSave: TBitBtn;
    dbeRFunction: TDBEdit;
    dbeRGroup: TDBEdit;
    dbgRcard: TDBGrid;
    dbmDescription: TDBMemo;
    edtFunctionSearch: TEdit;
    edtGroupSearch: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblSearchGroup: TLabel;
    Panel2: TPanel;
    stbRcard: TStatusBar;
    JvDBNavigator2: TJvDBNavigator;

    procedure bbHelpClick(Sender: TObject);
    procedure bbtRcardCancelAllClick(Sender: TObject);
    procedure bbtRcardCancelClick(Sender: TObject);
    procedure bbtRcardCloseClick(Sender: TObject);
    procedure bbtRcardDeleteClick(Sender: TObject);
    procedure bbtRcardEditClick(Sender: TObject);
    procedure bbtRcardNewClick(Sender: TObject);
    procedure bbtRcardRestoreDefaultClick(Sender: TObject);
    procedure bbtRcardSaveClick(Sender: TObject);
    procedure dbgRcardTitleClick(Column: TColumn);
    procedure edtFunctionSearchChange(Sender: TObject);
    procedure edtGroupSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure pActualize_Groups;

  public
    { Public declarations }
  end;

var
  frmRcard: TfrmRcard;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools;

{$R *.dfm}

procedure TfrmRcard.edtGroupSearchChange(Sender: TObject);
begin
  with edtGroupSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRcard.Locate('Group',
                                Text,
                                [loCaseInsensitive, loPartialKey]) = True) then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
    end
    else begin
      Color     := clRed;
      Font.Color:= clWhite;
      Font.Style:= [fsBold];
    end;
  end;
end;

procedure TfrmRcard.edtFunctionSearchChange(Sender: TObject);
begin
  with edtFunctionSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRcard.Locate('Function',
                                Text,
                                [loCaseInsensitive, loPartialKey]) = True) then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
    end
    else begin
      Color     := clRed;
      Font.Color:= clWhite;
      Font.Style:= [fsBold];
    end;
  end;
end;

procedure TfrmRcard.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    with dbeRGroup do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeRFunction do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbmDescription do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  with dbgRcard do begin  //Necessary to avoid conflit of names (frmMain)
    Color     := frmMain.clBGApplication;
    Font.Color:= frmMain.clFGApplication;
  end;

  stbRcard.Panels[0].Text:= 'Browse mode';

  with ModDados do begin
    cdRcard.Filtered:= False;
    with frmMain do
      frmTools.lbRcard.Selected[iRcardFilter]:= False;
    cdRcard.Bookmark:= frmMain.sRcardBookMark;
  end;

  edtGroupSearch.SetFocus;
end;

procedure TfrmRcard.bbtRcardNewClick(Sender: TObject);
begin
  with modDados.cdRcard do
    Insert;
  dbeRGroup.SetFocus;
  stbRcard.Panels[0].Text:= 'Insert mode';
end;

procedure TfrmRcard.bbtRcardDeleteClick(Sender: TObject);
begin
  with modDados.cdRcard do
    Delete;
end;

procedure TfrmRcard.bbtRcardEditClick(Sender: TObject);
begin
  with modDados.cdRcard do
    Edit;
  dbeRFunction.SetFocus;
  stbRcard.Panels[0].Text:= 'Edit mode';
end;

procedure TfrmRcard.bbtRcardCancelClick(Sender: TObject);
begin
  with modDados.cdRcard do
    Cancel;
  stbRcard.Panels[0].Text:= 'Browse mode';
end;

procedure TfrmRcard.bbtRcardSaveClick(Sender: TObject);
begin
  with modDados.cdRcard do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      frmMain.iRcard_SavePoint:= SavePoint;
    except
    end;
  end;
end;

procedure TfrmRcard.pActualize_Groups;
begin
  //Actualize groups in frmMain
  with modDados do begin
    pRcardGroups_Filter(self);

    with frmMain do begin
      frmTools.lbRcard.Items:= slRcard_Groups;
      frmTools.lbRcard.Refresh;
    end;

    FreeAndNil(slRcard_Groups);
  end;
end;

procedure TfrmRcard.FormClose(Sender: TObject;
                              var Action: TCloseAction);
begin
  with frmMain do begin
    frmTools.lbRcard.ItemIndex:= iRcardFilter;
    frmTools.lbRcardClick(Self);
  end;
end;

procedure TfrmRcard.FormCloseQuery(Sender: TObject;
                                   var CanClose: Boolean);
begin
  with modDados.cdRcard do begin
    IndexDefs.Clear;

    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Rcard_Idx';
      Fields := 'Group;Function';
      Options:= [ixPrimary, ixUnique];
    end;

    IndexName:= 'Rcard_Idx';
  end;
end;

procedure TfrmRcard.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmRcard.bbtRcardCloseClick(Sender: TObject);
begin
  with modDados.cdRcard do begin
    SavePoint:= frmMain.iRcard_SavePoint;
    IndexName:= 'Rcard_Idx';
  end;

  pActualize_Groups;
  Close;
  frmMain.Refresh;
end;

procedure TfrmRcard.dbgRcardTitleClick(Column: TColumn);
begin
  with modDados.cdRcard do
    if (Column.FieldName = 'Group') then IndexFieldNames:= 'Group;Function'
                                    else IndexFieldNames:= 'Function;Group';
end;

procedure TfrmRcard.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"Card (R)"');
end;

procedure TfrmRcard.bbtRcardCancelAllClick(Sender: TObject);
begin
  with modDados.cdRcard do
    SavePoint:= frmMain.iRcard_SavePoint;
end;

procedure TfrmRcard.bbtRcardRestoreDefaultClick(Sender: TObject);
begin
  if not FileExists(frmMain.sFileDataOrigin) then Exit;
  try
    modDados.cdRcard.Active:= False;

    with frmMain.zipKit do begin
      FileName     := frmMain.sFileDataOrigin;
      BaseDirectory:= frmMain.sPath_Data;
      ExtractFiles('Rcard.xml');
      CloseArchive;
    end;

    with modDados do begin
      cdRcard.Active:= True;
      frmMain.iRcard_SavePoint:= cdRcard.SavePoint;
    end;  

    MessageDlg('The original ''Rcard.xml'' was successfully restored!',
               mtInformation,
               [MBOK],
               0);
  except
    // todo!
  end;
end;

end.
