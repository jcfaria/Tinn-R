unit Split;

interface
uses
  SysUtils, Classes;

type
  IStrings = interface
  ['{041D1A57-D1DE-4329-A0B0-17DC815B4449}']
    function GetObj: TStrings;
    function GetCount: Integer;
    function GetString(Index: Integer): string;
    function GetAsInt(Index: Integer): Integer;
    procedure SetString(Index: Integer; const Value: string);
    procedure SetAsInt(Index: Integer; const Value: Integer);
 
    property Obj: TStrings read GetObj;
    property Count: Integer read GetCount;
    property Strings[Index: Integer]: string read GetString write SetString; default;
    property AsInt[Index: Integer]: Integer read GetAsInt write SetAsInt;
  end;
 
  function SplitEx(const Text, Separator: string): IStrings;
 
implementation
 
type
  TStringsImpl = class(TInterfacedObject, IStrings)
  private
    FStrings: TStringList;
  protected
    function GetObj: TStrings;
    function GetCount: Integer;
    function GetString(Index: Integer): string;
    function GetAsInt(Index: Integer): Integer;
    procedure SetString(Index: Integer; const Value: string);
    procedure SetAsInt(Index: Integer; const Value: Integer);
  public
    constructor Create(const Text: string; const SplitDelimiter: string = '');
    destructor Destroy; override;
  end;
 
{ TStringsImpl }
 
constructor TStringsImpl.Create(const Text: string; const SplitDelimiter: string);
begin
  FStrings := TStringList.Create;
  if SplitDelimiter <> '' then
    FStrings.Text := StringReplace(Text, SplitDelimiter, #13#10, [rfReplaceAll])
  else
    FStrings.Text := Text;
end;
 
destructor TStringsImpl.Destroy;
begin
  FStrings.Free;
  inherited;
end;
 
function TStringsImpl.GetAsInt(Index: Integer): Integer;
begin
  Result := StrToIntDef(FStrings[Index], 0);
end;
 
function TStringsImpl.GetCount: Integer;
begin
  Result := FStrings.Count;
end;
 
function TStringsImpl.GetObj: TStrings;
begin
  Result := FStrings;
end;
 
function TStringsImpl.GetString(Index: Integer): string;
begin
  Result := FStrings[Index];
end;
 
procedure TStringsImpl.SetAsInt(Index: Integer; const Value: Integer);
begin
  FStrings[Index] := IntToStr(Value);
end;
 
procedure TStringsImpl.SetString(Index: Integer; const Value: string);
begin
  FStrings[Index] := Value;
end;
 
{ Helper }
function SplitEx(const Text, Separator: string): IStrings;
begin
  Result := TStringsImpl.Create(Text, Separator) as IStrings;
end;

end.
