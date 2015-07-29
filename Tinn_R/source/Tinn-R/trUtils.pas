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

unit trUtils;

interface

uses
  Windows, SysUtils, Dialogs, Classes, Clipbrd, Registry, Graphics, Controls, StrUtils,
  ActiveX, ShlObj, ComObj, PerlRegEx, WinInet, StdCtrls;

type
  TCharSet = set of Char;
  TGuiType = (gtJGR, gtUnknown);


  function ClipboardTxtToFile (sFileTXT: string): boolean;
  function ContrastColor(FontC: TColor): TColor;
  function CountChar(Text, Sub: string): Integer;
  function DataFolder: string;
  function DownloadFile(const url: string; const sFileName: string): boolean;
  function ExecAndWait(const sFileName, sParams: string; wWindowState: Word): Boolean;
  function ExecCmdLineAndWait(const CmdLine: string; wWindowState: Word): Boolean;
  function FileSaveFast(sFilePath, sContent: string): boolean;
  function FileToString(sPath: string): string;
  function GetAssociation(const DocFileName: string): string;
  function GetPosMatchingBackward(Str: string; parIni, parFim: string): integer;
  function GetPosMatchingForward(Str: string; parIni, parFim: string): integer;
  function GetRegistryValue(KeyName: string): string;
  function GetRObject(sTmp: string): string;
  function GetRPackage(sTmp: string): string;
  function GetSpecialFolder(const ASpecialFolderID: Integer): string;
  function GetWindowHandle(const chCaption: PChar; const bPartial: Boolean = False): HWND;
  function InvertString(sStr: string): string;
  function Is64Bit_OS: Boolean;
  function IsConnected: boolean;
  function IsGuiRunning(var hRgui: HWND; var sCaption: string; var iRecognitionCaption, iRecognitionType: integer): Boolean;
  function IsValidNumber_RVersion(s: string): boolean;
  function IsURL(s: string): Boolean;
  function LastPos(sSub, s: string): Integer;
  function OpenCmdLine(const CmdLine: string; wWindowState: Word): Boolean;
  function OpenUrl(const sURL: string): Boolean;
  function OpenUrlByIEShell(const sURL: string): Boolean;
  function PathBrowser: String;
  function RegEx(sSubject, sRegEx: string; bReplace: boolean = False; sReplacement: string = ''): string;
  function RegEx_Multiline(sSubject, sRegEx: string): string;
  function RemoveFileExtension(sFile: string): string;
  function RunFile(const sName: string = ''; const sPar1: string = '';  const sPar2: string = ''): Integer;
  function SanitizeFileName(const sInputString: string): string;
  function SavePriorClipboardText: Boolean;
  function SortDate(List: TStringList; Index1, Index2: Integer): Integer;
  function SortInteger(List: TStringList; Index1, Index2: Integer): Integer;
  function StringToCaseSelect(sSelector : string; aCaseList: array of string): Integer;
  function StripFileName(sFileName: string): string;
  function StripNonConforming(const sTmp: string; const ValidChars: TCharSet): string;
  function StripPath(sFileName: string): string;
  function StrippedOfNonAscii(const s: string): string;
  procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
  procedure DeleteDir(sDir: string);
  procedure DeleteFilesOfPath(path: string);
  procedure GetDriveLetters(slTmp: TStringList);
  procedure GetRInfo(sTmp: string; var sRPackage, sRObject: string);
  procedure OpenFile(sFileName: string);
  procedure OpenProgram(sProg, sParams: string);
  procedure PSendMessage(msg: HINST);
  procedure RestorePriorClipboardText;
  procedure StrSplit(const cDelimiter: Char; sInput: string; const tsStrings: TStrings);

implementation

uses
  ShellAPI,
  SHDocVw,
  Forms;

const
  RGui: array[0..2] of string = ('R Console (64-bit)', //R: 64 SDI mode
                                 'R Console (32-bit)', //R: 32 SDI mode
                                 'Console');           //R: JGR

var
  preRegEx: TPerlRegEx;

  sOldClipBoard: string;

// adapted from http://www.delphipages.com/forum/showthread.php?t=120031
function GetWindowHandle(const chCaption: PChar;
                         const bPartial: Boolean = False): HWND;
var
  chTmp : PChar;
  i     : Integer;
  hTmp  : HWND;

  sTmp1,
   sTmp2: string;

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
        sTmp1:= LowerCase(string(chTmp));
        sTmp2:= LowerCase(string(chCaption));
        if (SameStr(sTmp1,
                    sTmp2)) then Result:= hTmp
        else if bPartial and
                Assigned(AnsiStrPos(chTmp,
                                    chCaption)) and
                not Assigned(AnsiStrPos(chTmp,
                                        'RGui')) then Result:= hTmp;
      hTmp:= GetWindow(hTmp,
                       GW_HWNDNEXT);
    end;
  finally
    FreeMem(chTmp);
  end;
end;

function IsGuiRunning(var hRgui: HWND;
                      var sCaption: string;
                      var iRecognitionCaption,
                          iRecognitionType: integer): Boolean;
var
  i   : integer;
  hTmp: HWND;

begin
  Result:= False;
  hRgui := 0;
  hTmp  := 0;

  case iRecognitionCaption of
    //R: 64 bit SDI mode --> R Console (64-bit)
    0: begin
         hTmp:= GetWindowHandle(Pchar(RGUI[0]),
                                Boolean(iRecognitionType));
         if (hTmp <> 0) then sCaption:= RGUI[0];
       end;

    // R: 32 bit SDI mode --> R Console (32-bit)
    1: begin
         hTmp:= GetWindowHandle(Pchar(RGUI[1]),
                                Boolean(iRecognitionType));
         if (hTmp <> 0) then sCaption:= RGUI[1];
       end;

    // Both R: 64 bit SDI mode & 32 bit SDI mode --> R Console (64-bit) & R Console (32-bit)
    2: begin
         for i:= 0 to 1 do begin
           hTmp:= GetWindowHandle(Pchar(RGUI[i]),
                                  Boolean(iRecognitionType));
           if (hTmp <> 0) then begin
             sCaption:= RGUI[i];
             Break;
           end;
         end;
       end;

    // JGR --> R Console
    3: begin
         hTmp:= GetWindowHandle(Pchar(RGUI[2]),
                                Boolean(iRecognitionType));
         if (hTmp <> 0) then sCaption:= RGUI[2];
       end;

    // All
    4: begin
         for i:= 0 to 2 do begin
           hTmp:= GetWindowHandle(Pchar(RGUI[i]),
                                  Boolean(iRecognitionType));
           if (hTmp <> 0) then begin
             sCaption:= RGUI[i];
             Break;
           end;
         end;
       end;
  end;

  if (hTmp <> 0) then begin
    hRgui := hTmp;
    Result:= True;
  end;
end;

function FileToString(sPath: string): string;
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

function ContrastColor(FontC: TColor): TColor;
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

function RemoveFileExtension(sFile: string): string;
var
  sTemp,
   sInvName: string;

  iPos: integer;

begin
  sTemp   := ExtractFilePath(sFile);
  sFile   := ExtractFileName(sFile);
  sInvName:= InvertString(sFile);
  iPos    := pos('.',
                 sInvName);
  if (iPos > 0) then sFile:= copy(sFile,
                                  1,
                                  length(sFile) - iPos);
  sFile   := sTemp +
             sFile;
  Result  := sFile;
end;

function InvertString(sStr: string): string;
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

function RunFile(const sName: string = '';
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

function OpenUrl(const sURL: string): Boolean;
const
  csPrefix = 'http://';
var
  sURLLocal: string;

begin
  if (Pos(csPrefix,
          LowerCase(sURL)) < 1) then sURLLocal:= csPrefix + sURL
  else sURLLocal:= sURL;
  Result:= RunFile(sURLLocal) > 32;
  {$IFDEF MSWINDOWS}
  //if fail to open sURL by default browser, then try to use IE
  if not Result then Result:= OpenUrlByIEShell(sURLLocal);
  {$ENDIF}
end;

function OpenUrlByIEShell(const sURL: string): Boolean;
var
  iE: IWebBrowser2;
  vI: OleVariant;

begin
  Result:= False;
  try
    iE:= CoShellBrowserWindow.Create;
    if (iE = nil) then Exit;
    iE.Visible:= True;
    iE.Navigate(sURL,
                vI,
                vI,
                vI,
                vI);
    Result:= True;
  except
    ; //TODO
  end;
end;

// from: http://delphi.about.com/cs/adptips2002/a/bltip0202_5.htm
{
Usage:

case StringToCaseSelect('Delphi',
      ['About','Borland','Delphi']) of
   0:ShowMessage('You''ve picked About') ;
   1:ShowMessage('You''ve picked Borland') ;
   2:ShowMessage('You''ve picked Delphi') ;
end;
}
function StringToCaseSelect(sSelector: string;
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
procedure StrSplit(const cDelimiter: Char;
                   sInput: string;
                   const tsStrings: TStrings);
begin
   Assert(Assigned(tsStrings)) ;
   tsStrings.Clear;
   tsStrings.Delimiter    := cDelimiter;
   tsStrings.DelimitedText:= sInput;
end;

function SavePriorClipboardText: Boolean;
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

procedure RestorePriorClipboardText;
begin
  while not OpenClipboard(Application.Handle) do Sleep(50);
  if OpenClipboard(Application.Handle) then
    with Clipboard do
      AsText:= sOldClipBoard;
end;

procedure PSendMessage(msg: HINST);
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
procedure OpenFile(sFileName: string);
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
procedure OpenProgram(sProg,
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
function ExecAndWait(const sFileName,
                           sParams: string;
                     wWindowState: Word): Boolean;
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
function ExecCmdLineAndWait(const CmdLine: string;
                            wWindowState: Word): Boolean;
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
function OpenCmdLine(const CmdLine: string;
                     wWindowState: Word): Boolean;
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

function pathBrowser: String;
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
      if (i > 0) then sBrowser:= copy(sBrowser,
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

function SortDate(List: TStringList;
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

function SortInteger(List: TStringList;
                     Index1,
                     Index2: Integer): Integer;
var
  b1,
   b2: boolean;

  i1,
   i2: integer;

  function IsInt(AString : string;
                 var AInteger : Integer): Boolean;
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
function ClipboardTxtToFile (sFileTXT: string): boolean;
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

function FileSaveFast(sFilePath,
                      sContent: string): boolean;
var
  tf: TextFile;

begin
  AssignFile(tf,
             sFilePath);
    ReWrite(tf);
    WriteLn(tf,
            sContent);
  CloseFile(tf);
  Result:= True;
end;

function StrippedOfNonAscii(const s: string): string;
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

function StripNonConforming(const sTmp: string;
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
function Is64Bit_OS: Boolean;
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

function GetRegistryValue(KeyName: string): string;
var
  i,
   iMajor: integer;

  Reg : TRegistry;
  sVal: TStringList;

  sMajor,
    sTmp: string;

begin
  Result:= '';
  Reg   := nil;
  sVal  := nil;

  try
    if Is64Bit_OS then Reg:= TRegistry.Create(KEY_READ or KEY_WOW64_64KEY)
                  else Reg:= TRegistry.Create(KEY_READ);

    sVal:= TStringList.Create;

    Reg.RootKey:= HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly(KeyName);
    Reg.GetKeyNames(sVal);
    Reg.CloseKey;

    if (sVal.Count <> 0) then begin
      sMajor:= '0.0.0';
      iMajor:= 0;

      for i:= 0 to (sVal.Count - 1) do begin
        sTmp:= StripNonConforming(sVal.Strings[i],
                                  ['.', '0'..'9']);
        if (AnsiCompareStr(sTmp,
                           sMajor) > 0) then begin
          sMajor:= sTmp;
          iMajor:= i;
        end;
      end;

      KeyName:= KeyName +
                '\' +
                sVal.Strings[iMajor];

      Reg.OpenKeyReadOnly(KeyName);

      Result:= Reg.ReadString('InstallPath');

      Reg.CloseKey;
    end;
  finally
    Reg.Free;
    sVal.Free;
  end;
end;

function GetAssociation(const DocFileName: string): string;
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
function GetPosMatchingForward(Str: string;
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
function GetPosMatchingBackward(Str: string;
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


function LastPos(sSub, s: string): Integer;
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

  LastPos:= iFound;
end;


// From Marco Cantu
function CountChar(Text,
                   Sub: string): Integer;
var
  iPos: Integer;

begin
  Result:= 0;
  iPos:= PosEx (Sub,
                Text,
                1); // default
  while iPos > 0 do begin
    Inc (Result);
    iPos:= PosEx (Sub,
                  Text,
                  iPos + Length (Sub));
  end;
end;

function GetRPackage(sTmp: string): string;
var
  iIni,
   iFim: integer;
   
begin
  iIni:= pos('[',
             sTmp);
  iFim:= pos(']',
            sTmp);
  Result:= copy(sTmp,
                iIni,
                iFim - iIni + 1);
end;

function GetRObject(sTmp: string): string;
var
  iIni,
   iFim: integer;
   
begin
  iIni:= pos('<',
             sTmp);
  iFim:= pos('>',
             sTmp);
  Result:= copy(sTmp,
                iIni,
                iFim - iIni + 1);
end;

procedure GetRInfo(sTmp: string;
                   var sRPackage,
                       sRObject: string);
var
  iIni,
   iFim: integer;

begin
  iIni:= GetPosMatchingBackward(sTmp,
                                '[',
                                ']');
  iFim:= pos('>',
             sTmp);
  if (iIni > 0) then begin
    sTmp:= copy(sTmp,
                iIni,
                iFim + 1);
    sRpackage:= getRPackage(sTmp);
    sRObject := getRObject(sTmp);
  end;
end;

function StripPath(sFileName: string): string;
var
  iSlashPos: integer;
  sTmp     : string;

begin
  sTmp:= sFileName;
  repeat
    iSlashpos:= pos('\',
                    sTmp);
    sTmp     := copy(sTmp,
                     iSlashPos + 1,
                     length(sTmp));
  until (iSlashPos = 0);
  Result:= sTmp;
end;

function StripFileName(sFileName: string): string;
var
  iSlashPos,
   iNamePos: integer;

  sTmp: string;

begin
  sTmp:= sFileName;
  repeat
    iSlashPos:= pos('\',
                    sTmp);
    sTmp     := copy(sTmp,
                     iSlashPos + 1,
                     length(sTmp));
  until (iSlashPos = 0);
  iNamePos:= pos(sTmp,
                 sFilename);
  sTmp    := copy(sFileName,
                  1,
                  iNamePos-1);
  Result  := sTmp;
end;

procedure DeleteDir(sDir: string);
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
function GetSpecialFolder(const ASpecialFolderID: Integer): string;
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

function RegEx(sSubject,
               sRegEx: string;
               bReplace: boolean = False;
               sReplacement: string = ''): string;
begin
  try
    preRegEx:= TPerlRegEx.Create;
    try
      with preRegEx do begin
        Subject:= sSubject;
        RegEx  := sRegEx;
        // Replacement
        if bReplace then begin
          Replacement:= sReplacement;
          if ReplaceAll then
            Result:= Subject
          //else Result:= 'No matches';
          else
            Result:= '';
        end
        // Matches
        else begin
          Match;
          if FoundMatch then
            Result:= MatchedText
          //else Result:= 'No matches';
          else
            Result:= '';
        end;
      end;
    except
      // TODO: Syntax error in the regular expression
    end;
  finally
    FreeAndNil(preRegEx);
  end;
end;

// Old from Tinn-R 2.4.1.7
function DataFolder: string;
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

function RegEx_Multiline(sSubject,
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
        RegEx  := sRegEx;
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

// From: http://stackoverflow.com/questions/325872/detect-an-internet-connection-activation-with-delphi?rq=1
// It is simple but make the job for the purposes of Tinn-R projet!
function IsConnected: boolean;
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

function IsValidNumber_RVersion(s: string): boolean;
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
procedure CaptureConsoleOutput(const ACommand, AParameters: String; AMemo: TMemo);
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

procedure DeleteFilesOfPath(path: string);
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

function IsUrl(S: string): Boolean;
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
procedure GetDriveLetters(slTmp: TStringList);
var
  vDrivesSize: Cardinal;

  vDrives: array[0..128] of Char;

  vDrive: PChar;

begin
  slTmp.BeginUpdate;

  try
    // Clear the list from possible leftover from prior operations
    slTmp.Clear;
    vDrivesSize := GetLogicalDriveStrings(SizeOf(vDrives), vDrives);
    if vDrivesSize=0 then Exit; // no drive found, no further processing needed

    vDrive := vDrives;
    while vDrive^ <> #0 do begin
      slTmp.Add(StrPas(vDrive));
      Inc(vDrive, SizeOf(vDrive));
    end;
  finally
    slTmp.EndUpdate;
  end;
end;

// Adapted from: http://www.cryer.co.uk/brian/delphi/wininet/example_download_file_http.htm
function DownloadFile(const url: string;
                      const sFileName: string): boolean;
var
  hInet,
   hFile: HINTERNET;

  localFile: File;

  buffer: array[1..1024] of byte;

  bytesRead: DWORD;

begin
  result:= False;

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
    result:= true;
    InternetCloseHandle(hFile);
  end;
  InternetCloseHandle(hInet);
end;

// Adapted from: http://stackoverflow.com/questions/960772/how-can-i-sanitize-a-string-for-use-as-a-filename
function SanitizeFileName(const sInputString: string): string;
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
  result:= ReplaceStr(sTmp, '*', '_');

  // Also trim any leading or trailing spaces
  result:= Trim(result);

  if (result = '') then
  begin
    raise(Exception.Create('Resulting FileName was empty Input string was: '
      + sInputString));
  end;
end;

end.
