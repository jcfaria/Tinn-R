unit Langs;

interface

uses
  Windows, SysUtils, Graphics, Classes;

type
  TLanguage = 0..$FFFF;

  TLangOption = (loLocalized, loEnglish, loNative, loAbbrev);

function LanguageName(Language: TLanguage; Option: TLangOption): String;
function CharSetFromLocale(Language: TLanguage): TFontCharSet;
function CodePageFromLocale(Language: TLanguage): Integer;
function OEMCodePageFromLocale(Language: TLanguage): Integer;
function CharToWide(const S: String; CodePage: Word): WideString;
function WideToChar(const WS: WideString; CodePage: Word): String;
function CharToChar(const S: String; CP1, CP2: Word): String;
function LengthEx(S: String; CP: Word): Integer;
function LCType(Option: TLangOption): Integer;
function LanguageToIdent(Language: Longint; var Ident: string): Boolean;
function IdentToLanguage(const Ident: string; var Language: Longint): Boolean;
function EnumGetValues(LocaleStr: LPSTR): Integer; stdcall;

var
  GetStrProc: TGetStrProc;

implementation

{This is a proper declaration of TranslateCharsetInfo}
function TranslateCharsetInfo(lpSrc: Pointer; var lpCs: TCharsetInfo; dwFlags: DWORD): BOOL; stdcall;
external gdi32;

function LanguageName(Language: TLanguage; Option: TLangOption): String;
var
  Buf: array[0..255] of Char;
begin
  GetLocaleInfo(Language, LCType(Option), Buf, 255);
  Result:= StrPas(Buf);
end;

function CodePageFromLocale(Language: TLanguage): Integer;
var
  Buf: array[0..6] of Char;
begin
  GetLocaleInfo(Language, LOCALE_IDefaultAnsiCodePage, Buf, 6);
  Result:= StrToIntDef(Buf, GetACP);
end;

function OEMCodePageFromLocale(Language: TLanguage): Integer;
var
  Buf: array[0..6] of Char;
begin
  GetLocaleInfo(Language, LOCALE_IDefaultCodePage, Buf, 6);
  Result:= StrToIntDef(Buf, GetOEMCP);
end;

function CharSetFromLocale(Language: TLanguage): TFontCharSet;
var
  CP: Integer;
  CSI: TCharsetInfo;
begin
  CP:= CodePageFromLocale(Language);
  TranslateCharsetInfo(Pointer(CP), CSI, TCI_SRCCODEPAGE);
  Result:= CSI.ciCharset;
end;

function CharToWide(const S: String; CodePage: Word): WideString;
var
  L: Integer;
begin
  if S='' then
    Result:= ''
  else
    begin
      L:= MultiByteToWideChar(CodePage, 0, PChar(@S[1]), -1, nil, 0);
      SetLength(Result, L-1);
      MultiByteToWideChar(CodePage, 0, PChar(@S[1]), -1, PWideChar(@Result[1]), L-1);
   end;
end;

function WideToChar(const WS: WideString; CodePage: Word): String;
var
  L: Integer;
begin
  if WS='' then
    Result:= ''
  else
    begin
      L:= WideCharToMultiByte(CodePage, 0, @WS[1], -1, nil, 0, nil, nil);
      SetLength(Result, L-1);
      WideCharToMultiByte(CodePage, 0, @WS[1], -1, @Result[1], L-1, nil, nil);
    end;
end;

function CharToChar(const S: String; CP1, CP2: Word): String;
begin
  Result:= WideToChar(CharToWide(S, CP1), CP2);
end;

function LengthEx(S: String; CP: Word): Integer;
var
  P: PChar;
begin
  Result:= 0;
  P:= @S[1];
  while (P^<>#0) do
    begin
      Inc(Result);
      P:= CharNextEx(CP, P, 0);
    end;
end;

function LCType(Option: TLangOption): Integer;
begin
  LCType:= LOCALE_SLanguage;
  case Option of
  loLocalized:
    LCType:= LOCALE_SLanguage;
  loEnglish:
    LCType:= LOCALE_SEngLanguage;
  loNative:
    LCType:= LOCALE_SNativeLangName;
  loAbbrev:
    LCType:= LOCALE_SAbbrevLangName;
  end;
end;

function LanguageToIdent(Language: Longint; var Ident: string): Boolean;
var
  Buf: array[0..255]of Char;
begin
  Result:= IsValidLocale(Language, LCID_INSTALLED);
  if Result then
    begin
      GetLocaleInfo(Language, LOCALE_SLANGUAGE, Buf, 255);
      SetString(Ident, Buf, StrLen(Buf));
    end;
end;

var
  SearchId: String;
  SearchLang: Integer;
  LCTypeVar: Integer;

function EnumGetLang(LocaleStr: LPSTR): Integer;
stdcall;
var
  Buf: array[0..255]of Char;
  Locale: LCID;
  Z: Integer;
begin
  Val('$'+StrPas(LocaleStr), Locale, Z);
  Result:= 1;
  GetLocaleInfo(Locale, LCTypeVar, Buf, 255);
  if AnsiCompareText(SearchId, Buf)=0 then
    begin
      SearchLang:= Locale;
      Result:= 0;
    end;
end;

function IdentToLanguage(const Ident: string; var Language: Longint): Boolean;
begin
  SearchId:= Ident;
  SearchLang:= -1;
  LCTypeVar:= LOCALE_SLANGUAGE;
  EnumSystemLocales(@EnumGetLang, LCID_INSTALLED);
  if SearchLang<0 then
    begin
      LCTypeVar:= LOCALE_SENGLANGUAGE;
      EnumSystemLocales(@EnumGetLang, LCID_INSTALLED);
    end;
  if SearchLang<0 then
    begin
      LCTypeVar:= LOCALE_SABBREVLANGNAME;
      EnumSystemLocales(@EnumGetLang, LCID_INSTALLED);
    end;
  Result:= SearchLang>-1;
  if Result then
    Language:= SearchLang;
end;

function EnumGetValues(LocaleStr: LPSTR): Integer; stdcall;
var
  Buf: array[0..255]of Char;
  Locale: LCID;
  Z: Integer;
begin
  Val('$'+StrPas(LocaleStr), Locale, Z);
  GetLocaleInfo(Locale, LOCALE_SLANGUAGE, Buf, 255);
  GetStrProc(Buf);
  Result:= 1;
end;

end.
