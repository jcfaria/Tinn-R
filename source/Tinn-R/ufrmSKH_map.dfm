object frmSKH_Map_Dlg: TfrmSKH_Map_Dlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'S/K/H map'
  ClientHeight = 557
  ClientWidth = 623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblCustom: TLabel
    Left = 8
    Top = 512
    Width = 236
    Height = 13
    Caption = '* Use %s to word/selection and %f for whole file'
    Visible = False
  end
  object bbHelp: TBitBtn
    Left = 319
    Top = 507
    Width = 75
    Height = 25
    Caption = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
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
  object bbtOK: TBitBtn
    Left = 469
    Top = 507
    Width = 75
    Height = 25
    Caption = 'O&K'
    ModalResult = 1
    TabOrder = 1
    NumGlyphs = 2
  end
  object pgSKH: TJvgPageControl
    Left = 0
    Top = 0
    Width = 623
    Height = 502
    ActivePage = tbsRHotkeys
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Style = tsFlatButtons
    TabOrder = 3
    TabStop = False
    OnChange = pgSKHChange
    TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabStyle.BevelInner = bvNone
    TabStyle.BevelOuter = bvNone
    TabStyle.Bold = False
    TabStyle.BackgrColor = clBtnFace
    TabStyle.Font.Charset = DEFAULT_CHARSET
    TabStyle.Font.Color = clWindowText
    TabStyle.Font.Height = -11
    TabStyle.Font.Name = 'Arial'
    TabStyle.Font.Style = []
    TabStyle.CaptionHAlign = fhaCenter
    TabStyle.Gradient.Active = False
    TabStyle.Gradient.Orientation = fgdHorizontal
    TabSelectedStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabSelectedStyle.BevelInner = bvNone
    TabSelectedStyle.BevelOuter = bvNone
    TabSelectedStyle.Bold = False
    TabSelectedStyle.BackgrColor = clBtnFace
    TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
    TabSelectedStyle.Font.Color = clWindowText
    TabSelectedStyle.Font.Height = -11
    TabSelectedStyle.Font.Name = 'Arial'
    TabSelectedStyle.Font.Style = []
    TabSelectedStyle.CaptionHAlign = fhaCenter
    TabSelectedStyle.Gradient.Active = False
    TabSelectedStyle.Gradient.Orientation = fgdHorizontal
    Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
    object tbsAppShortcuts: TTabSheet
      Caption = ' Shortcuts (aplication)'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 123
        Width = 615
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        Color = 16250871
        ParentBackground = False
        TabOrder = 2
        object JvDBNavigator2: TJvDBNavigator
          Left = 0
          Top = 0
          Width = 615
          Height = 23
          DataSource = modDados.dsApp_Shortcuts
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Align = alClient
          Flat = True
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
        end
      end
      object gbKeystrokes: TGroupBox
        Left = 0
        Top = 0
        Width = 615
        Height = 123
        Align = alTop
        Caption = ' Search/Edit '
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
          Left = 252
          Top = 59
          Width = 39
          Height = 13
          Caption = 'Caption:'
        end
        object Label3: TLabel
          Left = 25
          Top = 78
          Width = 22
          Height = 13
          Caption = 'Hint:'
        end
        object Label4: TLabel
          Left = 15
          Top = 59
          Width = 32
          Height = 13
          Caption = 'Group:'
        end
        object Label5: TLabel
          Left = 10
          Top = 42
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
          Top = 97
          Width = 18
          Height = 19
          AutoSize = True
          Center = True
          Transparent = True
        end
        object Label1: TLabel
          Left = 22
          Top = 24
          Width = 25
          Height = 13
          Caption = 'Filter:'
          Color = 16250871
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object dbeApp_Caption: TDBEdit
          Left = 295
          Top = 58
          Width = 304
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          DataField = 'Caption'
          DataSource = modDados.dsApp_Shortcuts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object edApp_Search_Caption: TEdit
          Left = 295
          Top = 40
          Width = 304
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
          OnChange = edApp_Search_CaptionChange
          OnEnter = edApp_Search_CaptionEnter
        end
        object dbeApp_Group: TDBEdit
          Left = 52
          Top = 58
          Width = 170
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'Group'
          DataSource = modDados.dsApp_Shortcuts
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object dbmHint: TDBMemo
          Left = 52
          Top = 76
          Width = 547
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          DataField = 'Hint'
          DataSource = modDados.dsApp_Shortcuts
          TabOrder = 6
        end
        object edApp_Search_Group: TEdit
          Left = 52
          Top = 40
          Width = 170
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
          OnChange = edApp_Search_GroupChange
          OnEnter = edApp_Search_GroupEnter
        end
        object edApp_Filter_Group: TEdit
          Left = 52
          Top = 22
          Width = 170
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edApp_Filter_GroupChange
        end
        object edApp_Filter_Caption: TEdit
          Left = 295
          Top = 22
          Width = 304
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = edApp_Filter_CaptionChange
        end
      end
      object bbtShortcuts_Load: TBitBtn
        Left = 334
        Top = 445
        Width = 45
        Height = 25
        Caption = 'Load'
        TabOrder = 7
        OnClick = bbtShortcuts_LoadClick
      end
      object bbtShortcuts_SaveDefault: TBitBtn
        Left = 244
        Top = 445
        Width = 90
        Height = 25
        Caption = 'Save as default'
        TabOrder = 8
        OnClick = bbtShortcuts_SaveDefaultClick
      end
      object bbtShortcuts_Edit: TBitBtn
        Left = 379
        Top = 445
        Width = 45
        Height = 25
        Caption = 'Edit'
        TabOrder = 6
        OnClick = bbtShortcuts_EditClick
      end
      object bbtShortcuts_Cancel: TBitBtn
        Left = 424
        Top = 445
        Width = 85
        Height = 25
        Caption = 'Cancel current'
        TabOrder = 5
        OnClick = bbtShortcuts_CancelClick
      end
      object bbtShortcuts_Save: TBitBtn
        Left = 570
        Top = 445
        Width = 45
        Height = 25
        Caption = 'Save'
        TabOrder = 3
        OnClick = bbtShortcuts_SaveClick
      end
      object dbgShortcuts: TDBGrid
        Left = 0
        Top = 146
        Width = 615
        Height = 290
        Align = alTop
        BorderStyle = bsNone
        DataSource = modDados.dsApp_Shortcuts
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
        OnDblClick = dbgShortcutsDblClick
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
      object bbtShortcuts_CancelAll: TBitBtn
        Left = 509
        Top = 445
        Width = 61
        Height = 25
        Caption = 'Cancel all'
        TabOrder = 4
        OnClick = bbtShortcuts_CancelAllClick
      end
      object bbtShortcuts_RestoreDefault: TBitBtn
        Left = 154
        Top = 445
        Width = 90
        Height = 25
        Caption = 'Restore default'
        TabOrder = 9
        OnClick = bbtShortcuts_RestoreDefaultClick
      end
    end
    object tbsEditorKeystrokes: TTabSheet
      Caption = 'Keystrokes (editor)'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label20: TLabel
        Left = 0
        Top = 436
        Width = 127
        Height = 13
        Caption = '*   ec = execute command'
        Enabled = False
      end
      object Label24: TLabel
        Left = 0
        Top = 470
        Width = 226
        Height = 13
        Caption = '** Some may be overlaid by the main program!'
        Enabled = False
      end
      object btnEditor_Keystrokes_Clear: TButton
        Left = 524
        Top = 440
        Width = 90
        Height = 25
        Caption = 'Clear (K)'
        TabOrder = 0
        OnClick = btnEditor_Keystrokes_ClearClick
      end
      object bbtEditor_Keystrokes_RestoreDefault: TBitBtn
        Left = 414
        Top = 440
        Width = 110
        Height = 25
        Caption = 'Restore default (K)'
        TabOrder = 1
        OnClick = bbtEditor_Keystrokes_RestoreDefaultClick
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 0
        Width = 615
        Height = 83
        Align = alTop
        Caption = ' Search/Edit '
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        object Label18: TLabel
          Left = 241
          Top = 59
          Width = 50
          Height = 13
          Caption = 'Command:'
        end
        object Label19: TLabel
          Left = 15
          Top = 59
          Width = 32
          Height = 13
          Caption = 'Group:'
        end
        object Label21: TLabel
          Left = 254
          Top = 42
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
        object Label22: TLabel
          Left = 266
          Top = 24
          Width = 25
          Height = 13
          Caption = 'Filter:'
          Color = 16250871
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
        end
        object dbeEditor_Keystrokes_Command: TDBEdit
          Left = 295
          Top = 58
          Width = 304
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          DataField = 'Command'
          DataSource = modDados.dsEditor_Keystrokes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edEditor_Keystrokes_Search: TEdit
          Left = 295
          Top = 40
          Width = 304
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
          OnChange = edEditor_Keystrokes_SearchChange
          OnEnter = edApp_Search_CaptionEnter
        end
        object dbeEditor_Keystrokes_Group: TDBEdit
          Left = 52
          Top = 58
          Width = 170
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Ctl3D = False
          DataField = 'Group'
          DataSource = modDados.dsEditor_Keystrokes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentCtl3D = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edEditor_Keystrokes_Filter: TEdit
          Left = 295
          Top = 22
          Width = 304
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = edEditor_Keystrokes_FilterChange
        end
      end
      object JvDBNavigator5: TJvDBNavigator
        Left = 0
        Top = 83
        Width = 615
        Height = 23
        DataSource = modDados.dsEditor_Keystrokes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Align = alTop
        Flat = True
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      object dbgEditor_Keystrokes: TDBGrid
        Left = 0
        Top = 106
        Width = 615
        Height = 322
        Align = alTop
        BorderStyle = bsNone
        DataSource = modDados.dsEditor_Keystrokes
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        OnDblClick = dbgEditor_KeystrokesDblClick
        OnEnter = dbgEditor_KeystrokesEnter
        OnTitleClick = dbgEditor_KeystrokesTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Command'
            Title.Caption = 'Command*'
            Width = 462
            Visible = True
          end
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'Keystroke'
            Title.Alignment = taRightJustify
            Width = 120
            Visible = True
          end>
      end
    end
    object tbsRHotkeys: TTabSheet
      Caption = 'Hotkeys (R)'
      ImageIndex = 2
      object rdgTinnRHotKeys: TRadioGroup
        Left = 4
        Top = 434
        Width = 243
        Height = 37
        Caption = ' Option (all H) '
        Columns = 2
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'Off'
          'On')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        OnClick = rdgTinnRHotKeysClick
      end
      object btnRH_Clear: TButton
        Left = 524
        Top = 440
        Width = 90
        Height = 25
        Caption = 'Clear (H)'
        TabOrder = 1
        OnClick = btnRH_ClearClick
      end
      object pgRH: TJvgPageControl
        Left = 0
        Top = 0
        Width = 615
        Height = 435
        ActivePage = tbsRH_Custom
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Style = tsFlatButtons
        TabOrder = 2
        TabStop = False
        OnChange = pgRHChange
        TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
        TabStyle.BevelInner = bvNone
        TabStyle.BevelOuter = bvNone
        TabStyle.Bold = False
        TabStyle.BackgrColor = clBtnFace
        TabStyle.Font.Charset = DEFAULT_CHARSET
        TabStyle.Font.Color = clWindowText
        TabStyle.Font.Height = -11
        TabStyle.Font.Name = 'Arial'
        TabStyle.Font.Style = []
        TabStyle.CaptionHAlign = fhaCenter
        TabStyle.Gradient.Active = False
        TabStyle.Gradient.Orientation = fgdHorizontal
        TabSelectedStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
        TabSelectedStyle.BevelInner = bvNone
        TabSelectedStyle.BevelOuter = bvNone
        TabSelectedStyle.Bold = False
        TabSelectedStyle.BackgrColor = clBtnFace
        TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
        TabSelectedStyle.Font.Color = clWindowText
        TabSelectedStyle.Font.Height = -11
        TabSelectedStyle.Font.Name = 'Arial'
        TabSelectedStyle.Font.Style = []
        TabSelectedStyle.CaptionHAlign = fhaCenter
        TabSelectedStyle.Gradient.Active = False
        TabSelectedStyle.Gradient.Orientation = fgdHorizontal
        Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
        object tbsRH_Send: TTabSheet
          Caption = 'Send'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 607
            Height = 83
            Align = alTop
            Caption = ' Search/Edit '
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            object Label6: TLabel
              Left = 252
              Top = 59
              Width = 39
              Height = 13
              Caption = 'Caption:'
            end
            object Label8: TLabel
              Left = 15
              Top = 59
              Width = 32
              Height = 13
              Caption = 'Group:'
            end
            object Label9: TLabel
              Left = 254
              Top = 42
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
            object Label15: TLabel
              Left = 266
              Top = 24
              Width = 25
              Height = 13
              Caption = 'Filter:'
              Color = 16250871
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object dbeRH_Send_Caption: TDBEdit
              Left = 295
              Top = 58
              Width = 304
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DataField = 'Caption'
              DataSource = modDados.dsRH_Send
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edRH_Send_Search_Caption: TEdit
              Left = 295
              Top = 40
              Width = 304
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
              OnChange = edRH_Send_Search_CaptionChange
              OnEnter = edApp_Search_CaptionEnter
            end
            object dbeRH_Send_Group: TDBEdit
              Left = 52
              Top = 58
              Width = 170
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              DataField = 'Group'
              DataSource = modDados.dsRH_Send
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edRH_Send_Filter_Caption: TEdit
              Left = 295
              Top = 22
              Width = 304
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edRH_Send_Filter_CaptionChange
            end
          end
          object JvDBNavigator1: TJvDBNavigator
            Left = 0
            Top = 83
            Width = 607
            Height = 22
            DataSource = modDados.dsRH_Send
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alTop
            Flat = True
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object dbgRH_Send: TDBGrid
            Left = 0
            Top = 105
            Width = 607
            Height = 299
            Align = alClient
            BorderStyle = bsNone
            DataSource = modDados.dsRH_Send
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgRH_SendDblClick
            OnEnter = dbgShortcutsEnter
            OnKeyPress = dbgShortcutsKeyPress
            OnTitleClick = dbgRH_SendTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Caption'
                Width = 458
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Hotkey'
                Title.Alignment = taRightJustify
                Width = 120
                Visible = True
              end>
          end
        end
        object tbsRH_Control: TTabSheet
          Caption = 'Control'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object GroupBox2: TGroupBox
            Left = 0
            Top = 0
            Width = 607
            Height = 83
            Align = alTop
            Caption = ' Search/Edit '
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            object Label7: TLabel
              Left = 252
              Top = 59
              Width = 39
              Height = 13
              Caption = 'Caption:'
            end
            object Label10: TLabel
              Left = 15
              Top = 59
              Width = 32
              Height = 13
              Caption = 'Group:'
            end
            object Label11: TLabel
              Left = 266
              Top = 24
              Width = 25
              Height = 13
              Caption = 'Filter:'
              Color = 16250871
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label16: TLabel
              Left = 254
              Top = 42
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
            object dbeRH_Control_Caption: TDBEdit
              Left = 295
              Top = 58
              Width = 304
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DataField = 'Caption'
              DataSource = modDados.dsRH_Control
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object edRH_Control_Search_Caption: TEdit
              Left = 295
              Top = 40
              Width = 304
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
              OnChange = edRH_Control_Search_CaptionChange
              OnEnter = edApp_Search_CaptionEnter
            end
            object dbeRH_Control_Group: TDBEdit
              Left = 52
              Top = 58
              Width = 170
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              DataField = 'Group'
              DataSource = modDados.dsRH_Control
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edRH_Control_Filter_Caption: TEdit
              Left = 295
              Top = 22
              Width = 304
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edRH_Control_Filter_CaptionChange
            end
          end
          object JvDBNavigator3: TJvDBNavigator
            Left = 0
            Top = 83
            Width = 607
            Height = 22
            DataSource = modDados.dsRH_Control
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alTop
            Flat = True
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object dbgRH_Control: TDBGrid
            Left = 0
            Top = 105
            Width = 607
            Height = 299
            Align = alClient
            BorderStyle = bsNone
            DataSource = modDados.dsRH_Control
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgRH_ControlDblClick
            OnEnter = dbgShortcutsEnter
            OnKeyPress = dbgShortcutsKeyPress
            OnTitleClick = dbgRH_ControlTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Caption'
                Width = 458
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Hotkey'
                Title.Alignment = taRightJustify
                Width = 120
                Visible = True
              end>
          end
        end
        object tbsRH_Custom: TTabSheet
          Caption = 'Custom'
          ImageIndex = 2
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 607
            Height = 83
            Align = alTop
            Caption = ' Search/Edit '
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            object Label12: TLabel
              Left = 252
              Top = 59
              Width = 39
              Height = 13
              Caption = 'Caption:'
            end
            object Label13: TLabel
              Left = 15
              Top = 59
              Width = 32
              Height = 13
              Caption = 'Group:'
            end
            object Label14: TLabel
              Left = 266
              Top = 24
              Width = 25
              Height = 13
              Caption = 'Filter:'
              Color = 16250871
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clMaroon
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
            end
            object Label17: TLabel
              Left = 254
              Top = 42
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
            object dbeRH_Custom_Caption: TDBEdit
              Left = 295
              Top = 58
              Width = 304
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              DataField = 'Caption'
              DataSource = modDados.dsRH_Custom
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object edRH_Custom_Search_Caption: TEdit
              Left = 295
              Top = 40
              Width = 304
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
              OnChange = edRH_Custom_Search_CaptionChange
              OnEnter = edApp_Search_CaptionEnter
            end
            object dbeRH_Custom_Group: TDBEdit
              Left = 52
              Top = 58
              Width = 170
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              DataField = 'Group'
              DataSource = modDados.dsRH_Custom
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object edRH_Custom_Filter_Caption: TEdit
              Left = 295
              Top = 22
              Width = 304
              Height = 16
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnChange = edRH_Custom_Filter_CaptionChange
            end
          end
          object JvDBNavigator4: TJvDBNavigator
            Left = 0
            Top = 83
            Width = 607
            Height = 23
            DataSource = modDados.dsRH_Custom
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
            Align = alTop
            Flat = True
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
          end
          object dbgRH_Custom: TDBGrid
            Left = 0
            Top = 106
            Width = 607
            Height = 298
            Align = alClient
            BorderStyle = bsNone
            DataSource = modDados.dsRH_Custom
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            OnDblClick = dbgRH_CustomDblClick
            OnEnter = dbgRH_CustomEnter
            OnKeyPress = dbgRH_CustomKeyPress
            OnTitleClick = dbgRH_CustomTitleClick
            Columns = <
              item
                Expanded = False
                FieldName = 'Caption'
                Title.Caption = 'Caption*'
                Width = 458
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Hotkey'
                Title.Alignment = taRightJustify
                Width = 120
                Visible = True
              end>
          end
        end
      end
      object bbtHotkeys_RestoreDefault: TBitBtn
        Left = 414
        Top = 440
        Width = 110
        Height = 25
        Caption = 'Restore default (H)'
        TabOrder = 3
        OnClick = bbtHotkeys_RestoreDefaultClick
      end
    end
  end
  object stbShortcuts: TStatusBar
    Left = 0
    Top = 538
    Width = 623
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
        Width = 110
      end
      item
        Width = 190
      end
      item
        Alignment = taCenter
        Width = 50
      end>
  end
  object BitBtn2: TBitBtn
    Left = 544
    Top = 507
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 0
    NumGlyphs = 2
  end
  object bbtShortcuts_Manager: TBitBtn
    Left = 394
    Top = 507
    Width = 75
    Height = 25
    Caption = '&Manager'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bbtShortcuts_ManagerClick
  end
end
