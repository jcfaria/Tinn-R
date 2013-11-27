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
 * Robert Love
 *
 * Portions created by the Initial Developer are Copyright (C) 1997-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

unit AbUnzperTests;
{$I AbDefine.inc}
{ The following define is unit specific it will build the files used
  in the tests here. Due to the potential problems of compress having
  a problem and uncompress not, I did not want to confuse the tests by
  having these created every time, but only when needed under a stable
  code base... Otherwise it would more difficult to determine which
  side the problem was on!  WATCH out for hardcoding of paths, if you
  use this compiler define}
{.$DEFINE BUILDTESTS}
interface

uses
  Windows, // Needed for CopyFile could be replaced if needed on Linux
  TestFrameWork, abTestFrameWork, AbUnzper,
  SysUtils, Classes, abMeter, AbZipTyp,
  AbDfBase, abExcept;

type

  TAbUnZipperTests = class(TabCompTestCase)
  private
    Component : TAbUnZipper;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
    procedure TestUserAbortProgress(Sender : TObject; Progress : Byte; var Abort : Boolean);
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;
    procedure TestBasicUnzip;
    procedure TestBasicUnGzip;
    procedure TestBasicUnGzipTar;
    procedure TestUserAbort;
    procedure TestWinZipOutput;
    procedure TestGZipDecompress;
    procedure TestZeroByteZipFile;
    procedure TestIncompleteZipFile;
    procedure TestArchiveNotFound;
    procedure TestZipCopiedFromFloppy;
    procedure DecompressSimplePW;
    procedure CheckBadPWOverwrite;
    procedure TestLocale1;
    procedure TestLocale2;
    procedure TestLocale3;
    procedure TestLocale4;          

    {$IFDEF BUILDTESTS}
    procedure CreateTestFiles;
    {$ENDIF}
  end;

implementation
{$IFDEF BUILDTESTS}
  uses AbZipper;
{$ENDIF}

{ TAbUnZipperTests }

procedure TAbUnZipperTests.CheckBadPWOverwrite;
var
 Ms : TMemoryStream;
 Fs : TFileStream;
 TestFile : String;
 Buffer,Buffer1 : Array[0..20] of Char;
begin
// 698162 Failed unzipping of password protected files clobbers original
   TestFile := TestTempDir + 'MPL-1_1.TXT';
   if FileExists(TestFile) then
      DeleteFile(TestFile);
   // Create Dummy file to test with.
   FillChar(Buffer,SizeOf(Buffer),#0);
   Buffer := 'THIS IS A TEST';
   Fs := TFileStream.Create(TestFile,fmCreate);
   FS.Write(Buffer,SizeOf(Buffer)); // Write something to file
   FS.Free;
   // Try to extract with wrong password
   Component.FileName := TestFileDir + 'simplepw.zip';
   Component.Password := 'wrong password';
   Component.BaseDirectory := TestTempDir;
   try
   Component.ExtractFiles('*.*'); // MPL-1_1.TXT
   except
    on EAbInflatePasswordError do
      // nothing Expected
   end;

   CheckFileExists(TestFile);

   // Test to make sure file matches dummy original
   Fs := TFileStream.Create(TestFile,fmOpenRead);
   try
     FS.Read(Buffer1,SizeOf(Buffer1));
     CompareMem(@Buffer[0],@Buffer[1],SizeOf(Buffer));
   finally
    Fs.free;
    DeleteFile(TestFile); 
   end;

end;

{$IFDEF BUILDTESTS}
procedure TAbUnZipperTests.CreateTestFiles;
var
 Zip : TAbZipper;
begin
 //Cheap and easy way to keep the code around that I use to build the tests
 //Hard Coded to Abbrevia path to keep things easy as this is one time only code
 Zip := TAbZipper.Create(nil);
 try
    Zip.FileName := TestFileDir + 'MPL.ZIP';
    Zip.AddFiles('C:\TP\ABBREVIA\MPL-1_1.TXT',faAnyFile);
    Zip.Save;
 finally
   Zip.Free;
 end;
 Zip := TAbZipper.Create(nil);
 try
    Zip.FileName := TestFileDir + 'MPL.GZ';
    Zip.AddFiles('C:\TP\ABBREVIA\MPL-1_1.TXT',faAnyFile);
    Zip.Save;
 finally
   Zip.Free;
 end;
 Zip := TAbZipper.Create(nil);
 try
    Zip.FileName := TestFileDir + 'MPL.TGZ';
    Zip.AddFiles('C:\TP\ABBREVIA\MPL-1_1.TXT',faAnyFile);
    Zip.Save;
 finally
   Zip.Free;
 end;
end;
{$ENDIF}

procedure TAbUnZipperTests.DecompressSimplePW;
var
 Ms : TMemoryStream;
 Fs : TFileStream;
begin
   Ms := TMemoryStream.create;
   try
   Component.FileName := TestFileDir + 'simplepw.zip';
   Component.Password := 'simple';
   Component.ExtractOptions := [];
   Component.ExtractToStream(Component.Items[0].FileName,MS);
   Fs := TFileStream.Create(TestFileDir + 'MPL-1_1.TXT',fmOpenRead);
   try
   CheckStreamMatch(MS,FS,'simplepw.zip MPL-1_1.TXT does not match original');
   finally
    Fs.free;
   end;

   finally
    ms.free;
   end;

end;

procedure TAbUnZipperTests.SetUp;
begin
  inherited;
  Component := TAbUnzipper.Create(TestForm);
end;

procedure TAbUnZipperTests.TearDown;
begin
  inherited;

end;


procedure TAbUnZipperTests.TestArchiveNotFound;
begin
 ExpectedException := EAbFileNotFound;
 // Delete File if it exists
 if FileExists(TestTempDir + 'nonexist.zip') then
    DeleteFile(TestTempDir + 'nonexist.zip');
 // Try to set the filename to the open byte file.
 Component.FileName := TestTempDir + 'nonexist.zip';
end;

procedure TAbUnZipperTests.TestBasicUnGzip;
var
 TestFileName : string;
begin
  TestFileName :=  TestTempDir + 'MPL-1_1.txt';
  if FileExists(TestFileName) then
     DeleteFile(TestFileName);
  Component.BaseDirectory := TestTempDir;
  Component.FileName := TestFileDir + 'mpl.gz';
  Component.ExtractFiles('*.*');
  Check(FileExists(TestFileName),'Unzip Test File not Found');
  DeleteFile(TestFileName)
end;

procedure TAbUnZipperTests.TestBasicUnGzipTar;
var
 TestFileName : string;
begin
  TestFileName :=  TestTempDir + 'MPL-1_1.txt';
  if FileExists(TestFileName) then
     DeleteFile(TestFileName);
  Component.BaseDirectory := TestTempDir;
  Component.FileName := TestFileDir + 'mpl.tgz';
  Component.ExtractFiles('*.*');
  Check(FileExists(TestFileName),'Unzip Test File not Found');
  DeleteFile(TestFileName)
end;

procedure TAbUnZipperTests.TestBasicUnzip;
var
 TestFileName : string;
begin
  TestFileName :=  TestTempDir + 'MPL-1_1.txt';
  if FileExists(TestFileName) then
     DeleteFile(TestFileName);
  Component.BaseDirectory := TestTempDir;
  Component.FileName := TestFileDir + 'mpl.zip';
  Component.ExtractFiles('*.*');
  Check(FileExists(TestFileName),'Unzip Test File not Found');
  DeleteFile(TestFileName);
end;

procedure TAbUnZipperTests.TestComponentLinks;
var
  MLink1,MLink2 : TAbVCLMeterLink;
begin
  MLink1 := TAbVCLMeterLink.Create(TestForm);
  MLink2 := TAbVCLMeterLink.Create(TestForm);
  Component.ArchiveProgressMeter := MLink1;
  Component.ItemProgressMeter := MLink2;
  MLink1.Free;
  MLink2.Free;
  Check(Component.ArchiveProgressMeter = nil,'Notification does not work for TabUnZipper.ArchiveProgressMeter');
  Check(Component.ItemProgressMeter = nil,'Notification does not work for TabUnZipper.ItemProgressMeter');
end;

procedure TAbUnZipperTests.TestDefaultStreaming;
var
CompStr : STring;
CompTest : TAbUnZipper;
begin
  RegisterClass(TAbUnZipper);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbUnZipper);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbUnZipper);
end;

procedure TAbUnZipperTests.TestGZipDecompress;
var
 fs,fs2 : TFileStream;
begin
 fs := TFileStream.Create(TestFileDir + 'dataland.txt',fmOpenRead);
 try
 // [ 822243 ] GZip decompress problem
 component.FileName := TestFileDir + 'download[1].datalandsoftware.com-Aug-2003.gz';
 Component.BaseDirectory:= TestTempDir;
 {$IFDEF UseLogging}
 Component.LogFile := TestTempDir + 'dataland.log';
 Component.Logging := True;
 {$ENDIF}
 Component.ExtractAt(0,TestTempDir + 'dataland.txt');
 fs2 := TFileStream.Create(TestTempDir + 'dataland.txt',fmOpenRead);
 try
 Check(fs2.Size > 0,'Extracted File is 0 bytes in size');
 CheckStreamMatch(fs,fs2,'Extracted File does not match original file');
 finally
  fs2.free;
 end;
 finally
  fs.free;
 end;

end;

procedure TAbUnZipperTests.TestIncompleteZipFile;
var
 FS : TFileStream;
begin
 // Since file only contains initial sig and not Central Directory Tail Struct
 // It should not be recogonized.
 ExpectedException := EAbUnhandledType;
 // Delete File if it exists
 if FileExists(TestTempDir + 'dummy.zip') then
    DeleteFile(TestTempDir + 'dummy.zip');
 // Create Zero Byte File
 FS := TFileStream.Create(TestTempDir + 'dummy.zip',fmCreate);
 FS.Write(Ab_ZipLocalFileHeaderSignature,sizeof(Ab_ZipLocalFileHeaderSignature));
 FS.Free;
 // Try to set the filename to the open byte file.
 Component.FileName := TestTempDir + 'zerobyte.zip';
end;

procedure TAbUnZipperTests.TestLocale1;
var
 ltestdir,
 ltestzip,
 ltestfile : string;
begin
// This test verifies use Ability to use Charactes such as ãëíõú
// In the Archive Directory Name

  // Create New Directory
  //236 changes into a ? on my machine in the delphi editor
  // so I thought it would be a good character to test with
  ltestdir := TestTempDir  + chr(236) + 'ãëíõú\';
  ForceDirectories(ltestDir);

  // copy fresh MPL.ZIP to locale1.zip in the new directory
  ltestFile := lTestdir + 'locale1.zip';
  if FileExists(lTestFile) then
     DeleteFile(lTestFile);
  ltestzip := TestFileDir + 'MPL.ZIP';
  CopyFile(pchar(ltestzip),pchar(ltestFile),false);


  Component.FileName := lTestFile;
  Component.BaseDirectory := TestTempDir;
  // Delete File to be extract if it exists
  if FileExists(TestTempDir + 'MPL-1_1.txt') then
     DeleteFile(TestTempDir + 'MPL-1_1.txt');
  Component.ExtractFiles('*.*');
  Component.CloseArchive;

  CheckFileExists(TestTempDir + 'MPL-1_1.txt');

end;

procedure TAbUnZipperTests.TestLocale2;
var
 ltestdir,
 ltestzip,
 ltestfile : string;
begin
// This test verifies use Ability to use Charactes such as ãëíõú
// In the Base Directory Name

  // Create New Directory
  //236 changes into a ? on my machine in the delphi editor
  // so I thought it would be a good character to test with
  ltestdir := TestTempDir  + chr(236) + 'ãëíõú\';
  ForceDirectories(ltestDir);

  ltestFile := TestFileDir + 'MPL.ZIP';

  Component.FileName := lTestFile;
  Component.BaseDirectory := lTestDir;
  // Delete File to be extract if it exists
  if FileExists(lTestDir + 'MPL-1_1.txt') then
     DeleteFile(lTestDir + 'MPL-1_1.txt');
  Component.ExtractFiles('*.*');
  Component.CloseArchive;

  CheckFileExists(lTestDir + 'MPL-1_1.txt');
end;

procedure TAbUnZipperTests.TestLocale3;
var
 ltestzip,
 ltestfile : string;
begin
// This test verifies use Ability to use Charactes such as ãëíõú
// In the Archive File Name

  // copy fresh MPL.ZIP to localeãëíõú3.zip in the temp directory
  ltestFile := TestTempDir + 'localeãëíõú3.zip';
  if FileExists(lTestFile) then
     DeleteFile(lTestFile);
  ltestzip := TestFileDir + 'MPL.ZIP';
  CopyFile(pchar(ltestzip),pchar(ltestFile),false);


  Component.FileName := lTestFile;
  Component.BaseDirectory := TestTempDir;
  // Delete File to be extract if it exists
  if FileExists(TestTempDir + 'MPL-1_1.txt') then
     DeleteFile(TestTempDir + 'MPL-1_1.txt');
  Component.ExtractFiles('*.*');
  Component.CloseArchive;

  CheckFileExists(TestTempDir + 'MPL-1_1.txt');

end;

procedure TAbUnZipperTests.TestLocale4;
var
 ltestzip,
 ltestfile : string;
begin
// This test verifies use Ability to use Charactes such as ãëíõú
// In the Files contained in the Archive.

  Component.FileName := TestFileDir + 'LocaleTests.zip';
  Component.BaseDirectory := TestTempDir;

  // Delete Files in Temp Directory if they exist
  if FileExists(TestTempDir + 'testãëíõú1.lc4') then
     DeleteFile(TestTempDir + 'testãëíõú1.lc4');
  if FileExists(TestTempDir + 'testãëíõú2.lc4') then
     DeleteFile(TestTempDir + 'testãëíõú2.lc4');
  if FileExists(TestTempDir + 'testãëíõú3.lc4') then
     DeleteFile(TestTempDir + 'testãëíõú3.lc4');

  Component.ExtractFiles('*.lc4');
  Component.CloseArchive;

  CheckFileExists(TestTempDir + 'testãëíõú1.lc4');
  CheckFileExists(TestTempDir + 'testãëíõú2.lc4');
  CheckFileExists(TestTempDir + 'testãëíõú3.lc4');

end;

procedure TAbUnZipperTests.TestUserAbort;
var
 FUnZipper : TAbUnZipper;
begin
// This test needs to create and free the component as the problem is in the FREE
// Inspired by, but not testing for the same thing as SF.Net Tracker ID [ 785269 ]

// Expecting this exception don't fail if it occurs.
ExpectedException := EAbUserAbort;

FUnZipper := TAbUnZipper.Create(Nil);
TRY
FUnZipper.BaseDirectory := TestTempDir;
FUnZipper.OnArchiveProgress:=TestUserAbortProgress;
FUnZipper.FileName:=TestFileDir + 'MPL.ZIP';
FUnZipper.ExtractFiles('*.*');
Finally
FUnZipper.Free;
end;

end;

procedure TAbUnZipperTests.TestUserAbortProgress(Sender: TObject;
  Progress: Byte; var Abort: Boolean);
begin
 Abort := (Progress > 25);
end;

procedure TAbUnZipperTests.TestWinZipOutput;
begin
// This compares a known problem archive with the results that were extracted from
// WinZip.
  Component.BaseDirectory := TestTempDir;
  Component.Filename := TestFileDir + '20030328.ZIP';
  Component.ExtractFiles('*.*');
  CheckDirMatch(TestFileDir + '20030328\',TestTempDir,true);

end;

procedure TAbUnZipperTests.TestZeroByteZipFile;
var
 FS : TFileStream;
begin
 ExpectedException := EAbBadStream;
 // Delete File if it exists
 if FileExists(TestTempDir + 'zerobyte.zip') then
    DeleteFile(TestTempDir + 'zerobyte.zip');
 // Create Zero Byte File
 FS := TFileStream.Create(TestTempDir + 'zerobyte.zip',fmCreate);
 FS.Free;
 // Try to set the filename to the open byte file.
 Component.FileName := TestTempDir + 'zerobyte.zip';
end;

procedure TAbUnZipperTests.TestZipCopiedFromFloppy;
begin
//[ 858945 ] copy of File saved to floppy cannot be opened
// Error of File Not Found appears if it fails.
  Component.FileName := TestFileDir + 'cpFromFloppy.zip';
  Component.BaseDirectory := TestTempDir;
  ChDir(TestTempDir);
  Component.ExtractFiles('*.*');
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbUnZipperTests.Suite);

end.

