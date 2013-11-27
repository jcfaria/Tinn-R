object frmGroupRename: TfrmGroupRename
  Left = 444
  Top = 293
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Group rename'
  ClientHeight = 99
  ClientWidth = 239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 41
    Width = 57
    Height = 13
    Caption = 'New name: '
  end
  object Label2: TLabel
    Left = 19
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Old name: '
  end
  object bbtOK: TBitBtn
    Left = 115
    Top = 64
    Width = 55
    Height = 25
    Hint = 'Rename selected group'
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    NumGlyphs = 2
  end
  object bbtCancel: TBitBtn
    Left = 170
    Top = 64
    Width = 55
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
    NumGlyphs = 2
  end
  object edtNewGroupName: TEdit
    Left = 74
    Top = 37
    Width = 151
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    TabOrder = 0
  end
  object edtOldGroupName: TEdit
    Left = 74
    Top = 12
    Width = 151
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderStyle = bsNone
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
end
