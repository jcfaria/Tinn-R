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

unit ufrmRmirrors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Mask, Db, DBTables,
  Buttons, ComCtrls, JvDBControls;

type
  TfrmRmirrors = class(TForm)
    bbHelp: TBitBtn;
    bbtRmirrorsCancel: TBitBtn;
    bbtRmirrorsCancelAll: TBitBtn;
    bbtRmirrorsClose: TBitBtn;
    bbtRmirrorsDelete: TBitBtn;
    bbtRmirrorsEdit: TBitBtn;
    bbtRmirrorsNew: TBitBtn;
    bbtRmirrorsRestoreDefault: TBitBtn;
    bbtRmirrorsSave: TBitBtn;
    dbeCity: TDBEdit;
    dbeCode: TDBEdit;
    dbeCountry: TDBEdit;
    dbeHost: TDBEdit;
    dbeName: TDBEdit;
    dbeURL: TDBEdit;
    dbgRmirrors: TDBGrid;
    edtCitySearch: TEdit;
    edtCountrySearch: TEdit;
    edtNameSearch: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel2: TPanel;
    stbRmirrors: TStatusBar;
    JvDBNavigator2: TJvDBNavigator;

    procedure bbHelpClick(Sender: TObject);
    procedure bbtRmirrorsCancelAllClick(Sender: TObject);
    procedure bbtRmirrorsCancelClick(Sender: TObject);
    procedure bbtRmirrorsCloseClick(Sender: TObject);
    procedure bbtRmirrorsDeleteClick(Sender: TObject);
    procedure bbtRmirrorsEditClick(Sender: TObject);
    procedure bbtRmirrorsNewClick(Sender: TObject);
    procedure bbtRmirrorsRestoreDefaultClick(Sender: TObject);
    procedure bbtRmirrorsSaveClick(Sender: TObject);
    procedure dbgRmirrorsTitleClick(Column: TColumn);
    procedure edtCitySearchChange(Sender: TObject);
    procedure edtCountrySearchChange(Sender: TObject);
    procedure edtNameSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure pCountries_Actualize;

  public
    { Public declarations }
  end;

var
  frmRmirrors: TfrmRmirrors;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools;

{$R *.dfm}

procedure TfrmRmirrors.edtCountrySearchChange(Sender: TObject);
begin
  with edtCountrySearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRmirrors.Locate('Country',
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

procedure TfrmRmirrors.edtNameSearchChange(Sender: TObject);
begin
  with edtNameSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRmirrors.Locate('Name',
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

procedure TfrmRmirrors.edtCitySearchChange(Sender: TObject);
begin
  with edtCitySearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdRmirrors.Locate('city',
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

procedure TfrmRmirrors.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    with dbeCountry do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeName do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeCity do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeHost do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeURL do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeCode do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbgRmirrors do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  stbRmirrors.Panels[0].Text:= 'Browse mode';
  with ModDados do begin
    cdRmirrors.Filtered:= False;

    with frmMain do
      frmTools.lbCountries.Selected[iCountriesFilter]:= False;

    cdRmirrors.Bookmark:= frmMain.sRmirrorsBookMark;
  end;
  edtCountrySearch.SetFocus;
end;

procedure TfrmRmirrors.pCountries_Actualize;
begin
  //Actualize Countries in frmTools
  with modDados do begin
    pRmirrorsCountries_Filter(nil);

    with frmMain do begin
      frmTools.lbCountries.Items:= slRmirrors_Countries;
      frmTools.lbCountries.Refresh;
    end;

    FreeAndNil(slRmirrors_Countries);
  end;
end;

procedure TfrmRmirrors.FormClose(Sender: TObject;
                                 var Action: TCloseAction);
begin
  with frmTools do begin
    lbCountries.ItemIndex:= frmMain.iCountriesFilter;
    lbCountriesClick(Self);
  end;
end;

procedure TfrmRmirrors.FormCloseQuery(Sender: TObject;
                                      var CanClose: Boolean);
begin
  with modDados.cdRmirrors do begin
    IndexDefs.Clear;

    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Rmirrors_Idx';
      Fields := 'Country;Name;URL';
      Options:= [ixPrimary, ixUnique];
    end;

    IndexName:= 'Rmirrors_Idx';
  end;
  pCountries_Actualize;
end;

procedure TfrmRmirrors.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmRmirrors.bbtRmirrorsNewClick(Sender: TObject);
begin
  with modDados.cdRmirrors do
    Insert;

  dbeCountry.SetFocus;
  stbRmirrors.Panels[0].Text:= 'Insert mode';
end;

procedure TfrmRmirrors.bbtRmirrorsDeleteClick(Sender: TObject);
begin
  with modDados.cdRmirrors do
    Delete;
end;

procedure TfrmRmirrors.bbtRmirrorsEditClick(Sender: TObject);
begin
  with modDados.cdRmirrors do
    Edit;

  dbeCountry.SetFocus;
  stbRmirrors.Panels[0].Text:= 'Edit mode';
end;

procedure TfrmRmirrors.bbtRmirrorsCancelClick(Sender: TObject);
begin
  with modDados.cdRmirrors do
    Cancel;
  stbRmirrors.Panels[0].Text:= 'Browse mode';
end;

procedure TfrmRmirrors.bbtRmirrorsSaveClick(Sender: TObject);
begin
  with modDados.cdRmirrors do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      frmMain.iRmirrors_SavePoint:= SavePoint;
    except
    end;
  end;
  //ActualizeGroups;
end;

procedure TfrmRmirrors.bbtRmirrorsCloseClick(Sender: TObject);
begin
  with modDados.cdRmirrors do
    SavePoint:= frmMain.iRmirrors_SavePoint;

  Close;
  frmMain.Refresh;
end;

procedure TfrmRmirrors.dbgRmirrorsTitleClick(Column: TColumn);
begin
  with modDados.cdRmirrors do
    IndexFieldNames:= Column.FieldName;
end;

procedure TfrmRmirrors.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpen_UserGuidePDF('"Mirrors (R)"');
end;

procedure TfrmRmirrors.bbtRmirrorsCancelAllClick(Sender: TObject);
begin
  with modDados.cdRmirrors do
    SavePoint:= frmMain.iRmirrors_SavePoint;
end;

procedure TfrmRmirrors.bbtRmirrorsRestoreDefaultClick(Sender: TObject);
begin
  if not FileExists(frmMain.sFileDataOrigin) then Exit;
  try
    modDados.cdRmirrors.Active:= False;

    with frmMain.zipKit do begin
      FileName     := frmMain.sFileDataOrigin;
      BaseDirectory:= frmMain.sPath_Data;
      ExtractFiles('Rmirrors.xml');
      CloseArchive;
    end;

    with modDados do begin
      cdRmirrors.Active:= True;
      frmMain.iRmirrors_SavePoint:= cdRmirrors.SavePoint;
    end;  

    MessageDlg('The original ''Rmirrors.xml'' was successfully restored.',
               mtInformation,
               [MBOK],
               0);
  except
    // todo!
  end;
end;

end.
