object frmR_Server: TfrmR_Server
  Left = 550
  Top = 114
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'R server: conections and tests'
  ClientHeight = 543
  ClientWidth = 501
  Color = 16250871
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 504
    Width = 501
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    Color = 16250871
    ParentBackground = False
    TabOrder = 0
    object bbtRServerSave: TBitBtn
      Left = 325
      Top = 8
      Width = 85
      Height = 27
      Caption = 'Save'
      TabOrder = 0
      OnClick = bbtRServerSaveClick
    end
    object bbtRServerClose: TBitBtn
      Left = 411
      Top = 8
      Width = 85
      Height = 27
      Caption = 'Close'
      TabOrder = 1
      OnClick = bbtRServerCloseClick
    end
  end
  object pgRserver: TJvgPageControl
    Left = 0
    Top = 0
    Width = 501
    Height = 504
    ActivePage = tbsTCPIP
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
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
    object tbsTCPIP: TTabSheet
      Caption = 'TCP/IP'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel2: TPanel
        Left = 0
        Top = 436
        Width = 493
        Height = 40
        Align = alBottom
        BevelOuter = bvNone
        Color = 16250871
        ParentBackground = False
        TabOrder = 0
        object btnConnectTCPIP: TButton
          Left = 151
          Top = 8
          Width = 85
          Height = 27
          Caption = 'Connect'
          TabOrder = 0
          OnClick = btnConnectTCPIPClick
        end
        object btnDisconnectTCPIP: TButton
          Left = 236
          Top = 8
          Width = 85
          Height = 27
          Caption = 'Disconnect'
          TabOrder = 1
          OnClick = btnDisconnectTCPIPClick
        end
        object btnClearMemoTCPIP: TButton
          Left = 321
          Top = 8
          Width = 85
          Height = 27
          Caption = 'Clear output'
          TabOrder = 2
          OnClick = btnClearMemoTCPIPClick
        end
        object btnSendTCPIP: TButton
          Left = 406
          Top = 8
          Width = 85
          Height = 27
          Caption = 'Send'
          Enabled = False
          TabOrder = 3
          OnClick = btnSendTCPIPClick
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 80
        Width = 493
        Height = 356
        Align = alBottom
        Caption = ' R server (output) '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 1
        object memRTCPIP: TMemo
          Left = 1
          Top = 14
          Width = 491
          Height = 314
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBackground
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 0
          OnKeyDown = memRTCPIPKeyDown
        end
        object Panel4: TPanel
          Left = 1
          Top = 328
          Width = 491
          Height = 27
          Align = alBottom
          TabOrder = 1
          object Label11: TLabel
            Left = 6
            Top = 7
            Width = 50
            Height = 13
            Caption = 'Task to R:'
          end
          object edtSend: TEdit
            Left = 60
            Top = 6
            Width = 427
            Height = 17
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            Text = 'search()'
            OnKeyDown = edtSendKeyDown
          end
        end
      end
      object rdgIPType: TRadioGroup
        Left = 0
        Top = 0
        Width = 122
        Height = 79
        Caption = ' Connection (type) '
        Ctl3D = False
        Items.Strings = (
          'Local'
          'Remote')
        ParentCtl3D = False
        TabOrder = 2
        OnClick = rdgIPTypeClick
      end
      object GroupBox1: TGroupBox
        Left = 127
        Top = 0
        Width = 172
        Height = 79
        Caption = ' Parameters (to connection) '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
        object pgIP: TJvgPageControl
          Left = 1
          Top = 14
          Width = 170
          Height = 64
          ActivePage = tbsIPRemote
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          TabOrder = 0
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
          object tbsIPLocal: TTabSheet
            Caption = 'Local'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label3: TLabel
              Left = 6
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Host IP:'
            end
            object Label5: TLabel
              Left = 22
              Top = 18
              Width = 22
              Height = 13
              Caption = 'Port:'
            end
            object edtIPHostLocal: TEdit
              Left = 51
              Top = 1
              Width = 107
              Height = 15
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
            end
            object edtIPPortLocal: TEdit
              Left = 51
              Top = 18
              Width = 107
              Height = 15
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 1
            end
          end
          object tbsIPRemote: TTabSheet
            Caption = 'Remote'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Label14: TLabel
              Left = 6
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Host IP:'
            end
            object Label15: TLabel
              Left = 22
              Top = 18
              Width = 22
              Height = 13
              Caption = 'Port:'
            end
            object edtIPHostRemote: TEdit
              Left = 51
              Top = 1
              Width = 107
              Height = 15
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 0
            end
            object edtIPPortRemote: TEdit
              Left = 51
              Top = 18
              Width = 107
              Height = 15
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 1
            end
          end
        end
      end
      object GroupBox2: TGroupBox
        Left = 304
        Top = 0
        Width = 189
        Height = 79
        Caption = ' Parameters (if connected) '
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        object Label4: TLabel
          Left = 11
          Top = 19
          Width = 55
          Height = 13
          Caption = 'Connected:'
        end
        object Label6: TLabel
          Left = 21
          Top = 38
          Width = 42
          Height = 13
          Caption = 'Client IP:'
        end
        object Label7: TLabel
          Left = 34
          Top = 55
          Width = 29
          Height = 13
          Caption = 'Client:'
        end
        object edtIPClientIP: TEdit
          Left = 71
          Top = 36
          Width = 111
          Height = 15
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ReadOnly = True
          TabOrder = 1
        end
        object edtIPClient: TEdit
          Left = 71
          Top = 54
          Width = 111
          Height = 15
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ReadOnly = True
          TabOrder = 2
        end
        object chbIPConnected: TCheckBox
          Left = 71
          Top = 17
          Width = 17
          Height = 17
          Caption = 'chbIPConnected'
          Enabled = False
          TabOrder = 0
        end
      end
    end
  end
end
