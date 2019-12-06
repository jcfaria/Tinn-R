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
 Tinn-R is an extension of Tinn that provides additional tools to control R
 (http://cran.r-project.org). The project is coordened by José Cláudio Faria
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
*)

unit trRutils;

interface
uses
  Windows, Messages, SysUtils, Dialogs, Classes,
  Clipbrd, Registry, Graphics, Controls, StrUtils,
  ActiveX, ShlObj, ComObj, PerlRegEx, WinInet, StdCtrls,
  SynEdit, SynEditKeyCmds,
  ConsoleIO;

type
  TR_Useful = class

  protected
    slError: TStringList;

  private

  public
    bIncomplete : boolean;
    cRTerm_RU   : TConsoleIO;
    synIO_RU    : TSynEdit;
    synLOG_RU   : TSynEdit;

    constructor Create;//(AOwner: TComponent);
    destructor Free;

    procedure cRTerm_RU_Error(Sender: TObject; const Cmd: string);
    procedure cRTerm_RU_ProcessStatusChange(Sender: TObject; IsRunning: Boolean);
    procedure cRTerm_RU_ReceiveError(Sender: TObject; const Cmd: string);
    procedure cRTerm_RU_ReceiveOutput(Sender: TObject; const Cmd: string);
  end;

implementation

uses
  trUtils,
  ufrmR_Term,
  ufrmMain;

constructor TR_Useful.Create;//(AOwner: TComponent);
begin
  cRTerm_RU:= TConsoleIO.Create(nil);
  synIO_RU:= TSynEdit.Create(nil);
  synLOG_RU:= TSynEdit.Create(nil);

  with cRTerm_RU do begin
    // Properties
    // Are set on the constructor TConsoleIO.Create

    // Events
    onError              := cRTerm_RU_Error;
    OnProcessStatusChange:= cRTerm_RU_ProcessStatusChange;
    OnREceiveError       := cRTerm_RU_ReceiveError;
    OnReceiveOutput      := cRTerm_RU_ReceiveOutput;
  end;

  with frmMain do
    cRTerm_RU.RunProcess(sPath_Rterm +
                         ' ' +
                         sPar_Rterm,
                         fRWorkDir);
end;

destructor TR_Useful.Free;
begin
  cRTerm_RU.StopProcess;
  FreeAndNil(cRTerm_RU);
  FreeAndNil(synIO_RU);
  FreeAndNil(synLOG_RU);
end;

procedure TR_Useful.cRTerm_RU_ReceiveOutput(Sender: TObject;
                                            const Cmd: string);

  procedure pCheckIfUnderScan_Function;
  var
    sRex : string;

  begin
    // If under scan() function - ^[0-9]+:X
    sRex:= fRegEx(Cmd,
                  '^[0-9]+:');

    if (sRex <> EmptyStr) then
      with frmR_Term do begin
        bRUnderScan_Function:= True;

        sRScan_Prefix:= sRex;
      end
    else
      with frmR_Term do begin
        bRUnderScan_Function:= False;
        if not bRUnderScan_Function then sRScan_Prefix:= '';
      end;
  end;

  procedure pCheckIfUnderDebug_Function;
  var
    iPosDbg1,
     iPosDbg2 : integer;

  begin
    // It is necessary due the use of function debug: Browser[number]>
    iPosDbg1:= Pos('Browse[',
                   Cmd);

    iPosDbg2:= Pos(']>',
                   Cmd);

    with frmR_Term do
      if (iPosDbg1 <> 0) and
         (iPosDbg2 <> 0) and
         (iPosDbg1 < iPosDbg2) then begin
          bRUnderDebug_Function:= True;

          sRDebug_Prefix:= Trim(Copy(Cmd,
                                     iPosDbg1,
                                     iPosDbg2 - iPosDbg1 + 2));
      end
      else bRUnderDebug_Function:= False;
  end;

  procedure pCheckIfUnderDebug_Package;
  var
    iPosDbg1,
     iPosDbg2 : integer;

  begin
    // It is necessary due the use of package debug: D(number)>
    iPosDbg1:= Pos('D(',
                   Cmd);

    iPosDbg2:= Pos(')>',
                   Cmd);

    with frmR_Term do
      if (iPosDbg1 <> 0) and
         (iPosDbg2 <> 0) and
         (iPosDbg1 < iPosDbg2) then begin
          bRUnderDebug_Package:= True;

          sRDebug_Prefix:= Trim(Copy(Cmd,
                                     iPosDbg1,
                                     iPosDbg2 - iPosDbg1 + 2));
      end
      else begin
        bRUnderDebug_Package:= False;
        if not bRUnderDebug_Function then sRDebug_Prefix:= '';
      end;
  end;

  function fIsUnder_txtPB: boolean;
  var
    sTmp: string;

  begin
    Result:= False;

    // Case: use of 'txtProgressBar' function with the argument style=1
    // by J.C.Faria
    if (fRegEx(Cmd,
               '^[=]+',  // style=1, it was possible to detect the pattern only using show message in the output
               False) <> '') then begin

      with synIO_RU do
        // Check if already exists a last one progress char '=' in the LineText
        if (fRegEx(LineText,
                   '^[=]+',
                   False) = '') then Lines.Add(Cmd)              // if not -> It will be the first   '='
                                else LineText:= LineText + Cmd;  // else   -> add the received '=' to LineText

      Result:= True;
    end;

    // Case: use of 'txtProgressBar' function with the argument style=2
    // by J.C.Faria
    if (fRegEx(Cmd,
               '^(\r){1,3}[=]+',  // style=2, it was possible to detect the pattern only using show message in the output
               False) <> '') then begin

      with synIO_RU do
        // Check if already exists a last one progress char '=' in the LineText
        if (fRegEx(LineText,
                   '^[=]+',
                   False) = '') then Lines.Add(Trim(Cmd))   // if not -> It will be the first   '='
                                else LineText:= Trim(Cmd);  // else   -> add the received '=' to LineText

      Result:= True;
    end;

    // Case: use of 'txtProgressBar' function with the argument style=3
    // by J.C.Faria
    if (fRegEx(Cmd,
               '^(\r)[ ]{1,3}\|[ =]*[|]?[ ]*[0-9]*%?',  // style=3
               False) <> '') then begin
      if (fRegEx(Cmd,
                 '(label:|ordinary text [a-zA-Z ]+)',  // style=3 and receiving output of 'knitr' package
                 False) <> '') then begin
        Result:= False;

        Exit
      end;

      // The beow is very nice to pure txtProgressBar, not to knitr functions.
      // The knitr progress bar is very polluted!
      // I think, impossible to filter.
      // So, it will be a task to 'pAddROutput' procedure below.

      //https://regex101.com/r/zA6jX2/1
      //$re = '/\|[ =]*\|[ ]*[0-9]*%/';
      //$str = '|
      //|                                 |   0%
      //|
      //|========                         |  25%
      //|
      //|================                 |  50%
      //|
      //|=========================        |  75%
      //|
      //|=================================| 100%';
      //
      //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);

      //// Print the entire match result
      //var_dump($matches);

      // by J.C.Faria
      sTmp:= fRegEx(Cmd,
                    '\|[ =]*\|[ ]*[0-9]*%',
                    False);

      with synIO_RU do
        // Check if already exists a last one progress structure '|  | 0%' in the LineText
        // https://regex101.com/r/uJ4oN6/1
        //$re = '/\|[ =]*[|]?[ ]*[0-9]*%?/';
        //$str = '|
        //|                                 |   0%
        //|
        //|========                         |  25%
        //|
        //|================                 |  50%
        //|
        //|=========================        |  75%
        //|
        //|=================================| 100%';
        //
        //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
        //
        //// Print the entire match result
        //var_dump($matches);

        // by J.C.Faria
        if (fRegEx(LineText,
                   '\|[ =]*[|]?[ ]*[0-9]*%?',
                   False) = '') then
          Lines.Add(sTmp)   // if not -> It will be the first   '|  | 0%'
                               else
          LineText:= sTmp;  // else   -> add the received ''|  | X%'' to LineText

      Result:= True;
    end;
  end;

//   procedure pAddROutput;
//   var
//     slTmp: TStringList;
//
//   begin
//     try
//       if (Cmd = '') then Exit;
//
//       slTmp:= TStringList.Create;
//
//       slTmp.Text:= StringReplace(Cmd,
//                                  #13#10,
//                                  #13#10,
//                                  [rfReplaceAll]);
//
//       with synIO_RU do
//         if frmR_Term.bRUnderDebug_Function or
//            frmR_Term.bRUnderDebug_Package then begin
//           Lines.Add('');
//           Lines.AddStrings(slTmp);
//         end
//         else
//           Lines.AddStrings(slTmp);
//     finally
//       FreeAndNil(slTmp);
//     end;
//   end;

begin
  pCheckIfUnderScan_Function;
  pCheckIfUnderDebug_Function;
  pCheckIfUnderDebug_Package;

  bIncomplete:= False;
  with synIO_RU do begin
    BeginUpdate;
    if (Cmd = '+ ') then begin
      bIncomplete:= True;
      ShowMessage(Cmd);
    end;

    if (Cmd = '> ') and
       (LineText <> '') then Lines.Add('');

    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    EndUpdate;
  end;
end;

procedure TR_Useful.cRTerm_RU_ProcessStatusChange(Sender: TObject;
                                                  IsRunning: Boolean);
begin
//  if IsRunning then bRterm_Running:= True
//               else bRterm_Running:= False;
end;

procedure TR_Useful.cRTerm_RU_Error(Sender: TObject;
                                    const Cmd: string);
begin
  with synIO_RU do begin
    BeginUpdate;
    Lines.Add(Cmd);
    EndUpdate;
  end;
end;

procedure TR_Useful.cRTerm_RU_ReceiveError(Sender: TObject;
                                           const Cmd: string);
begin
  with synLOG_RU do begin
    BeginUpdate;
    Lines.Add(Cmd);
    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);
    EndUpdate;
  end;
end;

end.
