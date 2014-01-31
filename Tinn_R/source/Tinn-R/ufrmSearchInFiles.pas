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

unit ufrmSearchInFiles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, JvBaseDlg, JvBrowseFolder;

type
  TfrmSearchInFiles = class(TForm)
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
    function GetSearchCaseSensitive: boolean;
    function GetSearchDirectory: boolean;
    function GetSearchDirectoryText: string;
    function GetSearchDirHistory: string;
    function GetSearchFileMask: string;
    function GetSearchFileMaskHistory: string;
    function GetSearchInSub: boolean;
    function GetSearchOpenFiles: boolean;
    function GetSearchRegularExpression: boolean;
    function GetSearchText: string;
    function GetSearchTextHistory: string;
    function GetSearchWholeWords: boolean;

    // Setters
    procedure SetSearchCaseSensitive(Value: boolean);
    procedure SetSearchDirectory(const Value: boolean);
    procedure SetSearchDirectoryText(const Value: string);
    procedure SetSearchDirHistory(Value: string);
    procedure SetSearchFileMask(Value: string);
    procedure SetSearchFileMaskHistory(Value: string);
    procedure SetSearchInSub(const Value: boolean);
    procedure SetSearchOpenFiles(const Value: boolean);
    procedure SetSearchRegularExpression(const Value: boolean);
    procedure SetSearchText(Value: string);
    procedure SetSearchTextHistory(Value: string);
    procedure SetSearchWholeWords(Value: boolean);


  public
    { Public declarations }
    property SearchCaseSensitive: boolean       read GetSearchCaseSensitive       write SetSearchCaseSensitive;
    property SearchDirectory: boolean           read GetSearchDirectory           write SetSearchDirectory;
    property SearchDirectoryText: string        read GetSearchDirectoryText       write SetSearchDirectoryText;
    property SearchDirHistory: string           read GetSearchDirHistory          write SetSearchDirHistory;
    property SearchFileMask: string             read GetSearchFileMask            write SetSearchFileMask;
    property SearchFileMaskHistory: string      read GetSearchFileMaskHistory     write SetSearchFileMaskHistory;
    property SearchInSub: boolean               read GetSearchInSub               write SetSearchInSub;
    property SearchOpenFiles: boolean           read GetSearchOpenFiles           write SetSearchOpenFiles;
    property SearchRegularExpression: boolean   read GetSearchRegularExpression   write SetSearchRegularExpression;
    property SearchText: string                 read GetSearchText                write SetSearchText;
    property SearchTextHistory: string          read GetSearchTextHistory         write SetSearchTextHistory;
    property SearchWholeWords: boolean          read GetSearchWholeWords          write SetSearchWholeWords;
  end;

var
  frmSearchInFiles: TfrmSearchInFiles;

implementation

uses ufrmMain;

{$R *.DFM}

// Getters
function TfrmSearchInFiles.GetSearchCaseSensitive: boolean;
begin
  Result:= cbSearchCaseSensitive.Checked;
end;

function TfrmSearchInFiles.GetSearchRegularExpression: boolean;
begin
  Result:= cbRegularExpression.Checked;
end;

function TfrmSearchInFiles.GetSearchText: string;
begin
  Result:= cbSearchText.Text;
end;

function TfrmSearchInFiles.GetSearchTextHistory: string;
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

function TfrmSearchInFiles.GetSearchWholeWords: boolean;
begin
  Result:= cbSearchWholeWords.Checked;
end;

function TfrmSearchInFiles.GetSearchOpenFiles: boolean;
begin
  Result:= cbOpenFiles.Checked;
end;

function TfrmSearchInFiles.GetSearchDirectory: boolean;
begin
  Result:= cbDirectories.Checked;
end;

function TfrmSearchInFiles.GetSearchDirHistory: string;
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

function TfrmSearchInFiles.GetSearchFileMaskHistory: string;
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

function TfrmSearchInFiles.GetSearchInSub: boolean;
begin
  Result:= cbSubdirectories.Checked;
end;

function TfrmSearchInFiles.GetSearchDirectoryText: string;
begin
  Result:= comboDirectories.Text;
end;

function TfrmSearchInFiles.GetSearchFileMask: string;
begin
  Result:= comboFileMasks.Text;
end;

// Setters
procedure TfrmSearchInFiles.SetSearchCaseSensitive(Value: boolean);
begin
  cbSearchCaseSensitive.Checked:= Value;
end;

procedure TfrmSearchInFiles.SetSearchText(Value: string);
begin
  cbSearchText.Text:= Value;
end;

procedure TfrmSearchInFiles.SetSearchTextHistory(Value: string);
begin
  cbSearchText.Items.Text:= Value;
end;

procedure TfrmSearchInFiles.SetSearchWholeWords(Value: boolean);
begin
  cbSearchWholeWords.Checked:= Value;
end;

procedure TfrmSearchInFiles.SetSearchRegularExpression(
  const Value: boolean);
begin
  cbRegularExpression.Checked:= Value;
end;

procedure TfrmSearchInFiles.SetSearchOpenFiles(const Value: boolean);
begin
  cbOpenFiles.Checked:= Value;
end;

procedure TfrmSearchInFiles.SetSearchDirectory(const Value: boolean);
begin
  cbDirectories.Checked:= Value;
end;

procedure TfrmSearchInFiles.SetSearchDirHistory(Value: string);
begin
  comboDirectories.Items.Text:= Value;
end;

procedure TfrmSearchInFiles.SetSearchFileMask(Value: string);
begin
  comboFileMasks.Items.Text:= Value;
end;

procedure TfrmSearchInFiles.SetSearchInSub(const Value: boolean);
begin
  cbSubdirectories.Checked:= Value;
end;

procedure TfrmSearchInFiles.SetSearchDirectoryText(const Value: string);
begin
  comboDirectories.Text:= Value;
end;

procedure TfrmSearchInFiles.SetSearchFileMaskHistory(Value: string);
begin
  comboFileMasks.Items.Text:= Value;
end;

// Form procedure
procedure TfrmSearchInFiles.FormCloseQuery(Sender: TObject;
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

procedure TfrmSearchInFiles.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmSearchInFiles.sbtnDirectoryClick(Sender: TObject);
begin
  with JvBrowseForFolder do begin
    Title:= 'Choose below a directory for search';
    if (comboDirectories.Text <> '') then Directory:= comboDirectories.Text
                                     else Directory:= RootDirectoryPath;
    if Execute then comboDirectories.Text:= Directory;
  end;
end;

procedure TfrmSearchInFiles.cbDirectoriesClick(Sender: TObject);
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

procedure TfrmSearchInFiles.FormActivate(Sender: TObject);
begin
  if comboDirectories.Enabled then
    if (comboDirectories.Items.Count > 0) then comboDirectories.ItemIndex:= 0;
  if comboFileMasks.Enabled then
    if (comboFileMasks.Items.Count > 0) then comboFileMasks.ItemIndex:= 0;
end;

end.
