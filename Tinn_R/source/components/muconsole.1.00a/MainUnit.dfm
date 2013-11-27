object MainForm: TMainForm
  Left = 635
  Top = 124
  Width = 640
  Height = 533
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    624
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object ApplicationLabel: TLabel
    Left = 8
    Top = 12
    Width = 52
    Height = 13
    Caption = 'Application'
  end
  object CommandLabel: TLabel
    Left = 8
    Top = 44
    Width = 47
    Height = 13
    Caption = 'Command'
  end
  object OutputLabel: TLabel
    Left = 16
    Top = 81
    Width = 49
    Height = 13
    Caption = 'Std output'
  end
  object ErrorLabel: TLabel
    Left = 224
    Top = 78
    Width = 40
    Height = 13
    Caption = 'Std error'
  end
  object DebugLabel: TLabel
    Left = 432
    Top = 81
    Width = 32
    Height = 13
    Caption = 'Debug'
  end
  object CommandLineEdit: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'C:\R\R-2.6.1pat\bin\Rterm.exe --no-save'
  end
  object CommandEdit: TEdit
    Left = 64
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'a=rnorm(1e3); a'
  end
  object RunBtn: TButton
    Left = 190
    Top = 6
    Width = 75
    Height = 25
    Caption = 'RunBtn'
    TabOrder = 1
    OnClick = RunBtnClick
  end
  object StopBtn: TButton
    Left = 272
    Top = 6
    Width = 75
    Height = 25
    Caption = 'StopBtn'
    TabOrder = 2
    OnClick = StopBtnClick
  end
  object SendBtn: TButton
    Left = 190
    Top = 38
    Width = 75
    Height = 25
    Caption = 'SendBtn'
    TabOrder = 4
    OnClick = SendBtnClick
  end
  object OutputMemo: TMemo
    Left = 8
    Top = 96
    Width = 201
    Height = 353
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'OutputMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object ErrorMemo: TMemo
    Left = 216
    Top = 96
    Width = 201
    Height = 353
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'ErrorMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object DebugMemo: TMemo
    Left = 424
    Top = 96
    Width = 201
    Height = 353
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'DebugMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object ExitBtn: TButton
    Left = 544
    Top = 464
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Exit'
    TabOrder = 12
    OnClick = ExitBtnClick
  end
  object EnableKillCheck: TCheckBox
    Left = 8
    Top = 460
    Width = 103
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Enable kill'
    TabOrder = 8
    OnClick = EnableKillCheckClick
  end
  object StopOnFreeCheck: TCheckBox
    Left = 8
    Top = 477
    Width = 103
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Stop on free'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = StopOnFreeCheckClick
  end
  object SetTerminateCommandBtn: TButton
    Left = 120
    Top = 464
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Set terminate command'
    TabOrder = 10
    OnClick = SetTerminateCommandBtnClick
  end
  object SetWaitTimeoutBtn: TButton
    Left = 270
    Top = 464
    Width = 148
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Set wait timeout'
    TabOrder = 11
    OnClick = SetWaitTimeoutBtnClick
  end
  object ConsoleIO: TConsoleIO
    OnReceiveOutput = ConsoleIOReceiveOutput
    OnReceiveError = ConsoleIOReceiveError
    OnError = ConsoleIOError
    OnProcessStatusChange = ConsoleIOProcessStatusChange
    TerminateCommand = 'quit()'
    Left = 285
    Top = 41
  end
end
