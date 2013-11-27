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

unit AbCabKitTests;
{$I AbDefine.inc}
interface

uses
  SysUtils, Classes, abTestFrameWork, TestFrameWork,AbCabKit,abMeter;

type

  TAbCabKitTests = class(TabCompTestCase)
  private
    Component : TAbCabKit;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;

  end;

implementation

{ TAbCabKitTests }

procedure TAbCabKitTests.SetUp;
begin
  inherited;
  Component := TAbCabKit.Create(TestForm);
end;

procedure TAbCabKitTests.TearDown;
begin
  inherited;

end;

procedure TAbCabKitTests.TestComponentLinks;
var
  MLink1,MLink2 : TAbVCLMeterLink;
begin
  MLink1 := TAbVCLMeterLink.Create(TestForm);
  MLink2 := TAbVCLMeterLink.Create(TestForm);  
  Component.ArchiveProgressMeter := MLink1;
  Component.ItemProgressMeter := MLink2;
  MLink1.Free;
  MLink2.Free;
  Check(Component.ArchiveProgressMeter = nil,'Notification does not work for TAbCabKit.ArchiveProgressMeter');
  Check(Component.ItemProgressMeter = nil,'Notification does not work for TAbCabKit.ItemProgressMeter');
end;

procedure TAbCabKitTests.TestDefaultStreaming;
var
  CompStr : String;
  CompTest : TAbCabKit;
begin
  RegisterClass(TAbCabKit);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbCabKit);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbCabKit);
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbCabKitTests.Suite);
 
end.

 