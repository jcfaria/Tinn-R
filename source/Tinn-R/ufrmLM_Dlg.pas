unit ufrmLM_Dlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Mask, JvExMask, JvSpin, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase,
  IdMessage, IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdText, SynEdit, EditAlign, JvTimer, AbArcTyp, DateUtils; 


type
  TDef_Rec = record
    sField_Name       : string[20];
    sField_Value      : string[40];
    iField_Length     : integer;
    iMax_Field_Length : integer;
    bVariable_Flag    : boolean;
  end;

  TDef_Encrypt = record
    sEncrypt: string[36];
  end;

type
  TfrmLM_Dlg = class(TForm)
    btRequest: TBitBtn;
    GroupBox1: TGroupBox;
    edUser_First_Name: TEdit;
    edUser_Country: TEdit;
    edUser_Organization: TEdit;
    edUser_Email: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btRegister: TBitBtn;
    GroupBox2: TGroupBox;
    rdgLicense_Type: TRadioGroup;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    gpbJustificative: TGroupBox;
    Label9: TLabel;
    edUser_Occupation: TEdit;
    btImport_From_File: TBitBtn;
    synLM: TSynEdit;
    Label6: TLabel;
    edUser_Last_Name: TEdit;
    Label7: TLabel;
    edUser_Serial: TEdit;
    Label10: TLabel;
    edLicense_Start: TEdit;
    Label11: TLabel;
    edLicense_End: TEdit;
    Label12: TLabel;
    edUser_Key: TEditAlign;
    edUser_Justificative: TEditAlign;
    BitBtn1: TBitBtn;
    tLicence_Check: TJvTimer;
    cbLicence_Notification_End: TCheckBox;
    edLicense_Remaining: TEdit;
    Label8: TLabel;

    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure edUser_First_NameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUser_CountryKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUser_OrganizationKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUser_EmailKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUser_First_NameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edUser_CountryMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edUser_OrganizationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure edUser_EmailMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btRequestClick(Sender: TObject);
    procedure edUser_OccupationKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUser_OccupationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure btRegisterClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btImport_From_FileClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure synLMClick(Sender: TObject);
    procedure edUser_First_NameKeyPress(Sender: TObject; var Key: Char);
    procedure edUser_Last_NameKeyPress(Sender: TObject; var Key: Char);
    procedure edUser_CountryKeyPress(Sender: TObject; var Key: Char);
    procedure edUser_OrganizationKeyPress(Sender: TObject; var Key: Char);
    procedure edUser_OccupationKeyPress(Sender: TObject; var Key: Char);
    procedure edUser_JustificativeKeyPress(Sender: TObject; var Key: Char);
    procedure tLicence_CheckTimer(Sender: TObject);
    procedure rdgLicense_TypeClick(Sender: TObject);
    procedure cbLicence_Notification_EndClick(Sender: TObject);

  private
    { Private declarations }

    sUser_Serial         : string;
    arData_Recs          : array of TDef_Rec;
    arData_Encrypt       : array of TDef_Encrypt;
    arEncrypt            : array of string;
    arDecrypted          : array of string;
    iLicense_Last_Warning: integer;

    function fUserData_Complete: boolean;
    function fLicense_Remaining: integer;
    function fLicence_Validade: boolean;
    function fMessageDlg(const sMsg: string; mdType: TMsgDlgType; mdButtons: TMsgDlgButtons; iHelp: Integer): Integer;

    procedure pLicense_Time_Remaining;

  public
    { Public declarations }

    procedure pLicence_Check;
  end;

var
  frmLM_Dlg: TfrmLM_Dlg;

implementation

uses
  ufrmMain,
  trUtils,
  trSynUtils,
  udmSyn;

{$R *.dfm}

// Based: http://delphiforfun.org/Programs/Delphi_Techniques/LicenseKeyGen.htm
function TfrmLM_Dlg.fLicence_Validade: boolean;

  function fRead_License_Data: boolean;
  var
    sPath_License_Data: string;

    fsStream: TFileStream;

    i: integer;

  begin
    // Read data.bin
    // Adapted from: https://stackoverflow.com/questions/35404596/delphi-saving-loading-dynamic-arrays-failed?noredirect=1&lq=1
    sPath_License_Data:= frmMain.sPath_License +
                         '\data.bin';

    // If the file does not exist, do not need to proceed: Result -> False
    if not FileExists(sPath_License_Data) then begin
      Result:= False;
      Exit;
    end;

    try
      fsStream:= TFileStream.Create(sPath_License_Data,
                                    fmOpenRead);

      SetLength(arData_Recs,
                Round(fsStream.Size/SizeOf(TDef_Rec)));

      for i:= 0 to (Length(arData_Recs) - 1) do
        fsStream.ReadBuffer(arData_Recs[i],
                            SizeOf(TDef_Rec));  // Loading array

      Result:= True;
    finally
      FreeAndNil(fsStream);
    end;
  end;

  function fRead_License_Encrypt: boolean;
  var
    sPath_License_Encrypt: string;

    fsStream: TFileStream;

    i: integer;

  begin
    // Read Encrypt.bin
    // Adapted from: https://stackoverflow.com/questions/35404596/delphi-saving-loading-dynamic-arrays-failed?noredirect=1&lq=1
    sPath_License_Encrypt:= frmMain.sPath_License +
                            '\encrypt.bin';

    // If the file does not exist, do not need to proceed: Result -> False
    if not FileExists(sPath_License_Encrypt) then begin
      Result:= False;
      Exit;
    end;

    try
      fsStream:= TFileStream.Create(sPath_License_Encrypt,
                                    fmOpenRead);

      SetLength(arData_Encrypt,
                Round(fsStream.Size/SizeOf(TDef_Encrypt)));

      for i:= 0 to (Length(arData_Encrypt) - 1) do
        fsStream.ReadBuffer(arData_Encrypt[i],
                            SizeOf(TDef_Encrypt));  // Loading array

      SetLength(arEncrypt,
                Length(arData_Encrypt));
      arEncrypt[0]:= arData_Encrypt[0].sEncrypt;
      arEncrypt[1]:= arData_Encrypt[1].sEncrypt;

      Result:= True;
    finally
      FreeAndNil(fsStream);
    end;
  end;

  procedure pLicense_End_Warning;
  var
    sLicense_End,
     sNow,
     sLicense_Remaining: string;

    dLicense_End,
     dNow: TDateTime;

    fmt: TFormatSettings;

    iLicense_Remaining_Days: integer;

    mrUserOption: TModalResult;

  begin
    mrUserOption:= mrNone;

    sLicense_End:= edLicense_End.Text;

    sNow:= FormatDateTime('yyyy/MM/dd',
                          Now);

    GetLocaleFormatSettings(0,
                            fmt);

    fmt.ShortDateFormat:= 'yyyy/MM/dd';
    fmt.DateSeparator  := '/';

    dLicense_End:= StrToDate(sLicense_End,
                             fmt);

    dNow:= StrToDate(sNow,
                     fmt);

    iLicense_Remaining_Days:= DaysBetween(dNow,
                                          dLicense_End);

    if (iLicense_Remaining_Days > 1) then sLicense_Remaining:= IntToStr(iLicense_Remaining_Days) +
                                                                        ' days'
                                     else sLicense_Remaining:= IntToStr(iLicense_Remaining_Days) +
                                                                        ' day';

    if frmMain.bLicense_Notification_End and
       (iLicense_Remaining_Days <= 10) and  // When 10 days remain before the license period expires, the warnings begin
       (iLicense_Remaining_Days <> iLicense_Last_Warning) then
      mrUserOption:= fMessageDlg('Remaining to the end of the Tinn-R license validity period: ' +
                                 sLicense_Remaining +
                                 '.' + #13#13 +
                                 'Do you want us to keep reminding you daily?',
                                 mtWarning,
                                 [mbYes, mbNo],
                                 0);
      case mrUserOption of
          mrYes: begin
                   frmMain.bLicense_Notification_End:= True;
                   iLicense_Last_Warning:= iLicense_Remaining_Days;  // Ensures that the user will be remembered only once a day.
          end;

          mrNo: begin
                  frmMain.bLicense_Notification_End:= False;
                  cbLicence_Notification_End.Checked:= False;
          end;
      end;
  end;

  function fLicense_Validate: boolean;
  var
    sLicense_Start,
     sLicense_End,
     sSerial_Tmp,
     sUser_Key_Read_From_Ini: string;

    ini_Licence: TIniFile;

  begin
    Result:= False;
    if (fLicense_Remaining = 0) then Exit;

    try
      sLicense_Start:= StringReplace(edLicense_Start.Text,
                                     '/',
                                     '',
                                     [rfReplaceAll]);

      sLicense_End:= StringReplace(edLicense_End.Text,
                                   '/',
                                   '',
                                   [rfReplaceAll]);

      sSerial_Tmp:= StringReplace(sUser_Serial,
                                  '-',
                                  '',
                                  [rfReplaceAll]);

      ini_Licence:= TIniFile.Create(frmMain.sPath_License +
                                    '\license.lic');

      with ini_Licence do
        sUser_Key_Read_From_Ini:= ReadString('License' , 'sUser_Key', 'Unlicensed');

// To debug only
//      for i:= 0 to High(arData_Recs) do
//        with arData_Recs[i] do
//          ShowMessage(sField_Name + #13 +
//                      sField_Value + #13 +
//                      IntToStr(iField_Length) + #13 +
//                      IntToStr(iMaxField_Length) + #13 +
//                      BoolToStr(bVariable_Flag));

      if (edUser_Last_Name.Text = arDecrypted[0]) and
         (edUser_Country.Text   = arDecrypted[1]) and
         (sUser_Serial          = arDecrypted[2]) and
         (sLicense_Start        = arDecrypted[3]) and
         (sLicense_End          = arDecrypted[4]) and
         (edUser_Key.Text       = sUser_Key_Read_From_Ini) then begin
        pLicense_End_Warning;
        Result:= True;
      end;
    finally
      FreeAndNil(ini_Licence);
    end;
  end;

var
  sKey,
   sKey_Default,
   sDecrypt_Data: string;

  slKeyList: TStringList;

  i,
   j,
   iIndex,
   iLen: integer;

begin
  sKey_Default:= Trim(edUser_Key.Text);

  if (sKey_Default = 'Unlicensed') or
     (sKey_Default = EmptyStr) then begin
    Result:= False;
    Exit;
  end;

  // If the file (ini\license\data.bin) does not exist, do not need to proceed: Result -> False
  if not fRead_License_Data then begin
    Result:= False;
    Exit;
  end;

  // If the file (ini\license\encrypt.bin) does not exist, do not need to proceed: Result -> False
  if not fRead_License_Encrypt then begin
    Result:= False;
    Exit;
  end;

  sKey:= StringReplace(frmMain.sUser_Key,
                       '-',
                       '',
                       [rfReplaceAll]);

  try
    slKeyList:= TStringList.Create;
    slKeyList.Clear;

    for i:= 1 to Length(arEncrypt[1]) do
      slKeyList.Add(arEncrypt[1][i]);

    SetLength(arDecrypted,
              Length(arData_Recs));

    sDecrypt_Data:= '';

    for i:= 0 to High(arData_Recs) do
      with arData_Recs[i] do begin
        sDecrypt_Data:= '';
        if bVariable_Flag then begin
          iLen:= (Ord(sKey[1]) - Ord('A') + 1);
          Delete(sKey,
                 1,
                 iLen);
          iField_Length:= iMax_Field_Length - iLen;
        end
        else
          iField_Length:= iMax_Field_Length;

        for j:= 1 to iField_Length do begin
          iIndex:= slKeyList.IndexOf(sKey[j]);
          if (iIndex >= 0) then sDecrypt_Data:= sDecrypt_Data +
                                                arEncrypt[0][iIndex + 1];
        end;

        arDecrypted[i]:= sDecrypt_Data;
        Delete(sKey,
               1,
               iField_Length);
      end;

      Result:= fLicense_Validate;
  finally
    FreeAndNil(slKeyList);
  end;
end;

function TfrmLM_Dlg.fLicense_Remaining: integer;
var
  sLicense_End,
   sNow: string;

  dLicense_End,
   dNow: TDateTime;

  fmt: TFormatSettings;

begin
  fmt.ShortDateFormat:= 'yyyy/MM/dd';
  fmt.DateSeparator  := '/';

  sLicense_End:= edLicense_End.Text;

  if (sLicense_End = EmptyStr) then begin
    Result:= 0;
    Exit;
  end;

  dLicense_End:= StrToDate(sLicense_End,
                           fmt);

  sNow:= FormatDateTime('yyyy/MM/dd',
                        Now);

  dNow:= StrToDate(sNow,
                   fmt);

  if (dLicense_End > dNow) then Result:= DaysBetween(dLicense_End,
                                                     dNow)
                           else Result:= 0;
end;

procedure TfrmLM_Dlg.pLicence_Check;
begin
  if fLicence_Validade then Exit;

  // The below will show thr frmAbout/Licencing
  with frmMain do begin
    bLicencing_Focus:= True;
    actAboutExecute(Self);
    bLicencing_Focus:= False;
  end;
end;

procedure TfrmLM_Dlg.rdgLicense_TypeClick(Sender: TObject);
begin
  with gpbJustificative do
   if (rdgLicense_Type.ItemIndex = 3) then Caption:= ' Justificative* '
                                      else Caption:= ' Justificative '
end;

function TfrmLM_Dlg.fUserData_Complete: boolean;
begin
  Result:= (edUser_First_Name.text    <> EmptyStr) and
           (edUser_Last_Name.text     <> EmptyStr) and
           (edUser_Organization.text  <> EmptyStr) and
           (edUser_Occupation.text    <> EmptyStr) and
           (edUser_Country.text       <> EmptyStr) and
           (edUser_Email.text         <> EmptyStr) and
           (rdgLicense_Type.ItemIndex <> -1);
end;

procedure TfrmLM_Dlg.synLMClick(Sender: TObject);
begin
  frmMain.synURIOpener.Editor:= synLM;
end;

procedure TfrmLM_Dlg.tLicence_CheckTimer(Sender: TObject);
begin
  pLicence_Check;
  pLicense_Time_Remaining;
end;

procedure TfrmLM_Dlg.BitBtn1Click(Sender: TObject);
begin
end;

// Adaptated from: https://stackoverflow.com/questions/31776715/send-e-mail-using-gmail-and-indy
procedure TfrmLM_Dlg.btImport_From_FileClick(Sender: TObject);
var
  ini_Licence: TIniFile;

  sFile: string;
begin
  try
    with frmMain do begin
      odMain.InitialDir:= fGet_SpecialFolder(CSIDL_PERSONAL);
      odMain.Filter    := 'zipfile (*.zip)|*.zip';
      odMain.DefaultExt:= 'zip';
      odMain.FileName  := 'Tinn-R license';

      if odMain.Execute then begin
        sFile:= odMain.fileName;

        // save the .zip file to the ini\license folder
        with zipKit do begin
          FileName:= sFile;
          BaseDirectory:= sPath_License;
          ExtractOptions:= [];
          ExtractFiles('*.*');
          CloseArchive;
        end;

        ini_Licence:= TIniFile.Create(sPath_License +
                                      '\license.lic');

        with ini_Licence do begin
          // User
          edUser_First_Name.Text   := ReadString('User', 'sUser_First_Name'    , '');
          edUser_Last_Name.Text    := ReadString('User', 'sUser_Last_Name'     , '');
          edUser_Country.Text      := ReadString('User', 'sUser_Country'       , '');
          edUser_Organization.Text := ReadString('User', 'sUser_Organization'  , '');
          edUser_Occupation.Text   := ReadString('User', 'sUser_Occupation'    , '');
          edUser_Email.Text        := ReadString('User', 'sUser_Email'         , '');

          // License
          rdgLicense_Type.ItemIndex:= ReadInteger('License', 'iLicense_Type'      , -1);
          edUser_Justificative.Text:= ReadString('License' , 'sUser_Justificative', '');
          edUser_Serial.Text       := ReadString('License' , 'sUser_Serial'       , '');
          edUser_Key.Text          := ReadString('License' , 'sUser_Key'          , 'Unlicensed');
          edLicense_Start.Text     := ReadString('License' , 'sLicense_Start'     , '');
          edLicense_End.Text       := ReadString('License' , 'sLicense_End'       , '');
        end;

        pLicense_Time_Remaining;
        btRegister.Enabled:= True;
      end;
    end;
  finally
    FreeAndNil(ini_Licence);
  end;
end;

procedure TfrmLM_Dlg.btRegisterClick(Sender: TObject);
begin
  if not fUserData_Complete or
     (edUser_Key.Text = 'Unlicensed') or
     (edUser_Key.Text = EmptyStr) then begin
    fMessageDlg('Please, provide all necessary data!',
                mtWarning,
                [mbOK],
                0);
    Exit;
  end;

  with frmMain do begin
    sUser_First_Name   := edUser_First_Name.Text;
    sUser_Last_Name    := edUser_Last_Name.Text;
    sUser_Country      := edUser_Country.Text;
    sUser_Organization := edUser_Organization.Text;
    sUser_Occupation   := edUser_Occupation.Text;
    sUser_Email        := edUser_Email.Text;
    iLicense_Type      := rdgLicense_Type.ItemIndex;
    sUser_Justificative:= edUser_Justificative.Text;
    sUser_Key          := edUser_Key.Text;
    sLicense_Start     := edLicense_Start.Text;
    sLicense_End       := edLicense_End.Text;
  end;

  btRegister.Enabled:= False;
  fMessageDlg('The license registration was successful!',
               mtConfirmation,
               [mbOK],
               0);
end;

procedure TfrmLM_Dlg.btRequestClick(Sender: TObject);
var
  // Variáveis e objetos necessários para o envio
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;

begin
  if (rdgLicense_Type.ItemIndex = 3) and
     (edUser_Justificative.Text = EmptyStr) then begin
    fMessageDlg('The license type option is "other".' + #13#13 +
                'Please justify this option!',
                mtWarning,
                [mbOK],
                0);
    Exit;
  end;

  // Instantiation of objects
  IdSSLIOHandlerSocket:= TIdSSLIOHandlerSocketOpenSSL.Create(Self);
  IdSMTP              := TIdSMTP.Create(Self);
  IdMessage           := TIdMessage.Create(Self);

  try
    // SSL protocol configuration (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method:= sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

    // Configuring the SMTP Send Server (TIdSMTP)
    IdSMTP.IOHandler:= IdSSLIOHandlerSocket;
    IdSMTP.UseTLS   := utUseImplicitTLS;
//    IdSMTP.Port     := 465;
//    IdSMTP.Host     := 'smtp.gmail.com';
//    IdSMTP.Username := 'tinn.r.org@gmail.com';
//    IdSMTP.Password := 'jcf1958g';
    IdSMTP.Port     := 465;
    IdSMTP.Host     := 'smtpout.secureserver.net';
    IdSMTP.Username := 'contact@tinn-r.org';
    IdSMTP.Password := 'jcf1958G*';

    // Message configuration (TIdMessage)
    IdMessage.From.Address:= edUser_Email.Text;
    IdMessage.From.Name   := edUser_Last_Name.Text +
                             ', ' +
                             edUser_First_Name.Text;

    IdMessage.ReplyTo.EMailAddresses:= IdMessage.From.Address;
//    IdMessage.Recipients.Add.Text   := 'tinn.r.org@gmail.com';
    IdMessage.Recipients.Add.Text   := 'contact@tinn-r.org';
    IdMessage.Subject               := 'Tinn-R license request (from software)';
    IdMessage.Encoding              := meMIME;

    // Email body configuration (TIdText)
    IdText:= TIdText.Create(IdMessage.MessageParts);

    with IdText.Body do begin
      // Date
      Add('[Date]');
      Add('sDate_Request=' +
          FormatDateTime('yyyy/mm/dd hh:MM:ss',
                         Now));
      Add('');

      // User
      Add('[User]');
      Add('sUser_First_Name=' +
          edUser_First_Name.Text);

      Add('sUser_Last_Name=' +
          edUser_Last_Name.Text);

      Add('sUser_Country=' +
          edUser_Country.Text);

      Add('sUser_Organization=' +
          edUser_Organization.Text);

      Add('sUser_Occupation=' +
          edUser_Occupation.Text);

      Add('sUser_Email=' +
          edUser_Email.Text);
      Add('');

      // License
      Add('[License]');
      case rdgLicense_Type.ItemIndex of
        0: begin
             Add('iLicense_Type=0');
             Add('sLicense_Description=Donation (project friends)');
        end;
        1: begin
             Add('iLicense_Type=1');
             Add('sLicense_Description=Purchase (person or entity)');
        end;
        2: begin
             Add('iLicense_Type=2');
             Add('sLicense_Description=Free (specific sectors)');
        end;
        3: begin
             Add('iLicense_Type=3');
             Add('sLicense_Description=Other (justify)');
        end;
      end;

      Add('sUser_Justificative=' +
          edUser_Justificative.Text);

      Add('sUser_Serial=' +
          sUser_Serial);
    end;

    IdText.ContentType:= 'text/plain; charset=iso-8859-1';

    // Connection and authentication
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E:Exception do
      begin
        MessageDlg('Cannot authenticate: ' +
                   E.Message,
                   mtWarning,
                   [mbOK],
                   0);
        Exit;
      end;
    end;

    // Sending the message
    try
      IdSMTP.Send(IdMessage);
      MessageDlg('Message sent successfully!',
                 mtInformation,
                 [mbOK],
                 0);
    except
      On E:Exception do
      begin
        MessageDlg('Error while sending a message: ' +
                   E.Message,
                   mtWarning,
                   [mbOK],
                   0);
      end;
    end;
  finally
    // release of objects from memory
    FreeAndNil(IdText);
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

procedure TfrmLM_Dlg.cbLicence_Notification_EndClick(Sender: TObject);
begin
  with frmMain do
    bLicense_Notification_End:= cbLicence_Notification_End.Checked;
end;

procedure TfrmLM_Dlg.edUser_JustificativeKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['A'..'Z',
                 'a'..'z',
                 Chr(VK_BACK),
                 Chr(VK_SPACE)]) then Key:= #0;
end;

procedure TfrmLM_Dlg.edUser_CountryKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['A'..'Z',
                 Chr(VK_BACK)]) then Key:= #0;
end;

procedure TfrmLM_Dlg.edUser_CountryKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_CountryMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_EmailKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_EmailMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_Last_NameKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['A'..'Z',
                 Chr(VK_BACK),
                 Chr(VK_SPACE)]) then Key:= #0;
end;

procedure TfrmLM_Dlg.edUser_First_NameKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['A'..'Z',
                 Chr(VK_BACK),
                 Chr(VK_SPACE)]) then Key:= #0;
end;

procedure TfrmLM_Dlg.edUser_First_NameKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_First_NameMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_OccupationKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['A'..'Z',
                 'a'..'z',
                 Chr(VK_BACK),
                 Chr(VK_SPACE)]) then Key:= #0;
end;

procedure TfrmLM_Dlg.edUser_OccupationKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_OccupationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_OrganizationKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['A'..'Z',
                 'a'..'z',
                 Chr(VK_BACK),
                 Chr(VK_SPACE)]) then Key:= #0;
end;

procedure TfrmLM_Dlg.edUser_OrganizationKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.edUser_OrganizationMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  btRequest.Enabled:= fUserData_Complete;
end;

procedure TfrmLM_Dlg.FormActivate(Sender: TObject);
begin
  btRegister.Enabled:= False;
  btRequest.Enabled:= fUserData_Complete;

  with synLM do begin
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if frmMain.bActiveLine then ActiveLineColor:= TColor(frmMain.clActiveLine)
                           else ActiveLineColor:= TColor(clNone);
  end;
  // Update the appearance based in the editor
  with frmMain.coEditor do
    AssignTo(synLM);

  // I is better to fix some propertiers here!
  with synLM do begin
    Highlighter:= dmSyn.synURI;
    Gutter.ShowLineNumbers:= False;
    ScrollBars:= ssNone;
    Font.Name:= 'Consolas';
    Font.Size:= 8;
  end;
end;

procedure TfrmLM_Dlg.pLicense_Time_Remaining;
begin
  with edLicense_Remaining do
    if (fLicense_Remaining > 1) then Text:= IntToStr(fLicense_Remaining) +
                                            ' days'
                                else Text:= IntToStr(fLicense_Remaining) +
                                            ' day'
end;

procedure TfrmLM_Dlg.FormCreate(Sender: TObject);
begin
  sUser_Serial:= fGet_MotherBoard_Serial;

  with frmMain do begin
    edUser_First_Name.Text            := sUser_First_Name;
    edUser_Last_Name.Text             := sUser_Last_Name;
    edUser_Country.Text               := sUser_Country;
    edUser_Organization.Text          := sUser_Organization;
    edUser_Occupation.Text            := sUser_Occupation;
    edUser_Email.Text                 := sUser_Email;
    rdgLicense_Type.ItemIndex         := iLicense_Type;
    edUser_Justificative.Text         := sUser_Justificative;
    edUser_Key.Text                   := sUser_Key;
    edUser_Serial.Text                := sUser_Serial;
    edLicense_Start.Text              := sLicense_Start;
    edLicense_End.Text                := sLicense_End;
    cbLicence_Notification_End.Checked:= bLicense_Notification_End;
  end;
    iLicense_Last_Warning:= -1;
    pLicense_Time_Remaining;
end;

procedure TfrmLM_Dlg.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

function TfrmLM_Dlg.fMessageDlg(const sMsg:
                                string; mdType: TMsgDlgType;
                                mdButtons: TMsgDlgButtons;
                                iHelp: Integer): Integer;
begin
  with CreateMessageDialog(sMsg,
                           mdType,
                           mdButtons) do
    try
      Position:= poOwnerFormCenter;
      Result  := ShowModal
    finally
      Free;
    end
end;

(*
  // Read data.bin
  // Adapted from: https://stackoverflow.com/questions/35404596/delphi-saving-loading-dynamic-arrays-failed?noredirect=1&lq=1
  sPath_License_Data:= sPath_License +
                       '\data.bin';

  fsStream:= TFileStream.Create(sPath_License_Data,
                                fmOpenRead);

  SetLength(arData_Recs,
            Round(fsStream.Size/SizeOf(TDef_Rec)));

  for i:= 0 to (Length(arData_Recs) - 1) do
    fsStream.ReadBuffer(arData_Recs[i],
                        SizeOf(TDef_Rec)); //Loading array

  // To debug only
  for i:= 0 to High(arData_Recs) do
    with arData_Recs[i] do
      ShowMessage(sField_Name + #13 +
                  sField_Value + #13 +
                  IntToStr(iField_Length) + #13 +
                  IntToStr(iMaxField_Length) + #13 +
                  BoolToStr(bVariable_Flag));
*)

end.
