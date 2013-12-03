object frmColors: TfrmColors
  Left = 495
  Top = 173
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Highlighters settings'
  ClientHeight = 450
  ClientWidth = 706
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
  object lWarning: TLabel
    Left = 6
    Top = 417
    Width = 525
    Height = 13
    Caption = 
      'The selected is a multi/complex highlighter. Changes in attribut' +
      'es will not be permanent! For this, please, select: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lHighlighters: TLabel
    Left = 8
    Top = 433
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
  object bbtOK: TBitBtn
    Left = 551
    Top = 417
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
    Left = 626
    Top = 417
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
    Width = 141
    Height = 409
    Caption = ' Highlighters '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object lbHighlighters: TListBox
      Left = 8
      Top = 18
      Width = 124
      Height = 379
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
    Left = 153
    Top = 4
    Width = 547
    Height = 182
    Caption = ' Identifiers of selected highlighter '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 3
    object lbIdentifiers: TListBox
      Left = 9
      Top = 18
      Width = 160
      Height = 156
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      ExtendedSelect = False
      ItemHeight = 13
      TabOrder = 0
      OnClick = lbIdentifiersClick
    end
    object gpbAttributes: TGroupBox
      Left = 175
      Top = 13
      Width = 365
      Height = 162
      Caption = ' Attributes (FG = ForeGround, BG = BackGround) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object cgColors: TColorGrid
        Left = 8
        Top = 18
        Width = 70
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
        Left = 83
        Top = 13
        Width = 275
        Height = 85
        Caption = ' More colors '
        TabOrder = 1
        object shFG: TtrShape
          Left = 8
          Top = 24
          Width = 128
          Height = 22
          Shape = stRoundRect
          OnMouseUp = shFGMouseUp
          Caption = 'FG (choice)'
        end
        object shBG: TtrShape
          Left = 139
          Top = 24
          Width = 128
          Height = 22
          Shape = stRoundRect
          OnMouseUp = shBGMouseUp
          Caption = 'BG (choice)'
        end
        object shBGPreferred: TtrShape
          Left = 139
          Top = 51
          Width = 128
          Height = 22
          Shape = stRoundRect
          OnMouseUp = shBGPreferredMouseUp
          Caption = 'BG preferred  (choice)'
        end
        object bbtSetBGForAllIdentifiers: TBitBtn
          Left = 8
          Top = 51
          Width = 128
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
        Left = 83
        Top = 101
        Width = 275
        Height = 53
        Caption = ' Text '
        TabOrder = 2
        object cbBold: TCheckBox
          Left = 10
          Top = 22
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
          Left = 91
          Top = 23
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
          Left = 170
          Top = 23
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
    Left = 153
    Top = 188
    Width = 547
    Height = 69
    Caption = ' For all '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object GroupBox2: TGroupBox
      Left = 6
      Top = 13
      Width = 133
      Height = 48
      Caption = ' Active line (BG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      object shActiveLine: TtrShape
        Left = 24
        Top = 20
        Width = 101
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
      Left = 261
      Top = 13
      Width = 279
      Height = 48
      Caption = ' Highlighters (BG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object shBGAllHighlighters: TtrShape
        Left = 149
        Top = 20
        Width = 121
        Height = 22
        Shape = stRoundRect
        OnMouseUp = shBGAllHighlightersMouseUp
        Caption = 'BG preferred (choice)'
      end
      object bbtSetBGForAllIHighlighters: TBitBtn
        Left = 7
        Top = 20
        Width = 139
        Height = 23
        Hint = 'Set background color for all identifiers'
        Caption = 'Set BG for all highlighters'
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
        OnClick = bbtSetBGForAllIHighlightersClick
        NumGlyphs = 2
      end
    end
    object GroupBox6: TGroupBox
      Left = 144
      Top = 13
      Width = 112
      Height = 48
      Caption = ' Brackets (FG) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      object shBrackets: TtrShape
        Left = 7
        Top = 20
        Width = 98
        Height = 22
        Shape = stRoundRect
        OnMouseUp = shBracketsMouseUp
        Caption = 'Brackets (choice)'
      end
    end
  end
  object gpbSample: TGroupBox
    Left = 153
    Top = 259
    Width = 547
    Height = 154
    Caption = ' Sample code '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object synSample: TSynEdit
      Left = 13
      Top = 11
      Width = 531
      Height = 139
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
  object alAttributes: TActionList
    Left = 65
    Top = 131
    object actTextAttributes: TAction
      Caption = 'actTextAttributes'
      OnExecute = actTextAttributesExecute
    end
  end
end
