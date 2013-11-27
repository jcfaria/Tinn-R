
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
unit AbMeterTests;
{$I AbDefine.inc}
interface

uses
  SysUtils,classes,AbTestFrameWork,TestFrameWork,abMeter;

type

  TAbMeterTests = class(TabCompTestCase)
  private
    Component : TAbMeter;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
  end;

  TAbVCLMeterLinkTests = class(TabCompTestCase)
  private
    Component : TAbVCLMeterLink;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;
  end;

implementation

{ TAbMeterTests }

procedure TAbMeterTests.SetUp;
begin
  inherited;
  Component := TabMeter.create(TestForm);
end;

procedure TAbMeterTests.TearDown;
begin
  inherited;

end;


procedure TAbMeterTests.TestDefaultStreaming;
var
  CompStr : String;
  CompTest : TAbMeter;
begin
  RegisterClass(TAbMeter);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbMeter);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbMeter);
end;

{ TAbMeterLinkTests }


{ TAbVCLMeterLinkTests }

procedure TAbVCLMeterLinkTests.SetUp;
begin
  inherited;
  Component :=  TAbVCLMeterLink.Create(TestForm);
end;

procedure TAbVCLMeterLinkTests.TearDown;
begin
  inherited;

end;

procedure TAbVCLMeterLinkTests.TestComponentLinks;
var
  Meter: TAbMeter;
begin
  Meter := TAbMeter.Create(TestForm);
  Component.Meter := Meter;
  Meter.Free;
  Check(Component.Meter = nil,'Notification does not work for TAbMeter.Meter');
end;

procedure TAbVCLMeterLinkTests.TestDefaultStreaming;
var
  CompStr : String;
  CompTest : TAbVCLMeterLink;
begin
  RegisterClass(TAbVCLMeterLink);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbVCLMeterLink);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbVCLMeterLink);
end;

initialization

  TestFramework.RegisterTests('Abbrevia.Component Level Test Suite',
    [TAbMeterTests.Suite,TAbVCLMeterLinkTests.Suite]);

end.

 