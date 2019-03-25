(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower Abbrevia
 *
 * The Initial Developer of the Original Code is
 * TurboPower Software
 *
 * Portions created by the Initial Developer are Copyright (C) 1997-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

{*********************************************************}
{* ABBREVIA: AbUtils.pas 3.05                            *}
{*********************************************************}
{* ABBREVIA: Utility classes and routines                *}
{*********************************************************}

{$I AbDefine.inc}

unit AbUtils;

interface

uses
{$IFDEF MSWINDOWS}
  Windows,
{$ENDIF}
{$IFDEF LINUX}
  Libc,
  DateUtils,
{$ENDIF}
  SysUtils,
  Classes;


type
  {describe the pending action for an archive item}
  TAbArchiveAction =
    (aaFailed, aaNone, aaAdd, aaDelete, aaFreshen, aaMove, aaReplace,
     aaStreamAdd);
  TAbProcessType =
    (ptAdd, ptDelete, ptExtract, ptFreshen, ptMove, ptReplace, ptFoundUnhandled);
  TAbLogType =
    (ltAdd, ltDelete, ltExtract, ltFreshen, ltMove, ltReplace, ltStart, ltFoundUnhandled);
  TAbErrorClass =
    (ecAbbrevia, ecInOutError, ecFilerError, ecFileCreateError,
     ecFileOpenError, ecCabError, ecOther);

{$IFNDEF LINUX}
{$IFNDEF VERSION6}
const
  PathDelim  = {$IFDEF MSWINDOWS} '\'; {$ELSE} '/'; {$ENDIF}
  DriveDelim = {$IFDEF MSWINDOWS} ':'; {$ELSE} '';  {$ENDIF}
  PathSep    = {$IFDEF MSWINDOWS} ';'; {$ELSE} ':'; {$ENDIF}
{$ENDIF VERSION6}
{$ENDIF LINUX}
const
  AbPathDelim     = PathDelim; { Delphi/Linux constant }
  AbPathSep       = PathSep;   { Delphi/Linux constant }
  AbDosPathDelim  = '\';
  AbUnixPathDelim = '/';
  AbDosPathSep    = ';';
  AbUnixPathSep   = ':';
  AbDosAnyFile    = '*.*';
  AbUnixAnyFile   = '*';
  AbAnyFile       = {$IFDEF LINUX} AbUnixAnyFile; {$ELSE} AbDosAnyFile; {$ENDIF}
  AbThisDir       = '.';
  AbParentDir     = '..';

var
  AbCrc32TableOfs : Word;

type
  TAbArchiveType = (atUnknown, atZip, atSpannedZip {!!.01}, atSelfExtZip,
                    atTar, atGzip, atGzippedTar, atCab);


{$IFDEF LINUX}
type
  DWORD = LongWord;
{$ENDIF LINUX}

const
  AbCrc32Table : array[0..255] of DWord = (
  $00000000, $77073096, $ee0e612c, $990951ba,
  $076dc419, $706af48f, $e963a535, $9e6495a3,
  $0edb8832, $79dcb8a4, $e0d5e91e, $97d2d988,
  $09b64c2b, $7eb17cbd, $e7b82d07, $90bf1d91,
  $1db71064, $6ab020f2, $f3b97148, $84be41de,
  $1adad47d, $6ddde4eb, $f4d4b551, $83d385c7,
  $136c9856, $646ba8c0, $fd62f97a, $8a65c9ec,
  $14015c4f, $63066cd9, $fa0f3d63, $8d080df5,
  $3b6e20c8, $4c69105e, $d56041e4, $a2677172,
  $3c03e4d1, $4b04d447, $d20d85fd, $a50ab56b,
  $35b5a8fa, $42b2986c, $dbbbc9d6, $acbcf940,
  $32d86ce3, $45df5c75, $dcd60dcf, $abd13d59,
  $26d930ac, $51de003a, $c8d75180, $bfd06116,
  $21b4f4b5, $56b3c423, $cfba9599, $b8bda50f,
  $2802b89e, $5f058808, $c60cd9b2, $b10be924,
  $2f6f7c87, $58684c11, $c1611dab, $b6662d3d,
  $76dc4190, $01db7106, $98d220bc, $efd5102a,
  $71b18589, $06b6b51f, $9fbfe4a5, $e8b8d433,
  $7807c9a2, $0f00f934, $9609a88e, $e10e9818,
  $7f6a0dbb, $086d3d2d, $91646c97, $e6635c01,
  $6b6b51f4, $1c6c6162, $856530d8, $f262004e,
  $6c0695ed, $1b01a57b, $8208f4c1, $f50fc457,
  $65b0d9c6, $12b7e950, $8bbeb8ea, $fcb9887c,
  $62dd1ddf, $15da2d49, $8cd37cf3, $fbd44c65,
  $4db26158, $3ab551ce, $a3bc0074, $d4bb30e2,
  $4adfa541, $3dd895d7, $a4d1c46d, $d3d6f4fb,
  $4369e96a, $346ed9fc, $ad678846, $da60b8d0,
  $44042d73, $33031de5, $aa0a4c5f, $dd0d7cc9,
  $5005713c, $270241aa, $be0b1010, $c90c2086,
  $5768b525, $206f85b3, $b966d409, $ce61e49f,
  $5edef90e, $29d9c998, $b0d09822, $c7d7a8b4,
  $59b33d17, $2eb40d81, $b7bd5c3b, $c0ba6cad,
  $edb88320, $9abfb3b6, $03b6e20c, $74b1d29a,
  $ead54739, $9dd277af, $04db2615, $73dc1683,
  $e3630b12, $94643b84, $0d6d6a3e, $7a6a5aa8,
  $e40ecf0b, $9309ff9d, $0a00ae27, $7d079eb1,
  $f00f9344, $8708a3d2, $1e01f268, $6906c2fe,
  $f762575d, $806567cb, $196c3671, $6e6b06e7,
  $fed41b76, $89d32be0, $10da7a5a, $67dd4acc,
  $f9b9df6f, $8ebeeff9, $17b7be43, $60b08ed5,
  $d6d6a3e8, $a1d1937e, $38d8c2c4, $4fdff252,
  $d1bb67f1, $a6bc5767, $3fb506dd, $48b2364b,
  $d80d2bda, $af0a1b4c, $36034af6, $41047a60,
  $df60efc3, $a867df55, $316e8eef, $4669be79,
  $cb61b38c, $bc66831a, $256fd2a0, $5268e236,
  $cc0c7795, $bb0b4703, $220216b9, $5505262f,
  $c5ba3bbe, $b2bd0b28, $2bb45a92, $5cb36a04,
  $c2d7ffa7, $b5d0cf31, $2cd99e8b, $5bdeae1d,
  $9b64c2b0, $ec63f226, $756aa39c, $026d930a,
  $9c0906a9, $eb0e363f, $72076785, $05005713,
  $95bf4a82, $e2b87a14, $7bb12bae, $0cb61b38,
  $92d28e9b, $e5d5be0d, $7cdcefb7, $0bdbdf21,
  $86d3d2d4, $f1d4e242, $68ddb3f8, $1fda836e,
  $81be16cd, $f6b9265b, $6fb077e1, $18b74777,
  $88085ae6, $ff0f6a70, $66063bca, $11010b5c,
  $8f659eff, $f862ae69, $616bffd3, $166ccf45,
  $a00ae278, $d70dd2ee, $4e048354, $3903b3c2,
  $a7672661, $d06016f7, $4969474d, $3e6e77db,
  $aed16a4a, $d9d65adc, $40df0b66, $37d83bf0,
  $a9bcae53, $debb9ec5, $47b2cf7f, $30b5ffe9,
  $bdbdf21c, $cabac28a, $53b39330, $24b4a3a6,
  $bad03605, $cdd70693, $54de5729, $23d967bf,
  $b3667a2e, $c4614ab8, $5d681b02, $2a6f2b94,
  $b40bbe37, $c30c8ea1, $5a05df1b, $2d02ef8d
  );


type
  TAbPathType = ( ptNone, ptRelative, ptAbsolute );

  {===Multithread lock===}
  TAbPadLock = class
  protected {public}
    FCount  : integer;
    plCritSect : TRTLCriticalSection;
  protected
    function GetLocked : boolean;
    procedure SetLocked(L : boolean);
  public
    constructor Create;
      {-Create a multithread padlock}
    destructor Destroy; override;
      {-Free a multithread padlock}
    property Locked : boolean
             read GetLocked
             write SetLocked;
      {-Lock/unlock a multithread padlock}
  end;

  {===Helper functions===}
  procedure AbCreateDirectory( const Path : string );
    {creates the requested directory tree.  CreateDir is insufficient,
     because if you have a path x:\dir, and request x:\dir\sub1\sub2,
     (/dir and /dir/sub1/sub2 on Linux) it fails.}

  function AbCreateTempFile(const Dir : string) : string;

  function AbGetTempFile(const Dir : string; CreateIt : Boolean) : string;

  function AbdMax(Var1, Var2: Longint): Longint;
    {-Return the maximum of two values}

  function AbdMin(Var1, Var2: DWord): DWord;
    {-Return the minimum of two values}

  function AbDirectoryExists( const Path : string ) : Boolean;
    {Returns true if Path is an existing directory
     returns False on blank strings, filenames...}

  function AbDrive(const ArchiveName : string) : AnsiChar;

  function AbDriveIsRemovable(const ArchiveName : string) : Boolean;

  function AbFileMatch(FileName : string; FileMask : string ) : Boolean;
    {see if FileName matches FileMask}

  procedure AbFindFiles(const FileMask : string; SearchAttr : Integer;
                         FileList : TStrings; Recurse : Boolean );

  procedure AbFindFilesEx( const FileMask : string; SearchAttr : Integer;
                         FileList : TStrings; Recurse : Boolean );

  function AbAddBackSlash(const DirName : string) : string;

  function AbFindNthSlash( const Path : string; n : Integer ) : Integer;
    {return the position of the character just before the nth backslash}

  function AbGetDriveFreeSpace(const ArchiveName : string) : LongInt;
    {return the available space on the specified drive }

  function AbGetPathType( const Value : string ) : TAbPathType;
    {returns path type - none, relative or absolute}

  {$IFDEF MSWINDOWS}
  function AbGetShortFileSpec(const LongFileSpec : string ) : string;
  {$ENDIF}

  procedure AbIncFilename( var Filename : string; Value : Word );

  procedure AbParseFileName( FileSpec : string;
                             var Drive : string;
                             var Path : string;
                             var FileName : string );

  procedure AbParsePath( Path : string; SubPaths : TStrings );
    {- break abart path into subpaths --- Path : abbrevia/examples ->
                                          SubPaths[0] = abbrevia
                                          SubPaths[1] = examples}

  function AbPatternMatch(const Source : string; iSrc : Integer;
                          const Pattern : string; iPat : Integer ) : Boolean;
    { recursive routine to see if the source string matches
      the pattern.  Both ? and * wildcard characters are allowed.}

  function AbPercentage(V1, V2 : LongInt) : Byte;
    {-Returns the ratio of V1 to V2 * 100}

  procedure AbStripDots( var FName : string );
    {-strips relative path information}

  procedure AbStripDrive( var FName : string );
    {-strips the drive off a filename}

  procedure AbFixName( var FName : string );
    {-changes backslashes to forward slashes}

  procedure AbUnfixName( var FName : string );
    {-changes forward slashes to backslashes}

  procedure AbUpdateCRC( var CRC : LongInt; var Buffer; Len : Word );

  function AbUpdateCRC32(CurByte : Byte; CurCrc : LongInt) : LongInt;
    {-Returns an updated crc32}



  function AbWriteVolumeLabel(const VolName : string;
                                  Drive : AnsiChar) : Cardinal;
{!!.04 - Added }
const
  AB_SPAN_VOL_LABEL = 'PKBACK# %3.3d';

  function AbGetVolumeLabel(Drive : AnsiChar) : AnsiString;
  procedure AbSetSpanVolumeLabel(Drive: AnsiChar; VolNo : Integer);
  function AbTestSpanVolumeLabel(Drive: AnsiChar; VolNo : Integer): Boolean;
{!!.04 - Added End }

  function AbFileGetAttr(const aFileName : string) : integer;
  procedure AbFileSetAttr(const aFileName : string; aAttr : integer);
    {-Get or set file attributes for a file. Uses DOS format attributes}
  function AbFileGetSize(const aFileName : string) :                     {!!.01}
  {$IFDEF MSWINDOWS}                                                     {!!.01}
    {$IFDEF VERSION4} Int64 {$ELSE} LongInt {$ENDIF};                    {!!.01}
  {$ENDIF}                                                               {!!.01}
  {$IFDEF LINUX}                                                         {!!.01}
    Int64;                                                               {!!.01}
  {$ENDIF}                                                               {!!.01}

  function AbSwapLongEndianness(Value : LongInt): LongInt;


{ date and time stuff }
const
  Date1900 {: LongInt} = $0001AC05;  {Julian day count for 01/01/1900 -- TDateTime Start Date}
  Date1970 {: LongInt} = $00020FE4;  {Julian day count for 01/01/1970 -- Unix Start Date}
  Unix0Date: TDateTime = 25568;      {Date1970 - Date1900}

  SecondsInDay    = 86400;  {Number of seconds in a day}
  SecondsInHour   =  3600;  {Number of seconds in an hour}
  SecondsInMinute =    60;  {Number of seconds in a minute}
  HoursInDay      =    24;  {Number of hours in a day}
  MinutesInHour   =    60;  {Number of minutes in an hour}
  MinutesInDay    =  1440;  {Number of minutes in a day}


  function AbUnixTimeToDateTime(UnixTime : LongInt) : TDateTime;
  function AbDateTimeToUnixTime(DateTime : TDateTime) : LongInt;

  function AbDosFileDateToDateTime(FileDate, FileTime : Word) : TDateTime;  {!!.01}
  function AbDateTimeToDosFileDate(Value : TDateTime) : LongInt;            {!!.01}

  function AbSetFileDate(const FileName : string;const Age : LongInt) : Integer; {!!.05}

  function AbFlushOsBuffers(Handle : Integer) : Boolean;

{ file attributes }
  function AbDOS2UnixFileAttributes(Attr: LongInt): LongInt;
  function AbUnix2DosFileAttributes(Attr: LongInt): LongInt;

{ LINUX File Types and Permissions }
const
  AB_FMODE_FILE          = $0000;
  AB_FMODE_FIFO          = $1000;
  AB_FMODE_CHARSPECFILE  = $2000;
  AB_FMODE_DIR           = $4000;
  AB_FMODE_BLOCKSPECFILE = $6000;
  AB_FMODE_FILE2         = $8000;
  AB_FMODE_FILELINK      = $A000;
  AB_FMODE_SOCKET        = $C000;


  AB_FPERMISSION_OWNERREAD    = $0100; { read by owner }
  AB_FPERMISSION_OWNERWRITE   = $0080; { write by owner }
  AB_FPERMISSION_OWNEREXECUTE = $0040; { execute/search by owner }
  AB_FPERMISSION_GROUPREAD    = $0020; { read by group }
  AB_FPERMISSION_GROUPWRITE   = $0010; { write by group }
  AB_FPERMISSION_GROUPEXECUTE = $0008; { execute/search by group }
  AB_FPERMISSION_OTHERREAD    = $0004; { read by other }
  AB_FPERMISSION_OTHERWRITE   = $0002; { write by other }
  AB_FPERMISSION_OTHEREXECUTE = $0001; { execute/search by other }

{!!.01 more sensible default permissions given Linux predilections:}
  AB_FPERMISSION_GENERIC      =
    AB_FPERMISSION_OWNERREAD or
    AB_FPERMISSION_OWNERWRITE or
    AB_FPERMISSION_OWNEREXECUTE or
    AB_FPERMISSION_GROUPREAD or
    AB_FPERMISSION_OTHERREAD;



implementation

uses
  AbConst,
  AbExcept;

const
  AB_MAXPATH = 255;

type
  XFCBrec = packed record
    Flag : Byte;                      {should be $FF}
    Reserved0 : array[1..5] of Byte;  {should be all zeroes}
    AttrByte : Byte;                  {should be 8}
    DriveCode : Byte;
    FileSpec : array[1..11] of AnsiChar;
    Reserved1 : array[1..25] of Byte;
  end;

  DTABuf = array[0..63] of AnsiChar;

  PMediaIDType = ^MediaIDType;
  MediaIDType = packed record
  {This type describes the information that DOS 4.0 or higher writes
   in the boot sector of a disk when it is formatted}
    InfoLevel : Word;                        {Reserved for future use}
    SerialNumber : LongInt;                  {Disk serial number}
    VolumeLabel : array[0..10] of AnsiChar;  {Disk volume label}
    FileSystemID : array[0..7] of AnsiChar;  {String for internal use by the OS}
  end;

{===platform independent routines for platform dependent stuff=======}
function ExtractShortName(const SR : TSearchRec) : string;
begin
  {$IFDEF MSWINDOWS}
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  if SR.FindData.cAlternateFileName[0] <> #0 then
    Result := SR.FindData.cAlternateFileName
  else
    Result := SR.FindData.cFileName;
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
  {$ENDIF}
  {$IFDEF LINUX}
  Result := SR.Name;
  {$ENDIF}
end;
{====================================================================}


{ TAbPadLock implementation ================================================ }
constructor TAbPadLock.Create;
begin
  inherited Create;
  InitializeCriticalSection(plCritSect);
end;
{ -------------------------------------------------------------------------- }
destructor TAbPadLock.Destroy;
begin
  DeleteCriticalSection(plCritSect);
  inherited Destroy;
end;
{ -------------------------------------------------------------------------- }
function TAbPadLock.GetLocked : boolean;
begin
  Result := FCount > 0;
end;
{ -------------------------------------------------------------------------- }
procedure TAbPadLock.SetLocked(L : boolean);
begin
  if L {locking} then begin
    if IsMultiThread then begin
      EnterCriticalSection(plCritSect);
      inc(FCount);
    end;
  end
  else {unlocking} begin
    if (FCount > 0) then begin
      dec(FCount);
      LeaveCriticalSection(plCritSect);
    end;
  end;
end;
{ ========================================================================== }


{ ========================================================================== }
procedure AbCreateDirectory( const Path : string );
  {creates the requested directory tree.  CreateDir is insufficient,
   because if you have a path x:\dir, and request x:\dir\sub1\sub2,
   (/dir and /dir/sub1/sub2 on Linux) it fails.}
var
  iStartSlash : Integer;
  i : Integer;
  TempPath : string;
begin
  if AbDirectoryExists( Path ) then
    Exit;
  {see how much of the path currently exists}
  if Pos( '\\', Path ) > 0 then
    {UNC Path  \\computername\sharename\path1..\pathn}
    iStartSlash := 5
  else
    {standard Path drive:\path1..\pathn}
    iStartSlash := 2;

  repeat
    {find the Slash at iStartSlash}
    i := AbFindNthSlash( Path, iStartSlash );
    {get a temp path to try: drive:\path1}
    TempPath := Copy( Path, 1, i );
    {if it doesn't exist, create it}
    if not AbDirectoryExists( TempPath ) then
      MkDir( TempPath );
    inc( iStartSlash );
  until ( Length( TempPath ) = Length( Path ) );
end;
{ -------------------------------------------------------------------------- }
function AbCreateTempFile(const Dir : string) : string;
begin
  Result := AbGetTempFile(Dir, True);
end;
{ -------------------------------------------------------------------------- }
{$IFDEF LINUX}
function GetTempFileName(const Path, Mask : string): string;
{
Returns a unique filename for use as a temporary
}
var
  Buff: array[0..AB_MAXPATH] of char;
  IntMask : string;
begin
  IntMask := Mask;
  if Copy(IntMask, Length(IntMask) - 5, 6) <> 'XXXXXX' then
    IntMask := IntMask + 'XXXXXX';
  StrPCopy(Buff, AbAddBackSlash(Path) + IntMask);
  mktemp(Buff);
  Result := StrPas(Buff);
end;
{$ENDIF}

function AbGetTempFile(const Dir : string; CreateIt : Boolean) : string;
{$IFDEF MSWINDOWS}
var
  FileNameZ : array [0..259] of char;
  TempPathZ : array [0..259] of char;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  if not AbDirectoryExists(Dir) then
    GetTempPath(sizeof(TempPathZ), TempPathZ)
  else
    StrPCopy(TempPathZ, Dir);
  GetTempFileName(TempPathZ, 'VMS', Word(not CreateIt), FileNameZ);
  Result := StrPas(FileNameZ);
{$ENDIF}
{$IFDEF LINUX}
  Result := GetTempFileName(Dir, 'VMSXXXXXX');
  if CreateIt then
    FileCreate(Result);
{$ENDIF}
end;
{ -------------------------------------------------------------------------- }
function AbdMax(Var1, Var2: Longint): Longint;
  {-Return the maximum of two values}
begin
  if (Var2 > Var1) then
    Result := Var2
  else
    Result := Var1;
end;
{ -------------------------------------------------------------------------- }
function AbdMin(Var1, Var2: DWord): DWord;
  {-Return the minimum of two values}
begin
  if (Var2 < Var1) then
    Result := Var2
  else
    Result := Var1;
end;
{ -------------------------------------------------------------------------- }
function AbDrive(const ArchiveName : string) : AnsiChar;
var
  iPos: Integer;
  Path : string;
begin
  Path := ExpandFileName(ArchiveName);
  iPos := Pos(':', Path);
  if (iPos <= 0) then
    Result := 'A'
  else
    Result := Path[1];
end;
{ -------------------------------------------------------------------------- }
function AbDriveIsRemovable(const ArchiveName : string) : Boolean;       
var
{$IFDEF MSWINDOWS}
  DType : Integer;
  iPos  : Integer;
  Drive : array[0..4] of Char;
{$ENDIF}
  Path : string;
{$IFDEF LINUX}
  Path2: string;
{$ENDIF}
begin
  Path := ExpandFileName(ArchiveName);
{$IFDEF MSWINDOWS}
  Result := False;
  iPos := Pos(':', Path);
  if (iPos <= 0) then
    Exit;
  System.Delete(Path, iPos+1, Length(Path) - iPos);
  StrPLCopy(Drive, Path, Length(Path));
  DType := GetDriveType(Drive);
  Result := (DType = DRIVE_REMOVABLE);
{$ENDIF}
{$IFDEF LINUX}
  Path2 := LowerCase(ExtractFilePath(Path));
  {LINUX -- Following may not cover all the bases}
  Result := Path2 = '/mnt/floppy';
{$ENDIF}

end;
{ -------------------------------------------------------------------------- }
{!!.01 -- Rewritten}
function AbGetDriveFreeSpace(const ArchiveName : string) : LongInt;
{ attempt to find free space (in bytes) on drive/volume,
  returns MaxLongInt on drives with greater space,
  returns -1 if fails for some reason }

{$IFDEF MSWINDOWS }
function GetLocalDiskFree(const Path : string) : {$IFDEF VERSION4} Int64 {$ELSE} LongInt {$ENDIF};
var
  SectorsPerCluster, BytesPerSector,
  NumberOfFreeClusters, TotalNumberOfClusters : {$IFDEF VERSION4} Cardinal {$ELSE} LongInt {$ENDIF};
  Succeeded : BOOL;
  DrvBuf : array[0..255] of char;
begin
  Result := -1;
  StrPCopy(DrvBuf, ExtractFileDrive(Path) + AbDosPathDelim);
  Succeeded := GetDiskFreeSpace(DrvBuf,
    SectorsPerCluster, BytesPerSector, NumberOfFreeClusters, TotalNumberOfClusters);
  if Succeeded then
{!!.03 -- Rewritten}
    try
      Result := BytesPerSector * SectorsPerCluster * NumberOfFreeClusters;
    except
      on EIntOverflow do
        Result := High(Result);
    end;
{!!.03 -- End Rewritten}
end;

function GetRemoteDiskFree(const Path : string) : {$IFDEF VERSION4} Int64 {$ELSE} LongInt {$ENDIF};
var
  FreeAvailable, TotalSpace, TotalFree: {$IFDEF VERSION4} TLargeInteger {$ELSE} LongInt {$ENDIF};
  Succeeded : BOOL;
  PathBuf : array[0..255] of char;
begin
  Result := -1;
  StrPCopy(PathBuf, AbAddBackSlash(ExtractFilePath(Path)));
  Succeeded := GetDiskFreeSpaceEx(PathBuf, FreeAvailable, TotalSpace, @TotalFree);
  if Succeeded then
    Result := FreeAvailable;
end;

function GetRemoveableDiskFree(const Path : string) : LongInt;
begin
  Result := DiskFree(Ord(AbDrive(Path)) - Ord('A') + 1);
end;

function OSOK : boolean;
var
  VerInfo : TOSVersionInfo;
begin
  Result := False;
  {get the version info}
  VerInfo.dwOSVersionInfoSize := sizeof(VerInfo);
  if GetVersionEx(VerInfo) then
    { if is NT or Win9x > 95a }
    Result :=
      ((VerInfo.dwPlatformId = VER_PLATFORM_WIN32_NT) and
       (VerInfo.dwMajorVersion >= 4))
      or
      ((VerInfo.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS) and
       (LongRec(VerInfo.dwBuildNumber).Lo <> 1000));
end;
{$ENDIF MSWINDOWS}
{$IFDEF LINUX}
function LinuxVolumeFree(const Path : string): Int64;
var
  FStats : TStatFs;
  Rslt : Integer;
begin
  Result := -1;
  Rslt := statfs(PAnsiChar(ExtractFilePath(Path)), FStats);
  if Rslt = 0 then
    Result := Int64(FStats.f_bAvail) * Int64(FStats.f_bsize);
end;

function LinuxVolumeSize(const Path : string): Int64;
var
  FStats : TStatFs;
  Rslt : Integer;
begin
  Result := -1;
  Rslt := statfs(PAnsiChar(ExtractFilePath(Path)), FStats);
  if Rslt = 0 then
    Result := Int64(FStats.f_blocks) * Int64(FStats.f_bsize);
end;
{$ENDIF LINUX}

var
{$IFDEF MSWINDOWS}
{$IFDEF VERSION4}
  Size : Int64;
{$ELSE}
  Size : Integer;
{$ENDIF VERSION4}
  DrvTyp : Integer;
  DrvStr : string;                                                       {!!.02}
{$ENDIF MSWINDOWS}
{$IFDEF LINUX}
  Size : Int64;
{$ENDIF}
begin
{$IFDEF MSWINDOWS }
  Size := -1;

  DrvStr := ExtractFileDrive(ArchiveName);                               {!!.02}
  if DrvStr = '' then                                                    {!!.02}
    DrvStr := ExtractFileDrive(GetCurrentDir);                           {!!.02}
  DrvStr := DrvStr + AbDosPathDelim;                                     {!!.02}

  case AbGetPathType(ArchiveName) of
    ptNone, ptRelative: { if path is relative or bad }
      Size := -1; { fail }
    ptAbsolute : begin {path is absolute}
      if Pos('\\', ArchiveName) = 1 then begin  {path is UNC; must refer to network }
        { check OS version }
        if OSOK then begin
          Size := GetRemoteDiskFree(DrvStr);                             {!!.02}
        end
        else begin {OS < Win95b }
          {GetDiskFreeSpaceEx isn't available and
           GetDiskFreeSpace and DiskFree fail on UNC paths,
           about all we can do is hope the server isn't full}
            Size := MaxLongInt;
        end; {if}
      end
      else begin { path is not UNC}
        { determine drive type }
        DrvTyp := GetDriveType(PAnsiChar(DrvStr));                       {!!.02}
        {DrvTyp := GetDriveType(PAnsiChar(ExtractFilePath(ArchiveName))); }{!!.02}
        case DrvTyp of
          0 {type undeterminable} : Size := -1; { fail }
          1 {root non-existant}   : Size := -1; { fail }
          DRIVE_RAMDISK           : Size := -1; { fail }

//        DRIVE_CDROM           : Size := -1; { fail }                 {!!.04}
//        DRIVE_CDROM           : Size := 0; { Read-Only }             {!!.04}
          DRIVE_CDROM             : Size := GetLocalDiskFree(DrvStr);  {!!.04}
          DRIVE_REMOVABLE         : Size := GetRemoveableDiskFree(DrvStr); {!!.02}
          DRIVE_FIXED             : Size := GetLocalDiskFree(DrvStr);      {!!.02}
          DRIVE_REMOTE            : Size := GetRemoteDiskFree(DrvStr);     {!!.02}
        end; {case}
      end; {if}
    end; {ptAbsolute}
  end; {case AbGetPathType}
{$ENDIF MSWINDOWS}
{$IFDEF LINUX}
  Size := LinuxVolumeFree(ArchiveName);
{$ENDIF LINUX}
  if (Size < -1) or (Size > MaxLongInt) then begin
    Result := MaxLongInt;
  end
  else begin
    Result := Size;
  end;
end;
{ -------------------------------------------------------------------------- }
{!!.01 -- End Rewritten}

{ -------------------------------------------------------------------------- }
function AbDirectoryExists( const Path : string ) : Boolean;
{$IFDEF MSWINDOWS}
var
  Attr : DWORD;
  PathZ: array [0..255] of AnsiChar;
{$ENDIF}
{$IFDEF LINUX}
var
  SB: TStatBuf;
{$ENDIF}

begin
  Result := False;
  {we don't support wildcards}
  if (Pos('*', Path) <> 0) or (Pos('?', Path) <> 0) then
    Exit;
{$IFDEF MSWINDOWS}
  Attr := GetFileAttributes( StrPCopy( PathZ, Path ) );
  if (Attr <> DWORD(-1)) and ((Attr and faDirectory) <> 0) then
    Result := true;
{$ENDIF}
{$IFDEF LINUX}
  if FileExists(Path) then begin
    stat(PAnsiChar(Path), SB);
    Result := (SB.st_mode and AB_FMODE_DIR) = AB_FMODE_DIR;
  end;
{$ENDIF}
end;
{ -------------------------------------------------------------------------- }
function AbFileMatch(FileName: string; FileMask: string ): Boolean;
  {see if FileName matches FileMask}
var
  DirMatch : Boolean;
  MaskDir : string;
begin
  FileName := UpperCase( FileName );
  FileMask := UpperCase( FileMask );
  MaskDir := ExtractFilePath( FileMask );
  if MaskDir = '' then
    DirMatch := True
  else
    DirMatch := AbPatternMatch( ExtractFilePath( FileName ), 1, MaskDir, 1 );

  Result := DirMatch and AbPatternMatch( ExtractFileName( FileName ), 1,
                                       ExtractFileName( FileMask ), 1 );
end;
{ -------------------------------------------------------------------------- }
procedure AbFindFiles( const FileMask : string; SearchAttr : Integer;
                       FileList : TStrings; Recurse : Boolean );
var
  NewFile : string;
  SR : TSearchRec;
  Found : Integer;
  NameMask: string;
begin
  Found := FindFirst( FileMask, SearchAttr, SR );
  if Found = 0 then begin
    try
      NameMask := UpperCase(ExtractFileName(FileMask));
      while Found = 0 do begin
        NewFile := ExtractFilePath( FileMask ) + SR.Name;
        if AbPatternMatch(UpperCase(SR.Name), 1, NameMask, 1) then
        FileList.Add( NewFile );
        Found := FindNext( SR );
      end;
    finally
      FindClose( SR );
    end;
  end;
  if not Recurse then
    Exit;
  NewFile := ExtractFilePath( FileMask );
  if ( NewFile <> '' ) and ( NewFile[Length(NewFile)] <> AbPathDelim) then
    NewFile := NewFile + AbPathDelim;
  NewFile := NewFile + AbAnyFile;

  Found := FindFirst( NewFile, faDirectory, SR );
  if Found = 0 then begin
    try
      while ( Found = 0 ) do begin
        if ( SR.Name <> AbThisDir ) and
           ( SR.Name <> AbParentDir ) and
           ((SR.Attr and faDirectory) > 0 ) then
          AbFindFiles( ExtractFilePath( NewFile ) + SR.Name + AbPathDelim +
                       ExtractFileName( FileMask ), SearchAttr,          {!!.04}
                       FileList, True );
        Found := FindNext( SR );
      end;
    finally
      FindClose( SR );
    end;
  end;
end;
{ -------------------------------------------------------------------------- }
procedure AbFindFilesEx( const FileMask : string; SearchAttr : Integer;
                       FileList : TStrings; Recurse : Boolean );
var
  I, J: Integer;
  MaskPart: string;
begin
  I := 1;
  while I <= Length(FileMask) do begin
    J := I;
    while (I <= Length(FileMask)) and (FileMask[I] <> AbPathSep) do Inc(I);
    MaskPart := Trim(Copy(FileMask, J, I - J));
    if (I <= Length(FileMask)) and (FileMask[I] = AbPathSep) then Inc(I);

    AbFindFiles(MaskPart, SearchAttr, FileList, Recurse);
  end;
end;
{ -------------------------------------------------------------------------- }
function AbAddBackSlash(const DirName : string) : string;
{ Add a default slash to a directory name }
const
  AbDelimSet : set of Char = [AbPathDelim, ':', #0];
begin
  Result := DirName;
  if Length(DirName) = 0 then
    Exit;
  if not (DirName[Length(DirName)] in AbDelimSet) then
    Result := DirName + AbPathDelim;
end;
{ -------------------------------------------------------------------------- }
function AbFindNthSlash( const Path : string; n : Integer ) : Integer;
{ return the position of the character just before the nth slash }
var
  i : Integer;
  Len : Integer;
  iSlash : Integer;
begin
  Len := Length( Path );
  Result := Len;
  iSlash := 0;
  i := 0;
  while i <= Len do begin
    if Path[i] = AbPathDelim then begin
      inc( iSlash );
      if iSlash = n then begin
        Result := pred( i );
        break;
      end;
    end;
    inc( i );
  end;
end;
{ -------------------------------------------------------------------------- }
function AbGetPathType( const Value : string ) : TAbPathType;
{ returns path type - none, relative or absolute }
begin
  Result := ptNone;
{$IFDEF MSWINDOWS}
{check for drive/unc info}
  if ( Pos( '\\', Value ) > 0 ) or ( Pos( ':', Value ) > 0 ) then
{$ENDIF MSWINDOWS}
{$IFDEF LINUX}
{ UNIX absolute paths start with a slash }
  if (Value[1] = AbPathDelim) then
{$ENDIF LINUX}
    Result := ptAbsolute
  else if ( Pos( AbPathDelim, Value ) > 0 ) or ( Pos( AB_ZIPPATHDELIM, Value ) > 0 ) then
    Result := ptRelative;
end;
{ -------------------------------------------------------------------------- }
{$IFDEF MSWINDOWS}
{$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
function AbGetShortFileSpec(const LongFileSpec : string ) : string;
var
  SR : TSearchRec;
  Search : string;
  Drive : string;
  Path : string;
  FileName : string;
  Found : Integer;
  SubPaths : TStrings;
  i : Integer;
begin
  AbParseFileName( LongFileSpec, Drive, Path, FileName );
  SubPaths := TStringList.Create;
  try
    AbParsePath( Path, SubPaths );
    Search := Drive;
    Result := Search + AbPathDelim;
    if SubPaths.Count > 0 then
      for i := 0 to pred( SubPaths.Count ) do begin
        Search := Search + AbPathDelim + SubPaths[i];
        Found := FindFirst( Search, faHidden + faSysFile + faDirectory, SR );
        if Found <> 0 then
          raise EAbException.Create( 'Path not found' );
        try
          Result := Result + ExtractShortName(SR) + AbPathDelim;
        finally
          FindClose( SR );
        end;
      end;
    Search := Search + AbPathDelim + FileName;
    Found := FindFirst( Search,
                        faReadOnly + faHidden + faSysFile + faArchive, SR );
    if Found <> 0 then
      raise EAbFileNotFound.Create;
    try
      Result := Result + ExtractShortName(SR);
    finally
      FindClose( SR );
    end;
  finally
    SubPaths.Free;
  end;
end;
{$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
{$ENDIF}
{ -------------------------------------------------------------------------- }
procedure AbIncFilename( var Filename : string; Value : Word );
{ place value at the end of filename, e.g. Files.C04 }
var
  Ext : string[4];
  I : Word;
begin
  I := (Value +1) mod 100;
  Ext := ExtractFileExt(Filename);
  if (Length(Ext) < 2) then
    Ext := '.' + Format('%.2d', [I])
  else
    Ext := Ext[1] + Ext[2] + Format('%.2d', [I]);
  Filename := ChangeFileExt(Filename, Ext);
end;
{ -------------------------------------------------------------------------- }
procedure AbParseFileName( FileSpec : string;
                           var Drive : string;
                           var Path : string;
                           var FileName : string );
var
  i : Integer;
  iColon : Integer;
  iStartSlash : Integer;
begin
  if Pos( AB_ZIPPATHDELIM, FileSpec ) > 0 then
    AbUnfixName( FileSpec );
  FileName := ExtractFileName( FileSpec );
  Path := ExtractFilePath( FileSpec );
  {see how much of the path currently exists}
  iColon := Pos( ':', Path );
  if Pos( '\\', Path ) > 0 then begin
    {UNC Path  \\computername\sharename\path1..\pathn}
    {everything up to the 4th slash is the drive}
    iStartSlash := 4;
    i := AbFindNthSlash( Path, iStartSlash );
    Drive := Copy( Path, 1, i );
    Delete( Path, 1, i + 1 );
  end
  else if iColon > 0 then begin
    Drive := Copy( Path, 1, iColon );
    Delete( Path, 1, iColon );
    if Path[1] = AbPathDelim then
      Delete( Path, 1, 1 );
  end;
end;
{ -------------------------------------------------------------------------- }
procedure AbParsePath( Path : string; SubPaths : TStrings );
{ break abart path into subpaths --- Path : abbrevia/examples >
                                        SubPaths[0] = abbrevia
                                        SubPaths[1] = examples}
var
  i : Integer;
  iStart : Integer;
  iStartSlash : Integer;
  SubPath : string;
begin
  if Path = '' then Exit;
  if Path[ Length( Path ) ] = AbPathDelim then
    Delete( Path, Length( Path ), 1 );
  iStart := 1;
  iStartSlash := 1;
  repeat
    {find the Slash at iStartSlash}
    i := AbFindNthSlash( Path, iStartSlash );
    {get the subpath}
    SubPath := Copy( Path, iStart, i - iStart + 1 );
    iStart := i + 2;
    inc( iStartSlash );
    SubPaths.Add( SubPath );
  until ( i = Length( Path ) );
end;
{ -------------------------------------------------------------------------- }
function AbPatternMatch(const Source : string; iSrc : Integer;
                        const Pattern : string; iPat : Integer ) : Boolean;
{ recursive routine to see if the source string matches
  the pattern.  Both ? and * wildcard characters are allowed.
  Compares Source from iSrc to Length(Source) to
  Pattern from iPat to Length(Pattern)}
var
  Matched : Boolean;
  k : Integer;
begin
  if Length( Source ) = 0 then begin
    Result := Length( Pattern ) = 0;
    Exit;
  end;

  if iPat = 1 then begin
    if ( CompareStr( Pattern, AbDosAnyFile) = 0 ) or
       ( CompareStr( Pattern, AbUnixAnyFile ) = 0 ) then begin
      Result := True;
      Exit;
    end;
  end;

  if Length( Pattern ) = 0 then begin
    Result := (Length( Source ) - iSrc + 1 = 0);
    Exit;
  end;

  while True do begin
    if ( Length( Source ) < iSrc ) and
       ( Length( Pattern ) < iPat ) then begin
      Result := True;
      Exit;
    end;

    if Length( Pattern ) < iPat then begin
      Result := False;
      Exit;
    end;

    if Pattern[iPat] = '*' then begin
      k := iPat;
      if ( Length( Pattern ) < iPat + 1 ) then begin
        Result := True;
        Exit;
      end;

      while True do begin
        Matched := AbPatternMatch( Source, k, Pattern, iPat + 1 );
        if Matched or ( Length( Source ) < k ) then begin
          Result := Matched;
          Exit;
        end;
        inc( k );
      end;
    end
    else begin
      if ( (Pattern[iPat] = '?') and
           ( Length( Source ) <> iSrc - 1 ) ) or
           ( Pattern[iPat] = Source[iSrc] ) then begin
        inc( iPat );
        inc( iSrc );
      end
      else begin
        Result := False;
        Exit;
      end;
    end;
  end;
end;
{ -------------------------------------------------------------------------- }
function AbPercentage(V1, V2 : LongInt) : Byte;
{ Returns the ratio of V1 to V2 * 100 }
begin
  if V2 > 16384000 then begin  {Possible LongInt overflow}
    V1 := (V1 + $80) shr 8;  {scale down (div 256)}
    V2 := (V2 + $80) shr 8;  {scale down (div 256)}
  end;
  if V2 <= 0 then
    Result := 0
  else if V1 >= V2 then
    Result := 100
  else
    Result := (V1 * 100) div V2;
end;
{ -------------------------------------------------------------------------- }
procedure AbStripDots( var FName : string );
{ strips relative path information, e.g. ".."}
begin
  while Pos( AbParentDir + AbPathDelim, FName ) = 1 do
    System.Delete( FName, 1, 3 );
end;
{ -------------------------------------------------------------------------- }
procedure AbStripDrive( var FName : string );
{ strips the drive off a filename }
var
  Drive, Path, Name : string;
begin
  AbParseFileName( FName, Drive, Path, Name );
  FName := Path + Name;
end;
{ -------------------------------------------------------------------------- }
procedure AbFixName( var FName : string );
{ changes backslashes to forward slashes }
var
  i : Integer;
begin
  for i := 1 to Length( FName ) do
    if FName[i] = AbPathDelim then
      FName[i] := AB_ZIPPATHDELIM;
end;
{ -------------------------------------------------------------------------- }
procedure AbUnfixName( var FName : string );
{ changes forward slashes to backslashes }
var
  i : Integer;
begin
  for i := 1 to Length( FName ) do
    if FName[i] = AB_ZIPPATHDELIM then
      FName[i] := AbPathDelim;
end;
{ -------------------------------------------------------------------------- }
procedure AbUpdateCRC( var CRC : LongInt; var Buffer; Len : Word );
type
  TByteArray = array[0..65520] of Byte;
var
  BufArray : TByteArray absolute Buffer;
  i : Integer;
  CRCTemp : DWORD;
begin
  CRCTemp := CRC;
  for i := 0 to pred( Len ) do
    CRCTemp := AbCrc32Table[ Byte(CrcTemp xor DWORD( BufArray[i] ) ) ] xor
              ((CrcTemp shr 8) and $00FFFFFF);
  CRC := CRCTemp;
end;
{ -------------------------------------------------------------------------- }
function AbUpdateCRC32(CurByte : Byte; CurCrc : LongInt) : LongInt;
{ Return the updated 32bit CRC }
{ Normally a good candidate for basm, but Delphi32's code
    generation couldn't be beat on this one!}
begin
  Result := DWORD(AbCrc32Table[ Byte(CurCrc xor LongInt( CurByte ) ) ] xor
            ((CurCrc shr 8) and DWORD($00FFFFFF)));
end;
{ -------------------------------------------------------------------------- }
function AbWriteVolumeLabel(const VolName : string;
                                Drive : AnsiChar) : Cardinal;
var
  Temp : string;
  Vol : array[0..11] of AnsiChar;
  Root : array[0..3] of AnsiChar;
begin
  Temp := VolName;
  StrCopy(Root, '%:' + AbPathDelim);
  Root[0] := Drive;
  if Length(Temp) > 11 then
    SetLength(Temp, 11);
  StrPCopy(Vol, Temp);
{$IFDEF MSWINDOWS}
  if Windows.SetVolumeLabel(Root, Vol) then
    Result := 0
  else Result := GetLastError;
{$ENDIF MSWINDOWS}
{$IFDEF LINUX}
{ UNIX absolute paths start with a slash }
  Result := 0;
{$ENDIF LINUX}
end;
{ -------------------------------------------------------------------------- }
function AbUnixTimeToDateTime(UnixTime : LongInt) : TDateTime;
{ convert unix date to Delphi TDateTime }
var
  Hrs, Mins, Secs : Word;
  TodaysSecs : LongInt;
begin
  TodaysSecs := UnixTime mod SecondsInDay;
  Hrs := TodaysSecs div SecondsInHour;
  TodaysSecs := TodaysSecs - (Hrs * SecondsInHour);
  Mins := TodaysSecs div SecondsInMinute;
  Secs := TodaysSecs - (Mins * SecondsInMinute);

  Result := Unix0Date + (UnixTime div SecondsInDay) +
    EncodeTime(Hrs, Mins, Secs, 0);
end;
{ -------------------------------------------------------------------------- }
function AbDateTimeToUnixTime(DateTime : TDateTime) : LongInt;
{ convert Delphi TDateTime to unix date }
var
  Hrs, Mins, Secs, MSecs : Word;
  Dt, Tm : TDateTime;
begin
  Dt := Trunc(DateTime);
  Tm := DateTime - Dt;
  if Dt < Unix0Date then
    Result := 0
  else
    Result := Trunc(Dt - Unix0Date) * SecondsInDay;

  DecodeTime(Tm, Hrs, Mins, Secs, MSecs);
  Result := Result + (Hrs * SecondsInHour) + (Mins * SecondsInMinute) + Secs;
end;
{ -------------------------------------------------------------------------- }
{!!.01 -- Added }
function AbDosFileDateToDateTime(FileDate, FileTime : Word) : TDateTime;
{$IFDEF MSWINDOWS}
var
  Temp : LongInt;
begin
  LongRec(Temp).Lo := FileTime;
  LongRec(Temp).Hi := FileDate;
  Result := FileDateToDateTime(Temp);
{$ENDIF}
{$IFDEF LINUX}
{!!.02 -- rewritten }
var
  Yr, Mo, Dy : Word;
  Hr, Mn, S  : Word;
begin
  Yr := FileDate shr 9 + 1980;

  Mo := FileDate shr 5 and 15;
  if Mo < 1 then Mo := 1;
  if Mo > 12 then Mo := 12;


  Dy := FileDate and 31;
  if Dy < 1 then Dy := 1;
  if Dy > DaysInAMonth(Yr, Mo) then
    Dy := DaysInAMonth(Yr, Mo);

  Hr := FileTime shr 11;
  if Hr > 23 then Hr := 23;

  Mn := FileTime shr 5 and 63;
  if Mn > 59 then Mn := 59;

  S  := FileTime and 31 shl 1;
  if S * 2 > 59 then S := 29;

  Result :=
    EncodeDate(Yr, Mo, Dy) +
    EncodeTime(Hr, Mn, S, 0);

{
  Result :=
    EncodeDate(
      FileDate shr 9 + 1980,
      FileDate shr 5 and 15,
      FileDate and 31) +
    EncodeTime(
      FileTime shr 11,
      FileTime shr 5 and 63,
      FileTime and 31 shl 1, 0);
}
{$ENDIF}
{!!.02 -- end rewritten }
end;

function AbDateTimeToDosFileDate(Value : TDateTime) : LongInt;
{$IFDEF MSWINDOWS}
begin
  Result := DateTimeToFileDate(Value);
{$ENDIF}
{$IFDEF LINUX}
var
  Yr, Mo, Dy : Word;
  Hr, Mn, S, MS: Word;
begin
  DecodeDate(Value, Yr, Mo, Dy);
  if (Yr < 1980) or (Yr > 2107) then { outside DOS file date year range }
    Yr := 1980;
  DecodeTime(Value, Hr, Mn, S, MS);

  LongRec(Result).Lo := (S shr 1) or (Mn shl 5) or (Hr shl 11);
  LongRec(Result).Hi := Dy or (Mo shl 5) or ((Yr - 1980) shl 9);
{$ENDIF}
end;

function AbSetFileDate(const FileName : string;const Age : LongInt) : Integer; {!!.05}
{$IFDEF MSWINDOWS}
var
  f: THandle;
begin
  f := FileOpen(FileName, fmOpenWrite);
  if f = THandle(-1) then
    Result := GetLastError
  else
  begin
    {$IFDEF DefeatWarnings}{$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF} {$ENDIF}
    Result := FileSetDate(f, Age);
    {$IFDEF DefeatWarnings}{$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}{$ENDIF}
    FileClose(f);
  end;
end;
{$ENDIF}
{$IFDEF LINUX}
var
  ut: TUTimeBuffer;
begin
  Result := 0;
  ut.actime := Age;
  ut.modtime := Age;
  if utime(PChar(FileName), @ut) = -1 then
    Result := GetLastError;
end;
{$ENDIF}
{ -------------------------------------------------------------------------- }

function AbFlushOsBuffers(Handle : Integer) : Boolean;
//Taken from StSystem.pas from SysTools, modified to do nothing for linux
{-Flush the OS's buffers for the specified file}
begin
{$IFNDEF LINUX}
  Result := FlushFileBuffers(Handle);
  if not Result then
{$IFDEF Version6}
    RaiseLastOSError;
{$ELSE}
    RaiseLastWin32Error;
{$ENDIF}
{$ENDIF}
end;



{!!.01 -- End Added }
function AbSwapLongEndianness(Value : LongInt): LongInt;
{ convert BigEndian <-> LittleEndian 32-bit value }
type
  TCastArray = array [0..3] of Byte;
var
  i : Integer;
begin
  for i := 3 downto 0 do
    TCastArray(Result)[3-i] := TCastArray(Value)[i];
end;
{ -------------------------------------------------------------------------- }
function AbDOS2UnixFileAttributes(Attr: LongInt): LongInt;
begin
  {$IFDEF LINUX} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  Result := { default permissions }
    AB_FPERMISSION_OWNERREAD or
    AB_FPERMISSION_OWNERWRITE or
    AB_FPERMISSION_OWNEREXECUTE or
    AB_FPERMISSION_GROUPREAD or
    AB_FPERMISSION_OTHERREAD;

  if (Attr and faReadOnly) <> faReadOnly then
    Result := Result and not (AB_FPERMISSION_OWNERWRITE or AB_FPERMISSION_OWNEREXECUTE);
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
  {$IFDEF LINUX} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
end;
{ -------------------------------------------------------------------------- }
function AbUnix2DosFileAttributes(Attr: LongInt): LongInt;
begin
  {$IFDEF LINUX} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  Result := 0;
  case (Attr shr 24) shl 24 of
    AB_FMODE_FILE, AB_FMODE_FILE2: begin { standard file }
      Result := 0;
    end;

    AB_FMODE_DIR : begin  { directory }
      Result := Result or faDirectory;
    end;

    AB_FMODE_FIFO,
    AB_FMODE_CHARSPECFILE,
    AB_FMODE_BLOCKSPECFILE,
    AB_FMODE_FILELINK,
    AB_FMODE_SOCKET: begin
      Result := Result or faSysFile;
    end;
  end;

  if (Attr and AB_FPERMISSION_OWNERWRITE) <> AB_FPERMISSION_OWNERWRITE then
    Result := Result or faReadOnly;
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
  {$IFDEF LINUX} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
end;
{ -------------------------------------------------------------------------- }
function AbFileGetAttr(const aFileName : string) : Integer;
{$IFDEF LINUX}
{$WARN SYMBOL_PLATFORM OFF}
var
  SB: TStatBuf;
{$WARN SYMBOL_PLATFORM ON}
{$ENDIF LINUX}
begin
  {$IFDEF MSWINDOWS}
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  Result := FileGetAttr(aFileName);
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
  {$ENDIF}

  {$IFDEF LINUX}
  {$WARN SYMBOL_PLATFORM OFF}
  stat(PAnsiChar(aFileName), SB);
  Result := AbUnix2DosFileAttributes(SB.st_mode);                        {!!.01}
  {$WARN SYMBOL_PLATFORM ON}
  {$ENDIF}
end;
{ -------------------------------------------------------------------------- }
procedure AbFileSetAttr(const aFileName : string; aAttr : Integer);
begin
  {$IFDEF MSWINDOWS}
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
  FileSetAttr(aFileName, aAttr);
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
  {$ENDIF}

  {$IFDEF LINUX}
  {$WARN SYMBOL_PLATFORM OFF}
  chmod(PAnsiChar(aFileName), AbDOS2UnixFileAttributes(aAttr));          {!!.01}
  {$WARN SYMBOL_PLATFORM ON}
  {$ENDIF}
end;
{ -------------------------------------------------------------------------- }
{!!.01 -- Added }
function AbFileGetSize(const aFileName : string) :
{$IFDEF MSWINDOWS}
  {$IFDEF VERSION4} Int64 {$ELSE} LongInt {$ENDIF};
{$ENDIF}
{$IFDEF LINUX}
  Int64;
{$ENDIF}
{$IFDEF MSWINDOWS}
var
  SR : TSearchRec;
{$ENDIF}
{$IFDEF LINUX}
var
  StatBuf: TStatBuf64;
{$ENDIF}
begin
{$IFDEF MSWINDOWS}
  Result := -1;
  if FindFirst(aFileName, faAnyFile, SR) = 0 then begin       {!!.02}
  {$IFDEF VERSION4}
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM OFF} {$ENDIF}
    Int64Rec(Result).Lo := SR.FindData.nFileSizeLow;
    Int64Rec(Result).Hi := SR.FindData.nFileSizeHigh;
  {$IFDEF Version6} {$WARN SYMBOL_PLATFORM ON} {$ENDIF}
  {$ELSE}
    Result := SR.Size;
  {$ENDIF};
    FindClose(SR);                                            {!!.02}
  end;                                                        {!!.02}
{$ENDIF}
{$IFDEF LINUX}
  lstat64(PAnsiChar(aFileName), StatBuf);
  Result := StatBuf.st_size;
{$ENDIF}
end;
{!!.01 -- End Added }


{!!.04 - Added }
const
  MAX_VOL_LABEL = 16;

function AbGetVolumeLabel(Drive : AnsiChar) : AnsiString;
{-Get the volume label for the specified drive.}
var
  Root : AnsiString;
  Flags, MaxLength : DWORD;
  NameSize : Integer;
  VolName : string;
begin
{$IFDEF LINUX}
  result := ''; //Stop Gap, spanning support needs to be rethought for Linux
{$ELSE}
  NameSize := 0;
  Root := Drive + ':\';
  SetLength(VolName, MAX_VOL_LABEL);

  Result := '';

  if GetVolumeInformation(PAnsiChar(Root), PChar(VolName), Length(VolName),
    nil, MaxLength, Flags, nil, NameSize)
  then
    Result := VolName;
{$ENDIF}
end;

procedure AbSetSpanVolumeLabel(Drive: AnsiChar; VolNo : Integer);
begin
  AbWriteVolumeLabel(Format(AB_SPAN_VOL_LABEL,
    [VolNo]), Drive);
end;

function AbTestSpanVolumeLabel(Drive: AnsiChar; VolNo : Integer): Boolean;
var
  VolLabel, TestLabel : string;
begin
  TestLabel := Format(AB_SPAN_VOL_LABEL, [VolNo]);
  VolLabel := UpperCase(AbGetVolumeLabel(Drive));
  Result := VolLabel = TestLabel;
end;
{!!.04 - Added End }


end.
