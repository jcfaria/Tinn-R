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

unit ufrmAbout;

interface

uses
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, jpeg, Dialogs, ComCtrls, JvgPage, pngimage,
  SynEdit, JvExExtCtrls, JvImage;

type
  TfrmAbout = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    Copyright: TLabel;
    Label1: TLabel;
    lblURLSourceforge: TLabel;
    lblURLWebPage: TLabel;
    lVersion: TLabel;
    pgAbout: TJvgPageControl;
    tbsAboutAcknowledgments: TTabSheet;
    tbsAboutCredits: TTabSheet;
    tbsAboutProject: TTabSheet;
    tbsAboutVersion: TTabSheet;
    TabSheet1: TTabSheet;
    imgDonation: TImage;
    Label3: TLabel;
    PhysMem: TLabel;
    Label4: TLabel;
    FreeRes: TLabel;
    Label6: TLabel;
    synAboutProject: TSynEdit;
    synAboutAknowledgments: TSynEdit;
    synAboutCredits: TSynEdit;
    synAboutDonation: TSynEdit;
    imAbout: TJvImage;

    procedure bbHelpClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
    procedure imgDonationClick(Sender: TObject);
    procedure synAboutProjectClick(Sender: TObject);
    procedure synAboutAknowledgmentsClick(Sender: TObject);
    procedure synAboutCreditsClick(Sender: TObject);
    procedure synAboutDonationClick(Sender: TObject);
    procedure imgDonationMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);

  private
    { Private declarations }
    resShellExecute : HINST;

    //procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;

    {$HINTS OFF}
    function MessageDlg(const sMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
    {$HINTS ON}
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses
  ufrmMain,
  trUtils,
  uDMSyn;

{$R *.DFM}
procedure TfrmAbout.FormCreate(Sender: TObject);
var
  MS: TMemoryStatus;

begin
  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"',
                                 MS.dwTotalPhys / 1024);

  FreeRes.Caption := Format('%d %%',
                            [MS.dwMemoryLoad]);

  lVersion.Caption:= lVersion.Caption +
                     ' ' +
                     frmTinnMain.GetBuildInfo;
                     //' ' +
                     //'RC';

  pgAbout.ActivePage:= tbsAboutVersion;
end;

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

procedure TfrmAbout.synAboutAknowledgmentsClick(Sender: TObject);
begin
  frmTinnMain.synURIOpener.Editor:= synAboutAknowledgments;
end;

procedure TfrmAbout.synAboutCreditsClick(Sender: TObject);
begin
  frmTinnMain.synURIOpener.Editor:= synAboutCredits;
end;

procedure TfrmAbout.synAboutDonationClick(Sender: TObject);
begin
  frmTinnMain.synURIOpener.Editor:= synAboutDonation;
end;

procedure TfrmAbout.synAboutProjectClick(Sender: TObject);
begin
  frmTinnMain.synURIOpener.Editor:= synAboutProject;
end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  // To enable change active page with CTRL+TAB (next) and CTRL+SHIFT+TAB (prior)
  pgAbout.SetFocus;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmAbout.imgDonationClick(Sender: TObject);
begin
  OpenUrl('paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=B5GDCSVXH6JV4');
end;

procedure TfrmAbout.imgDonationMouseMove(Sender: TObject;
                                         Shift: TShiftState;
                                         X,
                                         Y: Integer);
begin
  imgDonation.Cursor:= crHandPoint;
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
  with frmTinnMain do
    pgAbout.TabSelectedStyle.BackgrColor:= clBGTabSelectedNew;

  with synAboutProject do begin
    OnPaintTransient:= frmTinnMain.synPaintTransient;
    if frmTinnMain.bActiveLine then ActiveLineColor:= TColor(frmTinnMain.clActiveLine)
                               else ActiveLineColor:= TColor(clNone);
  end;

  with synAboutAknowledgments do begin
    OnPaintTransient:= frmTinnMain.synPaintTransient;
    if frmTinnMain.bActiveLine then ActiveLineColor:= TColor(frmTinnMain.clActiveLine)
                               else ActiveLineColor:= TColor(clNone);
  end;

  with synAboutCredits do begin
    OnPaintTransient:= frmTinnMain.synPaintTransient;
    if frmTinnMain.bActiveLine then ActiveLineColor:= TColor(frmTinnMain.clActiveLine)
                               else ActiveLineColor:= TColor(clNone);
  end;

  with synAboutDonation do begin
    OnPaintTransient:= frmTinnMain.synPaintTransient;
    if frmTinnMain.bActiveLine then ActiveLineColor:= TColor(frmTinnMain.clActiveLine)
                               else ActiveLineColor:= TColor(clNone);
  end;

  // Update the appearance based in the editor
  with frmTinnMain.coEditor do begin
    AssignTo(synAboutProject);
    AssignTo(synAboutAknowledgments);
    AssignTo(synAboutCredits);
    AssignTo(synAboutDonation);
  end;

  synAboutProject.Highlighter       := dmSyn.synURI;
  synAboutAknowledgments.Highlighter:= dmSyn.synURI;
  synAboutCredits.Highlighter       := dmSyn.synURI;
  synAboutDonation.Highlighter      := dmSyn.synURI;

  synAboutProject.Gutter.ShowLineNumbers:= False;
  synAboutAknowledgments.Gutter.ShowLineNumbers:= False;
  synAboutCredits.Gutter.ShowLineNumbers:= False;
  synAboutDonation.Gutter.ShowLineNumbers:= False;
end;

end.
