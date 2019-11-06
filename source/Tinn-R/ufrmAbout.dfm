object frmAbout: TfrmAbout
  Left = 538
  Top = 206
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 346
  ClientWidth = 600
  Color = 16250871
  TransparentColorValue = clMaroon
  Ctl3D = False
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clHighlight
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
  object bbtOK: TBitBtn
    Left = 522
    Top = 315
    Width = 75
    Height = 25
    Caption = 'O&K'
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
    NumGlyphs = 2
  end
  object pgAbout: TJvgPageControl
    Left = 0
    Top = 0
    Width = 600
    Height = 312
    ActivePage = tbsAboutProject
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHighlight
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabHeight = 18
    TabOrder = 1
    TabStop = False
    OnChange = pgAboutChange
    TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
    TabStyle.BevelInner = bvNone
    TabStyle.BevelOuter = bvNone
    TabStyle.Bold = False
    TabStyle.BackgrColor = clBtnFace
    TabStyle.Font.Charset = DEFAULT_CHARSET
    TabStyle.Font.Color = clBlack
    TabStyle.Font.Height = -12
    TabStyle.Font.Name = 'MS Sans Serif'
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
    TabSelectedStyle.Font.Height = -12
    TabSelectedStyle.Font.Name = 'MS Sans Serif'
    TabSelectedStyle.Font.Style = []
    TabSelectedStyle.CaptionHAlign = fhaCenter
    TabSelectedStyle.Gradient.Active = False
    TabSelectedStyle.Gradient.Orientation = fgdHorizontal
    Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
    object tbsAboutVersion: TTabSheet
      Caption = 'Version'
      object lVersion: TLabel
        Left = 260
        Top = 148
        Width = 59
        Height = 21
        Caption = 'Version '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        IsControl = True
      end
      object lblURLSourceforge: TLabel
        Left = 260
        Top = 87
        Width = 125
        Height = 18
        Caption = 'SourceForge (repos)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = lblURLSourceforgeClick
        OnMouseMove = lblURLSourceforgeMouseMove
      end
      object lblURLWebPage: TLabel
        Left = 260
        Top = 63
        Width = 101
        Height = 18
        Caption = 'Web page (main)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = []
        ParentFont = False
        Transparent = True
        OnClick = lblURLWebPageClick
        OnMouseMove = lblURLWebPageMouseMove
      end
      object Copyright: TLabel
        Left = 186
        Top = 213
        Width = 118
        Height = 16
        Caption = 'Copyright 2001-2020'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        IsControl = True
      end
      object Label1: TLabel
        Left = 186
        Top = 232
        Width = 291
        Height = 19
        Caption = 'Under the GNU General Public License - GPL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        IsControl = True
      end
      object Label6: TLabel
        Left = 163
        Top = 21
        Width = 339
        Height = 21
        Caption = 'Editor - GUI for R Language and Environment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -15
        Font.Name = 'Comic Sans MS'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object im1: TImage
        Left = 0
        Top = -77
        Width = 97
        Height = 361
      end
      object im2: TImage
        Left = 0
        Top = 274
        Width = 600
        Height = 10
      end
    end
    object tbsAboutProject: TTabSheet
      Caption = 'Project'
      ImageIndex = 1
      object synAboutProject: TSynEdit
        Left = 0
        Top = 0
        Width = 592
        Height = 284
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        OnClick = synAboutProjectClick
        OnKeyDown = synAboutProjectKeyDown
        BorderStyle = bsNone
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Terminal'
        Gutter.Font.Style = []
        Gutter.Visible = False
        Gutter.Width = 0
        Lines.UnicodeStrings = 
          'COORDINATION'#13#10' - Jos'#233' Cl'#225'udio Faria'#13#10'   Universidade Estadual de' +
          ' Santa Cruz - UESC/BA/BRASIL'#13#10'   Departamento de Ci'#234'ncias Exatas' +
          ' e Tecnol'#243'gicas - DCET'#13#10#13#10'ACTIVE DEVELOPER(S)'#13#10' - Jos'#233' Cl'#225'udio F' +
          'aria'#13#10'   email: joseclaudio.faria@gmail.com'#13#10#13#10' - Philiphe A. R.' +
          ' Kramer'#13#10'   email: pharkrum@gmail.com'#13#10#13#10'CONTRIBUTORS (historica' +
          'l order)'#13#10' - Marco de Groot'#13#10' - Philippe Grosjean'#13#10' - Huashan Ch' +
          'en'#13#10' - Enio Galinkin Jelihovschi'#13#10' - Ricardo Pietrobon'#13#10' - Phili' +
          'pe Silva Farias'#13#10' - Swami de P. Lima'#13#10#13#10'Tinn-R would not be what' +
          ' it is without all contributors, '#13#10'thanks very much!'
        ReadOnly = True
        WordWrap = True
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
    object tbsAboutAcknowledgments: TTabSheet
      Caption = 'Acknowledgments'
      ImageIndex = 2
      object synAboutAknowledgments: TSynEdit
        Left = 0
        Top = 0
        Width = 592
        Height = 284
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        OnClick = synAboutAknowledgmentsClick
        OnKeyDown = synAboutAknowledgmentsKeyDown
        BorderStyle = bsNone
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Terminal'
        Gutter.Font.Style = []
        Gutter.Visible = False
        Gutter.Width = 0
        Lines.UnicodeStrings = 
          'Due the valuable suggestions and carried through works, '#13#10'the Ti' +
          'nn-R project is thankful to:'#13#10' - Anderson R. Barbieri'#13#10' - Andy B' +
          'unn'#13#10' - Bendix Carstensen'#13#10' - Berry Boessenkool'#13#10' - Carolina Sar' +
          't'#243'rio Faria (visual identity of the project)'#13#10' - Douglas Federma' +
          'n'#13#10' - Diethelm Wuertz (editor of 1ed. Tinn-R ebook)'#13#10' - Duncan M' +
          'urdoch'#13#10' - Eric Lacoutre'#13#10' - Frank R. Lawrence'#13#10' - Gabor Grothen' +
          'dieck'#13#10' - Gabriel Moreno'#13#10' - Hiroyuki Kawakatsu'#13#10' - Igor Kojanov' +
          #13#10' - Ivan B. Allaman'#13#10' - Jairo Cugliari'#13#10' - Jan Fiala (PSPad edi' +
          'tor for share code and helps)'#13#10' - Jens Oehlschl'#228'gel'#13#10' - John (JJ' +
          ')'#13#10' - John Cotter (for suggestions and works in the User Guide)'#13 +
          #10' - John Fox'#13#10' - John Hathaway'#13#10' - Jorge Alexandre Wiendl (for a' +
          ' lot of good ideas and works)'#13#10' - Kelly Hildner'#13#10' - Leon Barmuta' +
          #13#10' - Marc Laurencelle'#13#10' - Manuel Salamero'#13#10' - Michael Pomada'#13#10' -' +
          ' Mike Prager'#13#10' - Russel May (founder of the Tinn project)'#13#10' - Sa' +
          'vano S. Pereira'#13#10' - S'#248'ren H'#248'jsgaard'#13#10' - Stefan Ascher'#13#10' - Steven' +
          ' Novick'#13#10' - Suresh Krishna'#13#10' - Teresa Gra'#231'a (for the works in th' +
          'e-R User Guide)'#13#10' - Thomas Petzoldt'#13#10' - Uwe Ligges'#13#10' - Victor Mo' +
          'reno'#13#10' - Wenping Wang'#13#10' - Yves Brostaux'#13#10#13#10'Tinn-R would not be w' +
          'hat it is without all suggestions and works, '#13#10'thanks very much!' +
          ' Tinn-R Team'
        ReadOnly = True
        WordWrap = True
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
    object tbsAboutCredits: TTabSheet
      Caption = 'Credits'
      ImageIndex = 3
      object synAboutCredits: TSynEdit
        Left = 0
        Top = 0
        Width = 592
        Height = 284
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        OnClick = synAboutCreditsClick
        OnKeyDown = synAboutCreditsKeyDown
        BorderStyle = bsNone
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Terminal'
        Gutter.Font.Style = []
        Gutter.Visible = False
        Gutter.Width = 0
        Lines.UnicodeStrings = 
          'INSTITUTIONS'#13#10' - Universidade Estadual de Santa Cruz'#13#10'   UESC/BA' +
          '/BRASIL - http://www.uesc.br/'#13#10' '#13#10' - Conselho Nacional de Desenv' +
          'olvimento Cient'#237'fico e Tecnol'#243'gico'#13#10'   CNPq/BRASIL - http://www.' +
          'cnpq.br/'#13#10' '#13#10' - Escola Superior de Agricultura "Luiz de Queiroz"' +
          #13#10'   ESALQ/USP/SP/BRASIL - http://www4.esalq.usp.br/'#13#10' '#13#10' - Depa' +
          'rtamento de Ci'#234'ncias Exatas'#13#10'   LCE/ESALQ/USP/SP/BRASIL - http:/' +
          '/www.lce.esalq.usp.br/'#13#10' '#13#10' - SourceForge.net - https://sourcefo' +
          'rge.net/'#13#10#13#10'PEOPLE'#13#10' - Bill Venables - CSIRO/AUSTRALIA'#13#10' - Clari' +
          'ce Garcia Borges Dem'#233'trio - LCE/ESALQ/SP/BRASIL'#13#10' - Jakson Alves' +
          ' de Aquino - DCS/UFC/BRASIL'#13#10#13#10'TEAMS OF THE OPEN SOURCE PROJECTS' +
          #13#10' - ATBinHex - Dc, http://atviewer.sourceforge.net/atbinhex.htm' +
          #13#10' - Deplate - Fc, http://deplate.sourceforge.net/index.php'#13#10' - ' +
          'InnoSetup - Is, http://www.jrsoftware.org'#13#10' - JEDI - Dc, http://' +
          'www.delphi-jedi.org'#13#10' - MikTeX - Cp, http://www.miktex.org'#13#10' - S' +
          'ynEdit - Dc, http://synedit.sourceforge.net'#13#10' - Tinn - Te, http:' +
          '//tinn.solarvoid.com'#13#10' - TurboPower Abbrevia - Dc, http://source' +
          'forge.net/projects/tpabbrevia'#13#10' - Txt2tags - Fc, http://txt2tags' +
          '.sourceforge.net'#13#10#13#10'TEAMS OF THE FREEWERE RESOURCES'#13#10' - HotKeyMa' +
          'nager - Dc, http://www.killprog.com/hkme.html'#13#10' - LS Speller - D' +
          'c, http://www.luziusschneider.com/SpellerHome.htm'#13#10' - TEditAlign' +
          ' - Dc, http://www.torry.net'#13#10' - TextDiff - Dc, http://www.users.' +
          'on.net/johnson/delphi/textdiff.html'#13#10' - ToolBar2000 - Dc, http:/' +
          '/www.jrsoftware.org/tb2k.php'#13#10#13#10'SHAREWARE AND FREE PROGRAMS'#13#10' - ' +
          'WinSnap - Ss, http://www.ntwind.com/'#13#10' - FastStone Image Viewer ' +
          '- Ib, http://www.faststone.org/'#13#10#13#10'NOTE'#13#10' Cp: Compilation'#13#10' Dc: ' +
          'Delphi component'#13#10' Fc: File conversor'#13#10' Is: Install setup'#13#10' Ib: ' +
          'Image browser'#13#10' Ss: Screenshots'#13#10' Te: Text editor project'#13#10#13#10'Tin' +
          'n-R would not be what it is without all, '#13#10'thanks very much! Tin' +
          'n-R Team'
        ReadOnly = True
        WordWrap = True
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
    object tbsDonation: TTabSheet
      Caption = 'Donation'
      ImageIndex = 4
      object synAboutDonation: TSynEdit
        Left = 0
        Top = 0
        Width = 592
        Height = 284
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        TabOrder = 0
        OnClick = synAboutDonationClick
        OnKeyDown = synAboutDonationKeyDown
        BorderStyle = bsNone
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Terminal'
        Gutter.Font.Style = []
        Gutter.Visible = False
        Gutter.Width = 0
        Lines.UnicodeStrings = 
          'Tinn-R Editor - GUI for R Language and Environment'#13#10'is a project' +
          ' under GPL and distributed as freeware.'#13#10#13#10'Since creating and ma' +
          'intaining the project involve many'#13#10'costs, donations are welcome' +
          '. If you wish to express your '#13#10'appreciation and to make a donat' +
          'ion, make a credit to:'#13#10'   -------------------------------------' +
          '-------------'#13#10'      JOS'#201' CL'#193'UDIO FARIA'#13#10'   --------------------' +
          '------------------------------'#13#10'      BANCO SANTANDER (BRASIL) S' +
          '.A'#13#10'      AG: 3150'#13#10'      CC: 01088351-7'#13#10'      CPF: 471.262.057' +
          '-91'#13#10'      IBAN: BR57 9040 0888 0315 0001 0883 517 C'#13#10'      SWIF' +
          'T: BSCMBRSP'#13#10'   ------------------------------------------------' +
          '--'
        ReadOnly = True
        WordWrap = True
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
  end
  object bbHelp: TBitBtn
    Left = 447
    Top = 315
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
