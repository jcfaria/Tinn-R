(*
 Tinn is a ASCII file editor primarily intended as a better replacement
 of the default Notepad.exe under Windows.

 This software is distributed under the terms of the GNU General
 Public License, either Version 2, June 1991 or Version 3, June 2007.
 The terms of version 2 and of the license are in a folder called
 doc (licence_gpl2.txt and licence_gpl2.txt)
 which you should have received with this software.

 See http://www.opensource.org/licenses/gpl-license.html or
 http://www.fsf.org/copyleft/gpl.html for further information.

 Copyright
  Russell May - http://www.solarvoid.com

 Tinn-R is an extension of Tinn that provides additional tools to control R
 (http://cran.r-project.org). The project is coordened by José Cláudio Faria
 (joseclaudio.faria@gmail.com).

 As such, Tinn-R is a feature-rich replacement of the basic script editor
 provided with Rgui. It provides syntax-highlighting, submission of code in
 whole, or line-by-line, and many other useful tools to ease writting and
 debugging of R code.

 Copyright
  Tinn-R team - http://nbcgib.uesc.br/lec/software/editores/tinn-r/en

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 and 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

unit ufrmPrintPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  SynEditPrintPreview, ComCtrls, ToolWin, ExtCtrls, Menus, ActnList;

type
  TfrmPrintPreview = class(TForm)
    actZoomPageHeight: TAction;
    actZoomPageWidth: TAction;
    alPrintPreview: TActionList;
    ControlBar1: TControlBar;
    Pageheight1: TMenuItem;
    Pagewidth1: TMenuItem;
    panPage: TPanel;
    popZoom: TPopupMenu;
    synPP: TSynEditPrintPreview;
    tbClose: TToolButton;
    tbFirstPage: TToolButton;
    tbImpressionColored: TToolButton;
    tbImpressionFontDecrease: TToolButton;
    tbImpressionFontIncrease: TToolButton;
    tbLastPage: TToolButton;
    tbLineNumber: TToolButton;
    tbNextPage: TToolButton;
    tbPrint: TToolButton;
    tbPrintConfigure: TToolButton;
    tbPrintPreview: TToolBar;
    tbPriorPage: TToolButton;
    tbSyntaxColor: TToolButton;
    tbWordWrap: TToolButton;
    tbZoom: TToolButton;
    ToolButton1: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton9: TToolButton;
    udZoom: TUpDown;

    procedure actZoomPageHeightExecute(Sender: TObject);
    procedure actZoomPageWidthExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure popClose1Click(Sender: TObject);
    procedure synPPPreviewPage(Sender: TObject; PageNumber: Integer);
    procedure tbCloseClick(Sender: TObject);
    procedure tbFirstPageClick(Sender: TObject);
    procedure tbImpressionFontDecreaseClick(Sender: TObject);
    procedure tbImpressionFontIncreaseClick(Sender: TObject);
    procedure tbLastPageClick(Sender: TObject);
    procedure tbNextPageClick(Sender: TObject);
    procedure tbPriorPageClick(Sender: TObject);
    procedure udZoomMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintPreview: TfrmPrintPreview;

implementation
uses
  ufrmMain,
  ufrmEditor,
  ufrmConfigurePrint;

{$R *.DFM}

procedure TfrmPrintPreview.tbFirstPageClick(Sender: TObject);
begin
  synPP.FirstPage;
end;

procedure TfrmPrintPreview.tbNextPageClick(Sender: TObject);
begin
  synPP.PreviousPage;
end;

procedure TfrmPrintPreview.tbPriorPageClick(Sender: TObject);
begin
  synPP.NextPage;
end;

procedure TfrmPrintPreview.tbImpressionFontIncreaseClick(Sender: TObject);
begin
  with synPP do
    if (SynEditPrint.Font.Size < 20) then begin
      SynEditPrint.Font.Size:= SynEditPrint.Font.Size + 2;
      frmConfigurePrint.iFontSize:= SynEditPrint.Font.Size;
      UpdatePreview;
    end;
end;

procedure TfrmPrintPreview.tbImpressionFontDecreaseClick(Sender: TObject);
begin
  with synPP do
    if (SynEditPrint.Font.Size > 04) then begin
      SynEditPrint.Font.Size:= SynEditPrint.Font.Size - 2;
      frmConfigurePrint.iFontSize:= SynEditPrint.Font.Size;
      UpdatePreview;
    end;
end;

procedure TfrmPrintPreview.tbLastPageClick(Sender: TObject);
begin
  synPP.LastPage;
end;

procedure TfrmPrintPreview.synPPPreviewPage(Sender: TObject;
                                            PageNumber: Integer);
begin
  panPage.Caption:= IntToStr(PageNumber) +
                    '/' +
                    IntToStr(synPP.PageCount);
  synPP.PageBGColor:= frmTinnMain.clBGApplication;
end;

procedure TfrmPrintPreview.tbCloseClick(Sender: TObject);
begin
  frmTinnMain.iZoomPreview:= synPP.ScalePercent;
  case synPP.ScaleMode of
    pscPageWidth : frmTinnMain.iScaleMode:= 0;
    pscUserScaled: frmTinnMain.iScaleMode:= 1;
    pscWholePage : frmTinnMain.iScaleMode:= 2;
  end;
  Close;
end;

procedure TfrmPrintPreview.FormCreate(Sender: TObject);
begin
  case frmTinnMain.iScaleMode of
    0: begin  //pscPageWidth
         synPP.ScaleMode   := pscPageWidth;
         udZoom.Position   := 90;
         udZoom.Hint       := 'Zoom = Page width';
       end;
    1: begin  //pscUserScaled
         synPP.ScalePercent:= frmTinnMain.iZoomPreview;
         udZoom.Position   := synPP.ScalePercent;
         udZoom.Hint       := 'Zoom = ' +
                              IntToStr(synPP.ScalePercent) +
                              '%';

       end;
    2: begin  //pscWholePage
         synPP.ScaleMode   := pscWholePage;
         udZoom.Position   := 90;
         udZoom.Hint       := 'Zoom = Whole page';
       end;
  end;
end;

procedure TfrmPrintPreview.udZoomMouseDown(Sender: TObject;
                                           Button: TMouseButton;
                                           Shift: TShiftState;
                                           X,
                                           Y: Integer);
begin
  synPP.ScalePercent:= udZoom.Position;
  udZoom.Hint       := 'Zoom = ' +
                       IntToStr(synPP.ScalePercent) +
                       '%';
  synPP.Refresh;
end;

procedure TfrmPrintPreview.FormKeyDown(Sender: TObject;
                                       var Key: Word;
                                       Shift: TShiftState);
begin
  if (Shift = [ssCTRL]) then begin
    case Key of
      VK_PRIOR : synPP.FirstPage;
      VK_NEXT  : synPP.LastPage;
    end;
  end
  else begin
    case Key of
      VK_PRIOR: synPP.PreviousPage;
      VK_NEXT : synPP.NextPage;
      //Thanks to Jan Fiala (PSPad editor) for the tips below!
      VK_UP   : synPP.ScrollVertFor(20);
      VK_DOWN : synPP.ScrollVertFor(-20);
      VK_LEFT : synPP.ScrollHorzFor(20);
      VK_RIGHT: synPP.ScrollHorzFor(-20);
    end;
  end;
end;

procedure TfrmPrintPreview.FormShow(Sender: TObject);
begin
  frmPrintPreview.Width := frmTinnMain.Width;
  frmPrintPreview.Height:= frmTinnMain.Height;

  AlphaBlendValue:= frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmPrintPreview.popClose1Click(Sender: TObject);
begin
  tbCloseClick(nil);
end;

procedure TfrmPrintPreview.actZoomPageWidthExecute(Sender: TObject);
begin
  synPP.ScaleMode:= pscPageWidth;
  udZoom.Hint    := 'Zoom = Page width';
end;

procedure TfrmPrintPreview.actZoomPageHeightExecute(Sender: TObject);
begin
  synPP.ScaleMode:= pscWholePage;
  udZoom.Hint    := 'Zoom = Whole page';
end;

procedure TfrmPrintPreview.FormMouseWheelUp(Sender: TObject;
                                            Shift: TShiftState;
                                            MousePos: TPoint;
                                            var Handled: Boolean);
begin
 synPP.ScrollVertFor(20);
end;

procedure TfrmPrintPreview.FormMouseWheelDown(Sender: TObject;
                                              Shift: TShiftState;
                                              MousePos: TPoint;
                                              var Handled: Boolean);
begin
  synPP.ScrollVertFor(-20);
end;

end.
