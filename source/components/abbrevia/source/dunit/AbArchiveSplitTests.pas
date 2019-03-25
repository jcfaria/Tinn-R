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
unit AbArchiveSplitTests;

interface

uses
  TestFrameWork, abTestFramework, Windows,SysUtils,Classes, abZipper,abExcept,abUnzper;

type

  TAbArchiveSplitTests = class(TabTestCase)
  private
    procedure AbortOnImageRequestEVENT (Sender : TObject; ImageNumber : Integer;
                                  var ImageName : string; var Abort : Boolean);

  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure CreateBasicSplitArchive;
//    procedure TestCreatedWithWinZip;
    procedure VerifyBasicSplitArchive;
    procedure AbortOnImageRequest;

  end;

implementation

{ TAbArchiveSplitTests }

procedure TAbArchiveSplitTests.AbortOnImageRequest;
var
 Zip : TabZipper;
begin
 // [ 783614 ] Item #1
 // 3.05 Beta Code produced EAbBadStream, it should be EabUserAbort
   ExpectedException := EabUserAbort;
   if DirExists(TestTempDir+'SPLIT-ABORT\') then
      DelTree(TestTempDir + 'SPLIT-ABORT\');
     CreateDir(TestTempDir+'SPLIT-ABORT\');
   // UnZips the Basic Span that was created by zipping all .EXE Files in C:\WINDOWS\
   // Compares each file byte by byte to original.
   Zip := TAbZipper.create(nil);
   try
   Zip.BaseDirectory := GetWindowsDir;
   Zip.FileName := TestTempDir + 'SPLIT-ABORT\SPLITTEST.ZIP';
   Zip.SpanningThreshold := 50000;
   Zip.OnRequestImage := AbortOnImageRequestEVENT;
   Zip.AddFiles('*.DLL',faAnyFile);
   Zip.Save;
   finally
     Zip.Free;
   end;


end;

procedure TAbArchiveSplitTests.AbortOnImageRequestEVENT(Sender: TObject;
  ImageNumber: Integer; var ImageName: string; var Abort: Boolean);
begin
 if ImageNumber = 2 then Abort := True;
end;

procedure TAbArchiveSplitTests.CreateBasicSplitArchive;
var
  Zip : TAbZipper;
begin
   if DirExists(TestTempDir+'SPLIT\') then
      DelTree(TestTempDir + 'SPLIT\');
     CreateDir(TestTempDir+'SPLIT\');
   // UnZips the Basic Span that was created by zipping all .EXE Files in C:\WINDOWS\
   // Compares each file byte by byte to original.
   Zip := TAbZipper.create(nil);
   try
   Zip.BaseDirectory := GetWindowsDir;
   Zip.FileName := TestTempDir + 'SPLIT\SPLITTEST.ZIP';
   Zip.SpanningThreshold := 50000;
   Zip.AddFiles('*.DLL',faAnyFile);
   Zip.Save;
   finally
     Zip.Free;
   end;
end;

procedure TAbArchiveSplitTests.SetUp;
begin
  inherited;
end;

procedure TAbArchiveSplitTests.TearDown;
begin
  inherited;

end;

// Bogus test WinZip Command Line does not support split archives
// it thinks the archive is a span instead.
//procedure TAbArchiveSplitTests.TestCreatedWithWinZip;
//begin
// Archive used in this test is created with the "CreateBasicSplitArchive" Test
// Found in: TestTempDir + 'SPLIT\SPLITTEST.ZIP'
//  ExecuteAndWait(UnWinZip,TestTempDir + 'SPLIT\SPLITTEST.ZIP');
//end;

procedure TAbArchiveSplitTests.VerifyBasicSplitArchive;
var
  UnZip : TAbUnZipper;
  mStream : TMemoryStream;
  fStream : TFileStream;
  I : Integer;
  TestFile : string;
begin
   // Create a Basic Span by zipping all .EXE Files in C:\WINDOWS\
   UnZip := TAbUnZipper.create(nil);
   mStream := TMemoryStream.Create;
   try
   UnZip.BaseDirectory := GetTestTempDir;
   CheckFileExists(TestTempDir + 'SPLIT\SPLITTEST.ZIP');
   UnZip.FileName := TestTempDir + 'SPLIT\SPLITTEST.ZIP';
   Check(Unzip.Count > 0,'Archive SPLITTEST.ZIP is empty');
   For I := 0 to Unzip.Count -1 do
    begin
      testFile := GetWindowsDir + ExtractFileName(UnZip.Items[I].FileName);
      // Make sure file exist to compare to.
      CheckFileExists(TestFile);
      // Extract File in Span to Memory
      UnZip.ExtractToStream(UnZip.Items[I].FileName,mStream);
      // Check to make sure mStream is not empty (note: this occured for awhile, during development)
      Check(mStream.Size >0,'Memory Stream containing "' + UnZip.Items[I].FileName + '" is 0 bytes in length.');
      // Open the Existing File in Read Only Mode.
      fStream := TFileStream.Create(TestFile,fmOpenRead);
      try
      // Make sure memory Stream of File and Actual File Match, Byte for Byte (This takes some time to complete)
      CheckStreamMatch(mStream,fStream,'Test File: ' + TestFile + ' did not Match Archive');
      finally
        fStream.Free;
      end;
      mStream.SetSize(0);
    end;
   finally
     UnZip.Free;
     mStream.Free;
   end;
end;

initialization

  TestFramework.RegisterTest('Abbrevia.File Splitting Tests',
    TAbArchiveSplitTests.Suite);
 
end.

 