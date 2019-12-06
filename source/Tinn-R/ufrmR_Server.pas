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

unit ufrmR_Server;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ScktComp, JvgPage;

type
  TfrmR_Server = class(TForm)
    bbtRserverClose: TBitBtn;
    bbtRserverSave: TBitBtn;
    btnClearMemoTCPIP: TButton;
    btnConnectTCPIP: TButton;
    btnDisconnectTCPIP: TButton;
    btnSendTCPIP: TButton;
    chbIPConnected: TCheckBox;
    edtIPClient: TEdit;
    edtIPClientIP: TEdit;
    edtIPHostLocal: TEdit;
    edtIPHostRemote: TEdit;
    edtIPPortLocal: TEdit;
    edtIPPortRemote: TEdit;
    edtSend: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    memRTCPIP: TMemo;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    pgIP: TJvgPageControl;
    pgRserver: TJvgPageControl;
    rdgIPType: TRadioGroup;
    tbsIPLocal: TTabSheet;
    tbsIPRemote: TTabSheet;
    tbsTCPIP: TTabSheet;
    
    //procedure edtSendKeyPress(Sender: TObject; var Key: Char);
    procedure bbtRserverCloseClick(Sender: TObject);
    procedure bbtRserverSaveClick(Sender: TObject);
    procedure btnClearMemoTCPIPClick(Sender: TObject);
    procedure btnConnectTCPIPClick(Sender: TObject);
    procedure btnDisconnectTCPIPClick(Sender: TObject);
    procedure btnSendTCPIPClick(Sender: TObject);
    procedure edtSendKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure memRTCPIPKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure rdgIPTypeClick(Sender: TObject);

  private
    { Private declarations }
    procedure pSaveOptions;

  public
    { Public declarations }
  end;

var
  frmR_Server: TfrmR_Server;

implementation

uses
  ufrmMain,
  trCodeSender,
  trUtils,
  ufrmR_Term;

{$R *.dfm}

procedure TfrmR_Server.FormShow(Sender: TObject);
begin
  pgRserver.TabIndex:= 0;
  with frmMain do begin
    if bIPLocal then rdgIPType.ItemIndex:= 0
                else rdgIPType.ItemIndex:= 1;
    edtIPHostLocal.Text := sIPHostLocal;
    edtIPPortLocal.Text := intToStr(iIPPortLocal);
    edtIPHostRemote.Text:= sIPHostRemote;
    edtIPPortRemote.Text:= intToStr(iIPPortRemote);
    if csRGeneral.Active then begin
      chbIPConnected.Checked    := True;
      edtIPClientIP.Text        := csRGeneral.Socket.LocalAddress;
      edtIPClient.Text          := csRGeneral.Socket.LocalHost;
      btnSendTCPIP.Enabled      := True;
      btnConnectTCPIP.Enabled   := False;
      btnDisconnectTCPIP.Enabled:= True;
      edtSend.SetFocus;
    end
    else begin
      chbIPConnected.Checked    := False;
      edtIPClientIP.Text        := '';
      edtIPClient.Text          := '';
      btnConnectTCPIP.Enabled   := True;
      btnDisconnectTCPIP.Enabled:= False;
      btnSendTCPIP.Enabled      := False;
    end;
  end;
end;

procedure TfrmR_Server.pSaveOptions;
begin
  with frmMain do begin
    if (rdgIPType.ItemIndex = 0) then bIPLocal:= True
                                 else bIPLocal:= False;
    sIPHostLocal := edtIPHostLocal.Text;
    iIPPortLocal := StrToInt(edtIPPortLocal.Text);
    sIPHostRemote:= edtIPHostRemote.Text;
    iIPPortRemote:= StrToInt(edtIPPortRemote.Text);
  end;
end;

procedure TfrmR_Server.bbtRserverCloseClick(Sender: TObject);
begin
  pSaveOptions;
  Close;
end;

procedure TfrmR_Server.btnConnectTCPIPClick(Sender: TObject);
begin
  with frmMain do
    actRCont_TCPConnectionExecute(nil);
end;

procedure TfrmR_Server.btnDisconnectTCPIPClick(Sender: TObject);
var
  sStop: string;

begin
  with frmMain do begin
    sStop:= 'stopSocketServer(port=' +
            IntToStr(iIPPortLocal) +
            ')';

    // Related to R (Gui or Term) local
    if frmR_Term.bRTerm_Running and
       bIPLocal then begin
      pDo_RConnection(sStop,
                      False,
                      True);
      Exit;
    end;

    // Related to R (Gui or Term) remote
    if not bIPLocal then begin
      pDo_RConnection(sStop,
                      False,
                      False);
      Exit;
    end;

    // Related to RGui
    if (hRGui <> 0) then pDo_RGuiConnection(sStop,
                                            False);
  end;
end;

procedure TfrmR_Server.btnClearMemoTCPIPClick(Sender: TObject);
begin
  memRTCPIP.Clear;
end;

procedure TfrmR_Server.btnSendTCPIPClick(Sender: TObject);
var
  sTmp,
   sToSend: string;

begin
  sTmp   := Trim(edtSend.text);
  sToSend:= sTmp +
            #13#10;
  with memRTCPIP do begin
    Lines.BeginUpdate;
    Lines.Add('> ' +
              sTmp);
    Lines.EndUpdate;
  end;
  with frmMain do begin
    with frmR_Term.synIO do
      if (LineText = '> ') then pPrint_Message(sTmp,
                                               False)
                           else pPrint_Message(sTmp,
                                               True);
    csRGeneral.Socket.SendText(sToSend);
  end;
  edtSend.SetFocus;
  edtSend.SelectAll;
end;

procedure TfrmR_Server.bbtRserverSaveClick(Sender: TObject);
begin
  pSaveOptions;
end;

{
procedure TfrmRserver.edtSendKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if frmMain.fUseTCPIP then btnSendTCPIPClick(Self);
end;
}

procedure TfrmR_Server.FormActivate(Sender: TObject);
begin
  with frmMain do begin
    pgRserver.TabSelectedStyle.BackgrColor:= clBG_TabSelectedNew;
    pgIP.TabSelectedStyle.BackgrColor:= clBG_TabSelectedNew;

    with memRTCPIP do begin
      Color     := clBG_Application;
      Font.Color:= clFG_Application;
    end;
  end;
end;

procedure TfrmR_Server.rdgIPTypeClick(Sender: TObject);
begin
  if (rdgIPType.ItemIndex = 0) then begin
    frmMain.bIPLocal:= True;
    pgIP.ActivePage:= tbsIPLocal
  end
  else begin
    frmMain.bIPLocal:= False;
    pgIP.ActivePage:= tbsIPRemote;
  end;
end;

procedure TfrmR_Server.edtSendKeyDown(Sender: TObject;
                                     var Key: Word;
                                     Shift: TShiftState);
begin
  if (Key = VK_RETURN) then begin
    if frmMain.fUseTCPIP then btnSendTCPIPClick(Self);
    edtSend.SetFocus;
    edtSend.SelectAll;
  end;
  if (Shift = [ssCtrl]) then
    case Key of
      76: memRTCPIP.Clear
    end;
end;

procedure TfrmR_Server.memRTCPIPKeyDown(Sender: TObject;
                                       var Key: Word;
                                       Shift: TShiftState);
begin
  if (Shift = [ssCtrl]) then
    case Key of
      76: memRTCPIP.Clear
    end;
end;

end.
