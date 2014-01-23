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
    rdgTinnToRHotKeys: TRadioGroup;
    stbHotkeys: TStatusBar;
    strgCustom: TStringGrid;
    strgDefault: TStringGrid;
    tbsCustom: TTabSheet;
    tbsDefault: TTabSheet;

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
    procedure rdgTinnToRHotKeysClick(Sender: TObject);
    procedure strgCustomClick(Sender: TObject);
    procedure strgCustomDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgCustomSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure strgDefaultClick(Sender: TObject);
    procedure strgDefaultDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure strgDefaultSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure bbHelpClick(Sender: TObject);

  private
    bNothing: boolean;

    procedure ClearWarnings;
    procedure CreateHotkeyCustom(i: integer; sTmp: string; iRow: Integer);
    procedure CreateHotkeyDefault(i: integer; sTmp: string; iRow: Integer);
    procedure CreateRCustom(i: integer; sTmp: string; iRow: Integer);
    procedure DoHotKeyCustom(Sender: TObject);
    procedure DoHotKeyDefault(Sender: TObject);

  public
    { Public declarations }
    bLocating: boolean;

    procedure AppMessage(var Msg: TMSG; var bHandled: Boolean);
    procedure SetHotkeys(bStatus: boolean);
  end;

var
  frmHotKeys: TfrmHotKeys;

implementation

uses
  ufrmMain,
  uModDados,
  Menus;

{$R *.DFM}

procedure TfrmHotKeys.ClearWarnings;
begin
  with stbHotkeys do begin
    Panels[0].Text:= '';
    Panels[1].Text:= '';
  end;
end;

procedure TfrmHotKeys.SetHotkeys(bStatus: boolean);
var
  i: integer;

begin
  for i:= 1 to 20 do
    with frmTinnMain do begin
      if Assigned(ajavHK[i]) then ajavHK[i].Active:= bStatus;
      if Assigned(ajavHKC[i]) then ajavHKC[i].Active:= bStatus;
    end;
end;

procedure TfrmHotKeys.CreateHotkeyDefault(i: integer;
                                          sTmp: string;
                                          iRow: Integer);
begin
  with frmTinnMain do begin
    ajavHK[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHK[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bTinnRHotKeysActive;
      OnHotKey:= DoHotKeyDefault;
    end;
  end;
    strgDefault.Cells[1,iRow]:= sTmp;
end;

procedure TfrmHotKeys.CreateRCustom(i: integer;
                                    sTmp: string;
                                    iRow: Integer);
begin
  with frmTinnMain do
    aRC[i]:= sTmp;
  strgCustom.Cells[0,iRow]:= sTmp;
end;

procedure TfrmHotKeys.CreateHotkeyCustom(i: integer;
                                         sTmp: string;
                                         iRow: Integer);
begin
  with frmTinnMain do begin
    ajavHKC[i]:= TJvApplicationHotKey.Create(Self);
    with ajavHKC[i] do begin
      HotKey  := TextToShortCut(sTmp);
      Active  := bTinnRHotKeysActive;
      OnHotKey:= DoHotKeyCustom;
    end;
  end;
  strgCustom.Cells[1,iRow]:= sTmp;
end;

procedure TfrmHotKeys.FormCreate(Sender: TObject);
var
  ifHotKeys: TIniFile;
  sTmp     : string;
  aHK      : array[1..20] of string;
  i        : integer;

begin
  // Read the ini file for settings
  ifHotKeys:= TIniFile.Create(frmTinnMain.sPathIniTinn_File);

  // R Hotkeys
  with strgDefault do begin
    for i:= 1 to 20 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys',
                                    'RHK' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        CreateHotkeyDefault(i,
                            sTmp,
                            i);
      end;
    end;
  end;

  // R Custom
  with strgCustom do begin
    for i:= 1 to 20 do begin
      aHK[i]:= ifHotKeys.ReadString('R Custom',
                                    'RC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        CreateRCustom(i,
                      sTmp,
                      i);
      end;
    end;
  end;

  // R Custom Hotkeys
  with strgCustom do begin
    for i:= 1 to 20 do begin
      aHK[i]:= ifHotKeys.ReadString('R Hotkeys Custom',
                                    'RHKC' + IntToStr(i),
                                    '');
      if (aHK[i] <> '') then begin
        sTmp:= aHK[i];
        CreateHotkeyCustom(i,
                           sTmp,
                           i);
      end;
    end;
  end;

  FreeAndNil(ifHotKeys);

  Application.OnMessage:= AppMessage;
  with strgDefault do begin
    Cells[0,0] := 'Action';
    Cells[1,0] := 'Hotkey';
    Cells[0,1] := 'Send: file';
    Cells[0,2] := 'Send: file (echo=TRUE)';
    Cells[0,3] := 'Send: selection';
    Cells[0,4] := 'Send: selection (echo=TRUE)';
    Cells[0,5] := 'Send: clipboard';
    Cells[0,6] := 'Send: clipboard (echo=TRUE)';
    Cells[0,7] := 'Send: marked block';
    Cells[0,8] := 'Send: marked block (echo=TRUE)';
    Cells[0,9] := 'Send: continguous';
    Cells[0,10]:= 'Send: contiguous (echo=TRUE)';
    Cells[0,11]:= 'Send: line';
    Cells[0,12]:= 'Send: lines to end page (echo=TRUE)';
    Cells[0,13]:= 'Editor: line below and top';
    Cells[0,14]:= 'Control: print content (selected)';
    Cells[0,15]:= 'Control: list names (selected)';
    Cells[0,16]:= 'Control: list structure (selected)';
    Cells[0,17]:= 'Control: list all objects';
    Cells[0,18]:= 'Control: clear console';
    Cells[0,19]:= 'Control: close all graphic devices';
    Cells[0,20]:= 'Control: help (selected)';
  end;

  with strgCustom do begin
    Cells[0,0] := 'Action (use %s to word/selection and %f for whole file)';
    Cells[1,0] := 'Hotkey';
  end;

  pgHotkeys.TabIndex:= 0;
end;

procedure TfrmHotKeys.bbHelpClick(Sender: TObject);
begin
  frmTinnMain.OpenUserGuidePDF('"3.6 Hotkeys (operational system)"');
end;

procedure TfrmHotKeys.btnAddHotKeyClick(Sender: TObject);
var
  sTmp: string;
  iRow: integer;

begin
  ClearWarnings;

  case pgHotkeys.TabIndex of
    0: begin
         iRow:= strgDefault.Row;
         with frmTinnMain do begin
           if Assigned(ajavHK[iRow]) then begin
             ajavHK[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK[iRow]);
             strgDefault.Cells[1,iRow]:= '';
           end;
         end;
         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
         CreateHotkeyDefault(iRow,
                             sTmp,
                             iRow);
       end;
    1: begin
         iRow:= strgCustom.Row;
         with frmTinnMain do begin
           if Assigned(ajavHKC[iRow]) then begin
             ajavHKC[iRow].WindowsKey:= True;
             FreeAndNil(ajavHKC[iRow]);
             strgCustom.Cells[1,iRow]:= '';
           end;
         end;
         sTmp:= ShortCutToText(jvhkHotkey.HotKey);
         CreateRCustom(iRow,
                       edHotkey.Text,
                       iRow);
         CreateHotkeyCustom(iRow,
                            sTmp,
                            iRow);
       end;
  end;
end;

procedure TfrmHotKeys.btnRemoveClick(Sender: TObject);
var
  iRow: integer;

begin
  ClearWarnings;

  case pgHotkeys.TabIndex of
    0: begin
         iRow:= strgDefault.Row;
         try
           with frmTinnMain do begin
             ajavHK[iRow].WindowsKey:= True;
             FreeAndNil(ajavHK[iRow]);
           end;
           strgDefault.Cells[1,iRow]:= '';
           jvhkHotkey.HotKey:= TextToShortcut('None');
         except
           MessageDlg('Hotkey not defined yet!',
                  mtInformation,
                  [MBOK],
                  0);
         end;
       end;
    1: begin
         iRow:= strgCustom.Row;
         try
           strgCustom.Cells[0,iRow]:= '';
           with frmTinnMain do begin
             ajavHKC[iRow].WindowsKey:= True;
             FreeAndNil(ajavHKC[iRow]);
           end;
           strgCustom.Cells[1,iRow]:= '';
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
  ClearWarnings;

  case pgHotkeys.TabIndex of
    0: begin
         for i:= 1 to 20 do begin
           with frmTinnMain do begin
             if Assigned(ajavHK[i]) then begin
               ajavHK[i].WindowsKey:= True;
               FreeAndNil(ajavHK[i]);
               strgDefault.Cells[1,i]:= '';
             end;
           end;
         end;
       end;
    1: begin
         for i:= 1 to 20 do begin
           with frmTinnMain do begin
             if Assigned(ajavHKC[i]) then begin
               ajavHKC[i].WindowsKey:= True;
               FreeAndNil(ajavHKC[i]);
               strgCustom.Cells[1,i]:= '';
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

procedure TfrmHotKeys.DoHotKeyDefault(Sender: TObject);
var
  sTmp: string;
  i   : integer;

begin
  //SetForegroundWindow(Application.Handle);
  sTmp:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);
  for i:= 1 to 20 do
  begin
    if (lowercase(strgDefault.Cells[1,i]) = lowercase(sTmp)) then begin
      with frmTinnMain do begin
        (* The below is to see only
          Cells[0,1] := 'Send: file';
          Cells[0,2] := 'Send: file (echo=T)';
          Cells[0,3] := 'Send: selection';
          Cells[0,4] := 'Send: selection (echo=T)';
          Cells[0,5] := 'Send: clipboard';
          Cells[0,6] := 'Send: clipboard (echo=T)';
          Cells[0,7] := 'Send: marked block';
          Cells[0,8] := 'Send: marked block (echo=T)';
          Cells[0,9] := 'Send: contiguous';
          Cells[0,10] := 'Send: contiguous (echo=T)';
          Cells[0,11]:= 'Send: line';
          Cells[0,12]:= 'Send: lines to end page (echo=T)';
          Cells[0,13]:= 'Editor: line below and top';
          Cells[0,14]:= 'Controlling: print content (selected)';
          Cells[0,15]:= 'Control: list names (selected)';
          Cells[0,16]:= 'Control: list structure (selected)';
          Cells[0,17]:= 'Control: list all objects';
          Cells[0,18]:= 'Control: clear console';
          Cells[0,19]:= 'Control: close all graphic devices';
          Cells[0,20]:= 'Control: help (selected)';
        *)
        case i of
           1: if actRSendSourceFile.Enabled            then actRSendSourceFileExecute(nil);
           2: if actRSendFile.Enabled                  then actRSendFileExecute(nil);
           3: if actRSendSourceSelection.Enabled       then actRSendSourceSelectionExecute(nil);
           4: if actRSendSelection.Enabled             then actRSendSelectionExecute(nil);
           5: if actRSendSourceClipboard.Enabled       then actRSendSourceClipboardExecute(nil);
           6: if actRSendClipboard.Enabled             then actRSendClipboardExecute(nil);
           7: if actRSendSourceBlockMarked.Enabled     then actRSendSourceBlockMarkedExecute(nil);
           8: if actRSendBlockMarked.Enabled           then actRSendBlockMarkedExecute(nil);
           9: if actRSendSourceContiguous.Enabled      then actRSendSourceContiguousExecute(nil);
          10: if actRSendContiguous.Enabled            then actRSendContiguousExecute(nil);
          11: if actRSendLine.Enabled                  then actRSendLineExecute(nil);
          12: if actRSendLinesToEndPage.Enabled        then actRSendLinesToEndPageExecute(nil);
          13: if actRCurrentLineToTop.Enabled          then actRCurrentLineToTopExecute(nil);
          14: if actRContPrintVariableContent.Enabled  then actRContPrintVariableContentExecute(nil);
          15: if actRContListVariableNames.Enabled     then actRContListVariableNamesExecute(nil);
          16: if actRContListVariableStructure.Enabled then actRContListVariableStructureExecute(nil);
          17: actRContListAllObjectsExecute(nil);
          18: actRContClearConsoleExecute(nil);
          19: actRContCloseAllGraphicsExecute(nil);
          20: if actRContHelpSelectedWord.Enabled      then actRContHelpSelectedWordExecute(nil);
        end;
      end;
    end;
  end;
end;

procedure TfrmHotKeys.DoHotKeyCustom(Sender: TObject);
var
  sHKC,
   sRC : string;
  i    : integer;

begin
  sHKC:= ShortCutToText((Sender as TJvApplicationHotKey).HotKey);
  for i:= 1 to 20 do begin
    if (lowercase(strgCustom.Cells[1,i]) = lowercase(sHKC)) then begin
      sRC:= trim(strgCustom.Cells[0,i]);
      frmTinnMain.SendRCustom(sRC);
      Exit;
    end;
  end;
end;

procedure TfrmHotKeys.AppMessage(var Msg: TMSG;
                                 var bHandled: Boolean);
begin
  bHandled:= False;
  case Msg.Message of
    WM_SYSKEYDOWN:
      if (Msg.wParam = VK_F4) then bHandled:= True; // don't allow ALT-F4
  end;
end;

procedure TfrmHotKeys.strgCustomClick(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmHotKeys.strgDefaultDrawCell(Sender: TObject;
                                          ACol,
                                          ARow: Integer;
                                          Rect: TRect;
                                          State: TGridDrawState);
begin
(*
  if (arow > 0)  then
     if (odd(arow)) then begin
        strgDefault.Canvas.Font.Color:= clBlack;
        strgDefault.Canvas.Brush.Color:= frmTinnMain.clBGApplication;
     end
     else begin
        strgDefault.Canvas.Font.Color:= clBlack;
        strgDefault.Canvas.Brush.Color:= frmTinnMain.clActiveLine;
     end;
  strgDefault.Canvas.FillRect(Rect); // redesenha a celula
  strgDefault.Canvas.TextOut(Rect.Left+2, Rect.Top, strgDefault.Cells[acol,arow]); // reimprime  o texto.
*)
end;

procedure TfrmHotKeys.strgCustomDrawCell(Sender: TObject;
                                         ACol,
                                         ARow: Integer;
                                         Rect: TRect;
                                         State: TGridDrawState);
begin
(*
  if (arow > 0)  then
     if (odd(arow)) then begin
        strgCustom.Canvas.Font.Color:= clBlack;
        strgCustom.Canvas.Brush.Color:= frmTinnMain.clBGApplication;
     end
     else begin
        strgCustom.Canvas.Font.Color:= clBlack;
        strgCustom.Canvas.Brush.Color:= frmTinnMain.clActiveLine;
     end;
  strgCustom.Canvas.FillRect(Rect); // redesenha a celula
  strgCustom.Canvas.TextOut(Rect.Left+2, Rect.Top, strgCustom.Cells[acol,arow]); // reimprime  o texto.
*)
end;

procedure TfrmHotKeys.strgCustomSelectCell(Sender: TObject;
                                           ACol, ARow:
                                           Integer;
                                           var CanSelect: Boolean);
begin
  ClearWarnings;
  with frmTinnMain do
    if Assigned(ajavHKC[ARow]) then jvhkHotkey.HotKey:= ajavHKC[ARow].HotKey
                               else jvhkHotkey.HotKey:= TextToSHortcut('None');
  edHotkey.Text:= strgCustom.Cells[0,ARow];
end;

procedure TfrmHotKeys.strgDefaultClick(Sender: TObject);
begin
  ClearWarnings;
end;

procedure TfrmHotKeys.strgDefaultSelectCell(Sender: TObject;
                                            ACol,
                                            ARow: Integer;
                                            var CanSelect: Boolean);
begin
  ClearWarnings;
  with frmTinnMain do
    if Assigned(ajavHK[ARow]) then jvhkHotkey.HotKey:= ajavHK[ARow].HotKey
                              else jvhkHotkey.HotKey:= TextToSHortcut('None');
  edHotkey.Text:= strgDefault.Cells[0,ARow];
end;

procedure TfrmHotKeys.rdgTinnToRHotKeysClick(Sender: TObject);
begin
  ClearWarnings;
  with frmTinnMain do begin
    if (rdgTinnToRHotKeys.ItemIndex = 1) then bTinnRHotKeysActive:= True
                                         else bTinnRHotKeysActive:= False;
    SetHotkeys(bTinnRHotKeysActive);
  end;
end;

procedure TfrmHotKeys.FormShow(Sender: TObject);
var
  iRow: integer;

begin
  ClearWarnings;
  with rdgTinnToRHotKeys do
    if (frmTinnMain.bTinnRHotKeysActive = True) then (ItemIndex:= 1)
                                                else (ItemIndex:= 0);

  if (pgHotkeys.TabIndex = 0) then begin
    iRow:= strgDefault.Row;
    edHotkey.Text:= strgDefault.Cells[0,iRow];
    with frmTinnMain do
      if Assigned(ajavHK[iRow]) then jvhkHotkey.HotKey:= ajavHK[iRow].HotKey;
  end
  else begin
    iRow:= strgCustom.Row;
    edHotkey.Text:= strgCustom.Cells[0,iRow];
    with frmTinnMain do
      if Assigned(ajavHKC[iRow]) then jvhkHotkey.HotKey:= ajavHKC[iRow].HotKey;
  end;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
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

    if (pgHotkeys.TabIndex = 0) then begin
      iRow:= strgDefault.Row;
      if Assigned(frmTinnMain.ajavHK[iRow]) then jvhkHotkey.HotKey:= frmTinnMain.ajavHK[iRow].HotKey
                                            else jvhkHotkey.HotKey:= TextToSHortcut('None');
    end
    else begin
      iRow:= strgCustom.Row;
      if Assigned(frmTinnMain.ajavHKC[iRow]) then jvhkHotkey.HotKey:= frmTinnMain.ajavHKC[iRow].HotKey
                                             else jvhkHotkey.HotKey:= TextToSHortcut('None');
    end;
  end
  else ClearWarnings;
  bLocating:= False;
end;

procedure TfrmHotKeys.pgHotkeysChange(Sender: TObject);
var
  iRow: integer;

begin
  if (pgHotkeys.TabIndex = 0) then begin
    iRow:= strgDefault.Row;
    edHotkey.Text:= strgDefault.Cells[0,iRow];
    with frmTinnMain do
      if Assigned(ajavHK[iRow]) then jvhkHotkey.HotKey:= ajavHK[iRow].HotKey;
  end
  else begin
    iRow:= strgCustom.Row;
    edHotkey.Text:= strgCustom.Cells[0,iRow];
    with frmTinnMain do
      if Assigned(ajavHKC[iRow]) then jvhkHotkey.HotKey:= ajavHKC[iRow].HotKey;
  end;
end;

procedure TfrmHotKeys.FormActivate(Sender: TObject);
begin
  with strgDefault do begin
    Color     := frmTinnMain.clBGApplication;
    Font.Color:= frmTinnMain.clFGApplication;
  end;

  with strgCustom do begin
    Color     := frmTinnMain.clBGApplication;
    Font.Color:= frmTinnMain.clFGApplication;
  end;

  pgHotkeys.TabSelectedStyle.BackgrColor:= frmTinnMain.clBGTabSelectedNew;
end;

end.
