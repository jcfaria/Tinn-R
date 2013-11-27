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

unit AbZipViewTests;
{$I AbDefine.inc}
interface

uses
  TestFrameWork,abTestFrameWork,AbZView,AbZBrows,SysUtils,Classes,Menus,abMeter;

type

  TAbZipViewTests = class(TabCompTestCase)
  private
    Component : TAbZipView;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;
  end;

implementation

{ TAbZipViewTests }

procedure TAbZipViewTests.SetUp;
begin
  inherited;
  Component := TAbZipView.Create(TestForm);
end;

procedure TAbZipViewTests.TearDown;
begin
  inherited;

end;

procedure TAbZipViewTests.TestComponentLinks;
var
  Menu : TPopupMenu;
  ZipBrow : TAbZipBrowser;
begin
  Menu := TPopupMenu.Create(TestForm);
  ZipBrow := TAbZipBrowser.Create(TestForm);  
  Component.PopupMenu := Menu;
  Component.ZipComponent := ZipBrow;
  Menu.Free;
  ZipBrow.Free;
  Check(Component.PopupMenu = nil,'Notification does not work for TAbZipView.PopupMenu');
  Check(Component.ZipComponent = nil,'Notification does not work for TAbZipView.ZipComponent');

end;

procedure TAbZipViewTests.TestDefaultStreaming;
var
CompStr : STring;
CompTest : TAbZipView;
begin
  RegisterClass(TAbZipView);
  CompStr  := StreamComponent(Component);
  CompTest := (UnStreamComponent(CompStr) as TAbZipView);
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbZipView);
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbZipViewTests.Suite);
 
end.

 