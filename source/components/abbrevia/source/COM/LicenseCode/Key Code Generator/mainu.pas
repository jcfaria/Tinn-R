(* ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is TurboPower Abbrevia
 *
 * The Initial Developer of the Original Code is
 * TurboPower Software
 *
 * Portions created by the Initial Developer are Copyright (C) 1997-2002
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * ***** END LICENSE BLOCK ***** *)

unit mainu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, OvcBase, OvcEF, OvcPB, OvcPF, ppDB, ppDBJIT, ppPrnabl, ppClass,
  ppCtrls, ppBands, ppCache, ppComm, ppProd, ppReport, ppRelatv,
  ppModule, raCodMod, daDatMod, OvcDrCbx, OvcCmbx, OvcFlCbx, raClass,
  ExtCtrls, ppVar;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    OvcController1: TOvcController;
    EdtBeginSerial: TOvcPictureField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtEndSerial: TOvcPictureField;
    ppReport: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppJITPipeline1: TppJITPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppTitleBand1: TppTitleBand;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel1: TppLabel;
    ppLabel3: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel6: TppLabel;
    Bevel1: TBevel;
    Button2: TButton;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    procedure EdtBeginSerialChange(Sender: TObject);
    function ppJITPipeline1GetDataSetName: String;
    procedure FormCreate(Sender: TObject);
    function ppJITPipeline1CheckBOF: Boolean;
    procedure ppJITPipeline1CloseDataSet(Sender: TObject);
    function ppJITPipeline1CheckEOF: Boolean;
    function ppJITPipeline1GetBookmark: Integer;
    procedure ppJITPipeline1GotoFirstRecord(Sender: TObject);
    procedure ppJITPipeline1GotoLastRecord(Sender: TObject);
    procedure ppJITPipeline1OpenDataSet(Sender: TObject);
    procedure ppJITPipeline1TraverseBy(aIncrement: Integer);
    procedure Button1Click(Sender: TObject);
    function ppJITPipeline1GetFieldValue(aFieldName: String): Variant;
    procedure ppJITPipeline1GotoBookmark(aBookmark: Integer);
    procedure Button2Click(Sender: TObject);
    procedure ppDBText2GetText(Sender: TObject; var Text: String);
    procedure ppDBText1GetText(Sender: TObject; var Text: String);
    procedure ppReportPreviewFormCreate(Sender: TObject);
  private
    { Private declarations }
    NumLabelsToGenerate : longint;
    Counter : longint;
    CurrentItem : integer;
    currentKey : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ABGenLIC, ppViewr;

{$R *.DFM}

procedure TForm1.EdtBeginSerialChange(Sender: TObject);
begin
  EdtEndSerial.AsString := EdtBeginSerial.AsString;
end;

function TForm1.ppJITPipeline1GetDataSetName: String;
begin
  Result := 'AbbreviaCOMKey';
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CurrentItem := 0;
  edtBeginSerial.AsInteger := 1234567;
  edtEndSerial.AsInteger := 1234569;
end;

function TForm1.ppJITPipeline1CheckBOF: Boolean;
begin
  Result := (CurrentItem < edtBeginSerial.AsInteger);
end;

procedure TForm1.ppJITPipeline1CloseDataSet(Sender: TObject);
begin
  CurrentItem := 0;
end;

function TForm1.ppJITPipeline1CheckEOF: Boolean;
begin
  Result := (CurrentItem > edtEndSerial.AsInteger);
end;

function TForm1.ppJITPipeline1GetBookmark: Integer;
begin
  Result := CurrentItem;
end;

procedure TForm1.ppJITPipeline1GotoFirstRecord(Sender: TObject);
begin
  CurrentItem := edtBeginSerial.AsInteger;
end;

procedure TForm1.ppJITPipeline1GotoLastRecord(Sender: TObject);
begin
  CurrentItem := edtEndSerial.AsInteger;
end;

procedure TForm1.ppJITPipeline1OpenDataSet(Sender: TObject);
begin
  CurrentItem := edtBeginSerial.AsInteger
end;

procedure TForm1.ppJITPipeline1TraverseBy(aIncrement: Integer);
begin
  CurrentItem := CurrentItem + aIncrement;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  NumLabelsToGenerate := EdtEndSerial.AsInteger - EdtBeginSerial.AsInteger;
  if NumLabelsToGenerate < 0 then
    raise Exception.Create('End serial number greater than begin serial number.');
  Inc(NumLabelsToGenerate);

  ppReport.PrintReport;
end;

function TForm1.ppJITPipeline1GetFieldValue(aFieldName: String): Variant;
begin
  if aFieldName = 'Field2' then begin
    currentKey := GenerateHexString(IntToStr(CurrentItem));
    result := currentKey
  end else if aFieldName = 'Field1' then
    result := 'ABD' + IntToStr(CurrentItem);
end;

procedure TForm1.ppJITPipeline1GotoBookmark(aBookmark: Integer);
begin
  CurrentItem := aBookmark;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ppDBText2GetText(Sender: TObject; var Text: String);
begin
  pplabel8.Caption := ppLabel8.Caption + Text + ''');';
end;

procedure TForm1.ppDBText1GetText(Sender: TObject; var Text: String);
begin
  ppLabel8.Caption := 'ObjectName.License(''' + Text;
end;

procedure TForm1.ppReportPreviewFormCreate(Sender: TObject);
begin
  TppViewer(ppReport.PreviewForm.Viewer).ZoomSetting := zsPageWidth;
end;

end.
