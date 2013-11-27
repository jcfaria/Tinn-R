object frmRCard: TfrmRCard
  Left = 634
  Top = 78
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'R card database (xml based)'
  ClientHeight = 387
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 118
    Width = 619
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 10
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 619
      Height = 20
      DataSource = modDados.dsRcard
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alClient
      Flat = True
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 619
    Height = 118
    Align = alTop
    Caption = ' Search / Edit function '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 278
      Top = 39
      Width = 44
      Height = 13
      Caption = 'Function:'
    end
    object Label3: TLabel
      Left = 8
      Top = 73
      Width = 56
      Height = 13
      Caption = 'Description:'
    end
    object Label1: TLabel
      Left = 285
      Top = 21
      Width = 37
      Height = 13
      Caption = 'Search:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 32
      Top = 39
      Width = 32
      Height = 13
      Caption = 'Group:'
    end
    object lblSearchGroup: TLabel
      Left = 27
      Top = 21
      Width = 37
      Height = 13
      Caption = 'Search:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object dbeRFunction: TDBEdit
      Left = 326
      Top = 37
      Width = 269
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Function'
      DataSource = modDados.dsRcard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object edtFunctionSearch: TEdit
      Left = 326
      Top = 19
      Width = 269
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = edtFunctionSearchChange
    end
    object dbeRGroup: TDBEdit
      Left = 69
      Top = 37
      Width = 196
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Group'
      DataSource = modDados.dsRcard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object dbmDescription: TDBMemo
      Left = 69
      Top = 55
      Width = 543
      Height = 53
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Description'
      DataSource = modDados.dsRcard
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 4
    end
    object edtGroupSearch: TEdit
      Left = 69
      Top = 19
      Width = 196
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edtGroupSearchChange
    end
  end
  object stbRCard: TStatusBar
    Left = 0
    Top = 368
    Width = 619
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object bbtRCardNew: TBitBtn
    Left = 195
    Top = 337
    Width = 50
    Height = 27
    Caption = 'New'
    TabOrder = 3
    OnClick = bbtRCardNewClick
  end
  object bbtRCardDelete: TBitBtn
    Left = 245
    Top = 337
    Width = 50
    Height = 27
    Caption = 'Delete'
    TabOrder = 4
    OnClick = bbtRCardDeleteClick
  end
  object bbtRCardEdit: TBitBtn
    Left = 295
    Top = 337
    Width = 50
    Height = 27
    Caption = 'Edit'
    TabOrder = 5
    OnClick = bbtRCardEditClick
  end
  object bbtRCardCancel: TBitBtn
    Left = 345
    Top = 337
    Width = 85
    Height = 27
    Caption = 'Cancel current'
    TabOrder = 6
    OnClick = bbtRCardCancelClick
  end
  object bbtRCardSave: TBitBtn
    Left = 515
    Top = 337
    Width = 50
    Height = 27
    Caption = 'Save'
    TabOrder = 8
    OnClick = bbtRCardSaveClick
  end
  object bbtRCardClose: TBitBtn
    Left = 565
    Top = 337
    Width = 50
    Height = 27
    Caption = 'Close'
    TabOrder = 9
    OnClick = bbtRCardCloseClick
  end
  object bbtRCardCancelAll: TBitBtn
    Left = 430
    Top = 337
    Width = 85
    Height = 27
    Caption = 'Cancel all'
    TabOrder = 7
    OnClick = bbtRCardCancelAllClick
  end
  object bbtRCardRestoreDefault: TBitBtn
    Left = 110
    Top = 337
    Width = 85
    Height = 27
    Caption = 'Restore default'
    TabOrder = 2
    OnClick = bbtRCardRestoreDefaultClick
  end
  object dbgRCard: TDBGrid
    Left = 0
    Top = 138
    Width = 619
    Height = 194
    Align = alTop
    BorderStyle = bsNone
    DataSource = modDados.dsRcard
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    OnTitleClick = dbgRCardTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Group'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Function'
        Width = 390
        Visible = True
      end>
  end
end
