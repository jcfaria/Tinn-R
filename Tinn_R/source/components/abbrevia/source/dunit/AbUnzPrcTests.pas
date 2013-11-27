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

unit AbUnzPrcTests;
{$I AbDefine.inc}
interface

uses
  TestFrameWork,abUnzPrc,abTestFramework,abTestConsts,SysUtils,Classes;

type

  TAbUnzPrcTests = class(TabTestCase)
  private
    FUnCompressedStream : TMemoryStream;
    FCompressedStream   : TMemoryStream;
  protected
   procedure SetUp; override;
   procedure TearDown; override;

  published

    procedure InflateStreamSimpleTest1;
    procedure InflateStreamSimpleTest2;
    procedure InflateStreamFileTest;
    procedure CompareFiles;


  end;

implementation

{ TAbUnzPrcTests }

procedure TAbUnzPrcTests.CompareFiles;
var
 FS1, FS2 : TFileStream;
begin
  FS1 := TFileStream.Create('C:\tp\abbrevia\bugtest\unknown',fmOpenRead);
  FS2 := TFileSTream.Create('C:\tp\abbrevia\bugtest\ex1',fmOpenRead);
  CheckStreamMatch(FS1,FS2,'They don''t match');
  FS1.Free;
  FS2.Free;
end;

procedure TAbUnzPrcTests.InflateStreamFileTest;
var
 FS : TFileStream;
begin
  {$IFDEF LINUX}
  FCompressedStream.LoadFromFile(TestFileDir + 'StreamTests/Testdoc1.cmp');
  {$ELSE}
  FCompressedStream.LoadFromFile(TestFileDir + 'StreamTests\Testdoc1.cmp');
  {$ENDIF}
  FCompressedStream.Seek(0,soFromBeginning);

  InflateStream(FCompressedStream,FUnCompressedStream);

  {$IFDEF LINUX}
  FS := TFileStream.Create(TestFileDir + 'StreamTests/Testdoc1.txt',fmOpenRead);
  {$ELSE}
  FS := TFileStream.Create(TestFileDir + 'StreamTests\Testdoc1.txt',fmOpenRead);
  {$ENDIF}
  try
  CheckStreamMatch(FUnCompressedStream,FS,'Streamtests\Testdoc1.cmp UnCompressed did not match contents of Streamtests\Testdoc1.txt');
  finally
    fs.free;
  end;
end;

procedure TAbUnzPrcTests.InflateStreamSimpleTest1;
var
 I : Integer;
 b : byte;
begin
  FCompressedStream.Write(CompressedBuf1,SizeOf(CompressedBuf1));
  FCompressedStream.Seek(0,soFromBeginning);
  InflateStream(FCompressedStream,FUnCompressedStream);

  check(FUnCompressedStream.Size = sizeOf(UnCompressedBuf1),'FUnCompressedStream.Size ('+IntToStr(FUnCompressedStream.Size)+ ') should be sizeOf(UnCompressedBuf1)');
  FUnCompressedStream.Seek(0,soFromBeginning); // Move to start;
  for I := 0 to sizeOf(UnCompressedBuf1)-1 do
   begin
     FUnCompressedStream.Read(b,1);
     check(B = UnCompressedBuf1[I], 'Byte [' + IntToStr(I) + '] of Buffer is incorrect, Expecting:' + IntTostr(UnCompressedBuf1[I]) + ' found :'  + IntToStr(B));
   end;
end;

procedure TAbUnzPrcTests.InflateStreamSimpleTest2;
var
 I : Integer;
 b : byte;
begin
  FCompressedStream.Write(CompressedBuf2,SizeOf(CompressedBuf2));
  FCompressedStream.Seek(0,soFromBeginning);
  InflateStream(FCompressedStream,FUnCompressedStream);

  check(FUnCompressedStream.Size = sizeOf(UnCompressedBuf2),'FUnCompressedStream.Size ('+IntToStr(FUnCompressedStream.Size)+ ') should be sizeOf(UnCompressedBuf2)');
  FUnCompressedStream.Seek(0,soFromBeginning); // Move to start;
  for I := 0 to sizeOf(UnCompressedBuf2)-1 do
   begin
     FUnCompressedStream.Read(b,1);
     check(B = UnCompressedBuf2[I], 'Byte [' + IntToStr(I) + '] of Buffer is incorrect, Expecting:' + IntTostr(UnCompressedBuf2[I]) + ' found :'  + IntToStr(B));
   end;
end;

procedure TAbUnzPrcTests.SetUp;
begin
  inherited;
  FUnCompressedStream := TMemoryStream.Create;
  FCompressedStream   := TMemoryStream.Create;
end;


procedure TAbUnzPrcTests.TearDown;
begin
  FUnCompressedStream.Free;
  FCompressedStream.Free;
  inherited;  
end;

initialization

  TestFramework.RegisterTest('Abbrevia.AbUnzPrc Suite',
    TAbUnzPrcTests.Suite);
 
end.

 