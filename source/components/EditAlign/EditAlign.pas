unit EditAlign;

(*=== File Description ========================================================
      DESC: TEditAlign is an improved TEdit component with alignment
            (that handles left, center or right text justification),
            ExitOnEnterKey and Multiline properties.

    Author: Ryan Fischbach
            ryantf@bigfoot.com
            http://www.bigfoot.com/~RyanTF/Delphi/downloads.html

      NOTE: This component is freeware on one condition:
            If you change this control in any way,
            please notify the author of the change.
            Otherwise, enjoy!

   Version 1.3: 2003.1.9
     Added AutoSelectOnMouseEnter so that the control will AutoSelect when
     OnEnter occurs due to a left-click mouse event (good for currency editing).
     Also, removed the overridden Destroy method... it was useless. =)
     Added a data-aware version as well.

   Version 1.2: 2001.8.1
     Apparently, modern MS Windows OSes do not need to have the control be
     multiline in order for the alignment to function.  Which is good because
     the "password mode" does not work with a multiline control. :)
     Thank you Tobias Grimm for this observation and for notifying me.
     Since I have no way of knowing exactly what OS/IE combination
     introduced this "bug fix", I have added a property that defaults to
     false.  This property, "OldOS", determines whether or not to force the
     control into Pseudo-Multiline mode in order for the alignment to
     function like the original Version 1.1.

   Version 1.1: 1999.3.16
     Many thanks to José María Ferri for this great observation...
       Alignment only works if the control is a multiline control,
       so if multiline property is false, alignment is always left :-(

==============================================================================*)

// Copyright of Ryan Fischbach, 1999, 2000, 2001


{------------------------------------------------------------------------}
{-------------------------}    INTERFACE   {-----------------------------}
{------------------------------------------------------------------------}

uses
  Messages, Windows, SysUtils, Classes, StdCtrls, Controls,
  DB, DBCtrls;


type
  TEditAlign = class(TCustomEdit)
    private
      FAlignment: TAlignment;
      bExitOnEnterKey: boolean;
      bMultiline: boolean;
      bWordWrap: boolean;
      bOldOS: boolean;
      bAutoSelectOnMouseEnter: boolean;
      bEnteringControlViaMouse: boolean;
    protected
      procedure CreateParams(var Params: TCreateParams); override;
      procedure CMEnter(var aMessage: TCMEnter); message CM_ENTER;
      procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
      procedure KeyPress(var Key: char); override;
      procedure PurgeTextOfCRLF;
      procedure SetAlignment(const Value: TAlignment);
      procedure SetExitOnEnterKey(const Value: boolean);
      procedure SetMultiline(const Value: boolean);
      procedure SetWordWrap(const Value: boolean);
      procedure SetOldOS(const Value: boolean);
    public
      Constructor Create(aOwner: TComponent); override;
    published
      property Alignment: TAlignment
                   read FAlignment               write SetAlignment       default taLeftJustify;
      property AutoSelectOnMouseEnter: boolean
                   read bAutoSelectOnMouseEnter  write bAutoSelectOnMouseEnter default false;
      property ExitOnEnterKey: boolean
                   read bExitOnEnterKey          write SetExitOnEnterKey  default false;
      property MultiLine: boolean
                   read bMultiline               write SetMultiline       default false;
      property OldOS: boolean
                   read bOldOS                   write SetOldOS           default false;
      property WordWrap: boolean
                   read bWordWrap                write SetWordWrap        default false;
    published
      property AutoSelect;
      property AutoSize;
      property BorderStyle;
      property CharCase;
      property Color;
      property Ctl3D;
      property DragCursor;
      property DragMode;
      property Enabled;
      property Font;
      property HideSelection;
      property MaxLength;
      property OEMConvert;
      property ParentColor;
      property ParentCtl3D;
      property ParentFont;
      property ParentShowHint;
      property PasswordChar;
      property PopupMenu;
      property ReadOnly;
      property ShowHint;
      property TabOrder;
      property TabStop;
      property Text;
      property Visible;
      property OnChange;
      property OnClick;
      property OnDblClick;
      property OnDragDrop;
      property OnDragOver;
      property OnEndDrag;
      property OnEnter;
      property OnExit;
      property OnKeyDown;
      property OnKeyPress;
      property OnKeyUp;
      property OnMouseDown;
      property OnMouseMove;
      property OnMouseUp;
      property OnStartDrag;
  end;

type
  TDBEditAlign = class(TDBEdit)
  protected
    FAlignment: TAlignment;
    DataLink: TFieldDataLink;
    procedure SetAlignment(const Value: TAlignment);
  protected
    bAutoSelectOnMouseEnter: boolean;
    bEnteringControlViaMouse: boolean;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CMEnter(var Message: TCMGotFocus); message CM_ENTER;
    procedure WMLButtonUp(var Message: TWMLButtonUp); message WM_LBUTTONUP;
    procedure KeyPress(var Key: Char); override;
  protected
    procedure ResetMaxLength;
    procedure ActiveChange(Sender: TObject);
  public
    constructor Create(aOwner: TComponent); override;
  published
    property Alignment: TAlignment
                 read FAlignment                 write SetAlignment            default taLeftJustify;
    property AutoSelectOnMouseEnter: boolean
                 read bAutoSelectOnMouseEnter    write bAutoSelectOnMouseEnter default false;
  end;



procedure Register;


{------------------------------------------------------------------------}
{-------------------------} IMPLEMENTATION {-----------------------------}
{------------------------------------------------------------------------}

{$R *.DCR}


procedure Register;
{************************************************************************}
{DESC: Register this component with Delphi.                              }
{************************************************************************}
begin
  RegisterComponents('Standard', [TEditAlign]);
  RegisterComponents('Data Controls', [TDBEditAlign]);
end;

{ TEditAlign }

constructor TEditAlign.Create(aOwner: TComponent);
{************************************************************************}
{DESC: Constructor.                                                      }
{************************************************************************}
begin
  inherited Create(AOwner);
  FAlignment := taLeftJustify;
  bExitOnEnterKey := false;
  bMultiline := false;
  bWordWrap := false;
  bOldOS := false;
end;

procedure TEditAlign.CreateParams(var Params: TCreateParams);
{************************************************************************}
{DESC: Allow windows to handle the alignment of the field.               }
{************************************************************************}
begin
  inherited CreateParams(Params);
  if OldOS or Multiline then
    Params.Style := Params.Style or LongWord(ES_MultiLine);
  case Alignment of
    taLeftJustify:
      Params.Style := Params.Style or LongWord(ES_Left);
    taRightJustify:
      Params.Style := Params.Style or LongWord(ES_Right);
    else //taCenter
      Params.Style := Params.Style or LongWord(ES_Center);
  end;//case
  if WordWrap then
    Params.Style := Params.Style and (not LongWord(ES_AUTOHSCROLL))
  else
    Params.Style := Params.Style and (not LongWord(0));
end;

procedure TEditAlign.CMEnter(var aMessage: TCMEnter);
begin
  if (csLButtonDown in ControlState) then
    bEnteringControlViaMouse := true;
  inherited;
end;

procedure TEditAlign.KeyPress(var Key: char);
begin
  case ord(Key) of
    VK_Return:
      begin
        if ExitOnEnterKey then
          begin
            Key := #0;
            PostMessage(Handle,WM_KEYDOWN,VK_TAB,0);
          end
        else
          if (not Multiline) then
            Key := #0;
      end;
  end;//case
  inherited KeyPress(Key);
end;

procedure TEditAlign.PurgeTextOfCRLF;
Var
  TmpPos: integer;
  TmpStr: string;
begin
  TmpStr := Text;
  TmpPos := pos(#13,TmpStr);
  while (TmpPos<>0) do
  begin
    delete(TmpStr,TmpPos,2);
    TmpPos := pos(#13,TmpStr);
  end;//while
  Text := TmpStr;
end;

procedure TEditAlign.SetAlignment(const Value: TAlignment);
begin
  if (FAlignment<>Value) then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;//if
end;

procedure TEditAlign.SetExitOnEnterKey(const Value: boolean);
begin
  if (bExitOnEnterKey<>Value) then
  begin
    bExitOnEnterKey := Value;
    if bExitOnEnterKey and MultiLine then
      MultiLine := false;
  end;//if
end;

procedure TEditAlign.SetMultiline(const Value: boolean);
begin
  if (bMultiline<>Value) then
  begin
    bMultiline := Value;
    if bMultiLine then
      bExitOnEnterKey := false
    else
      PurgeTextOfCRLF;
  end;//if
end;

procedure TEditAlign.SetOldOS(const Value: boolean);
begin
  if (bOldOS<>Value) then
  begin
    bOldOS := Value;
    RecreateWnd;
  end;//if
end;

procedure TEditAlign.SetWordWrap(const Value: boolean);
begin
  if (bWordWrap<>Value) then
  begin
    bWordWrap := Value;
    RecreateWnd;
  end;//if
end;


procedure TEditAlign.WMLButtonUp(var Message: TWMLButtonUp);
begin
  inherited;
  if bEnteringControlViaMouse and AutoSelect and
     AutoSelectOnMouseEnter and (SelLength<1) then
  begin
    SelectAll;
    bEnteringControlViaMouse := false;
  end;//if
end;

{ TDBEditAlign }

procedure TDBEditAlign.ActiveChange(Sender: TObject);
begin
  ResetMaxLength;
  if DataLink.Active then
    Alignment := DataLink.Field.Alignment
  else
    Alignment := taLeftJustify;
end;

procedure TDBEditAlign.CMEnter(var Message: TCMGotFocus);
begin
  if (csLButtonDown in ControlState) then
    bEnteringControlViaMouse := true;
  inherited;
end;

constructor TDBEditAlign.Create(aOwner: TComponent);
var
  GetDataLinkMsg: TMessage;
begin
  inherited;
  GetDataLinkMsg.Msg := CM_GETDATALINK;
  Dispatch(GetDataLinkMsg);
  integer(DataLink) := GetDataLinkMsg.Result;
  Assert(Assigned(DataLink));
  DataLink.OnActiveChange := ActiveChange;
end;

procedure TDBEditAlign.CreateParams(var Params: TCreateParams);
begin
  inherited;
  case Alignment of
    taLeftJustify:
      Params.Style := Params.Style or LongWord(ES_Left);
    taRightJustify:
      Params.Style := Params.Style or LongWord(ES_Right);
    else //taCenter
      Params.Style := Params.Style or LongWord(ES_Center);
  end;//case
end;

procedure TDBEditAlign.KeyPress(var Key: Char);
begin
  if (Key in [#32..#255]) and
     ( ( Assigned(DataLink.Field) and (not DataLink.Field.IsValidChar(Key)) ) or
       ReadOnly ) then
  begin
    MessageBeep(0);
    Key := #0;
  end;//if
  inherited;
end;

procedure TDBEditAlign.ResetMaxLength;
var
  TempField: TField;
begin
  if (MaxLength > 0) and Assigned(DataSource) and Assigned(DataSource.DataSet) then
  begin
    TempField := DataSource.DataSet.FindField(DataField);
    if Assigned(TempField) and (TempField.DataType in [ftString, ftWideString]) and
       (TempField.Size = MaxLength) then
      MaxLength := 0;
  end;
end;

procedure TDBEditAlign.SetAlignment(const Value: TAlignment);
begin
  if (FAlignment<>Value) then
  begin
    FAlignment := Value;
    RecreateWnd;
  end;//if
end;

procedure TDBEditAlign.WMLButtonUp(var Message: TWMLButtonUp);
begin
  inherited;
  if bEnteringControlViaMouse and AutoSelect and
     AutoSelectOnMouseEnter and (SelLength<1) then
  begin
    SelectAll;
    bEnteringControlViaMouse := false;
  end;//if
end;


end.

