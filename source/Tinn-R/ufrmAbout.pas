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
  SynEdit, JvExExtCtrls, JvImage, DateUtils;

type
  TfrmAbout = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    lCopyright: TLabel;
    Label1: TLabel;
    lblURLSourceforge: TLabel;
    lblURLWebPage: TLabel;
    lVersion: TLabel;
    pgAbout: TJvgPageControl;
    tbsAboutAcknowledgments: TTabSheet;
    tbsAboutCredits: TTabSheet;
    tbsAboutProject: TTabSheet;
    tbsAboutVersion: TTabSheet;
    tbsDonation: TTabSheet;
    Label6: TLabel;
    synAboutProject: TSynEdit;
    synAboutAknowledgments: TSynEdit;
    synAboutCredits: TSynEdit;
    synAboutDonation: TSynEdit;
    im1: TImage;
    im2: TImage;
    tbsLicensing: TTabSheet;
    synLicensing: TSynEdit;

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
    procedure synAboutProjectKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synAboutAknowledgmentsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synAboutCreditsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synAboutDonationKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgAboutChange(Sender: TObject);
    procedure synLicensingClick(Sender: TObject);
    procedure synLicensingKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
    resShellExecute : HINST;

    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
    procedure pCtrl_Tab(bNext: boolean = True);

    {$HINTS OFF}
    function fMessageDlg(const sMsg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
    {$HINTS ON}
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses
  ufrmMain,
  trSynUtils,
  trUtils,
  uDMSyn;

{$R *.DFM}
procedure TfrmAbout.FormCreate(Sender: TObject);
var
  jpg: TJPegImage;
//  MS: TMemoryStatus;

begin
//  GlobalMemoryStatus(MS);
//  PhysMem.Caption := FormatFloat('#,###" KB"',
//                                 MS.dwTotalPhys / 1024);

//  FreeRes.Caption := Format('%d %%',
//                            [MS.dwMemoryLoad]);

  jpg:= TJPegImage.Create;
  jpg.LoadFromFile(frmMain.sPath_TinnR +
                   '\res\' +
                   'logo_long.jpg');

  im1.Canvas.Draw(0, 0, jpg);
  jpg.Free;

  jpg:= TJPegImage.Create;
  jpg.LoadFromFile(frmMain.sPath_TinnR +
                   '\res\' +
                   'footer_long.jpg');

  im2.Canvas.Draw(0, 0, jpg);
  jpg.Free;

  lVersion.Caption:= lVersion.Caption +
                     ' ' +
                     frmMain.fGetBuild_Info;
                     //' ' +
                     //'RC';

  with frmMain do
    if not bLicencing_Focus then pgAbout.ActivePage:= tbsAboutVersion
                            else pgAbout.ActivePage:= tbsLicensing;
end;

procedure TfrmAbout.lblURLTinnClick(Sender: TObject);
begin
  pOpen_Url('http://tinn.solarvoid.com');
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

  if (resShellExecute <= 32) then pSend_Message(resShellExecute);
end;

procedure TfrmAbout.lblURLCRANClick(Sender: TObject);
begin
  resShellExecute:= ShellExecute(0,
                                 'open',
                                 Pchar('http://www.r-project.org'),
                                 nil,
                                 nil,
                                 sw_shownormal);

  if (resShellExecute <= 32) then pSend_Message(resShellExecute);
end;

procedure TfrmAbout.lblURLWebPageClick(Sender: TObject);
begin
// History of the project websites :)
//  pOpen_Url('http://nbcgib.uesc.br/lec/software/editores/tinn-r/en');
//  pOpen_Url('https://nbcgib.uesc.br/tinnr/en/');
  pOpen_Url('https://tinn-r.org/en/');
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

  if (resShellExecute <= 32) then pSend_Message(resShellExecute);
end;

procedure TfrmAbout.lblURLNotesClick(Sender: TObject);
begin
  pOpen_Url('http://notes.codigolivre.org.br/');
end;

procedure TfrmAbout.synAboutAknowledgmentsClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synAboutAknowledgments;
end;

procedure TfrmAbout.synAboutCreditsClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synAboutCredits;
end;

procedure TfrmAbout.synAboutDonationClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synAboutDonation;
end;

procedure TfrmAbout.synAboutProjectClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synAboutProject;
end;

procedure TfrmAbout.pCtrl_Tab(bNext: boolean = True);
begin
  if bNext then begin
    if (pgAbout.ActivePageIndex = pgAbout.PageCount - 1) then pgAbout.ActivePageIndex:= 0
                                                         else pgAbout.ActivePageIndex:= pgAbout.ActivePageIndex + 1;
  end
  else begin
    if (pgAbout.ActivePageIndex = 0) then pgAbout.ActivePageIndex:= pgAbout.PageCount - 1
                                     else pgAbout.ActivePageIndex:= pgAbout.ActivePageIndex - 1
  end;
end;

procedure TfrmAbout.pgAboutChange(Sender: TObject);
begin

end;

// The four procedures below are a bit redundant, but are working well.
procedure TfrmAbout.synAboutProjectKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);

  Key:= VK_PAUSE;
end;

procedure TfrmAbout.synLicensingClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synLicensing;
end;

procedure TfrmAbout.synLicensingKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);

  Key:= VK_PAUSE;
end;

procedure TfrmAbout.synAboutAknowledgmentsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);

  Key:= VK_PAUSE;
end;

procedure TfrmAbout.synAboutCreditsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);

  Key:= VK_PAUSE;
end;

procedure TfrmAbout.synAboutDonationKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);

  Key:= VK_PAUSE;
end;

procedure TfrmAbout.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;

  with lCopyright do
    Caption:= Caption + '2001 - ' + IntToStr(DateUtils.YearOf(Date));
end;

procedure TfrmAbout.imgDonationClick(Sender: TObject);
begin
  pOpen_Url('http://paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=B5GDCSVXH6JV4');
end;

procedure TfrmAbout.lblURLSourceforgeClick(Sender: TObject);
begin
  pOpen_Url('http://sourceforge.net/projects/tinn-r');
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
  frmMain.pOpen_UserGuidePDF('"Contents"');
end;

procedure TfrmAbout.FormActivate(Sender: TObject);
begin
  with frmMain do
    pgAbout.TabSelectedStyle.BackgrColor:= clBG_TabSelectedNew;

  with synAboutProject do begin
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if frmMain.bActiveLine then ActiveLineColor:= TColor(frmMain.clActiveLine)
                           else ActiveLineColor:= TColor(clNone);
  end;

  with synAboutAknowledgments do begin
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if frmMain.bActiveLine then ActiveLineColor:= TColor(frmMain.clActiveLine)
                           else ActiveLineColor:= TColor(clNone);
  end;

  with synAboutCredits do begin
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if frmMain.bActiveLine then ActiveLineColor:= TColor(frmMain.clActiveLine)
                           else ActiveLineColor:= TColor(clNone);
  end;

  with synAboutDonation do begin
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if frmMain.bActiveLine then ActiveLineColor:= TColor(frmMain.clActiveLine)
                           else ActiveLineColor:= TColor(clNone);
  end;

  with synLicensing do begin
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if frmMain.bActiveLine then ActiveLineColor:= TColor(frmMain.clActiveLine)
                           else ActiveLineColor:= TColor(clNone);
  end;

  // Update the appearance based in the editor
  with frmMain.coEditor do begin
    AssignTo(synAboutProject);
    AssignTo(synAboutAknowledgments);
    AssignTo(synAboutCredits);
    AssignTo(synAboutDonation);
    AssignTo(synLicensing);
  end;

  synAboutProject.Highlighter       := dmSyn.synURI;
  synAboutAknowledgments.Highlighter:= dmSyn.synURI;
  synAboutCredits.Highlighter       := dmSyn.synURI;
  synAboutDonation.Highlighter      := dmSyn.synURI;
  synLicensing.Highlighter          := dmSyn.synURI;
  
  synAboutProject.Gutter.ShowLineNumbers       := False;
  synAboutAknowledgments.Gutter.ShowLineNumbers:= False;
  synAboutCredits.Gutter.ShowLineNumbers       := False;
  synAboutDonation.Gutter.ShowLineNumbers      := False;
  synLicensing.Gutter.ShowLineNumbers          := False;

  // I think it is better to fix the font (name e size) here!
  synAboutProject.Font.Name       := 'Consolas';
  synAboutAknowledgments.Font.Name:= 'Consolas';
  synAboutCredits.Font.Name       := 'Consolas';
  synAboutDonation.Font.Name      := 'Consolas';
  synLicensing.Font.Name          := 'Consolas';

  synAboutProject.Font.Size       := 11;
  synAboutAknowledgments.Font.Size:= 11;
  synAboutCredits.Font.Size       := 11;
  synAboutDonation.Font.Size      := 11;
  synLicensing.Font.Size          := 11;
end;

procedure TfrmAbout.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Message.CharCode = VK_TAB) and (GetKeyState(VK_CONTROL) < 0) then begin
    if (GetKeyState(VK_SHIFT) < 0) then begin  // Shift is pressed
      if (pgAbout.ActivePageIndex = 0) then pgAbout.ActivePageIndex:= pgAbout.PageCount - 1
                                       else pgAbout.ActivePageIndex:= pgAbout.ActivePageIndex - 1;
    end
    else begin  // Shift is not pressed
      if (pgAbout.ActivePageIndex = pgAbout.PageCount - 1) then pgAbout.ActivePageIndex:= 0
                                                           else pgAbout.ActivePageIndex:= pgAbout.ActivePageIndex + 1
    end;

    Message.Result:= 1;
  end
  else inherited;
end;

function TfrmAbout.fMessageDlg(const sMsg: string;
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

end.
