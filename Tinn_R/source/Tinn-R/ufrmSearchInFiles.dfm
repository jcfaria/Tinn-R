object frmSearchInFiles: TfrmSearchInFiles
  Left = 902
  Top = 173
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Search in files'
  ClientHeight = 249
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
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
    Left = 60
    Top = 9
    Width = 265
    Height = 21
    BevelInner = bvNone
    BevelOuter = bvNone
    ItemHeight = 13
    TabOrder = 0
  end
  object gbSearchOptions: TGroupBox
    Left = 8
    Top = 36
    Width = 154
    Height = 85
    Caption = ' Options '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object cbSearchCaseSensitive: TCheckBox
      Left = 8
      Top = 20
      Width = 140
      Height = 17
      Caption = 'Case sensitive'
      TabOrder = 0
    end
    object cbSearchWholeWords: TCheckBox
      Left = 8
      Top = 40
      Width = 140
      Height = 17
      Caption = 'Whole words only'
      TabOrder = 1
    end
    object cbRegularExpression: TCheckBox
      Left = 8
      Top = 60
      Width = 140
      Height = 17
      Caption = 'Regular expressions'
      TabOrder = 2
    end
  end
  object gbxWhere: TGroupBox
    Left = 168
    Top = 36
    Width = 157
    Height = 85
    Caption = ' Where '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object cbOpenFiles: TCheckBox
      Left = 8
      Top = 20
      Width = 143
      Height = 17
      Caption = 'Opened files'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object cbDirectories: TCheckBox
      Left = 8
      Top = 60
      Width = 142
      Height = 17
      Caption = 'Directories'
      TabOrder = 1
      OnClick = cbDirectoriesClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 124
    Width = 317
    Height = 89
    Caption = ' Directory options '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object lblDirectory: TLabel
      Left = 9
      Top = 24
      Width = 45
      Height = 13
      Caption = 'Directory:'
      Enabled = False
    end
    object lblFileMask: TLabel
      Left = 9
      Top = 48
      Width = 47
      Height = 13
      Caption = 'File mask:'
      Enabled = False
    end
    object sbtnDirectory: TSpeedButton
      Left = 284
      Top = 19
      Width = 23
      Height = 23
      Enabled = False
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
        8888880888800088888888088007B08000008808808777888888880880888888
        8888880800088888888888007F08000008888808777888888888880888888888
        8888880800088888888888007B08000008888808777888888888880888888888
        8888800088888888888807F08000008888888777888888888888}
      OnClick = sbtnDirectoryClick
    end
    object comboDirectories: TComboBox
      Left = 61
      Top = 20
      Width = 217
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Enabled = False
      ItemHeight = 13
      TabOrder = 0
    end
    object comboFileMasks: TComboBox
      Left = 61
      Top = 44
      Width = 217
      Height = 21
      BevelInner = bvNone
      BevelOuter = bvNone
      Enabled = False
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        '*.*')
    end
    object cbSubdirectories: TCheckBox
      Left = 61
      Top = 68
      Width = 137
      Height = 17
      Caption = 'Search in sub directories'
      Enabled = False
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn
    Left = 175
    Top = 219
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 250
    Top = 219
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
    NumGlyphs = 2
  end
  object JvBrowseForFolder: TJvBrowseForFolderDialog
    Left = 24
    Top = 216
  end
end
