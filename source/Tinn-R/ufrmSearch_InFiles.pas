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

unit ufrmSearch_InFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, JvBaseDlg, JvBrowseFolder;

type
  TfrmSearch_InFiles_Dlg = class(TForm)
    //bffDSearchInFiles: TrmBrowseForFolder;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbDirectories: TCheckBox;
    cbOpenFiles: TCheckBox;
    cbRegularExpression: TCheckBox;
    cbSearchCaseSensitive: TCheckBox;
    cbSearchText: TComboBox;
    cbSearchWholeWords: TCheckBox;
    cbSubdirectories: TCheckBox;
    comboDirectories: TComboBox;
    comboFileMasks: TComboBox;
    gbSearchOptions: TGroupBox;
    gbxWhere: TGroupBox;
    GroupBox1: TGroupBox;
    JvBrowseForFolder: TJvBrowseForFolderDialog;
    Label1: TLabel;
    lblDirectory: TLabel;
    lblFileMask: TLabel;
    sbtnDirectory: TSpeedButton;

    procedure cbDirectoriesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure sbtnDirectoryClick(Sender: TObject);

  private
    { Private declarations }
    // Getters
    function fGetSearchCaseSensitive: boolean;
    function fGetSearchDirectory: boolean;
    function fGetSearchDirectoryText: string;
    function fGetSearchDirHistory: string;
    function fGetSearchFileMask: string;
    function fGetSearchFileMaskHistory: string;
    function fGetSearchInSub: boolean;
    function fGetSearchOpenFiles: boolean;
    function fGetSearchRegularExpression: boolean;
    function fGetSearchText: string;
    function fGetSearchTextHistory: string;
    function fGetSearchWholeWords: boolean;

    // Setters
    procedure pSetSearchCaseSensitive(Value: boolean);
    procedure pSetSearchDirectory(const Value: boolean);
    procedure pSetSearchDirectoryText(const Value: string);
    procedure pSetSearchDirHistory(Value: string);
    procedure pSetSearchFileMask(Value: string);
    procedure pSetSearchFileMaskHistory(Value: string);
    procedure pSetSearchInSub(const Value: boolean);
    procedure pSetSearchOpenFiles(const Value: boolean);
    procedure pSetSearchRegularExpression(const Value: boolean);
    procedure pSetSearchText(Value: string);
    procedure pSetSearchTextHistory(Value: string);
    procedure pSetSearchWholeWords(Value: boolean);


  public
    { Public declarations }
    property SearchCaseSensitive: boolean       read fGetSearchCaseSensitive       write pSetSearchCaseSensitive;
    property SearchDirectory: boolean           read fGetSearchDirectory           write pSetSearchDirectory;
    property SearchDirectoryText: string        read fGetSearchDirectoryText       write pSetSearchDirectoryText;
    property SearchDirHistory: string           read fGetSearchDirHistory          write pSetSearchDirHistory;
    property SearchFileMask: string             read fGetSearchFileMask            write pSetSearchFileMask;
    property SearchFileMaskHistory: string      read fGetSearchFileMaskHistory     write pSetSearchFileMaskHistory;
    property SearchInSub: boolean               read fGetSearchInSub               write pSetSearchInSub;
    property SearchOpenFiles: boolean           read fGetSearchOpenFiles           write pSetSearchOpenFiles;
    property SearchRegularExpression: boolean   read fGetSearchRegularExpression   write pSetSearchRegularExpression;
    property SearchText: string                 read fGetSearchText                write pSetSearchText;
    property SearchTextHistory: string          read fGetSearchTextHistory         write pSetSearchTextHistory;
    property SearchWholeWords: boolean          read fGetSearchWholeWords          write pSetSearchWholeWords;
  end;

var
  frmSearch_InFiles_Dlg: TfrmSearch_InFiles_Dlg;

implementation

uses ufrmMain;

{$R *.DFM}

// Getters
function TfrmSearch_InFiles_Dlg.fGetSearchCaseSensitive: boolean;
begin
  Result:= cbSearchCaseSensitive.Checked;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchRegularExpression: boolean;
begin
  Result:= cbRegularExpression.Checked;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchText: string;
begin
  Result:= cbSearchText.Text;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchTextHistory: string;
var
  i: integer;

begin
  Result:= '';
  for i:= 0 to (cbSearchText.Items.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;
    Result:= Result +
             cbSearchText.Items[i];
  end;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchWholeWords: boolean;
begin
  Result:= cbSearchWholeWords.Checked;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchOpenFiles: boolean;
begin
  Result:= cbOpenFiles.Checked;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchDirectory: boolean;
begin
  Result:= cbDirectories.Checked;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchDirHistory: string;
var
  i: integer;

begin
  Result:= '';
  for i:= 0 to (comboDirectories.Items.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;
    Result:= Result +
             comboDirectories.Items[i];
  end;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchFileMaskHistory: string;
var
  i: integer;

begin
  Result:= '';
  for i:= 0 to (comboFileMasks.Items.Count - 1) do begin
    if (i >= 10) then break;
    if (i > 0) then Result:= Result +
                             #13#10;
    Result:= Result +
             comboFileMasks.Items[i];
  end;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchInSub: boolean;
begin
  Result:= cbSubdirectories.Checked;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchDirectoryText: string;
begin
  Result:= comboDirectories.Text;
end;

function TfrmSearch_InFiles_Dlg.fGetSearchFileMask: string;
begin
  Result:= comboFileMasks.Text;
end;

// Setters
procedure TfrmSearch_InFiles_Dlg.pSetSearchCaseSensitive(Value: boolean);
begin
  cbSearchCaseSensitive.Checked:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchText(Value: string);
begin
  cbSearchText.Text:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchTextHistory(Value: string);
begin
  cbSearchText.Items.Text:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchWholeWords(Value: boolean);
begin
  cbSearchWholeWords.Checked:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchRegularExpression(
  const Value: boolean);
begin
  cbRegularExpression.Checked:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchOpenFiles(const Value: boolean);
begin
  cbOpenFiles.Checked:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchDirectory(const Value: boolean);
begin
  cbDirectories.Checked:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchDirHistory(Value: string);
begin
  comboDirectories.Items.Text:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchFileMask(Value: string);
begin
  comboFileMasks.Items.Text:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchInSub(const Value: boolean);
begin
  cbSubdirectories.Checked:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchDirectoryText(const Value: string);
begin
  comboDirectories.Text:= Value;
end;

procedure TfrmSearch_InFiles_Dlg.pSetSearchFileMaskHistory(Value: string);
begin
  comboFileMasks.Items.Text:= Value;
end;

// Form procedure
procedure TfrmSearch_InFiles_Dlg.FormCloseQuery(Sender: TObject;
                                           var CanClose: Boolean);
var
  sTmp: string;
  i    : integer;

begin
  if (ModalResult = mrOK) and
     (cbSearchText.Text = '') then begin
    MessageDlg('No valid argument to search!',
               mtWarning,
               [MBOK],
               0);
    Canclose:= False;
    Exit;
  end
  else CanClose:= True;

  // Set the combo boxes so the entered text gets accounted for
  sTmp:= cbSearchText.Text;
  if (ModalResult = mrOK) and
     (sTmp <> '') then begin
    i:= cbSearchText.Items.IndexOf(sTmp);
    if (i > -1) then begin
      cbSearchText.Items.Delete(i);
      cbSearchText.Items.Insert(0,
                                sTmp);
      cbSearchText.Text:= sTmp;
    end
    else cbSearchText.Items.Insert(0,
                                   sTmp);

    if cbDirectories.Checked then begin
      sTmp:= comboDirectories.Text;
      if (sTmp <> '') then begin
        i:= comboDirectories.Items.IndexOf(sTmp);
        if (i > -1) then begin
          comboDirectories.Items.Delete(i);
          comboDirectories.Items.Insert(0,
                                        sTmp);
          comboDirectories.Text:= sTmp;
        end
        else comboDirectories.Items.Insert(0,
                                           sTmp);
      end;

      sTmp:= comboFileMasks.Text;
      if (sTmp <> '') then  begin
        i:= comboFileMasks.Items.IndexOf(sTmp);
        if (i > -1) then begin
          comboFileMasks.Items.Delete(i);
          comboFileMasks.Items.Insert(0,
                                      sTmp);
          comboFileMasks.Text:= sTmp;
        end
        else comboFileMasks.Items.Insert(0,
                                         sTmp);
      end;
    end;
  end
end;

procedure TfrmSearch_InFiles_Dlg.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmSearch_InFiles_Dlg.sbtnDirectoryClick(Sender: TObject);
begin
  with JvBrowseForFolder do begin
    Title:= 'Choose below a directory for search';
    if (comboDirectories.Text <> '') then Directory:= comboDirectories.Text
                                     else Directory:= RootDirectoryPath;
    if Execute then comboDirectories.Text:= Directory;
  end;
end;

procedure TfrmSearch_InFiles_Dlg.cbDirectoriesClick(Sender: TObject);
var
  bVis: boolean;

begin
  bVis:= cbDirectories.Checked;
  comboDirectories.Enabled:= bVis;
  sbtnDirectory.Enabled   := bVis;
  comboFileMasks.Enabled  := bVis;
  cbSubdirectories.Enabled:= bVis;
  lblDirectory.Enabled    := bVis;
  lblFileMask.Enabled     := bVis;
end;

procedure TfrmSearch_InFiles_Dlg.FormActivate(Sender: TObject);
begin
  if comboDirectories.Enabled then
    if (comboDirectories.Items.Count > 0) then comboDirectories.ItemIndex:= 0;
  if comboFileMasks.Enabled then
    if (comboFileMasks.Items.Count > 0) then comboFileMasks.ItemIndex:= 0;
end;

end.
