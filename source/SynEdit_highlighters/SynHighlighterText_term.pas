{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynHighlighterPython.pas, released 2000-06-23.
The Original Code is based on the odPySyn.pas file from the
mwEdit component suite by Martin Waldenburg and other developers, the Initial
Author of this file is Olivier Deckmyn.
Portions created by M.Utku Karatas and Dennis Chuah.
Unicode translation by Maël Hörz.
Adapted to R language by José Cláudio Faria (Tinn-R Team)

All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynHighlighterPython.pas, v 1.18.2.7 2008/09/14 16:25:02 maelh Exp $
$Id: SynHighlighterText.pas, v 1.19.0.0 2013/08/21 19:30:00 JCFaria Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}
{
@abstract(A Python language highlighter for SynEdit)
@author(Olivier Deckmyn, converted to SynEdit by David Muir <dhmn@dmsoftware.co.uk>)
@created(unknown, converted to SynEdit on 2000-06-23)
The SynHighlighterPython implements a highlighter for Python for the SynEdit projects.
@lastmod(2013-08-19)
The SynHighlighterText implements a highlighter for R for the SynEdit projects.
}

{$IFNDEF QSYNHIGHLIGHTERTEXT}
unit SynHighlighterText_term;
{$ENDIF}

{$I SynEdit.inc}

interface

uses
{$IFDEF SYN_CLX}
  QGraphics,
  QSynEditHighlighter,
  QSynEditTypes,
  QSynUnicode,
{$ELSE}
  Graphics,
  SynEditHighlighter,
  SynEditTypes,
  SynUnicode,
{$ENDIF}
  SysUtils,
  Classes;

type
  TtkTokenKind = (
                  tkComment,
                  tkNote,
                  tkNote_1,
                  tkNote_2,
                  tkFloat,
                  tkHex,
                  tkIdentifier,
                  tkNull,
                  tkNumber,
                  tkOct,
                  tkOperator,
                  tkSpace,
                  tkString,
                  tkSymbol,
                  tkUnknown
                 );

  TRangeState = (
                 rsANil,
                 rsComment,
                 //rsMultilineString,  // Multiline is not suitable for Rterm!
                 rsUnKnown
                );

type
  TSynText_termSyn = class(TSynCustomHighLighter)

  private
    //fStringStarter: WideChar;  // used only for rsMultilineString stuff
    fCommentAttri: TSynHighlighterAttributes;
    fNoteAttri: TSynHighlighterAttributes;
    fNote_1Attri: TSynHighlighterAttributes;
    fNote_2Attri: TSynHighlighterAttributes;
    fFloatAttri: TSynHighlighterAttributes;
    fHexAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    FKeywords: TUnicodeStringList;
    fNumberAttri: TSynHighlighterAttributes;
    fOctalAttri: TSynHighlighterAttributes;
    fOperatorAttri: TSynHighlighterAttributes;
    fRange: TRangeState;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    FTokenID: TtkTokenKind;

    function IdentKind(MayBe: PWideChar): TtkTokenKind;

    procedure CommentProc;
    procedure CRProc;
    procedure IdentProc;
    procedure LFProc;
    procedure NullProc;
    procedure NumberProc;
    procedure OperatorProc;
    procedure SpaceProc;
    procedure String34Proc;
    procedure String39Proc;
    //procedure StringEndProc(EndChar: WideChar);
    procedure SymbolProc;
    procedure UnknownProc;

  protected
    function GetSampleSource: UnicodeString; override;
    function IsFilterStored: Boolean; override;

    property Keywords: TUnicodeStringList read FKeywords;
    property TokenID: TtkTokenKind read FTokenID;

  public
    class function GetFriendlyLanguageName: UnicodeString; override;
    class function GetLanguageName: string; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetDefaultAttribute(Index: integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetRange: Pointer; override;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenKind: integer; override;
    function IsIdentChar(AChar: WideChar): Boolean; override;

    procedure Next; override;
    procedure ResetRange; override;
    procedure SetRange(Value: Pointer); override;

  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property NoteAttri: TSynHighlighterAttributes read fNoteAttri write fNoteAttri;
    property Note_1Attri: TSynHighlighterAttributes read fNote_1Attri write fNote_1Attri;
    property Note_2Attri: TSynHighlighterAttributes read fNote_2Attri write fNote_2Attri;
    property FloatAttri: TSynHighlighterAttributes read fFloatAttri write fFloatAttri;
    property HexAttri: TSynHighlighterAttributes read fHexAttri write fHexAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property NumberAttri: TSynHighlighterAttributes read fNumberAttri write fNumberAttri;
    property OctalAttri: TSynHighlighterAttributes read fOctalAttri write fOctalAttri;
    property OperatorAttri: TSynHighlighterAttributes read fOperatorAttri write fOperatorAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri write fSymbolAttri;
  end;


implementation

uses
{$IFDEF SYN_CLX}
  QSynEditStrConst;
{$ELSE}
  SynEditStrConst;
{$ENDIF}

function TSynText_termSyn.IsIdentChar(AChar: WideChar): Boolean;
begin
  case AChar of
    'A'..'Z', 'a'..'z', '_', '-', '0'..'9', 'À'..'Ö', 'Ø'..'ö', 'ø'..'ÿ':
      Result := True;
    else
      Result := False;
  end;
end;

function TSynText_termSyn.IdentKind(MayBe: PWideChar): TtkTokenKind;
var
  i:    Integer;
  temp: PWideChar;
  s:    UnicodeString;

begin
  // Extract the identifier out - it is assumed to terminate in a
  // non-alphanumeric character
  fToIdent:= MayBe;
  temp:= MayBe;

  (*
  // It is not good for Text!
  while IsIdentChar(temp^) do
    Inc(temp);
  *)

  // JCFaria
  // -----------------------
  i:= 0;
  while IsIdentChar(temp^) or      // '_', '0'..'9', 'A'..'Z', 'a'..'z':
        (MayBe[i] = '.') do begin  // Text: an keyword (Programing, Function, Dataset or Plotting) can has a point '.' inside
    Inc(temp);
    Inc(i);
  end;
  // -----------------------

  fStringLen:= temp - fToIdent;

  // Check to see if it is a keyword
  SetString(s,
            fToIdent,
            fStringLen);
  if FKeywords.Find(s,
                    i) then begin
    // TUnicodeStringList is not case sensitive!
    if s <> FKeywords[i] then
      i:= -1;
  end
  else
    i:= -1;

  if i <> -1 then
    Result:= TtkTokenKind(FKeywords.Objects[i])
  else
    Result:= tkIdentifier;
end;

constructor TSynText_termSyn.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fCaseSensitive:= True;

  FKeywords:= TUnicodeStringList.Create;
  FKeywords.Sorted:= True;
  FKeywords.Duplicates:= dupError;

  fRange:= rsUnknown;

  fCommentAttri:= TSynHighlighterAttributes.Create(SYNS_AttrComment,
                                                   SYNS_FriendlyAttrComment);
  fCommentAttri.Foreground:= clGray;
  fCommentAttri.Style:= [fsItalic];
  AddAttribute(fCommentAttri);

  fNoteAttri:= TSynHighlighterAttributes.Create(SYNS_AttrNote,
                                                SYNS_FriendlyAttrNote);
  fNoteAttri.Foreground:= clRed;
  fNoteAttri.Style:= [fsItalic, fsUnderline, fsBold];
  AddAttribute(fNoteAttri);

  fNote_1Attri:= TSynHighlighterAttributes.Create(SYNS_AttrNote_1,
                                                  SYNS_FriendlyAttrNote_1);
  fNote_1Attri.Foreground:= clBlue;
  fNote_1Attri.Style:= [fsItalic, fsBold];
  AddAttribute(fNote_1Attri);

  fNote_2Attri:= TSynHighlighterAttributes.Create(SYNS_AttrNote_2,
                                                  SYNS_FriendlyAttrNote_2);
  fNote_2Attri.Foreground:= clGreen;
  fNote_2Attri.Style:= [fsItalic];
  AddAttribute(fNote_2Attri);

  fIdentifierAttri:= TSynHighlighterAttributes.Create(SYNS_AttrIdentifier,
                                                      SYNS_FriendlyAttrIdentifier);
  AddAttribute(fIdentifierAttri);

  fNumberAttri:= TSynHighlighterAttributes.Create(SYNS_AttrNumber,
                                                  SYNS_FriendlyAttrNumber);
  fNumberAttri.Foreground:= clBlue;
  AddAttribute(fNumberAttri);

  fHexAttri:= TSynHighlighterAttributes.Create(SYNS_AttrHexadecimal,
                                               SYNS_FriendlyAttrHexadecimal);
  fHexAttri.Foreground:= clBlue;
  AddAttribute(fHexAttri);

  fOctalAttri:= TSynHighlighterAttributes.Create(SYNS_AttrOctal,
                                                 SYNS_FriendlyAttrOctal);
  fOctalAttri.Foreground:= clBlue;
  AddAttribute(fOctalAttri);

  fFloatAttri:= TSynHighlighterAttributes.Create(SYNS_AttrFloat,
                                                 SYNS_FriendlyAttrFloat);
  fFloatAttri.Foreground:= clBlue;
  AddAttribute(fFloatAttri);

  fSpaceAttri:= TSynHighlighterAttributes.Create(SYNS_AttrSpace,
                                                 SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri:= TSynHighlighterAttributes.Create(SYNS_AttrString,
                                                  SYNS_FriendlyAttrString);
  fStringAttri.Foreground:= clOlive;
  AddAttribute(fStringAttri);

  fSymbolAttri:= TSynHighlighterAttributes.Create(SYNS_AttrSymbol,
                                                  SYNS_FriendlyAttrSymbol);
  fSymbolAttri.Foreground:= clMaroon;
  AddAttribute(fSymbolAttri);

  fOperatorAttri:= TSynHighlighterAttributes.Create(SYNS_AttrOperator,
                                                    SYNS_FriendlyAttrOperator);
  fOperatorAttri.Foreground:= clOlive;
  AddAttribute(fOperatorAttri);

  SetAttributesOnChange(DefHighlightChange);
  fDefaultFilter:= SYNS_FilterText;
end; { Create }

destructor TSynText_termSyn.Destroy;
begin
  FKeywords.Free;
  inherited;
end;

procedure TSynText_termSyn.SymbolProc;
begin
  inc(Run);
  fTokenID:= tkSymbol;
end;

procedure TSynText_termSyn.OperatorProc;
begin
  inc(Run);
  fTokenID:= tkOperator;
end;

procedure TSynText_termSyn.CRProc;
begin
  fTokenID:= tkSpace;
  case FLine[Run + 1] of
    #10: inc(Run, 2);
  else
    inc(Run);
  end;
end;

procedure TSynText_termSyn.CommentProc;
begin
{
  fTokenID:= tkComment;
  Inc(Run);
  while not IsLineEnd(Run) do
    Inc(Run);
}
  // J.C.Faria
  if (FLine[Run+1] = '!') then
  begin
    fTokenID:= tkNote;
    if (FLine[Run+2] = '.') then fTokenID:= tkNote_1;
    if (FLine[Run+3] = '.') then fTokenID:= tkNote_2;
  end
  else
    fTokenID:= tkComment;

  while not IsLineEnd(Run) do
    Inc(Run);
end;

procedure TSynText_termSyn.IdentProc;
begin
  fTokenID:= IdentKind((fLine + Run));
  inc(Run,
      fStringLen);
end;

procedure TSynText_termSyn.LFProc;
begin
  fTokenID:= tkSpace;
  inc(Run);
end;

procedure TSynText_termSyn.NullProc;
begin
  fTokenID:= tkNull;
  inc(Run);
end;

procedure TSynText_termSyn.NumberProc;
type
  TNumberState =
    (
    nsStart,
    nsDotFound,
    nsFloatNeeded,
    nsHex,
    nsOct,
    nsExpFound
    );

var
  temp:  WideChar;
  State: TNumberState;

  function CheckSpecialCases: Boolean;
  begin
    case temp of
      // Look for dot (.)
      '.': begin
        // .45
        if CharInSet(FLine[Run], ['0'..'9']) then begin
          Inc (Run);
          fTokenID:= tkFloat;
          State:= nsDotFound;

        // Non-number dot
        end
        else begin
          // Ellipsis
          if (FLine[Run] = '.') and (FLine[Run+1] = '.') then
            Inc (Run, 2);
          fTokenID:= tkSymbol;
          Result:= False;
          Exit;
        end; // if
      end; // DOT

      // Look for zero (0)
      '0': begin
        temp:= FLine[Run];
        // 0x123ABC
        if CharInSet(temp, ['x', 'X']) then begin
          Inc (Run);
          fTokenID:= tkHex;
          State:= nsHex;
        // 0.45
        end
        else if temp = '.' then begin
          Inc (Run);
          State:= nsDotFound;
          fTokenID:= tkFloat;
        end
        else if CharInSet(temp, ['0'..'9']) then begin
          Inc (Run);
          // 0123 or 0123.45
          if CharInSet(temp, ['0'..'7']) then begin
            fTokenID:= tkOct;
            State:= nsOct;
          // 0899.45
          end
          else begin
            fTokenID:= tkFloat;
            State:= nsFloatNeeded;
          end; // if
        end; // if
      end; // ZERO
    end; // case

    Result:= True;
  end; // CheckSpecialCases

  function HandleBadNumber: Boolean;
  begin
    Result:= False;
    fTokenID:= tkUnknown;
    // Ignore all tokens till end of "number"
    while IsIdentChar(FLine[Run]) or
          (FLine[Run] = '.') do
      Inc (Run);
  end; // HandleBadNumber

  function HandleExponent: Boolean;
  begin
    State:= nsExpFound;
    fTokenID:= tkFloat;
    // Skip e[+/-]
    if CharInSet(FLine[Run+1], ['+', '-']) then
      Inc (Run);
    // Invalid token : 1.0e
    if not CharInSet(FLine[Run+1], ['0'..'9']) then begin
      Inc (Run);
      Result:= HandleBadNumber;
      Exit;
    end; // if

    Result:= True;
  end; // HandleExponent

  function HandleDot: Boolean;
  begin
    // Check for ellipsis
    Result:= (FLine[Run+1] <> '.') or
             (FLine[Run+2] <> '.');
    if Result then begin
      State:= nsDotFound;
      fTokenID:= tkFloat;
    end; // if
  end; // HandleDot

  function CheckStart: Boolean;
  begin
    // 1234
    if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    //123e4
    end
    else if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 123.45j
    end
    else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      fTokenID:= tkFloat;
      Result:= False;
    // 123.45
    end
    else if temp = '.' then begin
      Result:= HandleDot;
    // Error!
    end
    else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end
    else begin
      Result:= False;
    end; // if
  end; // CheckStart

  function CheckDotFound: Boolean;
  begin
    // 1.0e4
    if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 123.45
    end else if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    // 123.45j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      Result:= False;
    // 123.45.45: Error!
    end else if temp = '.' then begin
      Result:= False;
      if HandleDot then
        HandleBadNumber;
    // Error!
    end else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end else begin
      Result:= False;
    end; // if
  end; // CheckDotFound

  function CheckFloatNeeded: Boolean;
  begin
    // 091.0e4
    if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 0912345
    end else if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    // 09123.45
    end else if temp = '.' then begin
      Result:= HandleDot or HandleBadNumber; // Bad octal
    // 09123.45j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      Result:= False;
    // End of number (error: Bad oct number) 0912345
    end else begin
      Result:= HandleBadNumber;
    end;
  end; // CheckFloatNeeded

  function CheckHex: Boolean;
  begin
    // 0x123ABC
    if CharInSet(temp, ['a'..'f', 'A'..'F', '0'..'9']) then begin
      Result:= True;
    // 0x123ABCL
    end
    else if CharInSet(temp, ['l', 'L']) then begin
      Inc (Run);
      Result:= False;
    // 0x123.45: Error!
    end
    else if temp = '.' then begin
      Result:= False;
      if HandleDot then
        HandleBadNumber;
    // Error!
    end
    else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end
    else begin
      Result:= False;
    end; // if
  end; // CheckHex

  function CheckOct: Boolean;
  begin
    // 012345
    if CharInSet(temp, ['0'..'9']) then begin
      if not CharInSet(temp, ['0'..'7']) then begin
        State:= nsFloatNeeded;
        fTokenID:= tkFloat;
      end; // if
      Result:= True;
    // 012345L
    end else if CharInSet(temp, ['l', 'L']) then begin
      Inc (Run);
      Result:= False;
    // 0123e4
    end else if CharInSet(temp, ['e', 'E']) then begin
      Result:= HandleExponent;
    // 0123j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      fTokenID:= tkFloat;
      Result:= False;
    // 0123.45
    end else if temp = '.' then begin
      Result:= HandleDot;
    // Error!
    end else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end else begin
      Result:= False;
    end; // if
  end; // CheckOct

  function CheckExpFound: Boolean;
  begin
    // 1e+123
    if CharInSet(temp, ['0'..'9']) then begin
      Result:= True;
    // 1e+123j
    end else if CharInSet(temp, ['j', 'J']) then begin
      Inc (Run);
      Result:= False;
    // 1e4.5: Error!
    end else if temp = '.' then begin
      Result:= False;
      if HandleDot then
        HandleBadNumber;
    // Error!
    end else if IsIdentChar(temp) then begin
      Result:= HandleBadNumber;
    // End of number
    end else begin
      Result:= False;
    end; // if
  end; // CheckExpFound

begin
  State:= nsStart;
  fTokenID:= tkNumber;

  temp:= FLine[Run];
  Inc (Run);

  // Special cases
  if not CheckSpecialCases then
    Exit;

  // Use a state machine to parse numbers
  while True do begin
    temp:= FLine[Run];

    case State of
      nsStart:
        if not CheckStart then
          Exit;
      nsDotFound:
        if not CheckDotFound then
          Exit;
      nsFloatNeeded:
        if not CheckFloatNeeded then
          Exit;
      nsHex:
        if not CheckHex then
          Exit;
      nsOct:
        if not CheckOct then
          Exit;
      nsExpFound:
        if not CheckExpFound then
          Exit;
    end; // case

    Inc (Run);
  end; // while
end;

procedure TSynText_termSyn.SpaceProc;
begin
  inc(Run);
  fTokenID:= tkSpace;
  while (FLine[Run] <= #32) and
        not IsLineEnd(Run) do
    inc(Run);
end;

procedure TSynText_termSyn.String34Proc;
begin
  fTokenID:= tkString;

  repeat
    case FLine[Run] of
      #0, #10, #13:
        begin
          //fStringStarter:= '"';
          //fRange:= rsMultilineString;
          Break;
        end;
      else
        inc(Run);
    end; //case
  until (FLine[Run] = '"');

  if FLine[Run] <> #0 then
    inc(Run);
end;

procedure TSynText_termSyn.String39Proc;
begin
{
  fTokenID:= tkString;

  repeat
    case FLine[Run] of
      #0, #10, #13 : begin
        //fStringStarter:= #39;
        //fRange:= rsMultilineString;
        BREAK;
      end;
      else
        inc(Run);
    end; //case
  until (FLine[Run] = #39);

  if FLine[Run] <> #0 then
    inc(Run);
}
  // J.C.Faria
  fTokenID:= tkString;

  // Trying a pattern (after and before ') of all shortened forms
  case Fline[Run+1] of
    'd': if CharInSet(Fline[Run-1], ['I', 'u', 'e', 't', 'y']) and
            (Fline[Run+2] = #0) or
            (Fline[Run+2] = ' ') then fTokenID:= tkUnknown;

    'l': if (Fline[Run+2] = 'l') and
            CharInSet(Fline[Run-1], ['I', 'u', 'e', 'y']) and
            (Fline[Run+3] = #0) or
            (Fline[Run+3] = ' ') then fTokenID:= tkUnknown;

    'm': if (Fline[Run-1] = 'I') then fTokenID:= tkUnknown;

    'r': if (Fline[Run+2] = 'e') and
            CharInSet(Fline[Run-1], ['u', 'e', 'y']) and
            (Fline[Run+3] = #0) or
            (Fline[Run+3] = ' ') then fTokenID:= tkUnknown;

    's': if CharInSet(Fline[Run-1], ['e', 't']) or
            (Fline[Run-1] <> ' ') and
            (Fline[Run+2] = #0) or
            (Fline[Run+2] = ' ') then fTokenID:= tkUnknown;

    't': if (Fline[Run-1] = 'n') and
            (Fline[Run+2] = #0) or
            (Fline[Run+2] = ' ') then fTokenID:= tkUnknown;

    'v': if (Fline[Run+2] = 'e') and
            CharInSet(Fline[Run-1], ['I', 'u', 'e', 'y']) and
            (Fline[Run+3] = #0) or
            (Fline[Run+3] = ' ') then fTokenID:= tkUnknown;

    ' ': if (Fline[Run-1] = 's') and
            (Fline[Run+1] = ' ') then fTokenID:= tkIdentifier;  // as in: pen's Jonh's Swami's ...

     #0: if (Fline[Run-1] = 's') then fTokenID:= tkIdentifier;  // ' in end of line as in: pencils' #10#13

    {')': if (Fline[Run-1] = '(') then fTokenID:= tkSymbol;  // (') cases}
  end;  //case

  // If the 'case' condition above set to tkUnknown: inc(Run) and Exit
  if (fTokenID <> tkString) then begin
    Inc(Run);
    Exit;
  end;

  repeat
    case FLine[Run] of
      #0, #10, #13 : begin
        //if fTokenID = tkUnknown then Break;  // J.C.Faria: End of line and not start tkString -> It is necessary to force to break!
        //fStringStarter:= #39;
        //fRange:= rsMultilineString;
        Break;
      end;
      else
        Inc(Run);
    end; //case
  until (FLine[Run] = #39) and
        (FLine[Run + 1] <> #39);  // It is necessary due to scape \ in some args, for example: read.table(quote='\'');

  if (FLine[Run] <> #0) then
    Inc(Run);
end;

//Multiline is not suitable for Rterm!
(**
procedure TSynText_termSyn.StringEndProc(EndChar: WideChar);
begin
  //if fRange = rsMultilineString then
    //fTokenID:= tkString;

  case FLine[Run] of
    #0: begin
          NullProc;
          Exit;
        end;

    #10: begin
           LFProc;
           Exit;
         end;

    #13: begin
           CRProc;
           Exit;
         end;
  end;
{
  if fRange = rsMultilineString then
    repeat
      if FLine[Run] = fStringStarter then begin
        inc(Run);
        fRange:= rsUnknown;
        EXIT;
      end
      else
        inc(Run);
    until IsLineEnd(Run);
}
end;
**)

procedure TSynText_termSyn.UnknownProc;
begin
  inc(Run);
  fTokenID:= tkUnknown;
end;

procedure TSynText_termSyn.Next;
begin
  fTokenPos:= Run;

  //case fRange of
    //rsMultilineString: StringEndProc(fStringStarter);  // Multiline is not suitable for Rterm!
    //else
      case fLine[Run] of
        '~', '$', '?', '!', '=', '|',
        '^', '*', '+', '-', '&', '<',
        '>', ':', '/': OperatorProc;

        '{', '}', '(', ')', '[', ']',
        ';', ',': SymbolProc;


        '#': CommentProc;

        'A'..'Z', 'a'..'z', '_', 'À'..'Ö', 'Ø'..'ö', 'ø'..'ÿ': IdentProc;

        '.', '0'..'9': NumberProc;

        #0: NullProc;

        #1..#9, #11, #12, #14..#32: SpaceProc;

        #10: LFProc;

        #13: CRProc;

        #34: String34Proc;  // double quote

        #39: String39Proc;  // single quote

        else UnknownProc;
      end;
  //end;
  inherited;
end;

function TSynText_termSyn.GetDefaultAttribute(Index: integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT:    Result:= fCommentAttri;
    SYN_ATTR_WHITESPACE: Result:= fSpaceAttri;
    SYN_ATTR_SYMBOL:     Result:= fSymbolAttri;
  else
    Result:= nil;
  end;
end;

function TSynText_termSyn.GetEol: Boolean;
begin
  Result:= Run = fLineLen + 1;
end;

function TSynText_termSyn.GetRange: Pointer;
begin
  Result:= Pointer(fRange);
end;

function TSynText_termSyn.GetTokenID: TtkTokenKind;
begin
  Result:= fTokenId;
end;

function TSynText_termSyn.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment:             Result:= fCommentAttri;
    tkNote:              Result:= fNoteAttri;
    tkNote_1:              Result:= fNote_1Attri;
    tkNote_2:              Result:= fNote_2Attri;
    tkIdentifier:          Result:= fIdentifierAttri;
    tkNumber:              Result:= fNumberAttri;
    tkHex:                 Result:= fHexAttri;
    tkOct:                 Result:= fOctalAttri;
    tkFloat:               Result:= fFloatAttri;
    tkSpace:               Result:= fSpaceAttri;
    tkString:              Result:= fStringAttri;
    tkSymbol:              Result:= fSymbolAttri;
    tkOperator:            Result:= fOperatorAttri;
  else
    Result:= nil;
  end;
end;

function TSynText_termSyn.GetTokenKind: integer;
begin
  Result:= Ord(fTokenId);
end;

procedure TSynText_termSyn.ResetRange;
begin
  fRange:= rsUnknown;
end;

procedure TSynText_termSyn.SetRange(Value: Pointer);
begin
  fRange:= TRangeState(Value);
end;

function TSynText_termSyn.IsFilterStored: Boolean;
begin
  Result:= fDefaultFilter <> SYNS_FilterText;
end;

class function TSynText_termSyn.GetLanguageName: string;
begin
  Result:= SYNS_LangText;
end;

function TSynText_termSyn.GetSampleSource: UnicodeString;
begin
  Result:=
    '# Text highlighter sample'#13#10 +
    '#! Note                                     # Note'#13#10 +
    '#!. Note_1                                  # Note_1'#13#10 +
    '#!.. Note_2                                 # Note_2'#13#10 +
    '# Notes and observations!                   # Comment'#13#10 +
    'pB <- 3.5E2                                 # Float number'#13#10 +
    '0 1 2 3 4 5 6 8 9                           # Numbers'#13#10 +
    #13#10 +
    'variable_a = 1:100                          # Identifier'#13#10 +
    'variable.b <- 1:100                         # Identifier'#13#10 +
    #13#10 +
    '+ - * / ^ = <- -> <> ~ $ ? ! & :            # Operator'#13#10 +
    '() {} [] ; ,                                # Symbol'#13#10 +
    #13#10 +
    'cat(''\nI - Basics measures:''); cat(''\n\n'')  # String'#13#10 +
    'he''s isn''t we''ve they''d (''all not string'')  # Shorttned forms'#13#10 +
    'string <- "This is" ''a string''              # String';
end;

class function TSynText_termSyn.GetFriendlyLanguageName: UnicodeString;
begin
  Result:= SYNS_FriendlyLangText_term;
end;

initialization
{$IFNDEF SYN_CPPB_1}
  RegisterPlaceableHighlighter(TSynText_termSyn);
{$ENDIF}
finalization
end.
