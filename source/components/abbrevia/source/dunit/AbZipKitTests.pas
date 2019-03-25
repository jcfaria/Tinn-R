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

unit AbZipKitTests;
{$I AbDefine.inc}
interface

uses
  TestFrameWork, abTestFrameWork, AbZipKit, AbZipTyp, AbArctyp, SysUtils,
  Classes, abMeter;

type

  TAbZipKitTests = class(TabCompTestCase)
  private
    Component : TAbZipKit;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;
    procedure TestAddThenExtract;
    procedure TestTaggedFiles;
    procedure FreshenTest;
    procedure FreshenBaseDir;
  end;

implementation
uses Dialogs;
{ TAbZipKitTests }


procedure TAbZipKitTests.FreshenBaseDir;
// Test Freshen without setting the Base Directory
// SF.NET Tracker [ 892830 ] DiskFileName is not set correctly
var
 TestFile : String;
 SL : TStringList;
 MS : TMemoryStream;
 FS : TFileStream;

begin

TestFile := TestTempDir + 'freshenBaseDir.zip';
if FileExists(testFile) then
  DeleteFile(testFile);
  
Component.StoreOptions := Component.StoreOptions + [soRecurse,soFreshen];
Component.FileName := TestFile;
Component.DeflationOption := doMaximum;

// Create Files to add

  // Create 3 Text Files to add to archive.
 SL := TStringList.Create;
 try
  SL.Add('Test File');

  SL.SaveToFile(TestTempDir + 'Freshen1base.fsh');
  SL.SaveToFile(TestTempDir + 'Freshen2base.fsh');
  SL.SaveToFile(TestTempDir + 'Freshen3base.fsh');
  Component.AddFiles(TestTempDir + 'Freshen1base.fsh', 0);
  Component.AddFiles(TestTempDir + 'Freshen2base.fsh', 0);
  Component.AddFiles(TestTempDir + 'Freshen3base.fsh', 0);

  Component.CloseArchive;

 // Modify the 2nd File
  SL.Add('Modification');
  SL.SaveToFile(TestTempDir + 'Freshen2base.fsh');

 // Freshen the archive
  Component.FileName := TestFile;
  Component.DeflationOption := doMaximum;
  Component.StoreOptions := Component.StoreOptions + [soRecurse, soFreshen];
  Component.AddFiles(TestTempDir + 'Freshen1base.fsh', 0);
  Component.AddFiles(TestTempDir + 'Freshen2base.fsh', 0);
  Component.AddFiles(TestTempDir + 'Freshen3base.fsh', 0);
  Component.Save;

  // Make sure modified file and archive value matches
  MS := TMemoryStream.create;
  FS := TFileStream.create(TestTempDir + 'Freshen2base.fsh',fmOpenRead);
  try
    Component.ExtractToStream(Component.Items[1].FileName,MS);
    CheckStreamMatch(FS,MS,'Freshened File on Disk Did not Match Archived value');
  finally
    MS.Free;
    FS.Free;
  end;


  finally
    SL.Free;
    DeleteFile(TestTempDir + 'Freshen1base.fsh');
    DeleteFile(TestTempDir + 'Freshen2base.fsh');
    DeleteFile(TestTempDir + 'Freshen3base.fsh');
    DeleteFile(TestFile);
  end;

end;

procedure TAbZipKitTests.FreshenTest;
// [887909] soFreshen isn't working
var
 SL : TStringList;
 MS : TMemoryStream;
 FS : TFileStream;
begin
  // Create 3 Text Files to add to archive.
 SL := TStringList.Create;
 try
  SL.Add('Test File');

  SL.SaveToFile(TestTempDir + 'Freshen1.fsh');
  SL.SaveToFile(TestTempDir + 'Freshen2.fsh');
  SL.SaveToFile(TestTempDir + 'Freshen3.fsh');

  if FileExists(TestTempDir + 'Freshen.zip') then
    DeleteFile(TestTempDir + 'Freshen.zip');

  Component.FileName := TestTempDir + 'Freshen.zip';
  Component.BaseDirectory := TestTempDir;
  Component.DeflationOption := doMaximum;
  Component.StoreOptions := Component.StoreOptions + [soRecurse, soFreshen];
  Component.AddFiles('*.fsh',0);
  Component.Save;
  component.CloseArchive;

 // Modify the 2nd File
  SL.Add('Modification');
  SL.SaveToFile(TestTempDir + 'Freshen2.fsh');

 // Freshen the archive
  Component.FileName := TestTempDir + 'Freshen.zip';
  Component.BaseDirectory := TestTempDir;
  Component.DeflationOption := doMaximum;
  Component.StoreOptions := Component.StoreOptions + [soRecurse, soFreshen];
  Component.AddFiles('*.fsh',0);
  Component.Save;

// Make sure modified file and archive value matches
  MS := TMemoryStream.create;
  FS := TFileStream.create(TestTempDir + 'Freshen2.fsh',fmOpenRead);
  try
    Component.ExtractToStream('Freshen2.fsh',MS);
    CheckStreamMatch(FS,MS,'Freshened File on Disk Did not Match Archived value');
  finally
    MS.Free;
    FS.Free;
  end;


 finally
  SL.Free;
  DeleteFile(TestTempDir + 'Freshen1.fsh');
  DeleteFile(TestTempDir + 'Freshen2.fsh');
  DeleteFile(TestTempDir + 'Freshen3.fsh');
  DeleteFile(TestTempDir + 'Freshen.zip');
 end;


end;

procedure TAbZipKitTests.SetUp;
begin
  inherited;
  Component := TAbZipKit.Create(TestForm);
end;

procedure TAbZipKitTests.TearDown;
begin
  inherited;

end;

procedure TAbZipKitTests.TestAddThenExtract;
var
 MS : TMemoryStream;
 FS : TFileStream;
 I  : Integer;
begin
// [ 785769 ] SF.NET Tracker ID is the Bug this is testing for.

// This test is designed to add to an archive
// Then extract from it without having to close/reopen archive.

if FileExists(TestTempDir + 'ZKitTest.zip') then
  DeleteFile(TestTempDir + 'ZKitTest.zip');

Component.FileName := TestTempDir + 'ZKitTest.zip';
Component.BaseDirectory := GetWindowsDir;
Component.AddFiles('*.ZIP',faAnyFile);
Component.Save;
MS := TMemoryStream.Create;
try
For I := 0 to Component.Count -1 do
  begin
    // Compare uncompressed Files to Original Files
     Component.ExtractToStream(Component.Items[I].FileName,MS);
     FS := TFileStream.create(TestFileDir + ExtractFileName(Component.Items[I].FileName),fmOpenRead);
     try
     CheckStreamMatch(MS,FS,'File ' + Component.Items[I].FileName + ' did not match original.');
     MS.Clear;
     finally
      FS.Free;
     end;
  end;
finally
  MS.Free;
end;



end;

procedure TAbZipKitTests.TestComponentLinks;
var
  MLink1,MLink2,MLink3 : TAbVCLMeterLink;
begin
  MLink1 := TAbVCLMeterLink.Create(TestForm);
  MLink2 := TAbVCLMeterLink.Create(TestForm);
  MLink3 := TAbVCLMeterLink.Create(TestForm);
  Component.ArchiveProgressMeter := MLink1;
  Component.ItemProgressMeter := MLink2;
  Component.ArchiveSaveProgressMeter := MLink3;
  MLink1.Free;
  MLink2.Free;
  MLink3.Free;
  Check(Component.ArchiveProgressMeter = nil,'Notification does not work for TAbZipKit.ArchiveProgressMeter');
  Check(Component.ItemProgressMeter = nil,'Notification does not work for TAbZipKit.ItemProgressMeter');
  Check(Component.ArchiveSaveProgressMeter = nil,'Notification does not work for TAbZipKit.ArchiveSaveProgressMeter');
end;

procedure TAbZipKitTests.TestDefaultStreaming;
var
CompStr : STring;
CompTest : TAbZipKit;
begin
  RegisterClass(TAbZipKit);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbZipKit);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbZipKit);
end;

procedure TAbZipKitTests.TestTaggedFiles;
begin
// Test for Bug  806077
  DeleteFile(TestTempDir + 'test.zip');
  Component.FileName := TestTempDir + 'test.zip';
  Component.AutoSave := True;
  Component.BaseDirectory := TestFileDir;
  Component.ClearTags;
  Component.AddFiles('*.*',0);
  Component.TagItems('*.*');
  Check(Component.Count > 0);
  // TestTaggedItems should not raise an error.
  Component.TestTaggedItems;
  Component.CloseArchive;
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbZipKitTests.Suite);
 
end.

 