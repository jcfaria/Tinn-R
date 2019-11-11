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
    gbInfo: TGroupBox;
    GroupBox2: TGroupBox;
    gbKeystrokes: TGroupBox;
    rgRemove_Current: TRadioGroup;
    gbCurrent_info: TGroupBox;
    lbId_Cur: TLabel;
    lbWhere_Cur: TLabel;
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

    function fCheck_Reserved: boolean;
    procedure pSet_LabelColor(clTmp: TColor);

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

  procedure pSetYes_InUse(sBy, sWhere: string);
  begin
    rgRemove_Current.Enabled:= True;

    pSet_LabelColor(clRed);

    with lbInUse_Check do
      Caption:= 'YES';

    with lbId_Check do
      Caption:= sBy;

    with lbWhere_Check do
      Caption:= sWhere;
  end;

  procedure pSetNot_InUse;
  begin
    with lbInUse_Check do begin
      Caption:= 'NO';
      pSet_LabelColor(clGreen);
      rgRemove_Current.Enabled:= False;
    end;
  end;

  procedure pNotify_Reserved;
  begin
    with lbInUse_Check do
      Caption:= 'YES';

    with lbId_Check do
      Caption:= 'Reserved | Not user configurable';

    with lbWhere_Check do
      Caption:= 'Reserved | Not user configurable';

    pSet_LabelColor(clRed);
    with frmMain.dlgSKH_Map.dlgSKH_Manager do
      bbtOK.Enabled:= False;

    with frmMain.dlgSKH_Map.dlgSKH_Manager do
      eKeyShort.SetFocus;
  end;

var
  sBy,
   sWhere: string;

begin
  lbInUse_Check.Caption:= '';
  lbId_Check.Caption:= '';
  lbWhere_Check.Caption:= '';

  sBy:= '';
  sWhere:= '';

  with frmMain.dlgSKH_Map do
    iSKH_Used_By:= -1;

  // The below checks if the typed is a Reserved (fixed | not user configurable) Shortcut
  if fCheck_Reserved then begin
    pNotify_Reserved;
    Exit;
  end;

  with frmMain.dlgSKH_Map.dlgSKH_Manager do
    bbtOK.Enabled:= True;

  with frmMain.dlgSKH_Map do
    iSKH_Used_By:= 0;

  // App
  with modDados do
    if fCheck_Shortcut_App(ShortCutToText(eKeyShort.HotKey),
                           sBy) then begin
      pSetYes_inUse(sBy,
                    'Application');

      with frmMain.dlgSKH_Map do
        iSKH_Used_By:= 1;

      Exit;
    end;

  // Keys_Editor
  with modDados do
    if fCheck_keystroke_Editor(ShortCutToText(eKeyShort.HotKey),
                                              sBy) then begin
      pSetYes_inUse(sBy,
                    'Editor');

      with frmMain.dlgSKH_Map do
        iSKH_Used_By:= 2;

      Exit;
    end;

  // RH_Send
  with modDados do
    if fCheck_Hotkey_RH_Send(ShortCutToText(eKeyShort.HotKey),
                             sBy) then begin
      pSetYes_inUse(sBy,
                    'RH Send');

      with frmMain.dlgSKH_Map do
        iSKH_Used_By:= 3;

      Exit;
    end;

  // RH_Control
  with modDados do
    if fCheck_Hotkey_RH_Control(ShortCutToText(eKeyShort.HotKey),
                                sBy) then begin
      pSetYes_inUse(sBy,
                    'RH Control');

      with frmMain.dlgSKH_Map do
        iSKH_Used_By:= 4;

      Exit;
    end;

  // RH_Custom
  with modDados do
    if fCheck_Hotkey_RH_Custom(ShortCutToText(eKeyShort.HotKey),
                               sBy) then begin
      pSetYes_inUse(sBy,
                    'RH Custom');

      with frmMain.dlgSKH_Map do
        iSKH_Used_By:= 5;

      Exit;
    end;

//  Map of iSKH_Used_By
//   iSKH_Used_By:= 0; Not used
//   iSKH_Used_By:= 1; App
//   iSKH_Used_By:= 2; Keys_Editor
//   iSKH_Used_By:= 3; RHK_Send
//   iSKH_Used_By:= 4; RHK_Control
//   iSKH_Used_By:= 5; RHK_Custom

  pSetNot_InUse;  // It was not found in any prior
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
  with frmMain.dlgSKH_Map do
    iSKH_Assign_To:= 0;  // Not used

  case frmMain.dlgSKH_Map.pgSKH.ActivePageIndex of
    // App
    0: begin
         gbInfo.Caption:= ' Info (Group | Identification | Hint) ';
         with modDados.cdShortcuts do begin
           eKeyShort.HotKey:= TextToShortcut(FieldByName('Shortcut').Value);

           with lbId_Cur do
             Caption:= FieldValues['Group'] +
                       ' | ' +
                       FieldValues['Caption'] +
                       ' | ' +
                       FieldValues['Hint'];

           with lbWhere_Cur do
             Caption:= 'Aplication';
         end;  //with modDados.cdShortcuts

        with frmMain.dlgSKH_Map do
          iSKH_Assign_To:= 1;

        Exit;
    end;  //0:

    // Keys_Editor
    1: begin
         with modDados.cdKeys_Editor do begin
           eKeyShort.HotKey:= TextToShortcut(FieldByName('Keystroke').Value);

           with lbId_Cur do
             Caption:= 'Editor' +
                       ' | ' +
                       FieldValues['Command'];

           with lbWhere_Cur do
             Caption:= 'Editor';
         end;  //with modDados.cdEditor

         with frmMain.dlgSKH_Map do
           iSKH_Assign_To:= 2;

         Exit;
    end;

    // R_Hotkeys
    2: begin
         gbInfo.Caption:= ' Info (Group | Identification) ';
         case frmMain.dlgSKH_Map.pgRH.ActivePageIndex of
           // RH_Send
           0: begin
                with modDados.cdRH_Send do begin
                  eKeyShort.HotKey:= TextToShortcut(FieldByName('HotKey').Value);

                  with lbId_Cur do
                    Caption:= FieldValues['Group'] +
                              ' | ' +
                              FieldValues['Caption'];

                  with lbWhere_Cur do
                    Caption:= 'RH Send';
                end;  //with modDados

               with frmMain.dlgSKH_Map do
                 iSKH_Assign_To:= 3;

               Exit;
           end;  // 0: begin

           // RH_Control
           1: begin
                with modDados.cdRH_Control do begin
                  eKeyShort.HotKey:= TextToShortcut(FieldByName('HotKey').Value);

                  with lbId_Cur do
                    Caption:= FieldValues['Group'] +
                              ' | ' +
                              FieldValues['Caption'];

                  with lbWhere_Cur do
                    Caption:= 'RH Control';
                end;  //with modDados

               with frmMain.dlgSKH_Map do
                 iSKH_Assign_To:= 4;

               Exit;
           end;  // 1: begin

           // RH_Custom
           2: begin
                with modDados.cdRH_Custom do begin
                  eKeyShort.HotKey:= TextToShortcut(FieldByName('HotKey').Value);

                  with lbId_Cur do
                    Caption:= FieldValues['Group'] +
                              ' | ' +
                              FieldValues['Caption'];

                  with lbWhere_Cur do
                    Caption:= 'RH Custom';
                end;  //with modDados.cdShortcuts

               with frmMain.dlgSKH_Map do
                 iSKH_Assign_To:= 5;

               Exit;
           end;  // 2: begin
         end;  //case frmMain.dlgSKH_Map.pgRH.ActivePageIndex
       end;  //2: begin (R_Hotkeys)
  end;  //case frmMain.dlgSKH_Map.pgSH.ActivePageIndex
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

