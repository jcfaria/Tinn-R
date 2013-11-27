object frmRmirrors: TfrmRmirrors
  Left = 655
  Top = 78
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'R mirrors (xml based)'
  ClientHeight = 376
  ClientWidth = 614
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
    Top = 105
    Width = 614
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 10
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 614
      Height = 20
      DataSource = modDados.dsRmirrors
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
    Width = 614
    Height = 105
    Align = alTop
    Caption = ' Search / Edit Completion '
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
      Left = 203
      Top = 41
      Width = 31
      Height = 13
      Caption = 'Name:'
    end
    object Label3: TLabel
      Left = 26
      Top = 60
      Width = 25
      Height = 13
      Caption = 'Host:'
    end
    object Label1: TLabel
      Left = 197
      Top = 24
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
      Left = 12
      Top = 41
      Width = 39
      Height = 13
      Caption = 'Country:'
    end
    object Label5: TLabel
      Left = 14
      Top = 24
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
    object Label6: TLabel
      Left = 442
      Top = 40
      Width = 20
      Height = 13
      Caption = 'City:'
    end
    object Label7: TLabel
      Left = 425
      Top = 24
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
    object Label8: TLabel
      Left = 26
      Top = 78
      Width = 25
      Height = 13
      Caption = 'URL:'
    end
    object Label9: TLabel
      Left = 434
      Top = 76
      Width = 28
      Height = 13
      Caption = 'Code:'
    end
    object dbeName: TDBEdit
      Left = 238
      Top = 40
      Width = 173
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Name'
      DataSource = modDados.dsRmirrors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtNameSearch: TEdit
      Left = 238
      Top = 22
      Width = 173
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
      OnChange = edtNameSearchChange
    end
    object dbeCountry: TDBEdit
      Left = 56
      Top = 40
      Width = 120
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'Country'
      DataSource = modDados.dsRmirrors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object edtCountrySearch: TEdit
      Left = 56
      Top = 22
      Width = 120
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
      OnChange = edtCountrySearchChange
    end
    object dbeCity: TDBEdit
      Left = 466
      Top = 40
      Width = 118
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'City'
      DataSource = modDados.dsRmirrors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtCitySearch: TEdit
      Left = 466
      Top = 22
      Width = 118
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
      TabOrder = 2
      OnChange = edtCitySearchChange
    end
    object dbeHost: TDBEdit
      Left = 56
      Top = 58
      Width = 528
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'Host'
      DataSource = modDados.dsRmirrors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 6
    end
    object dbeURL: TDBEdit
      Left = 56
      Top = 76
      Width = 355
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'URL'
      DataSource = modDados.dsRmirrors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 7
    end
    object dbeCode: TDBEdit
      Left = 466
      Top = 76
      Width = 118
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Code'
      DataSource = modDados.dsRmirrors
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
  end
  object stbRmirrors: TStatusBar
    Left = 0
    Top = 357
    Width = 614
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object bbtRmirrorsNew: TBitBtn
    Left = 185
    Top = 325
    Width = 50
    Height = 27
    Caption = 'New'
    TabOrder = 3
    OnClick = bbtRmirrorsNewClick
  end
  object bbtRmirrorsDelete: TBitBtn
    Left = 235
    Top = 325
    Width = 50
    Height = 27
    Caption = 'Delete'
    TabOrder = 4
    OnClick = bbtRmirrorsDeleteClick
  end
  object bbtRmirrorsEdit: TBitBtn
    Left = 285
    Top = 325
    Width = 50
    Height = 27
    Caption = 'Edit'
    TabOrder = 5
    OnClick = bbtRmirrorsEditClick
  end
  object bbtRmirrorsCancel: TBitBtn
    Left = 335
    Top = 325
    Width = 85
    Height = 27
    Caption = 'Cancel current'
    TabOrder = 6
    OnClick = bbtRmirrorsCancelClick
  end
  object bbtRmirrorsSave: TBitBtn
    Left = 510
    Top = 325
    Width = 50
    Height = 27
    Caption = 'Save'
    TabOrder = 8
    OnClick = bbtRmirrorsSaveClick
  end
  object dbgRmirrors: TDBGrid
    Left = 0
    Top = 125
    Width = 614
    Height = 194
    Align = alTop
    BorderStyle = bsNone
    DataSource = modDados.dsRmirrors
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
    OnTitleClick = dbgRmirrorsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Width = 188
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'URL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Code'
        Visible = True
      end>
  end
  object bbtRmirrorsClose: TBitBtn
    Left = 560
    Top = 325
    Width = 50
    Height = 27
    Caption = 'Close'
    TabOrder = 9
    OnClick = bbtRmirrorsCloseClick
  end
  object bbtRmirrorsCancelAll: TBitBtn
    Left = 420
    Top = 325
    Width = 90
    Height = 27
    Caption = 'Cancel all'
    TabOrder = 7
    OnClick = bbtRmirrorsCancelAllClick
  end
  object bbtRmirrorsRestoreDefault: TBitBtn
    Left = 100
    Top = 325
    Width = 85
    Height = 27
    Caption = 'Restore default'
    TabOrder = 2
    OnClick = bbtRmirrorsRestoreDefaultClick
  end
end
