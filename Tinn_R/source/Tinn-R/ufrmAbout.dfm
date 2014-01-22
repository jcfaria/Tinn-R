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
    ActivePage = tbsAboutVersion
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
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
  object bbHelp: TBitBtn
    Left = 359
    Top = 449
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
