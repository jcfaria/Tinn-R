object frmSH_Map_Dlg: TfrmSH_Map_Dlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'S/H map'
  ClientHeight = 565
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbHelp: TBitBtn
    Left = 394
    Top = 516
    Width = 75
    Height = 25
    Caption = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
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
    Top = 516
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    NumGlyphs = 2
  end
  object pgSH: TJvgPageControl
    Left = 0
    Top = 0
    Width = 623
    Height = 515
    ActivePage = tbsAppShortcuts
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Style = tsFlatButtons
    TabOrder = 2
    TabStop = False
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
      Caption = 'Aplication shortcuts'
      object Panel2: TPanel
        Left = 0
        Top = 104
        Width = 615
        Height = 20
        Align = alTop
        BevelOuter = bvNone
        Color = 16250871
        ParentBackground = False
        TabOrder = 0
        object JvDBNavigator2: TJvDBNavigator
          Left = 0
          Top = 0
          Width = 615
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
      object gbKeystrokes: TGroupBox
        Left = 0
        Top = 0
        Width = 615
        Height = 104
        Align = alTop
        Caption = ' Search/Edit Shortcuts '
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        object Label2: TLabel
          Left = 252
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
          Left = 254
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
          Left = 295
          Top = 40
          Width = 304
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
          TabOrder = 3
        end
        object edtCaptionSearch: TEdit
          Left = 295
          Top = 22
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
        end
        object dbeGroup: TDBEdit
          Left = 52
          Top = 40
          Width = 170
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
          TabOrder = 2
        end
        object dbmHint: TDBMemo
          Left = 52
          Top = 58
          Width = 547
          Height = 16
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          DataField = 'Hint'
          DataSource = modDados.dsShortcuts
          TabOrder = 4
        end
        object edtGroupSearch: TEdit
          Left = 52
          Top = 22
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
          TabOrder = 0
        end
      end
      object bbtShortcuts_Load: TBitBtn
        Left = 268
        Top = 456
        Width = 50
        Height = 27
        Caption = 'Load'
        TabOrder = 2
        OnClick = bbtShortcuts_LoadClick
      end
      object bbtShortcuts_SaveDefault: TBitBtn
        Left = 178
        Top = 456
        Width = 90
        Height = 27
        Caption = 'Save as default'
        TabOrder = 3
        OnClick = bbtShortcuts_SaveDefaultClick
      end
      object bbtShortcuts_Edit: TBitBtn
        Left = 318
        Top = 456
        Width = 50
        Height = 27
        Caption = 'Edit'
        TabOrder = 4
        OnClick = bbtShortcuts_EditClick
      end
      object bbtShortcuts_Cancel: TBitBtn
        Left = 368
        Top = 456
        Width = 85
        Height = 27
        Caption = 'Cancel current'
        TabOrder = 5
        OnClick = bbtShortcuts_CancelClick
      end
      object bbtShortcuts_Save: TBitBtn
        Left = 515
        Top = 456
        Width = 50
        Height = 27
        Caption = 'Save'
        TabOrder = 6
        OnClick = bbtShortcuts_SaveClick
      end
      object dbgShortcuts: TDBGrid
        Left = 0
        Top = 124
        Width = 615
        Height = 325
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
        TabOrder = 7
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
      object bbtShortcuts_Close: TBitBtn
        Left = 565
        Top = 456
        Width = 50
        Height = 27
        Caption = 'Close'
        TabOrder = 8
        OnClick = bbtShortcuts_CloseClick
      end
      object bbtShortcuts_CancelAll: TBitBtn
        Left = 453
        Top = 456
        Width = 61
        Height = 27
        Caption = 'Cancel all'
        TabOrder = 9
        OnClick = bbtShortcuts_CancelAllClick
      end
      object bbtShortcuts_RestoreDefault: TBitBtn
        Left = 93
        Top = 456
        Width = 85
        Height = 27
        Caption = 'Restore default'
        TabOrder = 10
        OnClick = bbtShortcuts_RestoreDefaultClick
      end
      object bbtShortcut_Help: TBitBtn
        Left = 18
        Top = 456
        Width = 75
        Height = 27
        Caption = '&Help'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
        OnClick = bbtShortcut_HelpClick
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
    object tbsEditorShortcuts: TTabSheet
      Caption = 'Editor shortcuts'
      ImageIndex = 1
      object Label20: TLabel
        Left = 0
        Top = 454
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
      object btnUpdateKey: TButton
        Left = 511
        Top = 457
        Width = 104
        Height = 25
        Caption = 'Update'
        TabOrder = 0
      end
      object pnlCommands: TPanel
        Left = 0
        Top = 0
        Width = 615
        Height = 454
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'pnlCommands'
        TabOrder = 1
        object lvKeystrokes: TListView
          AlignWithMargins = True
          Left = 5
          Top = 5
          Width = 605
          Height = 444
          Align = alClient
          BevelInner = bvNone
          BorderStyle = bsNone
          Color = 16250871
          Columns = <
            item
              Caption = 'Command*'
              Width = 300
            end
            item
              Caption = 'Keystroke**'
              Width = 280
            end>
          ColumnClick = False
          HideSelection = False
          ReadOnly = True
          RowSelect = True
          SortType = stText
          TabOrder = 0
          ViewStyle = vsReport
          OnDblClick = lvKeystrokesDblClick
        end
      end
    end
    object tbsRHotkeys: TTabSheet
      Caption = 'R hotkeys'
      ImageIndex = 2
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 615
        Height = 52
        Align = alTop
        Caption = ' Set (hotkey) '
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
        object edHotkey: TEditAlign
          Left = 13
          Top = 21
          Width = 586
          Height = 19
          MultiLine = True
          WordWrap = True
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
      end
      object rdgTinnRHotKeys: TRadioGroup
        Left = 4
        Top = 445
        Width = 182
        Height = 31
        Caption = ' Option '
        Columns = 2
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Items.Strings = (
          'On'
          'Off')
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
      object btnOK: TButton
        Left = 570
        Top = 451
        Width = 45
        Height = 25
        Caption = 'OK'
        TabOrder = 2
      end
      object btnRemove: TButton
        Left = 439
        Top = 451
        Width = 65
        Height = 25
        Caption = 'Remove'
        TabOrder = 3
      end
      object btnClearAllHotKeys: TButton
        Left = 505
        Top = 451
        Width = 65
        Height = 25
        Caption = 'Clear all'
        TabOrder = 4
      end
      object btnAddHotKey: TButton
        Left = 394
        Top = 451
        Width = 45
        Height = 25
        Caption = 'Add'
        TabOrder = 5
      end
      object BitBtn1: TBitBtn
        Left = 332
        Top = 451
        Width = 62
        Height = 25
        Caption = '&Help'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
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
      object pgRhotkeys: TJvgPageControl
        Left = 0
        Top = 52
        Width = 615
        Height = 393
        ActivePage = tbsSend_Control
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Style = tsFlatButtons
        TabOrder = 7
        TabStop = False
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
        object tbsSend_Control: TTabSheet
          Caption = 'Send/Control'
          object strgHK_Send: TStringGrid
            Left = 0
            Top = 0
            Width = 607
            Height = 362
            Align = alClient
            BorderStyle = bsNone
            ColCount = 2
            DefaultColWidth = 230
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goColMoving, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            OnDblClick = strgHK_SendDblClick
            ColWidths = (
              467
              260)
          end
        end
        object tbsCustom: TTabSheet
          Caption = 'Custom'
          ImageIndex = 2
          object strgHK_CU: TStringGrid
            Left = 0
            Top = 0
            Width = 607
            Height = 362
            Align = alClient
            BorderStyle = bsNone
            ColCount = 2
            DefaultColWidth = 230
            DefaultRowHeight = 18
            FixedCols = 0
            RowCount = 20
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goColMoving, goRowSelect]
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            OnDblClick = strgHK_CUDblClick
            ColWidths = (
              467
              265)
          end
        end
      end
    end
  end
  object stbShortcuts: TStatusBar
    Left = 0
    Top = 546
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
  object BitBtn2: TBitBtn
    Left = 544
    Top = 516
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
    NumGlyphs = 2
  end
end
