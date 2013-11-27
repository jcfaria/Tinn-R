object frmComments: TfrmComments
  Left = 655
  Top = 78
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Comments (xml based)'
  ClientHeight = 376
  ClientWidth = 529
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
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 529
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 8
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 529
      Height = 20
      DataSource = modDados.dsComments
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
    Width = 529
    Height = 73
    Align = alTop
    Caption = ' Search / Edit Comments '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 25
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
    object Label2: TLabel
      Left = 11
      Top = 41
      Width = 51
      Height = 13
      Caption = 'Language:'
    end
    object Label3: TLabel
      Left = 199
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
      Left = 213
      Top = 41
      Width = 23
      Height = 13
      Caption = 'Line:'
    end
    object Label5: TLabel
      Left = 309
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
      Left = 316
      Top = 41
      Width = 30
      Height = 13
      Caption = 'Begin:'
    end
    object Label7: TLabel
      Left = 422
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
      Left = 437
      Top = 41
      Width = 22
      Height = 13
      Caption = 'End:'
    end
    object dbeLine: TDBEdit
      Left = 242
      Top = 40
      Width = 48
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Line'
      DataSource = modDados.dsComments
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtLineSearch: TEdit
      Left = 242
      Top = 22
      Width = 48
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
      OnChange = edtLineSearchChange
    end
    object dbeLanguage: TDBEdit
      Left = 67
      Top = 40
      Width = 120
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'Language'
      DataSource = modDados.dsComments
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
    end
    object edtLanguageSearch: TEdit
      Left = 67
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
      OnChange = edtLanguageSearchChange
    end
    object dbeBegin: TDBEdit
      Left = 352
      Top = 40
      Width = 50
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Begin'
      DataSource = modDados.dsComments
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edtBegin: TEdit
      Left = 352
      Top = 22
      Width = 50
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
      OnChange = edtBeginChange
    end
    object dbeEnd: TDBEdit
      Left = 465
      Top = 40
      Width = 50
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'End'
      DataSource = modDados.dsComments
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
    end
    object edtEnd: TEdit
      Left = 465
      Top = 22
      Width = 50
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
      TabOrder = 3
      OnChange = edtBeginChange
    end
  end
  object stbComments: TStatusBar
    Left = 0
    Top = 357
    Width = 529
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object bbtCommentsEdit: TBitBtn
    Left = 200
    Top = 326
    Width = 50
    Height = 27
    Caption = 'Edit'
    TabOrder = 3
    OnClick = bbtCommentsEditClick
  end
  object bbtCommentsCancel: TBitBtn
    Left = 250
    Top = 326
    Width = 85
    Height = 27
    Caption = 'Cancel current'
    TabOrder = 4
    OnClick = bbtCommentsCancelClick
  end
  object bbtCommentsSave: TBitBtn
    Left = 425
    Top = 326
    Width = 50
    Height = 27
    Caption = 'Save'
    TabOrder = 6
    OnClick = bbtCommentsSaveClick
  end
  object dbgComments: TDBGrid
    Left = 0
    Top = 93
    Width = 529
    Height = 227
    Align = alTop
    BorderStyle = bsNone
    DataSource = modDados.dsComments
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
    OnTitleClick = dbgCommentsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Language'
        Width = 380
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Line'
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Begin'
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'End'
        Title.Alignment = taCenter
        Width = 40
        Visible = True
      end>
  end
  object bbtCommentsClose: TBitBtn
    Left = 475
    Top = 326
    Width = 50
    Height = 27
    Caption = 'Close'
    TabOrder = 7
    OnClick = bbtCommentsCloseClick
  end
  object bbtCommentsCancelAll: TBitBtn
    Left = 335
    Top = 326
    Width = 90
    Height = 27
    Caption = 'Cancel all'
    TabOrder = 5
    OnClick = bbtCommentsCancelAllClick
  end
  object bbtCommentsRestoreDefault: TBitBtn
    Left = 115
    Top = 326
    Width = 85
    Height = 27
    Caption = 'Restore default'
    TabOrder = 2
    OnClick = bbtCommentsRestoreDefaultClick
  end
end
