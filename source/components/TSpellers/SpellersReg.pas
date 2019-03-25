unit SpellersReg;

interface

uses
{$IFDEF VER130} { Borland Delphi 5.x }
  DsgnIntf;
{$ELSE}
  DesignIntf, DesignEditors;
{$ENDIF}

procedure Register;

implementation

uses
  Dialogs, Windows, Forms, Classes, SysUtils, Spellers, Langs, LangsReg;

type
  TDictFileProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure TDictFileProperty.Edit;
var
  FileOpen: TOpenDialog;
begin
  FileOpen := TOpenDialog.Create(Application);
  FileOpen.Filename := GetValue;
  FileOpen.Filter := 'Dictionary files (*.dic)|*.dic|All files (*.*)|*.*';
  FileOpen.Options := FileOpen.Options + [ofShowHelp, ofPathMustExist,
    ofFileMustExist];
  try
    if FileOpen.Execute then SetValue(FileOpen.Filename);
  finally
    FileOpen.Free;
  end;
end;

function TDictFileProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;

procedure Register;
begin
  RegisterComponents('LS', [TSpellChecker]);
  RegisterPropertyEditor(TypeInfo(TFileName), TSpellChecker, 'CustomDict', TDictFileProperty);
end;

end.
