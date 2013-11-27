object frmShortcuts: TfrmShortcuts
  Left = 655
  Top = 78
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 
    'Shortcuts (xml based) - Select '#39'Shortcut'#39' and press '#39'ESC'#39' to cle' +
    'ar an assigned shortcut'
  ClientHeight = 395
  ClientWidth = 613
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
    Top = 104
    Width = 613
    Height = 20
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 10
    object DBNavigator1: TDBNavigator
      Left = 0
      Top = 0
      Width = 613
      Height = 20
      DataSource = modDados.dsShortcuts
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Align = alClient
      Flat = True
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      OnClick = DBNavigator1Click
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 613
    Height = 104
    Align = alTop
    Caption = ' Search / Edit Shortcuts '
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
      Left = 188
      Top = 41
      Width = 39
      Height = 13
      Caption = 'Caption:'
    end
    object Label3: TLabel
      Left = 25
      Top = 60
      Width = 22
      Height = 13
      Caption = 'Hint:'
    end
    object Label1: TLabel
      Left = 190
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
      Left = 15
      Top = 41
      Width = 32
      Height = 13
      Caption = 'Group:'
    end
    object Label5: TLabel
      Left = 10
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
      Left = 416
      Top = 40
      Width = 43
      Height = 13
      Caption = 'Shortcut:'
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
    object imgShortcut: TImage
      Left = 52
      Top = 79
      Width = 18
      Height = 19
      AutoSize = True
      Center = True
      Transparent = True
    end
    object Label8: TLabel
      Left = 15
      Top = 80
      Width = 32
      Height = 13
      Caption = 'Image:'
    end
    object dbeCaption: TDBEdit
      Left = 231
      Top = 40
      Width = 173
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Caption'
      DataSource = modDados.dsShortcuts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnEnter = dbeCaptionEnter
    end
    object edtCaptionSearch: TEdit
      Left = 231
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
      OnChange = edtCaptionSearchChange
      OnEnter = edtCaptionSearchEnter
    end
    object dbeGroup: TDBEdit
      Left = 52
      Top = 40
      Width = 120
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Ctl3D = False
      DataField = 'Group'
      DataSource = modDados.dsShortcuts
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      OnEnter = dbeGroupEnter
    end
    object dbmHint: TDBMemo
      Left = 52
      Top = 58
      Width = 551
      Height = 16
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      DataField = 'Hint'
      DataSource = modDados.dsShortcuts
      TabOrder = 6
      OnEnter = dbmHintEnter
    end
    object edtGroupSearch: TEdit
      Left = 52
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
      OnEnter = edtGroupSearchEnter
    end
    object jvhkShortcutSearch: TJvHotKey
      Left = 463
      Top = 19
      Width = 140
      Height = 19
      AutoSize = False
      HotKey = 0
      Modifiers = []
      TabOrder = 2
      OnChange = jvhkShortcutSearchChange
      OnEnter = jvhkShortcutSearchEnter
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      ParentColor = False
    end
    object jvhkShortcut: TJvHotKey
      Left = 463
      Top = 37
      Width = 140
      Height = 19
      HotKey = 0
      Modifiers = []
      TabOrder = 5
      OnEnter = jvhkShortcutEnter
      BevelEdges = []
      ParentColor = False
      OnKeyDown = jvhkShortcutKeyDown
      OnKeyUp = jvhkShortcutKeyUp
    end
  end
  object stbShortcuts: TStatusBar
    Left = 0
    Top = 376
    Width = 613
    Height = 19
    Panels = <
      item
        Width = 100
      end
      item
        Text = 'Default:'
        Width = 50
      end
      item
        Width = 100
      end
      item
        Width = 190
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object bbtShortcutsLoad: TBitBtn
    Left = 235
    Top = 339
    Width = 50
    Height = 27
    Caption = 'Load'
    TabOrder = 4
    OnClick = bbtShortcutsLoadClick
  end
  object bbtShortcutsSaveDefault: TBitBtn
    Left = 145
    Top = 339
    Width = 90
    Height = 27
    Caption = 'Save as default'
    TabOrder = 3
    OnClick = bbtShortcutsSaveDefaultClick
  end
  object bbtShortcutsEdit: TBitBtn
    Left = 285
    Top = 339
    Width = 50
    Height = 27
    Caption = 'Edit'
    TabOrder = 5
    OnClick = bbtShortcutsEditClick
  end
  object bbtShortcutsCancel: TBitBtn
    Left = 335
    Top = 339
    Width = 85
    Height = 27
    Caption = 'Cancel current'
    TabOrder = 6
    OnClick = bbtShortcutsCancelClick
  end
  object bbtShortcutsSave: TBitBtn
    Left = 509
    Top = 339
    Width = 50
    Height = 27
    Caption = 'Save'
    TabOrder = 8
    OnClick = bbtShortcutsSaveClick
  end
  object dbgShortcuts: TDBGrid
    Left = 0
    Top = 124
    Width = 613
    Height = 210
    Align = alTop
    BorderStyle = bsNone
    DataSource = modDados.dsShortcuts
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
    OnEnter = dbgShortcutsEnter
    OnKeyPress = dbgShortcutsKeyPress
    OnTitleClick = dbgShortcutsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Group'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Caption'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Shortcut'
        Title.Alignment = taRightJustify
        Width = 120
        Visible = True
      end>
  end
  object bbtShortcutsClose: TBitBtn
    Left = 559
    Top = 339
    Width = 50
    Height = 27
    Caption = 'Close'
    TabOrder = 9
    OnClick = bbtShortcutsCloseClick
  end
  object bbtShortcutsCancelAll: TBitBtn
    Left = 420
    Top = 339
    Width = 90
    Height = 27
    Caption = 'Cancel all'
    TabOrder = 7
    OnClick = bbtShortcutsCancelAllClick
  end
  object bbtShortcutsRestoreDefault: TBitBtn
    Left = 60
    Top = 339
    Width = 85
    Height = 27
    Caption = 'Restore default'
    TabOrder = 2
    OnClick = bbtShortcutsRestoreDefaultClick
  end
end
