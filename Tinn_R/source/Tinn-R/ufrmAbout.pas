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

unit ufrmAbout;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, jpeg, Dialogs, ComCtrls, JvgPage;

type
  TfrmAbout = class(TForm)
    bbtOK: TBitBtn;
    Copyright: TLabel;
    FreeRes: TLabel;
    imgAboutMain: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblURLSourceforge: TLabel;
    lblURLWebPage: TLabel;
    lVersion: TLabel;
    memAboutAknowledgments: TMemo;
    memAboutCredits: TMemo;
    memAboutProject: TMemo;
    pgAbout: TJvgPageControl;
    PhysMem: TLabel;
    tbsAboutAcknowledgments: TTabSheet;
    tbsAboutCredits: TTabSheet;
    tbsAboutProject: TTabSheet;
    tbsAboutVersion: TTabSheet;
    bbHelp: TBitBtn;
    
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblMailJCFariaClick(Sender: TObject);
    procedure lblMailPhilippeClick(Sender: TObject);
    procedure lblURLCRANClick(Sender: TObject);
    procedure lblURLNotesClick(Sender: TObject);
    procedure lblURLSourceforgeClick(Sender: TObject);
    procedure lblURLSourceforgeMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblURLTinnClick(Sender: TObject);
    procedure lblURLWebPageClick(Sender: TObject);
    procedure lblURLWebPageMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure tbsAboutVersionMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure bbHelpClick(Sender: TObject);

  private
    { Private declarations }
    resShellExecute : HINST;

    //procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    {$HINTS OFF}
    function MessageDlg(const sMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
    {$HINTS ON}
  public
    { Public declarations }
    imTinnLogo : TJPEGImage;
    //function GetBuildInfo : string;
  end;

var
  frmAbout: TfrmAbout;

implementation

uses
  ufrmMain,
  trUtils;

{$R *.DFM}
procedure TfrmAbout.FormCreate(Sender: TObject);
var
  MS         : TMemoryStatus;
  sPathTinnR,
   sPathBMP  : string;

begin
  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"',
                                 MS.dwTotalPhys / 1024);

  FreeRes.Caption := Format('%d %%',
                            [MS.dwMemoryLoad]);

  lVersion.Caption:= lVersion.Caption +
                     ' ' +
                     frmTinnMain.GetBuildInfo;
                     //+ ' ' +
                     //'RC';

  sPathTinnR:= ExtractFilePath(Application.ExeName);

  Delete(sPathTinnR,
         length(sPathTinnR) - 4,
         5);  //Exclude '\bin\' of path

  sPathBMP:= sPathTinnR +
             '\res\logo.jpg';

  imTinnLogo:= TJPEGImage.Create;

  imTinnLogo.LoadFromFile(sPathBMP);

  pgAbout.ActivePage:= tbsAboutVersion;
end;

{
function TfrmAbout.GetBuildInfo : string;
var
  VerInfoSize:  DWORD;
  VerInfo:      Pointer;
  VerValueSize: DWORD;
  VerValue:     PVSFixedFileInfo;
  Dummy:        DWORD;
  wV1:          Word;
  wV2:          Word;
  wV3:          Word;
  wV4:          Word;

begin
  VerInfoSize:= GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do begin
    wV1:= dwFileVersionMS shr 16;
    wV2:= dwFileVersionMS and $FFFF;
    wV3:= dwFileVersionLS shr 16;
    wV4:= dwFileVersionLS and $FFFF;
  end;
  FreeMem(VerInfo, VerInfoSize);
  Result:= InttoStr(wV1) + '.' + InttoStr(wV2) + '.' + InttoStr(wV3) + '.' + InttoStr(wV4);
end;
}

procedure TfrmAbout.lblURLTinnClick(Sender: TObject);
begin
  OpenUrl('tinn.solarvoid.com');
end;

procedure TfrmAbout.lblMailJCFariaClick(Sender: TObject);
var
  sMail : string;

begin
  sMail:= 'mailto:joseclaudio.faria@gmail.com' +
          '?cc=phgrosjean@sciviews.org' +
          '&subject=Tinn-R suggestions/comments';

  resShellExecute:= ShellExecute(0,
                                 'open',
                                 PChar(sMail),
                                 nil,
                                 nil,
                                 1);

  if (resShellExecute <= 32) then PSendMessage(resShellExecute);
end;

procedure TfrmAbout.lblURLCRANClick(Sender: TObject);
begin
  resShellExecute:= ShellExecute(0,
                                 'open',
                                 Pchar('http://www.r-project.org'),
                                 nil,
                                 nil,
                                 sw_shownormal);

  if (resShellExecute <= 32) then PSendMessage(resShellExecute);
end;

procedure TfrmAbout.lblURLWebPageClick(Sender: TObject);
begin
  OpenUrl('nbcgib.uesc.br/lec/software/editores/tinn-r/en');
end;

procedure TfrmAbout.lblURLWebPageMouseMove(Sender: TObject;
                                           Shift: TShiftState;
                                           X,
                                           Y: Integer);
begin
  lblURLWebPage.Cursor:= crHandPoint;
end;

procedure TfrmAbout.lblMailPhilippeClick(Sender: TObject);
var
  mail : string;

begin
  mail:= 'mailto:phgrosjean@sciviews.org' +
          '?cc=joseclaudio.faria@gmail.com' +
          '&subject=Tinn-R suggestions/comments';

  resShellExecute:= ShellExecute(0,
                                 'open',
                                 PChar(mail),
                                 nil,
                                 nil,
                                 1);

  if (resShellExecute <= 32) then PSendMessage(resShellExecute);
end;

procedure TfrmAbout.lblURLNotesClick(Sender: TObject);
begin
  OpenUrl('notes.codigolivre.org.br/');
end;

function TfrmAbout.MessageDlg(const sMsg: string;
                              DlgType: TMsgDlgType;
                              Buttons: TMsgDlgButtons;
                              HelpCtx: Integer): Integer;
begin
  with CreateMessageDialog(sMsg,
                           DlgType,
                           Buttons) do
    try
      Position:= poOwnerFormCenter;
      Result:= ShowModal
    finally
      Free;
    end
end;

procedure TfrmAbout.FormPaint(Sender: TObject);
begin
  imgAboutMain.Canvas.Draw(0,
                           0,
                           imTinnLogo);
end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  // To enable change active page with CTRL+TAB (next) and CTRL+SHIFT+TAB (prior)
  pgAbout.SetFocus;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmAbout.FormDestroy(Sender: TObject);
begin
  FreeAndNil(imTinnLogo);
end;

procedure TfrmAbout.lblURLSourceforgeClick(Sender: TObject);
begin
  OpenUrl('sourceforge.net/projects/tinn-r');
end;

procedure TfrmAbout.lblURLSourceforgeMouseMove(Sender: TObject;
                                               Shift: TShiftState;
                                               X,
                                               Y: Integer);
begin
  lblURLSourceforge.Cursor:= crHandPoint;
end;

procedure TfrmAbout.tbsAboutVersionMouseMove(Sender: TObject;
                                             Shift: TShiftState;
                                             X,
                                             Y: Integer);
begin
  lblURLWebPage.Font.Style:= [];
  lblURLSourceforge.Font.Style:= [];
end;

procedure TfrmAbout.bbHelpClick(Sender: TObject);
begin
  frmTinnMain.OpenUserGuidePDF('"Contents"');
end;

procedure TfrmAbout.FormActivate(Sender: TObject);
begin
  with frmTinnMain do begin
    pgAbout.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;

    with memAboutProject do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with memAboutAknowledgments do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;

    with memAboutCredits do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
  end;
end;

end.
