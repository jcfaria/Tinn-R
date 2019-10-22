object frmSKH_Manager_Dlg: TfrmSKH_Manager_Dlg
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'S/K/H manager'
  ClientHeight = 282
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbHelp: TBitBtn
    Left = 276
    Top = 251
    Width = 75
    Height = 25
    Caption = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
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
    Left = 426
    Top = 251
    Width = 75
    Height = 25
    Caption = 'O&K'
    Enabled = False
    ModalResult = 1
    TabOrder = 3
    NumGlyphs = 2
  end
  object bbtCancel: TBitBtn
    Left = 501
    Top = 251
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Cancel'
    Default = True
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object bbtCheck: TBitBtn
    Left = 351
    Top = 251
    Width = 75
    Height = 25
    Caption = 'Ch&ek'
    TabOrder = 2
    OnClick = bbtCheckClick
    NumGlyphs = 2
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 576
    Height = 163
    Align = alTop
    Caption = ' Info (Group | Identification | Hint) '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object gbCurrent_info: TGroupBox
      Left = 6
      Top = 14
      Width = 565
      Height = 59
      Caption = ' Current '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      object lbId_Cur: TLabel
        Left = 11
        Top = 19
        Width = 3
        Height = 13
        Color = clBtnFace
        ParentColor = False
      end
      object lbWhere_Cur: TLabel
        Left = 11
        Top = 40
        Width = 3
        Height = 13
      end
    end
    object gbCheck_Info: TGroupBox
      Left = 6
      Top = 76
      Width = 565
      Height = 78
      Caption = ' Check (if in use) '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object lbInUse_Check: TLabel
        Left = 11
        Top = 16
        Width = 3
        Height = 13
        Color = clBtnFace
        ParentColor = False
      end
      object lbId_Check: TLabel
        Left = 11
        Top = 37
        Width = 3
        Height = 13
      end
      object lbWhere_Check: TLabel
        Left = 11
        Top = 58
        Width = 3
        Height = 13
      end
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 163
    Width = 576
    Height = 85
    Align = alTop
    Caption = ' Action '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object gbKeystrokes: TGroupBox
      Left = 6
      Top = 17
      Width = 264
      Height = 62
      Caption = ' Type (keyboard) '
      TabOrder = 0
      OnEnter = gbKeystrokesEnter
    end
    object rgRemove_Current: TRadioGroup
      Left = 276
      Top = 17
      Width = 295
      Height = 62
      Caption = ' Set to Current and remove (if in use: see Check) '
      Columns = 2
      Enabled = False
      ItemIndex = 0
      Items.Strings = (
        'No'
        'Yes')
      TabOrder = 1
    end
  end
end
