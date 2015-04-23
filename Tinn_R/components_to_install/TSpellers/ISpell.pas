unit ISpell;

interface

 uses Classes, Windows,
   {$IFDEF VER130} { Borland Delphi 5.x }
      consts,
   {$ELSE}
      RTLConsts,
   {$ENDIF}
      SysUtils, Graphics;

 const MaxListSize = Maxint div 16;

type
 TDuplicates = (dupIgnore, dupAccept, dupError);

 PTableItem = ^TTableItem;
 TTableItem = record
   FString: WideString;
   FObject: WideString;
 end;

 PTableItemList = ^TTableItemList;
 TTableItemList = array[0..MaxListSize] of TTableItem;

 TTableList = class
   private
    FList: PTableItemList;
    FCount: Integer;
    FCapacity: Integer;
    FSorted: Boolean;
    FDuplicates: TDuplicates;
    procedure ExchangeItems(Index1, Index2: Integer);
    procedure Grow;
    procedure QuickSort(L, R: Integer);
    procedure InsertItem(Index: Integer; const S: WideString);
    procedure SetSorted(Value: Boolean);
   protected
    procedure Error(const Msg: string; Data: Integer);
    procedure Changed; virtual;
    procedure Changing; virtual;
    function GetCapacity: Integer;
    function GetCount: Integer;
    procedure Put(Index: Integer; const S: WideString);
    procedure PutObject(Index: Integer; AObject: WideString);
    procedure SetCapacity(NewCapacity: Integer);
    procedure SetUpdateState(Updating: Boolean);
   public
    function Get(Index: Integer): WideString;
    function GetObject(Index: Integer): WideString;
    destructor Destroy; override;
    function Add(const S: WideString): Integer;
    function AddObject(const S,AObject: WideString): Integer;
    procedure Clear;
    procedure Delete(Index: Integer);
    procedure Exchange(Index1, Index2: Integer);
    function Find(const S: WideString; var Index: Integer): Boolean; virtual;
    function IndexOf(const S: WideString): Integer;
    procedure Insert(Index: Integer; const S: WideString);
    procedure Sort; virtual;
    property Duplicates: TDuplicates read FDuplicates write FDuplicates;
    property Sorted: Boolean read FSorted write SetSorted;
    property Count: Integer read FCount;
 end; {TTableList}


 TConvTable = class
    Charset: String;
    InTbl,OutTbl: TTableList;
    constructor Create;
    destructor Destroy; override;
    function Load (Name: String): Boolean;
    procedure Clear;
 end; { TConvTable }
 function Replace (var S: String; const A,B: String): Boolean;
 function ToUTF8(const S: WideString): String;
 function FromUTF8(const S: String): WideString;
 procedure StrSwapByteOrder(Str: PWideChar);

 function GetCvt (S: WideString; const Table: TConvTable): WideString;
 function PutCvt (S: WideString; const Table: TConvTable): WideString;
 function GetCvtU (S: WideString; const Table: TConvTable): WideString;
 function PutCvtU (S: WideString; const Table: TConvTable): WideString;
 function UtoXC (const S: WideString; const Table: TConvTable): WideString;
 procedure ParseSetup (S: WideString; var Left,Right: WideString);
 function XtoU (const S: WideString): WideString;
 function UtoX (const S: WideString): WideString;
 function UntoX (const S: WideString; MaxOrd: Integer): WideString;

 function myReadLn (var F: TextFile; var S: String; Max: Integer=8192): Boolean;
 function myEof (var F: TextFile): Boolean;
 procedure myClose (var F: TextFile);
 procedure myReset (var F: TextFile);

 function GetTFontCharset(Charset : String): TFontCharset;
 function GetICodePage(Charset: String): Integer;

 type TLineSeparator = (NoLS,LF,CR,CRLF,LS);

 var CurLineSeparator: TLineSeparator;

 const
   UTF16BE = 'UTF-16 (BE)';
   UTF16LE = 'UTF-16 (LE)';
   UTF8    = 'UTF-8';

implementation

const BufStep=80;

type DeviceFunc=function (var F: TTextRec): Integer;

procedure ReadBuf (var F: TextFile);
begin
    with TTextRec(F) do
    begin
        DeviceFunc(InOutFunc)(TTextRec(F));
        if BufEnd=0 then
            UserData[2]:=$FF;//  Mode:=Mode or $F00;  //eof
    end;
end; {ReadBuf}

{TTableList}
destructor TTableList.Destroy;
begin
  inherited Destroy;
  if FCount <> 0 then Finalize(FList^[0], FCount);
  FCount := 0;
  SetCapacity(0);
end;

function TTableList.Add(const S: WideString): Integer;
begin
  if not Sorted then
    Result := FCount
  else
    if Find(S, Result) then
      case Duplicates of
        dupIgnore: Exit;
        dupError: Error(SDuplicateString, 0);
      end;
  InsertItem(Result, S);
end;

function TTableList.AddObject(const S,AObject: WideString): Integer;
begin
  if not Sorted then
    Result := FCount
  else
    if Find(S, Result) then
      case Duplicates of
        dupIgnore: Exit;
        dupError: Error(SDuplicateString, 0);
      end;
  InsertItem(Result, S);
  PutObject(Result, AObject);
end; {TTableList.AddObject}

procedure TTableList.Changed;
begin
//  if (FUpdateCount = 0) and Assigned(FOnChange) then FOnChange(Self);
end;

procedure TTableList.Changing;
begin
//  if (FUpdateCount = 0) and Assigned(FOnChanging) then FOnChanging(Self);
end;

procedure TTableList.Clear;
begin
  if FCount <> 0 then
  begin
    Changing;
    Finalize(FList^[0], FCount);
    FCount := 0;
    SetCapacity(0);
    Changed;
  end;
end;

procedure TTableList.Delete(Index: Integer);
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Changing;
  Finalize(FList^[Index]);
  Dec(FCount);
  if Index < FCount then
    System.Move(FList^[Index + 1], FList^[Index],
      (FCount - Index) * SizeOf(TStringItem));
  Changed;
end;

procedure TTableList.Exchange(Index1, Index2: Integer);
begin
  if (Index1 < 0) or (Index1 >= FCount) then
    Error(SListIndexError, Index1);
  if (Index2 < 0) or (Index2 >= FCount) then Error(SListIndexError, Index2);

  Changing;
  ExchangeItems(Index1, Index2);
  Changed;
end;

procedure TTableList.ExchangeItems(Index1, Index2: Integer);
var
  Temp: Integer;
  Item1, Item2: PStringItem;
begin
  Item1 := @FList^[Index1];
  Item2 := @FList^[Index2];
  Temp := Integer(Item1^.FString);
  Integer(Item1^.FString) := Integer(Item2^.FString);
  Integer(Item2^.FString) := Temp;
  Temp := Integer(Item1^.FObject);
  Integer(Item1^.FObject) := Integer(Item2^.FObject);
  Integer(Item2^.FObject) := Temp;
end;

function WCompareText(const A,B: WideString): Integer;
begin
    if (A>B) then result:=1
    else if (A<B) then result:=-1
    else result:=0;
end; {WCompareText}

function TTableList.Find(const S: WideString; var Index: Integer): Boolean;
var
  L, H, I, C: Integer;
begin
  Result := False;
  L := 0;
  H := FCount - 1;
  while L <= H do
  begin
    I := (L + H) shr 1;
    C := WCompareText(FList^[I].FString, S);
    if C < 0 then L := I + 1 else
    begin
      H := I - 1;
      if C = 0 then
      begin
        Result := True;
        if Duplicates <> dupAccept then L := I;
      end;
    end;
  end;
  Index := L;
end;

function TTableList.Get(Index: Integer): WideString;
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Result := FList^[Index].FString;
end;

function TTableList.GetCapacity: Integer;
begin
  Result := FCapacity;
end;

function TTableList.GetCount: Integer;
begin
  Result := FCount;
end;

function TTableList.GetObject(Index: Integer): WideString;
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Result := FList^[Index].FObject;
end;

procedure TTableList.Grow;
var
  Delta: Integer;
begin
  if FCapacity > 64 then Delta := FCapacity div 4 else
    if FCapacity > 8 then Delta := 16 else
      Delta := 4;
  SetCapacity(FCapacity + Delta);
end;

function TTableList.IndexOf(const S: WideString): Integer;
begin
  if not Sorted then
  begin
    for Result := 0 to GetCount - 1 do
        if WCompareText(Get(Result), S) = 0 then Exit;
    Result := -1;
  end
  else
    if not Find(S, Result) then Result := -1;
end;

procedure TTableList.Insert(Index: Integer; const S: WideString);
begin
  if Sorted then Error(SSortedListError, 0);
  if (Index < 0) or (Index > FCount) then Error(SListIndexError, Index);
  InsertItem(Index, S);
end;

procedure TTableList.InsertItem(Index: Integer; const S: WideString);
begin
  Changing;
  if FCount = FCapacity then Grow;
  if Index < FCount then
    System.Move(FList^[Index], FList^[Index + 1],
      (FCount - Index) * SizeOf(TStringItem));
  with FList^[Index] do
  begin
    Pointer(FString) := nil;
    Pointer(FObject) := nil;
    FObject := '';
    FString := S;
  end;
  Inc(FCount);
  Changed;
end;

procedure TTableList.Put(Index: Integer; const S: WideString);
begin
  if Sorted then Error(SSortedListError, 0);
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Changing;
  FList^[Index].FString := S;
  Changed;
end;

procedure TTableList.PutObject(Index: Integer; AObject: WideString);
begin
  if (Index < 0) or (Index >= FCount) then Error(SListIndexError, Index);
  Changing;
  FList^[Index].FObject := AObject;
  Changed;
end;

procedure TTableList.QuickSort(L, R: Integer);
var
  I, J: Integer;
  P: WideString;
begin
  repeat
    I := L;
    J := R;
    P := FList^[(L + R) shr 1].FString;
    repeat
      while WCompareText(FList^[I].FString, P) < 0 do Inc(I);
      while WCompareText(FList^[J].FString, P) > 0 do Dec(J);
      if I <= J then
      begin
        ExchangeItems(I, J);
        Inc(I);
        Dec(J);
      end;
    until I > J;
    if L < J then QuickSort(L, J);
    L := I;
  until I >= R;
end;

procedure TTableList.SetCapacity(NewCapacity: Integer);
begin
  ReallocMem(FList, NewCapacity * SizeOf(TStringItem));
  FCapacity := NewCapacity;
end;

procedure TTableList.SetSorted(Value: Boolean);
begin
  if FSorted <> Value then
  begin
    if Value then Sort;
    FSorted := Value;
  end;
end;

procedure TTableList.SetUpdateState(Updating: Boolean);
begin
  if Updating then Changing else Changed;
end;

procedure TTableList.Sort;
begin
  if not Sorted and (FCount > 1) then
  begin
    Changing;
    QuickSort(0, FCount - 1);
    Changed;
  end;
end;

procedure TTableList.Error(const Msg: string; Data: Integer);
  function ReturnAddr: Pointer;
  asm
          MOV     EAX,[EBP+4]
  end;
begin
  raise EStringListError.CreateFmt(Msg, [Data]) at ReturnAddr;
end;

{ TConvTable }
procedure TConvTable.Clear;
begin
    InTbl.Clear;
    OutTbl.Clear;
end; {TConvTable.Clear}

constructor TConvTable.Create;
begin
  inherited;
  Charset:='';
  InTbl:=TTableList.Create;
  InTbl.Sorted:=True;
  InTbl.Duplicates:=dupIgnore;
  OutTbl:=TTableList.Create;
  OutTbl.Sorted:=True;
  OutTbl.Duplicates:=dupIgnore;
end; {TConvTable.Create}

destructor TConvTable.Destroy;
begin
 InTbl.Free;
 OutTbl.Free;
 inherited;
end; {TConvTable.Destroy}

function TConvTable.Load(Name: String): Boolean;
 var F: TextFile;
     A,B,S: WideString;
     SS: String;
begin
  try
    Assign(F,Name);
    myReset(F);
    while not myEof(F) do
    begin
        myReadLn(F,SS);
        if SS='' then continue;
        S:=XtoU(SS);
        ParseSetup(S,A,B);
        InTbl.AddObject(A,B);
        OutTbl.AddObject(B,A);
    end;
    myClose(F);
    result:=True;
  except
    result:=False;
  end;
end; {TConvTable.Load}

function Replace (var S: String; const A,B: String): Boolean;
 var N: Integer;
begin
    result:=False;
    N:=Pos(AnsiUpperCase(A),AnsiUpperCase(S));
    if N=0 then exit;
    Delete(S,N,length(A));
    Insert(B,S,N);
    Result:=True;
end;

function ToUTF8 (const S: WideString): String;
 var b: byte;
     c: WChar;
     i: Integer;
begin
    result:='';
    for i:=1 to length(S) do
    begin
        c:=S[i];
        if ord(c)<128 then
            result:=result+char(c)
        else if ord(c)<2048 then
        begin
            b:=(ord(c) shr 6) and $1F or $C0;
            result:=result+char(b);
            b:=ord(c) and $3F or $80;
            result:=result+char(b);
        end
        else begin
            b:=(ord(c) shr 12) and $F or $E0;
            result:=result+char(b);
            b:=(ord(c) shr 6) and $3F or $80;
            result:=result+char(b);
            b:=ord(c) and $3F or $80;
            result:=result+char(b);
        end;
    end;
end; {ToUTF8}

function FromUTF8 (const S: String): WideString;
 var a,b,c: char;
     i,j: Integer;
begin
  i:=1; j:=1;
  SetLength(result,length(S));
  while i<=length(S) do
  begin
    a:=S[i]; Inc(i);
    if byte(a)<$80 then
    begin
        result[j]:=wchar(a);
        Inc(j);
        continue;
    end;
    if i>length(S) then break;
    b:=S[i]; Inc(i);
    if (byte(a)<$E0) or (i>length(S)) then
    begin
        result[j]:=wchar(((byte(a) and $1F) shl 6) or (byte(b) and $3F));
        Inc(j);
        continue;
    end;
    c:=S[i]; Inc(i);
    result[j]:=wchar(((byte(a) and $F) shl 12) or ((byte(b) and $3F) shl 6) or (byte(c) and $3F));
    Inc(j);
  end;
  SetLength(result,j-1);
end; {FromUTF8}

procedure StrSwapByteOrder(Str: PWideChar);
// exchanges in each character of the given string the low order and high order
// byte to go from LSB to MSB and vice versa.
// EAX contains address of string

asm
         PUSH ESI
         PUSH EDI
         MOV ESI, EAX
         MOV EDI, ESI
         XOR EAX, EAX  // clear high order byte to be able to use 32bit operand below
@@1:     LODSW
         OR EAX, EAX
         JZ @@2
         XCHG AL, AH
         STOSW
         JMP @@1
         
@@2:     POP EDI
         POP ESI
end;

//----------------------------------------------------------------------------------------------------------------------


function GetCvt (S: WideString; const Table: TConvTable): WideString;
 var i,j,m: integer;
     A,B: WideString;
begin
    i:=1;
    if (Table.InTbl.Count>0) then
    while i<=length(S) do
    begin
        m:=0;
        Table.InTbl.Find(S[i],j);
        while (j<Table.InTbl.Count) and (Table.InTbl.Get(j)[1]=S[i]) do
        begin
            A:=Table.InTbl.Get(j);
            if (Copy(S,i,length(A))=A) and (length(A)>m) then
            begin   
                m:=length(A);
                B:=Table.InTbl.GetObject(j);
            end;
            Inc(j);
        end;
        if m>0 then
        begin
            Delete(S,i,m);
            Insert(B,S,i);
            Inc(i,length(B)-1);
        end;
        Inc(i);
    end; {if, while}
    result:=S;
end; {GetCvt}

function PutCvt (S: WideString; const Table: TConvTable): WideString;
 var i,j,m: integer;
     A,B: WideString;
begin
    i:=1;
    while i<=length(S) do
    begin
        m:=0;
        Table.OutTbl.Find(S[i],j);
        while (j<Table.OutTbl.Count) and (Table.OutTbl.Get(j)[1]=S[i]) do
        begin
            A:=Table.OutTbl.Get(j);
            if (Copy(S,i,length(A))=A) and (length(A)>m) then
            begin
                m:=length(A);
                B:=Table.OutTbl.GetObject(j);
            end;
            Inc(j);
        end;
        if m>0 then
        begin
            Delete(S,i,m);
            Insert(B,S,i);
            Inc(i,length(B)-1);
        end;
         Inc(i);
    end;
    result:=S;
end; {PutCvt}

function GetCvtU (S: WideString; const Table: TConvTable): WideString;
begin
    if AnsiUpperCase(Table.Charset)=UTF8 then
        result:=FromUTF8(S)
    else
        result:=GetCvt(S,Table);
end;

function PutCvtU (S: WideString; const Table: TConvTable): WideString;
begin
    result:=PutCvt(S,Table);
    if AnsiUpperCase(Table.Charset)=UTF8 then
        result:=ToUTF8(result);
    if result='' then;
end; {PutCvtU}

function UtoXC (const S: WideString; const Table: TConvTable): WideString;
 label ok;
 var i,j: integer;
     A,B: WideString;
begin
    result:='';
    i:=1;
    while i<=length(S) do
    begin
        Table.OutTbl.Find(S[i],j);
        while (j<Table.OutTbl.Count) and (Table.OutTbl.Get(j)[1]=S[i]) do
        begin
            A:=Table.OutTbl.Get(j);
            if Copy(S,i,length(A))=A then
            begin
                B:=Table.OutTbl.GetObject(j);
                result:=result+B;
                Inc(i,length(A)-1);
                goto ok;
            end;
            Inc(j);
        end;
        if S[i]<#128 then
            result:=result+S[i]
        else
            result:=result+Format('&#%d;',[ord(S[i])]);
ok:     Inc(i);
    end;
end; {UtoXC}

procedure ParseSetup (S: WideString; var Left,Right: WideString);
 var n: Integer;
begin
    Left:=''; Right:='';
    if S='' then exit;
    if Pos(';',S)=1 then exit;
    while (S<>'') and (S[length(S)]=' ') do
        Delete(S,length(S),1);
    if S='' then exit;
    n:=Pos('=',S);
    if n=0 then
        n:=Pos(' ',S);
    if n=0 then exit;
    Left:=Copy(S,1,n-1);
    while (Left<>'') and (Left[length(Left)]=' ') do
        Delete(Left,length(Left),1);
    Right:=Copy(S,n+1,length(S));
    while (Right<>'') and (Right[1]=' ') do
        Delete(Right,1,1);
end; {ParseSetup}

{Convert &#xxx; to Unicode}
function XtoU (const S: WideString): WideString;
 var W: WChar;
     i,j,n,code: Integer;
begin
  SetLength(result,length(S));
  i:=1; j:=1;
  while i<=length(S) do
  begin
        W:=WChar(S[i]);
        if Copy(S,i,2)='&#' then
        begin
            val(Copy(S,i+2,10),n,code);
            i:=i+code;
            if S[i+2]=';' then Inc(i);
            Inc(i);
            W:=WChar(n);
        end;
        result[j]:=W;
        Inc(j);
        Inc(i);
  end;
  SetLength(result,j-1);
end; {XtoU}

function UntoX (const S: WideString; MaxOrd: Integer): WideString;
 var i,j,n: Integer;
     SS: WideString;
     c: WideChar;
begin
    n:=length(S);
    SetLength(result,n);
    j:=1;
    for i:=1 to length(S) do
    begin
        c:=S[i];
        if ord(c)<MaxOrd then
        begin
            result[j]:=c;
            Inc(j);
        end
        else begin
            SS:='&#'+intToStr(ord(c))+';';
            Inc(n,length(SS));
            SetLength(result,j-1);
            Inc(j,length(SS));
            result:=result+SS;
            SetLength(result,n);
        end;
    end;
    SetLength(result,j-1);
end; {UntoX}

function UtoX (const S: WideString): WideString;
begin
 Result := UnToX(S, 128);
end; {UtoX}

function myReadChar (var F: TextFile): Char;
begin
    with TTextRec(F) do
    begin
        if UserData[1]<>0 then
        begin
            result:=char(UserData[1]);
            UserData[1]:=0;
        end
        else if BufPos<BufEnd then
        begin
            result:=BufPtr[BufPos];
            Inc(BufPos);
        end
        else begin
            BufPos:=0;
            ReadBuf(F);
            result:=BufPtr[BufPos];
            Inc(BufPos);
        end;
    end;
end; {myReadChar}

function myReadLn (var F: TextFile; var S: String; Max: Integer=8192): Boolean;
 var c: Char;
     n: Integer;
begin
    S:=''; n:=0;
    result:=False;
    with TTextRec(F) do
    while not myEof(F) do
    begin
        c:=myReadChar(F);
        if c=^J then
        begin
            if CurLineSeparator=NoLS then
                CurLineSeparator:=LF;
            result:=True;
            break;
        end;
        if c=^M then
        begin
            result:=True;
            if myEof(F) then
            begin
                if CurLineSeparator=NoLS then
                    CurLineSeparator:=CR;
                break;
            end;
            UserData[1]:=byte(myReadChar(F));
            if char(UserData[1])=^J then
            begin
                if CurLineSeparator=NoLS then
                    CurLineSeparator:=CRLF;
                UserData[1]:=0;
            end
            else
                if CurLineSeparator=NoLS then
                    CurLineSeparator:=CR;
            break;
        end;
        Inc(n);
        if n>length(S) then
            SetLength(S,n+BufStep);
        S[n]:=c;    //S:=S+c;
        if n>Max then
        begin
            result:=True;
            break;
        end;
    end;
    SetLength(S,n);
    if (S<>'') and (S[length(S)]=^M) then Delete(S,length(S),1);
end; {myReadLn}

function myEof (var F: TextFile): Boolean;
begin
    with TTextRec(F) do
    begin
        if (UserData[2]=0) and (BufPos>=BufEnd) then
            ReadBuf(F);
        result:=(UserData[2]<>0) and (UserData[1]=0);
    end;
end; {myEof}

procedure myClose (var F: TextFile);
begin
    with TTextRec(F) do
    begin
        //Mode:=Mode and not $F00;
        UserData[2]:=0;
        UserData[1]:=0;
    end;
    CloseFile(F);
end; {myClose}

procedure myReset (var F: TextFile);
begin
    with TTextRec(F) do
    begin
        //Mode:=Mode and not $F00;
        UserData[2]:=0;
        UserData[1]:=0;
    end;
    Reset(F);
end; {myReset}

//Convert a Internet message Charset to TFontCharset
function GetTFontCharset(Charset: String): TFontCharset;
begin
  Result := DEFAULT_CHARSET;
  if AnsiCompareText(Charset, 'koi8-r') = 0 then Result := RUSSIAN_CHARSET;
  if AnsiCompareText(Charset, 'iso-ir-111') = 0 then Result := RUSSIAN_CHARSET;
  if AnsiCompareText(Charset, 'macroman') = 0 then Result := MAC_CHARSET;
  if AnsiCompareText(Charset, 'iso-8859-1') = 0 then Result := ANSI_CHARSET;
  if AnsiCompareText(Charset, 'iso-8859-2') = 0 then Result := EASTEUROPE_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-3') = 0 then Result := TURKISH_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-4') = 0 then Result := Baltic_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-5') = 0 then Result := RUSSIAN_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-6') = 0 then Result := ARABIC_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-7') = 0 then Result := GREEK_CHARSET;
  if AnsiCompareText(Charset, 'iso-8859-8') = 0 then Result := HEBREW_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-9') = 0 then Result := TURKISH_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-10') = 0 then Result := Baltic_CharSet;
  if AnsiCompareText(Charset, 'iso-8859-13') = 0 then Result := Baltic_CharSet;
end;

//Convert a Internet message Charset to CodePage
function GetICodePage(Charset: String): Integer;
begin
  Result := GetAcp();
  if AnsiCompareText(Charset, 'koi8-r') = 0 then Result := 1251;
  if AnsiCompareText(Charset, 'iso-ir-111') = 0 then Result := 1251;
  if AnsiCompareText(Charset, 'UTF-8') = 0 then Result := 1200;
  if AnsiCompareText(Charset, 'macroman') = 0 then Result := CP_MACCP;
  if AnsiCompareText(Charset, 'iso-8859-1') = 0 then Result := 1252;
  if AnsiCompareText(Charset, 'iso-8859-2') = 0 then Result := 1250;
  if AnsiCompareText(Charset, 'iso-8859-3') = 0 then Result := 1254;
  if AnsiCompareText(Charset, 'iso-8859-4') = 0 then Result := 1257;
  if AnsiCompareText(Charset, 'iso-8859-5') = 0 then Result := 1251;
  if AnsiCompareText(Charset, 'iso-8859-6') = 0 then Result := 1256;
  if AnsiCompareText(Charset, 'iso-8859-7') = 0 then Result := 1253;
  if AnsiCompareText(Charset, 'iso-8859-8') = 0 then Result := 1255;
  if AnsiCompareText(Charset, 'iso-8859-9') = 0 then Result := 1254;
  if AnsiCompareText(Charset, 'iso-8859-10') = 0 then Result := 1257;
  if AnsiCompareText(Charset, 'iso-8859-13') = 0 then Result := 1257;
end;

end.
