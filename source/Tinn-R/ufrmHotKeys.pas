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

unit ufrmHotKeys;

//The two directives below is to
//avoide Unit or symbol "Unit FileCtrl or faArchive etc" is specific to a plataform
//under Delphi 7
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, Dialogs, StdCtrls,
  ComCtrls, ExtCtrls, Grids, inifiles, FileCtrl, JvAppHotKey,
  JvExComCtrls, JvHotKey, JvComCtrls, JvgPage, EditAlign, Graphics, Buttons;

type
  TfrmHotKeys = class(TForm)
    bbHelp: TBitBtn;
    btnAddHotKey: TButton;
    btnClearAllHotKeys: TButton;
    btnOK: TButton;
    btnRemove: TButton;
    edHotkey: TEditAlign;
    GroupBox2: TGroupBox;
    jvhkHotkey: TJvHotKey;
    pgHotkeys: TJvgPageControl;
    rdgTinnRHotKeys: TRadioGroup;
    stbHotkeys: TStatusBar;
    strgHK_CU1: TStringGrid;
    strgHK_Send: TStringGrid;
    tbsCustom_1: TTabSheet;
    tbsSend: TTabSheet;
    tbsControl: TTabSheet;
    tbsCustom_2: TTabSheet;
    strgHK_Control: TStringGrid;
    strgHK_CU2: TStringGrid;

    procedure bbHelpClick(Sender: TObject);
    procedure btnAddHotKeyClick(Sender: TObject);
    procedure btnClearAllHotKeysClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure jvhkHotkeyKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure jvhkHotkeyKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pgHotkeysChange(Sender: TObject);
    procedure rdgTinnRHotKeysClick(Sender: TObject);
    procedure strgHK_CU1Click(Sender: TObject);
    procedure strgHK_CU1DrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgHK_CU1SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strgHK_SendClick(Sender: TObject);
    procedure strgHK_SendDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgHK_SendSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strgHK_ControlSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strgHK_CU2SelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);

  private
    bNothing: boolean;

    procedure pAppMessage(var Msg: TMSG; var bHandled: Boolean);
    procedure pClearWarnings;
    procedure pCreateHotkey_CU1(i: integer; sTmp: string);
    procedure pCreateHotkey_CU2(i: integer; sTmp: string);
    procedure pCreateHotkey_Send(i: integer; sTmp: string);
    procedure pCreateHotkey_Control(i: integer; sTmp: string);
    procedure pCreateR_CU1(i: integer; sTmp: string);
    procedure pCreateR_CU2(i: integer; sTmp: string);
    procedure pDoHotKeyCustom(Sender: TObject);
    procedure pDoHotKeyDefault(Sender: TObject);

  public
    { Public declarations }
    bLocating: boolean;

    procedure pSetHotkeys(bStatus: boolean);
  end;

var
  frmHotKeys: TfrmHotKeys;

implementation

uses
  ufrmMain,
  uModDados,
  Menus;

{$R *.DFM}

procedure TfrmHotKeys.pClearWarnings;
begin
  with stbHotkeys do begin
    Panels[0].Text:= '';
    Panels[1].Text:= '';
  end;
end;

procedure TfrmHotKeys.pSetHotkeys(bStatus: boolean);
var
  i: integer;

begin
  for i:= 1 to 10 do
    with frmMain do begin
      if Assigned(ajavHK_S[i]) then ajavHK_S[i].Active:= bStatus;
      if Assigned(ajavHK_C[i]) then ajavHK_C[i].Active:= bStatus;
      if Assigned(ajavHK_CU1[i]) then ajavHK_CU1[i].Active:= bStatus;
      if Assigned(ajavHK_CU2[i]) then ajavHK_CU2[i].Active:= bStatus;
    end;
end;

procedure TfrmHotKeys.pCreateHotkey_Send(i: integer;
                                         sTmp: string);
begin
  with frmMain do begin
    ajavHK_S[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_S[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKeyDefault;
    end;
  end;
    strgHK_Send.Cells[1,i]:= sTmp;
end;

procedure TfrmHotKeys.pCreateHotkey_Control(i: integer;
                                            sTmp: string);
begin
  with frmMain do begin
    ajavHK_C[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_C[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKeyDefault;
    end;
  end;
    strgHK_Control.Cells[1,i]:= sTmp;
end;

procedure TfrmHotKeys.pCreateR_CU1(i: integer;
                                   sTmp: string);
begin
  with frmMain do
    aR_CU1[i]:= sTmp;
  strgHK_CU1.Cells[0,i]:= sTmp;
end;

procedure TfrmHotKeys.pCreateR_CU2(i: integer;
                                   sTmp: string);
begin
  with frmMain do
    aR_CU2[i]:= sTmp;
  strgHK_CU2.Cells[0,i]:= sTmp;
end;

procedure TfrmHotKeys.pCreateHotkey_CU1(i: integer;
                                        sTmp: string);
begin
  with frmMain do begin
    ajavHK_CU1[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_CU1[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKeyCustom;
    end;
  end;
  strgHK_CU1.Cells[1,i]:= sTmp;
end;

procedure TfrmHotKeys.pCreateHotkey_CU2(i: integer;
                                        sTmp: string);
begin
  with frmMain do begin
    ajavHK_CU2[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK_CU2[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bHotKeys_On;
      OnHotKey:= pDoHotKeyCustom;
    end;
  end;
  strgHK_CU2.Cells[1,i]:= sTmp;
end;

procedure TfrmHotKeys.FormCreate(Sender: TObject);
var
  ifHotKeys: TIniFile;
  sTmp     : string;
  aHK      : array[1..10] of string;
  i        : integer;

begin
  // Read the ini file for settings
  ifHotKeys:= TIniFile.Create(frmMain.sPathIniTinn_File);

  // R Hotkeys Send
  with strgHK_Send do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Send',
                                    'RHK' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_Send(i,
                           sTmp);
      end;
    end;
  end;

  // R Hotkeys Send Control
  with strgHK_Control do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Control',
                                    'RHK' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_Control(i,
                              sTmp);
      end;
    end;
  end;

  // R Action Custom_1
  with strgHK_CU1 do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Action Custom_1',
                                    'RAC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        pCreateR_CU1(i,
                     sTmp);
      end;
    end;
  end;

  // R Action Custom_1 Hotkeys
  with strgHK_CU1 do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Custom_1',
                                    'RHKC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_CU1(i,
                          sTmp);
      end;
    end;
  end;

  // R Action Custom_2
  with strgHK_CU2 do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Action Custom_2',
                                    'RAC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        pCreateR_CU2(i,
                     sTmp);
      end;
    end;
  end;

  // R Custom_2 Hotkeys
  with strgHK_CU2 do begin
    for i:= 1 to 10 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Custom_2',
                                    'RHKC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        pCreateHotkey_CU2(i,
                          sTmp);
      end;
    end;
  end;

  FreeAndNil(ifHotKeys);

  Application.OnMessage:= pAppMessage;
  // Send
  with strgHK_Send do begin
     Cells[0,0]:= 'Action';
     Cells[1,0]:= 'Hotkey';
     Cells[0,1]:= 'Send: file';
     Cells[0,2]:= 'Send: selection';
     Cells[0,3]:= 'Send: clipboard';
     Cells[0,4]:= 'Send: marked block';
     Cells[0,5]:= 'Send: continguous';
     Cells[0,6]:= 'Send: smart';
     Cells[0,7]:= 'Send: line';
     Cells[0,8]:= 'Send: lines to end page';
   end;

  // Control
  with strgHK_Control do begin
    Cells[0,0]:= 'Action';
    Cells[1,0]:= 'Hotkey';
    Cells[0,1]:= 'Control: print content (selected)';
    Cells[0,2]:= 'Control: list names (selected)';
    Cells[0,3]:= 'Control: list structure (selected)';
    Cells[0,4]:= 'Control: list all objects';
    Cells[0,5]:= 'Control: clear console';
    Cells[0,6]:= 'Control: close all graphic devices';
    Cells[0,7]:= 'Control: help (selected)';
  end;

  // R Action Custom_1
  with strgHK_CU1 do begin
    Cells[0,0] := 'Action (use %s to word/selection and %f for whole file)';
    Cells[1,0] := 'Hotkey';
  end;

  // R Action Custom_2
  with strgHK_CU2 do begin
    Cells[0,0] := 'Action (use %s to word/selection and %f for whole file)';
    Cells[1,0] := 'Hotkey';
  end;

  pgHotkeys.TabIndex:= 0;
end;

procedure TfrmHotKeys.bbHelpClick(Sender: TObject);
begin
  frmMain.pOpenUserGuidePDF('"3.5 Hotkeys (operational system)"');
end;

procedure TfrmHotKeys.btnAddHotKeyClick(Sender: TObject);
var
  sTmp: string;
  iRow: integer;

begin
  pClearWarnings;

  case pgHotkeys.TabIndex of
    // Send
    0: begin
         iRow:= strgHK_Send.Row;
         with frmMain do begin
           if Assigned(ajavHK_S[iRow]) then begin
             ajavHK_S[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_S[iRow]);
             strgHK_Send.Cells[1,iRow]:= '';
           end;
         end;
         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
         pCreateHotkey_Send(iRow,
                            sTmp);
       end;

    // Control
    1: begin
         iRow:= strgHK_Control.Row;
         with frmMain do begin
           if Assigned(ajavHK_C[iRow]) then begin
             ajavHK_C[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_C[iRow]);
             strgHK_Control.Cells[1,iRow]:= '';
           end;
         end;
         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
         pCreateHotkey_Control(iRow,
                               sTmp);
       end;

    // R Action Custom_1
    2: begin
         iRow:= strgHK_CU1.Row;
         with frmMain do begin
           if Assigned(ajavHK_CU1[iRow]) then begin
             ajavHK_CU1[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_CU1[iRow]);
             strgHK_CU1.Cells[1,iRow]:= '';
           end;
         end;
         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
         pCreateR_CU1(iRow,
                      edHotkey.Text);
         pCreateHotkey_CU1(iRow,
                           sTmp);
       end;

    // R Action Custom_2
    3: begin
         iRow:= strgHK_CU2.Row;
         with frmMain do begin
           if Assigned(ajavHK_CU2[iRow]) then begin
             ajavHK_CU2[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_CU2[iRow]);
             strgHK_CU2.Cells[1,iRow]:= '';
           end;
         end;
         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
         pCreateR_CU2(iRow,
                      edHotkey.Text);
         pCreateHotkey_CU2(iRow,
                           sTmp);
       end;
  end;
end;

procedure TfrmHotKeys.btnRemoveClick(Sender: TObject);
var
  iRow: integer;

begin
  pClearWarnings;

  case pgHotkeys.TabIndex of
    // Send
    0: begin
         iRow:= strgHK_Send.Row;
         try
           with frmMain do begin
             ajavHK_S[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_S[iRow]);
           end;
           strgHK_Send.Cells[1,iRow]:= '';
           jvhkHotkey.HotKey:= TextToShortcut('None');
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;

    // Control
    1: begin
         iRow:= strgHK_Control.Row;
         try
           with frmMain do begin
             ajavHK_C[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_C[iRow]);
           end;
           strgHK_Control.Cells[1,iRow]:= '';
           jvhkHotkey.HotKey:= TextToShortcut('None');
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;

    // R Action Custom_1
    2: begin
         iRow:= strgHK_CU1.Row;
         try
           strgHK_CU1.Cells[0,iRow]:= '';
           with frmMain do begin
             ajavHK_CU1[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_CU1[iRow]);
           end;
           strgHK_CU1.Cells[1,iRow]:= '';
           jvhkHotkey.HotKey:= TextToShortcut('None');
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;

    // R Action Custom_2
    3: begin
         iRow:= strgHK_CU2.Row;
         try
           strgHK_CU2.Cells[0,iRow]:= '';
           with frmMain do begin
             ajavHK_CU2[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK_CU2[iRow]);
           end;
           strgHK_CU2.Cells[1,iRow]:= '';
           jvhkHotkey.HotKey:= TextToShortcut('None');
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;
  end;
end;

procedure TfrmHotKeys.btnClearAllHotKeysClick(Sender: TObject);
var
  i: Integer;

begin
  pClearWarnings;

  case pgHotkeys.TabIndex of
    // Send
    0: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_S[i]) then begin
               ajavHK_S[i].WindowsKey:= True;
               FreeAndNil(ajavHK_S[i]);
               strgHK_Send.Cells[1,i]:= '';
             end;
           end;
         end;
       end;

    // Control
    1: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_C[i]) then begin
               ajavHK_C[i].WindowsKey:= True;
               FreeAndNil(ajavHK_C[i]);
               strgHK_Send.Cells[1,i]:= '';
             end;
           end;
         end;
       end;

    // R Action Custom_1
    2: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_CU1[i]) then begin
               ajavHK_CU1[i].WindowsKey:= True;
               FreeAndNil(ajavHK_CU1[i]);
               strgHK_CU1.Cells[1,i]:= '';
             end;
           end;
         end;
       end;

    // R Action Custom_2
    3: begin
         for i:= 1 to 10 do begin
           with frmMain do begin
             if Assigned(ajavHK_CU2[i]) then begin
               ajavHK_CU2[i].WindowsKey:= True;
               FreeAndNil(ajavHK_CU2[i]);
               strgHK_CU2.Cells[1,i]:= '';
             end;
           end;
         end;
       end;
  end;
end;

procedure TfrmHotKeys.btnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHotKeys.pDoHotKeyDefault(Sender: TObject);
var
  sTmp: string;

  i: integer;

begin
  //SetForegroundWindow(Application.Handle);
  sTmp:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);
  for i:= 1 to 10 do
    if (lowercase(strgHK_Send.Cells[1,i]) = lowercase(sTmp)) then
      with frmMain do
        (* The below is to see only
           Cells[0,1]:= 'Send: file';
           Cells[0,2]:= 'Send: selection';
           Cells[0,3]:= 'Send: clipboard';
           Cells[0,4]:= 'Send: marked block';
           Cells[0,5]:= 'Send: contiguous';
           Cells[0,6]:= 'Send: smart';
           Cells[0,7]:= 'Send: line';
           Cells[0,8]:= 'Send: lines to end page (echo=T)';
        *)
        case i of
           1: if actRSendFile.Enabled                  then actRSendFileExecute(nil);
           2: if actRSendSelection.Enabled             then actRSendSelectionExecute(nil);
           3: if actRSendClipboard.Enabled             then actRSendClipboardExecute(nil);
           4: if actRSendBlockMarked.Enabled           then actRSendBlockMarkedExecute(nil);
           5: if actRSendContiguous.Enabled            then actRSendContiguousExecute(nil);
           6: if actRSendSmart.Enabled                 then actRSendSmartExecute(nil);
           7: if actRSendLine.Enabled                  then actRSendLineExecute(nil);
           8: if actRSendLinesToEndPage.Enabled        then actRSendLinesToEndPageExecute(nil);
        end;

  for i:= 1 to 10 do
    if (lowercase(strgHK_Control.Cells[1,i]) = lowercase(sTmp)) then
      with frmMain do
        (* The below is to see only
           Cells[0,1]:= 'Controlling: print content (selected)';
           Cells[0,2]:= 'Control: list names (selected)';
           Cells[0,3]:= 'Control: list structure (selected)';
           Cells[0,4]:= 'Control: list all objects';
           Cells[0,5]:= 'Control: clear console';
           Cells[0,6]:= 'Control: close all graphic devices';
           Cells[0,7]:= 'Control: help (selected)';
        *)
        case i of
           1: if actRContPrintVariableContent.Enabled  then actRContPrintVariableContentExecute(nil);
           2: if actRContListVariableNames.Enabled     then actRContListVariableNamesExecute(nil);
           3: if actRContListVariableStructure.Enabled then actRContListVariableStructureExecute(nil);
           4: actRContListAllObjectsExecute(nil);
           5: actRContClearConsoleExecute(nil);
           6: actRContCloseAllGraphicsExecute(nil);
           7: if actRContHelpSelectedWord.Enabled      then actRContHelpSelectedWordExecute(nil);
        end;
end;

procedure TfrmHotKeys.pDoHotKeyCustom(Sender: TObject);
var
  sHKC,
   sRC: string;

  i: integer;

begin
  sHKC:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);

  // R Action Custom_1
  for i:= 1 to 10 do begin
    if (lowercase(strgHK_CU1.Cells[1,i]) = lowercase(sHKC)) then begin
      sRC:= trim(strgHK_CU1.Cells[0,i]);
      frmMain.pSendRCustom(sRC);
      Exit;
    end;
  end;

  // R Action Custom_2
  for i:= 1 to 10 do begin
    if (lowercase(strgHK_CU2.Cells[1,i]) = lowercase(sHKC)) then begin
      sRC:= trim(strgHK_CU2.Cells[0,i]);
      frmMain.pSendRCustom(sRC);
      Exit;
    end;
  end;
end;

procedure TfrmHotKeys.pAppMessage(var Msg: TMSG;
                                  var bHandled: Boolean);
begin
  bHandled:= False;
  case Msg.Message of
    WM_SYSKEYDOWN:
      if (Msg.wParam = VK_F4) then bHandled:= True; // don't allow ALT-F4
  end;
end;

procedure TfrmHotKeys.strgHK_ControlSelectCell(Sender: TObject;
                                               ACol,
                                               ARow: Integer;
                                               var CanSelect: Boolean);
begin
  jvhkHotkey.Enabled:= (strgHK_Control.Cells[0,ARow] <> EmptyStr);
  pClearWarnings;
  with frmMain do
    if Assigned(ajavHK_C[ARow]) then jvhkHotkey.HotKey:= ajavHK_C[ARow].HotKey
                                else jvhkHotkey.HotKey:= TextToSHortcut('None');
  edHotkey.Text:= strgHK_Control.Cells[0,ARow];
end;

procedure TfrmHotKeys.strgHK_CU1Click(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmHotKeys.strgHK_SendDrawCell(Sender: TObject;
                                          ACol,
                                          ARow: Integer;
                                          Rect: TRect;
                                          State: TGridDrawState);
begin
(*
  if (arow > 0)  then
     if (odd(arow)) then begin
        strgDefault.Canvas.Font.Color:= clBlack;
        strgDefault.Canvas.Brush.Color:= frmMain.clBGApplication;
     end
     else begin
        strgDefault.Canvas.Font.Color:= clBlack;
        strgDefault.Canvas.Brush.Color:= frmMain.clActiveLine;
     end;
  strgDefault.Canvas.FillRect(Rect); // redesenha a celula
  strgDefault.Canvas.TextOut(Rect.Left+2, Rect.Top, strgDefault.Cells[acol,arow]); // reimprime  o texto.
*)
end;

procedure TfrmHotKeys.strgHK_CU1DrawCell(Sender: TObject;
                                         ACol,
                                         ARow: Integer;
                                         Rect: TRect;
                                         State: TGridDrawState);
begin
(*
  if (arow > 0)  then
     if (odd(arow)) then begin
        strgCustom.Canvas.Font.Color:= clBlack;
        strgCustom.Canvas.Brush.Color:= frmMain.clBGApplication;
     end
     else begin
        strgCustom.Canvas.Font.Color:= clBlack;
        strgCustom.Canvas.Brush.Color:= frmMain.clActiveLine;
     end;
  strgCustom.Canvas.FillRect(Rect); // redesenha a celula
  strgCustom.Canvas.TextOut(Rect.Left+2, Rect.Top, strgCustom.Cells[acol,arow]); // reimprime  o texto.
*)
end;

procedure TfrmHotKeys.strgHK_CU1SelectCell(Sender: TObject;
                                           ACol, ARow:
                                           Integer;
                                           var CanSelect: Boolean);
begin
  pClearWarnings;
  with frmMain do
    if Assigned(ajavHK_CU1[ARow]) then jvhkHotkey.HotKey:= ajavHK_CU1[ARow].HotKey
                                  else jvhkHotkey.HotKey:= TextToSHortcut('None');
  edHotkey.Text:= strgHK_CU1.Cells[0,ARow];
end;

procedure TfrmHotKeys.strgHK_CU2SelectCell(Sender: TObject;
                                           ACol,
                                           ARow: Integer;
                                           var CanSelect: Boolean);
begin
  pClearWarnings;
  with frmMain do
    if Assigned(ajavHK_CU2[ARow]) then jvhkHotkey.HotKey:= ajavHK_CU2[ARow].HotKey
                                  else jvhkHotkey.HotKey:= TextToSHortcut('None');
  edHotkey.Text:= strgHK_CU2.Cells[0,ARow];
end;

procedure TfrmHotKeys.strgHK_SendClick(Sender: TObject);
begin
  pClearWarnings;
end;

procedure TfrmHotKeys.strgHK_SendSelectCell(Sender: TObject;
                                            ACol,
                                            ARow: Integer;
                                            var CanSelect: Boolean);
begin
  jvhkHotkey.Enabled:= (strgHK_Send.Cells[0,ARow] <> EmptyStr);
  pClearWarnings;
  with frmMain do
    if Assigned(ajavHK_S[ARow]) then jvhkHotkey.HotKey:= ajavHK_S[ARow].HotKey
                                else jvhkHotkey.HotKey:= TextToSHortcut('None');
  edHotkey.Text:= strgHK_Send.Cells[0,ARow];
end;

procedure TfrmHotKeys.rdgTinnRHotKeysClick(Sender: TObject);
begin
  pClearWarnings;
  with frmMain do begin
    if (rdgTinnRHotKeys.ItemIndex = 0) then bHotKeys_On:= True
                                       else bHotKeys_On:= False;
    pSetHotkeys(bHotKeys_On);
  end;
end;

procedure TfrmHotKeys.FormShow(Sender: TObject);
var
  iRow: integer;

begin
  pClearWarnings;

  with rdgTinnRHotKeys do
    if (frmMain.bHotKeys_On= True) then (ItemIndex:= 0)
                                   else (ItemIndex:= 1);

  case pgHotkeys.TabIndex of
    // Send
    0: begin
         edHotkey.ReadOnly:= True;
         iRow:= strgHK_Send.Row;
         edHotkey.Text:= strgHK_Send.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_S[iRow]) then jvhkHotkey.HotKey:= ajavHK_S[iRow].HotKey;
       end;

    // Control
    1: begin
         edHotkey.ReadOnly:= True;
         iRow:= strgHK_Control.Row;
         edHotkey.Text:= strgHK_Control.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_C[iRow]) then jvhkHotkey.HotKey:= ajavHK_C[iRow].HotKey;
       end;

    // R Action Custom_1
    2: begin
         edHotkey.ReadOnly:= False;
         iRow:= strgHK_CU1.Row;
         edHotkey.Text:= strgHK_CU1.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_CU1[iRow]) then jvhkHotkey.HotKey:= ajavHK_CU1[iRow].HotKey;
       end;

    // R Action Custom_2
    3: begin
         edHotkey.ReadOnly:= False;
         iRow:= strgHK_CU2.Row;
         edHotkey.Text:= strgHK_CU2.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_CU2[iRow]) then jvhkHotkey.HotKey:= ajavHK_CU2[iRow].HotKey;
       end;
  end;

  AlphaBlendValue:= frmMain.iAlphaBlendValue;
end;

procedure TfrmHotKeys.jvhkHotkeyKeyDown(Sender: TObject;
                                        var Key: Word;
                                        Shift: TShiftState);
begin
  if (Key = VK_BACK)   or
     (Key = VK_DELETE) or
     (Key = VK_SPACE) then begin
    Key:= 0;
    bNothing:= True
  end;
end;

procedure TfrmHotKeys.jvhkHotkeyKeyUp(Sender: TObject;
                                      var Key: Word;
                                      Shift: TShiftState);
var
  pTmp :  pointer;
  iRow : integer;

begin
  if bNothing then begin
    bNothing:= False;
    Exit;
  end;

  if (Key = VK_CONTROL) or
     (Key = VK_MENU) or
     (Key = VK_SHIFT) or
     (Key = VK_SPACE) then Exit;

  with modDados.cdShortcuts do begin
    pTmp:= GetBookmark;
    DisableControls;
    Filtered:= False;
  end;

  bLocating:= True;
  if (modDados.cdShortcuts.Locate('Shortcut',
                                   StringReplace(ShortcutToText(jvhkHotkey.Hotkey),
                                                 ' ',
                                                 '',
                                                 []),
                                   []) = True) then begin

    with modDados.cdShortcuts do begin
      Filtered:= True;
      EnableControls;
      if BookmarkValid(pTmp) then begin
        GoToBookmark(pTmp);
        FreeBookmark(pTmp);
      end;
    end;
    stbHotkeys.Panels[0].Text:= 'Keyboard shortcut already in use';
    stbHotkeys.Panels[1].Text:= '<' +
                                StringReplace(ShortcutToText(jvhkHotkey.Hotkey),
                                              ' ',
                                              '',
                                              []) +
                                '>';

    case pgHotkeys.TabIndex of
      // Send
      0: begin
           iRow:= strgHK_Send.Row;
           if Assigned(frmMain.ajavHK_S[iRow]) then jvhkHotkey.HotKey:= frmMain.ajavHK_S[iRow].HotKey
                                               else jvhkHotkey.HotKey:= TextToSHortcut('None');
         end;

      // Control
      1: begin
           iRow:= strgHK_Control.Row;
           if Assigned(frmMain.ajavHK_C[iRow]) then jvhkHotkey.HotKey:= frmMain.ajavHK_C[iRow].HotKey
                                               else jvhkHotkey.HotKey:= TextToSHortcut('None');
         end;

      // R Action Custom_1
      2: begin
           iRow:= strgHK_CU1.Row;
           if Assigned(frmMain.ajavHK_CU1[iRow]) then jvhkHotkey.HotKey:= frmMain.ajavHK_CU1[iRow].HotKey
                                                 else jvhkHotkey.HotKey:= TextToSHortcut('None');
         end;

      // R Action Custom_2
      3: begin
           iRow:= strgHK_CU2.Row;
           if Assigned(frmMain.ajavHK_CU2[iRow]) then jvhkHotkey.HotKey:= frmMain.ajavHK_CU2[iRow].HotKey
                                                 else jvhkHotkey.HotKey:= TextToSHortcut('None');
         end;
    end;
  end
  else pClearWarnings;
  bLocating:= False;
end;

procedure TfrmHotKeys.pgHotkeysChange(Sender: TObject);
var
  iRow: integer;

begin
  case pgHotkeys.TabIndex of
    // Send
    0: begin
         edHotkey.ReadOnly:= True;
         iRow:= strgHK_Send.Row;
         jvhkHotkey.Enabled:= (strgHK_Send.Cells[0,iRow] <> EmptyStr);
         edHotkey.Text:= strgHK_Send.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_S[iRow]) then jvhkHotkey.HotKey:= ajavHK_S[iRow].HotKey
                                       else jvhkHotkey.HotKey:= TextToSHortcut('None');
       end;

    // Control
    1: begin
         edHotkey.ReadOnly:= True;
         iRow:= strgHK_Control.Row;
         jvhkHotkey.Enabled:= (strgHK_Send.Cells[0,iRow] <> EmptyStr);
         edHotkey.Text:= strgHK_Control.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_C[iRow]) then jvhkHotkey.HotKey:= ajavHK_C[iRow].HotKey
                                       else jvhkHotkey.HotKey:= TextToSHortcut('None');
       end;

    // R Action Custom_1
    2: begin
         edHotkey.ReadOnly:= False;
         iRow:= strgHK_CU1.Row;
         jvhkHotkey.Enabled:= True;
         edHotkey.Text:= strgHK_CU1.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_CU1[iRow]) then jvhkHotkey.HotKey:= ajavHK_CU1[iRow].HotKey
                                         else jvhkHotkey.HotKey:= TextToSHortcut('None');
       end;

    // R Action Custom_2
    3: begin
         edHotkey.ReadOnly:= False;
         iRow:= strgHK_CU2.Row;
         jvhkHotkey.Enabled:= True;
         edHotkey.Text:= strgHK_CU2.Cells[0,iRow];
         with frmMain do
           if Assigned(ajavHK_CU2[iRow]) then jvhkHotkey.HotKey:= ajavHK_CU2[iRow].HotKey
                                         else jvhkHotkey.HotKey:= TextToSHortcut('None');
       end;
  end;
end;

procedure TfrmHotKeys.FormActivate(Sender: TObject);
begin
  // Send
  with strgHK_Send do begin
    Color     := frmMain.clBGApplication;
    Font.Color:= frmMain.clFGApplication;
  end;

  // Control
  with strgHK_Control do begin
    Color     := frmMain.clBGApplication;
    Font.Color:= frmMain.clFGApplication;
  end;

  // R Action Custom_1
  with strgHK_CU1 do begin
    Color     := frmMain.clBGApplication;
    Font.Color:= frmMain.clFGApplication;
  end;

  // R Action Custom_2
  with strgHK_CU2 do begin
    Color     := frmMain.clBGApplication;
    Font.Color:= frmMain.clFGApplication;
  end;

  pgHotkeys.TabSelectedStyle.BackgrColor:= frmMain.clBGTabSelectedNew;
end;

end.
