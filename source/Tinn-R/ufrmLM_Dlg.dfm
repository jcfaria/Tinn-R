object frmLM_Dlg: TfrmLM_Dlg
  Left = 0
  Top = 0
  AlphaBlend = True
  BorderStyle = bsDialog
  Caption = 'License manager'
  ClientHeight = 607
  ClientWidth = 419
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
  object btRequest: TBitBtn
    Left = 105
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Request'
    Enabled = False
    TabOrder = 3
    OnClick = btRequestClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 244
    Width = 419
    Height = 98
    Align = alTop
    Caption = ' User* '
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    object Label1: TLabel
      Left = 17
      Top = 18
      Width = 54
      Height = 13
      Caption = 'First name:'
    end
    object Label2: TLabel
      Left = 338
      Top = 58
      Width = 43
      Height = 13
      Caption = 'Country:'
    end
    object Label3: TLabel
      Left = 7
      Top = 38
      Width = 65
      Height = 13
      Caption = 'Organization:'
    end
    object Label4: TLabel
      Left = 44
      Top = 78
      Width = 28
      Height = 13
      Caption = 'email:'
    end
    object Label9: TLabel
      Left = 13
      Top = 58
      Width = 58
      Height = 13
      Caption = 'Occupation:'
    end
    object Label6: TLabel
      Left = 243
      Top = 17
      Width = 53
      Height = 13
      Caption = 'Last name:'
    end
    object edUser_First_Name: TEdit
      Left = 74
      Top = 12
      Width = 161
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edUser_First_NameKeyPress
      OnKeyUp = edUser_First_NameKeyUp
      OnMouseUp = edUser_First_NameMouseUp
    end
    object edUser_Country: TEdit
      Left = 384
      Top = 52
      Width = 23
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 4
      OnKeyPress = edUser_CountryKeyPress
      OnKeyUp = edUser_CountryKeyUp
      OnMouseUp = edUser_CountryMouseUp
    end
    object edUser_Organization: TEdit
      Left = 74
      Top = 32
      Width = 333
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnKeyPress = edUser_OrganizationKeyPress
      OnKeyUp = edUser_OrganizationKeyUp
      OnMouseUp = edUser_OrganizationMouseUp
    end
    object edUser_Email: TEdit
      Left = 74
      Top = 72
      Width = 333
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnKeyUp = edUser_EmailKeyUp
      OnMouseUp = edUser_EmailMouseUp
    end
    object edUser_Occupation: TEdit
      Left = 74
      Top = 52
      Width = 247
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnKeyPress = edUser_OccupationKeyPress
      OnKeyUp = edUser_OccupationKeyUp
      OnMouseUp = edUser_OccupationMouseUp
    end
    object edUser_Last_Name: TEdit
      Left = 299
      Top = 11
      Width = 108
      Height = 19
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 26
      ParentFont = False
      TabOrder = 1
      OnKeyPress = edUser_Last_NameKeyPress
      OnKeyUp = edUser_First_NameKeyUp
      OnMouseUp = edUser_First_NameMouseUp
    end
  end
  object btRegister: TBitBtn
    Left = 274
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Register'
    Default = True
    TabOrder = 5
    OnClick = btRegisterClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 342
    Width = 419
    Height = 230
    Align = alTop
    Caption = ' License '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object Label7: TLabel
      Left = 37
      Top = 211
      Width = 30
      Height = 13
      Caption = 'Serial:'
    end
    object Label10: TLabel
      Left = 14
      Top = 188
      Width = 53
      Height = 13
      Caption = 'Date start:'
    end
    object Label11: TLabel
      Left = 152
      Top = 188
      Width = 48
      Height = 13
      Caption = 'Date end:'
    end
    object Label12: TLabel
      Left = 10
      Top = 104
      Width = 167
      Height = 13
      Caption = '*: All of the above data is required'
    end
    object Label8: TLabel
      Left = 283
      Top = 188
      Width = 53
      Height = 13
      Caption = 'Remaining:'
    end
    object rdgLicense_Type: TRadioGroup
      Left = 8
      Top = 13
      Width = 175
      Height = 88
      Caption = ' Type* '
      Ctl3D = False
      Items.Strings = (
        'Donation (project friends)'
        'Purchase (person or entity)'
        'Free (specific sectors above)'
        'Other (justify)')
      ParentCtl3D = False
      TabOrder = 0
      OnClick = rdgLicense_TypeClick
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 123
      Width = 406
      Height = 51
      Caption = ' Register (received by email) '
      Color = clBtnFace
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object Label5: TLabel
        Left = 17
        Top = 30
        Width = 39
        Height = 13
        Caption = 'Licence:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edUser_Key: TEditAlign
        Left = 62
        Top = 16
        Width = 338
        Height = 31
        MultiLine = True
        WordWrap = True
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object gpbJustificative: TGroupBox
      Left = 187
      Top = 13
      Width = 227
      Height = 88
      Caption = ' Justificative '
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      object edUser_Justificative: TEditAlign
        Left = 6
        Top = 14
        Width = 213
        Height = 69
        MultiLine = True
        WordWrap = True
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyPress = edUser_JustificativeKeyPress
      end
    end
    object edUser_Serial: TEdit
      Left = 70
      Top = 205
      Width = 68
      Height = 19
      ReadOnly = True
      TabOrder = 3
    end
    object edLicense_Start: TEdit
      Left = 70
      Top = 182
      Width = 68
      Height = 19
      ReadOnly = True
      TabOrder = 4
    end
    object edLicense_End: TEdit
      Left = 202
      Top = 182
      Width = 68
      Height = 19
      ReadOnly = True
      TabOrder = 5
    end
    object cbLicence_Notification_End: TCheckBox
      Left = 152
      Top = 208
      Width = 249
      Height = 17
      Caption = 'Notify daily (10 days) before the license expires'
      TabOrder = 6
      OnClick = cbLicence_Notification_EndClick
    end
    object edLicense_Remaining: TEdit
      Left = 338
      Top = 182
      Width = 68
      Height = 19
      ReadOnly = True
      TabOrder = 7
    end
  end
  object btImport_From_File: TBitBtn
    Left = 180
    Top = 576
    Width = 94
    Height = 25
    Caption = 'Import (from file)'
    TabOrder = 4
    OnClick = btImport_From_FileClick
  end
  object synLM: TSynEdit
    Left = 0
    Top = 0
    Width = 419
    Height = 244
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    TabOrder = 6
    OnClick = synLMClick
    BorderStyle = bsNone
    Gutter.Font.Charset = DEFAULT_CHARSET
    Gutter.Font.Color = clWindowText
    Gutter.Font.Height = -11
    Gutter.Font.Name = 'Terminal'
    Gutter.Font.Style = []
    Gutter.Visible = False
    Gutter.Width = 0
    Lines.UnicodeStrings = 
      'Tinn-R project remains free for use in the following sectors:'#13#10'e' +
      'ducational, governmental and non-governmental organizations '#13#10'de' +
      'dicated to the wildlife management and fishing resources.'#13#10'For t' +
      'hese sectors, request a free license (renewed annually).'#13#10#13#10'We i' +
      'nvite the users to give financial support to the project!'#13#10#13#10'The' +
      're are two options, both supplies a licence (renewed annually):'#13 +
      #10'I - Donation (project friends)'#13#10'    - Minimum value: $50'#13#10'    -' +
      ' Suport: project list (discussion group)'#13#10'    - Instructions:'#13#10' ' +
      '     - Help/About/Donation'#13#10'      - https://nbcgib.uesc.br/tinnr' +
      '/en/donation'#13#10#13#10'II - Purchase (person or entity)'#13#10'      - Value:' +
      ' $100'#13#10'      - Suport: priority (if necessary with remote softwa' +
      're)'
    ReadOnly = True
    ScrollBars = ssNone
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
  object BitBtn1: TBitBtn
    Left = 349
    Top = 576
    Width = 70
    Height = 25
    Cancel = True
    Caption = 'O&K'
    Default = True
    ModalResult = 1
    TabOrder = 0
    NumGlyphs = 2
  end
  object tLicence_Check: TJvTimer
    EventTime = tetPost
    Interval = 60000
    OnTimer = tLicence_CheckTimer
    Left = 9
    Top = 575
  end
end
