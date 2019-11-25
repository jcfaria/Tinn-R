object frmSearch_Dlg: TfrmSearch_Dlg
  Left = 448
  Top = 458
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Find'
  ClientHeight = 159
  ClientWidth = 431
  Color = 16250871
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 19
    Top = 12
    Width = 38
    Height = 13
    Caption = 'Find for:'
  end
  object cbSearchText: TComboBox
    Left = 80
    Top = 8
    Width = 344
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    ItemHeight = 0
    ParentCtl3D = False
    TabOrder = 0
  end
  object gbSearchOptions: TGroupBox
    Left = 8
    Top = 33
    Width = 127
    Height = 89
    Caption = ' Options '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object cbSearchCaseSensitive: TCheckBox
      Left = 8
      Top = 17
      Width = 93
      Height = 17
      Caption = 'Case sensitive'
      TabOrder = 0
    end
    object cbSearchWholeWords: TCheckBox
      Left = 8
      Top = 39
      Width = 110
      Height = 17
      Caption = 'Whole words only'
      TabOrder = 1
    end
    object cbRegularExpression: TCheckBox
      Left = 8
      Top = 63
      Width = 114
      Height = 17
      Caption = 'Regular expression'
      TabOrder = 2
    end
  end
  object rgSearchDirection: TRadioGroup
    Left = 139
    Top = 33
    Width = 98
    Height = 89
    Caption = ' Direction '
    Ctl3D = False
    ItemIndex = 0
    Items.Strings = (
      'Forward'
      'Backward')
    ParentCtl3D = False
    TabOrder = 2
  end
  object btnOK: TButton
    Left = 264
    Top = 128
    Width = 76
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 5
  end
  object btnCancel: TButton
    Left = 341
    Top = 128
    Width = 83
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object rgSearchScope: TRadioGroup
    Left = 241
    Top = 33
    Width = 83
    Height = 89
    Caption = ' Scope '
    Ctl3D = False
    ItemIndex = 0
    Items.Strings = (
      'Global'
      'Selected')
    ParentCtl3D = False
    TabOrder = 3
    OnClick = rgSearchScopeClick
  end
  object rgSearchOrigin: TRadioGroup
    Left = 328
    Top = 33
    Width = 96
    Height = 89
    Caption = ' Origin '
    Ctl3D = False
    ItemIndex = 0
    Items.Strings = (
      'Global'
      'From cursor')
    ParentCtl3D = False
    TabOrder = 4
  end
end
