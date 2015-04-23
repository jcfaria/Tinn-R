unit LangsReg;

interface

procedure Register;

implementation

uses
 {$IFDEF VER130} { Borland Delphi 5.x }
   DsgnIntf,
 {$ELSE}
   DesignEditors, DesignIntf,
 {$ENDIF}
   Windows, SysUtils, Langs, Classes;

type
  TLanguageProperty = class(TIntegerProperty)
  public
    function GetAttributes: TPropertyAttributes; override;
    function GetValue: string; override;
    procedure GetValues(Proc: TGetStrProc); override;
    procedure SetValue(const Value: string); override;
  end;

procedure Register;
begin
  RegisterPropertyEditor(TypeInfo(TLanguage), nil, '', TLanguageProperty);
end;

function TLanguageProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paMultiSelect, paSortList, paValueList];
end;

function TLanguageProperty.GetValue: string;
begin
  if not LanguageToIdent(TLanguage(GetOrdValue), Result) then
    FmtStr(Result, '%d', [GetOrdValue]);
end;

procedure TLanguageProperty.GetValues(Proc: TGetStrProc);
begin
  GetStrProc:= Proc;
  EnumSystemLocales(@EnumGetValues, LCID_INSTALLED);
end;

procedure TLanguageProperty.SetValue(const Value: string);
var
  NewValue: Longint;
begin
  if IdentToLanguage(Value, NewValue) then
    SetOrdValue(NewValue)
  else inherited SetValue(Value);
end;

end.
