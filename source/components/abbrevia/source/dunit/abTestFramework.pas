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

unit abTestFramework;
{$I AbDefine.inc}
interface

uses TestFramework, AbUtils,{$IFDEF VERSION6} Variants,
     {$ENDIF} {$IFDEF LINUX} QForms,QControls, {$ELSE}Forms,Windows,Controls,{$ENDIF}
     SysUtils, Classes, {$IFDEF WINZIPTESTS}SyncObjs,{$ENDIF}TypInfo;
{$IFDEF WINZIPTESTS}
// Hard Coded as I could not find install location in the Registry to extract and make dynamic
// if this proves to be a problem, we will have to have test configuration file that specifies
// the winzip command line utility path.
const
    UnWinZip = 'C:\Program Files\WinZip\wzunzip.exe';
{$ENDIF}
type

{$IFNDEF VERSION6}
  TIntegerSet = set of 0..SizeOf(Integer) * 8 - 1;
{$ENDIF}


 TabTestCase = class(TTestCase)
   protected
    {$IFDEF WINZIPTESTS}
      FSpawnComplete  : TSimpleEvent;
      procedure SpawnErrorEvent(Sender : TObject; Error : Word);
      procedure SpawnCompletedEvent(Sender : TObject);
      procedure SpawnTimeOutEvent(Sender : TObject);
      procedure ExecuteAndWait(ExeName,Param : String;TimeOut : Integer = 0); // Exception if failure
    {$ENDIF}
    function GetTestFileDir : string;
    function GetTestTempDir : string;
    function GetWindowsDir : string;
    procedure CheckStreamMatch(aStream1,aStream2 : TStream;Msg : String);
    procedure CheckFileExists(aFileName : String);
    procedure CreateDummyFile(aFileName : string; aSize : Integer);
    procedure Setup; override;
    procedure Teardown; override;
    procedure FilesInDirectory(const aDir : String;FileList : TStringList);
    procedure CheckDirMatch(aDir1,aDir2 : string;IgnoreMissingFiles: Boolean = true);
    // Call this routine with GREAT Caution!!!!
    function DelTree(Dir : String) : Boolean;

   public
     property TestFileDir : String read GetTestFileDir;
     property TestTempDir : String read GetTestTempDir;
   end;

 TabCompTestCase = class(TabTestCase)
   protected
     FTestForm : TForm;
     FComponentClass : TComponentClass;
     IgnoreProp : TStringList;
     procedure SetUp; override;
     procedure TearDown; override;

     // RTTI function so that they match from version to version of delphi.
     function AbGetPropList(TypeInfo: PTypeInfo; out PropList: PPropList): Integer;
     function AbGetPropValue(Instance: TObject; const PropName: string; PreferStrings: Boolean = True): Variant;


     function StreamComponent(aComp : TComponent) : String;
     function UnStreamComponent(aCompStr : String;Instance : TComponent = nil) : TComponent; overload;

     procedure CompareComponentProps(aComp1,aComp2 : TPersistent); virtual;
   public
    property TestForm : TForm read FTestForm;
    procedure ShowForm; virtual;
   published
   end;

//function IncTrailingBackSlash(const str: String) : string;
function DirExists(const dir : string) : boolean;

implementation
// Systool Unit change abdefine.inc if you don't have systools or don't want
// to run winzip compatability tests
{$IFDEF WINZIPTESTS} Uses stSpawn; {$ENDIF}


//function IncTrailingBackSlash(const str: String) : string;
//begin
// if Str[Length(Str)] <> '\' then
//     result  := Str + '\';
//end;

function DirExists(const dir: string): Boolean;
var
  Code: Integer;
begin
  Code := GetFileAttributes(PChar(Dir));
  Result := (Code <> -1) and (FILE_ATTRIBUTE_DIRECTORY and Code <> 0);
end;

{ TabTestCase }

procedure TabTestCase.CheckDirMatch(aDir1, aDir2: string;
  IgnoreMissingFiles: Boolean);
var
 d1,d2 : TStringList;
 FS1,FS2 : TFileStream;
 I : Integer;
begin
 d1 := TStringList.Create;
 d1.Sorted := true;
 d2 := TStringList.Create;
 d2.Sorted := True;
 try
   FilesInDirectory(aDir1,d1);
   FilesInDirectory(aDir2,d2);
   Check(not ((not IgnoreMissingFiles) and (d1.count <> d2.count)),'Number of files in Directories do not match');
   For I := 0 to d1.count -1 do
    begin
      if d2.IndexOf(d1.Strings[I]) = -1 then
       begin
         Check(IgnoreMissingFiles,d1.Strings[I] + ' is Missing in Directory');
       end
      else
       begin
         FS1 := TFileStream.Create(AbAddBackSlash(aDir1) + ExtractFileName(d1.Strings[I]),fmOpenRead);
         FS2 := TFileStream.Create(AbAddBackSlash(aDir2) + ExtractFileName(d1.Strings[I]),fmOpenRead);
         try
           CheckStreamMatch(FS1,FS2,d1.Strings[I] + ' does not match');
         finally
           FS1.Free;
           FS2.Free;
         end;
       end;
    end;
 finally
   d1.free;
   d2.free;
 end;
end;

procedure TabTestCase.CheckFileExists(aFileName: String);
begin
 Check(FileExists(aFileName), 'Unable to Locate: '+ aFileName);
end;

procedure TabTestCase.CheckStreamMatch(aStream1, aStream2: TStream;
  Msg: String);
var
 I : Integer;
 b1,b2 : Byte;
begin
 aStream1.Seek(0,soFromBeginning);
 aStream2.Seek(0,soFromBeginning);
 if aStream1.Size <> aStream2.Size then
    Fail(Msg,CallerAddr);
 for I := 0 to aStream1.Size -1 do
   begin
     aStream1.Read(b1,1);
     aStream2.Read(b2,1);
     if (b1 <> b2) then
       Fail(Msg,CallerAddr);
   end;
end;

procedure TabTestCase.CreateDummyFile(aFileName: string; aSize: Integer);
var
 fs : TFileStream;
 bf : pointer;
begin
 fs := TFileStream.Create(aFileName,fmCreate);
 try
  GetMem(bf,aSize+1);
    try
     // Fill with dummy data might be better in the future to fill less compressable
     // data.
     FillChar(bf^,aSize,26);
     Fs.Write(bf^,aSize);
     finally
     FreeMem(bf,aSize+1);
     end;
 finally
  FS.Free;
 end;
end;

function TabTestCase.DelTree(Dir: String): Boolean;
//NOTE if returns false part of the directory may be gone while others parts still exist.
//Written by: Robert Love
var
 SR : TSearchRec;
 SDir : String;
 // Uses Temp Variables as FindFirst/FindNext Leave files Locked
 DirList : TStringList;
 FileList : TStringList;
 I : Integer;
begin
// Change to Exception Based, instead result based
 result := TRUE;
 // Force Slash
 if Dir[Length(Dir)] <> '\' then
   Dir := Dir + '\';
 // Set Wildcards
 SDir := Dir + '*.*';

 // If a File is found
 if  FindFirst(SDir,faAnyFile,SR)  = 0 then
   begin
     DirList := TStringList.create;
     FileList := TStringList.create;
     try

      if (SR.Attr and faDirectory > 0) then
         begin
          if (SR.Name <> '.') and (SR.Name <> '..') then
            DirList.Add(Dir + SR.Name)
         end
        else FileList.Add(Dir + SR.Name);

      while FindNext(SR) = 0 do
       begin
        if (SR.Attr and faDirectory > 0) then
           begin
            if (SR.Name <> '.') and (SR.Name <> '..') then
              DirList.Add(Dir + SR.Name)
           end
         else FileList.Add(Dir + SR.Name);
      end; { While files found }
       // Close Search to Free Locks on Files/Directories
      FindClose(SR);
      // Delete All Files in Directory
      For I := 0 to FileList.Count -1 do
       begin
        result := DeleteFile(FileList.Strings[I]);
        if not result then
          raise exception.Create('Unable to Delete the following File: ' + FileList.Strings[I]);
//        if not result then Exit;
       end;
      // Recursivly call DelTree to Get rid of SubDirectories
      For I := 0 to DirList.Count -1 do
        begin
         result := DelTree(DirList.Strings[I]);
         if not result then Exit;
        end;
      //Finally Remove the Directory
      result := RemoveDir(Dir);
      if not result then
        raise exception.Create('Unable to Remove the following Directory: ' + Dir);

     finally
       DirList.free;
       FileList.free;
     end;
   end; { If File Found with FindFirst }
end;
{$IFDEF WINZIPTESTS}
procedure TabTestCase.ExecuteAndWait(ExeName, Param: String;TimeOut : Integer);
var
  Spawn : TStSpawnApplication;
  WR    : TWaitResult;
begin
   // Make sure Application trying to execute is found
   CheckFileExists(ExeName);
   Spawn := TStSpawnApplication.Create(nil);
   try
     Spawn.FileName := ExeName;
     Spawn.RunParameters := Param;
     Spawn.NotifyWhenDone := True;
     Spawn.TimeOut := TimeOut;
     Spawn.OnSpawnError := SpawnErrorEvent;
     Spawn.OnCompleted := SpawnCompletedEvent;
     Spawn.OnTimeOut := SpawnTimeOutEvent;
     Spawn.Execute;
     WR := FSpawnComplete.WaitFor(1000);
     While WR <> wrSignaled do
       begin
          Application.ProcessMessages;
          Check(NOT (WR = wrAbandoned), 'Event has been Abandoonded');
          Check(NOT (WR = wrError),'Event has Errored out');
          WR := FSpawnComplete.WaitFor(1000);
       end;
   finally
      Spawn.Free;
   end;
end;
{$ENDIF}

procedure TabTestCase.FilesInDirectory(const aDir: String;
  FileList: TStringList);
var
 SR : TSearchRec;
begin
 Check(FileList <> nil,'FileList is not assigned');
 Check(DirExists(aDir),'Directory Requested does not exist : '+ aDir);
 FileList.Clear;
 if FindFirst(AbAddBackSlash(aDir)+'*.*',faAnyFile,SR) = 0 then
  begin
    repeat
      if not (SR.Attr and faDirectory > 0) then // Don't include Sub directories
        FileList.Add(SR.Name);
    until FindNext(SR) <> 0;
  end;
  FindClose(SR);
end;

function TabTestCase.GetTestFileDir: string;
begin
// May want to place in ini file in the future but this will do for now
{$IFDEF LINUX}
// I don't think this will work with linux so may need to change
 result := ExtractFilePath(ParamStr(0)) + 'testfiles/';
{$ELSE}
 result := ExtractFilePath(ParamStr(0)) + 'testfiles\';
{$ENDIF}
end;

function TabTestCase.GetTestTempDir: string;
begin
  {$IFDEF LINUX}
    result := GetTestFileDir + 'temp/';
  {$ELSE}
    result := GetTestFileDir + 'temp\';
  {$ENDIF}
end;

function TabTestCase.GetWindowsDir: string;
var
 aDirBuf : Array[0..MAX_PATH] of Char;
begin
// Windows Directory is used to find
 {$IFDEF LINUX}
   result := '/etc/
 {$ELSE}
   GetWindowsDirectory(aDirBuf,SizeOf(aDirBuf));
   result := AbAddBackSlash(string(aDirBuf));
 {$ENDIF}
end;

procedure TabTestCase.Setup;
begin
  inherited;
  if not DirExists(TestTempDir) then
   begin
    CreateDir(TestTempDir);
   end;
  {$IFDEF WINZIPTESTS}
    FSpawnComplete := TSimpleEvent.Create;
  {$ENDIF}
end;

{$IFDEF WINZIPTESTS}
procedure TabTestCase.SpawnCompletedEvent(Sender: TObject);
begin
  FSpawnComplete.SetEvent;
end;

procedure TabTestCase.SpawnErrorEvent(Sender: TObject; Error: Word);
begin
 FSpawnComplete.SetEvent;
 Fail('Error: ' + IntToSTr(Error) + ' occured launching WinZip');
end;

procedure TabTestCase.SpawnTimeOutEvent(Sender: TObject);
begin
 FSpawnComplete.SetEvent;
 Fail('Timeout occured launching WinZip');
end;
{$ENDIF}

procedure TabTestCase.Teardown;
begin
  inherited;
  {$IFDEF WINZIPTESTS}
    FSpawnComplete.Free;
  {$ENDIF}
end;

{ TabCompTestCase }

procedure TabCompTestCase.SetUp;
begin
  inherited;
  FTestForm := TForm.Create(nil);
  IgnoreProp := TStringList.create;
end;

procedure TabCompTestCase.ShowForm;
begin
  FTestForm.ShowModal;
end;

function TabCompTestCase.StreamComponent(aComp: TComponent): String;
// The Following was cut and paste out of the Delphi Help File.
var
  BinStream:TMemoryStream;
  StrStream: TStringStream;
  s: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(s);
    try
      BinStream.WriteComponent(aComp);
      BinStream.Seek(0, soFromBeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, soFromBeginning);
      Result:= StrStream.DataString;
    finally
      StrStream.Free;
    end;
  finally
    BinStream.Free
  end;
end;

procedure TabCompTestCase.TearDown;
begin
  IgnoreProp.free;
  FTestForm.Release; // This allows Message Handling to finish
  inherited;
end;


procedure TabCompTestCase.CompareComponentProps(aComp1,aComp2 : TPersistent);
var
 PList1   : PPropList;
 PI1,PI2  : PPropInfo;
 PListCnt1 : Integer;
 PList2   : PPropList;
 PListCnt2 : Integer;
 I : Integer;
 SubComp1,SubComp2 : TObject;
begin
//NOTE: I wrote the following in Delphi 7.   I have had reports that this won't
//      compile in Delphi 5 (Which I don't have access too)    Anyway this could
//      be rewritten to work with Delphi 5 if someone wants to.

  // Check all published properties to see if same.
  PListCnt1 := AbGetPropList(PTypeInfo(aComp1.ClassInfo),PList1);
  PListCnt2 := AbGetPropList(PTypeInfo(aComp2.ClassInfo),PList2);
  // The following should not fail but it here just in case!
  Check(PListCnt1 = PListCnt2,aComp1.ClassName + ' Streaming is really Screwed up!');
  For I := 0 to PListCnt1 -1 do
   begin
     if IgnoreProp.IndexOf(PList1^[I]^.Name) = -1 then
      begin
         if not(PList1^[I]^.PropType^.Kind = tkClass) then
           Check(AbGetPropValue(aComp1,PList1^[I]^.Name) = AbGetPropValue(aComp2,PList2^[I]^.Name), 'Stream Problem with ' +aComp1.ClassName + '.' + PList2^[I]^.Name)
         else
           begin
              PI1 := GetPropInfo(aComp1.ClassInfo,PList1^[I]^.Name);
              if Assigned(PI1) then
                SubComp1 := TObject(GetOrdProp(aComp1,PI1))
              else
                SubComp1 := nil;
              PI2 := GetPropInfo(aComp2.ClassInfo,PList1^[I]^.Name);
              if Assigned(PI2) then
                   SubComp2 := TObject(GetOrdProp(aComp2,PI2))
                else
                   SubComp2 := nil;
              Check((Assigned(SubComp1) and Assigned(SubComp2)) or ((not Assigned(SubComp1)) and (Not Assigned(SubComp1))),'Stream Problem with ' +aComp1.ClassName + '.' + PList2^[I]^.Name);
              if Assigned(SubComp1) and (SubComp1 is TPersistent) and (SubComp1 is TPersistent) then
              CompareComponentProps(SubComp1 as TPersistent, SubComp2 as TPersistent);
           end;
      end;
   end;

end;

function TabCompTestCase.UnStreamComponent(aCompStr: String;Instance : TComponent): TComponent;
// The Following was Cut and Paste from the Delphi Help file
var
  StrStream:TStringStream;
  BinStream: TMemoryStream;
  ErrStream  : TFileStream; 
//  CReader : TReader;
begin
  result := nil;
  StrStream := TStringStream.Create(aCompStr);
  try
    BinStream := TMemoryStream.Create;
    try
      try
      ObjectTextToBinary(StrStream, BinStream);
      except
        on E : EParserError do
          begin
             ErrStream := TFileStream.Create('parse.err',fmCreate);
             StrStream.Seek(0,soFromBeginning);
             ErrStream.CopyFrom(StrStream,StrStream.Size);
             ErrStream.Free;	
             Fail('Check parse.err ' + E.Message,nil);
             raise;
          end
          else Raise;
      end;
      BinStream.Seek(0, soFromBeginning);
      result := BinStream.ReadComponent(Instance);
    finally
      BinStream.Free;
    end;
  finally
    StrStream.Free;
  end;
end;


function TabCompTestCase.AbGetPropList(TypeInfo: PTypeInfo;
  out PropList: PPropList): Integer;
begin
  Result := GetTypeData(TypeInfo)^.PropCount;
  if Result > 0 then
  begin
    GetMem(PropList, Result * SizeOf(Pointer));
    GetPropInfos(TypeInfo, PropList);
  end;
end;

function TabCompTestCase.AbGetPropValue(Instance: TObject;
  const PropName: string; PreferStrings: Boolean): Variant;
var
  PropInfo: PPropInfo;
  S: TIntegerSet;
  TInfo: PTypeInfo;
  I: Integer;
begin
  // assume failure
  Result := Null;

  // get the prop info
  PropInfo := GetPropInfo(Instance.ClassInfo, PropName);
  if PropInfo = nil then
    Raise Exception.Create('Property "' + PropName + '" was not found.')
  else
  begin
    // return the right type
    case PropInfo^.PropType^^.Kind of
      tkInteger, tkChar, tkWChar, tkClass:
        Result := GetOrdProp(Instance, PropInfo);
      tkEnumeration:
        if PreferStrings then
          Result := GetEnumName(PropInfo^.PropType^, GetOrdProp(Instance, PropInfo))
        else if GetTypeData(PropInfo^.PropType^)^.BaseType^ = TypeInfo(Boolean) then
          Result := Boolean(GetOrdProp(Instance, PropInfo))
        else
          Result := GetOrdProp(Instance, PropInfo);
      tkSet:
        if PreferStrings then
          begin
            Result := '';
            Integer(S) := GetOrdProp(Instance, PropInfo);
            TInfo := GetTypeData(PropInfo^.PropType^)^.CompType^;
            for I := 0 to SizeOf(Integer) * 8 - 1 do
            if I in S then
            begin
              if Result <> '' then
                Result := Result + ',';
              Result := Result + GetEnumName(TInfo, I);
            end;
          end
        else
          Result := GetOrdProp(Instance, PropInfo);
      tkFloat:
        Result := GetFloatProp(Instance, PropInfo);
      tkMethod:
        Result := PropInfo^.PropType^.Name;
      tkString, tkLString:
        Result := GetStrProp(Instance, PropInfo);
      tkWString:
       {$IFDEF VERSION6}
        Result := GetWideStrProp(Instance, PropInfo);
       {$ELSE}
        Result := ''; //No simple way to get this in Prior Delphi versions... and we don't use WideStrings (yet)
       {$ENDIF}
      tkVariant:
        Result := GetVariantProp(Instance, PropInfo);
      tkInt64:
          {$IFDEF VERSION6}
             Result := GetInt64Prop(Instance, PropInfo);
          {$ELSE}
             Result := '';
          {$ENDIF}
          tkDynArray:
                DynArrayToVariant(Result, Pointer(GetOrdProp(Instance, PropInfo)), PropInfo^.PropType^);
    else
      raise Exception.Create('Invalid Property Type: ' + PropInfo.PropType^^.Name);
    end;
  end;
end;

end.
 