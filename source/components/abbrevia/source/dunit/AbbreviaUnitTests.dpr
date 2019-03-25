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
 * The Initial Developer of the Original Code is * Robert Love
 *
 * Portions created by the Initial Developer are Copyright (C) 1997-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

{$I AbDefine.inc}

// Uncomment the following directive to create a console application
// or leave commented to create a GUI application...
// Currently Abbrevia's Floppy Span Tests don't work will with console testing.

{.$APPTYPE CONSOLE}

program AbbreviaUnitTests;


uses
  TestFramework {$IFDEF LINUX},
  QForms,
  QGUITestRunner {$ELSE},
  Forms,
  GUITestRunner {$ENDIF},
  TextTestRunner,
  AbFloppySpanTests in 'AbFloppySpanTests.pas',
  AbCabViewTests in 'AbCabViewTests.pas',
  AbCBrowsTests in 'AbCBrowsTests.pas',
  AbCabExtTests in 'AbCabExtTests.pas',
  AbCabMakTests in 'AbCabMakTests.pas',
  AbCabKitTests in 'AbCabKitTests.pas',
  AbUnzPrcTests in 'AbUnzPrcTests.pas',
  AbZipPrcTests in 'AbZipPrcTests.pas',
  abTestFramework in 'abTestFramework.pas',
  abTestConsts in 'abTestConsts.pas',
  AbUnzperTests in 'AbUnzperTests.pas',
  AbZipperTests in 'AbZipperTests.pas',
  AbZipKitTests in 'AbZipKitTests.pas',
  AbZipViewTests in 'AbZipViewTests.pas',
  AbZipOutTests in 'AbZipOutTests.pas',
  AbZBrowsTests in 'AbZBrowsTests.pas',
  AbMeterTests in 'AbMeterTests.pas',
  AbSelfExTests in 'AbSelfExTests.pas',
  AbArchiveSplitTests in 'AbArchiveSplitTests.pas';

{$R *.RES}

begin
  Application.Initialize;

{$IFDEF LINUX}
  QGUITestRunner.RunRegisteredTests;
{$ELSE}
  if System.IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
{$ENDIF}

end.

