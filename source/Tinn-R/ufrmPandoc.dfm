object frmPandoc: TfrmPandoc
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Pandoc (document converter)'
  ClientHeight = 554
  ClientWidth = 535
  Color = 16250871
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rdgFrom: TRadioGroup
    Left = 0
    Top = 0
    Width = 535
    Height = 90
    Align = alTop
    Caption = ' From '
    Columns = 2
    Ctl3D = False
    Items.Strings = (
      'docbook (DocBook XML)'
      'html (HTML)'
      'json (JSON version of native AST)'
      'latex (LaTeX)'
      'markdown (markdown)'
      'native (native Haskell)'
      'rst (reStructuredText)'
      'textile (Textile)')
    ParentCtl3D = False
    TabOrder = 0
    OnClick = rdgFromClick
  end
  object rdgTo: TRadioGroup
    Left = 0
    Top = 90
    Width = 535
    Height = 254
    Align = alTop
    Caption = ' To '
    Columns = 2
    Ctl3D = False
    Items.Strings = (
      'asciidoc (AsciiDoc)'
      'beamer (LaTeX beamer slide show)'
      'context (ConTeXt)'
      'docbook (DocBook XML)'
      'docx (Word docx)'
      'dzslides (HTML5 + javascript slide show)'
      'epub (EPUB book)'
      'html (XHTML 1)'
      'html5 (HTML 5)'
      'json (JSON version of native AST)'
      'latex (LaTeX)'
      'man (groff man)'
      'markdown (markdown)'
      'mediawiki (MediaWiki markup)'
      'native (native Haskell)'
      'odt (OpenOffice text document)'
      'opendocument (OpenDocument XML)'
      'org (Emacs Org-Mode)'
      'plain (plain text)'
      'rst (reStructuredText)'
      'rtf (rich text format)'
      's5 (S5 HTML and javascript slide show)'
      'slideous (Slideous HTML and javascript slide show)'
      'slidy (Slidy HTML and javascript slide show)'
      'texinfo (GNU Texinfo)'
      'textile (Textile)')
    ParentCtl3D = False
    TabOrder = 1
    OnClick = rdgToClick
  end
  object bbtOK: TBitBtn
    Left = 353
    Top = 521
    Width = 89
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    NumGlyphs = 2
  end
  object bbtCancel: TBitBtn
    Left = 441
    Top = 521
    Width = 89
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
    NumGlyphs = 2
  end
  object gpbInstruction: TGroupBox
    Left = 0
    Top = 344
    Width = 535
    Height = 92
    Align = alTop
    Caption = ' Instruction (will be send to pandoc.exe) '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object Label1: TLabel
      Left = 5
      Top = 52
      Width = 37
      Height = 13
      Caption = '%from:'
    end
    object Label2: TLabel
      Left = 17
      Top = 69
      Width = 25
      Height = 13
      Caption = '%to:'
    end
    object edInstruction: TEditAlign
      Left = 5
      Top = 16
      Width = 525
      Height = 32
      MultiLine = True
      WordWrap = True
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object edFrom: TEditAlign
      Left = 47
      Top = 50
      Width = 483
      Height = 15
      MultiLine = True
      WordWrap = True
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edTo: TEditAlign
      Left = 47
      Top = 67
      Width = 483
      Height = 15
      MultiLine = True
      WordWrap = True
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object bbtPandocRestoreDefault: TButton
    Left = 264
    Top = 521
    Width = 90
    Height = 25
    Caption = 'Restore default'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bbtPandocRestoreDefaultClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 436
    Width = 535
    Height = 79
    Align = alTop
    Caption = ' Instruction (history) '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label3: TLabel
      Left = 5
      Top = 39
      Width = 37
      Height = 13
      Caption = '%from:'
    end
    object Label4: TLabel
      Left = 17
      Top = 56
      Width = 25
      Height = 13
      Caption = '%to:'
    end
    object cbPandocHistory: TComboBox
      Left = 4
      Top = 15
      Width = 528
      Height = 21
      ItemHeight = 0
      TabOrder = 0
      OnSelect = cbPandocHistorySelect
    end
    object edHistoryFrom: TEditAlign
      Left = 47
      Top = 37
      Width = 483
      Height = 15
      MultiLine = True
      WordWrap = True
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object edHistoryTo: TEditAlign
      Left = 47
      Top = 54
      Width = 483
      Height = 15
      MultiLine = True
      WordWrap = True
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
end
