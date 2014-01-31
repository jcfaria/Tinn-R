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
  Tinn-R team October/2005
  Tinn-R team October/2013

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

unit ufrmCompletion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ExtCtrls, DBCtrls, Mask, Db, DBTables,
  Buttons, ComCtrls;

type
  TfrmCompletion = class(TForm)
    bbHelp: TBitBtn;
    bbtCompletionCancel: TBitBtn;
    bbtCompletionCancelAll: TBitBtn;
    bbtCompletionClose: TBitBtn;
    bbtCompletionDelete: TBitBtn;
    bbtCompletionEdit: TBitBtn;
    bbtCompletionNew: TBitBtn;
    bbtCompletionRestoreDefault: TBitBtn;
    bbtCompletionSave: TBitBtn;
    dbeFunction: TDBEdit;
    dbeGroup: TDBEdit;
    dbeTrigger: TDBEdit;
    dbgCompletion: TDBGrid;
    dbmCompletion: TDBMemo;
    DBNavigator1: TDBNavigator;
    edtFunctionSearch: TEdit;
    edtFunctionTrigger: TEdit;
    edtGroupSearch: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel2: TPanel;
    stbCompletion: TStatusBar;

    procedure bbHelpClick(Sender: TObject);
    procedure bbtCompletionCancelAllClick(Sender: TObject);
    procedure bbtCompletionCancelClick(Sender: TObject);
    procedure bbtCompletionCloseClick(Sender: TObject);
    procedure bbtCompletionDeleteClick(Sender: TObject);
    procedure bbtCompletionEditClick(Sender: TObject);
    procedure bbtCompletionNewClick(Sender: TObject);
    procedure bbtCompletionRestoreDefaultClick(Sender: TObject);
    procedure bbtCompletionSaveClick(Sender: TObject);
    procedure dbgCompletionTitleClick(Column: TColumn);
    procedure edtFunctionSearchChange(Sender: TObject);
    procedure edtFunctionTriggerChange(Sender: TObject);
    procedure edtGroupSearchChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    procedure ActualizeGroups;
    
  public
    { Public declarations }
  end;

var
  frmCompletion: TfrmCompletion;

implementation

uses
  ufrmMain,
  uModDados,
  ufrmTools;

{$R *.dfm}

procedure TfrmCompletion.edtGroupSearchChange(Sender: TObject);
begin
  with edtGroupSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdCompletion.Locate('Group',
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

procedure TfrmCompletion.edtFunctionSearchChange(Sender: TObject);
begin
  with edtFunctionSearch do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdCompletion.Locate('Function',
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

procedure TfrmCompletion.edtFunctionTriggerChange(Sender: TObject);
begin
  with edtFunctionTrigger do begin
    if (Text = '') then begin
      Color     := clWindow;
      Font.Color:= clBlack;
      Font.Style:= [];
      Exit;
    end;

    if (modDados.cdCompletion.Locate('Trigger',
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

procedure TfrmCompletion.FormActivate(Sender: TObject);
begin
  with frmTinnMain do begin
    with dbeGroup do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeFunction do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbmCompletion do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbeTrigger do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with dbgCompletion do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;

  stbCompletion.Panels[0].Text:= 'Browse mode';

  with ModDados do begin
    cdCompletion.Filtered:= False;

    with frmTinnMain do
      frmTools.lbCompletion.Selected[iCompletionFilter]:= False;

    cdCompletion.Bookmark:= frmTinnMain.sCompletionBookMark;
  end;

  edtGroupSearch.SetFocus;
end;

procedure TfrmCompletion.ActualizeGroups;
begin
  //Actualize Groups in frmTinnMain
  with modDados do begin
    CompletionGroupsFilter(nil);

    with frmTinnMain do begin
      frmTools.lbCompletion.Items:= slCompletion_Groups;
      frmTools.lbCompletion.Refresh;
    end;

    FreeAndNil(slCompletion_Groups);
  end;
end;

procedure TfrmCompletion.FormClose(Sender: TObject;
                                   var Action: TCloseAction);
begin
  with frmTools do begin
    lbCompletion.ItemIndex:= frmTinnMain.iCompletionFilter;
    lbCompletionClick(Self);
  end;
end;

procedure TfrmCompletion.FormCloseQuery(Sender: TObject;
                                        var CanClose: Boolean);
begin
  with modDados.cdCompletion do begin
    IndexDefs.Clear;

    with IndexDefs.AddIndexDef do
    begin
      Name   := 'CompletionDefaultIndex';
      Fields := 'Trigger';
      Options:= [ixPrimary, ixUnique];
    end;

    IndexName:= 'CompletionDefaultIndex';
  end;
  ActualizeGroups;
end;

procedure TfrmCompletion.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmCompletion.bbtCompletionNewClick(Sender: TObject);
begin
  with modDados.cdCompletion do
    Insert;

  dbeGroup.SetFocus;
  stbCompletion.Panels[0].Text:= 'Insert mode';
end;

procedure TfrmCompletion.bbtCompletionDeleteClick(Sender: TObject);
begin
  with modDados.cdCompletion do
    Delete;
end;

procedure TfrmCompletion.bbtCompletionEditClick(Sender: TObject);
begin
  with modDados.cdCompletion do
    Edit;

  dbeGroup.SetFocus;
  stbCompletion.Panels[0].Text:= 'Edit mode';
end;

procedure TfrmCompletion.bbtCompletionCancelClick(Sender: TObject);
begin
  with modDados.cdCompletion do
    Cancel;

  stbCompletion.Panels[0].Text:= 'Browse mode';
end;

procedure TfrmCompletion.bbtCompletionSaveClick(Sender: TObject);
begin
  with modDados.cdCompletion do begin
    Edit;
    try
      Post;
      MergeChangeLog;
      SaveToFile();
      frmTinnMain.iCompletionBeforeChanges:= SavePoint;
    except
    end;
  end;
  //ActualizeGroups;
end;

procedure TfrmCompletion.bbtCompletionCloseClick(Sender: TObject);
begin
  with modDados.cdCompletion do
    SavePoint:= frmTinnMain.iCompletionBeforeChanges;

  Close;
  frmTinnMain.Refresh;
end;

procedure TfrmCompletion.dbgCompletionTitleClick(Column: TColumn);
begin
  with modDados.cdCompletion do
    IndexFieldNames:= Column.FieldName;
end;

procedure TfrmCompletion.bbHelpClick(Sender: TObject);
begin
  frmTinnMain.OpenUserGuidePDF('"Completion"');
end;

procedure TfrmCompletion.bbtCompletionCancelAllClick(Sender: TObject);
begin
  with modDados.cdCompletion do
    SavePoint:= frmTinnMain.iCompletionBeforeChanges;
end;

procedure TfrmCompletion.bbtCompletionRestoreDefaultClick(Sender: TObject);
begin
  if not FileExists(frmTinnMain.sFileDataOrigin) then Exit;
  try
    modDados.cdCompletion.Active:= False;

    with frmTinnMain.zipKit do begin
      FileName     := frmTinnMain.sFileDataOrigin;
      BaseDirectory:= frmTinnMain.sPathData;
      ExtractFiles('Completion.xml');
      CloseArchive;
    end;

    with modDados do begin
      cdCompletion.Active:= True;
      frmTinnMain.iCompletionBeforeChanges:= cdCompletion.SavePoint;
    end;

    MessageDlg('The original ''Completion.xml'' was successfully restored.',
               mtInformation,
               [MBOK],
               0);
  except
    // todo!
  end;
end;

end.
