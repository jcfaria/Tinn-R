unit Spellers;

interface

uses
  Windows, Messages, SysUtils, Graphics, Controls, Forms, Dialogs,
  ComCtrls, RichEdit, StdCtrls, Math, Langs, Classes, IniFiles;

type
  TSpellOption = (spoSuggestFromUserDict, spoIgnoreAllCaps, spoIgnoreMixedDigits,
                  spoIgnoreRomanNumerals, spoFindUncappedSentences,
                  spoFindMissingSpaces, spoFindRepeatWord, spoFindExtraSpaces,
                  spoFindSpacesBeforePunc, spoFindSpacesAfterPunc, spoRateSuggestions,
                  spoFindInitialNumerals);

  TSpellOptions = set of TSpellOption;

  TSpellerType = (sptMSOffice, sptISpell);

  TSpellListObj = class
    ISpellCmd,ISpellCharset,ISpellSurrogate,Flag: String;
    Language: TLanguage;
    SpellerType: TSpellerType;
  end;

  TUserLanguage = (ulEnglish, ulOwn, ulOther);

  TSpellCommand = (scVerifyWord, scVerifyBuffer, scSuggest, scSuggestMore,
                   scHyphInfo, scWildCard, scAnagram);

  TSpellReturnCode = (srNoErrors, srUnknownInputWord, srReturningChangeAlways,
                      srReturningChangeOnce, srInvalidHyphenation,
                      srErrorCapitalization, srWordConsideredAbbreviation,
                      srHyphChangesSpelling, srNoMoreSuggestions,
                      srMoreInfoThanBufferCouldHold, srNoSentenceStartCap,
                      srRepeatWord, srExtraSpaces, srMissingSpace,
                      srInitialNumeral);

  TMisspellFont = class(TPersistent)
  private
      FMspName: TFontName;
      FMspColor: TColor;
      FMspStyle: TFontStyles;
  public
    procedure Assign(Source: TPersistent); override;
  published
    property MspName: TFontName read FMspName write FMspName;
    property MspColor: TColor read FMspColor write FMspColor;
    property MspStyle: TFontStyles read FMspStyle write FMspStyle;
  end;

  TMisspellEvent = procedure (Sender: TObject; SRC: TSpellReturnCode;
                              BufPos, Len: Integer) of object;
  TChangeTextEvent = procedure(Sender: TObject; BufPos, Len: Integer;
                               NewWord: String) of object;
  TGetDictEvent = procedure(Sender: TObject; Language: TLanguage;
                            var Dict: TFileName) of object;

  TSpellerDialog2 = class;
  TAbstractSpeller = class;

 {$IFDEF VER130} { Borland Delphi 5.x }
  UTF8String = type string;
 {$ENDIF}

{ TSpellChecker }
  TSpellChecker = class(TComponent)
  private
    { Private declarations }
    FMemo,
    FBackMemo: TCustomMemo;
    FMemoRichEd: Boolean;
    FOptions: TSpellOptions;
    FLanguage: TLanguage;
    FLangOption: TLangOption;
    FSpellerType: TSpellerType;
    FISpellCmd,
    FISpellCharset,
    FISpellSurrogate,
    FFlag,
    FLangName: String;
    FActiveLanguage: Boolean;
    FDialog: TSpellerDialog2;
    FModalDialog: Boolean;
    FHTML: Boolean;
    FCustomDict: TFileName;
    FCaption: TCaption;
    FFont: TFont;
    FMissFont: TMisspellFont;
    Spellers: TList;
    CRPos,
    TagPos,
    LangPos: Integer;
    FStartSentence: Boolean;
    FSpellStart,
    FSpellEnd: Integer;
    FSpeller: TAbstractSpeller;
    FMisspellStart,
    FMisspellLen: Integer;
    FMisspellText: String;
    FLangSupport: Boolean;
    FUnicode: Boolean;
    FSRC: TSpellReturnCode;
    FFinishMessage: String;
    FUserLanguage: TUserLanguage;
    FShowFinishMessage: Boolean;
    FOnMisspell: TMisspellEvent;
    FOnChangeText: TChangeTextEvent;
    FOnFinished: TNotifyEvent;
    FOnCancel: TNotifyEvent;
    FCancelled: Boolean;
    FOnGetDict: TGetDictEvent;
  protected
    { Protected declarations }
    procedure SetLanguage(Value: TLanguage);
    procedure SetSpellerType(Value: TSpellerType);
    procedure SetUserLanguage(Value: TUserLanguage);
    procedure SetFont(Value: TFont);
    procedure SetMissFont(Value: TMisspellFont);
    procedure ChangeOnce(Word1: String);
    procedure Change(Word1: String);
    procedure ChangeAlways(Word1: String);
    procedure Delete;
    procedure Add;
    procedure IgnoreAlways;
    function OpenLanguage(Value: TLanguage; SpType: TSpellerType): Boolean;
    function FindLanguage(Value: TLanguage; SpType: TSpellerType): TAbstractSpeller;
    procedure Init;
    procedure GetBlock(From: Integer; var StartPos, EndPos: Integer);
    function GetMemoLanguage: TLanguage;
    procedure GetTag(From: Integer; var Len: Integer);
    procedure GetTextRange(Buf: PChar; StartPos, EndPos: Integer; CP: Word);
    function SentenceCapitalize(const S: String): String;
    procedure ContinueCheck;
    procedure FinishCheck;
    function GetLineFromPos(Pos: Integer; var LineStart: Integer): String;
    procedure GetMemoProperties;
    function GetCurrentLanguage: TLanguage;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    class procedure RegisterEditControl(MemoClass: String; Unicode, Multilanguage: Boolean);
    procedure Check(Memo: TCustomMemo);
    function IsKnownWord(Word: String; Language: TLanguage): Boolean;
    procedure AddWord(Word: String; Language: TLanguage);
    procedure GetVariants(Word: String; Variants: TStrings; Language: TLanguage);
    procedure SetFontDefault; virtual;
    property CurrentLanguage: TLanguage read GetCurrentLanguage;
    property ISpellCmd: String read FISpellCmd write FISpellCmd;
    property ISpellCharset: String read FISpellCharset write FISpellCharset;
    property ISpellSurrogate: String read FISpellSurrogate write FISpellSurrogate;
    property Flag: String read FFlag write FFlag;
    property LangName: String read FLangName write FLangName;
    property ActiveLanguage: Boolean read FActiveLanguage write FActiveLanguage;
  published
    { Published declarations }
    property Language: TLanguage read FLanguage write SetLanguage;
    property LangOption: TLangOption read FLangOption write FLangOption
      default loLocalized;
    property SpellerType: TSpellerType read FSpellerType write SetSpellerType;
    property UserLanguage: TUserLanguage read FUserLanguage write SetUserLanguage;
    property Options: TSpellOptions read FOptions write FOptions;
    property OnMisspelling: TMisspellEvent read FOnMisspell write FOnMisspell;
    property OnChangeText: TChangeTextEvent read FOnChangeText write FOnChangeText;
    property OnFinished: TNotifyEvent read FOnFinished write FOnFinished;
    property OnCancel: TNotifyEvent read FOnCancel write FOnCancel;
    property OnGetDictionary: TGetDictEvent read FOnGetDict write FOnGetDict;
    property Caption: TCaption read FCaption write FCaption;
    property Font: TFont read FFont write SetFont;
    property MisspellFont: TMisspellFont read FMissFont write SetMissFont;
    property ModalDialog: Boolean read FModalDialog write FModalDialog;
    property HTMLSupport: Boolean read FHTML write FHTML default False;
    property CustomDict: TFileName read FCustomDict write FCustomDict;
    property FinishMessage: String read FFinishMessage write FFinishMessage;
    property ShowFinishMessage: Boolean read FShowFinishMessage write FShowFinishMessage;
  end;

  TAbstractSpeller = class(TObject)
    FLanguage: TLanguage;
    FSpellerType: TSpellerType;
    FISpellCmd,
    FISpellCharset,
    FISpellSurrogate,
    FFlag,
    FLangName: String;
    FOptions: TSpellOptions;
    SpellChecker: TSpellChecker;
    FNotActive: Boolean;
    constructor Create(Language: TLanguage; Owner: TSpellChecker; Options: TSpellOptions); virtual;
    function FindMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode; virtual; abstract;
    function FindNextMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode; virtual; abstract;
    procedure ChangeOnce(Word, NewWord: String); virtual; abstract;
    procedure ChangeAlways(Word, NewWord: String); virtual; abstract;
    procedure Add(Word: String);  virtual; abstract;
    procedure IgnoreAlways(Word: String); virtual; abstract;
    procedure GetVariants(Word: String; Variants: TStrings); virtual; abstract;
    property Language: TLanguage read FLanguage;
    property SpellerType: TSpellerType read FSpellerType;
    property ISpellCmd: String read FISpellCmd;
    property ISpellCharset: String read FISpellCharset;
    property ISpellSurrogate: String read FISpellSurrogate;
    property Flag: String read FFlag;
    property LangName: String read FLangName;
    property Options: TSpellOptions read FOptions;
    function GetChangeText: String; virtual; abstract;
    function GetMisspellText: String; virtual; abstract;
    property ChangeText: String read GetChangeText;
    property MisspellText: String read GetMisspellText;
    property NotActive: Boolean read FNotActive;
  end;
  TSpellerClass = class of TAbstractSpeller;

  ESpellError = class(Exception);

  TSpellerDialog2 = class(TForm)
    InfoMsg: TLabel;
    Misspelling: TRichEdit;
    Label2: TLabel;
    Variants: TListBox;
    ChangeButton: TButton;
    ChangeAllButton: TButton;
    SkipButton: TButton;
    SkipAllButton: TButton;
    AddButton: TButton;
    CancelButton: TButton;
    CancelEdit: TButton;
    DelButton: TButton;
    procedure DelButtonClick(Sender: TObject);
    procedure SkipButtonClick(Sender: TObject);
    procedure SkipAllButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
    procedure ChangeButtonClick(Sender: TObject);
    procedure ChangeAllButtonClick(Sender: TObject);
    procedure MisspellingProtectChange(Sender: TObject; StartPos,
      EndPos: Integer; var AllowChange: Boolean);
    procedure MisspellingChange(Sender: TObject);
    procedure CancelEditClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure StartButtonClick(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Checker: TSpellChecker;
    FShowing: Boolean;
    procedure ShowForChange(Msg: TCaption);
    procedure ShowForDelete;
    procedure ShowForEdit(Msg: TCaption);
    procedure ShowMisspelling;
    procedure GetHotArea(var SS, SL: Integer);
  public
    { Public declarations }
    constructor Create(SpellChecker: TSpellChecker); reintroduce; overload;
  end;

const
  langAfrikaans = TLanguage(1078);
  langAlbanian = TLanguage(1052);
  langArabic = TLanguage(1025);
  langBasque = TLanguage(1069);
  langBelgianDutch = TLanguage(2067);
  langBelgianFrench = TLanguage(2060);
  langBrazilianPortuguese = TLanguage(1046);
  langBulgarian = TLanguage(1026);
  langByelorussian = TLanguage(1059);
  langCatalan = TLanguage(1027);
  langCroatian = TLanguage(1050);
  langCzech = TLanguage(1029);
  langDanish = TLanguage(1030);
  langDutch = TLanguage(1043);
  langEnglishAUS = TLanguage(3081);
  langEnglishCanadian = TLanguage(4105);
  langEnglishNewZealand = TLanguage(5129);
  langEnglishSouthAfrica = TLanguage(7177);
  langEnglishUK = TLanguage(2057);
  langEnglishUS = TLanguage(1033);
  langEstonian = TLanguage(1061);
  langFaeroese = TLanguage(1080);
  langFarsi = TLanguage(1065);
  langFinnish = TLanguage(1035);
  langFinnishSwedish = TLanguage(2077);
  langFrench = TLanguage(1036);
  langFrenchCanadian = TLanguage(3084);
  langGerman = TLanguage(1031);
  langGreek = TLanguage(1032);
  langHebrew = TLanguage(1037);
  langHungarian = TLanguage(1038);
  langItalian = TLanguage(1040);
  langIcelandic = TLanguage(1039);
  langIndonesian = TLanguage(1057);
  langJapanese = TLanguage(1041);
  langKorean = TLanguage(1042);
  langLatvian = TLanguage(1062);
  langLithuanian = TLanguage(1063);
  langMacedonian = TLanguage(1071);
  langMalaysian = TLanguage(1086);
  langMexicanSpanish = TLanguage(2058);
  langNorwegianBokmol = TLanguage(1044);
  langNorwegianNynorsk = TLanguage(2068);
  langPolish = TLanguage(1045);
  langPortuguese = TLanguage(2070);
  langRomanian = TLanguage(1048);
  langRussian = TLanguage(1049);
  langSerbianCyrillic = TLanguage(3098);
  langSerbianLatin = TLanguage(2074);
  langSesotho = TLanguage(1072);
  langSimplifiedChinese = TLanguage(2052);
  langSlovak = TLanguage(1051);
  langSlovenian = TLanguage(1060);
  langSpanish = TLanguage(1034);
  langSpanishModernSort = TLanguage(3082);
  langSwedish = TLanguage(1053);
  langSwissFrench = TLanguage(4108);
  langSwissGerman = TLanguage(2055);
  langSwissItalian = TLanguage(2064);
  langThai = TLanguage(1054);
  langTraditionalChinese = TLanguage(1028);
  langTsonga = TLanguage(1073);
  langTswana = TLanguage(1074);
  langTurkish = TLanguage(1055);
  langUkrainian = TLanguage(1058);
  langVenda = TLanguage(1075);
  langVietnamese = TLanguage(1066);
  langXhosa = TLanguage(1076);
  langZulu = TLanguage(1077);

var
  spOVariants, spODelete, spOChange, spOChangeAll, spOSkip, spOSkipAll, spOAdd,
   spOCancel, spOCancelEdit, spONotFound, spOHyphen, spOCaps, spOAbbrev,
   spONoSentenceCap, spOExtraSpaces, spOMissingSpace, spOInitialNumeral,
   spORepeatedWord, spOFinish, spOFinishCaption, spOCaption, spOError,
   spOErrorLoad, spOErrorUnload, spOErrorNoSpellChecker, spOStart: String;
  WinNT: Boolean; 

function GetSpellLanguages(Languages: TStrings; Option: TLangOption): Integer;
function GetISpellLanguages(Languages: TStrings; Option: TLangOption): Integer;

function SptToStr(Value: TSpellerType): String;

implementation

uses
  CSAPI, SpellRes, SpellResDe, Registry, ISpell, ufrmMain;

{$R *.DFM}

var
  spVariants, spDelete, spChange, spChangeAll, spSkip, spSkipAll,
   spAdd, spCancel, spCancelEdit, spNotFound, spHyphen, spCaps,
   spAbbrev, spNoSentenceCap, spExtraSpaces, spMissingSpace,
   spInitialNumeral, spRepeatedWord, spFinish, spFinishCaption,
   spCaption, spError, spErrorLoad, spErrorUnload, spErrorNoSpellChecker,
   spStart: String;

type
  TMemoClass = class of TCustomMemo;

{TAbstractSpeller}
constructor TAbstractSpeller.Create(Language: TLanguage; Owner: TSpellChecker; Options: TSpellOptions);
begin
  inherited Create;
  FLanguage:= Language;
  FOptions:= Options;
  SpellChecker:= Owner;
end;

procedure CheckSR(SR: TSEC);
begin
  if (SR<>secNoErrors) then
    raise ESpellError.CreateFmt(spError, [SR]);
end;

{TCSAPISpeller}
type
  TCSAPISpeller = class(TAbstractSpeller)
  private
    SpellInstance: THandle;
    DLLName: String;
    LexName: String;
    UserDict: TFileName;
    UnkWord: String;
    FOptions: TSpellOptions;
    SpellVer: TSpellVerFunc;
    SpellInit: TSpellInitFunc;
    SpellOptions: TSpellOptionsFunc;
    SpellCheck: TSpellCheckFunc;
    SpellTerminate: TSpellTerminateFunc;
    SpellVerifyMdr: TSpellVerifyMdrFunc;
    SpellOpenMdr: TSpellOpenMdrFunc;
    SpellOpenUdr: TSpellOpenUdrFunc;
    SpellAddUdr: TSpellAddUdrFunc;
    SpellAddChangeUdr: TSpellAddChangeUdrFunc;
    SpellDelUdr: TSpellDelUdrFunc;
    SpellClearUdr: TSpellClearUdrFunc;
    SpellGetSizeUdr: TSpellGetSizeUdrFunc;
    SpellGetListUdr: TSpellGetListUdrFunc;
    SpellCloseMdr: TSpellCloseMdrFunc;
    SpellCloseUdr: TSpellCloseUdrFunc;
  protected
    Handle: TSPLID;
    SpecChars: TWSC;
    Mdrs: TMDRS;
    Udr: TUDR;
    InputBuffer: TSIB;
    ResultBuffer: TSRB;
    constructor Create(Language: TLanguage; Owner: TSpellChecker; Options: TSpellOptions); override;
    destructor Destroy; override;
    function FindMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode; override;
    function FindNextMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode; override;
    procedure ChangeOnce(Word, NewWord: String); override;
    procedure ChangeAlways(Word, NewWord: String); override;
    procedure Add(Word: String); override;
    procedure IgnoreAlways(Word: String); override;
    procedure GetVariants(Word: String; Variants: TStrings); override;
    function GetChangeText: String; override;
    function GetMisspellText: String; override;
  end;

{$O-}

constructor TCSAPISpeller.Create(Language: TLanguage; Owner: TSpellChecker; Options: TSpellOptions);
var
  UdrRO: Boolean;
  NotFound: Boolean;
  Registry: TRegistry;
begin
  inherited;
  FSpellerType := sptMSOffice;
  with SpecChars do
    begin
      bIgnore:= #0;
      bHyphenHard:= #45;
      bHyphenSoft:= #31;
      bHyphenNonBreaking:= #30;
      bEmDash:= #151;
      bEnDash:= #150;
      bEllipsis:= #133;
      rgLineBreak:= #11#10;
      rgParaBreak:= #13#10;
    end;
  Registry:= TRegistry.Create;
  Registry.RootKey:= HKEY_LOCAL_MACHINE;
  try
    NotFound:= True;
    if Registry.OpenKeyReadOnly(
        Format('\SOFTWARE\Microsoft\Shared Tools\Proofing Tools\Spelling\%d\Normal', [FLanguage])) or
       Registry.OpenKeyReadOnly(
        Format('\SOFTWARE\Microsoft\Shared Tools\Proofing Tools\Spelling\%d\Normal', [1024+(FLanguage mod 1024)]))
      then begin
      DLLName:= Registry.ReadString('Engine');
      LexName:= Registry.ReadString('Dictionary');
      NotFound := False;
      end;
    if not NotFound then begin
      if (SpellChecker.CustomDict='') and Registry.OpenKeyReadOnly(
         '\SOFTWARE\Microsoft\Shared Tools\Proofing Tools\Custom Dictionaries')
        then UserDict:= Registry.ReadString('1')
        else begin
          UserDict:= SpellChecker.CustomDict;
          if (SpellChecker.CustomDict='') then begin
            try
              Registry.Access := KEY_ALL_ACCESS;
              Registry.OpenKey(
                '\SOFTWARE\Microsoft\Shared Tools\Proofing Tools\Custom Dictionaries', True)
            except on E: Exception do
              Registry.Access := KEY_READ;
            end;
          end;
        end;
      if Assigned(SpellChecker.FOnGetDict)
        then SpellChecker.FOnGetDict(SpellChecker, FLanguage, UserDict);
      if UserDict='' then
        begin
          UserDict:= ExtractFilePath(LexName)+'CUSTOM.DIC';
          try
            Registry.WriteString('1', UserDict);
            Registry.CloseKey;
          except end;  
        end;
    end;
  finally
    Registry.Free;
  end;  
  if NotFound then
    begin
      FNotActive:= True;
      Exit;
    end;
  try
    SpellInstance:= LoadLibrary(PChar(DllName));
  except
    FNotActive:= True;
    raise ESpellError.CreateFmt(spErrorLoad, [DllName]);
  end;
  try
    @SpellVer:= GetProcAddress(SpellInstance, 'SpellVer');
    @SpellInit:= GetProcAddress(SpellInstance, 'SpellInit');
    @SpellOptions:= GetProcAddress(SpellInstance, 'SpellOptions');
    @SpellCheck:= GetProcAddress(SpellInstance, 'SpellCheck');
    @SpellTerminate:= GetProcAddress(SpellInstance, 'SpellTerminate');
    @SpellVerifyMdr:= GetProcAddress(SpellInstance, 'SpellVerifyMdr');
    @SpellOpenMdr:= GetProcAddress(SpellInstance, 'SpellOpenMdr');
    @SpellOpenUdr:= GetProcAddress(SpellInstance, 'SpellOpenUdr');
    @SpellAddUdr:= GetProcAddress(SpellInstance, 'SpellAddUdr');
    @SpellAddChangeUdr:= GetProcAddress(SpellInstance, 'SpellAddChangeUdr');
    @SpellDelUdr:= GetProcAddress(SpellInstance, 'SpellDelUdr');
    @SpellClearUdr:= GetProcAddress(SpellInstance, 'SpellClearUdr');
    @SpellGetSizeUdr:= GetProcAddress(SpellInstance, 'SpellGetSizeUdr');
    @SpellGetListUdr:= GetProcAddress(SpellInstance, 'SpellGetListUdr');
    @SpellCloseMdr:= GetProcAddress(SpellInstance, 'SpellCloseMdr');
    @SpellCloseUdr:= GetProcAddress(SpellInstance, 'SpellCloseUdr');
  except
    FreeLibrary(SpellInstance);
    FNotActive:= True;
    raise ESpellError.CreateFmt(spErrorLoad, [DllName]);
  end;
  FNotActive:= False;
  FOptions:= Options;
  CheckSR(SpellInit(Handle, SpecChars));
  CheckSR(SpellOptions(Handle, Word(FOptions)));
  CheckSR(SpellOpenMdr(Handle, PChar(LexName), nil, False, True, FLanguage, Mdrs));
  CheckSR(SpellOpenUdr(Handle, PChar(UserDict), True, IgnoreAlwaysProp, Udr, UdrRO));
  with InputBuffer do
    begin
      cMdr:= 1;
      cUdr:= 1;
      lrgMdr:= @Mdrs.MDR;
      lrgUdr:= @Udr;
    end;
  with ResultBuffer do
    begin
      cch:= 1024;
      lrgsz:= AllocMem(1024);
      lrgbRating:= AllocMem(255);
      cbRate:= 255;
    end;
end;

destructor TCSAPISpeller.Destroy;
var
 SR1: TSEC;
begin
  if not FNotActive then
    begin
      FreeMem(ResultBuffer.lrgsz);
      FreeMem(ResultBuffer.lrgbRating);
      CheckSR(SpellCloseMdr(Handle, Mdrs));
      SR1 := SpellCloseUdr(Handle, Udr, True);
      if (SR1 <> 33026) then CheckSR(SR1);
      CheckSR(SpellTerminate(Handle, True));
      try
        FreeLibrary(SpellInstance);
      except
        raise ESpellError.CreateFmt(spErrorUnLoad, [DllName]);
      end;
    end;
  inherited;
end;

function TCSAPISpeller.FindMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode;
begin
  if FNotActive then
    begin
      Result:= srNoErrors;
      Exit;
    end;
  InputBuffer.cch:= MaxLen;
  InputBuffer.lrgch:= Buf;
  InputBuffer.wSpellState:= fssStartsSentence;
  CheckSR(SpellCheck(handle, sccVerifyBuffer, InputBuffer, ResultBuffer));
  Result:= TSpellReturnCode(ResultBuffer.scrs);
  if Result<>srNoErrors then
    begin
      Start:= ResultBuffer.ichError;
      Len:= ResultBuffer.cchError;
      SetLength(UnkWord, ResultBuffer.cchError);
      StrLCopy(@UnkWord[1], InputBuffer.lrgch+ResultBuffer.ichError, ResultBuffer.cchError);
    end;
end;

function TCSAPISpeller.FindNextMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode;
begin
  if FNotActive then
    begin
      Result:= srNoErrors;
      Exit;
    end;
  InputBuffer.cch:= MaxLen;
  InputBuffer.lrgch:= Buf;
  InputBuffer.wSpellState:= fssIsContinued;
  CheckSR(SpellCheck(Handle, sccVerifyBuffer, InputBuffer, ResultBuffer));
  Result:= TSpellReturnCode(ResultBuffer.scrs);
  if Result<>srNoErrors then
    begin
      Start:= ResultBuffer.ichError;
      Len:= ResultBuffer.cchError;
      SetLength(UnkWord, ResultBuffer.cchError);
      StrLCopy(@UnkWord[1], InputBuffer.lrgch+ResultBuffer.ichError, ResultBuffer.cchError);
    end;
end;

procedure TCSAPISpeller.ChangeOnce(Word, NewWord: String);
begin
  if FNotActive then
    Exit;
  CheckSR(SpellAddChangeUdr(Handle, udrChangeOnce,
      PChar(Word), PChar(NewWord)));
end;

procedure TCSAPISpeller.ChangeAlways(Word, NewWord: String);
begin
  if FNotActive then
    Exit;
  CheckSR(SpellAddChangeUdr(Handle, udrChangeAlways,
      PChar(Word), PChar(NewWord)));
end;

procedure TCSAPISpeller.Add(Word: String);
begin
  if FNotActive then
    Exit;
  CheckSR(SpellAddUdr(Handle, Udr, PChar(Word)));
end;

procedure TCSAPISpeller.IgnoreAlways(Word: String);
begin
  if FNotActive then
    Exit;
  CheckSR(SpellAddUdr(Handle, udrIgnoreAlways, PChar(Word)));
end;

procedure TCSAPISpeller.GetVariants(Word: String; Variants: TStrings);
var
  SIB: TSIB;
  SRB: TSRB;
  Buf: array[0..2047]of Char;
  Ratings: array[0..255]of Byte;
  P: PChar;
begin
  Variants.Clear;
  if FNotActive then
    Exit;
  with SIB do
    begin
      cch:= Length(Word);
      cMdr:= 1;
      cUdr:= 1;
      wSpellState:= fssNoStateInfo;
      lrgch:= @Word[1];
      lrgMdr:= @Mdrs.MDR;
      lrgUdr:= @Udr;
    end;
  with SRB do
    begin
      cch:= 2047;
      lrgsz:= @Buf;
      lrgbRating:= @Ratings;
      cbRate:= 255;
    end;
  CheckSR(SpellCheck(Handle, sccSuggest, SIB, SRB));
  while SRB.scrs<>scrsNoMoreSuggestions do
    begin
      P:= SRB.lrgsz;
      while P^<>#0 do
        begin
          if Variants.IndexOf(P)=-1 then
            Variants.Add(P);
          while P^<>#0 do
            Inc(P);
          Inc(P);
        end;
      CheckSR(SpellCheck(Handle, sccSuggestMore, SIB, SRB));
    end;
end;

function TCSAPISpeller.GetChangeText: String;
begin
  if FNotActive then
    Result:= ''
  else
    Result:= ResultBuffer.lrgsz;
end;

function TCSAPISpeller.GetMisspellText: String;
begin
  if FNotActive then
    Result:= ''
  else
    Result:= UnkWord;
end;  {TCSAPISpeller}
{$O+}

{TISpeller}
type
  TISpeller = class(TAbstractSpeller)
  private
    FOptions: TSpellOptions;
    si_r, si_w, so_r, so_w, se_r, se_w: THandle;
    PI: TProcessInformation;
    M, Repl: String;
    UnkWord: WideString;
    ReplData: TStringList;
    function SpellCheck (word: String): String;
    function Check(Word: WideString): Boolean;
    procedure SpellCommand (Word: WideString);
  protected
    constructor Create(Language: TLanguage; Owner: TSpellChecker; Options: TSpellOptions); override;
    destructor Destroy; override;
    function FindMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode; override;
    function FindNextMisspell(Buf: PChar; MaxLen: Integer; var Start, Len: Integer): TSpellReturnCode; override;
    procedure ChangeOnce(Word, NewWord: String); override;
    procedure ChangeAlways(Word, NewWord: String); override;
    procedure Add(Word: String); override;
    procedure IgnoreAlways(Word: String); override;
    procedure GetVariants(Word: String; Variants: TStrings); override;
    function GetChangeText: String; override;
    function GetMisspellText: String; override;
  public
    Tbl: TConvTable;
  end;  {TISpeller}


type
  THTMLBracket = (thbTag, thbComment, thbBasic);

const
  OpenBracket: array[THTMLBracket] of PChar=('<', '<!--', '<%');
  CloseBracket: array[THTMLBracket] of PChar=('>', '-->', '%>');

var
  ControlTypes: TStrings;

{TSpellChecker}
constructor TSpellChecker.Create(AOwner: TComponent);
begin
  inherited;
  FLanguage:= GetSystemDefaultLCID;
  FOptions:= [spoSuggestFromUserDict, spoIgnoreAllCaps, spoIgnoreMixedDigits,
              spoIgnoreRomanNumerals];
  ActiveLanguage := True;
  FFont := TFont.Create;
  FMissFont := TMisspellFont.Create;
  Spellers:= TList.Create;
  SetFontDefault;
end;

destructor TSpellChecker.Destroy;
var
  I: Integer;
begin
  for I:= Spellers.Count-1 downto 0 do
    TAbstractSpeller(Spellers.Items[I]).Free;
  Spellers.Free;
  FFont.Free;
  FMissFont.Free;
  inherited;
end;

class procedure TSpellChecker.RegisterEditControl(MemoClass: String; Unicode, MultiLanguage: Boolean);
begin
  ControlTypes.AddObject(MemoClass, Pointer(Ord(Unicode) or Ord(MultiLanguage)*2));
end;

procedure TSpellChecker.GetMemoProperties;
var
  C: TClass;
  I: Integer;
begin
  C:= FMemo.ClassType;
  repeat
    for I:= 0 to ControlTypes.Count-1 do
      if AnsiCompareText(C.ClassName, ControlTypes[I])=0 then
        begin
          FLangSupport:= Boolean(Integer(ControlTypes.Objects[I]) shr 1);
          FUnicode:= Boolean(Integer(ControlTypes.Objects[I]) and 1);
          Exit;
        end;
    C:= C.ClassParent;
  until C=TCustomEdit;
  raise ESpellError.CreateFmt('You can''t spell check %s.', [FMemo.Name]);
end;

procedure TSpellChecker.SetLanguage(Value: TLanguage);
begin
  FLanguage:= Value;
end;

{$WARNINGS OFF}
function TSpellChecker.OpenLanguage(Value: TLanguage; SpType:
                                    TSpellerType): Boolean;
var
  Speller: TAbstractSpeller;
begin
 Result:= False;
 if SpType = sptMSOffice then begin
   try
     Speller:= TCSAPISpeller.Create(Value, Self, FOptions);
   except
     try
       Speller.Free;
     except end;
     Exit;
   end;
   Spellers.Add(Speller);
   Result:= True;
  end; //if SpellerType = sptMSOffice
 if SpType = sptISpell then begin
   try
     Speller:= TISpeller.Create(Value, Self, FOptions);
   except
     try
       Speller.Free;
     except end;
     Exit;
   end;
   Spellers.Add(Speller);
   Result:= True;
  end; //if SpellerType = sptISpell
end;
{$WARNINGS ON}
function TSpellChecker.FindLanguage(Value: TLanguage; SpType: TSpellerType): TAbstractSpeller;
var
  I: Integer;
begin
  for I:= 0 to Spellers.Count-1 do
    if TAbstractSpeller(Spellers.Items[I]).Language=Value then
      if TAbstractSpeller(Spellers.Items[I]).FSpellerType = SpType
        then begin
          Result:= TAbstractSpeller(Spellers.Items[I]);
          Exit;
        end;
  if OpenLanguage(Value, SpType) then
    Result:= TAbstractSpeller(Spellers.Items[Spellers.Count-1])
  else
    Result:= nil;
end;

function TSpellChecker.IsKnownWord(Word: String; Language: TLanguage): Boolean;
var
  Start, Len: Integer;
begin
  with FindLanguage(Language, SpellerType) do
    Result:= FindMisspell(@Word[1], Length(Word), Start, Len)=srNoErrors;
end;

procedure TSpellChecker.AddWord(Word: String; Language: TLanguage);
begin
  with FindLanguage(Language, SpellerType) do
    Add(Word);
end;

procedure TSpellChecker.GetVariants(Word: String; Variants: TStrings; Language: TLanguage);
begin
  with FindLanguage(Language, SpellerType) do
    GetVariants(Word, Variants);
end;

procedure TSpellChecker.GetTag(From: Integer; var Len: Integer);
var
  P, PP: PChar;
  HTMLTag: THTMLBracket;
  S: String;
begin
  SetLength(S, FSpellEnd-From);
  GetTextRange(@S[1], From, FSpellEnd, 1252);
  if StrLComp(@S[1], OpenBracket[thbComment], StrLen(OpenBracket[thbComment]))=0 then
    HTMLTag:= thbComment
  else if StrLComp(@S[1], OpenBracket[thbBasic], StrLen(OpenBracket[thbBasic]))=0 then
    HTMLTag:= thbBasic
  else
    HTMLTag:= thbTag;
  P:= StrPos(@S[1], CloseBracket[HTMLTag])+StrLen(CloseBracket[HTMLTag]);
  if HTMLTag<>thbBasic then
    begin
      PP:= StrScan(@S[2], '<');
      if (PP<>nil) and (PP<P) then
        begin
          GetTag(PP-@S[1]+From, Len);
          P:= StrPos(PP+Len, CloseBracket[HTMLTag])+StrLen(CloseBracket[HTMLTag]);
        end;
    end;
  if P=nil then
    Len:= Length(S)
  else
    Len:= P-@S[1];
end;

procedure TSpellChecker.GetTextRange(Buf: PChar; StartPos, EndPos: Integer; CP: Word);
type
{ The declarations of TTextRangeA and TTextRangeW in Richedit.pas are incorrect}
  TTextRangeA = record
    chrg: TCharRange;
    lpstrText: PAnsiChar; {not AnsiChar!}
  end;
var
  W: WideString;
  S: String;
  GTL: TGetTextLengthEx;
  GT: TGetTextEx;
  L: Integer;
begin
  GTL.flags:= GTL_DEFAULT;
  GTL.codepage:= 1200;
  L:= FMemo.Perform(EM_GETTEXTLENGTHEX, Integer(@GTL), 0);
  if L>0 then
    begin
      SetLength(W, L);
      GT.cb:= L*2+2;
      GT.flags:= GT_DEFAULT;
      GT.codepage:= 1200;
      GT.lpDefaultChar:= nil;
      GT.lpUsedDefChar:= nil;
      FMemo.Perform(EM_GETTEXTEX, Integer(@GT), Integer(@W[1]));
      WideCharToMultiByte(CP, 0, @W[StartPos+1], EndPos-StartPos, Buf, EndPos-StartPos, nil, nil);
      Buf[EndPos-StartPos]:= #0;
    end
  else
    begin
      S:= FBackMemo.Text;
      StrLCopy(Buf, @S[StartPos+1], EndPos-StartPos);
    end;
end;

function TSpellChecker.GetMemoLanguage: TLanguage;
var
  CF: TCharFormat2A;
  CFW: TCharFormat2W;
begin
  if not FLangSupport then
    Result:= FLanguage
  else if FUnicode then
    begin
      FillChar(CFW, SizeOf(CFW), 0);
      CFW.cbSize:= SizeOf(CFW);
      FBackMemo.Perform(EM_GETCHARFORMAT, 1, LongInt(@CFW));
      Result:= CFW.lid;
    end
  else
    begin
      FillChar(CF, SizeOf(CF), 0);
      CF.cbSize:= SizeOf(CF);
      FBackMemo.Perform(EM_GETCHARFORMAT, 1, LongInt(@CF));
      Result:= CF.lid;
    end;
end;

{$WARNINGS OFF}
procedure TSpellChecker.GetBlock(From: Integer; var StartPos, EndPos: Integer);
var
  L, Lang: TLanguage;
  FT: TFindTextA;
  FTW: TFindTextW;
  C, tes: Char;
  P, Len, LP: Integer;
  S: String;
  Pos: PChar;
begin
  P:= From-1;
  repeat
    Inc(P);
    GetTextRange(@C, P, P+1, 1252);
    if FHTML and (C =  '<') then
      begin
        (*
        JCFaria: to fix bug associated to the '<' and '<-' in R scripts,
        if fHTML = True
        GetTag(P, Len);
        Inc(P, Len-1);
        *)
        GetTextRange(@tes, P+1, P+2, 1252);
        if (tes <> '-') and   //<-
           (tes <> '<') then  //<<-
          begin
            GetTag(P, Len);
            if Len > 0 then Inc(P, Len-1);
          end
        else
          Inc(P);
      end
    else if C=#13 then
      FStartSentence:= True
    else if not (C in [#10, #13, #11]) then
      Break;
  until P>=FSpellEnd;
  if P<FSpellEnd then
    begin
      StartPos:= P;
      if FUnicode then
        begin
          if CRPos<=StartPos then
            begin
              FTW.chrg.cpMin:= StartPos;
              FTW.chrg.cpMax:= FSpellEnd;
              FTW.lpstrText:= #13;
              CRPos:= FBackMemo.Perform(EM_FINDTEXTEX, 1, LongInt(@FTW));
              if CRPos=-1 then
                CRPos:= FSpellEnd;
            end;
          if FHTML then
            if (TagPos<=StartPos) then
              begin
                FTW.chrg.cpMin:= StartPos;
                FTW.chrg.cpMax:= FSpellEnd;
                FTW.lpstrText:= '<';
                TagPos:= FBackMemo.Perform(EM_FINDTEXTEX, 1, LongInt(@FTW));
                if TagPos=-1 then
                  TagPos:= FSpellEnd;
              end
            else
          else
            TagPos:= FSpellEnd;
        end
      else if (FBackMemo is TCustomRichEdit) then
        begin
          if CRPos<=StartPos then
            begin
              FT.chrg.cpMin:= StartPos;
              FT.chrg.cpMax:= FSpellEnd;
              FT.lpstrText:= #13;
              CRPos:= FBackMemo.Perform(EM_FINDTEXT, 1, LongInt(@FT));
              if CRPos=-1 then
                CRPos:= FSpellEnd;
            end;
          if FHTML then
            if (TagPos<=StartPos) then
              begin
                FT.chrg.cpMin:= StartPos;
                FT.chrg.cpMax:= FSpellEnd;
                FT.lpstrText:= '<';
                TagPos:= FBackMemo.Perform(EM_FINDTEXT, 1, LongInt(@FT));
                if TagPos=-1 then
                  TagPos:= FSpellEnd;
              end
            else
          else
            TagPos:= FSpellEnd;
        end
      else
        begin
          S:= FMemo.Text;
          Pos:= StrScan(@S[StartPos+1], #13);
          if Pos<>nil then
            CRPos:= Pos-@S[1]
          else
            CRPos:= FSpellEnd;
          Pos:= StrScan(@S[StartPos+1], '<');
          if Pos<>nil then
            TagPos:= Pos-@S[1]
          else
            TagPos:= FSpellEnd;
        end;
      if FLangSupport then
        if LangPos<=StartPos then
          begin
            FBackMemo.Perform(EM_SETSEL, StartPos, StartPos+1);
            L:= GetMemoLanguage;
            LangPos:= StartPos;
            repeat
              LP:= FBackMemo.Perform(EM_FINDWORDBREAK, WB_RIGHT, LangPos);
              if LP<LangPos then
                Break;
              if (LP=LangPos) and (LP<FSpellEnd) then
                Inc(LP);
              LangPos:= LP;
              FBackMemo.Perform(EM_SETSEL, LangPos, LangPos+1);
              Lang:= GetMemoLanguage;
            until (Lang<>L) or (LangPos>=FSpellEnd);
          end
        else
      else
        LangPos:= FSpellEnd;
      EndPos:= MinIntValue([CRPos, TagPos, LangPos]);
    end
  else
    begin
      StartPos:= FSpellEnd;
      EndPos:= FSpellEnd;
    end;
  if StartPos=0 then
    FStartSentence:= True
  else
    begin
      GetTextRange(@C, StartPos-1, StartPos, 1252);
      FStartSentence:= C=#13;
    end;
end;
{$WARNINGS ON}

procedure TSpellChecker.Init;
var
  MemoClass: TMemoClass;
  MS: TMemoryStream;
  S: String;
  P: PChar;
  L: Integer;
  PT: Boolean;
begin
  FCancelled := False;
  GetMemoProperties;
  MemoClass:= TMemoClass(FMemo.ClassType);
  if Assigned(FBackMemo) then
    FBackMemo.Free;
  FBackMemo:= MemoClass.Create(FMemo.Owner);
  FBackMemo.Visible := False;
  FBackMemo.Parent := FMemo.Owner as TWinControl;
  MS:= TMemoryStream.Create;
  FMemoRichEd := (FMemo is TCustomRichEdit);
  if FMemoRichEd then
    begin
      PT:= TRichEdit(FMemo).PlainText;
      TRichEdit(FMemo).PlainText:= False;
      TRichEdit(FMemo).Lines.SaveToStream(MS);
      MS.Position:= 0;
      TRichEdit(FBackMemo).Lines.LoadFromStream(MS);
      TRichEdit(FMemo).PlainText:= PT;
    end
  else
    begin
      FMemo.Lines.SaveToStream(MS);
      MS.Position:= 0;
      FBackMemo.Lines.LoadFromStream(MS);
    end;
  MS.Free;
  FMemo.Perform(EM_GETSEL, Integer(@FSpellStart), Integer(@FSpellEnd));
  if FSpellEnd=FSpellStart then
    FSpellEnd:= FMemo.Perform(WM_GETTEXTLENGTH, 0, 0);
  FSpellStart:= FMemo.Perform(EM_FINDWORDBREAK, WB_LEFTBREAK, FSpellStart);
  if FSpellStart>0 then
    FSpellStart:= FMemo.Perform(EM_FINDWORDBREAK, WB_RIGHT, FSpellStart);
  if FHTML then
    begin
      S:= FBackMemo.Text;
      P:= @S[1];
      repeat
        P:= StrPos(P, '<');
        if (P=nil) or (P-@S[1]>FSpellStart) then
          Break;
        GetTag(P-@S[1], L);
        if (P-@S[1]+L>FSpellStart) then
          begin
            if (P-@S[1]+L<FSpellEnd) then
              FSpellStart:= P-@S[1]+L
            else
              FSpellStart:= FSpellEnd;
            Break;
          end;
        Inc(P, L);
      until False;
    end;
  FMisspellStart:= FSpellStart;
  FMisspellLen:= 0;
  CrPos:= 0;
  TagPos:= 0;
  LangPos:= 0;
end;

function TSpellChecker.SentenceCapitalize(const S: String): String;
begin
  REsult:= S;
  LCMapString(CurrentLanguage, LCMAP_Uppercase, @S[1], 1, @Result[1], 1);
end;

procedure TSpellChecker.Check(Memo: TCustomMemo);
begin
  If (ActiveLanguage = False) or (Memo.Text = '') then Exit;
  FMemo:= Memo;
  if not Assigned(FDialog) then
    FDialog:= TSpellerDialog2.Create(Self);
  Init;
  ContinueCheck;
end;

procedure TSpellChecker.FinishCheck;
begin
  FDialog.Hide;
  FDialog.Close;
  if Assigned(FBackMemo) then
    FBackMemo.Free;
  FBackMemo:= nil;
  if Assigned(FOnFinished) then FOnFinished(Self);
  if FShowFinishMessage and (FFinishMessage<>'') and (not FSpeller.FNotActive) then
    MessageBox(Application.Handle, @FFinishMessage[1],
      PChar(spFinishCaption), mb_Ok+mb_IconInformation);
end;

procedure TSpellChecker.ContinueCheck;
var
  StartPos,
  EndPos: Integer;
  L: TLanguage;
  Buf: PChar;
begin
  try
    FSRC:= srNoErrors;
    repeat
      GetBlock(FMisspellStart+FMisspellLen, StartPos, EndPos);
      if StartPos=EndPos then
        begin
          FinishCheck;
          Break;
        end;
      FBackMemo.Perform(EM_SETSEL, StartPos, StartPos+1);
      L:= GetMemoLanguage;
      FSpeller:= Findlanguage(L, SpellerType);
      Buf:= AllocMem(EndPos-StartPos+1);
      GetTextRange(Buf, StartPos, EndPos, CodePageFromLocale(L));
      if FStartSentence then
        FSRC:= FSpeller.FindMisspell(Buf, EndPos-StartPos, FMisspellStart, FMisspellLen)
      else
        FSRC:= FSpeller.FindNextMisspell(Buf, EndPos-StartPos, FMisspellStart, FMisspellLen);
      FreeMem(Buf);
      if FSRC<>srNoErrors then
        begin
          Inc(FMisspellStart, StartPos);
          if FSRC=srExtraSpaces then
            Dec(FMisspellLen);
          FMemo.SelStart:= FMisspellStart;
          FMemo.SelLength:= FMisspellLen;
          FBackMemo.SelStart:= FMisspellStart;
          FBackMemo.SelLength:= FMisspellLen;
          FMisspellText:= FSpeller.MisspellText;
        end
      else
        begin
          FMisspellStart:= EndPos;
          FMisspellLen:= 0;
        end;
      if (FSRC=srReturningChangeAlways) then
        Change(FSpeller.ChangeText);
    until not (FSRC in [srNoErrors, srReturningChangeAlways]);
    if not (FSRC in [srNoErrors, srReturningChangeAlways]) then
      begin
  {
        if FSpeller.Language <> 0
          then FDialog.Caption:= Format(Caption, [LanguageName(FSpeller.Language,
                                        LangOption)])
          else FDialog.Caption:= Format(Caption, [FSpeller.LangName]);
  }
        //small correction by jcfaria
        with FDialog do begin
          if (FSpeller.Language <> 0)
            then Caption:= Format(Caption, [LanguageName(FSpeller.Language, LangOption)])
            else Caption:= Format(Caption, [FSpeller.LangName]);
        end;
        case FSRC of
          srUnknownInputWord: FDialog.ShowForChange(spNotFound);
          srReturningChangeOnce:
            begin
             FDialog.ShowForChange(spNotFound);
             if FDialog.Variants.Items.IndexOf(FSpeller.ChangeText)=-1 then
               FDialog.Variants.Items.Insert(0, FSpeller.ChangeText);
            end;
          srInvalidHyphenation: FDialog.ShowForChange(spHyphen);
          srErrorCapitalization: FDialog.ShowForChange(spCaps);
          srWordConsideredAbbreviation: FDialog.ShowForChange(spAbbrev);
          srNoSentenceStartCap: FDialog.ShowForChange(spNoSentenceCap);
          srRepeatWord: FDialog.ShowForDelete;
          srExtraSpaces: FDialog.ShowForChange(spExtraSpaces);
          srMissingSpace: FDialog.ShowForEdit(spMissingSpace);
          srInitialNumeral: FDialog.ShowForEdit(spInitialNumeral);
        end;
        //small correction by jcfaria
        (*
        if not (FDialog.Visible or (FSRC in [srNoErrors, srReturningChangeAlways])
                or FCancelled)
          then
            if FModalDialog then
              FDialog.ShowModal
            else
              FDialog.Show;
        *)
      end; //if not (FSRC ...
   except
   // to do
   end;
end;

function TSpellChecker.GetLineFromPos(Pos: Integer; var LineStart: Integer): String;
var
  L: Integer;
  Buf: String;
  PS, PE: Integer;
begin
  L:= FBackMemo.Perform(WM_GETTEXTLENGTH, 0, 0);
  SetLength(Buf, L);
  GetTextRange(@Buf[1], 0, L, CodePageFromLocale(FSpeller.Language));
  PS:= Pos;
  while (PS>0) and not (Buf[PS+1] in [#10, #13]) do
    Dec(PS);
  if (Buf[PS+1] in [#10, #13]) then
    Inc(PS);
  PE:= Pos;
  try
   while not (Buf[PE+1] in [#10, #13, #0]) do
    Inc(PE);
   except on ERangeError do
    PE := Length(Buf)-PS;
   end;  
  Result:= Copy(Buf, PS+1, PE-PS);
  LineStart:= PS;
end;

function TSpellChecker.GetCurrentLanguage: TLanguage;
begin
  if Assigned(FSpeller) then
    Result:= FSpeller.Language
  else
    Result:= 0;
end;

///    functions, which are locally used only for streaming
function AdjustLineBreaks(Dest, Source: PChar): Integer; assembler;
asm
        PUSH    ESI
        PUSH    EDI
        MOV     EDI,EAX
        MOV     ESI,EDX
        MOV     EDX,EAX
        CLD
@@1:    LODSB
@@2:    OR      AL,AL
        JE      @@4
        CMP     AL,0AH
        JE      @@3
        STOSB
        CMP     AL,0DH
        JNE     @@1
        MOV     AL,0AH
        STOSB
        LODSB
        CMP     AL,0AH
        JE      @@1
        JMP     @@2
@@3:    MOV     EAX,0A0DH
        STOSW
        JMP     @@1
@@4:    STOSB
        LEA     EAX,[EDI-1]
        SUB     EAX,EDX
        POP     EDI
        POP     ESI
end;

function StreamLoad(dwCookie: Longint; pbBuff: PByte;
  cb: Longint; var pcb: Longint): Longint; stdcall;
var
  Buffer, pBuff: PChar;
  StreamInfo: PRichEditStreamInfo;
begin
  Result := NoError;
  StreamInfo := PRichEditStreamInfo(Pointer(dwCookie));
  Buffer := StrAlloc(cb + 1);
  try
    cb := cb div 2;
    pcb := 0;
    pBuff := Buffer + cb;
    try
      if StreamInfo^.Converter <> nil then
        pcb := StreamInfo^.Converter.ConvertReadStream(StreamInfo^.Stream, pBuff, cb);
      if pcb > 0 then
      begin
        pBuff[pcb] := #0;
        if pBuff[pcb - 1] = #13 then pBuff[pcb - 1] := #0;
        pcb := AdjustLineBreaks(Buffer, pBuff);
        Move(Buffer^, pbBuff^, pcb);
      end;
    except
      Result := $0001;
    end;
  finally
    StrDispose(Buffer);
  end;
end;
/// end {functions, which are locally used only for streaming}

{$IFDEF VER130} { Borland Delphi 5.x }
   // functions, which are locally used only for Delphi 5
function Utf8Encode(const WS: WideString): UTF8String;
begin
  Result := ToUTF8(WS);
end;
{$ENDIF}

procedure TSpellChecker.ChangeOnce(Word1: String);
var
  N, WWLength: Integer;
  TempCP: Word;
  EditStream: TEditStream;
  StreamInfo: TRichEditStreamInfo;
  TextType: Longint;
  WideWord: String;
  NotStream: Boolean;
begin
  FSpeller.ChangeOnce(FSpeller.MisspellText, Word1);
  NotStream := True;
  if FUnicode or (WinNt and FMemoRichEd) then begin
    TempCP := CodePageFromLocale(FSpeller.Language);
    if (FSpeller.Language = 0) and (FSpellerType = sptISpell)
      then TempCP := GetICodePage(FISpellCharset);
    if (TempCP <> GetAcp())
      then begin
        NotStream := False;
        TextType :=  SF_TEXT or SFF_SELECTION;
        StreamInfo.Converter := TConversion.Create;
        try
         StreamInfo.Stream := TMemoryStream.Create;
         try
          WideWord := '﻿' + UTF8Encode(CharToWide(Word1, TempCP));
          StreamInfo.Stream.Position := 0;
          WWLength := Length(WideWord);
          StreamInfo.Stream.WriteBuffer(PChar(WideWord)^, WWLength);
          StreamInfo.Stream.Position := 0;
          with EditStream do begin
            dwCookie := Longint(Pointer(@StreamInfo));
            pfnCallBack := @StreamLoad;
            dwError := 0;
          end;
          SendMessage(FMemo.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
          SendMessage(FBackMemo.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
         finally
          StreamInfo.Stream.Free;
         end;
        finally
         StreamInfo.Converter.Free;
        end;
      end;
  end; { if FUnicode or (WinNt and FMemoRichEd) }
  if NotStream then begin
    FMemo.SelText:= Word1;
    FBackMemo.SelText:= Word1;
  end;
  if Assigned(FOnChangeText) then
    FOnChangeText(Self, FMisspellStart, FMisspellLen, Word1);
  N:= Length(Word1)-FMisspellLen;
  if N<>0 then
    begin
      Inc(FSpellEnd, N);
      Inc(FMisspellLen, N);
      Inc(CrPos, N);
      Inc(TagPos, N);
      Inc(LangPos, N);
    end;
  if (not NotStream) and (CrPos < FSpellEnd) then Init;
end;

procedure TSpellChecker.Change(Word1: String);
var
  N, WWLength: Integer;
  TempCP: Word;
  EditStream: TEditStream;
  StreamInfo: TRichEditStreamInfo;
  TextType: Longint;
  WideWord: String;
  NotStream: Boolean;
begin
  NotStream := True;
  if FUnicode or (WinNt and FMemoRichEd) then begin
    TempCP := CodePageFromLocale(FSpeller.Language);
    if (FSpeller.Language = 0) and (FSpellerType = sptISpell)
      then TempCP := GetICodePage(FISpellCharset);
    if (TempCP <> GetAcp())
      then begin
        NotStream := False;
        TextType :=  SF_TEXT or SFF_SELECTION;
        StreamInfo.Converter := TConversion.Create;
        try
         StreamInfo.Stream := TMemoryStream.Create;
         try
          WideWord := '﻿' + UTF8Encode(CharToWide(Word1, TempCP));
          StreamInfo.Stream.Position := 0;
          WWLength := Length(WideWord);
          StreamInfo.Stream.WriteBuffer(PChar(WideWord)^, WWLength);
          StreamInfo.Stream.Position := 0;
          with EditStream do begin
            dwCookie := Longint(Pointer(@StreamInfo));
            pfnCallBack := @StreamLoad;
            dwError := 0;
          end;
          SendMessage(FMemo.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
          SendMessage(FBackMemo.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
         finally
          StreamInfo.Stream.Free;
         end;
        finally
         StreamInfo.Converter.Free;
        end;
      end;
  end; { if FUnicode or (WinNt and FMemoRichEd) }
  if NotStream then begin
    FMemo.SelText:= Word1;
    FBackMemo.SelText:= Word1;
  end;
  if Assigned(FOnChangeText) then
    FOnChangeText(Self, FMisspellStart, FMisspellLen, Word1);
  N:= Length(Word1)-FMisspellLen;
  if N<>0 then
    begin
      Inc(FSpellEnd, N);
      Inc(FMisspellLen, N);
      Inc(CrPos, N);
      Inc(TagPos, N);
      Inc(LangPos, N);
    end;
  if FSRC=srExtraSpaces then
    FMisspellLen:= 0;
  if (not NotStream) and (CrPos < FSpellEnd) then Init;
end;

procedure TSpellChecker.ChangeAlways(Word1: String);
var
  N, WWLength: Integer;
  TempCP: Word;
  EditStream: TEditStream;
  StreamInfo: TRichEditStreamInfo;
  TextType: Longint;
  WideWord: String;
  NotStream: Boolean;
begin
  FSpeller.ChangeAlways(FSpeller.MisspellText, Word1);
  NotStream := True;
  if FUnicode or (WinNt and FMemoRichEd) then begin
    TempCP := CodePageFromLocale(FSpeller.Language);
    if (FSpeller.Language = 0) and (FSpellerType = sptISpell)
      then TempCP := GetICodePage(FISpellCharset);
    if (TempCP <> GetAcp())
      then begin
        NotStream := False;
        TextType :=  SF_TEXT or SFF_SELECTION;
        StreamInfo.Converter := TConversion.Create;
        try
         StreamInfo.Stream := TMemoryStream.Create;
         try
          WideWord := '﻿' + UTF8Encode(CharToWide(Word1, TempCP));
          StreamInfo.Stream.Position := 0;
          WWLength := Length(WideWord);
          StreamInfo.Stream.WriteBuffer(PChar(WideWord)^, WWLength);
          StreamInfo.Stream.Position := 0;
          with EditStream do begin
            dwCookie := Longint(Pointer(@StreamInfo));
            pfnCallBack := @StreamLoad;
            dwError := 0;
          end;
          SendMessage(FMemo.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
          SendMessage(FBackMemo.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
         finally
          StreamInfo.Stream.Free;
         end;
        finally
         StreamInfo.Converter.Free;
        end;
      end;
  end; { if FUnicode or (WinNt and FMemoRichEd) }
  if NotStream then begin
    FMemo.SelText:= Word1;
    FBackMemo.SelText:= Word1;
  end;
  if Assigned(FOnChangeText) then
    FOnChangeText(Self, FMisspellStart, FMisspellLen, Word1);
  N:= Length(Word1)-FMisspellLen;
  if N<>0 then
    begin
      Inc(FSpellEnd, N);
      Inc(FMisspellLen, N);
      Inc(CrPos, N);
      Inc(TagPos, N);
      Inc(LangPos, N);
    end;
  if (not NotStream) and (CrPos < FSpellEnd) then Init;
end;

procedure TSpellChecker.Delete;
begin
  Inc(FMisspellLen);
  FMemo.SelLength:= FMisspellLen;
  FBackMemo.SelLength:= FMisspellLen;
  FMemo.SelText:= '';
  FBackMemo.SelText:= '';
  if Assigned(FOnChangeText) then
    FOnChangeText(Self, FMisspellStart, FMisspellLen, '');
  Dec(FSpellEnd, FMisspellLen);
  Dec(CrPos, FMisspellLen);
  Dec(TagPos, FMisspellLen);
  Dec(LangPos, FMisspellLen);
  FMisspellLen:= 0;
end;

procedure TSpellChecker.Add;
begin
  FSpeller.Add(FSpeller.MisspellText);
  FMisspellLen:= 0;
end;

procedure TSpellChecker.IgnoreAlways;
begin
  FSpeller.IgnoreAlways(FSpeller.MisspellText);
end;

function DelExtraSpaces(const S: String): String;
var
  I: Integer;
begin
  I:= Length(S)-1;
  while S[I]=' ' do
    Dec(I);
  Result:= Copy(S, 1, I)+Copy(S, Length(S), 1);
end;

procedure TSpellChecker.SetSpellerType(Value: TSpellerType);
begin
  FSpellerType:= Value;
end;

procedure TSpellChecker.SetFont(Value: TFont);
begin
 FFont := Value;
end;

procedure TSpellChecker.SetMissFont(Value: TMisspellFont);
begin
  FMissFont := Value;  
end;

procedure TSpellChecker.SetFontDefault;
begin
  with Font do begin
    Name := 'Arial';
    Size := 10;
    Style := [];
  end;
  with MisspellFont do begin
    MspName := 'Arial';
    MspColor := clred;
    MspStyle := [];
  end;
end; {TSpellChecker}

procedure TSpellChecker.SetUserLanguage(Value: TUserLanguage);
begin
  case Value of
    ulEnglish: begin
      spVariants := SpellRes.spsVariants;
      spDelete := SpellRes.spsDelete;
      spChange := SpellRes.spsChange;
      spChangeAll := SpellRes.spsChangeAll;
      spSkip := SpellRes.spsSkip;
      spSkipAll := SpellRes.spsSkipAll;
      spAdd := SpellRes.spsAdd;
      spCancel := SpellRes.spsCancel;
      spCancelEdit := SpellRes.spsCancelEdit;
      spNotFound := SpellRes.spsNotFound;
      spHyphen := SpellRes.spsHyphen;
      spCaps := SpellRes.spsCaps;
      spAbbrev := SpellRes.spsAbbrev;
      spNoSentenceCap := SpellRes.spsNoSentenceCap;
      spExtraSpaces := SpellRes.spsExtraSpaces;
      spMissingSpace := SpellRes.spsMissingSpace;
      spInitialNumeral := SpellRes.spsInitialNumeral;
      spRepeatedWord := SpellRes.spsRepeatedWord;
      spFinish := SpellRes.spsFinish;
      spFinishCaption := SpellRes.spsFinishCaption;
      spCaption := SpellRes.spsCaption;
      spError := SpellRes.spsError;
      spErrorLoad := SpellRes.spsErrorLoad;
      spErrorUnload := SpellRes.spsErrorUnload;
      spErrorNoSpellChecker := SpellRes.spsErrorNoSpellChecker;
      spStart := SpellRes.spsStart;
     end;
    ulown: begin
      spVariants := SpellResDe.spsVariants;
      spDelete := SpellResDe.spsDelete;
      spChange := SpellResDe.spsChange;
      spChangeAll := SpellResDe.spsChangeAll;
      spSkip := SpellResDe.spsSkip;
      spSkipAll := SpellResDe.spsSkipAll;
      spAdd := SpellResDe.spsAdd;
      spCancel := SpellResDe.spsCancel;
      spCancelEdit := SpellResDe.spsCancelEdit;
      spNotFound := SpellResDe.spsNotFound;
      spHyphen := SpellResDe.spsHyphen;
      spCaps := SpellResDe.spsCaps;
      spAbbrev := SpellResDe.spsAbbrev;
      spNoSentenceCap := SpellResDe.spsNoSentenceCap;
      spExtraSpaces := SpellResDe.spsExtraSpaces;
      spMissingSpace := SpellResDe.spsMissingSpace;
      spInitialNumeral := SpellResDe.spsInitialNumeral;
      spRepeatedWord := SpellResDe.spsRepeatedWord;
      spFinish := SpellResDe.spsFinish;
      spFinishCaption := SpellResDe.spsFinishCaption;
      spCaption := SpellResDe.spsCaption;
      spError := SpellResDe.spsError;
      spErrorLoad := SpellResDe.spsErrorLoad;
      spErrorUnload := SpellResDe.spsErrorUnload;
      spErrorNoSpellChecker := SpellResDe.spsErrorNoSpellChecker;
      spStart := SpellResDe.spsStart;
     end;
    ulother: begin
      spVariants := spOVariants;
      spDelete := spODelete;
      spChange := spOChange;
      spChangeAll := spOChangeAll;
      spSkip := spOSkip;
      spSkipAll := spOSkipAll;
      spAdd := spOAdd;
      spCancel := spOCancel;
      spCancelEdit := spOCancelEdit;
      spNotFound := spONotFound;
      spHyphen := spOHyphen;
      spCaps := spOCaps;
      spAbbrev := spOAbbrev;
      spNoSentenceCap := spONoSentenceCap;
      spExtraSpaces := spOExtraSpaces;
      spMissingSpace := spOMissingSpace;
      spInitialNumeral := spOInitialNumeral;
      spRepeatedWord := spORepeatedWord;
      spFinish := spOFinish;
      spFinishCaption := spOFinishCaption;
      spCaption := spOCaption;
      spError := spOError;
      spErrorLoad := spOErrorLoad;
      spErrorUnload := spOErrorUnload;
      spErrorNoSpellChecker := spOErrorNoSpellChecker;
      spStart := spOStart;
     end;
 end;
end;

{TSpellerDialog2}
constructor TSpellerDialog2.Create(SpellChecker: TSpellChecker);
begin
  Checker:= SpellChecker;
  inherited Create(SpellChecker.Owner);
  Misspelling.Font := Checker.Font;
  Variants.Font := Checker.Font;
end;

procedure TSpellerDialog2.ShowForChange(Msg: TCaption);
var
  UnkWord: String;
begin
  ShowMisspelling;
  InfoMsg.Caption:= Msg;
  //StartButton.Hide;
  CancelEdit.Enabled:= False;
  DelButton.Hide;
  ChangeButton.Show;
  SkipButton.Enabled:= True;
  SkipAllButton.Enabled:= (Checker.FSRC=srUnknownInputWord) and (Length(Checker.FMisspellText)<65);
  AddButton.Enabled:= (Checker.FSRC=srUnknownInputWord) and (Length(Checker.FMisspellText)<65);
  Variants.Font.Charset := CharSetFromLocale(Checker.FSpeller.Language);
  if (Checker.FSpeller.Language = 0) and (Checker.FSpellerType = sptISpell)
    then Variants.Font.Charset := GetTFontCharset(Checker.FISpellCharset);
  UnkWord:= Checker.FMisspellText;
  case Checker.FSRC of
  srUnknownInputWord,
  srReturningChangeOnce,
  srInvalidHyphenation:
  Checker.GetVariants(UnkWord, Variants.Items, Checker.FSpeller.Language);
  srErrorCapitalization,
  srNoSentenceStartCap:
    begin
      Variants.Items.Clear;
      Variants.Items.Add(Checker.SentenceCapitalize(UnkWord));
    end;
  srExtraSpaces:
    begin
      Variants.Items.Clear;
      Delete(UnkWord, Length(UnkWord), 1);
      Variants.Items.Add(DelExtraSpaces(UnkWord));
    end;
  end;
  Variants.ItemIndex:= 0;
  ChangeButton.Enabled:= Variants.ItemIndex=0;
  ChangeAllButton.Enabled:= (Variants.ItemIndex=0) and (Checker.FSRC in [srUnknownInputWord, srReturningChangeOnce]);
  Variants.Enabled:= Variants.ItemIndex=0;
  Label2.Enabled:= Variants.ItemIndex=0;
  if not Visible then
    if Checker.ModalDialog then
      ShowModal
    else
      Show;
end;

procedure TSpellerDialog2.ShowForEdit(Msg: TCaption);
begin
  ShowMisspelling;
  InfoMsg.Caption:= Msg;
  //StartButton.Hide;
  CancelEdit.Enabled:= False;
  DelButton.Hide;
  ChangeButton.Show;
  SkipButton.Enabled:= True;
  SkipAllButton.Enabled:= False;
  AddButton.Enabled:= False;
  Variants.Items.Clear;
  ChangeButton.Enabled:= False;
  ChangeAllButton.Enabled:= False;
  Variants.Enabled:= False;
  if not Visible then
    if Checker.ModalDialog then
      ShowModal
    else
      Show;
end;

procedure TSpellerDialog2.ShowForDelete;
begin
  ShowMisspelling;
  InfoMsg.Caption:= spRepeatedWord;
  //StartButton.Hide;
  CancelEdit.Enabled:= False;
  DelButton.Show;
  DelButton.Enabled:= True;
  ChangeButton.Hide;
  ChangeAllButton.Enabled:= False;
  SkipButton.Show;
  SkipAllButton.Enabled:= False;
  AddButton.Enabled:= False;
  Variants.Items.Clear;
  Variants.Enabled:= False;
  if not Visible then
    if Checker.ModalDialog then
      ShowModal
    else
      Show;
end;

procedure TSpellerDialog2.ShowMisspelling;
var
  PS, WWLength: Integer;
  TempCP: Word;
  EditStream: TEditStream;
  StreamInfo: TRichEditStreamInfo;
  TextType: Longint;
  WideWord: String;
  NotStream: Boolean;
begin
  Misspelling.Enabled := True;
  FShowing := True;
  NotStream := True;
  with Misspelling do
    begin
      Lines.Clear;
      DefAttributes.Charset:= CharsetFromLocale(Checker.CurrentLanguage);
      if (Checker.FSpeller.Language = 0) and (Checker.FSpellerType = sptISpell)
        then DefAttributes.Charset := GetTFontCharset(Checker.FISpellCharset);
      if WinNT then begin  { if application runs on Windows NT platform }
        TempCP := CodePageFromLocale(Checker.FSpeller.Language);
        if (Checker.FSpeller.Language = 0) and (Checker.FSpellerType = sptISpell)
          then TempCP := GetICodePage(Checker.FISpellCharset);
        if (TempCP <> GetAcp())
          then begin
            NotStream := False;
            TextType :=  SF_TEXT;
            StreamInfo.Converter := TConversion.Create;
            try
             StreamInfo.Stream := TMemoryStream.Create;
             try
              WideWord := '﻿' + UTF8Encode(CharToWide(Checker.GetLineFromPos(
                                         Checker.FMisspellStart, PS), TempCP));
              StreamInfo.Stream.Position := 0;
              WWLength := Length(WideWord);
              StreamInfo.Stream.WriteBuffer(PChar(WideWord)^, WWLength);
              StreamInfo.Stream.Position := 0;
              with EditStream do begin
                dwCookie := Longint(Pointer(@StreamInfo));
                pfnCallBack := @StreamLoad;
                dwError := 0;
              end;
              SendMessage(Misspelling.Handle, EM_STREAMIN, TextType, Longint(@EditStream));
             finally
              StreamInfo.Stream.Free;
             end;
            finally
             StreamInfo.Converter.Free;
            end;
          end;
      end; { if Windows NT }
      if NotStream then
         Text:= Checker.GetLineFromPos(Checker.FMisspellStart, PS);
      SelectAll;
      SelAttributes.Color:= clWindowText;
      SelAttributes.Protected:= True;
      SelStart:= Checker.FMisspellStart-PS;
      SelLength:= Checker.FMisspellLen;
      SelAttributes.Protected:= False;
      SelAttributes.Color := Checker.FMissFont.MspColor;
      SelAttributes.Name := Checker.FMissFont.MspName;
      SelAttributes.Style := Checker.FMissFont.MspStyle;
      SelLength:= 0;
    end;
  FShowing:= False;
end;

procedure TSpellerDialog2.MisspellingProtectChange(Sender: TObject;
  StartPos, EndPos: Integer; var AllowChange: Boolean);
begin
  AllowChange:= FShowing;
end;

procedure TSpellerDialog2.MisspellingChange(Sender: TObject);
begin
  if FShowing then
    Exit;
  CancelEdit.Enabled:= True;
  ChangeButton.Show;
  ChangeButton.Enabled:= True;
  ChangeAllButton.Enabled:= False;
  SkipAllButton.Enabled:= False;
  AddButton.Enabled:= False;
  DelButton.Hide;
  Variants.Enabled:= False;
end;

procedure TSpellerDialog2.GetHotArea(var SS, SL: Integer);
var
  I: Integer;
begin
  with Misspelling do
    begin
      SelLength:= 0;
      for I:= 0 to Length(Misspelling.Text)-1 do
        begin
          SelStart:= I;
          if not SelAttributes.Protected then
            begin
              SS:= I;
              Break;
            end;
        end;
      for I:= SS to Length(Misspelling.Text) do
        begin
          SelStart:= I;
          if SelAttributes.Protected then
            begin
              SL:= I-SS-1;
              Exit;
            end;
        end;
      SL:= Length(Misspelling.Lines[0])-SS;
    end;
end;

procedure TSpellerDialog2.CancelEditClick(Sender: TObject);
var
  SS, SL: Integer;
  UnkWord: String;
begin
  GetHotArea(SS, SL);
  UnkWord:= Checker.FMisspellText;
  with Misspelling do
    begin
      SelStart:= SS;
      SelLength:= SL;
      SelText:= UnkWord;
      SelLength:= 0;
    end;
  case Checker.FSRC of
  srUnknownInputWord,
  srReturningChangeOnce,
  srInvalidHyphenation,
  srErrorCapitalization,
  srNoSentenceStartCap,
  srExtraSpaces:
    begin
      DelButton.Hide;
      ChangeButton.Show;
      SkipButton.Enabled:= True;
      SkipAllButton.Enabled:= Checker.FSRC=srUnknownInputWord;
      AddButton.Enabled:= Checker.FSRC=srUnknownInputWord;
      ChangeAllButton.Enabled:= (Variants.ItemIndex=0) and (Checker.FSRC in [srUnknownInputWord, srReturningChangeOnce]);
      ChangeButton.Enabled:= Variants.ItemIndex=0;
      Variants.Enabled:= Variants.ItemIndex=0;
    end;
  srRepeatWord:
    begin
      DelButton.Show;
      ChangeButton.Hide;
      ChangeAllButton.Enabled:= False;
      SkipButton.Show;
      SkipAllButton.Enabled:= False;
      AddButton.Enabled:= False;
    end;
  srWordConsideredAbbreviation,
  srMissingSpace,
  srInitialNumeral:
    begin
      DelButton.Hide;
      ChangeButton.Show;
      SkipButton.Enabled:= True;
      SkipAllButton.Enabled:= false;
      AddButton.Enabled:= False;
      ChangeButton.Enabled:= False;
      ChangeAllButton.Enabled:= False;
      Variants.Enabled:= False;
    end;
  end;
  CancelEdit.Enabled:= False;
end;

procedure TSpellerDialog2.CancelButtonClick(Sender: TObject);
begin
  Checker.FCancelled := True;
  if Assigned(Checker.FOnCancel)
    then Checker.FOnCancel(Self);
  Checker.FinishCheck;
end;

procedure TSpellerDialog2.DelButtonClick(Sender: TObject);
begin
  Checker.Delete;
  Checker.ContinueCheck;
end;

procedure TSpellerDialog2.SkipButtonClick(Sender: TObject);
begin
  Checker.ContinueCheck;
end;

procedure TSpellerDialog2.SkipAllButtonClick(Sender: TObject);
begin
  Checker.IgnoreAlways;
  Checker.ContinueCheck;
end;

procedure TSpellerDialog2.AddButtonClick(Sender: TObject);
begin
  Checker.Add;
  Checker.ContinueCheck;
end;

procedure TSpellerDialog2.ChangeButtonClick(Sender: TObject);
var
  SS, SL: Integer;
begin
  if CancelEdit.Enabled then  //jcfaria
    begin
      GetHotArea(SS, SL);
      with Misspelling do
        begin
          SelStart:= SS;
          SelLength:= SL;
          Checker.Change(SelText);
        end;
      Checker.ContinueCheck;
    end
  else
    begin
      if Checker.FSRC=srUnknownInputWord then
        Checker.ChangeOnce(Variants.Items[Variants.ItemIndex])
      else
        Checker.Change(Variants.Items[Variants.ItemIndex]);
      Checker.ContinueCheck;
    end;
end;

procedure TSpellerDialog2.ChangeAllButtonClick(Sender: TObject);
begin
  Checker.ChangeAlways(Variants.Items[Variants.ItemIndex]);
  Checker.ContinueCheck;
end;

{$WARNINGS OFF}
procedure TSpellerDialog2.StartButtonClick(Sender: TObject);
var
  ChildForm, ActiveForm, ParentForm: TForm;
  MemoName: String;
  CanCheck: Boolean;
  Cmpnt: TComponent;
begin
  //StartButton.Hide;
  try
    if not (Checker.FMemo.Owner is TForm) then begin
       CanCheck := False;
       Abort;
     end;
    ChildForm:= Checker.FMemo.Owner as TForm;
    MemoName:= Checker.FMemo.Name;
    if (ChildForm.FormStyle<>fsMDIChild)
      then Cmpnt:= ChildForm.FindComponent(MemoName)
      else begin
        ParentForm:= ChildForm.Owner as TForm;
        ActiveForm:= ParentForm.ActiveMDIChild;
        Cmpnt:= ActiveForm.FindComponent(MemoName);
      end;
    if not Assigned(Cmpnt) or not (Cmpnt is TCustomMemo) then
    begin
      CanCheck := False;
      Abort;
    end;
  finally
    if CanCheck then
      Checker.Check(Cmpnt as TCustomMemo);
  end;
end;
{$WARNINGS ON}

procedure TSpellerDialog2.FormActivate(Sender: TObject);
begin
  InfoMsg.Enabled:= True;
end;

procedure TSpellerDialog2.FormDeactivate(Sender: TObject);
begin
  //StartButton.Show;
  DelButton.Enabled:= False;
  ChangeButton.Enabled:= False;
  ChangeAllButton.Enabled:= False;
  SkipButton.Enabled:= False;
  SkipAllButton.Enabled:= False;
  AddButton.Enabled:= False;
  Misspelling.Enabled:= False;
  Variants.Enabled:= False;
  InfoMsg.Enabled:= False;
  Label2.Enabled:= False;
  Variants.Items.Clear;
  FShowing:= True;
  Misspelling.Text:= '';
  FShowing:= False;
end;

procedure TSpellerDialog2.FormDestroy(Sender: TObject);
begin
  Checker.FDialog:= nil;
  inherited;
end;

function GetSpellLanguages(Languages: TStrings; Option: TLangOption): Integer;
var
  Registry: TRegistry;
  N, I: Integer;
  LCTypeVar: Integer;
  Buf: array[0..255]of Char;

begin
  Registry:= TRegistry.Create;
  try
    Registry.Access := KEY_READ;
    Registry.RootKey:= HKEY_LOCAL_MACHINE;
    if Registry.OpenKey('\SOFTWARE\Microsoft\Shared Tools\Proofing Tools\Spelling', False)
      then Registry.GetKeyNames(Languages);
  finally
    Registry.Free;
  end;
  LCTypeVar := LCType(Option);
  for I:= Languages.Count-1 downto 0 do
    begin
      N:= StrToIntDef(Languages[I], -1);
      if N=-1 then
        Languages.Delete(I)
      else
        begin
          Languages.Objects[I]:= Pointer(N);
          GetLocaleInfo(N, LCTypeVar, Buf, 255);
          Languages[I]:= Buf;
        end;
    end;
  Result:= Languages.Count;
end; {GetSpellLanguages MS}

function GetISpellLanguages(Languages: TStrings; Option: TLangOption): Integer;
var
  Registry: TRegistry;
  I: Integer;
  LCTypeVar: Integer;
  ISpell: TIniFile;
  Sect: TStringList;
  SearchRec: TSearchRec;
  Name,S, ISpellPath: String;
  O: TSpellListObj;
  Buf: array[0..255]of Char;

begin
 Registry:= TRegistry.Create;
 try
   Registry.Access := KEY_READ;
   Registry.RootKey:= HKEY_LOCAL_MACHINE;
   if Registry.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\ispell.exe', False)
     then ISpellPath := Registry.ReadString('Path');
   if (Length(ISpellPath) > 0) and (ISpellPath[Length(ISpellPath)] <> '\')
     then ISpellPath := ISpellPath + '\';
 finally
   Registry.Free;
 end;
 Sect := TStringList.Create;
 try
   LCTypeVar := LCType(Option);
   if FindFirst(ISpellPath + '*.*', faDirectory, SearchRec)=0 then
     repeat
       if (SearchRec.Name='.') or (SearchRec.Name='..') then continue;
       if (SearchRec.Attr and faDirectory)=0 then continue;
       Name := SearchRec.Name;
       Ispell := TIniFile.Create(ISpellPath + Name+'\ispell.ini');
       try
         Ispell.ReadSections(Sect);
         for i := 0 to Sect.Count-1 do begin
           S := Sect[i];
           if S = '' then S := Name;
           O := TSpellListObj.Create;
           O.Language := StrToIntDef(Ispell.ReadString(Sect[i],'LangNo','0'), 0);
           O.ISpellCmd := Ispell.ReadString(Sect[i],'Cmd','');
           O.ISpellCharset:=Ispell.ReadString(Sect[i],'Charset','');
           O.ISpellSurrogate:=Ispell.ReadString(Sect[i],'Surrogate','');
           O.Flag:=Ispell.ReadString(Sect[i],'Flag',Name);
           if O.ISpellSurrogate='' then O.ISpellSurrogate:='-';
           O.SpellerType := sptISpell;
           if O.Language <> 0 then begin
             GetLocaleInfo(O.Language, LCTypeVar, Buf, 255);
             S := Buf;
           end;
           Languages.AddObject(S,O);
          end; //for
       finally
         Ispell.Free;
        end;
     until FindNext(SearchRec)<>0;
 finally
   Sect.Free;
   FindClose(SearchRec);
  end;
 Result:= Languages.Count;
end; {GetISpellLanguages ISpeller}

function SptToStr(Value: TSpellerType): String;
begin
  Result := 'sptOther';
  case Value of
    sptMSOffice: Result := 'sptMSOffice';
    sptISpell: Result := 'sptISpell';
  end;
end;

procedure TSpellerDialog2.FormShow(Sender: TObject);
begin
  Label2.Caption:= spVariants;
  ChangeButton.Caption:= spChange;
  ChangeAllButton.Caption:= spChangeAll;
  SkipButton.Caption:= spSkip;
  SkipAllButton.Caption:= spSkipAll;
  DelButton.Caption:= spDelete;
  CancelButton.Caption:= spCancel;
  CancelEdit.Caption:= spCancelEdit;
  //StartButton.Caption:= spStart;
  AddButton.Caption := spAdd;
end;

{ TISpeller }
procedure TISpeller.Add(Word: String);
begin
 if FNotActive then Exit;
 SpellCommand('*'+ Word);
end;

procedure TISpeller.ChangeAlways(Word, NewWord: String);
begin
 if FNotActive then Exit;
 ReplData.Add(Word);
 ReplData.Add(NewWord);
end;

procedure TISpeller.ChangeOnce(Word, NewWord: String);
begin
 if FNotActive then Exit;
end;

function TISpeller.Check(Word: WideString): Boolean;
begin
    Repl := '';
    result:=False;
    if Word='' then exit;
    while (Word<>'') and ((Word[1]='*') or (Word[1]='+') or (Word[1]='-')) do
        Delete(Word,1,1);
    M:=SpellCheck(PutCvtU(Word,Tbl));
    if M='' then exit;
    if M[1]='*' then exit;
    if M[1]='+' then exit;
    if M[1]='-' then exit;     
    UnkWord := Word;
    result:=True;
end; {TISpeller.Check}

constructor TISpeller.Create(Language: TLanguage; Owner: TSpellChecker;
  Options: TSpellOptions);
var
 Security: TSecurityAttributes;
 SI: TStartupInfo;
 ErrorMsg, ISpellPath, Name, S, Path: String;
 buf: array [0..512] of char;
 NotFound, Activated: Boolean;
 j: Cardinal;
 i: Integer;
 Registry: TRegistry;
 ISpell: TIniFile;
 Sect: TStringList;
 SearchRec: TSearchRec;
begin
 inherited;
 NotFound := True;
 FSpellerType := sptISpell;
//Find ISpell path
 Registry:= TRegistry.Create;
 try
   Registry.Access := KEY_READ;
   Registry.RootKey:= HKEY_LOCAL_MACHINE;
   if Registry.OpenKey('\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\ispell.exe', False)
     then ISpellPath := Registry.ReadString('Path')
     else begin
       Registry.Free;
       FNotActive:= True;
       Exit;
     end;
   if (Length(ISpellPath) > 0) and (ISpellPath[Length(ISpellPath)] <> '\')
     then ISpellPath := ISpellPath + '\';
 finally
   Registry.Free;
 end;
//Find ISpell files for Language
 FLanguage := 0;
 Sect := TStringList.Create;
 try
   if FindFirst(ISpellPath + '*.*', faDirectory, SearchRec)=0 then
     repeat
       if (SearchRec.Name='.') or (SearchRec.Name='..') then continue;
       if (SearchRec.Attr and faDirectory)=0 then continue;
       Name := SearchRec.Name;
       Ispell := TIniFile.Create(ISpellPath + Name+'\ispell.ini');
       try
         Ispell.ReadSections(Sect);
         for i := 0 to Sect.Count-1 do begin
           S := Sect[i];
           if S = '' then S := Name;
           FLangName := S;
           FLanguage := StrToIntDef(Ispell.ReadString(Sect[i],'LangNo','0'), 0);
           FISpellCmd := Ispell.ReadString(Sect[i],'Cmd','');
           FISpellCharset := Ispell.ReadString(Sect[i],'Charset','');
           FISpellSurrogate := Ispell.ReadString(Sect[i],'Surrogate','');
           if FISpellSurrogate = '' then FISpellSurrogate := '-';
           FFlag := Ispell.ReadString(Sect[i],'Flag',Name);
           if ((FLanguage = Language) and (Language <> 0))
              or ((Language = 0) and (S = Owner.LangName))
             then begin
               NotFound := False;
               break;
             end;
        end; //for
       finally
         Ispell.Free;
       end;
     until (FindNext(SearchRec)<>0)
            or ((FLanguage = Language) and (Language <> 0))
            or ((Language = 0) and (S = Owner.LangName));
 finally
   Sect.Free;
   FindClose(SearchRec);
 end;
 if NotFound then begin
   FNotActive:= True;
   Exit;
 end;
 ReplData := TStringlist.Create;
 if FLanguage <> 0 then FLangName := LanguageName(FLanguage, Owner.FLangOption);
 FOptions:= Options;
//Initialize ISpeller
 Tbl:=TconvTable.Create;
 with Security do begin
   nLength := SizeOf(TSecurityAttributes);
   lpSecurityDescriptor := nil;
   bInheritHandle := True;
 end;
 CreatePipe(si_r, si_w, @Security, 0);
 CreatePipe(so_r, so_w, @Security, 0);
 CreatePipe(se_r, se_w, @Security, 0);
 Path := ISpellPath;
 delete(Path, Length(Path),1);
 while Replace(FISpellCmd,'%UniRed%ispell', Path) do;
 SetEnvironmentVariable('HOME',PChar(ISpellPath));
 FillChar(SI, SizeOf(SI), 0);
 SI.CB := SizeOf(SI);
 SI.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
 SI.hStdInput := si_r;
 SI.hStdOutput := so_w;
 SI.hStdError := se_w;
 SI.wShowWindow := SW_HIDE;

 Activated := CreateProcess(
   nil,                     // pointer to name of executable module
   PChar(FISpellCmd),        // pointer to command line string
   @Security,               // pointer to process security attributes
   @Security,               // pointer to thread security attributes
   True,                    // handle inheritance flag
   0,                       // creation flags
   nil,                     // pointer to new environment block
   PChar(ISpellPath),             // pointer to current directory name
   SI,                      // pointer to STARTUPINFO
   PI                       // pointer to PROCESS_INFORMATION
 );

 if not Activated then
   ErrorMsg := SysErrorMessage(GetLastError);
 CloseHandle(so_w);
 if Activated then begin
   if ReadFile(so_r, buf, SizeOf(buf), j, nil)
     then SpellCommand('!')
     else Activated:=False;
 end;
 if not Activated then begin
   CloseHandle(si_r);
   CloseHandle(si_w);
   CloseHandle(so_r);
   CloseHandle(se_r);
   CloseHandle(se_w);
   Tbl.Free;
 end;
 FNotActive := not Activated;
end;

destructor TISpeller.Destroy;
begin
 ReplData.Free;
 try
   SpellCommand(^Z);
   CloseHandle(PI.hThread);
   CloseHandle(PI.hProcess);
   CloseHandle(si_r);
   CloseHandle(si_w);
   CloseHandle(so_r);
   CloseHandle(se_r);
   CloseHandle(se_w);
   Tbl.Free;
 except on E: Exception do
   TerminateProcess(PI.hProcess,0);
 end;
 inherited;
end;

function TISpeller.FindMisspell(Buf: PChar; MaxLen: Integer; var Start,
  Len: Integer): TSpellReturnCode;
const SDelim = ' <>!.,;:/\|"[]{}()+_=`~@&$%^*?#-';
      SNum = '0123456789';
var S: WideString;
    i, ReplDataLenth, X, A, Slength: Integer;
    NumFound: Boolean;
begin
 Result:= srNoErrors;
 if FNotActive then Exit;
 X := 0;
 while True do begin
   S := Buf;
   Slength := length(S);
   repeat
     Inc(X);
   until (Pos(S[X],SDelim)=0) or (X>Slength);
   Dec(X);
   A:=X;
   repeat
     Inc(X);
   until (Pos(S[X],SDelim)>0) or (X>Slength);
   Dec(X);
   if (X>MaxLen) then break;
   S:=Copy(S,A+1,X-A);
   if S='' then
     if X = MaxLen
       then break
       else continue;
   if not Check(S) then continue;
   if (spoIgnoreAllCaps in FOptions) and (UnkWord = AnsiUpperCase(UnkWord))
      then continue;
   if (spoIgnoreMixedDigits in FOptions) then begin
     NumFound := False;
     for i := 1 to Length(UnkWord) do
       if Pos(UnkWord[i],SNum) > 0 then NumFound := True;
     if NumFound then continue;
   end;  
   Start:= A;
   Len:= Length(UnkWord);
   //search ReplData for "Replace all" knowledge
   i := 0;
   ReplDataLenth := ReplData.Count;
   while i < ReplDataLenth do begin
     if UnkWord = ReplData[i] then begin
        Repl := ReplData[i+1];
        Result := srReturningChangeAlways;
        exit;
     end;
     Inc(i,2);
   end;
   Result := srUnknownInputWord;
   break;
 end; {while True}
end;

function TISpeller.FindNextMisspell(Buf: PChar; MaxLen: Integer; var Start,
  Len: Integer): TSpellReturnCode;
begin
 Result:= FindMisspell(Buf, MaxLen, Start, Len);
end;

function TISpeller.GetChangeText: String;
begin
  if FNotActive
    then Result:= ''
    else Result:= Repl;
end;

function TISpeller.GetMisspellText: String;
begin
  if FNotActive
    then Result:= ''
    else Result:= UnkWord;
end;

procedure TISpeller.GetVariants(Word: String; Variants: TStrings);
var n: Integer;
    S: String;
begin
 Repl := '';
 Variants.Clear;
 if FNotActive then Exit;
 if M[1] in ['&','?'] then begin
   n:=Pos(':',M);
   if n<=0 then exit;
   Delete(M,1,n);
   while (M<>'') and (M[1]=' ') do Delete(M,1,1);
   while M<>'' do begin
     S:='';
     while (M<>'') and (M[1]<>',') do begin
       S:=S+M[1];
       Delete(M,1,1);
     end;
     while (M<>'') and (M[1] in [',',' ']) do Delete(M,1,1);
     Variants.Add(S);
   end;
 end;
end;

procedure TISpeller.IgnoreAlways(Word: String);
begin
 if FNotActive then Exit;
 SpellCommand('@'+ Word);
end;

function TISpeller.SpellCheck(word: String): String;
 var buf: array [0..512] of char;
     j: Integer;
begin
  result:='';
  StrPCopy(buf,word+^M^J);
  if buf[0]=#0 then exit;
  j:=0;
  WriteFile(si_w, buf, StrLen(buf), Cardinal(j), nil);
  j:=0;
  ReadFile(so_r, buf, SizeOf(buf), Cardinal(j), nil);
  repeat
    buf[j]:=#0;
    Dec(j);
  until (j<0) or not (buf[j] in [^M,^J]);
  result:=buf;
end; {TISpeller.SpellCheck}

procedure TISpeller.SpellCommand(Word: WideString);
 var buf: array [0..512] of char;
     j: Cardinal;
begin
  StrPCopy(buf,PutCvtU(Word,Tbl)+^M^J);
  j:=0;
  WriteFile(si_w, buf, StrLen(buf), j, nil);
  j:=0;
end;

{ TMisspellFont }

procedure TMisspellFont.Assign(Source: TPersistent);
begin
  if Source is TMisspellFont then
  begin
    FMspColor := TMisspellFont(Source).FMspColor;
    FMspName := TMisspellFont(Source).FMspName;
    FMspStyle := TMisspellFont(Source).FMspStyle;
    inherited Assign(Source);
  end;
end;

procedure TSpellerDialog2.FormCreate(Sender: TObject);
begin
  //XPMenuSpell.Active:= frmTinnMain.bAppearance;
end;

procedure TSpellerDialog2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Checker.FDialog:= nil;
end;

initialization
  ControlTypes:= TStringList.Create;
  TSpellChecker.RegisterEditControl('TCustomMemo', False, False);
  TSpellChecker.RegisterEditControl('TCustomRichEdit', False, False);
  TSpellChecker.RegisterEditControl('TCustomRichEdit98', True, True);
  TSpellChecker.RegisterEditControl('TRXCustomRichEdit', True, False);
  WinNT := (Win32Platform = VER_PLATFORM_WIN32_NT);
  spOVariants := '&Variants';
  spODelete := '&Delete';
  spOChange := '&Change';
  spOChangeAll := 'Change A&ll';
  spOSkip := '&Skip';
  spOSkipAll := 'S&kip All';
  spOAdd := '&Add';
  spOCancel := 'Ca&ncel';
  spOCancelEdit := '&Undo Edit';
  spONotFound := 'Unknown word';
  spOHyphen := 'Illegal hyphenations';
  spOCaps := 'Capitalization error';
  spOAbbrev := 'Possible abbreviation';
  spONoSentenceCap := 'Sentence capitalization error';
  spOExtraSpaces := 'Extra spaces';
  spOMissingSpace := 'Missing space';
  spOInitialNumeral := 'Numerals in start of word';
  spORepeatedWord := 'Repeated word';
  spOFinish := 'Spelling check complete';
  spOFinishCaption:= 'Message';
  spOCaption := 'Spelling � %s';
  spOError := 'Spelling error No %d';
  spOErrorLoad := 'Error loading Spell DLL %s';
  spOErrorUnload := 'Error unloading Spell DLL %s';
  spOErrorNoSpellChecker := 'Language %s not installed';
  spOStart := 'Start';

finalization
  ControlTypes.Free;

end.
