object frmCompletion: TfrmCompletion
  Left = 655
  Top = 78
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Completion (xml based)'
  ClientHeight = 379
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
    Top = 173
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
      DataSource = modDados.dsCompletion
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
    Height = 173
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
      Left = 190
      Top = 41
      Width = 44
      Height = 13
      Caption = 'Function:'
    end
    object Label3: TLabel
      Left = 7
      Top = 73
      Width = 44
      Height = 13
      Caption = 'Complet.:'
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
      Left = 19
      Top = 41
      Width = 32
      Height = 13
      Caption = 'Group:'
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
      Left = 426
      Top = 40
      Width = 36
      Height = 13
      Caption = 'Trigger:'
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
    object dbeFunction: TDBEdit
      Left = 238
      Top = 40
      Width = 173
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Function'
      DataSource = modDados.dsCompletion
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object edtFunctionSearch: TEdit
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
      OnChange = edtFunctionSearchChange
    end
    object dbeGroup: TDBEdit
      Left = 56
      Top = 40
      Width = 120
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'Group'
      DataSource = modDados.dsCompletion
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
    end
    object dbmCompletion: TDBMemo
      Left = 56
      Top = 58
      Width = 546
      Height = 105
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Completion'
      DataSource = modDados.dsCompletion
      ScrollBars = ssVertical
      TabOrder = 6
    end
    object edtGroupSearch: TEdit
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
      OnChange = edtGroupSearchChange
    end
    object dbeTrigger: TDBEdit
      Left = 466
      Top = 40
      Width = 118
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Trigger'
      DataSource = modDados.dsCompletion
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object edtFunctionTrigger: TEdit
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
      OnChange = edtFunctionTriggerChange
    end
  end
  object stbCompletion: TStatusBar
    Left = 0
    Top = 360
    Width = 614
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object bbtCompletionNew: TBitBtn
    Left = 185
    Top = 328
    Width = 50
    Height = 27
    Caption = 'New'
    TabOrder = 3
    OnClick = bbtCompletionNewClick
  end
  object bbtCompletionDelete: TBitBtn
    Left = 235
    Top = 328
    Width = 50
    Height = 27
    Caption = 'Delete'
    TabOrder = 4
    OnClick = bbtCompletionDeleteClick
  end
  object bbtCompletionEdit: TBitBtn
    Left = 285
    Top = 328
    Width = 50
    Height = 27
    Caption = 'Edit'
    TabOrder = 5
    OnClick = bbtCompletionEditClick
  end
  object bbtCompletionCancel: TBitBtn
    Left = 335
    Top = 328
    Width = 85
    Height = 27
    Caption = 'Cancel current'
    TabOrder = 6
    OnClick = bbtCompletionCancelClick
  end
  object bbtCompletionSave: TBitBtn
    Left = 510
    Top = 328
    Width = 50
    Height = 27
    Caption = 'Save'
    TabOrder = 8
    OnClick = bbtCompletionSaveClick
  end
  object dbgCompletion: TDBGrid
    Left = 0
    Top = 193
    Width = 614
    Height = 129
    Align = alTop
    BorderStyle = bsNone
    DataSource = modDados.dsCompletion
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
    OnTitleClick = dbgCompletionTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Group'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Function'
        Width = 420
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Trigger'
        Width = 50
        Visible = True
      end>
  end
  object bbtCompletionClose: TBitBtn
    Left = 560
    Top = 328
    Width = 50
    Height = 27
    Caption = 'Close'
    TabOrder = 9
    OnClick = bbtCompletionCloseClick
  end
  object bbtCompletionCancelAll: TBitBtn
    Left = 420
    Top = 328
    Width = 90
    Height = 27
    Caption = 'Cancel all'
    TabOrder = 7
    OnClick = bbtCompletionCancelAllClick
  end
  object bbtCompletionRestoreDefault: TBitBtn
    Left = 100
    Top = 328
    Width = 85
    Height = 27
    Caption = 'Restore default'
    TabOrder = 2
    OnClick = bbtCompletionRestoreDefaultClick
  end
end
