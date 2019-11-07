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

 Development:
   V2: 16/10/2016 10:21:00
   Kramer, P.A.R
   Faria, J.C

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

unit ufrmUpdater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ExtCtrls, ComCtrls, JPEG, ShellAPI, UrlMon, JvBaseDlg, JvBrowseFolder;

type
  TfrmUpdater = class(TForm)
    lBytes: TLabel;
    btCancel: TButton;
    pbDownload: TProgressBar;
    btDownload: TButton;
    edAvailable: TEdit;
    edCurrent: TEdit;
    GroupBox1: TGroupBox;
    im1: TImage;
    im2: TImage;
    lInfo: TLabel;
    btInstall: TButton;
    Label1: TLabel;
    Label2: TLabel;
    lWhatIsNew: TLabel;
    lStatus: TLabel;
    edDate: TEdit;
    Label3: TLabel;
    JvBrowseForFolder: TJvBrowseForFolderDialog;

    function fGetDownloadSize: string;
    function fIsThereNewVersion: boolean;
    function fMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
    function fReturnPercentage(rMaxValue, rCurrentValue: real): string;
    function fReturnKBs(CurrentValue: real): string;

    procedure pIdHTTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: Integer);
    procedure pIdHTTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: Integer);
    procedure pIdHTTPWorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure btDownloadClick(Sender: TObject);
    procedure btInstallClick(Sender: TObject);
    procedure lWhatIsNewClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  public
    //

  private
    IdHTTP          : TIdHTTP;
    sCurrent_Version: string;
    sDownload_Link  : string;
    sDownload_Size  : string;
    sDownload_Save  : string;
    sFileName       : string;
    sNew_Version    : string;
  end;

var
  frmUpdater: TfrmUpdater;

implementation

uses
  ufrmMain,
  trUtils;

{$R *.dfm}
procedure TfrmUpdater.pIdHTTPWork(ASender: TObject;
                                  AWorkMode: TWorkMode;
                                  AWorkCount: Integer);
begin
  Application.ProcessMessages;
  pbDownload.Position:= AWorkCount;

  lBytes.Caption:= fReturnKBs(AWorkCount) +
                   '/' +
                   sDownload_Size;

  lStatus.Caption:= 'Downloading ... ' +
                    fReturnPercentage(pbDownload.Max,
                                      AWorkCount);

  frmUpdater.Caption:= 'Download in ... ' +
                       fReturnPercentage(pbDownload.Max,
                                         AWorkCount);
end;

procedure TfrmUpdater.pIdHTTPWorkBegin(ASender: TObject;
                                       AWorkMode: TWorkMode;
                                       AWorkCountMax: Integer);
begin
  pbDownload.Max:= AWorkCountMax;

  lBytes.Visible:= True;
  lBytes.Parent := pbDownload;

  lBytes.Transparent:= True;
  lBytes.AutoSize   := False;

  lBytes.Top   := 0;
  lBytes.Left  := 0;
  lBytes.Width := pbDownload.ClientWidth;
  lBytes.Height:= pbDownload.ClientHeight;

  lBytes.Alignment:= taCenter;
  lBytes.Layout   := tlCenter;
end;

procedure TfrmUpdater.pIdHTTPWorkEnd(ASender: TObject;
                                     AWorkMode: TWorkMode);
begin
  frmUpdater.Caption:= 'Completed ...';
  lStatus.Caption   := 'Download finished ...';

  btDownload.Visible:= False;
  if fIs_Portable_Version then begin  // portable
    btCancel.Caption:= 'Close';

    Windows.Beep(600, 800);
    fMessageDlg(sDownload_Save + #13#13 +
                'The new version download has been saved in the above folder!' + #13 +
                'Please, unzip it manually where you wish.' + #13#13 +
                'You can do a backup of yours preferences (Tools/Backup) and restore (Tools/Restore) it in the new one.',
                mtInformation,
                [mbOk],
                0);
  end
  else begin
    btCancel.Visible := False;
    btInstall.Visible:= True;
  end;
end;

procedure TfrmUpdater.btDownloadClick(Sender: TObject);
var
  fsTmp: TFileStream;

  sPath: string;

begin
  IdHTTP:= TIdHTTP.Create;
  with IdHTTP do begin
    Request.UserAgent:= 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:12.0) Gecko/20100101 Firefox/12.0'; // Avoid getting '403 Forbidden' by setting UserAgent

    OnWork     := pIdHTTPWork;
    OnWorkBegin:= pIdHTTPWorkBegin;
    OnWorkEnd  := pIdHTTPWorkEnd;
  end;

  pbDownload.Visible:= True;
  btDownload.Enabled:= False;
  lStatus.Visible   := True;
  lWhatIsNew.Visible:= False;

  if fIs_Portable_Version then sFileName:= 'Tinn-R_' +
                                           sNew_Version +
                                           '_portable.zip'
                         else sFileName:= 'Tinn-R_' +
                                          sNew_Version +
                                          '_setup.exe';
  try
    // Portable.zip
    if fIs_Portable_Version then begin
      with frmMain.sdMain do begin
        Filter    := 'Tinn-R_portable (*.zip)|*.zip';
        DefaultExt:= '*.zip';
        FileName  := sFileName;
      end;

      with JvBrowseForFolder do begin
        Title:= 'Choose a directory to save the new (portable) version: ' +
                sFileName;

        if Execute then begin
          sDownload_Save:= Directory +
                           '\' +
                           sFileName;

          fsTmp:= TFileStream.Create(sDownload_Save,
                                     fmCreate);
        end;
      end;
    end
    else begin
      sPath:= frmMain.sPath_Tmp +
              '\' +
              sFileName;

      if FileExists(sPath) then DeleteFile(sPath);  // Delete any possible previous download

      fsTmp:= TFileStream.Create(frmMain.sPath_Tmp +
                                 '\' +
                                 sFileName,
                                 fmCreate);
    end;

    try
      sDownload_Link:= 'http://nbcgib.uesc.br/lec/update/' +
                       sFileName;

      sDownload_Size:= fGetDownloadSize;

      IdHTTP.Get(sDownload_Link,
                 fsTmp);
    except
      on E: Exception do
        Showmessage('ERROR: ' + E.Message);
    end;
  finally
    FreeAndNil(fsTmp);
  end;
end;

procedure TfrmUpdater.lWhatIsNewClick(Sender: TObject);
begin
  try
    HlinkNavigateString(nil,
                        'http://nbcgib.uesc.br/lec/software/editores/tinn-r/en#h9-what-is-new');
  except
    on E: Exception do
      Showmessage('ERROR: ' + E.Message);
  end;
end;

function TfrmUpdater.fIsThereNewVersion: boolean;
var
  sNew_Version_Date: string;

begin
  Result:= False;

  try
    // by J.C.Faria
    // All proposed regex works
    // https://regex101.com/r/9LJLFW/1
    //$re = '/\d{1}\.\d{2}\.\d{2}\.\d{2}(?=_setup.exe)/m';
    //$str = 'http://nbcgib.uesc.br/lec/download/software/Tinn-R_04.02.12.00_setup.exe
    //
    //http://tenet.dl.sourceforge.net/project/tinn-r/Tinn-R%20setup/4.2.17.0/Tinn-R_04.02.17.00_setup.exe';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // https://regex101.com/r/9LJLFW/2
    //$re = '/(\d){1}\.(\d{2}\.?){3}(?=_setup.exe)/m';
    //$str = 'http://nbcgib.uesc.br/lec/download/software/Tinn-R_04.02.12.00_setup.exe
    //
    //http://tenet.dl.sourceforge.net/project/tinn-r/Tinn-R%20setup/4.2.17.0/Tinn-R_04.02.17.00_setup.exe';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // https://regex101.com/r/9LJLFW/3
    //$re = '/\d{1}\.\d{2}\.\d{2}\.\d{2}(?=_(setup.exe|portable.zip))/m';
    //$str = 'http://nbcgib.uesc.br/lec/update/Tinn-R_5.02.03.00_portable.zip
    //http://nbcgib.uesc.br/lec/update/Tinn-R_5.02.03.00_setup.exe
    //
    //http://nbcgib.uesc.br/lec/download/software/Tinn-R_04.02.12.00_setup.exe
    //
    //http://tenet.dl.sourceforge.net/project/tinn-r/Tinn-R%20setup/4.2.17.0/Tinn-R_04.02.17.00_setup.exe';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    sNew_Version:= fRegEx(frmMain.sUpdate,
                          //'\d{1}\.\d{2}\.\d{2}\.\d{2}(?=_setup.exe)',              // https://regex101.com/r/9LJLFW/1 - More Simple!
                          //'(\d){1}\.(\d{2}\.?){3}(?=_setup.exe)',                  // https://regex101.com/r/9LJLFW/2
                          '\d{1}\.\d{2}\.\d{2}\.\d{2}(?=_(setup.exe|portable.zip))', // https://regex101.com/r/9LJLFW/3
                          False);

    // by J.C.Faria
    // https://regex101.com/r/Qy9rQf/1
    //$re = '/\d{2}-\w{3}-\d{4} \d{2}:\d{2}/m';
    //$str = '10-Oct-2016 18:02
    //>10-Oct-2016 18:02 </td>
    //blablabla10-Oct-2016 18:02blablabla
    //';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    sNew_Version_Date:= fRegEx(frmMain.sUpdate,
                               '\d{2}-\w{3}-\d{4} \d{2}:\d{2}',  // https://regex101.com/r/Qy9rQf/1
                               False);                           
  except
    on E: Exception do
    begin
      Showmessage('ERROR: ' +
                  E.Message);
      Exit;
    end;
  end;

//  sCurrent_Version:= '1.00.00.00';
  sCurrent_Version:= frmMain.fGetBuild_Info;

  edCurrent.Text  := sCurrent_Version;
  edAvailable.Text:= sNew_Version;
  edDate.Text     := sNew_Version_Date;

  if (AnsiCompareStr(sCurrent_Version,
                     sNew_Version) < 0) then Result:= True;  // The new version is more recent than the user version
end;

procedure TfrmUpdater.FormCloseQuery(Sender: TObject;
                                     var CanClose: Boolean);
begin
  if Assigned(IdHTTP) then begin
    IdHTTP.Disconnect;
    FreeAndNil(IdHTTP);
  end;
    
  CanClose:= True;
end;

procedure TfrmUpdater.FormCreate(Sender: TObject);
var
  jpg: TJPegImage;

begin
  jpg:= TJPegImage.Create;
  jpg.LoadFromFile(frmMain.sPath_TinnR +
                   '\res\' +
                   'logo_long.jpg');

  im1.Canvas.Draw(0, 0, jpg);
  jpg.Free;

  jpg:= TJPegImage.Create;
  jpg.LoadFromFile(frmMain.sPath_TinnR +
                   '\res\' +
                   'footer.jpg');

  im2.Canvas.Draw(0, 0, jpg);
  jpg.Free;

  // Button
  btDownload.Height:= 25;
  btDownload.Width := 100;
  btCancel.Height  := 25;
  btCancel.Width   := 100;
  btInstall.Height := 25;
  btInstall.Width  := 100;
  btInstall.Visible:= False;

  // ProgressBar
  pbDownload.Visible:= False;

  // Information Label
  lInfo.Caption:= '...';
  lInfo.Transparent:= True;

  lStatus.Visible:= False;
  lBytes.Visible := False;

  Left:= (GetSystemMetrics(SM_CXSCREEN) - Width) div 2;
  Top := (GetSystemMetrics(SM_CYSCREEN) - Height) div 2;

  lInfo.Caption:= 'Your Tinn-R version is up to date.';
end;

procedure TfrmUpdater.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;

  if(fIsThereNewVersion = True ) then
    lInfo.Caption:= 'A new version is available.' + #13 +
                    'Would you like to download it now?'
  else begin
    lWhatIsNew.Visible:= False;
    btDownload.Visible:= False;
  end;
end;

procedure TfrmUpdater.btInstallClick(Sender: TObject);
begin

  with frmMain do begin
    bUpdating:= True;
    Close;
  end;

  ShellExecute(Handle,
               'open',
               PChar(frmMain.sPath_Tmp +
                     '\' +
                     sFileName),
               nil,
               nil,
               sw_shownormal);
end;

function TfrmUpdater.fGetDownloadSize: string;
var
  rSize_Max: real;

begin
  with IdHTTP do
    Head(sDownload_Link);

  rSize_Max:= IdHTTP.Response.ContentLength;

  rSize_Max:= (rSize_Max / 1024) / 1024;

  result:= FormatFloat(' 0.000 KBs',
                       rSize_Max);
end;

function TfrmUpdater.fReturnPercentage(rMaxValue: real;
                                       rCurrentValue: real): string;
var
  rPercentValue: real;

begin
  rPercentValue:= ((rCurrentValue * 100) / rMaxValue);

  Result:= FormatFloat('0%',
                        rPercentValue);
end;

function TfrmUpdater.fReturnKBs(CurrentValue: real): string;
var
  rKBytes: real;

begin
  rKBytes:= ((CurrentValue / 1024) / 1024);

  Result:= FormatFloat('0.000 ',
                       rKBytes);
end;

function TfrmUpdater.fMessageDlg(const Msg: string;
                                 DlgType: TMsgDlgType;
                                 Buttons: TMsgDlgButtons;
                                 HelpCtx: Integer): Integer;
begin
  with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      Position:= poOwnerFormCenter;
      Result:= ShowModal;
    finally
      Free;
    end
end;

end.
