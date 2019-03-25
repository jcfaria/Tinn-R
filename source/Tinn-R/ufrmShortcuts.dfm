object frmShortcuts: TfrmShortcuts
  Left = 655
  Top = 78
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 
    'Shortcuts                                                       ' +
    '                            (Press ESC in the selected SHORTCUT ' +
    'to clear an assigned)'
  ClientHeight = 395
  ClientWidth = 613
  Color = 16250871
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
    Color = 16250871
    ParentBackground = False
    TabOrder = 10
    object JvDBNavigator2: TJvDBNavigator
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
      Color = 16250871
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
      Color = 16250871
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
      Color = 16250871
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
    Color = 16250871
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
    Left = 262
    Top = 339
    Width = 50
    Height = 27
    Caption = 'Load'
    TabOrder = 4
    OnClick = bbtShortcutsLoadClick
  end
  object bbtShortcutsSaveDefault: TBitBtn
    Left = 172
    Top = 339
    Width = 90
    Height = 27
    Caption = 'Save as default'
    TabOrder = 3
    OnClick = bbtShortcutsSaveDefaultClick
  end
  object bbtShortcutsEdit: TBitBtn
    Left = 312
    Top = 339
    Width = 50
    Height = 27
    Caption = 'Edit'
    TabOrder = 5
    OnClick = bbtShortcutsEditClick
  end
  object bbtShortcutsCancel: TBitBtn
    Left = 362
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
    Left = 447
    Top = 339
    Width = 61
    Height = 27
    Caption = 'Cancel all'
    TabOrder = 7
    OnClick = bbtShortcutsCancelAllClick
  end
  object bbtShortcutsRestoreDefault: TBitBtn
    Left = 87
    Top = 339
    Width = 85
    Height = 27
    Caption = 'Restore default'
    TabOrder = 2
    OnClick = bbtShortcutsRestoreDefaultClick
  end
  object bbHelp: TBitBtn
    Left = 12
    Top = 339
    Width = 75
    Height = 27
    Caption = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = bbHelpClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0088A7BB0048505500444545003F4141003F47
      4A007D9CB100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF005F6E7700BCBCBB00EBEAEA00CDCCCC00A3A1
      9F003F4C5500FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF0068777D00A6A5A200A8A2A2009D999800948F
      8B00434B5300FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF0085A7BF00638195007A95A3003A8A9800357F8C00606E
      76002D4357007FA2BE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF0075B9EA0061A7DE00469DE6004BBEF70047E6FD0041E5FD0051C3
      FB00167CDE003382D10066AAE300FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF0078BDEB005CACE700A6D3F30065AEF00074E1F60073E1F60072E0F60071E0
      F6004CA3EC009CC3EF00297FD60065A8E200FF00FF00FF00FF00FF00FF0080C6
      F00068B5E900A5D4F300DCFAFE0038A1EB0074E1F6006AE4F6005DE2F50072E0
      F6001691E800C0F5FD00ACCEF1002780D6006FAEE400FF00FF00FF00FF0078C0
      EC008BC8EF00ECFCFE0077E1F7002F99EA0075E1F60074E1F60068DEF50073E1
      F6000986E60046D5F300DCFEFE006FAAE5004C99DE00FF00FF00FF00FF006FBE
      EC00C9E9F900D4F9FD007CE3F70086E5F80060B1EF0068B5EF0063B4EF004CA6
      EC0082E4F70059DCF5008AEBFA00CBE2F700338BD900FF00FF00FF00FF007BC5
      EE00DFF6FD00C8F5FC00CDF6FC00D6F7FD00D3F4FC00CFF2FC00CAF1FB00C4F0
      FC00BAF2FB0096EAF80072E5F700E2F4FD003189D800FF00FF00FF00FF0088CD
      F100D2EFFB00DBF9FE00DFF9FD00ECFBFE00EEFCFE00EFFCFE00EFFCFE00EBFB
      FE00E0F9FE00B8F1FB00A8F1FB00CBE5F8003892DC00FF00FF00FF00FF0098D6
      F400B4E3F800E5FAFE00DBF8FD00E4FAFE00F0FCFE00F9FEFF00F9FEFF00EFFC
      FE00D2F6FD00B4F1FB00EDFDFF006BB3EA0058A9E400FF00FF00FF00FF00B2E1
      F500A2DBF400C3EBFA00E2F9FD00E0F9FD00D5F7FD00CFF6FD00C9F4FC00C7F4
      FC00D6F9FD00EBFAFE0090CAF20043A2E40078BEE900FF00FF00FF00FF00FF00
      FF00AFE0F600ADDEF600B7E4F800C7ECFB00D7F3FC00E1F7FD00E2F8FE00D8F0
      FC00B6DFF8006BBBED0056AFE80077BEEC00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00B0E2F500A7DCF5009DD9F50091D1F10082CBF00076C4
      EF006DBFED0077C3EE00FF00FF00FF00FF00FF00FF00FF00FF00}
  end
end
