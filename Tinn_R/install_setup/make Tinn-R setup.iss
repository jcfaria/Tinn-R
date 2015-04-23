; Tinn-R Inno (Installer) Setup Script
; By: José Cláudio Faria (04/2015)
; Tinn-R: http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
; INNO Setup: http://www.innosetup.com

[Setup]
AppName              = Tinn-R
AppPublisher         = Tinn-R Team
AppPublisherURL      = http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
AppSupportURL        = http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
AppUpdatesURL        = http://nbcgib.uesc.br/lec/software/editores/tinn-r/en
AppVerName           = Tinn-R 04.00.02.00
ChangesAssociations  = true
Compression          = lzma
DefaultDirName       = {sd}\Tinn-R
DefaultGroupName     = Tinn-R
LicenseFile          = ..\doc\licence_gpl3.txt
OutputBaseFilename   = Tinn-R_04.00.02.00_setup
OutputDir            = ..\install_setup\bin
SolidCompression     = yes
WizardImageFile      = ..\res\setup.bmp
WizardSmallImageFile = ..\res\setup_small.bmp

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
Source: ..\bin\Tinn-R.exe.manifest;             DestDir: {app}\bin
Source: ..\bin\Tinn-R.exe;                      DestDir: {app}\bin
Source: ..\data\data.zip;                       DestDir: {app}\data
Source: ..\doc\licence_gpl2.txt;                DestDir: {app}\doc
Source: ..\doc\licence_gpl3.txt;                DestDir: {app}\doc
Source: ..\doc\textdiff.hlp;                    DestDir: {app}\doc
Source: ..\doc\Tinn-R_recognized words.r;       DestDir: {app}\doc
Source: ..\doc\User guide.pdf;                  DestDir: {app}\doc
Source: ..\latex\latex.zip;                     DestDir: {app}\latex
Source: ..\package\TinnRcom_1.0.16.tar.gz;      DestDir: {app}\package
Source: ..\package\TinnRcom_1.0.16.zip;         DestDir: {app}\package
Source: ..\project\project.zip;                 DestDir: {app}\project
Source: ..\sample\deplate.dplt;                 DestDir: {app}\sample
Source: ..\sample\pandoc.markdown;              DestDir: {app}\sample
Source: ..\sample\Tinn-R_example of script.r;   DestDir: {app}\sample
Source: ..\sample\txt2tags.t2t;                 DestDir: {app}\sample
SOurce: ..\sumatra\SumatraPDF.exe;              DestDir: {app}\sumatra
Source: ..\templates\R doc_dataset.Rd;          DestDir: {app}\templates
Source: ..\templates\R doc_empty.Rd;            DestDir: {app}\templates
Source: ..\templates\R doc_function.Rd;         DestDir: {app}\templates
Source: ..\templates\R html.Rhtml;              DestDir: {app}\templates
Source: ..\templates\R markdown.Rmd;            DestDir: {app}\templates
Source: ..\templates\R script.R;                DestDir: {app}\templates
Source: ..\templates\R_noweb.Rnw;               DestDir: {app}\templates
Source: ..\utils\Rinfo_b.R;                     DestDir: {app}\utils
Source: ..\utils\Rinfo_c.R;                     DestDir: {app}\utils
Source: ..\utils\Rinfo_load_b.R;                DestDir: {app}\utils
Source: ..\utils\Rinfo_load_c.R;                DestDir: {app}\utils
Source: ..\utils\Rinfo_load_c.R;                DestDir: {app}\utils
Source: ..\utils\Rinstall.R;                    DestDir: {app}\utils

[Icons]
Name: {group}\Tinn-R;                                                Filename: {app}\bin\Tinn-R.exe; IconIndex: 0; IconFilename: {app}\bin\Tinn-R.exe; Flags: useapppaths
Name: {group}\{cm:ProgramOnTheWeb,Tinn-R};                           Filename: {app}\Tinn-R.url
Name: {group}\{cm:UninstallProgram,Tinn-R};                          Filename: {uninstallexe}; IconFilename: {app}\bin\Tinn-R.exe; IconIndex: 0; Flags: useapppaths
Name: {userdesktop}\Tinn-R;                                          Filename: {app}\bin\Tinn-R.exe; Tasks: desktopicon; IconIndex: 0; IconFilename: {app}\bin\Tinn-R.exe; Flags: useapppaths
Name: {userappdata}\Microsoft\Internet Explorer\Quick Launch\Tinn-R; Filename: {app}\bin\Tinn-R.exe; Tasks: quicklaunchicon; IconIndex: 0; IconFilename: {app}\bin\Tinn-R.exe; Flags: useapppaths

[UninstallDelete]
Type: files; Name: {app}\Tinn-R.url
Type: filesandordirs; Name: {app}\data

[Run]
Filename: {app}\bin\Tinn-R.exe; Description: {cm:LaunchProgram,Tinn-R}; Flags: nowait PostInstall unchecked SkipIfSilent

[Registry]
; extensions
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
;program
Root: HKCR; Subkey: Tinn-R; ValueType: string; ValueData: Tinn-R; Flags: uninsdeletekey deletekey
Root: HKCR; Subkey: Tinn-R\DefaultIcon;        ValueType: string; ValueData: {app}\bin\Tinn-R.exe,0; Flags: uninsdeletekey deletekey
Root: HKCR; Subkey: Tinn-R\shell\open\command; ValueType: string; ValueData: """{app}\bin\Tinn-R.exe"" ""%1"""; Flags: uninsdeletekey deletekey

[Code]
//About
Procedure AboutButtonOnClick(Sender: TObject);
Begin
  MsgBox('Tinn-R is a open source project under the GNU General Public License versions 2 and 3.', mbInformation, mb_Ok);
End;

//URL link
Procedure URLLabelOnClick(Sender: TObject);
Var
  ErrorCode: Integer;

Begin
  If not ShellExec('open', 'http://nbcgib.uesc.br/lec/software/editores/tinn-r/en',
                   '', '', SW_SHOW, ewNoWait, ErrorCode) Then MsgBox('Please, check the browser.', mbInformation, mb_Ok);
End;

Procedure InitializeWizard();
Var
  AboutButton, CancelButton: TButton;
  URLLabel: TNewStaticText;

Begin
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
End;
