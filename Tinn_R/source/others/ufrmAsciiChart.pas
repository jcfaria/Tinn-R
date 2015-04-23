// Thanks guys!

{  A form that displays a character chart for use with delphi.
   Nominally intended for inclusion with GExperts an excellent collection
   of Delphi experts by Gerald Nunn - gnunn@interlog.com}
{ Disclaimer : This code is freeware.
               It may be used by anyone in any way that they desire.
               if this code or any derivative of it causes the outbreak
               of World War 3 or any lesser event then you assume
               all responsibility for such actions.
      Regards,
               Taz Higgins - taz@taz.compulink.co.uk © 1997}

{Added in the following features and fixes/updates in 1.04
1)  Save and Restore the text in the text box to the registry
2)  Draw in all the 0-31 characters as the ASCII code
3)  Added in a pair of toogle button that displays the character value as
 either Integer or Hex.
4)  Tidied up the formcreate routine a little, moved the windowplacement
 stuff to the end so that drawing hapens at the correct time, and removed
 many unnecessary begin/end blocks.
5)  Removes the 3 font sizing buttons and replaced them with an editbox/updown
 so that it's much smoother, and you can have whatever font size you want, not
 being restricted to the pregenerated sizes.  Limits 6 to 20.
6)  I check that I am changing fontsize to remove an unnecessary redraw if
 clicking on the same size menu choice as already selected.
7)  Use setbounds rather than left then width in formresize and in
 showfontpalette to improve drawing of the edit box a little.
8)  Updated the formpaint routine to improve the drawing speed and reduce
 screen flicker by removing the frame3d routine and inlining it, in
 dedicated routines, drawing left and top first, then changing pen
 and drawing bottom and right.  Lots of reductions in assignments to the
 canvas which really speeds things up.
9)  Added OldHorizMult and OldVertMult variables to the form, used in the
 formsize to determine if we really need to redrawn the screen in order
 to reduce screen flicker on resizing.  Makes a big difference
10) Changed the fontsize routine to cast the sender as TComponent to read
 the tag property from - makes it more generic.
11) Modified the DrawCharacter routine to accept the passed HorizMult and
 VertMult values already calculated, that way I don't need to
 recalculate them in the DrawCharacter routine speeds drawing up.
12) Moved the form level variables to be private rather than public.  They
 don't need to be public, so they shouldn't be.
13) The fontsize of the textbox now fixed at 8 pt.  No need to vary it and it
 solves a problem with large fonts
14) Changed the drawcharacters routine to solve incorrect clipping/drawing
 problems - text will get clipped at the frame edges for that cell.
15) Changed the MinMax sizes to use the systemmetrics frame and caption sizes
 so that things are sized better.
16) Added in some custom hint processing when over characters values 0-31 to show
 a textual interpretation of the character.  When over any other character it
 shows a larger version of that character.  The font used is always that of the
 form, the size is adjustable, using the value as stored in
 'Software\Gexperts\character chart\Zoom Font Size'
 Gerald, perhaps you should add something for this in gexperts config;
19) Changed the requirements to double click to put chartacters in the edit box
 to be a single click instead.
}

(*
 The original code was modified under
 the GPL by José Cláudio Faria
*)

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

unit ufrmAsciiChart;

//The two directives below is to
//avoide Unit or symbol "Unit FileCtrl or faArchive etc" is specific to a plataform
//under Delphi 7
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
  SysUtils,
  Windows,
  Messages,
  Graphics,
  Forms,
  ExtCtrls,
  Controls,
  Classes,
  StdCtrls,
  Buttons,
  Menus,
  IniFiles,
  ComCtrls,
  uFrmMain;

type
  TfrmAsciiChart = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    btnCharHigh: TSpeedButton;
    FontComboName: TComboBox;
    PopupMenu1: TPopupMenu;
    ShowFontPalette1: TMenuItem;
    N1: TMenuItem;
    ShowLowCharacters1: TMenuItem;
    ShowHighCharacters1: TMenuItem;
    N2: TMenuItem;
    FontSize8: TMenuItem;
    FontSize10: TMenuItem;
    FontSize12: TMenuItem;
    N3: TMenuItem;
    btnCharInt: TSpeedButton;
    N4: TMenuItem;
    CVInt: TMenuItem;
    CVHex: TMenuItem;
    HintTimer: TTimer;
    FontSizeEdit: TEdit;
    FontSizeUpDown: TUpDown;
    btnCharLow: TSpeedButton;
    btnCharHex: TSpeedButton;
    StatusBar: TStatusBar;
    HintActive1: TMenuItem;
    Help: TMenuItem;
    sbtnValue: TSpeedButton;
    sbtnChar: TSpeedButton;
    txtChars: TEdit;
    procedure Formpaint(Sender: TObject);
    procedure btnCharHighClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FontComboNameChange(Sender: TObject);
    procedure btnSizeClick(Sender: TObject);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure ShowFontPalette1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure btnCharIntClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure HintTimerTimer(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FontSizeUpDownClick(Sender: TObject; Button: TUDBtnType);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FontSizeEditChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HintActive1Click(Sender: TObject);
    procedure FontComboNameEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnValueClick(Sender: TObject);
    procedure sbtnCharClick(Sender: TObject);
  private
    AutoClearText: Boolean;
    ClickClose: Boolean;
    BaseNum: Integer;
    CharPos: Integer;
    FontSize: Integer;
    FontName: string;
    ShowFontPalette: Boolean;
    ShowHex: Boolean;
    OldHorizMult: Integer;
    OldVertMult: Integer;
    FActive: Boolean;
    FHint: THintWindow;
    OldCharPos: Integer;
    ZoomFontSize: Integer;
    procedure WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure DrawCharacter(const CharValue: Integer; const CharText: string; const HorizMult, VertMult: Integer);
    procedure GetFonts;
    procedure SetFontName(const NewFontName: string);
    procedure KillHint;
    procedure ApplyText;
  public
    { Public declarations }
    procedure DoHint(Sender: TObject);
    procedure DoDeactivate(Sender: TObject);
  end;

var
  frmAsciiChart: TfrmAsciiChart = nil;

implementation

{$R *.DFM}

uses
  ufrmEditor;

const
  DescLow: array[0..31] of string =
  ('Null', 'Start of Header', 'Start of Text', 'end of Text',
    'end of Transmission', 'Enquiry', 'Acknowledgement', 'Bell',
    'Backspace', 'Horizontal Tab', 'Linefeed', 'Vertical Tab',
    'Form Feed', 'Carriage Return', 'Shift Out', 'Shift in',
    'Delete', 'Device Control 1', 'Device Control 2', 'Device Control 3',
    'Device Control 4', 'Negative Acknowledge', 'Synchronize', 'end Block',
    'Cancel', 'end Message', 'Sub', 'Escape',
    'Form Separator', 'Group Separator', 'Record Separator', 'Unit Separator');

  secASCIIChart = 'ASCII Chart';

procedure TfrmAsciiChart.FormShow(Sender: TObject);
begin
  SetFontName(FontName);
end;

procedure TfrmAsciiChart.FormCreate(Sender: TObject);
begin
  GetFonts;
  AutoClearText := True;
  ClickClose := True;
  BaseNum := 0;
  FontSize := 8;
  FontName := frmTinnMain.coEditor.Font.Name;
  ShowFontPalette := True;
  ShowHex := False;
  OldHorizMult := 0;
  OldVertMult := 0;
  ZoomFontSize := 32;

  if BaseNum = 0 then
    btnCharLow.Down := True
  else
    btnCharHigh.Down := True;

  if ShowHex = True then
    btnCharHex.Down := True
  else
    btnCharInt.Down := True;

  sbtnChar.Down := True;

  FontSizeUpDown.Position := FontSize;
  ShowFontPalette := not ShowFontPalette;
  ShowFontPalette1Click(Self);
  Application.OnHint := DoHint;
  Application.OnDeactivate := DoDeactivate;
end;

procedure TfrmAsciiChart.FormDestroy(Sender: TObject);
begin
  frmAsciiChart := nil;
end;

procedure TfrmAsciiChart.Formpaint(Sender: TObject);
var
  I, J: Integer; { general loop counters }
  X, Y: Integer; { screen pixel locations }
  HorizMult, VertMult: Integer; { logical screen width/height segments }
  Start: Integer; { low charnum for character rendering }
begin
  if BaseNum = 0 then Start := 32 else Start := 0;
  HorizMult := Self.ClientWidth div 8;
  VertMult := (Self.ClientHeight - Panel1.Height - StatusBar.Height) div 16;
  Canvas.Brush.Style := BsClear;
  Canvas.Font.Name := 'MS Sans Serif'; // do not localize
  Canvas.Font.Size := 8;
  Canvas.Font.Color := clGrayText;
  if ShowHex then begin
    for I := 0 to 127 do begin
      X := I div 16;
      Y := I mod 16;
      Canvas.TextOut(X * HorizMult + 2, Y * VertMult + 28, IntToHex(BaseNum + I, 2));
    end;
  end
  else begin
    for I := 0 to 127 do begin
      X := I div 16;
      Y := I mod 16;
      Canvas.TextOut(X * HorizMult + 2, Y * VertMult + 28, IntToStr(BaseNum + I));
    end;
  end;
  Canvas.Font.Color := clWindowText;
  if BaseNum = 0 then begin
    DrawCharacter(0, 'NUL', HorizMult, VertMult); // Ctrl @, NULL
    DrawCharacter(1, 'SOH', HorizMult, VertMult); // Ctrl A, Start of Header
    DrawCharacter(2, 'STX', HorizMult, VertMult); // Ctrl B,Start of Text
    DrawCharacter(3, 'ETX', HorizMult, VertMult); // Ctrl C,end of Text
    DrawCharacter(4, 'EOT', HorizMult, VertMult); // Ctrl D,end of Transmission
    DrawCharacter(5, 'ENQ', HorizMult, VertMult); // Ctrl E,Enquiry
    DrawCharacter(6, 'ACK', HorizMult, VertMult); // Ctrl F,Acknowlodge
    DrawCharacter(7, 'BEL', HorizMult, VertMult); // Ctrl G,Bell
    DrawCharacter(8, 'BS', HorizMult, VertMult); // Ctrl H,Backspace
    DrawCharacter(9, 'TAB', HorizMult, VertMult); // Ctrl I,Horizontal Tab
    DrawCharacter(10, 'LF', HorizMult, VertMult); // Ctrl J,Linefeed
    DrawCharacter(11, 'VT', HorizMult, VertMult); // Ctrl K,Vertical Tab
    DrawCharacter(12, 'FF', HorizMult, VertMult); // Ctrl L,Form Feed
    DrawCharacter(13, 'CR', HorizMult, VertMult); // Ctrl M,Carridge Return
    DrawCharacter(14, 'SO', HorizMult, VertMult); // Ctrl N,Shift Out
    DrawCharacter(15, 'SI', HorizMult, VertMult); // Ctrl O,Shift in
    DrawCharacter(16, 'DLE', HorizMult, VertMult); // Ctrl P,Delete
    DrawCharacter(17, 'DC1', HorizMult, VertMult); // Ctrl Q,Device Control 1
    DrawCharacter(18, 'DC2', HorizMult, VertMult); // Ctrl R,Device Control 2
    DrawCharacter(19, 'DC3', HorizMult, VertMult); // Ctrl S,Device Control 3
    DrawCharacter(20, 'DC4', HorizMult, VertMult); // Ctrl T,Device Control 4
    DrawCharacter(21, 'NAK', HorizMult, VertMult); // Ctrl U,Negative Acknowledge
    DrawCharacter(22, 'SYN', HorizMult, VertMult); // Ctrl V,Synchronise
    DrawCharacter(23, 'ETB', HorizMult, VertMult); // Ctrl W,end Block ??
    DrawCharacter(24, 'CAN', HorizMult, VertMult); // Ctrl X,Cancel
    DrawCharacter(25, 'EM', HorizMult, VertMult); // Ctrl Y,end Message
    DrawCharacter(26, 'SUB', HorizMult, VertMult); // Ctrl Z,Sub
    DrawCharacter(27, 'ESC', HorizMult, VertMult); // Ctrl [,Escape
    DrawCharacter(28, 'FS', HorizMult, VertMult); // Ctrl \,Form Separator
    DrawCharacter(29, 'GS', HorizMult, VertMult); // Ctrl ],Group Separator
    DrawCharacter(30, 'RS', HorizMult, VertMult); // Ctrl ^,Record Separator
    DrawCharacter(31, 'US', HorizMult, VertMult); // Ctrl _,Unit Separator
  end;

  with Canvas.Font do begin
    Name := FontName;
    Size := FontSize;
  end;

  for I := Start to 127 do
    DrawCharacter(I, Chr(BaseNum + I), HorizMult, VertMult);

  Canvas.Pen.Width := 1;
  Canvas.Pen.Style := PsSolid;
  Canvas.Pen.Color := clBtnHighlight;
  for I := 0 to 7 do
    for J := 0 to 15 do
      Canvas.Polyline([Point(I * HorizMult, (J + 1) * VertMult + 24),
        Point(I * HorizMult, J * VertMult + 25),
          Point((I + 1) * HorizMult - 1, J * VertMult + 25)]);
  Canvas.Pen.Color := clBtnShadow;
  for I := 0 to 7 do
    for J := 0 to 15 do
      Canvas.Polyline([Point((I + 1) * HorizMult - 1, J * VertMult + 25),
        Point((I + 1) * HorizMult - 1, (J + 1) * VertMult + 24),
          Point(I * HorizMult - 1, (J + 1) * VertMult + 24)]);
end;

procedure TfrmAsciiChart.DrawCharacter(const CharValue: Integer; const CharText: string; const HorizMult, VertMult: Integer);
var
  X, Y: Integer; { Screen Locations }
  MyRect: TRect; { general drawing reectangle }
  VOffset, HOffset: Integer; { V and H offsets for bounding box of character in font }
begin
  X := CharValue div 16;
  Y := CharValue mod 16;
  VOffset := (VertMult - Canvas.TextHeight(CharText)) div 2;
  HOffset := (HorizMult - 24 - Canvas.TextWidth(CharText)) div 2;
  MyRect.Left := X * HorizMult + 24;
  MyRect.Right := (X + 1) * HorizMult;
  MyRect.Top := Y * VertMult + 26;
  MyRect.Bottom := (Y + 1) * VertMult + 26;
  Canvas.TextRect(MyRect, MyRect.Left + HOffset, MyRect.Top + VOffset, CharText);
end;

procedure TfrmAsciiChart.FormResize(Sender: TObject);
var
  HorizMult, VertMult: Integer; { logical screen width/height segments }
begin
  if ShowFontPalette then
    txtChars.SetBounds(284, 0, Self.ClientWidth - 284, txtChars.Height)
  else
    txtChars.SetBounds(0, 0, Self.ClientWidth, txtChars.Height);
  HorizMult := Self.ClientWidth div 8;
  VertMult := (Self.ClientHeight - Panel1.Height - StatusBar.Height) div 16;
  if (HorizMult <> OldHorizMult) or (VertMult <> OldVertMult) then begin
    OldHorizMult := HorizMult;
    OldVertMult := VertMult;
    Self.Refresh;
  end;
  KillHint;
end;

procedure TfrmAsciiChart.FormMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  HorizMult, VertMult: Integer; { logical screen width/height segments }
  XPos, YPos: Integer; { X and Y cells clicked on }
begin
  HorizMult := Self.ClientWidth div 8;
  VertMult := (Self.ClientHeight - Panel1.Height - StatusBar.Height) div 16;
  XPos := X div HorizMult;
  YPos := (Y - 25) div VertMult;
  if (XPos < 8) and (YPos < 16) then
    CharPos := BaseNum + XPos * 16 + YPos
  else
    CharPos := -1;
  if Button = MbRight then
    PopupMenu1.Popup(X + Left + GetSystemMetrics(SM_CXFRAME),
      Y + Self.Top + GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION))
  else begin
    if (CharPos > -1) and (CharPos < 256) then begin
      txtChars.Text := txtChars.Text + Chr(CharPos);
      if ClickClose then begin
        ApplyText;
        txtChars.Text := '';
      end;
    end;
  end;
end;

procedure TfrmAsciiChart.btnCharHighClick(Sender: TObject);
begin
  if BaseNum = 0 then begin
    BaseNum := 128;
    btnCharHigh.Down := True;
  end
  else begin
    BaseNum := 0;
    btnCharLow.Down := True;
  end;
  Self.Refresh;
end;

procedure TfrmAsciiChart.FontComboNameChange(Sender: TObject);
begin
  FontName := FontComboName.Text;
  txtChars.Font.Name := FontName;
  Self.Refresh;
end;

procedure TfrmAsciiChart.btnSizeClick(Sender: TObject);
var
  NewFontSize: Integer; { Size of the font I will be changing to }
begin
  NewFontSize := (Sender As TComponent).Tag;
  case NewFontSize of
    8: FontSizeUpDown.Position := 8;
    10: FontSizeUpDown.Position := 10;
    12: FontSizeUpDown.Position := 12;
  else
    Exit;
  end;
  if NewFontSize = FontSize then Exit; { No change so no need to redraw }
  FontSize := NewFontSize;
  Self.Refresh;
end;

procedure TfrmAsciiChart.ShowFontPalette1Click(Sender: TObject);

  procedure SetControlsEnabled(Const Enabled: Boolean);
  begin
    FontComboName.Visible := Enabled;
    FontSizeUpDown.Visible := Enabled;
    FontSizeEdit.Visible := Enabled;
    btnCharLow.Visible := Enabled;
    btnCharHigh.Visible := Enabled;
    btnCharInt.Visible := Enabled;
    btnCharHex.Visible := Enabled;
  end;

begin
  ShowFontPalette := not ShowFontPalette;
  if ShowFontPalette then begin
    SetControlsEnabled(True);
    txtChars.SetBounds(278, 0, Self.ClientWidth - 278, txtChars.Height);
  end
  else begin
    SetControlsEnabled(False);
    txtChars.SetBounds(0, 0, Self.ClientWidth, txtChars.Height);
  end;
end;

procedure TfrmAsciiChart.PopupMenu1Popup(Sender: TObject);
begin
  ShowLowCharacters1.Checked := (BaseNum = 0);
  case FontSize of
    8: FontSize8.Checked := True;
    10: FontSize10.Checked := True;
    12: FontSize12.Checked := True;
  end;
  ShowFontPalette1.Checked := ShowFontPalette;
  CVHex.Checked := ShowHex;
end;

procedure TfrmAsciiChart.WMGetMinMaxInfo(var Msg: TWMGetMinMaxInfo);
begin
  with Msg.MinMaxInfo^ do begin
    PtMinTrackSize.X := 400 + 2 * GetSystemMetrics(SM_CXFRAME);
    PtMinTrackSize.Y := 331 + 2 * GetSystemMetrics(SM_CYFRAME) + GetSystemMetrics(SM_CYCAPTION);
  end;
  Msg.Result := 0;
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
var
  S: TStrings;
  Temp: string;
begin
  S := TStrings(Data);
  Temp := LogFont.LfFaceName;
  if (S.Count = 0) or (AnsiCompareText(S[S.Count - 1], Temp) <> 0) then
    S.Add(Temp);
  Result := 1;
end;

procedure TfrmAsciiChart.GetFonts;
var
  DC: HDc;
  LFont: TLogFont;
begin
  DC := GetDC(0);
  try
    if Lo(GetVersion) >= 4 then begin
      FillChar(LFont, SizeOf(LFont), 0);
      LFont.LfCharSet := DEFAULT_CHARSET;
      EnumFontFamiliesEx(DC, LFont, @EnumFontsProc, LongInt(FontComboName.Items), 0);
    end
    else
      EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontComboName.Items));
    FontComboName.Sorted := True;
  Finally
    ReleaseDC(0, DC);
  end;
end;

procedure TfrmAsciiChart.SetFontName(const NewFontName: string);
var
  I: Integer;
begin
  if FontComboName.Text = NewFontName then Exit;
  with FontComboName do
    for I := 0 to Items.Count - 1 do begin
      if CompareText(Items[I], NewFontName) = 0 then begin
        ItemIndex := I;
        Break;
      end;
    end;
end;

procedure TfrmAsciiChart.btnCharIntClick(Sender: TObject);
begin
  ShowHex := not ShowHex;
  if ShowHex then
    btnCharHex.Down := True
  else
    btnCharInt.Down := True;
  Self.Refresh;
end;

procedure TfrmAsciiChart.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  HorizMult, VertMult: Integer; { logical screen width/height segments }
  XPos, YPos: Integer; { X and Y cells clicked on }
  TheRect: TRect; { the drawing area of the custom hint }
  TheString: string; { the hint string }
  ThePoint: TPoint; { A point variable, used to offset my rect }
  CharPos: Integer; { Override the global Charpos variable }
begin
  HorizMult := Self.ClientWidth div 8;
  VertMult := (Self.ClientHeight - Panel1.Height - StatusBar.Height) div 16;
  XPos := X div HorizMult;
  YPos := (Y - 25) div VertMult;
  if (XPos < 8) and (YPos < 16) then
    CharPos := BaseNum + XPos * 16 + YPos
  else
    Exit;
  if (OldCharPos <> CharPos) and Self.Active then begin
    KillHint;
    FHint := THintWindow.Create(Self);
    FHint.Color := ClInfoBk;
    if (BaseNum = 0) and (CharPos < 32) and (OldCharPos <> CharPos) then begin
      TheString := DescLow[CharPos];
      StatusBar.Font.Name := 'MS Sans Serif'; // do not localize
    end
    else begin
      TheString := Chr(CharPos);
      StatusBar.Font.Name := FontName;
      with FHint.Canvas.Font do begin
        CharSet := DEFAULT_CHARSET;
        Name := FontName;
        Size := ZoomFontSize;
      end;
    end;
    TheRect := FHint.CalcHintRect(Screen.Width, TheString, nil);
    ThePoint := ClientToScreen(Point((XPos + 1) * HorizMult - 1, (YPos + 1) * VertMult + 24));
    OffsetRect(TheRect, ThePoint.x, ThePoint.Y);
    if HintActive1.Checked then
      FHint.ActivateHint(theRect, TheString);
    StatusBar.SimpleText := TheString;
    FActive := True;
    HintTimer.Enabled := True;
    OldCharPos := CharPos;
  end;
end;

procedure TfrmAsciiChart.KillHint;
begin
  FActive := False;
  if Assigned(FHint) then begin
    FHint.ReleaseHandle;
    FreeAndNil(FHint);
  end;
  HintTimer.Enabled := False;
end;

procedure TfrmAsciiChart.HintTimerTimer(Sender: TObject);
begin
  HintTimer.Enabled := False;
  KillHint;
end;

procedure TfrmAsciiChart.DoHint(Sender: TObject);
begin
  KillHint;
end;

procedure TfrmAsciiChart.FormDeactivate(Sender: TObject);
begin
  KillHint;
end;

procedure TfrmAsciiChart.DoDeactivate(Sender: TObject);
begin
  KillHint;
end;

procedure TfrmAsciiChart.FontSizeUpDownClick(Sender: TObject;
  Button: TUDBtnType);
begin
  FontSize := FontSizeUpDown.Position;
  Self.Refresh;
end;

procedure TfrmAsciiChart.FormMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  HorizMult, VertMult: Integer; { logical screen width/height segments }
  XPos, YPos: Integer; { X and Y cells clicked on }
begin
  HorizMult := Self.ClientWidth div 8;
  VertMult := (Self.ClientHeight - Panel1.Height - StatusBar.Height) div 16;
  XPos := X div HorizMult;
  YPos := (Y - 25) div VertMult;
  if (XPos < 8) and (YPos < 16) then
    CharPos := BaseNum + XPos * 16 + YPos
  else
    CharPos := -1;
end;

procedure TfrmAsciiChart.FontSizeEditChange(Sender: TObject);
var
  NewFontSize: Integer;
begin
  NewFontSize := StrToIntDef(FontSizeEdit.Text, 8);
  if (NewFontSize < 6) or (NewFontSize > 20) or (NewFontSize = FontSize) then
    Exit;
  FontSize := NewFontSize;
  Self.Refresh;
end;

procedure TfrmAsciiChart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then begin
    Key := $0;
    Close;
  end
  else if Key = 13 then begin
    Key := $0;
    ApplyText;
  end;
end;

procedure TfrmAsciiChart.FontComboNameEnter(Sender: TObject);
begin
  FontComboName.Perform(CB_SETDROPPEDWIDTH, 175, 0);
end;

procedure TfrmAsciiChart.HintActive1Click(Sender: TObject);
begin
  HintActive1.Checked := not HintActive1.Checked;
end;

procedure TfrmAsciiChart.ApplyText;
var
  s: string;
  I: Integer;
  AsciiString, tmpStr : string;

begin
  for i := 1 to Length(txtChars.Text) do begin
    if ShowHex then
      s := s + '#$' + Format('%x', [Ord(txtChars.Text[i])])
    else
      s := s + '#' + IntToStr(Ord(txtChars.Text[i]));
    tmpStr := tmpStr + txtChars.Text[i];
  end;

  if (sbtnChar.Down) then AsciiString := tmpStr
  else AsciiString := s;

  if Assigned(TfrmEditor(frmTinnMain.MDIChildren[0])) then
    with TfrmEditor(frmTinnMain.MDIChildren[0]).synEditor do
      if (AsciiString <> '') then begin
         SelText := AsciiString;
      end;
end;

procedure TfrmAsciiChart.sbtnValueClick(Sender: TObject);
begin
  Self.Refresh;
end;

procedure TfrmAsciiChart.sbtnCharClick(Sender: TObject);
begin
  Self.Refresh;
end;

Initialization
end.

