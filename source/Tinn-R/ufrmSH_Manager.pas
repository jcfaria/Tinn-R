unit ufrmSH_Manager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, SynEditMiscClasses;

type
  TfrmSH_Manager_Dlg = class(TForm)
    bbHelp: TBitBtn;
    bbtOK: TBitBtn;
    bbtCancel: TBitBtn;
    bbtCheck: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    gbKeystrokes: TGroupBox;
    rgRemove_current: TRadioGroup;
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

  private
    { Private declarations }

    function fCheck_Use_App(var sBy: string): boolean;
    procedure pSet_LabelColor(clTmp: TColor);

//    procedure pKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);

  public
    eKeyShort : TSynHotKey;

  end;

var
  frmSH_Manager_Dlg: TfrmSH_Manager_Dlg;

implementation

uses
  uModDados, ufrmSH_map, ufrmMain;

{$R *.dfm}

procedure TfrmSH_Manager_Dlg.pSet_LabelColor(clTmp: TColor);
begin
  gbCheck_Info.Font.Color:= clTmp;
end;

function TfrmSH_Manager_Dlg.fCheck_Use_App(var sBy: string): boolean;
var
  pTmp:  pointer;

begin
  with frmMain.dlgSH_Map.pgSH do
    case ActivePageIndex of
      0: begin
           with modDados.cdShortcuts do
             pTmp:= GetBookmark;

           Result:= False;
           if (modDados.cdShortcuts.Locate('Shortcut',
                                            StringReplace(ShortcutToText(eKeyShort.Hotkey), ' ', '', []),
                                            []) = True) then begin
             Result:= True;
             with modDados.cdShortcuts do begin
               sBy:= FieldValues['Group'] +
                     ' | ' +
                     FieldValues['Caption'] +
                     ' | ' +
                     FieldValues['Hint'];

               if BookmarkValid(pTmp) then begin
                 GoToBookmark(pTmp);
                 FreeBookmark(pTmp);
               end;  //if BookmarkValid(pTmp)
             end;  //with modDados.cdShortcuts
           end; //if (modDados.cdShortcuts.Locate
         end; // 0
    end;
end;

procedure TfrmSH_Manager_Dlg.bbtCheckClick(Sender: TObject);
var
  sBy,
   sWhere: string;

begin
  lbInUse_Check.Caption:= 'In use: ';
  lbId_Check.Caption:= 'Id: ';
  lbWhere_Check.Caption:= 'Where: ';

  sBy:= '';
  sWhere:= '';

  with frmMain.dlgSH_Map.pgSH do
    case ActivePageIndex of
      0: if fCheck_Use_App(sBy) then begin
           rgRemove_Current.Enabled:= True;
           pSet_LabelColor(clRed);

           with lbInUse_Check do
             Caption:= Caption + 'YES';

           with lbId_Check do
             Caption:= Caption + sBy;

           with lbWhere_Check do
             Caption:= Caption + 'Aplication';
         end  //if fCheck_Use_App
         else
           with lbInUse_Check do begin
             Caption:= Caption + 'NO';
             pSet_LabelColor(clGreen);
             rgRemove_Current.Enabled:= False;
           end;

      1:;
      2:;
    end;  //case ActivePageIndex of
end;

procedure TfrmSH_Manager_Dlg.FormActivate(Sender: TObject);
begin
  with frmMain do
    with eKeyShort do begin
      Color     := clBGApplication;
      Font.Color:= clFGApplication;
    end;
end;

procedure TfrmSH_Manager_Dlg.FormCreate(Sender: TObject);
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

procedure TfrmSH_Manager_Dlg.FormShow(Sender: TObject);
begin
  with frmMain.dlgSH_Map.pgSH do
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

//procedure TfrmSH_Dlg.pKeyUp(Sender: TObject;
//                            var Key: Word;
//                            Shift: TShiftState);
//begin
//  if (Sender = eKeyShort) then ShowMessage('Sim')
//                          else ShowMessage('Não');
//
//end;

end.
