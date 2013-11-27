object frmAbout: TfrmAbout
  Left = 538
  Top = 206
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 499
  ClientWidth = 513
  Color = clBtnFace
  TransparentColorValue = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clHighlight
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 88
    Top = 454
    Width = 185
    Height = 13
    Caption = 'Physical memory available to Windows:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object PhysMem: TLabel
    Left = 285
    Top = 455
    Width = 6
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 202
    Top = 475
    Width = 71
    Height = 13
    Caption = 'Memory in use:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object FreeRes: TLabel
    Left = 285
    Top = 476
    Width = 6
    Height = 13
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object bbtOK: TBitBtn
    Left = 434
    Top = 449
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
  end
  object pgAbout: TJvgPageControl
    Left = 0
    Top = 0
    Width = 513
    Height = 442
    ActivePage = tbsAboutAcknowledgments
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabOrder = 1
    TabStop = False
    TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabStyle.BevelInner = bvNone
    TabStyle.BevelOuter = bvNone
    TabStyle.Bold = False
    TabStyle.BackgrColor = clBtnFace
    TabStyle.Font.Charset = DEFAULT_CHARSET
    TabStyle.Font.Color = clBlack
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
    TabSelectedStyle.Font.Color = clBtnText
    TabSelectedStyle.Font.Height = -11
    TabSelectedStyle.Font.Name = 'Arial'
    TabSelectedStyle.Font.Style = []
    TabSelectedStyle.CaptionHAlign = fhaCenter
    TabSelectedStyle.Gradient.Active = False
    TabSelectedStyle.Gradient.Orientation = fgdHorizontal
    Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
    object tbsAboutVersion: TTabSheet
      Caption = 'Version'
      object imgAboutMain: TImage
        Left = 63
        Top = 24
        Width = 382
        Height = 239
        Center = True
        ParentShowHint = False
        ShowHint = False
      end
      object Label2: TLabel
        Left = 84
        Top = 283
        Width = 301
        Height = 13
        Caption = 'Tinn-R Editor - GUI for R Language and Environment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lVersion: TLabel
        Left = 84
        Top = 303
        Width = 47
        Height = 13
        Caption = 'Version '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        IsControl = True
      end
      object lblURLSourceforge: TLabel
        Left = 84
        Top = 343
        Width = 61
        Height = 13
        Caption = 'SourceForge'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = lblURLSourceforgeClick
        OnMouseMove = lblURLSourceforgeMouseMove
      end
      object lblURLWebPage: TLabel
        Left = 84
        Top = 323
        Width = 50
        Height = 13
        Caption = 'Web page'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = lblURLWebPageClick
        OnMouseMove = lblURLWebPageMouseMove
      end
      object Copyright: TLabel
        Left = 84
        Top = 364
        Width = 118
        Height = 13
        Caption = 'Copyright 2001-2013'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        IsControl = True
      end
      object Label1: TLabel
        Left = 84
        Top = 385
        Width = 259
        Height = 13
        Caption = 'Under the GNU General Public License - GPL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        IsControl = True
      end
    end
    object tbsAboutProject: TTabSheet
      Caption = 'Project'
      ImageIndex = 1
      object memAboutProject: TMemo
        Left = 0
        Top = 0
        Width = 505
        Height = 414
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          ' Coordination'
          '==========='
          ' Jos'#233' Cl'#225'udio Faria'
          ' Universidade Estadual de Santa Cruz - UESC/BA/BRASIL'
          ' Departamento de Ci'#234'ncias Exatas e Tecnol'#243'gicas - DCET'
          ''
          ' Authors (historic order)'
          '==================='
          ' - Jos'#233' Cl'#225'udio Faria'
          '   email: joseclaudio.faria@gmail.com'
          ''
          ' - Philippe Grosjean'
          '   email: phgrosjean@sciviews.org'
          ''
          ' - Enio Jelihovschi (documentation in English)'
          '   email: eniojelihovs@gmail.com'
          ''
          ' Contributors with the source code (historic order)'
          '======================================='
          ' - Marco de Groot'
          '   email: m.h.de.groot@mattic.com'
          ''
          ' - Huashan Chen:'
          '   email: chenhuashan@baidao.net'
          ''
          
            ' Tinn-R would not be what it is without all contributors, thanks' +
            ' very much!'
          ''
          '                                            Tinn-R team')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object tbsAboutAcknowledgments: TTabSheet
      Caption = 'Acknowledgments'
      ImageIndex = 2
      object memAboutAknowledgments: TMemo
        Left = 0
        Top = 0
        Width = 505
        Height = 414
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            ' Due the valuable suggestions and carried through works, the Tin' +
            'n-R project is thankful to:'
          ''
          ' People'
          '======='
          ' - Anderson R. Barbieri'
          ' - Andy Bunn'
          ' - Bendix Carstensen'
          
            ' - Camila de Godoy (for the criation of the projetc logo) - http' +
            '://www.camiladegodoy.com.br'
          ' - Douglas Federman'
          
            ' - Diethelm Wuertz (editor of Tinn-R ebook) - https://www.rmetri' +
            'cs.org'
          ' - Duncan Murdoch'
          ' - Eric Lacoutre'
          ' - Frank R. Lawrence'
          ' - Gabor Grothendieck'
          ' - Gabriel Moreno'
          ' - Hiroyuki Kawakatsu'
          ' - Igor Kojanov'
          ' - Ivan B. Allaman'
          ' - Jairo Cugliari'
          ' - Jan Fiala (PSPad editor for share code and helps)'
          ' - Jens Oehlschl'#228'gel'
          ' - John (JJ)'
          ' - John Cotter'
          ' - John Fox'
          ' - John Hathaway'
          ' - Jorge Alexandre Wiendl (for a lot of good ideas and works)'
          ' - Kelly Hildner'
          ' - Leon Barmuta'
          ' - Manuel Salamero'
          ' - Michael Pomada'
          ' - Mike Prager'
          
            ' - Ricardo Pietrobon (for making the Tinn-R User Guide more read' +
            'able and intelligible)'
          ' - Russel May (founder of the Tinn project)'
          ' - Savano S. Pereira'
          ' - S'#248'ren H'#248'jsgaard'
          ' - Stefan Ascher'
          ' - Steven Novick'
          ' - Suresh Krishna'
          
            ' - Teresa Gra'#231'a (for making the Tinn-R User Guide more readable ' +
            'and intelligible)'
          ' - Thomas Petzoldt'
          ' - Uwe Ligges'
          ' - Victor Moreno'
          ' - Wenping Wang'
          ' - Yves Brostaux'
          ''
          
            ' Tinn-R would not be what it is without all suggestions and work' +
            's, thanks very much!'
          ''
          '                                            Tinn-R team')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object tbsAboutCredits: TTabSheet
      Caption = 'Credits'
      ImageIndex = 3
      object memAboutCredits: TMemo
        Left = 0
        Top = 0
        Width = 505
        Height = 414
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          ' Institutions'
          '=========='
          ' - Universidade Estadual de Santa Cruz'#9#9#9#9'UESC/BA/BRASIL'
          
            ' - Conselho Nacional de Desenvolvimento Cient'#237'fico e Tecnol'#243'gico' +
            #9'CNPq/BRASIL'
          
            ' - Escola Superior de Agricultura "Luiz de Queiroz"'#9#9#9'ESALQ/USP/' +
            'SP/BRASIL'
          ' - Departamento de Ci'#234'ncias Exatas'#9#9#9#9'LCE/ESALQ/USP/SP/BRASIL'
          ' - SourceForge.net'
          ''
          ' People'
          '======='
          ' - Bill Venables'#9#9#9'CSIRO/AUSTRALIA'
          ' - Clarice Garcia Borges Dem'#233'trio'#9'LCE/ESALQ/SP/BRASIL'
          ' - Jakson Alves de Aquino                       DCS/UFC/BRASIL'
          ''
          ' Teams of the open source projects'
          '============================='
          ' - Deplate'#9#9#9'Fc'#9'http://deplate.sourceforge.net/index.php'
          ' - InnoSetup'#9#9'Is'#9'http://www.jrsoftware.org'
          ' - JEDI'#9#9#9'Dc'#9'http://www.delphi-jedi.org'
          ' - MikTeX'#9#9#9'Cp'#9'http://www.miktex.org'
          ' - SynEdit'#9#9#9'Dc'#9'http://synedit.sourceforge.net'
          ' - Tinn'#9#9#9'Te'#9'http://tinn.solarvoid.com'
          
            ' - TurboPower Abbrevia'#9'Dc'#9'http://sourceforge.net/projects/tpabbr' +
            'evia'
          ' - Txt2tags'#9#9'Fc'#9'http://txt2tags.sourceforge.net'
          ''
          ' Teams of the freewere resources'
          '==========================='
          ' - FAMFAMFAM'#9#9'I'#9'http://www.famfamfam.com/lab/icons/silk'
          ' - IcoFiX'#9#9#9'Ie'#9'http://icofx.xhost.ro'
          ' - HotKeyManager'#9#9'Dc'#9'http://www.killprog.com/hkme.html'
          ' - LS Speller'#9#9'Dc'#9'http://www.luziusschneider.com/SpellerHome.htm'
          ' - TEditAlign'#9#9'Dc'#9'http://www.torry.net'
          
            ' - TextDiff '#9#9'Dc'#9'http://www.users.on.net/johnson/delphi/textdiff' +
            '.html'
          ' - ToolBar2000'#9#9'Dc'#9'http://www.jrsoftware.org/tb2k.php'
          ''
          'Shareware programs'
          '================='
          '- WinSnap'#9#9'Ss'#9'http://www.ntwind.com/'#9
          ''
          ' Note'
          '====='
          ' Cp'#9'Compilation'
          ' Dc'#9'Delphi component'
          ' Fc'#9'File conversor'
          ' I'#9'Icons'
          ' Ie'#9'Icons editor (and viewer)'
          ' Is'#9'Install setup'
          ' Ss'#9'Screenshots'
          ' Te'#9'Text editor project'
          ''
          ''
          ' Tinn-R would not be what it is without all, thanks very much!'
          ''
          '                                            Tinn-R team')
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
end
