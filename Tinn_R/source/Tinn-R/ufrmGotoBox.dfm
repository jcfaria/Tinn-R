object frmGotoBox: TfrmGotoBox
  Left = 477
  Top = 255
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Go to line number'
  ClientHeight = 80
  ClientWidth = 246
  Color = 16250871
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
    Left = 6
    Top = 1
    Width = 235
    Height = 45
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 20
      Width = 58
      Height = 13
      Caption = 'Line number'
    end
    object spLine: TJvSpinEdit
      Left = 77
      Top = 17
      Width = 151
      Height = 19
      CheckMinValue = True
      TabOrder = 0
    end
  end
  object BitBtn1: TBitBtn
    Left = 116
    Top = 51
    Width = 62
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 178
    Top = 51
    Width = 62
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
end
