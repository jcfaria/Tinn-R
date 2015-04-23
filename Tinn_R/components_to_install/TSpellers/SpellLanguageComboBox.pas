unit SpellLanguageComboBox;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, Graphics,
  Langs, Spellers;

Type
{ TSpellLanguageComboBox }
  TSpellLanguageComboBox = class(TCustomComboBox)
  private
    { Private declarations }
    FLangOption: TLangOption;
    FSpellChecker: TSpellChecker;
    ListBackUp: TList;
 {$IFDEF VER130} { Borland Delphi 5.x }
    FOnSelect: TNotifyEvent;
 {$ENDIF}
    procedure SetSpellChecker(Value: TSpellChecker);
  protected
    procedure CreateWnd; override;
    procedure DrawItem(Index: Integer; Rect: TRect; State: TOwnerDrawState); override;
    procedure Change; override;
 {$IFNDEF VER130} { Borland Delphi 5.x }
    procedure SetItemIndex(const Value: Integer); override;
 {$ENDIF}
    procedure PopulateList;
    procedure InformSpeller;
    { Protected declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Text;
    { Public declarations }
  published
    { Published declarations }
    property LangOption: TLangOption read FLangOption write FLangOption
      default loLocalized;
    property SpellChecker: TSpellChecker read FSpellChecker write SetSpellChecker;
    property Color;
    property Ctl3D;
    property DragMode;
    property DragCursor;
    property Enabled;
    property Font;
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
    property ImeMode;
    property ImeName;
    property ItemHeight default 18;
    property ItemIndex;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property Style default csOwnerDrawVariable;
    property TabOrder;
    property TabStop;
    property Visible;
    property OnChange;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnStartDrag;
    property OnEndDock;
 {$IFDEF VER130} { Borland Delphi 5.x }
    property OnSelect: TNotifyEvent read FOnSelect write FOnSelect;
 {$ELSE}
    property OnSelect;
 {$ENDIF}
    property OnStartDock;
  end;

procedure Register;

implementation

{$R SpellImages.RES}

procedure Register;
begin
  RegisterComponents('LS', [TSpellLanguageComboBox]);
end;

{ TSpellLanguageComboBox }

constructor TSpellLanguageComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ListBackUp := TList.Create;
  Style := csOwnerDrawVariable;
  ItemHeight := 18;
  Height := 24;
  Width := 215;
  Font.Name := 'Arial';
end;

procedure TSpellLanguageComboBox.CreateWnd;
begin
  inherited CreateWnd;
  PopulateList;
  if Items.Count > 0
    then ItemIndex := 0
    else if FSpellChecker <> nil then FSpellChecker.ActiveLanguage := False;
end;

procedure TSpellLanguageComboBox.DrawItem(Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
var
  Bitmap: TBitMap;
  Offset: Integer;
begin
  inherited;
{$IFDEF VER130} { Borland Delphi 5.x }
  InformSpeller;
{$ENDIF}
  Bitmap := TBitMap.Create;
  try
   Offset:=2;
   with Canvas do
   begin
     FillRect(Rect);
     if TSpellListObj(Items.Objects[Index]).SpellerType = sptISpell
       then Bitmap.LoadFromResourceName(HInstance,'ISpellBitMap')
       else Bitmap.LoadFromResourceName(HInstance,'MSWordBitMap');
     if Bitmap <> nil then
     begin
       //copy bitmap to combobox coordinate
       Bitmap.Transparent := True;
       BrushCopy(Bounds(Rect.Left + 2, Rect.Top + 1, Bitmap.Width,
         Bitmap.Height), Bitmap, Bounds(0, 0, Bitmap.Width,
         Bitmap.Height), Bitmap.TransparentColor);
       Offset := Bitmap.width + 8;
     end;
     //Set a caption to each item
     TextOut(Rect.Left + Offset, Rect.Top + 2, Items[Index]);
   end;
  finally
   Bitmap.Free;
  end;
end;

destructor TSpellLanguageComboBox.Destroy;
var
 J: Integer;
begin
 for J := ListBackUp.Count-1 downto 0 do
   try
     TSpellListObj(ListBackUp[J]).Free;
   except end;
 ListBackUp.Free;
 inherited;
end;

procedure TSpellLanguageComboBox.PopulateList;
var
 MSLangs, ISLangs: TStringList;
 J, MSCount, ISCount: Integer;
 O: TSpellListObj;

begin
  if not HandleAllocated then Exit;
  Items.BeginUpdate;
  MSLangs := TStringList.Create;
  ISLangs := TStringList.Create;
  try
    Clear;
    MSCount := Spellers.GetSpellLanguages(MSLangs,FLangOption);
    For J := 0 to MSCount - 1 do begin        //Add MS Office Languages
      O := TSpellListObj.Create;
      O.ISpellCmd := '';
      O.ISpellCharset := '';
      O.ISpellSurrogate := '';
      O.Flag := '';
      O.SpellerType := sptMSOffice;
      O.Language := TLanguage(MSLangs.Objects[J]);
      Items.AddObject(MSLangs[J], O);
      ListBackUp.Add(O);
     end; // For

    ISCount := Spellers.GetISpellLanguages(ISLangs,FLangOption);
    For J := 0 to ISCount - 1 do begin           //Add ISpeller Languages
      Items.AddObject(ISLangs[J], TSpellListObj(ISLangs.Objects[J]));
      ListBackUp.Add(TSpellListObj(ISLangs.Objects[J]));
     end; //For
  finally
    Items.EndUpdate;
    MSLangs.Free;
    ISLangs.Free;
  end;
end; {PopulateList}

procedure TSpellLanguageComboBox.SetSpellChecker(Value: TSpellChecker);
begin
 FSpellChecker := Value;
 InformSpeller;
end;

procedure TSpellLanguageComboBox.Change;
begin
  inherited;
  InformSpeller;
end;

procedure TSpellLanguageComboBox.InformSpeller;
begin
 if FSpellChecker <> nil then
  try
   If ItemIndex >= 0 then
    with TSpellListObj(Items.Objects[ItemIndex]) do begin
      FSpellChecker.ISpellCmd := ISpellCmd;
      FSpellChecker.ISpellCharset := ISpellCharset;
      FSpellChecker.ISpellSurrogate := ISpellSurrogate;
      FSpellChecker.Flag := Flag;
      FSpellChecker.Language := Language;
      FSpellChecker.SpellerType := SpellerType;
      FSpellChecker.LangName := Items[ItemIndex];
      FSpellChecker.LangOption := LangOption;
    end;
  except end;  
end;

{$IFNDEF VER130} { Borland Delphi 5.x }
procedure TSpellLanguageComboBox.SetItemIndex(const Value: Integer);
begin
  inherited;
  InformSpeller;
end;
{$ENDIF}

end.
