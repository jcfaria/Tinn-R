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

unit ufrmComments;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Mask, Db, DBTables,
  Buttons, ComCtrls, JvDBControls, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl, IWControl, IWDBStdCtrls;

type
  TfrmComments = class(TForm)
    bbHelp: TBitBtn;
    bbtCommentsCancel: TBitBtn;
    bbtCommentsCancelAll: TBitBtn;
    bbtCommentsClose: TBitBtn;
    bbtCommentsEdit: TBitBtn;
    bbtCommentsRestoreDefault: TBitBtn;
    bbtCommentsSave: TBitBtn;
    dbeBegin: TDBEdit;
    dbeEnd: TDBEdit;
    dbeLanguage: TDBEdit;
    dbeLine: TDBEdit;
    dbgComments: TDBGrid;
    edtBegin: TEdit;
    edtEnd: TEdit;
    edtLanguageSearch: TEdit;
    edtLineSearch: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Panel2: TPanel;
    stbComments: TStatusBar;
    IWDBNavigator1: TIWDBNavigator;
    JvDBNavigator2: TJvDBNavigator;

    procedure bbHelpClick(Sender: TObject);
    procedure bbtCommentsCancelAllClick(Sender: TObject);
    procedure bbtCommentsCancelClick(Sender: TObject);
    procedure bbtCommentsCloseClick(Sender: TObject);
    procedure bbtCommentsEditClick(Sender: TObject);
    procedure bbtCommentsRestoreDefaultClick(Sender: TObject);
    procedure bbtCommentsSaveClick(Sender: TObject);
    procedure dbgCommentsTitleClick(Column: TColumn);
    procedure edtBeginChange(Sender: TObject);
    procedure edtLanguageSearchChange(Sender: TObject);
    procedure edtLineSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmComments: TfrmComments;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools;

{$R *.dfm}

procedure TfrmComments.edtLanguageSearchChange(Sender: TObject);
begin
  with edtLanguageSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdComments.Locate('Language',
                                     Text,
                                     [loPartialKey]) = True) then begin
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

procedure TfrmComments.edtLineSearchChange(Sender: TObject);
begin
  with edtLineSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdComments.Locate('Line',
                                     Text,
                                     [loPartialKey]) = True) then begin
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

procedure TfrmComments.edtBeginChange(Sender: TObject);
begin
  with edtBegin do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdComments.Locate('Begin',
                                     Text,
                                     [loPartialKey]) = True) then begin
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

procedure TfrmComments.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    with dbeLanguage do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeLine do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeBegin do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeEnd do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbgComments do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  stbComments.Panels[0].Text:= 'Browse mode';
  with ModDados do
    cdComments.Bookmark:= frmMain.sCommentsBookMark;
  edtLanguageSearch.SetFocus
end;

procedure TfrmComments.FormCloseQuery(Sender: TObject;
                                        var CanClose: Boolean);
begin
  with modDados.cdComments do begin
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'CommentsDefaultIndex';
      Fields := 'Language';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'CommentsDefaultIndex';
  end;
end;

procedure TfrmComments.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmComments.bbtCommentsEditClick(Sender: TObject);
begin
  with modDados.cdComments do
    Edit;
  dbeLanguage.SetFocus;
  stbComments.Panels[0].Text:= 'Edit mode';
end;

procedure TfrmComments.bbtCommentsCancelClick(Sender: TObject);
begin
  with modDados.cdComments do
    Cancel;
  stbComments.Panels[0].Text:= 'Browse mode';
end;

procedure TfrmComments.bbtCommentsSaveClick(Sender: TObject);
begin
  with modDados.cdComments do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      frmMain.iCommentsBeforeChanges:= SavePoint;
    except
    end;
  end;
  //ActualizeGroups;
end;

procedure TfrmComments.bbtCommentsCloseClick(Sender: TObject);
begin
  with modDados.cdComments do
    SavePoint:= frmMain.iCommentsBeforeChanges;
  Close;
  frmMain.Refresh;
end;

procedure TfrmComments.dbgCommentsTitleClick(Column: TColumn);
begin
  with modDados.cdComments do
    IndexFieldNames:= Column.FieldName;
end;

procedure TfrmComments.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"Comments"');
end;

procedure TfrmComments.bbtCommentsCancelAllClick(Sender: TObject);
begin
  with modDados.cdComments do
    SavePoint:= frmMain.iCommentsBeforeChanges;
end;

procedure TfrmComments.bbtCommentsRestoreDefaultClick(Sender: TObject);
begin
  if not FileExists(frmMain.sFileDataOrigin) then Exit;
  try
    modDados.cdComments.Active:= False;
    with frmMain.zipKit do begin
      FileName     := frmMain.sFileDataOrigin;
      BaseDirectory:= frmMain.sPath_Data;
      ExtractFiles('Comments.xml');
      CloseArchive;
    end;
    modDados.cdComments.Active:= True;
    frmMain.iCommentsBeforeChanges:= modDados.cdComments.SavePoint;

    MessageDlg('The original ''Comments.xml'' was successfully restored.',
               mtInformation,
               [MBOK],
               0);
  except
    // todo!
  end;
end;

end.
