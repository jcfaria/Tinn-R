object frmCount: TfrmCount
  Left = 506
  Top = 218
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Count'
  ClientHeight = 169
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 273
    Height = 88
    Align = alTop
    Caption = ' Result '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object strGrid: TStringGrid
      Left = 1
      Top = 14
      Width = 271
      Height = 73
      Align = alClient
      BorderStyle = bsNone
      ColCount = 2
      Ctl3D = False
      DefaultColWidth = 135
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 4
      FixedRows = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [goDrawFocusSelected, goRowSelect]
      ParentCtl3D = False
      ParentFont = False
      ScrollBars = ssNone
      TabOrder = 0
      OnDrawCell = strGridDrawCell
    end
  end
  object rdgCount: TRadioGroup
    Left = 0
    Top = 88
    Width = 273
    Height = 48
    Align = alTop
    Caption = ' More '
    Columns = 2
    Ctl3D = False
    Enabled = False
    Items.Strings = (
      'File'
      'Selection')
    ParentCtl3D = False
    TabOrder = 2
  end
  object bbtOK: TBitBtn
    Left = 197
    Top = 140
    Width = 70
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    NumGlyphs = 2
  end
end
