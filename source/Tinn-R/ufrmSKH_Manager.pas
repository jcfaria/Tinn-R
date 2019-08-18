unit ufrmSKH_Manager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, StrUtils, SynEditMiscClasses;

type
  TfrmSKH_Manager_Dlg = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    bbtCancel: TBitBtn;
    bbtCheck: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gbKeystrokes: TGroupBox;
    rgRemove_Current: TRadioGroup;
    gbCurrent_info: TGroupBox;
    lbId_cur: TLabel;
    lbWhere_cur: TLabel;
    gbCheck_Info: TGroupBox;
    lbInUse_Check: TLabel;
    lbId_Check: TLabel;
    lbWhere_Check: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtCheckClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure gbKeystrokesEnter(Sender: TObject);

  private
    { Private declarations }

//    function fCheck_Use_App(var sBy: string): boolean;
    function fCheck_Reserved: boolean;
    procedure pSet_LabelColor(clTmp: TColor);

//    procedure pKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  public
    eKeyShort: TSynHotKey;
  end;

var
  frmSKH_Manager_Dlg: TfrmSKH_Manager_Dlg;

implementation

uses
  trUtils,
  uModDados,
  ufrmSKH_map,
  ufrmMain;

{$R *.dfm}

procedure TfrmSKH_Manager_Dlg.pSet_LabelColor(clTmp: TColor);
begin
  gbCheck_Info.Font.Color:= clTmp;
end;

//function TfrmSH_Manager_Dlg.fCheck_Use_App(var sBy: string): boolean;
//var
//  pTmp:  pointer;
//
//  bFiltered: boolean;
//
//  sTmp: string;
//
//begin
//  Result:= False;
//
//  with frmMain.dlgSH_Map.pgSH do
//    case ActivePageIndex of
//      0: begin
//           with modDados.cdShortcuts do begin
//             pTmp:= GetBookmark;
//             DisableControls;
//             bFiltered:= Filtered;
//             if bFiltered then
//               Filtered:= False;
//
//             sTmp:= StringReplace(ShortcutToText(eKeyShort.Hotkey),
//                                  ' ',
//                                  '',
//                                  [rfReplaceAll]);
//
//             if (Locate('Shortcut',
//                        sTmp,
//                        []) = True) then begin
//               Result:= True;
//
//               sBy:= FieldValues['Group'] +
//                     ' | ' +
//                     FieldValues['Caption'] +
//                     ' | ' +
//                     FieldValues['Hint'];
//
//               if BookmarkValid(pTmp) then begin
//                 GoToBookmark(pTmp);
//                 FreeBookmark(pTmp);
//               end; //if BookmarkValid(pTmp)
//               Filtered:= bFiltered;
//             end; //if (Locate('Shortcut'
//             EnableControls;
//           end; //with modDados.cdShortcuts
//         end; //0: begin
//    end;
//end;

function TfrmSKH_Manager_Dlg.fCheck_Reserved: boolean;
const
  aReserved: array[0..2] of string = ('Ctrl+Space',      // R Tip after '('
                                      'Ctrl+Alt+Space',  // Rhistory
                                      'Ctrl+Enter'       // Rterm submit
                                     );
var
  sTmp: string;

begin
  sTmp:= StringReplace(ShortcutToText(eKeyShort.Hotkey),
                       ' ',
                       '',
                       [rfReplaceAll]);

  //StrUtils: MatchText is case insensitive.MatchStr is case sensitive!
  Result:= MatchText(sTmp,
                     aReserved);
end;

procedure TfrmSKH_Manager_Dlg.bbtCheckClick(Sender: TObject);
var
  sBy,
   sWhere: string;

begin
  lbInUse_Check.Caption:= 'In use: ';
  lbId_Check.Caption:= 'Id: ';
  lbWhere_Check.Caption:= 'Where: ';

  sBy:= '';
  sWhere:= '';

  // The below checks if the typed is a reserved shortcut
  if fCheck_Reserved then begin
    with lbInUse_Check do
      Caption:= Caption + 'YES';

    with lbId_Check do
      Caption:= Caption + 'Reserved | Not user configurable';

    with lbWhere_Check do
      Caption:= Caption + 'Reserved | Not user configurable';

    pSet_LabelColor(clRed);
    with frmMain.dlgSKH_Map.dlgSKH_Manager do
      bbtOK.Enabled:= False;

    with frmMain.dlgSKH_Map.dlgSKH_Manager do
      eKeyShort.SetFocus;

    Exit;
  end;

  with frmMain.dlgSKH_Map.pgSH do
    case ActivePageIndex of
      0: begin
           with frmMain.dlgSKH_Map.dlgSKH_Manager do
             bbtOK.Enabled:= True;

           with modDados do
             if fCheck_Hotkey_Use_App(ShortCutToText(eKeyShort.HotKey),
                                                     sBy) then begin
               rgRemove_Current.Enabled:= True;
               pSet_LabelColor(clRed);

               with lbInUse_Check do
                 Caption:= Caption + 'YES';

               with lbId_Check do
                 Caption:= Caption + sBy;

               with lbWhere_Check do
                 Caption:= Caption + 'Aplication';
             end  //if fCheck_Hotkey_Use_App
             else begin
               with lbInUse_Check do begin
                 Caption:= Caption + 'NO';
                 pSet_LabelColor(clGreen);
                 rgRemove_Current.Enabled:= False;
               end;
             end;
         end;
      1:;
      2:;
    end;  //case ActivePageIndex of

//    with frmMain.dlgSH_Map.dlgSH_Manager do
//      eKeyShort.SetFocus;
end;

procedure TfrmSKH_Manager_Dlg.FormActivate(Sender: TObject);
begin
  with frmMain do
    with eKeyShort do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
end;

procedure TfrmSKH_Manager_Dlg.FormCreate(Sender: TObject);
begin
  eKeyShort:= TSynHotKey.Create(Self);

  with eKeyShort do
  begin
    Parent     := gbKeystrokes;
    Left       := {gbKeystrokes.Left +} 10;
    Top        := {gbKeystrokes.Top +} 25;
    Width      := gbKeystrokes.Width - 20;
    Height     := 21;
    HotKey     := 0;
    InvalidKeys:= [];
    Modifiers  := [];
    TabOrder   := 1;
    BorderStyle:= bsSingle;
    //OnKeyUp    := pKeyUp;  {Not Working}
  end;
  pSet_LabelColor(clBlack);
end;

procedure TfrmSKH_Manager_Dlg.FormShow(Sender: TObject);
begin
  with frmMain.dlgSKH_Map.pgSH do
    case ActivePageIndex of
      0: begin
           with modDados.cdShortcuts do begin
             eKeyShort.HotKey:= TextToShortcut(FieldByName('Shortcut').Value);


             with lbId_Cur do
               Caption:= Caption + FieldValues['Group'] +
                                   ' | ' +
                                   FieldValues['Caption'] +
                                   ' | ' +
                                   FieldValues['Hint'];

             with lbWhere_Cur do
               Caption:= Caption + 'Aplication';
           end;  //with modDados.cdShortcuts
      end;  //0:
    end;  //case ActivePageIndex
end;

// The user will type anything in eKeyShort
procedure TfrmSKH_Manager_Dlg.gbKeystrokesEnter(Sender: TObject);
begin
  with frmMain.dlgSKH_Map.dlgSKH_Manager do begin
    bbtOK.Enabled:= False;
    rgRemove_current.Enabled:= False;
  end;
end;

end.
