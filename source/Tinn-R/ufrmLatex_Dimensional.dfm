object frmLatex_Dimensional: TfrmLatex_Dimensional
  Left = 593
  Top = 310
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Insert dimensional'
  ClientHeight = 190
  ClientWidth = 270
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
  object rdgType: TRadioGroup
    Left = 0
    Top = 0
    Width = 270
    Height = 55
    Align = alTop
    Caption = ' Type '
    Columns = 4
    Items.Strings = (
      'Array'
      'Matrix'
      'Tabular'
      'Tabbing')
    TabOrder = 0
    OnClick = rdgTypeClick
  end
  object gpbDimension: TGroupBox
    Left = 0
    Top = 105
    Width = 270
    Height = 52
    Align = alTop
    Caption = ' Dimension '
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 23
      Width = 30
      Height = 13
      Caption = 'Rows:'
    end
    object Label2: TLabel
      Left = 134
      Top = 23
      Width = 43
      Height = 13
      Caption = 'Columns:'
    end
    object edRows: TEdit
      Left = 46
      Top = 22
      Width = 40
      Height = 18
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
    end
    object edCols: TEdit
      Left = 182
      Top = 22
      Width = 40
      Height = 18
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 1
    end
  end
  object btnOK: TButton
    Left = 107
    Top = 160
    Width = 76
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object btnCancel: TButton
    Left = 183
    Top = 160
    Width = 83
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object rdgAlign: TRadioGroup
    Left = 0
    Top = 55
    Width = 270
    Height = 50
    Align = alTop
    Caption = ' Align '
    Columns = 3
    Items.Strings = (
      'Left'
      'Center'
      'Right')
    TabOrder = 1
  end
end
