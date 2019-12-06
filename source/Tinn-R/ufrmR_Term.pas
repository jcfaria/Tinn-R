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

unit ufrmR_Term;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvgPage, JvDockTree, JvDockControlForm, JvComponentBase,
  ExtCtrls, ConsoleIO, ToolWin, TB2Item, TB2Dock, TB2Toolbar,
  ActnList, PerlRegEx, Menus,
  SynEdit, SynEditTypes, SynEditKeyCmds, SynCompletionProposal;

type
  TfrmR_Term = class(TForm)
    cRTerm: TConsoleIO;
    JvDockClientRterm: TJvDockClient;
    pgRterm: TJvgPageControl;
    synIO: TSynEdit;
    synLOG: TSynEdit;
    tbsIO: TTabSheet;
    tbsLog: TTabSheet;
    TBDock1: TTBDock;
    TBToolbarRterm: TTBToolbar;
    TBItem7: TTBItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBItem41: TTBItem;
    TBItem40: TTBItem;
    TBItem42: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;
    TBSubmenuItem10: TTBSubmenuItem;
    TBItem29: TTBItem;
    TBItem28: TTBItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBItem32: TTBItem;
    TBItem31: TTBItem;
    TBItem30: TTBItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBItem33: TTBItem;
    TBSubmenuItem11: TTBSubmenuItem;
    TBSubmenuItem13: TTBSubmenuItem;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBItem6: TTBItem;
    TBSubmenuItem12: TTBSubmenuItem;
    TBItem37: TTBItem;
    TBItem36: TTBItem;
    TBItem35: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSubmenuItem9: TTBSubmenuItem;
    TBItem24: TTBItem;
    TBItem34: TTBItem;
    TBItem8: TTBItem;
    TBSubmenuItem8: TTBSubmenuItem;
    TBItem27: TTBItem;
    TBItem26: TTBItem;
    TBItem25: TTBItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBItem13: TTBItem;
    TBItem12: TTBItem;
    TBItem11: TTBItem;
    TBSubmenuItem1: TTBSubmenuItem;
    TBItem10: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBItem3: TTBItem;
    TBSubmenuItem4: TTBSubmenuItem;
    TBSubmenuItem15: TTBSubmenuItem;
    TBItem17: TTBItem;
    TBItem16: TTBItem;
    TBSubmenuItem14: TTBSubmenuItem;
    TBItem39: TTBItem;
    TBItem38: TTBItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBItem15: TTBItem;
    TBItem14: TTBItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSubmenuItem6: TTBSubmenuItem;
    TBItem21: TTBItem;
    TBItem20: TTBItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBItem19: TTBItem;
    TBItem18: TTBItem;
    TBSubmenuItem5: TTBSubmenuItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBSeparatorItem9: TTBSeparatorItem;
    TBSubmenuItem7: TTBSubmenuItem;
    TBItem5: TTBItem;
    TBItem4: TTBItem;
    TBItem43: TTBItem;
    TBItem44: TTBItem;
    TBItem45: TTBItem;
    TBItem46: TTBItem;
    TBItem47: TTBItem;

    procedure cRTermError(Sender: TObject; const Cmd: string);
    procedure cRTermProcessStatusChange(Sender: TObject; IsRunning: Boolean);
    procedure cRTermReceiveError(Sender: TObject; const Cmd: string);
    procedure cRTermReceiveOutput(Sender: TObject; const Cmd: string);
    procedure FormCreate(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgRtermResize(Sender: TObject);
    procedure synIOEnter(Sender: TObject);
    procedure synIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synIOKeyPress(Sender: TObject; var Key: WideChar);
    procedure synIOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synIOMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure synLOGEnter(Sender: TObject);
    procedure synLOGKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synLOGKeyPress(Sender: TObject; var Key: WideChar);
    procedure synLOGKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synLOGMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
    bRterm_Sent : boolean;
    bTab        : boolean;
    slError     : TStringList;
    sTab        : string;
    sTabPrefix  : string;

    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;

    procedure pCtrl_Tab(bNext: boolean = True);
    procedure pSetCursorRestriction;
    procedure psplRIOMoved(Sender: TObject);

  public
    { Public declarations }
    bIO_Keyed             :boolean;
    bRterm_Plus           : boolean;
    bRterm_Running        : boolean;
    bRUnderDebug_Function : boolean;
    bRUnderDebug_Package  : boolean;
    bRUnderScan_Function  : boolean; // 1:
    iSize                 : integer;
    iSynLOG2Height        : integer;
    iSynLOG2Width         : integer;
    splRIO                : TSplitter;
    sRDebug_Prefix        : string;
    sRScan_Prefix         : string;  // X:
    synLOG2               : TSynEdit;

    procedure pCR;
    procedure pRtermSplit(bSplitHorizontal: boolean = True);
  end;

var
  frmR_Term: TfrmR_Term;

implementation

uses
  ufrmMain,
  ufrmEditor,
  ufrmTools,
  trSynUtils,
  trUtils,
  udmSyn;

{$R *.dfm}

procedure TfrmR_Term.cRTermReceiveOutput(Sender: TObject;
                                         const Cmd: string);

  procedure pFindError_Editor(sTmp: string);
  var
    i: integer;

  begin
    with frmMain do
      if (pgFiles.PageCount > 0) then begin
        i:= fFindTop_Window;
        with (MDIChildren[i] as TfrmEditor) do
          pSearch_Error(sTmp)
      end;
  end;


  // Will get the object among '' or "": 'object' or "object" --> object
  procedure pFindError(sTmp: string);
  var
    iPos: integer;

  begin
    iPos := Pos('''',
                sTmp);

    if (iPos <> 0) then begin
      Delete(sTmp,
             1,
             iPos);
      iPos:= Pos('''',
                 sTmp);
      Delete(sTmp,
             iPos,
             length(sTmp));
      pFindError_Editor(sTmp);
      Exit;
    end;

    iPos:= Pos('"',
               sTmp);
    if (iPos <> 0) then begin
      Delete(sTmp,
             1,
             iPos);
      iPos:= Pos('"',
                 sTmp);
      Delete(sTmp,
             iPos,
             length(sTmp));
      pFindError_Editor(sTmp);
    end;
  end;

  // I hope the Core Team do not change the pathern of the error messages... :-)
  procedure pGetError;
  var
    i,
     iCount,
     iPos  : integer;
    sTmp   : string;

  begin
    //ShowMessage(slError.Text);
    iCount:= slError.Count;
    case iCount of
      1: begin
        sTmp:= slError.Strings[0];
        pFindError(sTmp);
      end;
      2: begin
        sTmp:= slError.Strings[1];
        pFindError(sTmp);
      end
      else begin
        for i:= (iCount - 1) downto 0 do begin
          if (Trim(slError.Strings[i]) = '^') then begin
            sTmp:= slError.Strings[i - 1];  // The prior strings (line) has the error!
            iPos:= Pos(':',
                       sTmp);
            if (iPos <> 0) then begin
              Delete(sTmp,
                     1,
                     iPos);
              sTmp:= Trim(sTmp);
              pFindError_Editor(sTmp);
              Break;
            end;
          end
          else begin
            sTmp:= slError.Strings[i];      // The current strings (line) has the error!
            pFindError(sTmp);
          end;
        end;
      end;
    end;
  end;

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

       with synIO do
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

       with synIO do
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
       //
       //// Print the entire match result
       //var_dump($matches);

       // by J.C.Faria
       sTmp:= fRegEx(Cmd,
                     '\|[ =]*\|[ ]*[0-9]*%',
                     False);

       with synIO do
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

   procedure pAddROutput;
   var
     slTmp: TStringList;

   begin
     try
       if (Cmd = '') then Exit;

       slTmp:= TStringList.Create;

       slTmp.Text:= StringReplace(Cmd,
                                  #13#10,
                                  #13#10,
                                  [rfReplaceAll]);

       //ShowMessage(slTmp.Text);
       with synIO do
         if bRUnderDebug_Function or
            bRUnderDebug_Package then begin
           Lines.Add('');
           Lines.AddStrings(slTmp);
         end
         else
           Lines.AddStrings(slTmp);
     finally
       FreeAndNil(slTmp);
     end;
   end;

   procedure pSetFocus;
   begin
     with frmMain do
       if (pgFiles.PageCount > 0) then pSet_Focus_Main;
                                  //else synIO.SetFocus;  // Problem when AutoHide is On
   end;

var
  i: integer;

  slTmp: TStringList;

begin
  if (Cmd = '') and
     bTab then Exit;

  if Assigned(slError) then begin
    pGetError;
    FreeAndNil(slError);
  end;

  pgRterm.ActivePage:= tbsIO;
  pCheckIfUnderScan_Function;
  pCheckIfUnderDebug_Function;
  pCheckIfUnderDebug_Package;

  with synIO do begin
    BeginUpdate;
    if (Cmd = '+ ') then
      bRterm_Plus:= True;  // To control sending line by line

    if bRterm_Sent then begin
      if (Cmd = '> ') then Lines.Add(Cmd)
                      else pAddROutput;

      bRterm_Sent:= False;

      if bTab then begin
        try
          slTmp:= TStringList.Create;

          pString_Split(' ',
                        Cmd,
                        slTmp);

          if (slTmp.Count = 2) then begin
            if (sTabPrefix <> '') then sTab:= sTabPrefix +
                                              slTmp[1]
                                  else sTab:= slTmp[1];
          end;
        finally
          FreeAndNil(slTmp);
        end;
      end;
    end
    else begin
      if (Cmd = '> ') and
         (LineText <> '') then Lines.Add('');

      if (Cmd = '> ') and
         (sTab <> '') and
         bTab then begin
        Lines.Add(Cmd +
                  sTab);

        sTab:= '';

        bTab:= False;
      end
      else
        // It is necessary to check if the output Cmd is sent by txtProgressBar.
        // It is used by users and by default in various R packages: knitr
        if not fIsUnder_txtPB then pAddROutput;
    end;

    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    if not WordWrap then
      for i:= 0 to 1 do
        ExecuteCommand(ecScrollLeft,
                       #0,
                       nil);
    EndUpdate;
  end;
  pSetFocus;
end;

procedure TfrmR_Term.cRTermError(Sender: TObject;
                                 const Cmd: string);
begin
  with synIO do begin
    BeginUpdate;
    Lines.Add(Cmd);
    if not frmMain.bRguiReturnFocus then
      if CanFocus then SetFocus;
    EndUpdate;
  end;

  frmMain.stbMain.Panels[9].Text:= 'Log: received warning or error!';

  with frmMain.actRtermWarningError do begin
    Visible:= True;
    Checked:= False;
  end;

  frmMain.pSet_Focus_Main;
end;

procedure TfrmR_Term.cRTermProcessStatusChange(Sender: TObject;
                                               IsRunning: Boolean);
begin
  if IsRunning then bRterm_Running:= True
               else bRterm_Running:= False;
end;

procedure TfrmR_Term.cRTermReceiveError(Sender: TObject;
                                        const Cmd: string);

  function CheckIfError: boolean;
  var
    i: integer;

  const
    aError: array [0..4] of string = ('erro',     //pt
                                      'erreur',   //fr
                                      'error',    //en/es
                                      'errore',   //it
                                      'fehler');  //de

  begin
    Result:= False;
    for i:= 0 to 4 do
      if (Pos(aError[i],
              lowercase(Cmd)) > 0) then begin
        Result:= True;

        Break;
      end;
  end;

var
  seLOG: TSynEdit;

begin
  if CheckIfError then begin
    with frmMain do begin
      stbMain.Panels[9].Text:= 'Error!';

      actRtermWarningError.ImageIndex:= 254;

      if bRterm_BeepOnError then Beep;

      if bRterm_FindError then
        if not bRterm_Sent and
           not Assigned(slError) then
          slError:= TStringList.Create;
    end;
  end
  else begin
    with frmMain do begin
      stbMain.Panels[9].Text:= 'Warning!';

      actRtermWarningError.ImageIndex:= 252;
    end;
  end;

  if Assigned(synLOG2) then seLOG:= synLOG2
                       else seLOG:= synLOG;

  with seLOG do begin
    BeginUpdate;

    if bRterm_Sent then bRterm_Sent:= False;

    Lines.Add(Cmd);

    PostMessage(TWinControl(seLOG).Handle,
                WM_SETFOCUS,
                0,
                0);  // Will force ecEditorBottom below

    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    EndUpdate;
  end;

  if frmMain.bRterm_FindError and
     Assigned(slError) then slError.Add(Cmd);

  with frmMain.actRtermWarningError do begin
    Visible:= True;

    Checked:= False;
  end;

  frmMain.pSet_Focus_Main;
end;

procedure TfrmR_Term.FormCreate(Sender: TObject);
begin
  with synIO do
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;

  with synLOG do
    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
end;

procedure TfrmR_Term.FormHide(Sender: TObject);
begin
  with frmMain do begin
    if not actRtermVisible.Checked then Exit;  // LoadDockTreeFromAppStorage call FormHide when starting and the form is not visible.
                                               // Do not remove from here!

    actRtermVisible.Checked:= False;  // It is necessary here due the user can close the form manually pressing the x icon.

    with JvDockServer do begin
      with LeftDockPanel do  // Left
        if ContainsControl(frmR_Term) then begin
          iSize:= Width;
          Exit;
        end;
      with TopDockPanel do  // Top
        if ContainsControl(frmR_Term) then begin
          iSize:= Height;
          Exit;
        end;
      with RightDockPanel do // Right
        if ContainsControl(frmR_Term) then begin
          iSize:= Width;
          Exit;
        end;
      with BottomDockPanel do // Bottom
        if ContainsControl(frmR_Term) then begin
          iSize:= Height;
          Exit;
        end;
    end;
  end;
end;

procedure TfrmR_Term.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmR_Term.pgRtermResize(Sender: TObject);
var
  sToSend: string;
  iWidth: integer;

begin
  if (not bRterm_Running) or
     not frmMain.bRterm_Width then Exit;

  iWidth:= (synIO.Width - synIO.Gutter.Width - 20) div synIO.CharWidth;

  if (iWidth >= 10) then
    sToSend:= 'options(''width''=' +
              IntToStr(iWidth) +
              ')' +
              #13#10;

  with frmMain do
    if csRGeneral.Active then csRGeneral.Socket.SendText(sToSend);
end;

procedure TfrmR_Term.synIOEnter(Sender: TObject);
begin
  with frmMain do
    actRtermIOSetFocus.Checked:= True;
end;

procedure TfrmR_Term.pCtrl_Tab(bNext: boolean = True);
begin
  if Assigned(synLOG2) then begin
    if (frmMain.iSynWithFocus = 3) then begin
      with synLOG2 do
        if CanFocus then SetFocus
    end
    else
      with synIO do
        if CanFocus then SetFocus;
    Exit;
  end;

  if bNext then begin
    if (pgRterm.ActivePageIndex = pgRterm.PageCount - 1) then begin
      pgRterm.ActivePageIndex:= 0;
      with synIO do
        if CanFocus then SetFocus;
    end
    else begin
      pgRterm.ActivePageIndex:= pgRterm.ActivePageIndex + 1;
      with synLOG do
        if CanFocus then SetFocus;
    end;
  end
  else begin
    if Assigned(synLOG2) then
      with synIO do begin
        if CanFocus then SetFocus;
        Exit;
      end;

    if (pgRterm.ActivePageIndex = 0) then begin
      pgRterm.ActivePageIndex:= pgRterm.PageCount - 1;
      with synLOG do
        if CanFocus then SetFocus;
    end
    else begin
      pgRterm.ActivePageIndex:= pgRterm.ActivePageIndex - 1;
      with synIO do
        if CanFocus then SetFocus;
    end;
  end;
end;

// CTRL + Carriage Return (CTRL + ENTER)
procedure TfrmR_Term.pCR;

  procedure pSantize_Selection(var sTmp: string);
  begin
    // Search for lines starting by '> '
    if (fRegEx(sTmp,
               '^>[ ]+',
               False,
               '',
               False,
               [preMultiLine]) <> '') then
      // Remove '> '
      sTmp:= fRegEx(sTmp,
                    '^>[ ]+',
                    True,
                    '',
                    True,
                    [preMultiLine]);

    // Search for lines starting by '+ '
    if (fRegEx(sTmp,
               '^[+][ ]+',
               False,
               '',
               False,
               [preMultiLine]) <> '') then
      // Remove '+ '
      sTmp:= fRegEx(sTmp,
                    '^[+][ ]+',
                    True,
                    '',
                    True,
                    [preMultiLine]);
  end;

  function fGet_Selection(var bSingleLine: boolean): string;
  var
    sTmp,
     sFilePath: string;

  begin
    Result:= EmptyStr;

    with synIO do
      sTmp:= SelText;

    if not frmMain.bRSendAll then
      pRemove_Line_Commented(sTmp);
    pRemove_Line_Empty(sTmp);

    // if selection is a single line and bRSmart
    if frmMain.bRSmart and
       fSingleLine(sTmp) then begin
      bSingleLine:= True;

      Result:= StringReplace(sTmp,
                             #13#10,
                             EmptyStr,
                             [rfReplaceAll]);
      Exit;
    end;

    pSantize_Selection(sTmp);
    pRemove_Line_Empty(sTmp);

    sFilePath:= frmMain.sPath_Tmp +
                '\selection.r';

    if fFile_Save_Fast(sFilePath,
                       sTmp) then
      Result:= '.paths[5]';
  end;

  // Get the user option (y/n/c) in the prompt message whem R is ready to quit
  function fCheck_Quit(var sT: string): boolean;
  begin
    Result:= False;

    if (fRegEx(sT,
               '\?[ ]+\[y\/n\/c\]:') <> '') then
    begin
      //https://regex101.com/r/mcqIse/4
      sT:= fRegEx(sT,
                  '(.+\[y\/n\/c\]:)[ ]*',
                  True);

      Result:= True;
    end;
  end;

  // It check if under interactive funcion scan()
  procedure pCheck_Scan(var sTmp,
                        sPre: string);
  var
    sRex: string;

  begin
    // If under scan() function - ^[0-9]+:X
    sRex:= fRegEx(sTmp,
                  '^[0-9]+:');

    if (sRex <> '') then begin
      sTmp:= fRegEx(sTmp,
                    '^[0-9]+:',
                    True,
                    '');

      sPre:= sRex;
    end;
  end;

  // It is necessary to clean the sToSend string.
  function fCheck_Debug(var sT: string): boolean;
  begin
    Result:= False;

    // Empty string
    if (sT = '') then
      Exit;

    if (fRegEx(sT, '^Browse\[[0-9]+\]>') <> '') then
    begin // STDin and STDout of IO are under the function debug
      sT:= fRegEx(sT,
                  '^Browse\[[0-9]+\]>',
                  True);

      Result:= True;
    end;

    // https//regex101.com/r/sT5eI9/1
    // by J.C.Faria
    if (fRegEx(sT,
               '^D[\(\)0-9]*>') <> '') then
    begin // STDin and STDout of IO are under the package debug
      sT:= fRegEx(sT,
                  '^D[\(\)0-9]*>',
                  True);

      Result:= True;
    end;

    RHistory.Add(Trim(sT));
  end;  // pCheck_RHistory

  procedure pProcess_CR(var sTmp,
                          sPre,
                          sSend: string);
  begin
    // Remove space(s) after '>'
    if (fRegEx(sTmp,
               '^>[ ]+') <> '') then
      sTmp:= fRegEx(sTmp,
                    '^>[ ]+',
                    True,
                    '> ');

    // Remove space(s) after '+'
    if (fRegEx(sTmp,
               '^[+][ ]+') <> '') then
      sTmp:= fRegEx(sTmp,
                    '^[+][ ]+',
                    True,
                    '+ ');

    // Get the prefix
    if (fRegEx(sTmp,
               '^>') <> '') then
      sPre:= '>'
    else if (fRegEx(sTmp,
                    '^[+]') <> '') then
      sPre:= '+';

    // Remove prefix and spaces before the command
    case fString_ToCase_Select(sPre,
                               ['>',
                                '+']) of

      0: sTmp:= fRegEx(sTmp, '^>[ ]*', True);
      1: sTmp:= fRegEx(sTmp, '^[+][ ]*', True);
    end;

    sSend:= sTmp;

    with synIO do
    begin
      ExecuteCommand(ecEditorBottom,
        #0,
        nil);

      // It will checks if is under debug
      if fCheck_Debug(sSend) then
      begin
        LineText:= sRDebug_Prefix + sSend;
      end
      else

      // result of cat('something')
      if (sSend = sTmp) and (fRegEx(sTmp, '>$') <> '') and (sPre = '') then
        sSend:= ''
      else
        case fString_ToCase_Select(sPre,
                                   ['>',
                                    '+',
                                    '']) of
          0: LineText:= sPre + ' ' + sSend;
          1: LineText:= sPre + ' ' + sSend;
          2: if (sSend <> '') then
                LineText:= '>' + ' ' + sSend;
        end;

      frmMain.pDo_Send(sSend,
                       False);

      ExecuteCommand(ecPageLeft,
        #0,
        nil);

      ExecuteCommand(ecLineStart,
        #0,
        nil);
    end;  // with syn_Rio
  end;  // procedure pProcessCR

var
  sTmp,
    sPre,
    sSend,
    sToSend: string;

  bSingleLine: boolean;

begin
  sTmp := '';
  sPre := '';
  sSend:= '';

  with synIO do
  begin
    BeginUpdate;

    // User selection has priority
    if SelAvail then begin
      sToSend:= fGet_Selection(bSingleLine);

      if (sToSend = EmptyStr) then Exit;

      if bSingleLine then
        sTmp:= sToSend
      else
        if frmMain.bRecho then
          sTmp:= 'source(' +
                 sToSend +
                 ', echo=TRUE' +
                 ', max.deparse.length=' +
                 IntToStr(frmMain.iMaxDeparseLength) +
                 ')'
        else
          sTmp:= 'source(' +
                 sToSend +
                 ')';
    end
    else begin
      sTmp:= Trim(LineText);

      pCheck_Scan(sTmp,
                  sPre);
    end;

    if fCheck_Quit(sTmp) then
    begin
      frmMain.pDo_Send(sSend,
                       False);
    end
    else
      pProcess_CR(sTmp,
                  sPre,
                  sSend);

    EndUpdate;
  end;

end;

procedure TfrmR_Term.synIOKeyDown(Sender: TObject;
                                  var Key: Word;
                                  Shift: TShiftState);

  function ConsoleGetCursorTo(sWay: string): string;
  var
    iPos: integer;

    smOption: TSynSelectionMode;

  begin
    Result:= '';
    if not frmMain.fValidR_Running then Exit;
    with synIO do begin
      beginUpdate;
      smOption:= SelectionMode;

      if (SelectionMode <> smNormal) then SelectionMode:= smNormal;

      iPos:= CaretX;

      // CursorToBeginningLine
      if (sWay = 'BeginningLine') then begin
        if not SelAvail then ExecuteCommand(ecSelLineStart,
                                            #0,
                                            nil);
      end
      // CursorToEndLine
      else
        if not SelAvail then ExecuteCommand(ecSelLineEnd,
                                            #0,
                                            nil);

      if SelAvail then Result:= SelText
      else begin
        Result:= '';
        SelectionMode:= smOption;
        CaretX:= iPos;
        EndUpdate;
        Exit;
      end;

      SelectionMode:= smOption;
      CaretX:= iPos;
      EndUpdate;
    end;
  end;

  function fIsInteger(sTmp: string): boolean;
  begin
    try
      Result:= True;
      StrToInt(Trim(sTmp));
    except
      On EConvertError do Result:= False;
    end;
  end;

const
  cOk = ['>',
         '+'];

var
  iPos,
   iPosX: integer;

  sTmp,
   sToSend,
   sPrior,
   sAfter: string;

begin
  bIO_Keyed:= True;  // Some instruction was typed in the RTerm_IO!

  with frmMain do
    actRtermIOSetFocus.Checked:= True;

  case Key of
    1..15,
    18..31,
    33..36,
    38,
    40..45,
    46..67,
    69..105,
    108,
    110..300:
    begin
      with frmMain.stbMain do begin
        Panels[8].Text:= '';
        Panels[9].Text:= '';
      end;
      with frmMain.actRtermWarningError do begin
        Visible:= False;
        Checked:= False;
      end;
    end;
  end;

  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);

  if (Shift <> [ssCtrl]) and
     (Key = VK_TAB) then begin
    with synIO do begin
      if not frmMain.fRterm_Running then Exit;
      BeginUpdate;
      sTmp:= Trim(LineText);

      sTabPrefix:= '';
      iPos:= Pos('(',
                 sTmp);
      if (iPos <> 0) then begin
        sTabPrefix:= Trim(Copy(sTmp,
                               0,
                               iPos));
        if sTmp[iPos + 1] = ' ' then sTabPrefix:= sTabPrefix + ' ';
        Delete(sTabPrefix,
               1,
               2);
        sTmp:= Trim(Copy(sTmp,
                         (iPos + 1),
                         (Length(sTmp) - iPos + 1)));
      end;

      iPos:= Pos('<-',
                 sTmp);
      if (iPos <> 0) then begin
        sTabPrefix:= Trim(Copy(sTmp,
                               0,
                               iPos + 1));
        if sTmp[iPos + 2] = ' ' then sTabPrefix:= sTabPrefix + ' ';
        Delete(sTabPrefix,
               1,
               2);
        sTmp:= Trim(Copy(sTmp,
                         (iPos + 2),
                         (Length(sTmp) - iPos + 1)));
      end;

      iPos:= Pos('<<-',
                 sTmp);
      if (iPos <> 0) then begin
        sTabPrefix:= Trim(Copy(sTmp,
                               0,
                               iPos + 2));
        if sTmp[iPos + 3] = ' ' then sTabPrefix:= sTabPrefix + ' ';
        Delete(sTabPrefix,
               1,
               2);
        sTmp:= Trim(Copy(sTmp,
                        (iPos + 3),
                        (Length(sTmp) - iPos + 2)));
      end;

      iPos:= Pos('=',
                 sTmp);
      if (iPos <> 0) then begin
        sTabPrefix:= Trim(Copy(sTmp,
                               0,
                               iPos));
        if sTmp[iPos + 1] = ' ' then sTabPrefix:= sTabPrefix + ' ';
        Delete(sTabPrefix,
               1,
               2);
        sTmp:= Trim(Copy(sTmp,
                        (iPos + 1),
                        (Length(sTmp) - iPos + 1)));
      end;

      if (sTmp = '>') or
         (sTmp = '') then begin
        key:= VK_PAUSE;
        EndUpdate;
        Exit;
      end;

      if (sTmp[1] in cOk) then Delete(sTmp,
                                      1,
                                      1);

      // Get the typed to add to the prompt after the Result returned by R
      sTab:= Trim(LineText);
      if (sTab[1] in cOk) then Delete(sTab,
                                      1,
                                      1);
      sTab:= Trim(sTab);

      // Send intruction to R
      sTmp:= Trim(sTmp);
      sToSend:= 'apropos(''^' +
                 sTmp +
                 '''' +
                 ', ignore.case=FALSE)';
      bTab       := True;
      bRterm_Sent:= True;
      bRterm_Plus:= False;

      frmMain.pDo_Send(sToSend,
                       False);

      ExecuteCommand(ecEditorBottom,
                     #0,
                     nil);
      EndUpdate;
      Exit;
    end;
  end;

  if not bRterm_Running and
     not frmMain.bIPRemoteConnected then Exit;

  if (Shift = [ssCtrl]) then begin
    if not frmMain.fRterm_Running then Exit;

    case Key of
     ord('Y'): with synIO do // CTRL+Y
                 if (CaretY = Lines.Count) then Key:= VK_PAUSE;

      VK_BACK: with synIO do begin  // CTRL+BACK
                 if (CaretY = Lines.Count) then begin
                   sPrior:= trim(ConsoleGetCursorTo('BeginningLine'));

                   if (sPrior = '>') or
                      (sPrior = '+') or
                      (sPrior = sRDebug_Prefix) then key:= VK_PAUSE;
                 end;
               end;

      VK_LEFT: with synIO do begin  // CTRL+LEFT
                 if (CaretY = Lines.Count) then begin
                   sPrior:= trim(ConsoleGetCursorTo('BeginningLine'));

                   if (sPrior = '>') or
                      (sPrior = '+') or
                      (sPrior = sRDebug_Prefix) then key:= VK_PAUSE;
                 end;
               end;

      VK_RETURN: begin
                   pCR;
                   key:= VK_PAUSE;
                 end;

      VK_MULTIPLY: begin // Add or replace text by tip: R server or database
                     with synIO do begin
                       iPosX  := CaretX;
                       SelText:= frmMain.sTipToWrite +
                                 ')';
                       CaretX := iPosX;
                     end;
                     frmMain.sTipToWrite:= '';
                   end;

      // The below avoid problens with undo/redo and eoScrollPastEol (in or not in options)
      VK_ADD: with synIO do begin// Add or replace text by attribution symbol: ->
                SelText:= ' ->';

                ExecuteCommand(ecChar,
                               ' ',
                               nil);
              end;

      // The below avoid problens with undo/redo and eoScrollPastEol (in or not in options)
      VK_SUBTRACT: with synIO do begin// Add or replace text by attribution symbol: <-
                     SelText:= ' <-';

                     ExecuteCommand(ecChar,
                                    ' ',
                                    nil);
                   end;

      48: with synIO do // Add or replace text by attribution symbol: ()
            SelText:= '()';

      57: with synIO do begin // Add or replace text by attribution symbol: (Caret)
            SelText:= '()';
            CaretX := CaretX - 1;
          end;
    end;
  end;

  if (Key = VK_RETURN) then
    with synIO do
      if not SelAvail then
        if (CaretY = Lines.Count) then begin
          pCR;
          key:= VK_PAUSE;
        end;

//  // All below will make restrictions and special features to the keystrokes on the last line (prompt)
//  with synIO do begin
//    if not SelAvail then begin
//      if (CaretY = Lines.Count - 1) and
//         (Key = VK_DOWN) then begin
//        key:= VK_PAUSE;
//
//        CaretY:= Lines.Count;
//
//        ExecuteCommand(ecLineEnd,
//                       #0,
//                       nil);
//      end
//      else if (CaretY <> Lines.Count) then Exit;
//    end;
//  end;

//  if (Key = VK_RETURN) then begin // Send latest line to R when editing related to Rterm
//    if not frmMain.fRterm_Running then Exit;
//
//    with synIO do begin
//      key:= VK_PAUSE;  // Avoid a blank line below the instruction
//
//      BeginUpdate;
//
//      ExecuteCommand(ecLineEnd,
//                     #0,
//                     nil);
//
//      sTmp:= Trim(LineText);
//
//      // https://regex101.com/r/kY6rL3/1
//      //$re = '/(?<=(>|\+|:)).+/';
//      //$str = '> sd(1:4)
//      //xxx> sd
//      //+ )
//      //xxx yyy> sd
//      //D(1)> sd (1:4)
//      //D(24)> sd
//      //> av <- aov(Sepal.Length ~ Species, data=iris)
//      //> 2 -> x
//      //> 4<3
//      //> 3>4
//      //
//      //# a <- scan()
//      //1: 1
//      //2: 2 3 4
//      //5:
//      //';
//      //
//      //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
//      //
//      //// Print the entire match result
//      //var_dump($matches);
//
//      // by J.C.Faria
//      sTmp:= fRegEx(sTmp,
//                    '(?<=(>|\+|:)).+',
//                    False);
//
//      if (sTmp <> '') then RHistory.Add(Trim(sTmp));
//
//      sToSend:= Trim(sTmp);
//
//      bRterm_Sent:= True;
//
//      bRterm_Plus:= False;
//
//      frmMain.pDoSend(sToSend,
//                      False);
//
//      EndUpdate;
//    end;
//  end;

  // The below impuse restrictions related to (VK_BACK, VK_DELETE, VK_LEFT, VK_HOME) in the latest line (the prompt)
  if (Shift <> [ssCtrl]) and
     (key   <> VK_RETURN) then begin

    with synIO do
      if not (CaretY = Lines.Count) then Exit;

    case Key of
      VK_BACK: begin
                 with synIO do begin
                   if not SelAvail then begin
                     sPrior:= trim(ConsoleGetCursorTo('BeginningLine'));

                     if (sPrior = '>') or
                        (sPrior = '+') or
                        (sPrior = sRDebug_Prefix) then
                       key:= VK_PAUSE;
                   end
                   else begin
                     if (CaretY = Lines.Count) and
                        (BlockBegin.Line <> BlockEnd.Line) then
                       with cRterm do begin
                         if (SelText = Text) then synIO.Clear;

                         if IsRunning then SendInput('' +
                                                     #13#10);
                       end;
                   end;
                 end;
               end;

      // Necessary to cotrol "Ctrl + A" or selection in the last line: prompt line
      VK_DELETE: begin
                   with synIO do begin
                     if not SelAvail then begin
                       sPrior:= Trim(ConsoleGetCursorTo('BeginningLine'));

                       sAfter:= Trim(ConsoleGetCursorTo('EndLine'));

                       if (sPrior = '>') or
                          (sPrior = '+') or
                          (sPrior = sRDebug_Prefix) then
                         if (sAfter = '')  then
                           key:= VK_PAUSE;
                     end
                     else begin
                       if (CaretY = 1) then begin
                         with cRterm do begin
                           if (SelText = Text) then synIO.Clear;

                           if IsRunning then SendInput('' +
                                                       #13#10);
                         end;

                         Exit;
                       end;

                       if (CaretY = Lines.Count) and
                          (BlockBegin.Line <> BlockEnd.Line) then
                         with cRterm do begin
                           if (SelText = Text) then synIO.Clear;

                           if IsRunning then SendInput('' +
                                                       #13#10);
                         end;
                     end;
                   end;
                 end;

      VK_LEFT: with synIO do begin
                 if not SelAvail then begin
                   sPrior:= Trim(ConsoleGetCursorTo('BeginningLine'));

                   if (sPrior = '>') or
                      (sPrior = '+') or
                      (sPrior = sRDebug_Prefix) then
                     if (sAfter = '')  then begin
                       CaretX:= Length(sPrior) + 2;
                       key:= VK_PAUSE;
                     end;
                 end;
               end;

      VK_HOME: with synIO do begin
                 if (sRDebug_Prefix <> '') then CaretX:= length(sRDebug_Prefix) + 2
                                           else CaretX:= 3;

                 key:= VK_PAUSE;
               end;
    end;
  end;
end;

procedure TfrmR_Term.synIOKeyPress(Sender: TObject;
                                   var Key: WideChar);

  function sFormat(sTmp: string;
                   cTmp: char): string;
  begin
    Result:= key +
             sTmp +
             cTmp;
  end;

  procedure InsertText(sTmp: string;
                       i: integer);
  begin
    with synIO do begin
      SelText:= sTmp;
      CaretX := CaretX - i;
    end;

    key:= #0;  // make nul the key pressed
  end;

begin
  if frmMain.actAutoCompletion.Checked then
    with synIO do
      case key of
         '(': if SelAvail then
                InsertText(sFormat(SelText,
                                   ')'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ')'),
                           1);
         '[': if SelAvail then
                InsertText(sFormat(SelText,
                                   ']'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ']'),
                           1);
         '{': if SelAvail then
                InsertText(sFormat(SelText,
                                   '}'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   '}'),
                           1);
        '''': if SelAvail then
                InsertText(sFormat(SelText,
                                   ''''),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ''''),
                           1);
         '"': if SelAvail then
                InsertText(sFormat(SelText,
                                   '"'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   '"'),
                           1);
      end;
end;

// Set restrictions to cursor position at the prompt
// The flag eoScrollPastEol is the new default
procedure TfrmR_Term.pSetCursorRestriction;
var
  s1,
   s2,
   s3,
   s4: string;

begin
  with synIO do begin
    BeginUpdate;
    s1:= Trim(LineText);

    // https://regex101.com/r/sT5eI9/1
    //$re = '/^D[\(\)0-9]*>/m';
    //$str = 'D(1)>
    //D(111)>
    //D(345)>';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    s2:= fRegEx(s1,
                '^D[\(\)0-9]*>',       // STDin and STDout of IO are under the package debug
                False);

    // https://regex101.com/r/jH2iA9/2
    //$re = '/^Browse\[[0-9]+\]>/m';
    //$str = 'Browse[1]> a
    //Browse[11]> aa
    //Browse[222]> 123';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    s3:= fRegEx(s1,
                '^Browse\[[0-9]+\]>',  // STDin and STDout of IO are under the function debug
                False);

    // https://regex101.com/r/uU3gO4/1
    //$re = '/^[0-9]+:/m';
    //$str = '1:
    //12:
    //123:';
    //
    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
    //
    //// Print the entire match result
    //var_dump($matches);

    // by J.C.Faria
    s4:= fRegEx(s1,
                '^[0-9]+:',            // STDin and STDout of IO are under the function scan
                False);

    if (s1 = '>') or
       (s1 = '+') then CaretX:= 3
    else if (s2 = s1) then CaretX:= length(s2) + 2   // STDin and STDout of IO are under the package debug
    else if (s3 = s1) then CaretX:= length(s3) + 2   // STDin and STDout of IO are under the function debug
    else if (s4 = s1) then CaretX:= length(s4) + 2;  // STDin and STDout of IO are under the function scan

    EndUpdate;
  end;
end;

procedure TfrmR_Term.synIOKeyUp(Sender: TObject;
                                var Key: Word;
                                Shift: TShiftState);
begin
  frmMain.iSynWithFocus:= 3;

  if not frmMain.fRterm_Running then Exit;

  with synIO do
    if SelAvail or
       (CaretY <> Lines.Count) then Exit;

  pSetCursorRestriction;
end;

procedure TfrmR_Term.synIOMouseUp(Sender: TObject;
                                  Button: TMouseButton;
                                  Shift: TShiftState;
                                  X,
                                  Y: Integer);
begin
  frmMain.iSynWithFocus:= 3;

  if not frmMain.fRterm_Running then Exit;

  with synIO do
    if SelAvail or
       (CaretY <> Lines.Count) then Exit;

  pSetCursorRestriction;
end;

procedure TfrmR_Term.synLOGEnter(Sender: TObject);
begin
  with frmMain do
    actRtermLogSetFocus.Checked:= True;
end;

procedure TfrmR_Term.synLOGKeyDown(Sender: TObject;
                                   var Key: Word;
                                   Shift: TShiftState);
var
  seEditor: TSynEdit;

begin
  seEditor:= TSynEdit(Sender);

  if (seEditor.Text = EmptyStr) and
     (Key = 35) then key:= VK_PAUSE;  // To avoid a exception when Log/Log2 is empty and user press End.

  case Key of
    1..15,
    18..31,
    33..36,
    38,
    40..44,
    46..67,
    69..105,
    108,
    110..300:
    begin
      with frmMain.stbMain do begin
        Panels[8].Text:= '';
        Panels[9].Text:= '';
      end;
      with frmMain.actRtermWarningError do begin
        Visible:= False;
        Checked:= False;
      end;
    end;
  end;

  if (Shift = [ssCtrl]) and
     (Key = VK_TAB) then pCtrl_Tab;

  if (Shift = [ssCtrl, ssShift]) and
     (Key = VK_TAB) then pCtrl_Tab(False);
end;

procedure TfrmR_Term.synLOGKeyPress(Sender: TObject;
                                    var Key: WideChar);
var
  seLOG: TSynEdit;

  function sFormat(sTmp: string;
                   cTmp: char): string;
  begin
    Result:= key +
             sTmp +
             cTmp;
  end;

  procedure InsertText(sTmp: string;
                       i: integer);
  begin
    with seLOG do begin
      SelText:= sTmp;
      CaretX := CaretX - i;
    end;

    key:= #0;  // make null the key pressed
  end;

begin
  if Assigned(synLOG2) then seLOG:= synLOG2
                       else seLOG:= synLOG;

  if frmMain.actAutoCompletion.Checked then
    with seLOG do
      case key of
         '(': if SelAvail then
                InsertText(sFormat(SelText,
                                   ')'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ')'),
                           1);
         '[': if SelAvail then
                InsertText(sFormat(SelText,
                                   ']'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ']'),
                           1);
         '{': if SelAvail then
                InsertText(sFormat(SelText,
                                   '}'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   '}'),
                           1);
        '''': if SelAvail then
                InsertText(sFormat(SelText,
                                   ''''),
                           0)
              else
                InsertText(sFormat(SelText,
                                   ''''),
                           1);
         '"': if SelAvail then
                InsertText(sFormat(SelText,
                                   '"'),
                           0)
              else
                InsertText(sFormat(SelText,
                                   '"'),
                           1);
      end;
end;

procedure TfrmR_Term.synLOGKeyUp(Sender: TObject;
                                 var Key: Word;
                                 Shift: TShiftState);
begin
  frmMain.iSynWithFocus:= 4;
end;

procedure TfrmR_Term.synLOGMouseUp(Sender: TObject;
                                   Button: TMouseButton;
                                   Shift: TShiftState;
                                   X,
                                   Y: Integer);
begin
  frmMain.iSynWithFocus:= 4;
end;

procedure TfrmR_Term.psplRIOMoved(Sender: TObject);
begin
  if frmMain.actRtermIOSplitHorizontal.Checked then iSynLOG2Height:= synLOG2.Height;
  if frmMain.actRtermIOSplitVertical.Checked   then iSynLOG2Width := synLOG2.Width;
end;

procedure TfrmR_Term.pRtermSplit(bSplitHorizontal: boolean = True);
begin
  tbsIO.Visible:= False;  // To avoid screen flicker on Rterm interface

  if Assigned(splRIO) then FreeAndNil(splRIO);
  if Assigned(synLOG2) then begin
    with synIO do
      if CanFocus then SetFocus;
    Application.ProcessMessages;
    FreeAndNil(synLOG2);
  end;

  synLOG2:= TSynEdit.Create(Self);
  with synLOG2 do begin
    BeginUpdate;

    OnPaintTransient:= TSyn_Transient.pSyn_PaintTransient;
    if bSplitHorizontal then begin
      Align:= alBottom;
      if (iSynLOG2Height > tbsIO.Height) then synLOG2.Height:= 4 * (tbsIO.Height div 5)
                                         else synLOG2.Height:= iSynLOG2Height
    end
    else begin
      Align:= alRight;
      if (iSynLOG2Width > tbsIO.Width) then synLOG2.Width:= 2 * (tbsIO.Width div 3)
                                       else synLOG2.Width:= iSynLOG2Width
    end;
    Parent                := tbsIO;
    BorderStyle           := bsNone;
    HideSelection         := False;
    onPaintTransient      := TSyn_Transient.pSyn_PaintTransient;
    OnKeyDown             := synLOGKeyDown;
    PopupMenu             := frmMain.pmenLog;
    Options               := synIO.Options;
    Gutter                := synIO.Gutter;
    Gutter.ShowlineNumbers:= synIO.Gutter.ShowlineNumbers;
    Font                  := synIO.Font;
    SelectionMode         := synIO.SelectionMode;
    WantTabs              := synIO.WantTabs;
    ActiveLineColor       := synIO.ActiveLineColor;
    Color                 := synIO.Color;
    TabWidth              := synIO.TabWidth;
    RightEdge             := synIO.RightEdge;
    RightEdgeColor        := synIO.RightEdgeColor;
    OnKeyUp               := synLOG.OnKeyUp;
    OnMouseUp             := synLOG.OnMouseUp;
    OnKeyPress            := synLOG.OnKeyPress;

    with Constraints do begin
      MinHeight:= 20;
      MinWidth := 30;
    end;

    with frmMain do
      if actRtermIO_R.Checked then Highlighter:= dmSyn.synR_term
                              else Highlighter:= dmSyn.synText_term;
    EndUpdate;
  end;

  splRIO:= TSplitter.Create(nil);
  with splRIO do begin
    Parent:= tbsIO;
    onMoved:= psplRIOMoved;
    Color  := clActiveCaption;
    Beveled:= True;
    if bSplitHorizontal then begin
      Align := alBottom;
      Height:= 3;
      Cursor:= crVSplit;
    end
    else begin
      Align := alRight;
      Width := 3;
      Cursor:= crHSplit;
    end;
  end;
  tbsIO.Visible:= True;
end;

procedure TfrmR_Term.CMDialogKey(var Message: TCMDialogKey);
begin
  if Assigned(synLOG2) then begin
    Exit;
    inherited;
  end;

  if (Message.CharCode = VK_TAB) and (GetKeyState(VK_CONTROL) < 0) then begin
    if (GetKeyState(VK_SHIFT) < 0) then begin  // Shift is pressed
      if (pgRterm.ActivePageIndex = 0) then pgRterm.ActivePageIndex:= pgRterm.PageCount - 1
                                       else pgRterm.ActivePageIndex:= pgRterm.ActivePageIndex - 1;
    end
    else begin  // Shift is not pressed
      if (pgRterm.ActivePageIndex = pgRterm.PageCount - 1) then pgRterm.ActivePageIndex:= 0
                                                           else pgRterm.ActivePageIndex:= pgRterm.ActivePageIndex + 1
    end;

    Message.Result:= 1;
  end
  else inherited;
end;

//      VK_RETURN: with synIO do begin // CTRL+ENTER -> Send prior lines
//                   BeginUpdate;
//                   sTmp:= Trim(LineText);
//                   ExecuteCommand(ecEditorBottom,
//                                  #0,
//                                  nil);
//                   LineText:= sTmp;
//                   ExecuteCommand(ecEditorBottom,
//                                  #0,
//                                  nil);
//                   if (sTmp = '') then sTmp:= '> ';
//                   if (sTmp[1] in cOk) then Delete(sTmp,
//                                                   1,
//                                                   1);
//                   if (sTmp <> '') then RHistory.Add(Trim(sTmp));
//                   sToSend    := sTmp;
//                   bRterm_Sent:= True;
//                   bRterm_Plus:= False;
//                   frmMain.pDoSend(sToSend,
//                                   False);
//                   EndUpdate;
//                   Exit;
//                 end;

//const
//  cOk = ['>',
//         '+'];
//
//var
//  sTmp,
//    sToSend: string;
//
//begin
//  with synIO do begin
//    BeginUpdate;
//    sTmp:= Trim(LineText);
//    ExecuteCommand(ecEditorBottom,
//                   #0,
//                   nil);
//    LineText:= sTmp;
//    ExecuteCommand(ecEditorBottom,
//                   #0,
//                   nil);
//    if (sTmp = '') then sTmp:= '> ';
//    if (sTmp[1] in cOk) then Delete(sTmp,
//                                    1,
//                                    1);
//    if (sTmp <> '') then RHistory.Add(Trim(sTmp));
//    sToSend    := sTmp;
//    bRterm_Sent:= True;
//    bRterm_Plus:= False;
//    frmMain.pDoSend(sToSend,
//                    False);
//    EndUpdate;
//    Exit;
//  end;

//  with synIO do begin
//    BeginUpdate;
//
//    ExecuteCommand(ecLineEnd,
//                   #0,
//                   nil);
//
//    sTmp:= Trim(LineText);
//
//    // https://regex101.com/r/kY6rL3/1
//    //$re = '/(?<=(>|\+|:)).+/';
//    //$str = '> sd(1:4)
//    //xxx> sd
//    //+ )
//    //xxx yyy> sd
//    //D(1)> sd (1:4)
//    //D(24)> sd
//    //> av <- aov(Sepal.Length ~ Species, data=iris)
//    //> 2 -> x
//    //> 4<3
//    //> 3>4
//    //
//    //# a <- scan()
//    //1: 1
//    //2: 2 3 4
//    //5:
//    //';
//    //
//    //preg_match_all($re, $str, $matches, PREG_SET_ORDER, 0);
//    //
//    //// Print the entire match result
//    //var_dump($matches);
//
//    // by J.C.Faria
//    sTmp:= fRegEx(sTmp,
//                  '(?<=(>|\+|:)).+',
//                  False);
//
//    if (sTmp <> '') then RHistory.Add(Trim(sTmp));
//
//    sToSend:= Trim(sTmp);
//
//    bRterm_Sent:= True;
//
//    bRterm_Plus:= False;
//
//    frmMain.pDoSend(sToSend,
//                    False);
//
//    EndUpdate;
//  end;

//procedure TfrmR_Term.synIOProcessCommand(Sender: TObject;
//                                         var Command: TSynEditorCommand;
//                                         var AChar: WideChar;
//                                         Data: Pointer);
//begin
//  if (Command <> ecPaste) then Exit;
//  if not frmMain.fRterm_Running then Exit;
//
//  with synIO do
//    if (CaretY = Lines.Count) then
//      with frmMain do
//        pSend_Clipboard_ToRterm;
//
//  Command:= ecNone;
//end;

end.

