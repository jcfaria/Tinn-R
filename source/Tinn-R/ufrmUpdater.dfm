object frmUpdater: TfrmUpdater
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Tinn-R updater'
  ClientHeight = 371
  ClientWidth = 494
  Color = clBtnFace
  Constraints.MaxHeight = 400
  Constraints.MaxWidth = 500
  Constraints.MinHeight = 400
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object im2: TImage
    Left = 0
    Top = 351
    Width = 500
    Height = 10
  end
  object im1: TImage
    Left = 0
    Top = 0
    Width = 97
    Height = 361
  end
  object lInfo: TLabel
    Left = 147
    Top = 9
    Width = 12
    Height = 17
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Liberation Sans'
    Font.Style = []
    ParentFont = False
  end
  object lStatus: TLabel
    Left = 115
    Top = 243
    Width = 99
    Height = 15
    Caption = 'Loading download'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Liberation Sans Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lWhatIsNew: TLabel
    Left = 147
    Top = 207
    Width = 86
    Height = 15
    Cursor = crHandPoint
    Caption = 'What is new?'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Liberation Sans'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = lWhatIsNewClick
  end
  object lBytes: TLabel
    Left = 269
    Top = 293
    Width = 30
    Height = 14
    Caption = '..........'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Liberation Sans'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btCancel: TButton
    Left = 376
    Top = 320
    Width = 100
    Height = 25
    Caption = 'Cancel'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Liberation Sans Narrow'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 0
  end
  object pbDownload: TProgressBar
    Left = 115
    Top = 260
    Width = 350
    Height = 25
    TabOrder = 1
  end
  object btDownload: TButton
    Left = 276
    Top = 320
    Width = 100
    Height = 25
    Caption = 'Download'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Liberation Sans Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btDownloadClick
  end
  object btInstall: TButton
    Left = 376
    Top = 320
    Width = 100
    Height = 25
    Caption = 'Install'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Liberation Sans Narrow'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btInstallClick
  end
  object GroupBox1: TGroupBox
    Left = 147
    Top = 66
    Width = 193
    Height = 122
    Caption = ' Versions (info) '
    TabOrder = 4
    object Label1: TLabel
      Left = 19
      Top = 33
      Width = 44
      Height = 13
      Caption = 'Current: '
    end
    object Label2: TLabel
      Left = 14
      Top = 62
      Width = 47
      Height = 13
      Caption = 'Available:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 13
      Top = 91
      Width = 48
      Height = 13
      Caption = 'Released:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object edCurrent: TEdit
      Left = 65
      Top = 30
      Width = 108
      Height = 19
      Ctl3D = False
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 0
    end
    object edAvailable: TEdit
      Left = 65
      Top = 59
      Width = 108
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object edDate: TEdit
      Left = 65
      Top = 88
      Width = 108
      Height = 19
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object JvBrowseForFolder: TJvBrowseForFolderDialog
    Left = 112
    Top = 312
  end
end
