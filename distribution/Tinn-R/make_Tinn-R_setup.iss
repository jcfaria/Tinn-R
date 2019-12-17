; Tinn-R Inno (Installer) Setup Script
; By: Tinn-R Team (31/09/2018 08:13:05)
; Tinn-R: http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
; INNO Setup: http://www.innosetup.com

[Setup]
AppName              = Tinn-R
AppPublisher         = Tinn-R Team
AppPublisherURL      = http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
AppSupportURL        = http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
AppUpdatesURL        = http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
AppVerName           = Tinn-R 6.01.01.02
AppVersion           = 6.01.01.02
AppID                = {{TINN2016-BIOS-PONT-SAPE-183999669100}
ChangesAssociations  = true
Compression          = lzma
DefaultDirName       = {sd}\Tinn-R
DefaultGroupName     = Tinn-R
LicenseFile          = .\..\..\doc\licence_gpl3.txt
OutputBaseFilename   = Tinn-R_6.01.01.02_setup
OutputDir            = .\bin
SolidCompression     = yes
SetupIconFile        = .\..\..\res\tinn48.ico
UninstallDisplayIcon = {app}\bin\Tinn-R.exe
WizardImageFile      = .\..\..\res\setup.bmp
WizardSmallImageFile = .\..\..\res\setup_small.bmp

[Tasks]
Name: desktopicon;          Description: {cm:CreateDesktopIcon};                           GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: quicklaunchicon;      Description: {cm:CreateQuickLaunchIcon};                       GroupDescription: {cm:AdditionalIcons}
Name: history_association;  Description: &Associate (*.Rhistory, *.rhistory) - R history;  GroupDescription: Files association:
Name: q_association;        Description: &Associate (*.Q, *.q) - S script;                 GroupDescription: Files association:
Name: r_association;        Description: &Associate (*.R, *.r) - R script;                 GroupDescription: Files association:
Name: rd_association;       Description: &Associate (*.Rd, *.rd) - R help;                 GroupDescription: Files association:
Name: rhtml_association;    Description: &Associate (*.Rhtml, *.rhtml) - R html;           GroupDescription: Files association:
Name: rmd_association;      Description: &Associate (*.Rmd, *.rmd) - R markdown;           GroupDescription: Files association:
Name: rnw_association;      Description: &Associate (*.Rnw, *.rnw) - Sweave;               GroupDescription: Files association:
Name: snw_association;      Description: &Associate (*.Snw, *.snw) - Sweave;               GroupDescription: Files association:
Name: tex_association;      Description: &Associate (*.sty) - LaTeX;                       GroupDescription: Files association:; Flags: unchecked
Name: tex_association;      Description: &Associate (*.tex) - LaTeX;                       GroupDescription: Files association:; Flags: unchecked
Name: tps_association;      Description: &Associate (*.tps) - Tinn-R project;              GroupDescription: Files association:
Name: txt_association;      Description: &Associate (*.txt) - Text;                        GroupDescription: Files association:; Flags: unchecked

[INI]
Filename: {app}\Tinn-R.url; Section: InternetShortcut; Key: URL; String: http://nbcgib.uesc.br/lec/software/editores/tinn-r/en

[Files]
Source: .\..\..\bin\Tinn-R.exe.manifest;             DestDir: {app}\bin
Source: .\..\..\bin\Tinn-R.exe;                      DestDir: {app}\bin
Source: .\..\..\data\data.zip;                       DestDir: {app}\data
Source: .\..\..\doc\licence_gpl2.txt;                DestDir: {app}\doc
Source: .\..\..\doc\licence_gpl3.txt;                DestDir: {app}\doc
Source: .\..\..\doc\textdiff.hlp;                    DestDir: {app}\doc
Source: .\..\..\doc\Tinn-R_recognized words.R;       DestDir: {app}\doc
Source: .\..\..\doc\User_guide.pdf;                  DestDir: {app}\doc
Source: .\..\..\latex\latex.zip;                     DestDir: {app}\latex
Source: .\..\..\packages\formatR_1.5.tar.gz;         DestDir: {app}\packages
Source: .\..\..\packages\formatR_1.5.zip;            DestDir: {app}\packages
Source: .\..\..\packages\svMisc_1.1.0.tar.gz;        DestDir: {app}\packages
Source: .\..\..\packages\svMisc_1.1.0.zip;           DestDir: {app}\packages
Source: .\..\..\packages\svSocket_0.9-57.tar.gz;     DestDir: {app}\packages
Source: .\..\..\packages\svSocket_0.9-57.zip;        DestDir: {app}\packages
Source: .\..\..\packages\TinnRcom_1.0.21.tar.gz;     DestDir: {app}\packages
Source: .\..\..\packages\TinnRcom_1.0.21.zip;        DestDir: {app}\packages
Source: .\..\..\project\project.zip;                 DestDir: {app}\project
Source: .\..\..\putty\putty.zip;                     DestDir: {app}\putty
Source: .\..\..\res\footer.jpg;                      DestDir: {app}\res
Source: .\..\..\res\footer_long.jpg;                 DestDir: {app}\res
Source: .\..\..\res\logo_long.jpg;                   DestDir: {app}\res
Source: .\..\..\sample\deplate.dplt;                 DestDir: {app}\sample
Source: .\..\..\sample\pandoc.markdown;              DestDir: {app}\sample
Source: .\..\..\sample\Tinn-R_example of script.R;   DestDir: {app}\sample
Source: .\..\..\sample\txt2tags.t2t;                 DestDir: {app}\sample
Source: .\..\..\sumatra\SumatraPDF.exe;              DestDir: {app}\sumatra
Source: .\..\..\syntax\syntax.zip;                   DestDir: {app}\syntax
Source: .\..\..\templates\R doc_dataset.Rd;          DestDir: {app}\templates
Source: .\..\..\templates\R doc_empty.Rd;            DestDir: {app}\templates
Source: .\..\..\templates\R doc_function.Rd;         DestDir: {app}\templates
Source: .\..\..\templates\R html.Rhtml;              DestDir: {app}\templates
Source: .\..\..\templates\R markdown.Rmd;            DestDir: {app}\templates
Source: .\..\..\templates\R script.R;                DestDir: {app}\templates
Source: .\..\..\templates\R_noweb.Rnw;               DestDir: {app}\templates
;Source: .\..\..\updater\footer.jpg;                  DestDir: {app}\updater
;Source: .\..\..\updater\logo-update2.jpg;            DestDir: {app}\updater
Source: .\..\..\utils\example.R;                     DestDir: {app}\utils
Source: .\..\..\utils\info.R;                        DestDir: {app}\utils
Source: .\..\..\utils\install.R;                     DestDir: {app}\utils
Source: .\..\..\utils\mirrors.R;                     DestDir: {app}\utils
;Source: .\..\..\pandoc\COPYING.rtf;                  DestDir: {app}\pandoc
;Source: .\..\..\pandoc\COPYRIGHT.txt;                DestDir: {app}\pandoc
;Source: .\..\..\pandoc\Pandoc User's Guide.html;     DestDir: {app}\pandoc
;Source: .\..\..\pandoc\pandoc-citeproc.exe;          DestDir: {app}\pandoc
;Source: .\..\..\pandoc\pandoc.exe;                   DestDir: {app}\pandoc

[Icons]
Name: {group}\Tinn-R;                                                Filename: {app}\bin\Tinn-R.exe; IconIndex: 0; IconFilename: {app}\bin\Tinn-R.exe; Flags: useapppaths
Name: {group}\{cm:ProgramOnTheWeb,Tinn-R};                           Filename: {app}\Tinn-R.url
Name: {group}\{cm:UninstallProgram,Tinn-R};                          Filename: {uninstallexe}; IconFilename: {app}\bin\Tinn-R.exe; IconIndex: 0; Flags: useapppaths
Name: {userdesktop}\Tinn-R;                                          Filename: {app}\bin\Tinn-R.exe; Tasks: desktopicon; IconIndex: 0; IconFilename: {app}\bin\Tinn-R.exe; Flags: useapppaths
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Tinn-R; Filename: {app}\bin\Tinn-R.exe; Tasks: quicklaunchicon; IconIndex: 0; IconFilename: {app}\bin\Tinn-R.exe; Flags: useapppaths

[InstallDelete]
; Removing all from the install folder
Type: filesandordirs; Name: {app}\*.*

[UninstallDelete]
; Removing all from the install folder
Type: filesandordirs; Name: {app}\*.*

[Run]
Filename: {app}\bin\Tinn-R.exe; Description: {cm:LaunchProgram,Tinn-R}; Flags: nowait PostInstall unchecked SkipIfSilent

[Registry]
; Extensions
Root: HKCR; Subkey: .Q;        ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: q_association
Root: HKCR; Subkey: .R;        ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: r_association
Root: HKCR; Subkey: .Rd;       ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: rd_association
Root: HKCR; Subkey: .Rhistory; ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: history_association
Root: HKCR; Subkey: .Rhtml;    ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: rhtml_association
Root: HKCR; Subkey: .Rmd;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: rmd_association
Root: HKCR; Subkey: .Rnw;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: rnw_association
Root: HKCR; Subkey: .Snw;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: snw_association
Root: HKCR; Subkey: .sty;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue;                       Tasks: tex_association
Root: HKCR; Subkey: .tex;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue;                       Tasks: tex_association
Root: HKCR; Subkey: .tps;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue uninsdeletekeyifempty; Tasks: tps_association
Root: HKCR; Subkey: .txt;      ValueType: string; ValueData: Tinn-R; Flags: uninsdeleteValue;                       Tasks: txt_association

; Program
Root: HKCR; Subkey: Tinn-R; ValueType: string; ValueData: Tinn-R; Flags: uninsdeletekey deletekey
Root: HKCR; Subkey: Tinn-R\DefaultIcon;        ValueType: string; ValueData: {app}\bin\Tinn-R.exe,0; Flags: uninsdeletekey deletekey
Root: HKCR; Subkey: Tinn-R\shell\open\command; ValueType: string; ValueData: """{app}\bin\Tinn-R.exe"" ""%1"""; Flags: uninsdeletekey deletekey

[Code]
// About
procedure AboutButtonOnClick(Sender: TObject);
begin
  MsgBox('Tinn-R is a Open Source project under the GNU General Public License versions 2 and 3.', 
         mbInformation, 
         mb_Ok);
end;

// URL link
procedure URLLabelOnClick(Sender: TObject);
var
  ErrorCode: Integer;

begin
  if not ShellExec('open', 
                   //'http://nbcgib.uesc.br/lec/software/editores/tinn-r/en',
                   'https://nbcgib.uesc.br/tinnr/en/',
                   '', 
                   '', 
                   SW_SHOW, 
                   ewNoWait, 
                   ErrorCode) then MsgBox('Please, check the browser.', 
                                          mbInformation, 
                                          mb_Ok);
end;

function IsAppInstalled: boolean;
begin
  result := RegKeyExists(HKEY_LOCAL_MACHINE,
                         'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{TINN2016-BIOS-PONT-SAPE-183999669100}_is1');
end;

procedure InitializeWizard();
var
  AboutButton, CancelButton: TButton;
  URLLabel: TNewStaticText;
  uninstaller: string;
  ErrorCode: Integer;

begin
  if IsAppInstalled = true then
    if MsgBox('Tinn-R is already installed.' + #13#10 + 
              'It is recommended to uninstall it before installing a new version!' + #13#10 +
              + #13#10 +
              'Do you want uninstall Tinn-R?', 
              mbInformation,
              MB_YESNO) = IDYES then
    begin
       RegQueryStringValue(HKEY_LOCAL_MACHINE,
                           'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{TINN2016-BIOS-PONT-SAPE-183999669100}_is1',
                           'UninstallString', 
                           uninstaller);
       ShellExec('runas', 
                  uninstaller, 
                  '/SILENT', 
                  '', 
                  SW_HIDE, 
                  ewWaitUntilTerminated, 
                  ErrorCode);
    end;

  CancelButton       := WizardForm.CancelButton;

  AboutButton        := TButton.Create(WizardForm);
  AboutButton.Left   := WizardForm.ClientWidth - CancelButton.Left - CancelButton.Width;
  AboutButton.Top    := CancelButton.Top;
  AboutButton.Width  := CancelButton.Width;
  AboutButton.Height := CancelButton.Height;
  AboutButton.Caption:= '&About...';
  AboutButton.OnClick:= @AboutButtonOnClick;
  AboutButton.Parent := WizardForm;

  URLLabel           := TNewStaticText.Create(WizardForm);
  URLLabel.Top       := AboutButton.Top + AboutButton.Height - URLLabel.Height - 2;
  URLLabel.Left      := AboutButton.Left + AboutButton.Width + 20;
  URLLabel.Caption   := 'Web page of Tinn-R project';
  URLLabel.Font.Style:= URLLabel.Font.Style + [fsUnderLine];
  URLLabel.Font.Color:= clBlue;
  URLLabel.Cursor    := crHand;
  URLLabel.OnClick   := @URLLabelOnClick;
  URLLabel.Parent    := WizardForm;
end;
