//---------------------------------------------------------------------------------------------------------------------
// Force to unistall previous version automatically
// From: http://stackoverflow.com/questions/2000296/innosetup-how-to-automatically-uninstall-previous-installed-version
function GetUninstallString(): string;
var
  sUnInstPath,
   sUnInstallString: string;

begin
  sUnInstPath:= ExpandConstant('Software\Microsoft\Windows\CurrentVersion\Uninstall\{#emit SetupSetting("AppId")}_is1');
  
  sUnInstallString:= '';
  
  if not RegQueryStringValue(HKLM, 
                             sUnInstPath, 
                             'UninstallString', 
                             sUnInstallString) then
    RegQueryStringValue(HKCU, 
                        sUnInstPath, 
                        'UninstallString', 
                        sUnInstallString);
  
  Result:= sUnInstallString;
end;

function IsUpgrade(): boolean;
begin
  Result:= (GetUninstallString() <> '');
end;

function UnInstallOldVersion(): integer;
var
  sUnInstallString: string;
  
  iResultCode: integer;

begin
// Return Values:
// 1 - uninstall string is empty
// 2 - error executing the UnInstallString
// 3 - successfully executed the UnInstallString

  // default return value
  Result:= 0;

  // get the uninstall string of the old app
  sUnInstallString:= GetUninstallString();
  
  if sUnInstallString <> '' then begin
    sUnInstallString:= RemoveQuotes(sUnInstallString);
  
    if Exec(sUnInstallString, 
            '/SILENT /NORESTART /SUPPRESSMSGBOXES',
            '', 
            SW_HIDE, 
            ewWaitUntilTerminated, 
            iResultCode) then
      Result:= 3
    else
      Result:= 2;
  end else
    Result:= 1;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if (CurStep=ssInstall) then
  begin
    if (IsUpgrade()) then
    begin
      UnInstallOldVersion();
    end;
  end;
end;
//---------------------------------------------------------------------------------------------------------------------
