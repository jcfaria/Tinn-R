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

unit trUtils;

interface

uses
  Windows, Messages, SysUtils, Dialogs, Classes, Clipbrd, Registry, Graphics, Controls, StrUtils,
  ActiveX, ShlObj, ComObj, PerlRegEx, WinInet, StdCtrls;

type
  TCharSet = set of Char;
  TGuiType = (gtJGR, gtUnknown);

  function fCheckR_Version(sText: string): boolean;
  function fClipboardTxt_ToFile (sFileTXT: string): boolean;
  function fContrast_Color(FontC: TColor): TColor;
  function fCount_Char(Text, Sub: string): Integer;
  function fDataFolder: string;
  function fDirectory_IsEmpty(Directory: string): boolean;
  function fDownload_File(const url: string; const sFileName: string): boolean;
  function fExec_Wait(const sFileName, sParams: string; wWindowState: Word): boolean;
  function fExecCmdLine_Wait(const CmdLine: string; wWindowState: Word): boolean;
  function fFile_Exists_PuTTY(sFile, sFileRemote, sPuTTYPath, sPuTTYPassword, sPuTTYUser, sPuTTYHost: string): boolean;
  function fFile_InUse(sFile: string): boolean;
  function fFile_Save_Fast(sFile, sContent: string): boolean;
  function fFile_Save_Fast_PuTTY(sFile, sContent, sPuTTYPath, sPuTTYPassword, sPuTTYUser, sPuTTYHost: string): boolean;
  function fFile_ToString(sPath: string): string;
  function fGetAssociation(const DocFileName: string): string;
  function fGetEnvVariable(Name: string; User: boolean = True): string;
  function fGetPosMatching_Backward(Str: string; parIni, parFim: string): integer;
  function fGetPosMatching_Forward(Str: string; parIni, parFim: string): integer;
  function fGetRegistry_InstallPath(KeyName: string): string;
  function fGetRegistry_Key(KeyName: string): string;
  function fGetRObject(sTmp: string): string;
  function fGetRPackage(sTmp: string): string;
  function fGetSpecialFolder(const ASpecialFolderID: Integer): string;
  function fGetWindowHandle(const chCaption: PChar; const bPartial: boolean = True): HWND;
  function fInvertString(sStr: string): string;
  function fIs64Bit_OS: boolean;
  function fIsConnected: boolean;
  function fIsGuiRunning(var hRgui: HWND; var sCaption: string; var iRecognitionCaption: integer; bFirstTime: boolean = False): boolean;
  function fIsInteger(sTmp: string): boolean;
  function fIsPortable_Version: boolean;
  function fIsURL(s: string): boolean;
  function fIsValidNumber_RVersion(s: string): boolean;
  function fLastPos(sSub, s: string): Integer;
  function fOpen_CmdLine(const CmdLine: string; wWindowState: Word): boolean;
  function fPath_Browser: String;
  function fPathRExists(var sPathR: string): boolean;  // Portable
  function fRegEx(sSubject, sRegEx: string; bReplace: boolean = False; sReplacement: string = ''): string;
  function fRegEx_Multiline(sSubject, sRegEx: string): string;
  function fRemove_FileExtension(sFile: string): string;
  function fRunFile(const sName: string = ''; const sPar1: string = '';  const sPar2: string = ''): Integer;
  function fSanitize_FileName(const sInputString: string): string;
  function fSave_PriorClipboard_Text: boolean;
  function fSort_Date(List: TStringList; Index1, Index2: Integer): Integer;
  function fSort_Integer(List: TStringList; Index1, Index2: Integer): Integer;
  function fStringToCase_Select(sSelector : string; aCaseList: array of string): Integer;
  function fStrip_FileName(sFileName: string): string;
  function fStrip_NonConforming(const sTmp: string; const ValidChars: TCharSet): string;
  function fStrip_Path(sFileName: string): string;
  function fStrippedOf_NonAscii(const s: string): string;
  procedure pCaptureConsole_Output(const ACommand, AParameters: String; AMemo: TMemo);
  procedure pDelete_Dir(sDir: string);
  procedure pDelete_FilesOfPath(path: string);
  procedure pGet_DriveLetters(slTmp: TStringList);  // Portable
  procedure pGet_Registry_R_Installed(KeyName: string; var slRAvailable: TStringList);
  procedure pGet_RInfo(sTmp: string; var sRPackage, sRObject: string);
  procedure pOpen_File(sFileName: string);
  procedure pOpen_Program(sProg, sParams: string);
  procedure pOpen_Url(const sURL: string);
  procedure pOpen_UrlByIEShell(const sURL: string);
  procedure pSend_Message(msg: HINST);
  procedure pRestore_PriorClipboard_Text;
  procedure pSet_EnvVariable(Name, Value: string; User: boolean = True);
  procedure pString_Split(const cDelimiter: Char; sInput: string; const tsStrings: TStrings);

implementation

uses
  ShellAPI,
  SHDocVw,
  Forms
  ;

const
  R: array[0..3] of string = ('R Console (32-bit)',             // R: 32 SDI mode (0)
                              'R Console (64-bit)',             // R: 64 SDI mode (1)
                              'R Console - Microsoft R Open',   // MRO (2) - The first release of 3.3.1 has double space: R Console..-..Microsoft R Open version 3.3 (64-bit)
                              ' - PuTTY');                      // R running in remote server under PuTTY

var
  preRegEx: TPerlRegEx;

  sOldClipBoard: string;


function fCheckR_Version(sText: string): boolean;
var
  sPath: string;

begin
  // Get clean path of R
  // https://regex101.com/r/es3Smo/4
  //$re = '/[a-zA-Z]:\\\\([a-zA-Z 0-9-_.]+\\\\?){1,}/m';
  //$str = '[32b] C:\\test\\test2\\
  //[32b] C:\\test\\test2\\aaaaaa\\aaaaa
  //[32b] C:\\test\\test2\\test.exe
  //[64b] C:\\test
  //
  //[32b] C:\\Program files\\R\\R-devel\\bin\\64
  //[32b] C:\\Program files\\R\\R-devel\\bin\\64\\
  //
  //[32b] C:\\test aaa\\test2\\
  //[32b] C:\\test\\test2 bbb\\aaaaaa\\aaaaa
  //[32b] C:\\test\\test2  hhh\\test.exe
  //[64b] C:\\test
  //
  //[32b] C:\\test_aaa\\test2\\
  //[32b] C:\\test\\test2-bbb\\aaaaaa\\aaaaa
  //[32b] C:\\test\\test2  hhh\\test.exe
  //[64b] C:\\test
  //';
  //
  //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
  //
  //// Print the entire match result
  //var_dump($matches);

  sPath:= fRegEx(sText,
                 '[a-zA-Z]:\\([a-zA-Z 0-9-_.]+\\?){1,}',
                 False);

  //ShowMessage(sTmp);
  Result:= DirectoryExists(sPath);
end;

// adapted from http://www.delphipages.com/forum/showthread.php?t=120031
function fGetWindowHandle(const chCaption: PChar;
                          const bPartial: boolean = True): HWND;
var
  chTmp: PChar;

  i: Integer;

  hTmp: HWND;

  sTmp_1,
   sTmp_2: string;

begin
  Result:= 0;
  chTmp := nil;

  try
    GetMem(chTmp,
           255);

    hTmp:= GetWindow(FindWindow(nil,
                                nil),
                     0);

    while (hTmp <> 0) and
           (Result = 0) do begin
      i:= GetWindowText(hTmp,
                        chTmp,
                        255);

      if (i > 0) then
        sTmp_1:= LowerCase(string(chTmp));
        sTmp_1:= StringReplace(sTmp_1,
                               ' ',
                               '',
                               [rfReplaceAll]);

        sTmp_2:= LowerCase(string(chCaption));  // from Rgui[i]
        sTmp_2:= StringReplace(sTmp_2,
                               ' ',
                               '',
                               [rfReplaceAll]);
{
        if (SameStr(sTmp_1,
                    sTmp_2)) then Result:= hTmp
        else if bPartial and
                Assigned(AnsiStrPos(chTmp,
                                    chCaption)) and
                not Assigned(AnsiStrPos(chTmp,
                                        'RGui')) then Result:= hTmp;
}
      if Assigned(AnsiStrPos(PChar(sTmp_1),
                             PChar(sTmp_2))) and
         not Assigned(AnsiStrPos(chTmp,
                                 'RGui')) then Result:= hTmp;

      hTmp:= GetWindow(hTmp,
                       GW_HWNDNEXT);
    end;
  finally
    FreeMem(chTmp);
  end;
end;

function fIsGuiRunning(var hRgui: HWND;
                       var sCaption: string;
                       var iRecognitionCaption: integer;
                       bFirstTime: boolean = False): boolean;
var
  i: integer;

  hTmp: HWND;

begin
  Result:= False;
  hRgui := 0;
  hTmp  := 0;

  if bFirstTime then  // Will search for all recognized R in the first time.
    for i:= 0 to 3 do begin
      hTmp:= fGetWindowHandle(Pchar(R[i]));
      if (hTmp <> 0) then begin
        sCaption:= R[i];
        Break;
      end;
    end
  else
    case iRecognitionCaption of
      // R Console (32-bit) --> 32 bit SDI mode
      0: begin
           hTmp:= fGetWindowHandle(Pchar(R[0]));
           if (hTmp <> 0) then sCaption:= R[0];
         end;

      // R Console (64-bit) --> 64 bit SDI mode
      1: begin
           hTmp:= fGetWindowHandle(Pchar(R[1]));
           if (hTmp <> 0) then sCaption:= R[1];
         end;

      // R Console (32-bit) & R Console (64-bit) --> Both: 32 bit SDI mode and
      //                                                   64 bit SDI mode
      2: begin
           for i:= 0 to 1 do begin
             hTmp:= fGetWindowHandle(Pchar(R[i]));
             if (hTmp <> 0) then begin
               sCaption:= R[i];
               Break;
             end;
           end;
         end;

      // R Console - Microsoft R Open --> MRO
      3: begin
           hTmp:= fGetWindowHandle(Pchar(R[2]));
           if (hTmp <> 0) then sCaption:= R[2];
         end;

      // R running in remote server under PuTTY
      4: begin
           hTmp:= fGetWindowHandle(Pchar(R[3]));
           if (hTmp <> 0) then sCaption:= R[3];
         end;
    end;

  if (hTmp <> 0) then begin
    hRgui := hTmp;
    Result:= True;
  end;
end;

function fFile_ToString(sPath: string): string;
var
  tfTmp: TextFile;

  sRead,
    sContent: string;

begin
    AssignFile(tfTmp,
               sPath);
    Reset(tfTmp);
    while not EOF(tfTmp) do begin
      ReadLn(tfTmp,
             sRead);
      sContent:= sContent +
                 sRead +
                 #13#10;
    end;
    CloseFile(tfTmp);
    Result:= sContent;
end;

function fContrast_Color(FontC: TColor): TColor;
var
  iR,
   iG,
   iB: Integer;

begin
  iR:= GetRValue(abs(FontC)) * 2;
  iG:= GetGValue(abs(FontC)) * 5;
  iB:= GetBValue(abs(FontC));
  if (iR +
      iG +
      iB < 1024) then Result:= clWhite
                 else Result:= clBlack;
end;

function fRemove_FileExtension(sFile: string): string;
var
  sTemp,
   sInvName: string;

  iPos: integer;

begin
  sTemp   := ExtractFilePath(sFile);
  sFile   := ExtractFileName(sFile);
  sInvName:= fInvertString(sFile);
  iPos    := Pos('.',
                 sInvName);
  if (iPos > 0) then sFile:= Copy(sFile,
                                  1,
                                  length(sFile) - iPos);
  sFile   := sTemp +
             sFile;
  Result  := sFile;
end;

function fInvertString(sStr: string): string;
var
 cTemp: char;

 i,
  t: integer;

begin
 t:= length(sStr);
 for i:= 1 to (t div 2) do
 begin
   cTemp      := sStr[i];
   sStr[i]    := sStr[t-i+1];
   sStr[t-i+1]:= cTemp;
 end;
 Result:= sStr;
end;

function fRunFile(const sName: string = '';
                  const sPar1: string = '';
                  const sPar2: string = ''): Integer;
begin
  Result:= ShellExecute(0,
                        nil,
                        PChar(sName),
                        PChar(sPar1),
                        PChar(sPar2),
                        SW_SHOWNORMAL);
end;

procedure pOpen_Url(const sURL: string);
begin
  {$IFDEF MSWINDOWS}
  if not (fRunFile(sURL) > 32) then pOpen_UrlByIEShell(sURL);
  {$ENDIF}
end;

procedure pOpen_UrlByIEShell(const sURL: string);
var
  iE: IWebBrowser2;
  vI: OleVariant;

begin
  try
    iE:= CoShellBrowserWindow.Create;
    if (iE = nil) then Exit;
    iE.Visible:= True;
    iE.Navigate(sURL,
                vI,
                vI,
                vI,
                vI);
  except
    ; //TODO
  end;
end;

// from: http://delphi.about.com/cs/adptips2002/a/bltip0202_5.htm
{
Usage:

case fStringToCaseSelect('Delphi',
      ['About','Borland','Delphi']) of
   0:ShowMessage('You''ve picked About') ;
   1:ShowMessage('You''ve picked Borland') ;
   2:ShowMessage('You''ve picked Delphi') ;
end;
}
function fStringToCase_Select(sSelector: string;
                              aCaseList: array of string): Integer;
var
  iCnt: integer;

begin
   Result:= -1;
   for iCnt:= 0 to (Length(aCaseList) - 1) do begin
     if (CompareText(sSelector,
                     aCaseList[iCnt]) = 0) then begin
       Result:= iCnt;
       Break;
     end;
   end;
end;

//From Zarko Gajic: http://delphi.about.com/cs/adptips2002/a/bltip1102_5.htm
//PS: a very nice procedure to split string!!!
procedure pString_Split(const cDelimiter: Char;
                        sInput: string;
                        const tsStrings: TStrings);
begin
   Assert(Assigned(tsStrings)) ;
   tsStrings.Clear;
   tsStrings.Delimiter    := cDelimiter;
   tsStrings.DelimitedText:= sInput;
end;

function fSave_PriorClipboard_Text: boolean;
begin
  //ShowMessage(Clipboard.AsText);  To debug
  Result:= False;
  while not OpenClipboard(Application.Handle) do Sleep(50);
  if OpenClipboard(Application.Handle) then begin
    Result:= True;
    with Clipboard do
      if HasFormat(CF_TEXT) then begin
        sOldClipBoard:= AsText;
        Clear;
      end;
  end
  else
    MessageDlg('Clipboard is not available!' + #13 + #13 +
               'Please, try newly!',
               mtWarning,
               [MBOK],
               0)
end;

procedure pRestore_PriorClipboard_Text;
begin
  while not OpenClipboard(Application.Handle) do Sleep(50);
  if OpenClipboard(Application.Handle) then
    with Clipboard do
      AsText:= sOldClipBoard;
end;

procedure pSend_Message(msg: HINST);
begin
  case msg of
    0                     : MessageDlg('The operating system is out of memory or resources!',
                                       mtError,
                                       [mbOK],
                                       0);

    ERROR_FILE_NOT_FOUND  : MessageDlg('The specified file was not found!',
                                       mtError,
                                       [mbOK],
                                       0);

    ERROR_PATH_NOT_FOUND  : MessageDlg('The specified path was not found!',
                                       mtError,
                                       [mbOK],
                                       0);

    ERROR_BAD_FORMAT      : MessageDlg('The .EXE file is invalid (non-Win32 .EXE or error in .EXE image!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_ACCESSDENIED   : MessageDlg('The operating system denied access to the specified file!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_ASSOCINCOMPLETE: MessageDlg('The filename association is incomplete or invalid!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_DDEBUSY        : MessageDlg('The DDE transaction could not be completed because other DDE transactions were being processed!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_DDEFAIL        : MessageDlg('The DDE transaction failed!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_DDETIMEOUT     : MessageDlg('The DDE transaction could not be completed because the request timed out!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_DLLNOTFOUND    : MessageDlg('The specified dynamic-link library was not found!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_NOASSOC        : MessageDlg('There is no application associated with the given filename extension!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_OOM            : MessageDlg('There was not enough memory to complete the operation!',
                                       mtError,
                                       [mbOK],
                                       0);

    SE_ERR_SHARE          : MessageDlg('A sharing violation occurred!',
                                       mtError,
                                       [mbOK],
                                       0);
  end;
end;

{Open a file or starts a programm (without parameters) }
procedure pOpen_File(sFileName: string);
var
  aTemp: array[0..800] of Char;

begin
  StrPCopy(aTemp,
           sFileName);

  ShellExecute(Application.Handle,
               'open',
               aTemp,
               nil,
               nil,
               SW_NORMAL);
end;

{ Starts a programm with commandline parameters }
procedure pOpen_Program(sProg,
                        sParams: string);
var
  aTemp1,
   aTemp2: array[0..800] of Char;

begin
  StrPCopy(aTemp1,
           sProg);
  StrPCopy(aTemp2,
           sParams);
  ShellExecute(Application.Handle,
               'open',
               aTemp1,
               aTemp2,
               nil,
               SW_NORMAL);
end;

{ Starts a program and wait until its terminated: WindowState is of the SW_xxx constants }
function fExec_Wait(const sFileName,
                          sParams: string;
                    wWindowState: Word): boolean;
var
  sUInfo: TStartupInfo;
  pInfo : TProcessInformation;

  sCmdLine: string;

begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  sCmdLine:= '"' +
             sFileName +
             '"' +
             sParams;
  FillChar(sUInfo,
           SizeOf(sUInfo),
           #0);
  with SUInfo do
  begin
    cb         := SizeOf(sUInfo);
    dwFlags    := STARTF_USESHOWWINDOW;
    wShowWindow:= wWindowState;
  end;
  Result:= CreateProcess(nil,
                         PChar(cmdLine),
                         nil,
                         nil,
                         False,
                         CREATE_NEW_CONSOLE or
                         NORMAL_PRIORITY_CLASS,
                         nil,
                         PChar(ExtractFilePath(sFileName)),
                         sUInfo,
                         pInfo);
  if Result then begin
    WaitForSingleObject(pInfo.hProcess,
                        INFINITE); // Wait for it to finish
    CloseHandle(pInfo.hProcess);
    CloseHandle(pInfo.hThread);
  end;
end;

{ Execute a complete shell command line and waits until terminated. }
function fExecCmdLine_Wait(const CmdLine: string;
                           wWindowState: Word): boolean;
var
  sUInfo: TStartupInfo;
  pInfo : TProcessInformation;

begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  FillChar(sUInfo,
           SizeOf(sUInfo),
           #0);
  with SUInfo do
  begin
    cb         := SizeOf(sUInfo);
    dwFlags    := STARTF_USESHOWWINDOW;
    wShowWindow:= wWindowState;
  end;
  Result:= CreateProcess(nil,
                         PChar(CmdLine),
                         nil,
                         nil,
                         False,
                         CREATE_NEW_CONSOLE or
                         NORMAL_PRIORITY_CLASS,
                         nil,
                         nil {PChar(ExtractFilePath(sFileName))},
                         sUInfo,
                         pInfo);
  if Result then begin
    WaitForSingleObject(pInfo.hProcess,
                        INFINITE); // Wait for it to finish
    CloseHandle(pInfo.hProcess);
    CloseHandle(pInfo.hThread);
  end;
end;

{ Execute a complete shell command line without waiting. }
function fOpen_CmdLine(const CmdLine: string;
                       wWindowState: Word): boolean;
var
  sUInfo: TStartupInfo;
  pInfo : TProcessInformation;

begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  FillChar(sUInfo,
           SizeOf(sUInfo),
           #0);
  with SUInfo do
  begin
    cb         := SizeOf(sUInfo);
    dwFlags    := STARTF_USESHOWWINDOW;
    wShowWindow:= wWindowState;
  end;
  Result:= CreateProcess(nil,
                         PChar(CmdLine),
                         nil,
                         nil,
                         False,
                         CREATE_NEW_CONSOLE or
                         NORMAL_PRIORITY_CLASS,
                         nil,
                         nil {PChar(ExtractFilePath(sFileName))},
                         sUInfo,
                         pInfo);
end;

function fPath_Browser: String;
// Return path of default browser
// Require Registry declared in Uses
var
  sBrowser: String;

  i: Integer;

  reg: TRegistry;

begin
  try
    reg:= TRegistry.Create;
    with reg do begin
      try
        RootKey:= HKEY_CLASSES_ROOT;
        if not OpenKey('http\shell\open\command',
                       False) then sBrowser:= ''
                              else sBrowser:= ReadString('');
        CloseKey;
      finally
        Free;
        reg:= nil;
      end;
      i:= Pos('.exe',
              LowerCase(sBrowser));
      if (i > 0) then sBrowser:= Copy(sBrowser,
                                      1,
                                      (i + 3));
      i:= Pos('"',
              sBrowser);
      while i > 0 do begin
        Delete(sBrowser,
               1,
               i);
        i:= Pos('"',
                sBrowser);
      end;
    end;
    Result:= sBrowser;
  finally
    FreeAndNil(reg)
  end;
end;

function fSort_Date(List: TStringList;
                    Index1,
                    Index2: Integer): Integer;
var
  d1,
   d2: TDateTime;

begin
  d1:= StrToDate(List[Index1]);
  d2:= StrToDate(List[Index2]);
  if      (d1 < d2) then Result:= -1
  else if (d1 > d2) then Result:=  1
  else                   Result:=  0;
end;

function fSort_Integer(List: TStringList;
                       Index1,
                       Index2: Integer): Integer;
var
  b1,
   b2: boolean;

  i1,
   i2: integer;

  function IsInt(AString : string;
                 var AInteger : Integer): boolean;
  var
    iCode: Integer;

  begin
    Val(AString,
        AInteger,
        iCode);
    Result:= (iCode = 0);
  end;

begin
  b1:= IsInt(List[Index1],
             i1);
  b2:= IsInt(List[Index2],
             i2);
  Result:= ord(b1 or b2);
  if (Result <> 0) then
  begin
    if      (i1 < i2) then Result:= -1
    else if (i1 > i2) then Result:=  1
    else                   Result:=  0;
  end
  else Result:= lstrcmp(PChar(List[Index1]),
                        PChar(List[Index2]));
end;

// From Zarko Gajic (http://delphi.about.com/cs/adptips2001/a/bltip0301_4.htm)
function fClipboardTxt_ToFile (sFileTXT: string): boolean;
var
  c1,
   c2  : PChar;
  dwLen: DWord;
  hData: THandle;
  tf   : TextFile;

begin
  Result:= False;
  with Clipboard do begin
   try
    Open;
     if(HasFormat(CF_TEXT)) then begin
       hData:= GetClipboardData(CF_TEXT);
       c1   := GlobalLock(hData);
       dwLen:= GlobalSize(hData);
       c2   := StrAlloc(1 + dwLen);
       StrLCopy(c2,
                c1,
                dwLen);
       GlobalUnlock(hData);

       AssignFile(tf,
                  sFileTXT);
         ReWrite(tf);
         Write(tf,
               c2);
       CloseFile(tf);

       StrDispose(c2);
       Result:= True;
     end;
    finally
     Close;
   end;
  end;
end;

function fFile_Save_Fast(sFile,
                         sContent: string): boolean;
var
  tf: TextFile;

begin
  AssignFile(tf,
             sFile);
    ReWrite(tf);
    WriteLn(tf,
            sContent);
  CloseFile(tf);

  Result:= True;
end;

function fFile_Save_Fast_puTTY(sFile,
                               sContent,
                               sPuTTYPath,
                               sPuTTYPassword,
                               sPuTTYUser,
                               sPuTTYHost: string): boolean;
var
  tf: TextFile;

//  sPath,
  sCmd: string;

begin
  Result:= False;

  AssignFile(tf,
             sFile);
    ReWrite(tf);
    WriteLn(tf,
            sContent);
  CloseFile(tf);

  sCmd:= sPuTTYPath +
         ' -pw ' +
         sPuTTYPassword +
         ' ' +
         sFile +
         ' ' +
         sPuTTYUser +
         '@' +
         sPuTTYHost +
         ':/tmp/Tinn-R';

  // It will send the file info.R to R remote under PuTTY
  if fOpen_CmdLine(sCmd,
                   SW_HIDE) then Result:= True;
end;

function fStrippedOf_NonAscii(const s: string): string;
var
  i,
   Count: Integer;

begin
  SetLength(Result, Length(s));
  Count := 0;
  for i := 1 to Length(s) do begin
    if ((s[i] >= #32) and (s[i] <= #127)) or (s[i] in [#10, #13]) then begin
      inc(Count);
      Result[Count] := s[i];
    end;
  end;
  SetLength(Result, Count);
end;

function fStrip_NonConforming(const sTmp: string;
                              const ValidChars: TCharSet): string;
var
  iDest,
   iSource: Integer;

begin
  SetLength(Result,
            Length(sTmp));
  iDest:= 0;
  for iSource:= 1 to Length(sTmp) do
    if sTmp[iSource] in ValidChars then
    begin
      Inc(iDest);
      Result[iDest]:= sTmp[iSource]
    end;
  SetLength(Result,
            iDest)
end;

// Based in http://stackoverflow.com/questions/2863931/problems-reading-registry-from-delphi-7-on-windows-7-64-bit
function fIs64Bit_OS: boolean;
type
  TIsWow64Process = function(Handle: THandle;
                             var IsWow64: BOOL): BOOL; stdcall;

var
  hKernel32     : Integer;
  IsWow64Process: TIsWow64Process;
  IsWow64       : BOOL;

begin
  // we can check if the operating system is 64-bit by checking whether
  // we are running under Wow64 (we are 32-bit code). We must check if this
  // function is implemented before we call it, because some older versions
  // of kernel32.dll (eg. Windows 2000) don't know about it.
  // see http://msdn.microsoft.com/en-us/library/ms684139%28VS.85%29.aspx
  Result:= False;

  hKernel32:= LoadLibrary('kernel32.dll');

  if (hKernel32 = 0) then RaiseLastOSError;

  @IsWow64Process:= GetProcAddress(hkernel32,
                                   'IsWow64Process');

  if Assigned(IsWow64Process) then begin
    IsWow64:= False;

    if (IsWow64Process(GetCurrentProcess,
                       IsWow64)) then begin
      Result:= IsWow64;
    end
    else RaiseLastOSError;
  end;

  FreeLibrary(hKernel32);
end;

function fGetRegistry_InstallPath(KeyName: string): string;
var
  i: integer;

  Reg   : TRegistry;
  slKeys: TStringList;

  sPath: string;

begin
  Result:= '';
  Reg   := nil;
  //slKeys:= nil;

  slKeys:= TStringList.Create;

  try
    if fIs64Bit_OS then Reg:= TRegistry.Create(KEY_READ or KEY_WOW64_64KEY)
                   else Reg:= TRegistry.Create(KEY_READ);

    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly(KeyName);
    Reg.GetKeyNames(slKeys);
    Reg.CloseKey;

    if (slKeys.Count = 0) then Exit;

    {
    // To debug only
    for i:= 0 to (slKeys.Count - 1) do
      ShowMessage(slKeys.Strings[i]);
    }

    // Delete any key begining with characters (not related to R from CRAN),
    // for example 'R64' generated in my computer by Microsoft MRAN
    for i:= (slKeys.Count - 1) downto 0 do
      if (fRegEx(slKeys.Strings[i],
                 '^[a-zA-Z]+',
                 False) <> '') then slKeys.Delete(i);

    // There is no valid R in the registry.
    if (slKeys.Count = 0) then Exit;
    slKeys.Sort;

    KeyName:= KeyName +
              '\' +
              slKeys.Strings[slKeys.Count -1];  // The latest is the most recent R version

    Reg.OpenKeyReadOnly(KeyName);

    sPath:= Reg.ReadString('InstallPath');

    if (LastDelimiter('\', sPath) = Length(sPath)) then Delete(sPath,
                                                           LastDelimiter('\',
                                                                         sPath),
                                                           1);

    Result:= sPath;
    Reg.CloseKey;
  finally
    Reg.Free;
    slKeys.Free;
  end;
end;

function fGetRegistry_Key(KeyName: string): string;
var
  i: integer;

  Reg   : TRegistry;
  slKeys: TStringList;

begin
  Result:= '';
  Reg   := nil;
  //slKeys:= nil;

  slKeys:= TStringList.Create;

  try
    if fIs64Bit_OS then Reg:= TRegistry.Create(KEY_READ or KEY_WOW64_64KEY)
                   else Reg:= TRegistry.Create(KEY_READ);

    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly(KeyName);
    Reg.GetKeyNames(slKeys);
    Reg.CloseKey;

    if (slKeys.Count = 0) then Exit;

    // Delete any key begining with characters (not related to R from CRAN),
    // for example 'R64' generated in my computer by Microsoft MRAN
    for i:= (slKeys.Count - 1) downto 0 do
      if (fRegEx(slKeys.Strings[i],
                 '^[a-zA-Z]+',
                 False) <> '') then slKeys.Delete(i);

    // There is no valid R in the registry.
    if (slKeys.Count = 0) then Exit;
    slKeys.Sort;

    Result:= slKeys.Strings[slKeys.Count -1];  // The latest is the most recent R version

  finally
    Reg.Free;
    slKeys.Free;
  end;
end;

procedure pGet_Registry_R_Installed(KeyName: string;
                                    var slRAvailable: TStringList);
var
  i: integer;

  Reg   : TRegistry;
  slKeys: TStringList;

  procedure pKey_Complete(sKey: string);
  var
    sPath: string;

  begin
    try
      Reg.OpenKeyReadOnly(KeyName +
                          '\' +
                          sKey);

      sPath:= Reg.ReadString('InstallPath');
      Reg.CloseKey;

      // MRAN put an aditional '\' after the IntallPath! :(
      // It is necessary to delete it!
      if (LastDelimiter('\', sPath) = Length(sPath)) then Delete(sPath,
                                                                 LastDelimiter('\',
                                                                               sPath),
                                                                 1);

      if DirectoryExists(sPath +
                         '\bin\i386') then slRAvailable.Add('[32 b] - ' +
                                                            sPath +
                                                            '\bin\i386\');
      if DirectoryExists(sPath +
                         '\bin\x64') then slRAvailable.Add('[64 b] - ' +
                                                           sPath +
                                                           '\bin\x64\')
    finally
      Reg.CloseKey;
    end;
  end;

begin
  Reg   := nil;
  slKeys:= nil;

  try
    slKeys:= TStringList.Create;

    if  fIs64Bit_OS then Reg:= TRegistry.Create(KEY_READ or KEY_WOW64_64KEY)
                    else Reg:= TRegistry.Create(KEY_READ);

    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly(KeyName);
    Reg.GetKeyNames(slKeys);
    Reg.CloseKey;

    if (slKeys.Count = 0) then Exit;

    // Delete any key begining with characters (not related to R from CRAN),
    // for example 'R64' generated in my computer by Microsoft MRAN
    for i:= (slKeys.Count - 1) downto 0 do
      if (fRegEx(slKeys.Strings[i],
                 '^[a-zA-Z]+',
                 False) <> '') then slKeys.Delete(i);

    // There is no valid R in the registry.
    if (slKeys.Count = 0) then Exit;
    slKeys.Sort;

    // Necessary to clean the sheet that MRAN did in the registry!
    // https://regex101.com/r/8GvkHs/5
    //$re = '/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/';
    //$str = '3.5.1
    //   [32 b] C:\\Program Files\\R\\3.5.1\\bin\\i386
    //   [64 b] C:\\Program Files\\R\\3.5.1\\bin\\x64
    //
    //3.5.1patched
    //   [64 b] C:\\Program Files\\R\\3.5.1patched\\bin\\x64
    //
    //3.5.1.0
    //   [64 b] C:\\Program Files\\Microsoft \\R Open\\3.5.1patched\\bin\\x64
    //
    //3.5.1.0 Microsoft R Open
    //   [64 b] C:\\Program Files\\Microsoft \\R Open\\3.5.1patched\\bin\\x64
    //
    //3.6.0 Pre-release
    //   [64 b] C:\\Program Files\\R\\R_devel\\bin\\x64
    //';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    for i:= (slKeys.Count - 1) downto 1 do begin
      {
      // To debug only
      ShowMessage(slKeys.Strings[i] +
                  ' | ' +
                  slKeys.Strings[i - 1]);

      ShowMessage('fRegex: ' + fRegEx(slKeys.Strings[i],
                        '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+',
                        False) +
                  ' | ' +
                  fRegEx(slKeys.Strings[i - 1],
                        '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+',
                        False));
      }
      if (fRegEx(slKeys.Strings[i],
                 '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+',
                 False) <> EmptyStr) and
         (fRegEx(slKeys.Strings[i],
                 '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+',
                 False) <> EmptyStr) then

        if AnsiCompareStr(fRegEx(slKeys.Strings[i],
                                 '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+',
                                 False),
                          fRegEx(slKeys.Strings[i - 1],
                                 '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+',
                                 False)) = 0
      then begin
        slKeys.Delete(i - 1);
      end;
    end;

    // slKey contain all keys from the registry sanitezed
    for i:= 0 to (slKeys.Count - 1) do begin
      slRAvailable.Add(slKeys.Strings[i]);
      pKey_Complete(slKeys[i]);
      slRAvailable.Add('');
    end;
  finally
    Reg.Free;
    slKeys.Free;
  end;
end;

function fGetAssociation(const DocFileName: string): string;
var
  FileClass: string;
  Reg: TRegistry;

begin
  Result:= '';
  Reg:= TRegistry.Create(KEY_EXECUTE);
  Reg.RootKey:= HKEY_CLASSES_ROOT;
  FileClass:= '';
  if Reg.OpenKeyReadOnly(ExtractFileExt(DocFileName)) then
  begin
    FileClass:= Reg.ReadString('');
    Reg.CloseKey;
  end;
  if FileClass <> '' then begin
    if Reg.OpenKeyReadOnly(FileClass +
                           '\Shell\Open\Command') then
    begin
      Result:= Reg.ReadString('');
      Reg.CloseKey;
    end;
  end;
  Reg.Free;
end;

// Adapted from SynEdit by JCFaria
function fGetPosMatching_Forward(Str: string;
                                 parIni,
                                 parFim: string): integer;
var
  iPos,
   iLen,
   iCount: integer;

  iTmp: char;

begin
  Result:= 0;
  repeat

    iCount:= 1;
    iPos  := 0;
    // search first occurrence of the matching 'parIni', i.e 'parFim', until end of line
    iLen:= Length(Str);
    while iPos < iLen do begin
      inc(iPos);
      iTmp:= Str[iPos];  // pega o primeiro caracter
      if (iTmp = parIni) or
         (iTmp = parFim) then begin
        if (iTmp = parIni) then inc(iCount)
        else if (iTmp = parFim) then begin
          dec(iCount);
          if (iCount = 1) then begin
            // matching bracket found, set pos
            Result:= iPos;
            Exit;
          end
        end;
      end;
    end;
  until iPos = iLen;
end;

// Adapted from SynEdit by JCFaria
function fGetPosMatching_Backward(Str: string;
                                  parIni,
                                  parFim: string): integer;
var
  iPos,
   iLen,
   iCount: integer;

  iTmp: char;

begin
  Result:= 0;
  repeat
    iCount:= 1;
    iPos  := Length(Str) +
             1;
    // search first occurrence of the matching 'parIni', i.e 'parFim', until end of line
    iLen:= 1;
    while iPos > iLen do begin
      dec(iPos);
      iTmp:= Str[iPos];
      if (iTmp = parIni) or
         (iTmp = parFim) then begin
        if (iTmp = parFim) then inc(iCount)
        else if (iTmp = parIni) then begin
          dec(iCount);
          if (iCount = 1) then begin
            // matching bracket found, set pos
            Result:= iPos;
            Exit;
          end
        end;
      end;
    end;
  until iPos = iLen;
end;


function fLastPos(sSub, s: string): Integer;
var
  iFound, iLen, iPos: integer;

begin
  iPos:= Length(s);
  iLen:= Length(sSub);
  iFound:= 0;

  while (iPos > 0) and (iFound = 0) do
  begin
    if (Copy(s, iPos, iLen) = sSub) then iFound:= iPos;
    Dec(iPos);
  end;

   fLastPos:= iFound;
end;

// From Marco Cantu
function fCount_Char(Text,
                     Sub: string): Integer;
var
  iPos: Integer;

begin
  Result:= 0;
  iPos:= PosEx(Sub,
               Text,
               1); // default
  while (iPos > 0) do begin
    Inc (Result);
    iPos:= PosEx(Sub,
                 Text,
                 iPos + Length (Sub));
  end;
end;

function fGetRPackage(sTmp: string): string;
var
  iIni,
   iFim: integer;
   
begin
  iIni:= Pos('[',
             sTmp);
  iFim:= Pos(']',
            sTmp);
  Result:= Copy(sTmp,
                iIni,
                iFim - iIni + 1);
end;

function fGetRObject(sTmp: string): string;
var
  iIni,
   iFim: integer;
   
begin
  iIni:= Pos('<',
             sTmp);
  iFim:= Pos('>',
             sTmp);
  Result:= Copy(sTmp,
                iIni,
                iFim - iIni + 1);
end;

procedure pGet_RInfo(sTmp: string;
                     var sRPackage,
                         sRObject: string);
var
  iIni,
   iFim: integer;

begin
  iIni:= fGetPosMatching_Backward(sTmp,
                                  '[',
                                  ']');
  iFim:= Pos('>',
             sTmp);
  if (iIni > 0) then begin
    sTmp:= Copy(sTmp,
                iIni,
                iFim + 1);
    sRpackage:= fgetRPackage(sTmp);
    sRObject := fgetRObject(sTmp);
  end;
end;

function fStrip_Path(sFileName: string): string;
var
  iSlashPos: integer;
  sTmp     : string;

begin
  sTmp:= sFileName;
  repeat
    iSlashpos:= Pos('\',
                    sTmp);
    sTmp     := Copy(sTmp,
                     iSlashPos + 1,
                     length(sTmp));
  until (iSlashPos = 0);
  Result:= sTmp;
end;

function fStrip_FileName(sFileName: string): string;
var
  iSlashPos,
   iNamePos: integer;

  sTmp: string;

begin
  sTmp:= sFileName;
  repeat
    iSlashPos:= Pos('\',
                    sTmp);
    sTmp     := Copy(sTmp,
                     iSlashPos + 1,
                     length(sTmp));
  until (iSlashPos = 0);
  iNamePos:= Pos(sTmp,
                 sFilename);
  sTmp    := Copy(sFileName,
                  1,
                  iNamePos-1);
  Result  := sTmp;
end;

procedure pDelete_Dir(sDir: string);
var
  t: TSHFileOpStruct;

begin
  Fillchar(t,
           SizeOf(t),
           #0);

  with T do begin
    Wnd   := 0;
    wFunc := FO_DELETE;
    pFrom := pchar(sDir +
                   #0#0);

    fFlags:= FOF_SILENT or FOF_NOCONFIRMATION;
  end;

  Application.ProcessMessages;
  if (SHFileOperation(t) <> 0) then RemoveDir(sDir);
end;

// Function to ask Windows for a special folder and convert the "Windows string" into Delphi string
// From: http://forum.codecall.net/topic/60120-using-special-folders-to-comply-with-uac-enabled-windows-with-delphi-code/
function fGetSpecialFolder(const ASpecialFolderID: Integer): string;
var
  vSFolder:  pItemIDList;

  vSpecialPath: array[0..MAX_PATH] of Char;

begin
  SHGetSpecialFolderLocation(0,
                             ASpecialFolderID,
                             vSFolder);

  SHGetPathFromIDList(vSFolder,
                      vSpecialPath);

  Result:= StrPas(vSpecialPath);
end;

function fRegEx(sSubject,
                sRegEx: string;
                bReplace: boolean = False;
                sReplacement: string = ''): string;
begin
  try
    preRegEx:= TPerlRegEx.Create;
    try
      with preRegEx do begin
        Subject:= sSubject;
        RegEx:= sRegEx;
        // Replacement
        if bReplace then begin
          Replacement:= sReplacement;
          if Match then begin
            Replace;
            Result:= Subject;
          end
          else Result:= ''
        end
        // Matches
        else begin
          Match;
          if FoundMatch then
            Result:= MatchedText
          else Result:= '';
        end;
      end;
    except
      // TODO: Syntax error in the regular expression
    end;
  finally
    FreeAndNil(preRegEx);
  end;
end;

function fRegEx_Multiline(sSubject,
                          sRegEx: string): string;
var
  i: integer;

  sTmp: string;

begin
  try
    preRegEx:= TPerlRegEx.Create;
    preRegEx.Options:= [preMultiLine];
    try
      with preRegEx do begin
        Subject:= sSubject;
        RegEx:= sRegEx;
        if Match then
          repeat
            for i:= 0 to GroupCount do begin
              sTmp:= Groups[i];
              Result:= Result +
                       sTmp +
                       #13#10;
            end;
          until not MatchAgain
        else
          Result:= '';
      end;
    except
      // TODO: Syntax error in the regular expression
    end;
  finally
    FreeAndNil(preRegEx);
  end;
end;

// Old from Tinn-R 2.4.1.7
function fDataFolder: string;
var
  malloc: IMalloc;
  pidl  : PItemIDList;

begin
  SHGetSpecialFolderLocation(0, CSIDL_APPDATA, pidl);
  SetLength(Result, MAX_PATH);
  SHGetPathFromIDList(pidl, pchar(Result));
  SetLength(Result, StrLen(pchar(Result)));

  OLECheck(SHGetMalloc(malloc));
  if Assigned(pidl) then Malloc.Free(pidl);
end;

// From: http://stackoverflow.com/questions/325872/detect-an-internet-connection-activation-with-delphi?rq=1
// It is simple but make the job for the purposes of Tinn-R projet!
function fIsConnected: boolean;
const
  INTERNET_CONNECTION_MODEM      = 1;  // local system uses a modem to connect to the Internet.
  INTERNET_CONNECTION_LAN        = 2;  // local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_PROXY      = 4;  // local system uses a proxy server to connect to the Internet.
  INTERNET_CONNECTION_MODEM_BUSY = 8;  // local system's modem is busy with a non-Internet connection.

var
  dwConnectionTypes: DWORD;

begin
  dwConnectionTypes:= INTERNET_CONNECTION_MODEM +
                      INTERNET_CONNECTION_LAN +
                      INTERNET_CONNECTION_PROXY;

  Result:= InternetGetConnectedState(@dwConnectionTypes,
                                     0);
end;

function fIsValidNumber_RVersion(s: string): boolean;
var
  i: integer;

begin
  i:= 1;

  while (i <= length(s)) and
        (s[i] in ['0'..'9',
                  '.']) do inc(i);

  result:= i > length(s);
end;

// From: http://delphi.wikia.com/wiki/Capture_Console_Output_Realtime_To_Memo
procedure pCaptureConsole_Output(const ACommand, AParameters: String; AMemo: TMemo);
 const
   CReadBuffer = 2400;
 var
   saSecurity: TSecurityAttributes;
   hRead: THandle;
   hWrite: THandle;
   suiStartup: TStartupInfo;
   piProcess: TProcessInformation;
   pBuffer: array[0..CReadBuffer] of Char;
   dRead: DWord;
   dRunning: DWord;
 begin
   saSecurity.nLength := SizeOf(TSecurityAttributes);
   saSecurity.bInheritHandle := True;
   saSecurity.lpSecurityDescriptor := nil;

   if CreatePipe(hRead, hWrite, @saSecurity, 0) then
   begin
     FillChar(suiStartup, SizeOf(TStartupInfo), #0);
     suiStartup.cb := SizeOf(TStartupInfo);
     suiStartup.hStdInput := hRead;
     suiStartup.hStdOutput := hWrite;
     suiStartup.hStdError := hWrite;
     suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
     suiStartup.wShowWindow := SW_HIDE;

     if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity,
       @saSecurity, True, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup, piProcess)
       then
     begin
       repeat
         dRunning  := WaitForSingleObject(piProcess.hProcess, 100);
         Application.ProcessMessages();
         repeat
           dRead := 0;
           ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
           pBuffer[dRead] := #0;

           OemToAnsi(pBuffer, pBuffer);
           AMemo.Lines.Add(String(pBuffer));
         until (dRead < CReadBuffer);
       until (dRunning <> WAIT_TIMEOUT);
       CloseHandle(piProcess.hProcess);
       CloseHandle(piProcess.hThread);
     end;

     CloseHandle(hRead);
     CloseHandle(hWrite);
   end;
end;

procedure pDelete_FilesOfPath(path: string);
var
  SR: TSearchRec;
  i: integer;

begin
  i:= FindFirst(path + '\*.*',
                faAnyFile,
                SR);

  while i = 0 do begin
      if (SR.Attr and faDirectory) <> faDirectory then
        if not DeleteFile(path + '\' + SR.Name) then
          ShowMessage('Error deleting ' + path);

      i:= FindNext(SR);
  end;
end;

function fIsUrl(S: string): boolean;
(*
const
cbad = ';*<>{}[]|\()^!';
*)

var
  p,
   x,
   c,
   count,
   i: integer;

begin
  Result:= False;

  if (Length(S) > 5) and (S[Length(S)] <> '.') and (Pos(S, '..') = 0) then begin
{
    for i := Length(cbad) downto 1 do
      if Pos(cbad[i], S) > 0 then Exit;
}
    for i:= 1 to Length(S) do
      if (Ord(S[i]) < 33) or (Ord(S[i]) > 126) then Exit;

    if ((Pos('www.', LowerCase(S)) = 1) and (Pos('.', Copy(S, 5, Length(s))) > 0) and (Length(S) > 7)) or ((Pos('news:', LowerCase(S)) = 1) and (Length(S) > 7) and (Pos('.', Copy(S, 5, Length(S))) > 0)) then begin
    end
    else if ((Pos('mailto:', LowerCase(S)) = 1) and (Length(S) > 12) and (Pos('@', S) > 8) and (Pos('.', S) > 10) and (Pos('.', S) > (Pos('@', S) +1))) or ((Length(S) > 6) and (Pos('@', S) > 1) and (Pos('.', S) > 4) and (Pos('.', S) > (Pos('@', S) +1))) then begin
      Result:= True;
      Exit;
    end
    else if ((Pos('http://', LowerCase(S)) = 1) and (Length(S) > 10) and (Pos('.', S) > 8)) or ((Pos('ftp://', LowerCase(S)) = 1) and (Length(S) > 9) and (Pos('.', S) > 7)) then begin
      Result:= True;
      Exit;
    end
    else if ((Pos('https://', LowerCase(S)) = 1) and (Length(S) > 12) and (Pos('.', S) > 9)) or ((Pos('ftp://', LowerCase(S)) = 1) and (Length(S) > 9) and (Pos('.', S) > 7)) then begin
      Result:= True;
      Exit;
    end
    else Result:= True;

    for Count:= 1 to 4 do begin
      p:= Pos('.', S) - 1;

      if p < 0 then p := Length(S);

      Val(Copy(S, 1, p), x, c);

      if ((c <> 0) or (x < 0) or (x > 255) or (p > 3)) then begin
        Result:= False;
        Break;
      end;

      Delete(S, 1, p + 1);
    end;

    if (S <> '') then Result:= False;
  end;
end;

// Adapted from: http://forum.codecall.net/topic/61197-delphihow-to-get-windows-drives-list/
procedure pGet_DriveLetters(slTmp: TStringList);  // Portable
var
  vDrivesSize: Cardinal;

  vDrives: array[0..128] of Char;

  vDrive: PChar;

begin
  slTmp.BeginUpdate;

  try
    // Clear the list from possible leftover from prior operations
    slTmp.Clear;
    vDrivesSize := GetLogicalDriveStrings(SizeOf(vDrives),
                                          vDrives);
    if vDrivesSize=0 then Exit;  // No drive found, no further processing needed!

    vDrive := vDrives;
    while vDrive^ <> #0 do begin
      slTmp.Add(StrPas(vDrive));
      Inc(vDrive,
          SizeOf(vDrive));
    end;
  finally
    slTmp.EndUpdate;
  end;
end;

// Adapted from: http://www.cryer.co.uk/brian/delphi/wininet/example_download_file_http.htm
function fDownload_File(const url: string;
                        const sFileName: string): boolean;
var
  hInet,
   hFile: HINTERNET;

  localFile: File;

  buffer: array[1..1024] of byte;

  bytesRead: DWORD;

begin
  Result:= False;

  hInet:= InternetOpen(PChar(application.title),
                       INTERNET_OPEN_TYPE_PRECONFIG,
                       nil,
                       nil,
                       0);

  hFile:= InternetOpenURL(hInet,
                          PChar(url),
                          nil,
                          0,
                          0,
                          0);

  if Assigned(hFile) then
  begin
    AssignFile(localFile,
               sFileName);

    Rewrite(localFile,
            1);

    repeat
      InternetReadFile(hFile,
                       @buffer,
                       SizeOf(buffer),
                       bytesRead);

      BlockWrite(localFile,
                 buffer,
                 bytesRead);

    until bytesRead = 0;

    CloseFile(localFile);

    Result:= true;

    InternetCloseHandle(hFile);
  end;

  InternetCloseHandle(hInet);
end;

// Adapted from: http://stackoverflow.com/questions/960772/how-can-i-sanitize-a-string-for-use-as-a-filename
function fSanitize_FileName(const sInputString: string): string;
var
  i: integer;

  sTmp: string;

begin
  sTmp:= sInputString;

  for i:= 1 to Length(sTmp) do
  begin
    // These chars are invalid in file names.
    case sTmp[i] of
      '/', '\', ':', '*', '?', '"', '<', '>', '|', ' ', #$D, #$A, #9:
        // Use a * to indicate a duplicate space so we can remove
        // them at the end.
        {$WARNINGS OFF} // W1047 Unsafe code 'String index to var param'
        if (i > 1) and
          ((sTmp[i - 1] = ' ') or
          (sTmp[i - 1] = '*')) then sTmp[i] := '*'
        else
          sTmp[i] := '_';
        {$WARNINGS ON}
    end;
  end;

  // A * indicates duplicate spaces.  Remove them.
  result:= ReplaceStr(sTmp,
                      '*',
                      '_');

  // Also trim any leading or trailing spaces
  result:= Trim(result);

  if (result = '') then
  begin
    raise(Exception.Create('Resulting FileName was empty Input string was: ' +
                           sInputString));
  end;
end;

// Adapted from: http://delphidabbler.com/tips/64
function fGetEnvVariable(Name: string;
                         User: boolean = True): string;
var
  aTmp: array[0..255] of char;

begin
  with TRegistry.Create do
  try
    if User then begin
      RootKey:= HKEY_CURRENT_USER;

      //OpenKey('Environment', False);
      OpenKeyReadOnly('Environment');
    end
    else begin
      RootKey:= HKEY_LOCAL_MACHINE;

      //OpenKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment', False);
      OpenKeyReadOnly('SYSTEM\CurrentControlSet\Control\Session Manager\Environment');
    end;
    Result:= ReadString(Name);
    ExpandEnvironmentStrings(PChar(Result),
                             aTmp,
                             255);
    Result:= aTmp;
  finally
    Free;
  end;
end;

// Adapted from: http://delphidabbler.com/tips/64
procedure pSet_EnvVariable(Name,
                           Value: string;
                           User: boolean = True);
var
  rv: DWORD;

begin
  with TRegistry.Create do
  try
    if User then begin
      RootKey:= HKEY_CURRENT_USER;
      OpenKey('Environment',
              False);
    end
    else begin
      RootKey:= HKEY_LOCAL_MACHINE;
      OpenKey('SYSTEM\CurrentControlSet\Control\Session Manager\Environment',
              False);
    end;
    WriteString(Name,
                Value);

    // The below will update the variable to other processes
    SendMessageTimeout(HWND_BROADCAST,
                       WM_SETTINGCHANGE,
                       0,
                       LParam(PChar('Environment')),
                       SMTO_ABORTIFHUNG,
                       5000,
                       rv);
  finally
    Free;
  end;
end;

function fFile_Exists_PuTTY(sFile,
                            sFileRemote,
                            sPuTTYPath,
                            sPuTTYPassword,
                            sPuTTYUser,
                            sPuTTYHost: string): boolean;
var
  sCmd: string;

begin
  Result:= False;

  sCmd:= sPuTTYPath +
         ' -pw ' +
         sPuTTYPassword +
         ' ' +
         sPuTTYUser +
         '@' +
         sPuTTYHost +
         ':' +
         sFileRemote +
         ' ' +
         sFile;

  if fOpen_CmdLine(sCmd,
                   SW_HIDE) then
    if FileExists(sFile) and
       not fFile_InUse (sFile) then Result:= True;
end;

function fFile_InUse(sFile: string): boolean;
var
  hFileRes: HFILE;

begin
  Result:= False;
  if not FileExists(sFile) then exit;
  hFileRes := CreateFile(PChar(sFile),
                         GENERIC_READ or GENERIC_WRITE,
                         0,
                         nil,
                         OPEN_EXISTING,
                         FILE_ATTRIBUTE_NORMAL,
                         0);
  Result:= (hFileRes = INVALID_HANDLE_VALUE);
  if not Result then
    CloseHandle(hFileRes);
end;

// from: http://www.swissdelphicenter.ch/torry/showcode.php?id=2413
function fDirectory_IsEmpty(Directory: string): boolean;
var
  SR: TSearchRec;

  i: Integer;

begin
  Result:= False;

  FindFirst(IncludeTrailingPathDelimiter(Directory) +
            '*',
            faAnyFile,
            SR);

  for i:= 1 to 2 do
    if (SR.Name= '.') or
       (SR.Name= '..') then Result:= FindNext(SR) <> 0;

  FindClose(SR);
end;

function fIsInteger(sTmp: string): boolean;
begin
  try
    result:= True;

    StrToInt(Trim(sTmp));
  except
    On EConvertError do result:= False;
  end;
end;

function fIsPortable_Version: boolean;
begin
  Result:= fRegEx(Application.Title,
                  'portable',
                  False) <> EmptyStr;
end;

function fPathRExists(var sPathR: string): boolean;  // Portable
var
  slDrives: TStringList;

  i: integer;

  sTmp: string;

begin
  Result:= False;
  
  if FileExists(sPathR) then Result:= TRUE
  else begin
    try
      slDrives:= TStringList.Create;
      pGet_DriveLetters(slDrives);

      for i:= 0 to slDrives.Count-1 do begin
        sTmp:= fRegEx(sPathR,
                      '^[a-zA-Z]:\\', // starting by any letter, followed by : and \
                      True,
                      slDrives.Strings[i]);

        if FileExists(sTmp) then begin
          sPathR:= sTmp;
          Result:= True;
          Exit;
        end;
      end;

    finally
      FreeAndNil(slDrives);
    end;
  end;
end;

end.

{sRVersion:= Copy(sPath_R,
                  LastDelimiter('\',
                                sPath_R) + 1,
                  Length(sPath_R));}

