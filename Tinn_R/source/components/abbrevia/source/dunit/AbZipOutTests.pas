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

unit AbZipOutTests;
{$I AbDefine.inc}
interface

uses
  TestFrameWork,abTestFrameWork,AbZipOut,AbZBrows,SysUtils,Classes,Menus,abMeter;

type

  TAbZipOutlineTests = class(TabCompTestCase)
  private
    Component : TAbZipOutline;
  protected
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDefaultStreaming;
    procedure TestComponentLinks;
  end;

implementation

{ TAbZipOutlineTests }

procedure TAbZipOutlineTests.SetUp;
begin
  inherited;
  Component := TAbZipOutline.Create(TestForm);
  Component.Parent := TestForm;
end;

procedure TAbZipOutlineTests.TearDown;
begin
  inherited;

end;

procedure TAbZipOutlineTests.TestComponentLinks;
var
  Menu : TPopupMenu;
  MLink1,MLink2 : TAbMeter;
begin
  MLink1 := TAbMeter.Create(TestForm);
  MLink2 := TAbMeter.Create(TestForm);
  Menu := TPopupMenu.Create(TestForm);
  Component.ArchiveProgressMeter := MLink1;
  Component.ItemProgressMeter := MLink2;  
  Component.PopupMenu := Menu;
  Menu.Free;
  MLink1.Free;
  MLink2.Free;
  Check(Component.PopupMenu = nil,'Notification does not work for TAbZipOutline.PopupMenu');
  Check(Component.ArchiveProgressMeter = nil,'Notification does not work for TAbZipOutline.ArchiveProgressMeter');
  Check(Component.ItemProgressMeter = nil,'Notification does not work for TAbZipOutline.ItemProgressMeter');

end;

procedure TAbZipOutlineTests.TestDefaultStreaming;
var
CompStr : STring;
CompTest : TAbZipOutline;
begin
// Zip Outline needs a parent to stream correctly...  So I parent both to the same
// Form but because of that we need to ignore Name, and TabOrder Comparision
  RegisterClass(TAbZipOutline);
  RegisterClass(TAbZipDisplayOutline);
  CompStr  := StreamComponent(Component);
  CompTest := TAbZipOutline.Create(TestForm);
  CompTest.Parent := TestForm;
  CompTest := (UnStreamComponent(CompStr,CompTest) as TAbZipOutline);
  IgnoreProp.Add('Name');
  IgnoreProp.Add('TabOrder');  
  CompareComponentProps(Component,CompTest);
  UnRegisterClass(TAbZipOutline);
  UnRegisterClass(TAbZipDisplayOutline);  
end;

initialization

  TestFramework.RegisterTest('Abbrevia.Component Level Test Suite',
    TAbZipOutlineTests.Suite);
 
end.

 