object frm_ShowInfoUpdate: Tfrm_ShowInfoUpdate
  Left = 317
  Top = 181
  Width = 530
  Height = 453
  HelpContext = 1034
  BorderIcons = []
  Caption = 'mxWebUpdate'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel_Bottom: TPanel
    Left = 0
    Top = 385
    Width = 522
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    OnResize = Panel_BottomResize
    object btn_OK: TButton
      Left = 185
      Top = 10
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btn_Cancel: TButton
      Left = 272
      Top = 10
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 354
    Width = 522
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    BorderStyle = bsSingle
    TabOrder = 1
    object chk_FutureUpdate: TCheckBox
      Left = 8
      Top = 6
      Width = 497
      Height = 17
      Caption = 'chk_FutureUpdate'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 522
    Height = 354
    Align = alClient
    BevelInner = bvSpace
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 2
    object WebBrowser: TWebBrowser
      Left = 2
      Top = 2
      Width = 518
      Height = 350
      Align = alClient
      TabOrder = 0
      ControlData = {
        4C000000893500002C2400000000000000000000000000000000000000000000
        000000004C000000000000000000000001000000E0D057007335CF11AE690800
        2B2E126208000000000000004C0000000114020000000000C000000000000046
        8000000000000000000000000000000000000000000000000000000000000000
        000000000000000001000000000000000000000000000000}
    end
  end
end
