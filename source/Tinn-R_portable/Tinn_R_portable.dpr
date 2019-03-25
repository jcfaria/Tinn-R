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
 (http://cran.r-project.org). The project is coordened by Jos� Cl�udio Faria
 (joseclaudio.faria@gmail.com).

 As such, Tinn-R is a feature-rich replacement of the basic script editor
 provided with Rgui. It provides syntax-highlighting, submission of code in
 whole, or line-by-line, and many other useful tools to ease writting and
 debugging of R code.

 Copyright
  Tinn-R team - http://nbcgib.uesc.br/lec/software/editores/tinn-r/en

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

 ************************************************
 *** UDV is a good way to a more happier life ***
 ************************************************
*)

program Tinn_R_portable;

uses
  Forms,
  Windows,
  SysUtils,
  Messages,
  Dialogs,
  classes,
  ATxCodepages in '..\thirdy\ATxCodepages.pas',
  clMultiStream in '..\thirdy\clMultiStream.pas',
  codeEditor in '..\thirdy\codeEditor.pas',
  diffUnit in '..\thirdy\diffUnit.pas',
  dirWatch in '..\thirdy\dirWatch.pas',
  fileView in '..\thirdy\fileView.pas',
  findReplace in '..\thirdy\findReplace.pas',
  folderView in '..\thirdy\folderView.pas',
  hashUnit in '..\thirdy\hashUnit.pas',
  searches in '..\thirdy\searches.pas',
  sndkey32 in '..\thirdy\sndkey32.pas',
  Split in '..\thirdy\Split.pas',
  uActionMacro in '..\thirdy\uActionMacro.pas',
  ufrmAsciiChart in '..\thirdy\ufrmAsciiChart.pas',
  ufrmDiffMain in '..\diff\ufrmDiffMain.pas',
  SynCompletionProposal in '..\SynEdit_adapted\SynCompletionProposal.pas',
  SynEditOC in '..\SynEdit_adapted\SynEditOC.pas',
  SynEditPrintPreview in '..\SynEdit_adapted\SynEditPrintPreview.pas',
  SynEditStrConst in '..\SynEdit_adapted\SynEditStrConst.pas',
  SynHighlighterAll in '..\SynEdit_highlighters\SynHighlighterAll.pas',
  SynHighlighterR in '..\SynEdit_highlighters\SynHighlighterR.pas',
  SynHighlighterR_term in '..\SynEdit_highlighters\SynHighlighterR_term.pas',
  SynHighlighterTeX in '..\SynEdit_highlighters\SynHighlighterTeX.pas',
  SynHighlighterText in '..\SynEdit_highlighters\SynHighlighterText.pas',
  SynHighlighterText_term in '..\SynEdit_highlighters\SynHighlighterText_term.pas',
  SynHighlighterURI in '..\SynEdit_highlighters\SynHighlighterURI.pas',
  trCodeSender in '..\Tinn-R\trCodeSender.pas',
  trRHistory in '..\Tinn-R\trRHistory.pas',
  trRutils in '..\Tinn-R\trRutils.pas',
  trSendSmart in '..\Tinn-R\trSendSmart.pas',
  trSynUtils in '..\Tinn-R\trSynUtils.pas',
  trUtils in '..\Tinn-R\trUtils.pas',
  udmSyn in '..\Tinn-R\udmSyn.pas',
  ufrmAbout in '..\Tinn-R\ufrmAbout.pas',
  ufrmAppOptions in '..\Tinn-R\ufrmAppOptions.pas',
  ufrmColors in '..\Tinn-R\ufrmColors.pas',
  ufrmComments in '..\Tinn-R\ufrmComments.pas',
  ufrmCompletion in '..\Tinn-R\ufrmCompletion.pas',
  ufrmConfigurePrint in '..\Tinn-R\ufrmConfigurePrint.pas',
  ufrmConfirmReplace in '..\Tinn-R\ufrmConfirmReplace.pas',
  ufrmCount in '..\Tinn-R\ufrmCount.pas',
  ufrmEditor in '..\Tinn-R\ufrmEditor.pas',
  ufrmGotoBox in '..\Tinn-R\ufrmGotoBox.pas',
  ufrmGroupRename in '..\Tinn-R\ufrmGroupRename.pas',
  ufrmHotKeys in '..\Tinn-R\ufrmHotKeys.pas',
  ufrmLatexDimensional in '..\Tinn-R\ufrmLatexDimensional.pas',
  ufrmMain in '..\Tinn-R\ufrmMain.pas',
  ufrmNewGoup in '..\Tinn-R\ufrmNewGoup.pas',
  ufrmPandoc in '..\Tinn-R\ufrmPandoc.pas',
  ufrmPrintPreview in '..\Tinn-R\ufrmPrintPreview.pas',
  ufrmRcard in '..\Tinn-R\ufrmRcard.pas',
  ufrmReplace in '..\Tinn-R\ufrmReplace.pas',
  ufrmRmirrors in '..\Tinn-R\ufrmRmirrors.pas',
  ufrmRServer in '..\Tinn-R\ufrmRServer.pas',
  ufrmRterm in '..\Tinn-R\ufrmRterm.pas',
  ufrmSearchInFiles in '..\Tinn-R\ufrmSearchInFiles.pas',
  ufrmSearch in '..\Tinn-R\ufrmSearch.pas',
  ufrmShortcuts in '..\Tinn-R\ufrmShortcuts.pas',
  ufrmSplash in '..\Tinn-R\ufrmSplash.pas',
  ufrmTools in '..\Tinn-R\ufrmTools.pas',
  ufrmUpdater in '..\Tinn-R\ufrmUpdater.pas',
  uModDados in '..\Tinn-R\uModDados.pas';

{$R Tinn_R_portable.KLR}
{$R *.RES}

var
  hPrevious,
   hMutex: HWnd;

  slFilesStarting: TStringList;

  i: integer;

  cTemp: PChar;

  sTemp: string;

{This code, to allow file association and open clicked files in the running
 instance of app was written by Andrius Adamonis}
function fEnumWindowsCallback(hHandle: HWnd;
                              lpParam: LParam): Boolean; Stdcall;

  function IsMyClass: Boolean;
  var
    aClassName: array[0..30] of Char;

  begin
    GetClassName(hHandle,
                 aClassName,
                 30);

    Result:= (StrIComp(aClassName,
                       'TfrmMain') = 0) and
             (SendMessage(hHandle,
                          WM_FINDINSTANCE,
                          0,
                          0) = MyUniqueConst);
  end;

begin
  Result:= not IsMyClass; // Needs True to continue
  if not Result then hPrevious:= hHandle;
end;

procedure pFillFileList(slFile: TStringList);
var
  i,
   iPos: integer;

  hHandle: THandle;

  curFile: WIN32_FIND_DATA;

  sPath: string;

begin
  for i:= 1 to ParamCount do begin // Loop through all the parameters and build a file list
    iPos:= Pos('*',
               ParamStr(i));

    if (iPos > 0) then begin // Do multi file globbing
      sPath:= ExtractFilePath(ExpandFileName(ParamStr(i)));

      hHandle:= FindFirstFile(PChar(ParamStr(i)),
                              curFile);

      if FileExists(sPath +
                    curFile.cFilename) then slFile.Add('"' +
                                                       sPath +
                                                       curFile.cFilename
                                                       + '"');

      while FindNextFile(hHandle,
                         curFile) do
        if FileExists(sPath +
                      curFile.cFilename) then slFile.Add('"' +
                                                         sPath +
                                                         curFile.cFilename +
                                                         '"');
    end // End globbing
    else begin	// Do single file open
      if FileExists(ParamStr(i)) then begin // Check for file
        if (i < ParamCount) then iPos:= Pos('lin=',
                                            ParamStr(i + 1)) // Check for line number
                            else iPos:= -1;
        if (iPos > 0) then slFile.Add('"' +
                                      ExpandFileName(ParamStr(i)) +
                                      '"' +
                                      ',' +
                                      Copy(ParamStr(i + 1),
                                      iPos + 3,
                                      length(ParamStr(i + 1))))
                      else slFile.Add('"' +
                                      ExpandFileName(ParamStr(i)) +
                                                     '"');
      end
      else begin // Create a new file
        // Check for the line request
        iPos:= Pos('lin=',
                    ParamStr(i));

        if (iPos = 0) then begin
          sPath:= ExtractFilePath(ExpandFileName(ParamStr(i)));

          // if the path isn't already in the file name, add it
          if (Pos(sPath,
                  ParamStr(i)) = 0) then slFile.Add('"' +
                                                    sPath +
                                                    ParamStr(i) +
                                                    '"')
                                    else slFile.Add('"' +
                                                    ParamStr(i) +
                                                    '"');
        end;
      end;
    end; // End single file open
  end; // End param loop
end;

procedure pSendString(sToSend: string);
var
  copyDataStruct: TCopyDataStruct;

begin
  copyDataStruct.dwData:= 0; //Use it to identify the message contents
  //copyDataStruct.cbData:= 1 + Length(sToSend);

  copyDataStruct.cbData:= (length(sToSend) + 1) * sizeof(char); //Radoslaw Bujak

  copyDataStruct.lpData:= PChar(sToSend);

  SendMessage(hPrevious,
              WM_COPYDATA,
              Integer(hPrevious),
              Integer(@copyDataStruct));
end;

begin
  slFilesStarting:= TStringList.Create;

  hPrevious:= 0;
  EnumWindows(@fEnumWindowsCallback,
              0);

  // The condition below avoid multiples instances of Tinn-R!
  // If Tinn-R IS RUNNIG and the user select more than one
  // associated file from win_explorer.
  //PS: NOT CHANGE THIS PLACE
  if (hPrevious <> 0) then begin
    SetForegroundWindow(hPrevious);

    PostMessage(hPrevious,
                WM_RESTOREAPP,
                0,
                0);

    if (ParamCount > 0) then begin

      pFillFileList(slFilesStarting);

      if (slFilesStarting.Count > 0) then
        for i:= 0 to (slFilesStarting.Count - 1) do
          pSendString(slFilesStarting.Strings[i]);
    end;

    Exit;
  end;

  // The condition below avoid multiples instances of Tinn-R!
  // If Tinn-R IS NOT RUNNIG and the user select more than one
  // associated file from win_explorer, it will open one.
  //PS: NOT CHANGE THIS PLACE
  hMutex:= CreateMutex(nil,
                       True,
                       'Tinn-R');

  if (GetLastError <> 0) then begin
    CloseHandle(hMutex);

    Exit;
  end;

  frmSplash:= TfrmSplash.Create(Application);
  frmSplash.Show;
  frmSplash.Update;
  Application.Initialize;

  Application.Title := 'Tinn-R Editor (portable)';
  Application.HelpFile:= '';

  Application.CreateForm(TfrmMain,
                         frmMain);

  if (ParamCount > 0) then pFillFileList(slFilesStarting);

  if (slFilesStarting.Count > 0) then begin
    dmSyn.boolLoadedFileFromStartUp:= True;

    cTemp:= PChar(slFilesStarting.Strings[0]);

    sTemp:= AnsiExtractQuotedStr(cTemp,
                                 '"');

    frmMain.pCheckIfFileFromDVI(sTemp);
  end;

  FreeAndNil(slFilesStarting);
  frmSplash.Hide;
  frmSplash.Free;
  Application.Run;
end.
