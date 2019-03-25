object frmNewGroup: TfrmNewGroup
  Left = 365
  Top = 179
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'New group'
  ClientHeight = 73
  ClientWidth = 238
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
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 64
    Height = 13
    Caption = 'Group name: '
  end
  object bbtOK: TBitBtn
    Left = 118
    Top = 39
    Width = 55
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    NumGlyphs = 2
  end
  object bbtCancel: TBitBtn
    Left = 173
    Top = 39
    Width = 55
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object edtNewGroup: TEdit
    Left = 77
    Top = 12
    Width = 151
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
  end
end
