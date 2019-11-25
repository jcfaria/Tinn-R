object frmPrint_Configure: TfrmPrint_Configure
  Left = 380
  Top = 186
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  ClientHeight = 141
  ClientWidth = 476
  Color = 16250871
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 7
    Width = 143
    Height = 97
    Caption = ' Include '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object chkFileName: TCheckBox
      Left = 8
      Top = 24
      Width = 70
      Height = 17
      Action = actFileName
      TabOrder = 0
    end
    object chkPageNumber: TCheckBox
      Left = 8
      Top = 48
      Width = 86
      Height = 17
      Action = actPageNumber
      TabOrder = 1
    end
    object chkLineNumber: TCheckBox
      Left = 8
      Top = 72
      Width = 82
      Height = 17
      Action = actLineNumber
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 152
    Top = 7
    Width = 152
    Height = 97
    Caption = ' Options '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object chkWordWrap: TCheckBox
      Left = 8
      Top = 24
      Width = 84
      Height = 17
      Action = actLineWrap
      TabOrder = 0
    end
    object chkColors: TCheckBox
      Left = 8
      Top = 72
      Width = 117
      Height = 17
      Action = actImpressionColored
      TabOrder = 2
    end
    object chkSyntaxColor: TCheckBox
      Left = 8
      Top = 48
      Width = 108
      Height = 17
      Action = actSyntaxColor
      TabOrder = 1
    end
  end
  object bbtPrintConfig: TBitBtn
    Left = 67
    Top = 109
    Width = 101
    Height = 25
    Action = actPrintConfig
    Caption = 'Printer settings'
    TabOrder = 0
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000FFFFFF00CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object bbtPrint: TBitBtn
    Left = 269
    Top = 109
    Width = 101
    Height = 25
    Action = actPrint
    Caption = 'Print'
    TabOrder = 2
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00ABABAB00ABABAB00ABABAB00ABABAB00ABAB
      AB00ABABAB00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00ABABAB00ABABAB00ABABAB00ABABAB00ABAB
      AB00ABABAB00FF00FF006D6D6D00FF00FF00FF00FF00FF00FF00CE4D5000CE4D
      5000CE4D50006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000ABABAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00ABABAB00CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000FFFFFF00CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D
      5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000CE4D5000FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D6D006D6D
      6D006D6D6D006D6D6D006D6D6D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
  object bbtClose: TBitBtn
    Left = 370
    Top = 109
    Width = 101
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = bbtCloseClick
  end
  object GroupBox3: TGroupBox
    Left = 308
    Top = 7
    Width = 163
    Height = 97
    Caption = ' Range '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label1: TLabel
      Left = 9
      Top = 74
      Width = 28
      Height = 13
      Caption = 'Start:'
    end
    object Label2: TLabel
      Left = 90
      Top = 74
      Width = 22
      Height = 13
      Caption = 'End:'
    end
    object rbAll: TRadioButton
      Left = 7
      Top = 24
      Width = 34
      Height = 17
      Caption = 'All'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbSelection: TRadioButton
      Left = 8
      Top = 48
      Width = 66
      Height = 17
      Caption = 'Selection'
      TabOrder = 1
    end
    object edStartPage: TEdit
      Left = 39
      Top = 71
      Width = 41
      Height = 19
      TabOrder = 2
      OnKeyPress = edStartPageKeyPress
    end
    object edEndPage: TEdit
      Left = 114
      Top = 71
      Width = 41
      Height = 19
      TabOrder = 3
      OnKeyPress = edEndPageKeyPress
    end
  end
  object bbtPreview: TBitBtn
    Left = 168
    Top = 109
    Width = 101
    Height = 25
    Caption = 'Preview'
    TabOrder = 1
    OnClick = bbtPreviewClick
  end
  object acConfigurePrint: TActionList
    Images = frmMain.imlTinnR
    Left = 6
    Top = 106
    object actFileName: TAction
      Caption = 'File name'
      OnExecute = actFileNameExecute
    end
    object actPageNumber: TAction
      Caption = 'Page number'
      OnExecute = actPageNumberExecute
    end
    object actLineNumber: TAction
      Caption = 'Line number'
      Hint = 'Line number'
      ImageIndex = 100
      OnExecute = actLineNumberExecute
    end
    object actLineWrap: TAction
      Caption = 'Line wrap'
      Hint = 'Line wrap'
      ImageIndex = 101
      OnExecute = actLineWrapExecute
    end
    object actSyntaxColor: TAction
      Caption = 'Syntax color'
      Hint = 'Syntax color'
      ImageIndex = 163
      OnExecute = actSyntaxColorExecute
    end
    object actImpressionColored: TAction
      Caption = 'Impression colored'
      Hint = 'Impression colored'
      ImageIndex = 165
      OnExecute = actImpressionColoredExecute
    end
    object actPrintConfig: TAction
      Caption = 'Printer settings'
      Hint = 'Printer settings'
      ImageIndex = 152
      OnExecute = actPrintConfigExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      Hint = 'Print'
      ImageIndex = 153
      OnExecute = actPrintExecute
    end
  end
end
