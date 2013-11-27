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

unit AbCabMakTests;
{$I AbDefine.inc}
interface

uses
  SysUtils, Classes, abTestFrameWork, TestFrameWork,AbCabMak,abMeter;

type

  TAbCabMakTests = class(TabCompTestCase)
  private
    Component : TAbMakeCab;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;

  end;

implementation

{ TAbCabMakTests }

procedure TAbCabMakTests.SetUp;
begin
  inherited;
  Component := TAbMakeCab.Create(TestForm);
end;

procedure TAbCabMakTests.TearDown;
begin
  inherited;

end;

procedure TAbCabMakTests.TestComponentLinks;
var
  MLink1,MLink2 : TAbVCLMeterLink;
begin
  MLink1 := TAbVCLMeterLink.Create(TestForm);
  MLink2 := TAbVCLMeterLink.Create(TestForm);  
  Component.ArchiveProgressMeter := MLink1;
  Component.ItemProgressMeter := MLink2;
  MLink1.Free;
  MLink2.Free;
  Check(Component.ArchiveProgressMeter = nil,'Notification does not work for TAbMakeCab.ArchiveProgressMeter');
  Check(Component.ItemProgressMeter = nil,'Notification does not work for TAbMakeCab.ItemProgressMeter');
end;

procedure TAbCabMakTests.TestDefaultStreaming;
var
  CompStr : String;
  CompTest : TAbMakeCab;
begin
  RegisterClass(TAbMakeCab);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbMakeCab);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbMakeCab);
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbCabMakTests.Suite);
 
end.

 