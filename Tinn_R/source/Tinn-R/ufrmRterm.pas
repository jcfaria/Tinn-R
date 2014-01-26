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

unit ufrmRterm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SynEdit, ComCtrls, JvgPage, JvDockTree, JvDockControlForm,
  JvComponentBase, SynEditTypes, SynEditKeyCmds, ExtCtrls, ConsoleIO,
  ToolWin, TB2Item, TB2Dock, TB2Toolbar;

type
  TfrmRterm = class(TForm)
    cRTerm: TConsoleIO;
    JvDockClientRterm: TJvDockClient;
    pgRterm: TJvgPageControl;
    synIO: TSynEdit;
    synLog: TSynEdit;
    TBItem1: TTBItem;
    TBItem10: TTBItem;
    TBItem11: TTBItem;
    TBItem12: TTBItem;
    TBItem13: TTBItem;
    TBItem14: TTBItem;
    TBItem15: TTBItem;
    TBItem16: TTBItem;
    TBItem17: TTBItem;
    TBItem18: TTBItem;
    TBItem19: TTBItem;
    TBItem2: TTBItem;
    TBItem20: TTBItem;
    TBItem21: TTBItem;
    TBItem22: TTBItem;
    TBItem23: TTBItem;
    TBItem24: TTBItem;
    TBItem25: TTBItem;
    TBItem26: TTBItem;
    TBItem27: TTBItem;
    TBItem28: TTBItem;
    TBItem29: TTBItem;
    TBItem3: TTBItem;
    TBItem30: TTBItem;
    TBItem31: TTBItem;
    TBItem32: TTBItem;
    TBItem33: TTBItem;
    TBItem34: TTBItem;
    TBItem35: TTBItem;
    TBItem36: TTBItem;
    TBItem37: TTBItem;
    TBItem38: TTBItem;
    TBItem39: TTBItem;
    TBItem4: TTBItem;
    TBItem5: TTBItem;
    TBItem6: TTBItem;
    TBItem7: TTBItem;
    TBItem8: TTBItem;
    TBItem9: TTBItem;
    TBSeparatorItem1: TTBSeparatorItem;
    TBSeparatorItem3: TTBSeparatorItem;
    TBSeparatorItem4: TTBSeparatorItem;
    TBSeparatorItem5: TTBSeparatorItem;
    TBSeparatorItem6: TTBSeparatorItem;
    TBSeparatorItem7: TTBSeparatorItem;
    TBSeparatorItem8: TTBSeparatorItem;
    TBSeparatorItem9: TTBSeparatorItem;
    tbsIO: TTabSheet;
    tbsLog: TTabSheet;
    TBSubmenuItem1: TTBSubmenuItem;
    TBSubmenuItem10: TTBSubmenuItem;
    TBSubmenuItem11: TTBSubmenuItem;
    TBSubmenuItem12: TTBSubmenuItem;
    TBSubmenuItem13: TTBSubmenuItem;
    TBSubmenuItem14: TTBSubmenuItem;
    TBSubmenuItem15: TTBSubmenuItem;
    TBSubmenuItem2: TTBSubmenuItem;
    TBSubmenuItem3: TTBSubmenuItem;
    TBSubmenuItem4: TTBSubmenuItem;
    TBSubmenuItem5: TTBSubmenuItem;
    TBSubmenuItem6: TTBSubmenuItem;
    TBSubmenuItem7: TTBSubmenuItem;
    TBSubmenuItem8: TTBSubmenuItem;
    TBSubmenuItem9: TTBSubmenuItem;
    TBToolbarRterm: TTBToolbar;
    TBItem40: TTBItem;
    TBItem41: TTBItem;
    TBItem42: TTBItem;
    TBSeparatorItem2: TTBSeparatorItem;

    procedure cRTermError(Sender: TObject; const Cmd: string);
    procedure cRTermProcessStatusChange(Sender: TObject; IsRunning: Boolean);
    procedure cRTermReceiveError(Sender: TObject; const Cmd: string);
    procedure cRTermReceiveOutput(Sender: TObject; const Cmd: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure synIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synIOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synIOMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure synLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synLogKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synLogMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure synIOEnter(Sender: TObject);
    procedure synLogEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgRtermResize(Sender: TObject);

  private
    { Private declarations }
    bRterm_Sent : boolean;
    bTab        : boolean;
    sTab        : string;
    sTabPrefix  : string;
    slError     : TStringList;

    procedure splRIOMoved(Sender: TObject);

  public
    { Public declarations }
    bRterm_Plus   : boolean;
    bRterm_Running: boolean;
    iSynLog2Height: integer;
    iSynLog2Width : integer;
    splRIO        : TSplitter;
    synLog2       : TSynEdit;

    procedure RtermSplit(bSplitHorizontal: boolean = True);
  end;

var
  frmRterm: TfrmRterm;

implementation

uses
  ufrmMain,
  ufrmEditor,
  ufrmTools,
  trUtils;

{$R *.dfm}

procedure TfrmRterm.cRTermReceiveOutput(Sender: TObject;
                                        const Cmd: string);

  procedure FindErrorInTheEditor(sTmp: string);
  var
    i: integer;

  begin
    with frmTinnMain do
      if (pgFiles.PageCount > 0) then begin
        i:= FindTopWindow;
        with (MDIChildren[i] as TfrmEditor) do
          SearchError(sTmp)
      end;
  end;


  // Will get the object among '' or "": 'object' or "object" --> object
  procedure FindError(sTmp: string);
  var
    iPos: integer;

  begin
    iPos:= Pos('''',
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
      FindErrorInTheEditor(sTmp);
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
      FindErrorInTheEditor(sTmp);
    end;
  end;

  // I hope the Core Team do not change the pathern of the error messages... :-)
  procedure GetError;
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
        FindError(sTmp);
      end;
      2: begin
        sTmp:= slError.Strings[1];
        FindError(sTmp);
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
              FindErrorInTheEditor(sTmp);
              Break;
            end;
          end
          else begin
            sTmp:= slError.Strings[i];      // The current strings (line) has the error!
            FindError(sTmp);
          end;
        end;
      end;
    end;
  end;

  procedure CheckIfUnderDebugPackage;
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
        (iPosDbg2 <> 0) then begin
       with frmTinnMain do begin
         bRUnderDebugPackage:= True;
         sRDebugPrefix      := Trim(Copy(Cmd,
                                         iPosDbg1,
                                         iPosDbg2 - iPosDbg1 + 2));
       end;
     end
     else begin
       with frmTinnMain do begin
         bRUnderDebugPackage:= False;
         if not bRUnderDebugFunction then sRDebugPrefix:= '';
       end;
     end;
   end;

  procedure CheckIfUnderDebugFunction;
  var
    iPosDbg1,
     iPosDbg2 : integer;

   begin
     // It is necessary due the use of package debug: Browser[number]>
     iPosDbg1:= Pos('Browse[',
                    Cmd);
     iPosDbg2:= Pos(']>',
                    Cmd);
     if (iPosDbg1 <> 0) and
        (iPosDbg2 <> 0) then begin
       with frmTinnMain do begin
         bRUnderDebugFunction:= True;
         sRDebugPrefix       := Trim(Copy(Cmd,
                                          iPosDbg1,
                                          iPosDbg2 - iPosDbg1 + 2));
       end;
     end
     else begin
       with frmTinnMain do begin
         bRUnderDebugFunction:= False;
         if not bRUnderDebugPackage then sRDebugPrefix:= '';
       end;
     end;
   end;

   // It is very nice!
   procedure AddROutput;
   var
     slTmp: TStringList;

   begin
     try
       slTmp:= TStringList.Create;

       slTmp.Text:= StringReplace(Cmd,
                                  #13#10,
                                  #13#10,
                                  [rfReplaceAll]);

       with synIO do
         Lines.AddStrings(slTmp);
     finally
       FreeAndNil(slTmp);
     end;
   end;

var
  i    : integer;
  slTmp: TStringList;

begin
  if Assigned(slError) then begin
    GetError;
    FreeAndNil(slError);
  end;

  pgRterm.ActivePage:= tbsIO;
  CheckIfUnderDebugPackage;
  CheckIfUnderDebugFunction;

  with synIO do begin
    BeginUpdate;
    if (Cmd = '+ ') then
      bRterm_Plus:= True;  // To control sending line by line

    if bRterm_Sent then begin
      if (Cmd = '> ') then Lines.Add(Cmd)
                      else AddROutput;

      bRterm_Sent:= False;

      if bTab then begin
        try
          slTmp:= TStringList.Create;

          StrSplit(' ',
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
      else AddROutput;
    end;

    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);

    if not frmTinnMain.bRguiReturnFocus and
       synIO.Visible then SetFocus;

    if not WordWrap then
      for i:= 0 to 1 do
        ExecuteCommand(ecScrollLeft,
                       #0,
                       nil);
    EndUpdate;
  end;
  frmTinnMain.SetFocus_Rterm;
end;

procedure TfrmRterm.cRTermError(Sender: TObject;
                                const Cmd: string);
begin
  with synIO do begin
    BeginUpdate;
    Lines.Add(Cmd);
    if not frmTinnMain.bRguiReturnFocus then SetFocus;
    EndUpdate;
  end;
  frmTinnMain.stbMain.Panels[8].Text:= 'Log: received warning or error!';
  with frmTinnMain.actRtermWarningError do begin
    Visible:= True;
    Checked:= False;
  end;
  frmTinnMain.SetFocus_Rterm;
end;

procedure TfrmRterm.cRTermProcessStatusChange(Sender: TObject;
                                              IsRunning: Boolean);
begin
  if IsRunning then bRterm_Running:= True
               else bRterm_Running:= False;
end;

procedure TfrmRterm.cRTermReceiveError(Sender: TObject;
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
  seLog: TSynEdit;

begin
  if CheckIfError then begin
    with frmTinnMain do begin
      stbMain.Panels[8].Text:= 'Error!';
      actRtermWarningError.ImageIndex:= 254;
      if bRtermBeepOnError then Beep;
      if bRtermFindError then
        if not bRterm_Sent and
           not Assigned(slError) then
          slError:= TStringList.Create;
    end;
  end
  else begin
    with frmTinnMain do begin
      stbMain.Panels[8].Text:= 'Warning!';
      actRtermWarningError.ImageIndex:= 252;
    end;
  end;

  if Assigned(synLog2) then seLog:= synLog2 {synIO}
                       else seLog:= synLog {synIO};

  with seLog do begin
    BeginUpdate;
    if bRterm_Sent then bRterm_Sent:= False;
    Lines.Add(Cmd);
    PostMessage(TWinControl(seLog).Handle,
                WM_SETFOCUS,
                0,
                0);  // Will force ecEditorBottom below
    ExecuteCommand(ecEditorBottom,
                   #0,
                   nil);
    EndUpdate;
  end;

  if frmTinnMain.bRtermFindError and
     Assigned(slError) then slError.Add(Cmd);

  with frmTinnMain.actRtermWarningError do begin
    Visible:= True;
    Checked:= False;
  end;

  with frmTinnMain do
    SetFocus_Rterm;
end;

procedure TfrmRterm.FormCloseQuery(Sender: TObject;
                                   var CanClose: Boolean);
begin
  frmTinnMain.actRtermVisibleExecute(nil);
end;

procedure TfrmRterm.FormCreate(Sender: TObject);
begin
  with synIO do
    OnPaintTransient:= frmTinnMain.synPaintTransient;

  with synLog do
    OnPaintTransient:= frmTinnMain.synPaintTransient;

  JvDockClientRterm.DockStyle:= frmTinnMain.JvDockVSNetStyle;
  ManualDock(frmTinnMain.JvDockServer.RightDockPanel,
             nil,
             AlClient);

  ShowDockForm(Self);
end;

procedure TfrmRterm.FormShow(Sender: TObject);
begin
  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmRterm.pgRtermResize(Sender: TObject);
var
  sToSend: string;
  iWidth: integer;

begin
  if (not bRterm_Running) then Exit;

  iWidth:= (synIO.Width - synIO.Gutter.Width - 20) div synIO.CharWidth;

  if (iWidth >= 10) then
    sToSend:= 'options(''width''=' +
              IntToStr(iWidth) +
              ')' +
              #13#10;

  with frmTinnMain do
    if csRGeneral.Active then csRGeneral.Socket.SendText(sToSend);
end;

procedure TfrmRterm.synIOEnter(Sender: TObject);
begin
  with frmTinnMain do
    actRtermIOSetFocus.Checked := True;
end;

procedure TfrmRterm.synIOKeyDown(Sender: TObject;
                                 var Key: Word;
                                 Shift: TShiftState);

  function ConsoleGetCursorTo(sWay: string): string;
  var
    iPos           : integer;
    smOption       : TSynSelectionMode;

  begin
    Result:= '';
    if not frmTinnMain.ValidRRunning then Exit;
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
        Result       := '';
        SelectionMode:= smOption;
        CaretX       := iPos;
        EndUpdate;
        Exit;
      end;

      SelectionMode:= smOption;
      CaretX       := iPos;
      EndUpdate;
    end;
  end;

  function IsInteger(sTmp: string): boolean;
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
   iPosX    : integer;
  sTmp,
   sToSend,
   sPrior,
   sAfter,
   sEfective: string;

begin
  with frmTinnMain do
    actRtermIOSetFocus.Checked:= True;

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
      with frmTinnMain.stbMain do begin
        Panels[7].Text:= '';
        Panels[8].Text:= '';
      end;
      with frmTinnMain.actRtermWarningError do begin
        Visible:= False;
        Checked:= False;
      end;
    end;
  end;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_TAB: begin
                if not frmTinnMain.actRtermVisible.Checked then Exit;
                if Assigned(synLog2) then synLog2.SetFocus
                else begin
                  pgRterm.ActivePageIndex:= 1;
                  synLog.SetFocus;
                end;
              end;
  end;

  if (Shift <> [ssCtrl]) and
     (Key = VK_TAB) then begin
    with synIO do begin
      if not frmTinnMain.Rterm_Running then Exit;
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

      frmTinnMain.DoSend(sToSend,
                         False);

      Lines.Add('');
      ExecuteCommand(ecEditorBottom,
                     #0,
                     nil);
      EndUpdate;
      Exit;
    end;
  end;

  if not bRterm_Running and
     not frmTinnMain.bIPRemoteConnected then Exit;

  if (Shift = [ssCtrl]) then begin
    if not frmTinnMain.Rterm_Running then Exit;
    case Key of
      89: with synIO do // CTRL+Y
            if (CaretY = Lines.Count) then Key:= VK_PAUSE;

      VK_RETURN: with synIO do begin // Send prior lines
                   BeginUpdate;
                   sTmp:= Trim(LineText);
                   ExecuteCommand(ecEditorBottom,
                                  #0,
                                  nil);
                   LineText:= sTmp;
                   ExecuteCommand(ecEditorBottom,
                                  #0,
                                  nil);
                   if (sTmp = '') then sTmp:= '> ';
                   if (sTmp[1] in cOk) then Delete(sTmp,
                                                   1,
                                                   1);
                   if (sTmp <> '') then frmTinnMain.RHistory.Add(Trim(sTmp));
                   sToSend    := sTmp;
                   bRterm_Sent:= True;
                   bRterm_Plus:= False;
                   frmTinnMain.DoSend(sToSend,
                                      False);
                   EndUpdate;
                   Exit;
                 end;

      VK_MULTIPLY: begin // Add or replace text by tip: R server or database
                     with synIO do begin
                       iPosX  := CaretX;
                       SelText:= frmTinnMain.sTipToWrite +
                                 ')';
                       CaretX := iPosX;
                     end;
                     frmTinnMain.sTipToWrite:= '';
                   end;

      VK_ADD: with synIO do // Add or replace text by attribution symbol: ->
                SelText:= ' -> ';

      VK_SUBTRACT: with synIO do // Add or replace text by attribution symbol: <-
                     SelText:= ' <- ';

      48: with synIO do // Add or replace text by attribution symbol: ()
            SelText:= '()';

      57: with synIO do begin // Add or replace text by attribution symbol: (Caret)
            SelText:= '()';
            CaretX := CaretX - 1;
          end;
    end;
  end;

  // All below will make restrictions and special features to the keystrokes on the last line (the prompt: > )
  with synIO do begin
    if not SelAvail then begin
      if (CaretY = Lines.Count - 1) and
         (Key = VK_DOWN) then begin
        key   := VK_PAUSE;
        CaretY:= Lines.Count;
        ExecuteCommand(ecLineEnd,
                       #0,
                       nil);
      end
      else if (CaretY <> Lines.Count) then Exit;
    end;
  end;

  with synIO do
    if not SelAvail then
      if (LineText <> '') then
        if (LineText[1] in cOk) and
           (CaretX <= 3) then CaretX:= 3;

  if (Key = VK_RETURN) then begin // Send latest line to R when editing related to Rterm
    if not frmTinnMain.Rterm_Running then Exit;
    with synIO do begin
      key:= VK_PAUSE;  // Avoid a blank line below the instruction

      BeginUpdate;
      ExecuteCommand(ecLineEnd,
                     #0,
                     nil);
      sTmp:= Trim(LineText);
      if (sTmp = '') then sTmp:= '> ';
      if (sTmp[1] in cOk) then Delete(sTmp,
                                      1,
                                      1);
      if (sTmp <> '') and
         (sTmp <> '> ') then begin
        // It is necessary due the use of package debug: D(number)>
        if frmTinnMain.bRUnderDebugPackage then begin
          iPos:= Pos(')>',
                     sTmp);
          sEfective:= Trim(Copy(sTmp,
                                (iPos + 2),
                                (Length(sTmp) - iPos + 2)));
          if (sEfective = '') then sTmp:= ''
                              else sTmp:= sEfective;
        end
        // It is necessary due the use of function debug: D[number]>
        else if frmTinnMain.bRUnderDebugFunction then begin
          iPos:= Pos(']>',
                     sTmp);
          sEfective:= Trim(Copy(sTmp,
                           (iPos + 2),
                           (Length(sTmp) - iPos + 2)));
          if (sEfective = '') then sTmp:= ''
                              else sTmp:= sEfective;
        end
        // It is necessary due the use of package sem (John Fox)
        else if (sTmp[Length(sTmp)] = ':') then
            if IsInteger(Copy(sTmp,
                              0,
                              Pos(':',
                                  sTmp) - 1)) then
              sTmp:= '';
      end;
      if (sTmp <> '') then frmTinnMain.RHistory.Add(Trim(sTmp));
      sToSend    := Trim(sTmp);
      bRterm_Sent:= True;
      bRterm_Plus:= False;
      frmTinnMain.DoSend(sToSend,
                         False);
      //CaretY:= Lines.Count - 1;
      EndUpdate;
    end;
  end;

  // The below will avoid the user to type any not desired keys in the prompt: '>' or '+' signal
  if (Shift <> [ssCtrl]) and
     (key   <> VK_RETURN) then
  case Key of
    VK_BACK: begin
               with synIO do begin
                 if not SelAvail then begin
                   sPrior:= Trim(ConsoleGetCursorTo('BeginningLine'));
                   if (sPrior = '>') or
                      (sPrior = '+') then begin
                     key:= VK_PAUSE;
                     //ExecuteCommand(ecLineEnd, #0, nil);
                   end;
                 end
                 else begin
                   if (CaretY = Lines.Count) then
                     with cRterm do begin
                       if (SelText = Text) then synIO.Clear;
                       if IsRunning then SendInput('' +
                                                   #13#10);
                     end;
                 end;
               end;
             end;

    // Necessary to cotrol "Ctrl + A" or selection in the last line (prompt)
    VK_DELETE: begin
                 with synIO do begin
                   if not SelAvail then begin
                     sPrior:= Trim(ConsoleGetCursorTo('BeginningLine'));
                     sAfter:= Trim(ConsoleGetCursorTo('EndLine'));
                     if (sPrior = '>') or
                        (sPrior = '+') then
                        if (sAfter = '')  then begin
                       key:= VK_PAUSE;
                       ExecuteCommand(ecLineEnd,
                                      #0,
                                      nil);
                     end;
                   end
                   else begin
                     if (CaretY = Lines.Count) then
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
                    (sPrior = '+') then begin
                   key:= VK_PAUSE;
                   CaretX:= 3;
                 end;
               end;
             end;

    VK_HOME: with synIO do begin
               key:= VK_PAUSE;
               CaretX:= 3;
             end;
  end;
end;

procedure TfrmRterm.synIOKeyUp(Sender: TObject;
                               var Key: Word;
                               Shift: TShiftState);
begin
  frmTinnMain.iSynWithFocus:= 3;
end;

procedure TfrmRterm.synIOMouseUp(Sender: TObject;
                                 Button: TMouseButton;
                                 Shift: TShiftState;
                                 X,
                                 Y: Integer);
begin
  frmTinnMain.iSynWithFocus:= 3;
end;

procedure TfrmRterm.synLogEnter(Sender: TObject);
begin
  with frmTinnMain do
    actRtermLogSetFocus.Checked := True;
end;

procedure TfrmRterm.synLogKeyDown(Sender: TObject;
                                  var Key: Word;
                                  Shift: TShiftState);
begin
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
      with frmTinnMain.stbMain do begin
        Panels[7].Text:= '';
        Panels[8].Text:= '';
      end;
      with frmTinnMain.actRtermWarningError do begin
        Visible:= False;
        Checked:= False;
      end;
    end;
  end;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_TAB: begin
                if not frmTinnMain.actRtermVisible.Checked then Exit;
                if not assigned(synLog2) then
                  pgRterm.ActivePageIndex:= 0;
                synIO.SetFocus;
              end;
  end;

  if not bRterm_Running then Exit;
end;

procedure TfrmRterm.synLogKeyUp(Sender: TObject;
                                var Key: Word;
                                Shift: TShiftState);
begin
  frmTinnMain.iSynWithFocus:= 4;
end;

procedure TfrmRterm.synLogMouseUp(Sender: TObject;
                                  Button: TMouseButton;
                                  Shift: TShiftState;
                                  X,
                                  Y: Integer);
begin
  frmTinnMain.iSynWithFocus:= 4;
end;

procedure TfrmRterm.splRIOMoved(Sender: TObject);
begin
  if frmTinnMain.actRtermIOSplitHorizontal.Checked then iSynLog2Height:= synLog2.Height;
  if frmTinnMain.actRtermIOSplitVertical.Checked   then iSynLog2Width := synLog2.Width;
end;

procedure TfrmRterm.RtermSplit(bSplitHorizontal: boolean = True);
begin
  if Assigned(splRIO) then FreeAndNil(splRIO);
  if Assigned(synLog2) then FreeAndNil(synLog2);

  synLog2:= TSynEdit.Create(Self);
  with synLog2 do begin
    OnPaintTransient:= frmTinnMain.synPaintTransient;
    if bSplitHorizontal then begin
      Align:= alBottom;
      if (iSynLog2Height > tbsIO.Height) then synLog2.Height:= 4 * (tbsIO.Height div 5)
                                         else synLog2.Height:= iSynLog2Height
    end
    else begin
      Align:= alRight;
      if (iSynLog2Width > tbsIO.Width) then synLog2.Width:= 2 * (tbsIO.Width div 3)
                                       else synLog2.Width:= iSynLog2Width
    end;
    Parent                := tbsIO;
    BorderStyle           := bsNone;
    HideSelection         := False;
    onPaintTransient      := frmTinnMain.synPaintTransient;
    OnKeyDown             := synLogKeyDown;
    PopupMenu             := frmTinnMain.pmenLog;
    Options               := synIO.Options;
    Gutter                := synIO.Gutter;
    Gutter.ShowlineNumbers:= synIO.Gutter.ShowlineNumbers;
    Font                  := synIO.Font;
    Highlighter           := synIO.Highlighter;
    SelectionMode         := synIO.SelectionMode;
    Options               := synIO.Options;
    WantTabs              := synIO.WantTabs;
    ActiveLineColor       := synIO.ActiveLineColor;
    Color                 := synIO.Color;
    TabWidth              := synIO.TabWidth;
    RightEdge             := synIO.RightEdge;
    RightEdgeColor        := synIO.RightEdgeColor;
    OnKeyUp               := synLog.OnKeyUp;
    OnMouseUp             := synLog.OnMouseUp;
    with Constraints do begin
      MinHeight:= 20;
      MinWidth := 30;
    end;
  end;

  splRIO:= TSplitter.Create(nil);
  with splRIO do begin
    Parent:= tbsIO;
    onMoved:= splRIOMoved;
    Color  := clActiveCaption;
    Beveled:= True;
    if bSplitHorizontal then begin
      Align  := alBottom;
      Height := 3;
      Cursor := crVSplit;
    end
    else begin
      Align  := alRight;
      Width  := 3;
      Cursor := crHSplit;
    end;
  end;
end;

end.
