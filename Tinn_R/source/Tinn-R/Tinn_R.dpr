(*
 Tinn is a ASCII file editor primarily intended as a better replacement
 of the default Notepad.exe under Windows.

 This software is distributed under the terms of the GNU General
 Public License, either Version 2, June 1991 or Version 3, June 2007.
 The terms of version 2 and of the license are in a folder called
 doc (licence_gpl2.txt and licence_gpl2.txt)
 which you should have received with this software.

 See http://www.opensource.org/licenses/gpl-license.html or
 http://www.fsf.org/copyleft/gpl.html for further information.

 Copyright
  Russell May - http://www.solarvoid.com

 Tinn-R is an extension of Tinn that provides additional tools to control R
 (http://cran.r-project.org). The project is coordened by José Cláudio Faria
 (joseclaudio.faria@gmail.com).

 As such, Tinn-R is a feature-rich replacement of the basic script editor
 provided with Rgui. It provides syntax-highlighting, submission of code in
 whole, or line-by-line, and many other useful tools to ease writting and
 debugging of R code.

 Copyright
  Tinn-R team October/2005
  Tinn-R team October/2013

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 and 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

program Tinn_R;

uses
  Forms,
  Windows,
  SysUtils,
  Messages,
  Dialogs,
  classes,
  codeEditor in 'codeEditor.pas',
  diffUnit in 'diffUnit.pas',
  dirWatch in 'dirWatch.pas',
  fileView in 'fileView.pas' {frmFilesFrame: TFrame},
  findReplace in 'findReplace.pas',
  folderView in 'folderView.pas' {frmFoldersFrame: TFrame},
  hashUnit in 'hashUnit.pas',
  searches in 'searches.pas',
  trCodeSender in 'trCodeSender.pas',
  trRHistory in 'trRHistory.pas',
  trUtils in 'trUtils.pas',
  udmSyn in 'udmSyn.pas' {dmSyn: TDataModule},
  ufrmAbout in 'ufrmAbout.pas' {frmAbout},
  ufrmAppOptions in 'ufrmAppOptions.pas' {frmAppOptions},
  ufrmColors in 'ufrmColors.pas' {frmColors},
  ufrmConfigurePrint in 'ufrmConfigurePrint.pas' {frmConfigurePrint},
  ufrmConfirmReplace in 'ufrmConfirmReplace.pas' {frmConfirmReplaceDialog},
  ufrmCount in 'ufrmCount.pas' {frmCount},
  ufrmEditor in 'ufrmEditor.pas' {frmEditor},
  ufrmGotoBox in 'ufrmGotoBox.pas' {frmGotoBox},
  ufrmGroupRename in 'ufrmGroupRename.pas' {frmGroupRename},
  ufrmHotKeys in 'ufrmHotKeys.pas' {frmHotKeys},
  ufrmLatexDimensional in 'ufrmLatexDimensional.pas' {frmLatexDimensional},
  ufrmMain in 'ufrmMain.pas' {frmTinnMain},
  ufrmNewGoup in 'ufrmNewGoup.pas' {frmNewGroup},
  ufrmPandoc in 'ufrmPandoc.pas' {frmPandoc},
  ufrmPrintPreview in 'ufrmPrintPreview.pas' {frmPrintPreview},
  ufrmRcard in 'ufrmRcard.pas' {frmRcard},
  ufrmReplaceText in 'ufrmReplaceText.pas' {frmReplaceDialog},
  ufrmRServer in 'ufrmRServer.pas' {frmRServer},
  ufrmRterm in 'ufrmRterm.pas' {frmRterm},
  ufrmSearchInFiles in 'ufrmSearchInFiles.pas' {frmSearchInFiles},
  ufrmSearchText in 'ufrmSearchText.pas' {frmSearchDialog},
  ufrmShortcuts in 'ufrmShortcuts.pas' {frmShortcuts},
  ufrmSplash in 'ufrmSplash.pas' {frmSplash},
  ufrmTools in 'ufrmTools.pas' {frmTools},
  uModDados in 'uModDados.pas' {modDados: TDataModule},
  ufrmDiffMain in '..\diff\ufrmDiffMain.pas' {frmDiffMain},
  sndkey32 in '..\others\sndkey32.pas',
  uActionMacro in '..\others\uActionMacro.pas',
  ufrmAsciiChart in '..\others\ufrmAsciiChart.pas' {frmAsciiChart},
  SynEditPrintPreview in '..\SynEdit_adapted\SynEditPrintPreview.pas',
  SynEditStrConst in '..\SynEdit_adapted\SynEditStrConst.pas',
  SynCompletionProposal in '..\SynEdit_adapted\SynCompletionProposal.pas',
  SynHighlighterAll in '..\SynEdit_highlighters\SynHighlighterAll.pas',
  SynHighlighterR in '..\SynEdit_highlighters\SynHighlighterR.pas',
  SynHighlighterR_term in '..\SynEdit_highlighters\SynHighlighterR_term.pas',
  SynHighlighterTeX in '..\SynEdit_highlighters\SynHighlighterTeX.pas',
  SynHighlighterText in '..\SynEdit_highlighters\SynHighlighterText.pas',
  SynHighlighterText_term in '..\SynEdit_highlighters\SynHighlighterText_term.pas',
  SynHighlighterURI in '..\SynEdit_highlighters\SynHighlighterURI.pas',
  ufrmComments in 'ufrmComments.pas' {frmComments},
  ufrmCompletion in 'ufrmCompletion.pas' {frmCompletion},
  ufrmRmirrors in 'ufrmRmirrors.pas' {frmRmirrors},
  SynEditOC in '..\SynEdit_adapted\SynEditOC.pas';

{$R Tinn_R.KLR}
{$R *.RES}

var
  hPrevious, hMutex: HWnd;
  slFilesStarting  : TStringList;
  i                : integer;
  cTemp            : PChar;
  sTemp            : string;

{This code, to allow file association and open clicked files in the running
 instance of app was written by Andrius Adamonis}
function EnumWindowsCallback(hHandle: HWnd; lpParam: LParam): Boolean; Stdcall;

  function IsMyClass: Boolean;
  var
    aClassName: array[0..30] of Char;

  begin
    GetClassName(hHandle, aClassName, 30);
    Result:= (StrIComp(aClassName, 'TfrmTinnMain') = 0) and
             (SendMessage(hHandle, WM_FINDINSTANCE, 0, 0) = MyUniqueConst);
  end;

begin
  Result:= not IsMyClass; // Needs True to continue
  if not Result then hPrevious:= hHandle;
end;

procedure FillFileList(slFile: TStringList);
var
  i, iPos : integer;
  hHandle : THandle;
  curFile : WIN32_FIND_DATA;
  sPath   : string;

begin
  for i:= 1 to ParamCount do begin // Loop through all the parameters and build a file list
    iPos:= pos('*', ParamStr(i));
    if (iPos > 0) then begin // Do multi file globbing
      sPath  := ExtractFilePath(ExpandFileName(ParamStr(i)));
      hHandle:= FindFirstFile(PChar(ParamStr(i)), curFile);
      if FileExists(sPath + curFile.cFilename) then slFile.Add('"' + sPath + curFile.cFilename + '"');
      while FindNextFile(hHandle, curFile) do
        if FileExists(sPath + curFile.cFilename) then slFile.Add('"' + sPath + curFile.cFilename + '"');
    end // End globbing
    else begin	// Do single file open
      if FileExists(ParamStr(i)) then begin // Check for file
        if (i < ParamCount) then iPos:= pos('lin=', ParamStr(i + 1))// Check for line number
                            else iPos:= -1;
        if (iPos > 0) then slFile.Add('"' + ExpandFileName(ParamStr(i)) + '"' + ',' + Copy(ParamStr(i+1), iPos + 3, length(ParamStr(i+1))))
                      else slFile.Add('"' + ExpandFileName(ParamStr(i)) + '"');
      end
      else begin // Create a new file
        // Check for the line request
        iPos:= pos('lin=', ParamStr(i));
        if (iPos = 0) then begin
          sPath:= ExtractFilePath(ExpandFileName(ParamStr(i)));
          // if the path isn't already in the file name, add it
          if (Pos(sPath, ParamStr(i)) = 0) then slFile.Add('"' + sPath + ParamStr(i) + '"')
                                           else slFile.Add('"' + ParamStr(i) + '"');
        end;
      end;
    end; // End single file open
  end; // End param loop
end;

procedure SendString(sToSend: string);
var
  copyDataStruct: TCopyDataStruct;

begin
  copyDataStruct.dwData:= 0; //Use it to identify the message contents
  //copyDataStruct.cbData:= 1 + Length(sToSend);
  copyDataStruct.cbData:= (length(sToSend) + 1) * sizeof(char); //Radoslaw Bujak
  copyDataStruct.lpData:= PChar(sToSend);
  SendMessage(hPrevious, WM_COPYDATA, Integer(hPrevious), Integer(@copyDataStruct));
end;

begin
  slFilesStarting:= TStringList.Create;
  hPrevious:= 0;
  EnumWindows(@EnumWindowsCallback, 0);

  // The condition below avoid multiples instances of Tinn-R!
  // If Tinn-R IS RUNNIG and the user select more than one
  // associated file from win_explorer.
  //PS: NOT CHANGE THIS PLACE
  if (hPrevious <> 0) then begin
    SetForegroundWindow(hPrevious);
    PostMessage(hPrevious, WM_RESTOREAPP, 0, 0);
    if (ParamCount > 0) then begin
      FillFileList(slFilesStarting);
      if (slFilesStarting.Count > 0) then begin
        for i:= 0 to (slFilesStarting.Count - 1) do
          SendString(slFilesStarting.Strings[i]);
      end;
    end;
    Exit;
  end;

  // The condition below avoid multiples instances of Tinn-R!
  // If Tinn-R IS NOT RUNNIG and the user select more than one
  // associated file from win_explorer, it will open one.
  //PS: NOT CHANGE THIS PLACE
  hMutex:= CreateMutex(nil, True, 'Tinn-R');
  if (GetLastError <> 0) then begin
    CloseHandle(hMutex);
    Exit;
  end;

  frmSplash:= TfrmSplash.Create(Application);
  frmSplash.Show;
  Application.Initialize;

  Application.Title   := 'Tinn-R';
  Application.HelpFile:= '';
  Application.CreateForm(TfrmTinnMain, frmTinnMain);
  if (ParamCount > 0) then FillFileList(slFilesStarting);
  if (slFilesStarting.Count > 0) then begin
    dmSyn.boolLoadedFileFromStartUp:= True;
    cTemp:= PChar(slFilesStarting.Strings[0]);
    sTemp:= AnsiExtractQuotedStr(cTemp, '"');
    frmTinnMain.CheckIfFileFromDVI(sTemp);
  end;
  FreeAndNil(slFilesStarting);
  frmSplash.Hide;
  frmSplash.Free;
  Application.Run;
end.
