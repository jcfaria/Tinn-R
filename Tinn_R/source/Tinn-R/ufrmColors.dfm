object frmColors: TfrmColors
  Left = 495
  Top = 173
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Highlighters settings'
  ClientHeight = 537
  ClientWidth = 962
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 97
    Top = 432
    Width = 365
    Height = 65
  end
  object lWarning_1: TLabel
    Left = 103
    Top = 439
    Width = 203
    Height = 13
    Caption = 'The selected is a multi/complex highlighter.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lHighlighters: TLabel
    Left = 214
    Top = 476
    Width = 5
    Height = 13
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object lWarning_3: TLabel
    Left = 103
    Top = 476
    Width = 111
    Height = 13
    Caption = 'For this, please, select: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lWarning_2: TLabel
    Left = 103
    Top = 458
    Width = 208
    Height = 13
    Caption = 'Changes in attributes will not be permanent! '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object bbtOK: TBitBtn
    Left = 808
    Top = 503
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = bbtOKClick
    NumGlyphs = 2
  end
  object bbtCancel: TBitBtn
    Left = 883
    Top = 503
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel all'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object gpbHighlighters: TGroupBox
    Left = 6
    Top = 4
    Width = 85
    Height = 493
    Caption = ' Highlighters '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object lbHighlighters: TListBox
      Left = 1
      Top = 14
      Width = 83
      Height = 478
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ExtendedSelect = False
      ItemHeight = 13
      Sorted = True
      TabOrder = 0
      OnClick = lbHighlightersClick
    end
  end
  object gpbIdentifiers: TGroupBox
    Left = 97
    Top = 4
    Width = 365
    Height = 288
    Caption = ' Identifiers of selected highlighter '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object lbIdentifiers: TListBox
      Left = 1
      Top = 18
      Width = 148
      Height = 261
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ExtendedSelect = False
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbIdentifiersClick
    end
    object gpbAttributes: TGroupBox
      Left = 155
      Top = 13
      Width = 203
      Height = 266
      Caption = ' Attributes (FG and BG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object cgColors: TColorGrid
        Left = 8
        Top = 18
        Width = 50
        Height = 136
        GridOrdering = go2x8
        BackgroundIndex = 15
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnMouseUp = cgColorsMouseUp
      end
      object gpbMorColors: TGroupBox
        Left = 63
        Top = 13
        Width = 133
        Height = 141
        Caption = ' More colors '
        TabOrder = 1
        object shFG: TtrShape
          Left = 6
          Top = 24
          Width = 120
          Height = 22
          Shape = stRoundRect
          OnMouseUp = shFGMouseUp
          Caption = 'FG (choice)'
        end
        object shBG: TtrShape
          Left = 6
          Top = 52
          Width = 120
          Height = 22
          Shape = stRoundRect
          OnMouseUp = shBGMouseUp
          Caption = 'BG (choice)'
        end
        object shBGPreferred: TtrShape
          Left = 6
          Top = 82
          Width = 120
          Height = 22
          Shape = stRoundRect
          OnMouseUp = shBGPreferredMouseUp
          Caption = 'BG preferred  (choice)'
        end
        object bbtSetBGForAllIdentifiers: TBitBtn
          Left = 6
          Top = 111
          Width = 120
          Height = 22
          Hint = 'Set background color for all identifiers'
          Caption = 'Set BG for all identifiers'
          Default = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = bbtSetBGForAllIdentifiersClick
          NumGlyphs = 2
        end
      end
      object gpbText: TGroupBox
        Left = 8
        Top = 160
        Width = 188
        Height = 98
        Caption = ' Text '
        TabOrder = 2
        object cbBold: TCheckBox
          Left = 10
          Top = 20
          Width = 44
          Height = 17
          Action = actTextAttributes
          Caption = 'Bold'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object cbItalic: TCheckBox
          Left = 10
          Top = 44
          Width = 47
          Height = 17
          Action = actTextAttributes
          Caption = 'Italic'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbUnderline: TCheckBox
          Left = 10
          Top = 68
          Width = 66
          Height = 17
          Action = actTextAttributes
          Caption = 'Underline'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 97
    Top = 293
    Width = 365
    Height = 133
    Caption = ' For all '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    object GroupBox2: TGroupBox
      Left = 6
      Top = 13
      Width = 182
      Height = 52
      Caption = ' Active line (BG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object shActiveLine: TtrShape
        Left = 24
        Top = 20
        Width = 151
        Height = 22
        Shape = stRoundRect
        OnMouseUp = shActiveLineMouseUp
        Caption = 'Active line (choice)'
      end
      object cbActiveLineBG: TCheckBox
        Left = 6
        Top = 22
        Width = 15
        Height = 18
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnMouseUp = cbActiveLineBGMouseUp
      end
    end
    object GroupBox3: TGroupBox
      Left = 6
      Top = 72
      Width = 352
      Height = 51
      Caption = ' Highlighters (BG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object shBGAllHighlighters: TtrShape
        Left = 24
        Top = 20
        Width = 151
        Height = 22
        Shape = stRoundRect
        OnMouseUp = shBGAllHighlightersMouseUp
        Caption = 'BG preferred (choice)'
      end
      object bbtSetBGForAllIHighlighters: TBitBtn
        Left = 196
        Top = 19
        Width = 149
        Height = 24
        Hint = 'Set background color for all identifiers'
        Caption = 'Set BG for all highlighters'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtSetBGForAllIHighlightersClick
        NumGlyphs = 2
      end
    end
    object GroupBox6: TGroupBox
      Left = 195
      Top = 13
      Width = 163
      Height = 52
      Caption = ' Brackets (FG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object shBrackets: TtrShape
        Left = 7
        Top = 20
        Width = 149
        Height = 22
        Shape = stRoundRect
        OnMouseUp = shBracketsMouseUp
        Caption = 'Brackets (choice)'
      end
    end
  end
  object gpbSample: TGroupBox
    Left = 468
    Top = 4
    Width = 489
    Height = 493
    Caption = ' Sample code '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object synSample: TSynEdit
      Left = 1
      Top = 14
      Width = 487
      Height = 478
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      TabOrder = 0
      OnClick = synSampleClick
      BorderStyle = bsNone
      Gutter.Font.Charset = DEFAULT_CHARSET
      Gutter.Font.Color = clWindowText
      Gutter.Font.Height = -11
      Gutter.Font.Name = 'Terminal'
      Gutter.Font.Style = []
      Gutter.Visible = False
      Gutter.Width = 0
      OnChange = synSampleChange
      FontSmoothing = fsmNone
      RemovedKeystrokes = <
        item
          Command = ecContextHelp
          ShortCut = 112
        end>
      AddedKeystrokes = <
        item
          Command = ecContextHelp
          ShortCut = 16496
        end>
    end
  end
  object bbHelp: TBitBtn
    Left = 733
    Top = 503
    Width = 75
    Height = 25
    Caption = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
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
  object alAttributes: TActionList
    Left = 25
    Top = 27
    object actTextAttributes: TAction
      Caption = 'actTextAttributes'
      OnExecute = actTextAttributesExecute
    end
  end
end
