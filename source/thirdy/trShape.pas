unit trShape;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

type
  TtrShape = class(TShape)
  private
    { Private declarations }
  protected
    { Protected declarations }
    procedure Paint; override;
    procedure CMFontChanged(var Msg: TMessage); message CM_FONTCHANGED;
    procedure CMTextChanged(var Msg: TMessage); message CM_TEXTCHANGED;
  public
    { Public declarations }
  published
    { Published declarations }
    property Caption;
    property Font;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TtrShape]);
end;

{ Ttrhape }

procedure TtrShape.CMFontChanged(var Msg: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TtrShape.CMTextChanged(var Msg: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TtrShape.Paint;
var
  R: TRect;
begin
  inherited;
  Canvas.Font.Assign(Font);
  R := ClientRect;
  DrawText(Canvas.Handle,
           PChar(Caption),
           -1,
           R,
           DT_VCENTER or DT_CENTER or DT_SINGLELINE);
end;

end.