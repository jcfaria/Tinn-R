object frmAppOptions: TfrmAppOptions
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Application options'
  ClientHeight = 525
  ClientWidth = 545
  Color = 16250871
  ParentFont = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bbtOK: TBitBtn
    Left = 398
    Top = 494
    Width = 70
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    NumGlyphs = 2
  end
  object bbtCancel: TBitBtn
    Left = 467
    Top = 494
    Width = 70
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
    NumGlyphs = 2
  end
  object panAppOptions: TPanel
    Left = 0
    Top = 0
    Width = 545
    Height = 489
    Align = alTop
    Color = 16250871
    ParentBackground = False
    TabOrder = 2
    object jtvAppOptions: TJvTreeView
      Left = 1
      Top = 1
      Width = 201
      Height = 487
      Align = alLeft
      Indent = 17
      ReadOnly = True
      TabOrder = 0
      OnChange = jtvAppOptionsChange
      Items.NodeData = {
        0104000000210000000000000000000000FFFFFFFFFFFFFFFF00000000040000
        00044D00610069006E00270000000000000000000000FFFFFFFFFFFFFFFF0000
        00000000000007470065006E006500720061006C002D00000000000000000000
        00FFFFFFFFFFFFFFFF00000000000000000A4100700070006500610072006100
        6E0063006500510000000000000000000000FFFFFFFFFFFFFFFF000000000000
        00001C44006F0063006B002F0046006C006F00610074002000280054006F006F
        006C007300200061006E006400200052007400650072006D0029003D00000000
        00000000000000FFFFFFFFFFFFFFFF000000000000000012460069006C006500
        73002000280065007800740065006E00730069006F006E007300290025000000
        0000000000000000FFFFFFFFFFFFFFFF00000000030000000645006400690074
        006F007200270000000000000000000000FFFFFFFFFFFFFFFF00000000000000
        000744006900730070006C0061007900290000000000000000000000FFFFFFFF
        FFFFFFFF00000000000000000841006400760061006E006300650064002D0000
        000000000000000000FFFFFFFFFFFFFFFF00000000000000000A4B0065007900
        7300740072006F006B00650073001B0000000000000000000000FFFFFFFFFFFF
        FFFF0000000008000000015200290000000000000000000000FFFFFFFFFFFFFF
        FF000000000000000008500061007400680020002800520029002B0000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000009420061007300690063
        002000280052002900330000000000000000000000FFFFFFFFFFFFFFFF000000
        00000000000D5200650073006F00750072006300650073002000280052002900
        310000000000000000000000FFFFFFFFFFFFFFFF00000000000000000C500061
        0063006B00610067006500730020002800520029002100000000000000000000
        00FFFFFFFFFFFFFFFF0000000002000000045200670075006900350000000000
        000000000000FFFFFFFFFFFFFFFF00000000000000000E4F007000740069006F
        006E00730020002800520067007500690029003D0000000000000000000000FF
        FFFFFFFFFFFFFF0000000000000000125200650063006F0067006E0069007400
        69006F006E002000280052006700750069002900230000000000000000000000
        FFFFFFFFFFFFFFFF00000000020000000552007400650072006D003700000000
        00000000000000FFFFFFFFFFFFFFFF00000000000000000F4F00700074006900
        6F006E0073002000280052007400650072006D00290033000000000000000000
        0000FFFFFFFFFFFFFFFF00000000000000000D4500720072006F007200200028
        0052007400650072006D002900250000000000000000000000FFFFFFFFFFFFFF
        FF00000000020000000646006F0072006D00610074002D000000000000000000
        0000FFFFFFFFFFFFFFFF00000000000000000A52002000280046006F0072006D
        006100740029002F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
        0000000B520064002000280046006F0072006D00610074002900290000000000
        000000000000FFFFFFFFFFFFFFFF000000000000000008520020007300650072
        007600650072002D0000000000000000000000FFFFFFFFFFFFFFFF0000000002
        0000000A500072006F00630065007300730069006E0067002D00000000000000
        00000000FFFFFFFFFFFFFFFF00000000040000000A43006F006E007600650072
        00730069006F006E00270000000000000000000000FFFFFFFFFFFFFFFF000000
        0000000000074400650070006C00610074006500250000000000000000000000
        FFFFFFFFFFFFFFFF000000000000000006500061006E0064006F006300290000
        000000000000000000FFFFFFFFFFFFFFFF000000000000000008540078007400
        320074006100670073003B0000000000000000000000FFFFFFFFFFFFFFFF0000
        000000000000114D006F00720065002000280063006F006E0076006500720073
        0069006F006E002900230000000000000000000000FFFFFFFFFFFFFFFF000000
        0003000000054C0061007400650078002F0000000000000000000000FFFFFFFF
        FFFFFFFF00000000000000000B440056004900200028006C0061007400650078
        0029002F0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000B
        500044004600200028006C006100740065007800290031000000000000000000
        0000FFFFFFFFFFFFFFFF00000000000000000C4D006F0072006500200028006C
        0061007400650078002900}
      LineColor = clScrollBar
      PageControl = pgApp
    end
    object pgApp: TJvgPageControl
      Left = 202
      Top = 1
      Width = 342
      Height = 487
      ActivePage = tbsAppOptionsRterm
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Style = tsFlatButtons
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
      TabSelectedStyle.BackgrColor = clActiveCaption
      TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
      TabSelectedStyle.Font.Color = clBtnText
      TabSelectedStyle.Font.Height = -11
      TabSelectedStyle.Font.Name = 'Arial'
      TabSelectedStyle.Font.Style = []
      TabSelectedStyle.CaptionHAlign = fhaCenter
      TabSelectedStyle.Gradient.Active = False
      TabSelectedStyle.Gradient.Orientation = fgdHorizontal
      Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
      object tbsAppGeneral: TTabSheet
        Caption = 'General'
        ImageIndex = 3
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 102
          Align = alTop
          Caption = ' Remember '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object lblLastFile: TLabel
            Left = 52
            Top = 21
            Width = 50
            Height = 13
            Caption = 'Last file(s)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object lblLastSearch: TLabel
            Left = 52
            Top = 49
            Width = 74
            Height = 13
            Caption = 'Last search(es)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object btnMRUClear: TButton
            Left = 250
            Top = 11
            Width = 78
            Height = 22
            Caption = 'Clear history'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = btnMRUClearClick
          end
          object tbLastFile: TTrackBar
            Left = 1
            Top = 18
            Width = 48
            Height = 25
            Min = 1
            PageSize = 1
            Position = 1
            TabOrder = 1
            ThumbLength = 16
            OnChange = tbLastFileChange
          end
          object tbLastSearch: TTrackBar
            Left = 1
            Top = 46
            Width = 48
            Height = 25
            Min = 1
            PageSize = 1
            Position = 1
            TabOrder = 2
            ThumbLength = 16
            OnChange = tbLastSearchChange
          end
          object cbRememberSearchList: TCheckBox
            Left = 11
            Top = 76
            Width = 72
            Height = 18
            Caption = 'Search list'
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
        end
        object GroupBox5: TGroupBox
          Left = 0
          Top = 102
          Width = 334
          Height = 113
          Align = alTop
          Caption = ' Settings '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object cbRemoveExtension: TCheckBox
            Left = 11
            Top = 34
            Width = 177
            Height = 18
            Caption = 'Remove extension for '#39'Save as'#39
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object cbUndoAfterSave: TCheckBox
            Left = 11
            Top = 52
            Width = 102
            Height = 18
            Caption = 'Undo after save'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object cbMinimizeTinn: TCheckBox
            Left = 11
            Top = 70
            Width = 173
            Height = 18
            Caption = 'Minimize after the last file closed'
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
          end
          object cbRememberFileState: TCheckBox
            Left = 11
            Top = 16
            Width = 118
            Height = 18
            Caption = 'Remember file state'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbConnectionBeepOnError: TCheckBox
            Left = 11
            Top = 89
            Width = 316
            Height = 18
            Caption = 'Beep if no internet connection (to important procedures only)'
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 215
          Width = 334
          Height = 62
          Align = alTop
          Caption = ' Comments (language that have options) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object cbComPriority_Line: TCheckBox
            Left = 11
            Top = 38
            Width = 190
            Height = 18
            Caption = 'When both available priority to line'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbComAutoDetect_Language: TCheckBox
            Left = 11
            Top = 19
            Width = 202
            Height = 17
            Caption = 'Auto detect language (recomended)'
            TabOrder = 1
          end
        end
        object gpbDelay: TGroupBox
          Left = 0
          Top = 339
          Width = 334
          Height = 70
          Align = alTop
          Caption = ' Computational synchronization (delay) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          object lbDelay: TLabel
            Left = 292
            Top = 37
            Width = 13
            Height = 13
            Caption = 'ms'
          end
          object tbDelay: TJvColorTrackBar
            Left = 9
            Top = 24
            Width = 276
            Height = 30
            ArrowColor = clNavy
            BorderStyle = bsNone
            ColorFrom = clGreen
            ColorTo = clRed
            Min = 50
            Max = 350
            Position = 50
            OnPosChange = tbDelayPosChange
          end
        end
        object GroupBox10: TGroupBox
          Left = 0
          Top = 277
          Width = 334
          Height = 62
          Align = alTop
          Caption = ' File status/changes (made by external) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          object cbNotification_US: TCheckBox
            Left = 11
            Top = 38
            Width = 101
            Height = 18
            Hint = 'Options: update silently satus/changes (made by external)'
            Caption = 'Update silently'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbNotification: TCheckBox
            Left = 11
            Top = 19
            Width = 115
            Height = 17
            Hint = 'Options: notification file status/changes (made by external)'
            Caption = 'Enable notification'
            TabOrder = 1
            OnClick = cbNotificationClick
          end
        end
      end
      object tbsAppearance: TTabSheet
        Caption = 'Appearance'
        ImageIndex = 24
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox20: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 163
          Align = alTop
          Caption = ' Colors '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 7
            Top = 14
            Width = 318
            Height = 83
            Caption = ' Application (extensive texts only) '
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            object shFGApplication: TtrShape
              Left = 16
              Top = 22
              Width = 125
              Height = 23
              Shape = stRoundRect
              OnMouseUp = shFGApplicationMouseUp
              Caption = 'FG (choice)'
            end
            object shBGApplication: TtrShape
              Left = 16
              Top = 47
              Width = 125
              Height = 23
              Shape = stRoundRect
              OnMouseUp = shBGApplicationMouseUp
              Caption = 'BG (choice)'
            end
            object shSampleApplication: TtrShape
              Left = 165
              Top = 22
              Width = 135
              Height = 48
              Shape = stRoundRect
              Caption = 'Sample'
            end
          end
          object GroupBox2: TGroupBox
            Left = 7
            Top = 98
            Width = 318
            Height = 55
            Caption = ' Tabs selected (for all) '
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 1
            object shBGTabSelected: TtrShape
              Left = 16
              Top = 21
              Width = 125
              Height = 23
              Shape = stRoundRect
              OnMouseUp = shBGTabSelectedMouseUp
              Caption = 'BG (choice)'
            end
          end
        end
        object GroupBox21: TGroupBox
          Left = 0
          Top = 163
          Width = 334
          Height = 70
          Align = alTop
          Caption = ' Transparency (%) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object lbTransparency: TLabel
            Left = 300
            Top = 37
            Width = 11
            Height = 13
            Caption = '%'
          end
          object tbTransparency: TJvColorTrackBar
            Tag = 20
            Left = 9
            Top = 24
            Width = 284
            Height = 30
            ArrowColor = clNavy
            BorderStyle = bsNone
            ColorTo = clWhite
            Max = 90
            OnPosChange = tbTransparencyPosChange
          end
        end
      end
      object tbsAppDock: TTabSheet
        Caption = 'Dock/Float (Tools and Rterm)'
        ImageIndex = 5
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox8: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 219
          Align = alTop
          Caption = ' Restore (default disposition) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object cbRestoreIniDock: TCheckBox
            Left = 11
            Top = 18
            Width = 99
            Height = 18
            Caption = 'Restore'
            TabOrder = 0
          end
          object Memo1: TMemo
            Left = 8
            Top = 38
            Width = 314
            Height = 179
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = 16250871
            Lines.Strings = (
              'Mark this option to restore the default configuration of'
              'Tools and Rterm'
              ' panels in the next time when starting the apllicative.'
              '    '
              
                'When Tinn-R starts again, this option will first to remove the f' +
                'ile'
              'Tinn-R_dock.ini from the ini folder'
              'and it will be recreated, according with the user arrangment,'
              'when closing normaly.'
              ''
              'It is useful if some problem occur with the new resources'
              '(dock/hide and place).'
              ''
              'Remember: Tinn-R needs to be restarted manually!')
            ReadOnly = True
            TabOrder = 1
          end
        end
        object GroupBox22: TGroupBox
          Left = 0
          Top = 219
          Width = 334
          Height = 61
          Align = alTop
          Caption = ' Enable float (interface/panel) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object cbToolsCanFloat: TCheckBox
            Left = 11
            Top = 18
            Width = 58
            Height = 17
            Caption = 'Tools'
            TabOrder = 0
          end
          object cbRtermCanFloat: TCheckBox
            Left = 11
            Top = 38
            Width = 58
            Height = 17
            Caption = 'Rterm'
            TabOrder = 1
          end
        end
      end
      object tbsAppFilesExtensions: TTabSheet
        Caption = 'Files (extensions)'
        ImageIndex = 21
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object GroupBox18: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 477
          Align = alClient
          Caption = ' Files (extensions recognized) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object mFiles: TMemo
            Left = 4
            Top = 16
            Width = 323
            Height = 459
            BorderStyle = bsNone
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object tbsEditorDisplay: TTabSheet
        Caption = 'Display'
        ImageIndex = 21
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gbRightEdge: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 170
          Align = alTop
          Caption = ' General '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object Label11: TLabel
            Left = 141
            Top = 27
            Width = 54
            Height = 13
            Caption = 'Edge color:'
          end
          object Label12: TLabel
            Left = 9
            Top = 27
            Width = 64
            Height = 13
            Caption = 'Edge column:'
          end
          object Label13: TLabel
            Left = 141
            Top = 56
            Width = 54
            Height = 13
            Caption = 'Extra lines:'
          end
          object Label16: TLabel
            Left = 24
            Top = 56
            Width = 51
            Height = 13
            Caption = 'Tab width:'
          end
          object pRightEdgeBack: TPanel
            Left = 200
            Top = 24
            Width = 50
            Height = 21
            BorderWidth = 1
            TabOrder = 1
            object sRightEdgeColor: TShape
              Left = 2
              Top = 2
              Width = 36
              Height = 17
              Align = alClient
              OnMouseUp = sRightEdgeColorMouseUp
            end
            object btnRightEdge: TPanel
              Left = 38
              Top = 2
              Width = 10
              Height = 17
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object imGeneral: TImage
                Left = 3
                Top = 6
                Width = 5
                Height = 5
                Picture.Data = {
                  07544269746D61708A000000424D8A0000000000000076000000280000000500
                  0000050000000100040000000000140000000000000000000000100000001000
                  0000000000000000800000800000008080008000000080008000808000008080
                  8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00DDDDD000DD0DD000D000D00000000000DDDDD000}
                Transparent = True
                OnMouseDown = imGeneralMouseDown
              end
            end
          end
          object eRightEdge: TEdit
            Left = 80
            Top = 27
            Width = 28
            Height = 14
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            Text = '0'
          end
          object eLineSpacing: TEdit
            Left = 200
            Top = 56
            Width = 28
            Height = 14
            BorderStyle = bsNone
            TabOrder = 3
            Text = '0'
          end
          object eTabWidth: TEdit
            Left = 80
            Top = 56
            Width = 28
            Height = 14
            BorderStyle = bsNone
            TabOrder = 2
            Text = '8'
          end
          object btnFont: TButton
            Left = 1
            Top = 84
            Width = 332
            Height = 25
            Align = alBottom
            Caption = 'Select editor font'
            TabOrder = 4
            OnClick = btnFontClick
          end
          object panLabFont: TPanel
            Left = 1
            Top = 109
            Width = 332
            Height = 60
            Align = alBottom
            BevelOuter = bvLowered
            Color = 16250871
            ParentBackground = False
            TabOrder = 5
            object labFont: TLabel
              Left = 83
              Top = 23
              Width = 126
              Height = 17
              BiDiMode = bdLeftToRight
              Caption = 'Courier New 11'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Courier New'
              Font.Style = []
              ParentBiDiMode = False
              ParentFont = False
              Transparent = True
            end
          end
        end
        object gbGutter: TGroupBox
          Left = 0
          Top = 170
          Width = 334
          Height = 201
          Align = alTop
          Caption = ' Gutter '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object Label17: TLabel
            Left = 136
            Top = 23
            Width = 61
            Height = 13
            Caption = 'Gutter color:'
          end
          object ckGutterAutosize: TCheckBox
            Left = 200
            Top = 49
            Width = 118
            Height = 17
            Caption = 'Autosize'
            TabOrder = 1
          end
          object ckGutterShowLineNumbers: TCheckBox
            Left = 11
            Top = 69
            Width = 118
            Height = 17
            Caption = 'Show line numbers'
            TabOrder = 2
          end
          object ckGutterShowLeaderZeros: TCheckBox
            Left = 11
            Top = 89
            Width = 118
            Height = 17
            Caption = 'Show leading zeros'
            TabOrder = 4
          end
          object ckGutterStartAtZero: TCheckBox
            Left = 200
            Top = 69
            Width = 118
            Height = 17
            Caption = 'Start at zero'
            TabOrder = 3
          end
          object ckGutterVisible: TCheckBox
            Left = 11
            Top = 49
            Width = 118
            Height = 17
            Caption = 'Visible'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object cbGutterFont: TCheckBox
            Left = 200
            Top = 89
            Width = 118
            Height = 17
            Caption = 'Use gutter font'
            TabOrder = 5
          end
          object btnGutterFont: TButton
            Left = 1
            Top = 115
            Width = 332
            Height = 25
            Align = alBottom
            Caption = 'Select gutter font'
            TabOrder = 7
            OnClick = btnGutterFontClick
          end
          object pGutterBack: TPanel
            Left = 200
            Top = 19
            Width = 52
            Height = 21
            BorderWidth = 1
            TabOrder = 6
            object sGutterColor: TShape
              Left = 2
              Top = 2
              Width = 38
              Height = 17
              Align = alClient
              OnMouseUp = sGutterColorMouseUp
            end
            object btnGutterColor: TPanel
              Left = 40
              Top = 2
              Width = 10
              Height = 17
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 0
              object imGutter: TImage
                Left = 3
                Top = 6
                Width = 5
                Height = 5
                Picture.Data = {
                  07544269746D61708A000000424D8A0000000000000076000000280000000500
                  0000050000000100040000000000140000000000000000000000100000001000
                  0000000000000000800000800000008080008000000080008000808000008080
                  8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00DDDDD000DD0DD000D000D00000000000DDDDD000}
                Transparent = True
                OnMouseDown = imGutterMouseDown
              end
            end
          end
          object panGutterFont: TPanel
            Left = 1
            Top = 140
            Width = 332
            Height = 60
            Align = alBottom
            BevelOuter = bvLowered
            Color = 16250871
            ParentBackground = False
            TabOrder = 8
            object lblGutterFont: TLabel
              Left = 107
              Top = 24
              Width = 91
              Height = 14
              Caption = 'Courier New 8'
              Color = clBtnFace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
          end
        end
        object rdgLineWraping: TRadioGroup
          Left = 0
          Top = 371
          Width = 334
          Height = 43
          Align = alTop
          Caption = ' Line wraping '
          Columns = 2
          Ctl3D = False
          ItemIndex = 1
          Items.Strings = (
            'Yes'
            'No')
          ParentCtl3D = False
          TabOrder = 2
        end
      end
      object tbsEditorAdvanced: TTabSheet
        Caption = 'Advanced'
        ImageIndex = 22
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label23: TLabel
          Left = 0
          Top = 321
          Width = 273
          Height = 13
          Caption = '* Toggle Insert/Overwrite mode by pressing the key: Ins'
        end
        object gbOptions: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 247
          Align = alTop
          Caption = ' Options '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object ckAutoIndent: TCheckBox
            Left = 11
            Top = 15
            Width = 130
            Height = 17
            Hint = 
              'Will indent the caret on new lines with the same amount of leadi' +
              'ng white space as the preceding line'
            Caption = 'Auto indent'
            TabOrder = 0
          end
          object ckDragAndDropEditing: TCheckBox
            Left = 11
            Top = 53
            Width = 130
            Height = 17
            Hint = 
              'Allows you to select a block of text and drag it within the docu' +
              'ment to another location'
            Caption = 'Drag and drop editing'
            TabOrder = 2
          end
          object ckAutoSizeMaxWidth: TCheckBox
            Left = 11
            Top = 34
            Width = 130
            Height = 17
            Hint = 'Allows the editor accept OLE file drops'
            Caption = 'Auto size scroll width'
            TabOrder = 1
          end
          object ckHalfPageScroll: TCheckBox
            Left = 182
            Top = 15
            Width = 130
            Height = 17
            Hint = 
              'When scrolling with page-up and page-down commands, only scroll ' +
              'a half page at a time'
            Caption = 'Half page scroll'
            TabOrder = 12
          end
          object ckEnhanceEndKey: TCheckBox
            Left = 11
            Top = 186
            Width = 130
            Height = 17
            Hint = 'Makes it so the caret is never visible'
            Caption = 'Enhance End Key'
            TabOrder = 9
          end
          object ckScrollByOneLess: TCheckBox
            Left = 182
            Top = 34
            Width = 130
            Height = 17
            Hint = 'Forces scrolling to be one less'
            Caption = 'Scroll by one less'
            TabOrder = 13
          end
          object ckScrollPastEOF: TCheckBox
            Left = 182
            Top = 53
            Width = 130
            Height = 17
            Hint = 'Allows the cursor to go past the end of file marker'
            Caption = 'Scroll past end of file'
            TabOrder = 14
          end
          object ckScrollPastEOL: TCheckBox
            Left = 182
            Top = 72
            Width = 130
            Height = 17
            Hint = 
              'Allows the cursor to go past the last character into the white s' +
              'pace at the end of a line'
            Caption = 'Scroll past end of line'
            TabOrder = 15
          end
          object ckShowScrollHint: TCheckBox
            Left = 182
            Top = 91
            Width = 130
            Height = 17
            Hint = 
              'Shows a hint of the visible line numbers when scrolling vertical' +
              'ly'
            Caption = 'Show scroll hint'
            TabOrder = 16
          end
          object ckSmartTabs: TCheckBox
            Left = 11
            Top = 129
            Width = 130
            Height = 17
            Hint = 
              'When tabbing, the cursor will go to the next non-white space cha' +
              'racter of the previous line'
            Caption = 'Smart tabs'
            TabOrder = 6
          end
          object ckTabsToSpaces: TCheckBox
            Left = 182
            Top = 129
            Width = 130
            Height = 17
            Hint = 'Converts a tab character to the number of spaces in Tab Width'
            Caption = 'Tabs to spaces'
            TabOrder = 18
          end
          object ckTrimTrailingSpaces: TCheckBox
            Left = 182
            Top = 148
            Width = 130
            Height = 17
            Hint = 'Spaces at the end of lines will be trimmed and not saved'
            Caption = 'Trim trailing spaces'
            TabOrder = 19
          end
          object ckWantTabs: TCheckBox
            Left = 11
            Top = 110
            Width = 170
            Height = 17
            Hint = 
              'Let the editor accept tab characters instead of going to the nex' +
              't control'
            Caption = 'Want tabs (ind./unind. selec.)'
            TabOrder = 5
          end
          object ckAltSetsColumnMode: TCheckBox
            Left = 11
            Top = 72
            Width = 130
            Height = 17
            Hint = 
              'Holding down the Alt Key will put the selection mode into column' +
              'ar format'
            Caption = 'Alt sets column mode'
            TabOrder = 3
          end
          object ckKeepCaretX: TCheckBox
            Left = 11
            Top = 91
            Width = 130
            Height = 17
            Hint = 
              'When moving through lines the X position will always stay the sa' +
              'me'
            Caption = 'Maintain caret column'
            TabOrder = 4
          end
          object ckScrollHintFollows: TCheckBox
            Left = 182
            Top = 110
            Width = 138
            Height = 17
            Hint = 'The scroll hint follows the mouse when scrolling vertically'
            Caption = 'Scroll hint follows mouse'
            TabOrder = 17
          end
          object ckGroupUndo: TCheckBox
            Left = 182
            Top = 167
            Width = 130
            Height = 17
            Hint = 
              'When undoing/redoing actions, handle all continous changes of th' +
              'e same kind in one call instead undoing/redoing each command sep' +
              'arately'
            Caption = 'Group undo'
            TabOrder = 20
          end
          object ckSmartTabDelete: TCheckBox
            Left = 11
            Top = 148
            Width = 157
            Height = 17
            Hint = 'similar to Smart Tabs, but when you delete characters'
            Caption = 'Backspace to last character'
            TabOrder = 7
          end
          object ckRightMouseMoves: TCheckBox
            Left = 182
            Top = 186
            Width = 146
            Height = 17
            Hint = 
              'When clicking with the right mouse for a popup menu, move the cu' +
              'rsor to that location'
            Caption = 'Right mouse moves cursor'
            TabOrder = 21
          end
          object ckEnhanceHomeKey: TCheckBox
            Left = 11
            Top = 167
            Width = 146
            Height = 17
            Hint = 'enhances home key positioning, similar to visual studio'
            Caption = 'Enhance Home Key'
            TabOrder = 8
          end
          object ckHideShowScrollbars: TCheckBox
            Left = 11
            Top = 205
            Width = 156
            Height = 17
            Hint = 
              'if enabled, then the scrollbars will only show when necessary.  ' +
              'If you have ScrollPastEOL, then it the horizontal bar will alway' +
              's be there (it uses MaxLength instead)'
            Caption = 'Hide scrollbars as necessary'
            TabOrder = 10
          end
          object ckDisableScrollArrows: TCheckBox
            Left = 11
            Top = 224
            Width = 130
            Height = 17
            Hint = 
              'Disables the scroll bar arrow buttons when you can'#39't scroll in t' +
              'hat direction any more'
            Caption = 'Disable scroll arrows'
            TabOrder = 11
          end
          object ckShowSpecialChars: TCheckBox
            Left = 182
            Top = 205
            Width = 130
            Height = 17
            Hint = 'Shows linebreaks, spaces and tabs using special symbols'
            Caption = 'Show special chars'
            TabOrder = 22
          end
          object ckAutocomplete: TCheckBox
            Left = 182
            Top = 224
            Width = 135
            Height = 17
            Hint = 'Auto complete (  [  '#39'  "'
            Caption = 'Auto completion ( [ { '#39' "'
            TabOrder = 23
          end
        end
        object gbCaret: TGroupBox
          Left = 0
          Top = 247
          Width = 334
          Height = 70
          Align = alTop
          Caption = ' Caret* '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object Label18: TLabel
            Left = 56
            Top = 19
            Width = 61
            Height = 13
            Caption = 'Insert caret:'
          end
          object Label19: TLabel
            Left = 37
            Top = 43
            Width = 80
            Height = 13
            Caption = 'Overwrite caret:'
          end
          object cInsertCaret: TComboBox
            Left = 120
            Top = 15
            Width = 205
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            Items.Strings = (
              'Vertical Line'
              'Horizontal Line'
              'Half Block'
              'Block')
          end
          object cOverwriteCaret: TComboBox
            Left = 120
            Top = 39
            Width = 205
            Height = 21
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 1
            Items.Strings = (
              'Vertical Line'
              'Horizontal Line'
              'Half Block'
              'Block')
          end
        end
      end
      object tbsEditorKeystrokes: TTabSheet
        Caption = 'Keystrokes'
        ImageIndex = 23
        TabVisible = False
        object Label20: TLabel
          Left = 3
          Top = 363
          Width = 127
          Height = 13
          Caption = '*   ec = execute command'
        end
        object Label24: TLabel
          Left = 4
          Top = 379
          Width = 226
          Height = 13
          Caption = '** Some may be overlaid by the main program!'
        end
        object pnlCommands: TPanel
          Left = 0
          Top = 0
          Width = 334
          Height = 362
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'pnlCommands'
          TabOrder = 0
          object lvKeystrokes: TListView
            Left = 2
            Top = 2
            Width = 330
            Height = 358
            Align = alClient
            BevelInner = bvNone
            BorderStyle = bsNone
            Columns = <
              item
                Caption = 'Command*'
                Width = 160
              end
              item
                Caption = 'Keystroke**'
                Width = 152
              end>
            ColumnClick = False
            HideSelection = False
            ReadOnly = True
            RowSelect = True
            SortType = stText
            TabOrder = 0
            ViewStyle = vsReport
            OnChanging = lvKeystrokesChanging
            OnSelectItem = lvKeystrokesSelectItem
          end
        end
        object btnUpdateKey: TButton
          Left = 264
          Top = 367
          Width = 68
          Height = 25
          Caption = 'Update'
          TabOrder = 1
          OnClick = btnUpdateKeyClick
        end
        object gbKeyStrokes: TGroupBox
          Left = 1
          Top = 399
          Width = 331
          Height = 76
          Caption = ' Options '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object Label21: TLabel
            Left = 43
            Top = 20
            Width = 51
            Height = 13
            Caption = 'Command:'
          end
          object Label22: TLabel
            Left = 42
            Top = 48
            Width = 52
            Height = 13
            Caption = 'Keystroke:'
          end
          object cbCommands: TComboBox
            Left = 100
            Top = 17
            Width = 185
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            ItemHeight = 0
            Sorted = True
            TabOrder = 0
            OnExit = cbCommandsExit
            OnKeyPress = cbCommandsKeyPress
            OnKeyUp = cbCommandsKeyUp
          end
        end
      end
      object tbsAppPathR: TTabSheet
        Caption = 'Path (R)'
        ImageIndex = 8
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbPathRTerm: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 117
          Align = alTop
          Caption = ' Parameters and path (Rterm.exe) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edPathRTerm: TEditAlign
            Left = 13
            Top = 52
            Width = 306
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object bbtRTermPath: TBitBtn
            Left = 13
            Top = 83
            Width = 307
            Height = 25
            Caption = 'Search path'
            TabOrder = 3
            OnClick = bbtRTermPathClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
          object edParRTerm: TEditAlign
            Left = 13
            Top = 21
            Width = 178
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtRTermDefault: TButton
            Left = 194
            Top = 21
            Width = 125
            Height = 29
            Caption = 'Restore default'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = bbtRTermDefaultClick
          end
        end
        object gpbPathRGui: TGroupBox
          Left = 0
          Top = 117
          Width = 334
          Height = 117
          Align = alTop
          Caption = ' Parameters and path (Rgui.exe) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object edPathRGui: TEditAlign
            Left = 13
            Top = 52
            Width = 306
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object bbtRGuiPath: TBitBtn
            Left = 13
            Top = 83
            Width = 307
            Height = 25
            Caption = 'Search path'
            TabOrder = 3
            OnClick = bbtRGuiPathClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
          object edParRGui: TEditAlign
            Left = 13
            Top = 21
            Width = 178
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtRGuiDefault: TButton
            Left = 194
            Top = 21
            Width = 125
            Height = 29
            Caption = 'Restore default'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = bbtRGuiDefaultClick
          end
        end
        object rdgRUseLatest: TRadioGroup
          Left = 0
          Top = 234
          Width = 334
          Height = 41
          Align = alTop
          Caption = ' Use latest installed version (always) '
          Columns = 2
          Ctl3D = False
          Items.Strings = (
            'Yes'
            'No')
          ParentCtl3D = False
          TabOrder = 2
          OnClick = rdgRUseLatestClick
        end
        object rdgRArchitecture: TRadioGroup
          Left = 0
          Top = 275
          Width = 334
          Height = 41
          Align = alTop
          Caption = ' Architecture (bit) '
          Columns = 2
          Ctl3D = False
          Items.Strings = (
            'i386 (32)'
            'x64 (64)')
          ParentCtl3D = False
          TabOrder = 3
          OnClick = rdgRArchitectureClick
        end
        object GroupBox16: TGroupBox
          Left = 0
          Top = 316
          Width = 334
          Height = 55
          Align = alTop
          Caption = ' R (connected) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 4
          object edPathR_Connected: TEditAlign
            Left = 13
            Top = 17
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object tbsAppBasicR: TTabSheet
        Caption = 'Basic (R)'
        ImageIndex = 9
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label10: TLabel
          Left = 0
          Top = 355
          Width = 120
          Height = 13
          Caption = '*     Highly recommended'
        end
        object Label4: TLabel
          Left = 0
          Top = 385
          Width = 170
          Height = 13
          Caption = '*** Remember: R is case sensitive!'
        end
        object Label6: TLabel
          Left = 0
          Top = 370
          Width = 117
          Height = 13
          Caption = '**   Changes are sparse'
        end
        object gpbMaxDeparseLength: TGroupBox
          Left = 0
          Top = 156
          Width = 334
          Height = 47
          Align = alTop
          Caption = ' Option (max.deparse.length (echo=TRUE)) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edMaxDeparseLength: TEdit
            Left = 16
            Top = 20
            Width = 102
            Height = 19
            TabOrder = 0
            OnKeyPress = edMaxDeparseLengthKeyPress
          end
        end
        object GroupBox9: TGroupBox
          Left = 0
          Top = 203
          Width = 334
          Height = 151
          Align = alTop
          Caption = ' Tip and data completion '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object gpbRTriggers: TGroupBox
            Left = 6
            Top = 17
            Width = 320
            Height = 66
            Caption = ' Triggers '
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 0
            object Label3: TLabel
              Left = 118
              Top = 19
              Width = 92
              Height = 13
              Caption = 'Tip: after '#39'('#39' symbol'
            end
            object Label8: TLabel
              Left = 118
              Top = 41
              Width = 157
              Height = 13
              Caption = 'Data completion: after '#39'$'#39' symbol'
            end
            object cbbTriggerRTip: TComboBox
              Left = 9
              Top = 16
              Width = 104
              Height = 21
              BevelInner = bvNone
              BevelOuter = bvNone
              Style = csDropDownList
              ItemHeight = 0
              Sorted = True
              TabOrder = 0
              Items.Strings = (
                'CTRL+D'
                'CTRL+Q')
            end
            object cbbTriggerRDataCompletion: TComboBox
              Left = 9
              Top = 38
              Width = 104
              Height = 21
              BevelInner = bvNone
              BevelOuter = bvNone
              Style = csDropDownList
              ItemHeight = 0
              Sorted = True
              TabOrder = 1
              Items.Strings = (
                'SHIFT+CTRL+D'
                'SHIFT+CTRL+Q')
            end
          end
          object rdgDataCompletion_Pattern: TRadioGroup
            Left = 6
            Top = 88
            Width = 320
            Height = 55
            Caption = ' Data completion (partial pattern after $X + Trigger)*** '
            Ctl3D = False
            ItemIndex = 0
            Items.Strings = (
              'Find the pattern X anywhere (recomended)'
              'Just starting by the pattern X')
            ParentCtl3D = False
            TabOrder = 1
          end
        end
        object GroupBox19: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 156
          Align = alTop
          Caption = ' Baisc (when startup/detected) and R is running '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object cbRsetget_Info: TCheckBox
            Left = 11
            Top = 18
            Width = 302
            Height = 17
            Caption = 'Set R environment and get essential information about* '
            TabOrder = 0
          end
          object cbRmirros_Update: TCheckBox
            Left = 11
            Top = 36
            Width = 147
            Height = 17
            Caption = 'CRAN mirrors update** '
            TabOrder = 1
          end
          object cbRSetWorkDir_Starting: TCheckBox
            Left = 11
            Top = 55
            Width = 209
            Height = 17
            Caption = 'Set workdir to the path of current file'
            TabOrder = 2
          end
          object cbAllNames: TCheckBox
            Left = 11
            Top = 74
            Width = 163
            Height = 18
            Caption = 'R explorer (all.names=TRUE)'
            TabOrder = 3
          end
          object cbRSendAll: TCheckBox
            Left = 11
            Top = 93
            Width = 112
            Height = 18
            Caption = 'Send all coments'
            TabOrder = 4
          end
          object cbRSmartSend: TCheckBox
            Left = 11
            Top = 112
            Width = 189
            Height = 18
            Caption = 'Send smart (selection, blocks, etc)'
            TabOrder = 5
          end
          object cbScrollSendingLines: TCheckBox
            Left = 11
            Top = 131
            Width = 189
            Height = 18
            Caption = 'Scroll automatically (send line)'
            TabOrder = 6
          end
        end
      end
      object tbsAppResourcesR: TTabSheet
        Caption = 'Resources (R)'
        ImageIndex = 10
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gbSendR: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 184
          Align = alTop
          Caption = ' Send (resources visibles) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object cbRSendSourceFile: TCheckBox
            Left = 11
            Top = 15
            Width = 79
            Height = 17
            Caption = 'File (source)'
            TabOrder = 0
          end
          object cbRSendSourceSelection: TCheckBox
            Left = 11
            Top = 33
            Width = 107
            Height = 17
            Caption = 'Selection (source)'
            TabOrder = 2
          end
          object cbRSendSourceBlockMarked: TCheckBox
            Left = 11
            Top = 69
            Width = 128
            Height = 17
            Caption = 'Marked block (source)'
            TabOrder = 6
          end
          object cbRSendLine: TCheckBox
            Left = 11
            Top = 105
            Width = 43
            Height = 17
            Caption = 'Line'
            TabOrder = 10
          end
          object cbRSendCursorToEndLine: TCheckBox
            Left = 164
            Top = 141
            Width = 108
            Height = 17
            Caption = 'Cursor to end line'
            TabOrder = 14
          end
          object cbRSendFile: TCheckBox
            Left = 164
            Top = 16
            Width = 40
            Height = 17
            Caption = 'File'
            TabOrder = 1
          end
          object cbRSendSelection: TCheckBox
            Left = 164
            Top = 33
            Width = 66
            Height = 17
            Caption = 'Selection'
            TabOrder = 3
          end
          object cbRSendBlockMarked: TCheckBox
            Left = 164
            Top = 69
            Width = 87
            Height = 17
            Caption = 'Marked block'
            TabOrder = 7
          end
          object cbRSendLinesToEndPage: TCheckBox
            Left = 164
            Top = 122
            Width = 108
            Height = 17
            Caption = 'Lines to end page'
            TabOrder = 12
          end
          object cbRSendCursorToBeginningLine: TCheckBox
            Left = 11
            Top = 141
            Width = 133
            Height = 17
            Caption = 'Cursor to beginning line'
            TabOrder = 13
          end
          object cbRSendSweave: TCheckBox
            Left = 11
            Top = 159
            Width = 62
            Height = 17
            Caption = 'Sweave'
            TabOrder = 15
          end
          object cbRSendClipboard: TCheckBox
            Left = 164
            Top = 51
            Width = 70
            Height = 17
            Caption = 'Clipboard'
            TabOrder = 5
          end
          object cbRSendSourceClipboard: TCheckBox
            Left = 11
            Top = 51
            Width = 107
            Height = 17
            Caption = 'Clipboard (source)'
            TabOrder = 4
          end
          object cbRSendSourceContiguous: TCheckBox
            Left = 11
            Top = 87
            Width = 121
            Height = 17
            Caption = 'Contiguous (source)'
            TabOrder = 8
          end
          object cbRSendContiguous: TCheckBox
            Left = 164
            Top = 87
            Width = 78
            Height = 17
            Caption = 'Contiguous'
            TabOrder = 9
          end
          object cbRCurrentLineToTop: TCheckBox
            Left = 11
            Top = 122
            Width = 112
            Height = 17
            Caption = 'Current line to top'
            TabOrder = 11
          end
          object cbRSendKnitr: TCheckBox
            Left = 164
            Top = 160
            Width = 45
            Height = 17
            Caption = 'Knitr'
            TabOrder = 16
          end
        end
        object gbControlling: TGroupBox
          Left = 0
          Top = 184
          Width = 334
          Height = 199
          Align = alTop
          Caption = ' Control (resources visibles) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object cbRSetWorkDirectory: TCheckBox
            Left = 11
            Top = 15
            Width = 110
            Height = 18
            Caption = 'Set work directory'
            TabOrder = 0
          end
          object cbRListAllObjects: TCheckBox
            Left = 164
            Top = 15
            Width = 88
            Height = 18
            Caption = 'List all objects'
            TabOrder = 1
          end
          object cbRListVariableNames: TCheckBox
            Left = 11
            Top = 50
            Width = 121
            Height = 18
            Caption = 'List names (selected)'
            TabOrder = 4
          end
          object cbREditVariable: TCheckBox
            Left = 11
            Top = 67
            Width = 115
            Height = 18
            Caption = 'Edit (selected word)'
            TabOrder = 6
          end
          object cbRClearConsole: TCheckBox
            Left = 11
            Top = 85
            Width = 86
            Height = 18
            Caption = 'Clear console'
            TabOrder = 8
          end
          object cbRRemoveAllObjects: TCheckBox
            Left = 11
            Top = 102
            Width = 113
            Height = 18
            Caption = 'Remove all objects'
            TabOrder = 10
          end
          object cbREscape: TCheckBox
            Left = 11
            Top = 120
            Width = 58
            Height = 18
            Caption = 'Stop'
            TabOrder = 12
          end
          object cbRExampleSelectedWord: TCheckBox
            Left = 11
            Top = 137
            Width = 112
            Height = 17
            Caption = 'Example (selected)'
            TabOrder = 14
          end
          object cbRTCPConnection: TCheckBox
            Left = 164
            Top = 173
            Width = 116
            Height = 17
            Caption = 'TCP/IP connection'
            TabOrder = 19
          end
          object cbRPrintVariableContent: TCheckBox
            Left = 11
            Top = 32
            Width = 131
            Height = 18
            Caption = 'Print content (selected)'
            TabOrder = 2
          end
          object cbRListVariableStructure: TCheckBox
            Left = 164
            Top = 50
            Width = 132
            Height = 18
            Caption = 'List structure (selected)'
            TabOrder = 5
          end
          object cbRFixVariable: TCheckBox
            Left = 164
            Top = 67
            Width = 86
            Height = 18
            Caption = 'Fix (selected)'
            TabOrder = 7
          end
          object cbRCloseAllGraphics: TCheckBox
            Left = 164
            Top = 85
            Width = 139
            Height = 18
            Caption = 'Close all graphic devices'
            TabOrder = 9
          end
          object cbRClearAll: TCheckBox
            Left = 164
            Top = 102
            Width = 59
            Height = 18
            Caption = 'Clear all'
            TabOrder = 11
          end
          object cbRHelpSelectedWord: TCheckBox
            Left = 164
            Top = 120
            Width = 93
            Height = 18
            Caption = 'Help (selected)'
            TabOrder = 13
          end
          object cbRHelp: TCheckBox
            Left = 164
            Top = 137
            Width = 45
            Height = 17
            Caption = 'Help'
            TabOrder = 15
          end
          object cbRGuiStartClose: TCheckBox
            Left = 11
            Top = 155
            Width = 61
            Height = 17
            Caption = 'R (Gui)'
            TabOrder = 16
          end
          object cbRPackages: TCheckBox
            Left = 11
            Top = 173
            Width = 70
            Height = 17
            Caption = 'Packages'
            TabOrder = 18
          end
          object cbRTermStartClose: TCheckBox
            Left = 164
            Top = 155
            Width = 65
            Height = 17
            Caption = 'R (Term)'
            TabOrder = 17
          end
          object cbRPlotVariable: TCheckBox
            Left = 164
            Top = 32
            Width = 116
            Height = 17
            Caption = 'Plot (selected word)'
            TabOrder = 3
          end
        end
      end
      object tbsAppRTinnRcom: TTabSheet
        Caption = 'Packages (R)'
        ImageIndex = 7
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label5: TLabel
          Left = 0
          Top = 325
          Width = 135
          Height = 13
          Caption = '*   If and only if R is running'
        end
        object Label25: TLabel
          Left = 0
          Top = 343
          Width = 318
          Height = 13
          Caption = 
            '** Reponsable for tip and completion - after '#39'('#39' and '#39'$'#39' respect' +
            'ively'
        end
        object GroupBox6: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 146
          Align = alTop
          Caption = ' TinnRcom (package) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object GroupBox7: TGroupBox
            Left = 6
            Top = 18
            Width = 320
            Height = 77
            Caption = ' Path and version* '
            TabOrder = 0
            object edVersion_TinnRcomInstalled: TEdit
              Left = 11
              Top = 51
              Width = 87
              Height = 19
              Enabled = False
              TabOrder = 0
            end
            object edPathTinnRcom_Installed: TEditAlign
              Left = 11
              Top = 20
              Width = 297
              Height = 28
              MultiLine = True
              WordWrap = True
              BorderStyle = bsNone
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object cbRTinnRcom_Install: TCheckBox
            Left = 11
            Top = 102
            Width = 137
            Height = 17
            Caption = 'Install (automatically)*'
            TabOrder = 1
          end
          object cbRTinnRcom_Load: TCheckBox
            Left = 11
            Top = 122
            Width = 137
            Height = 17
            Caption = 'Load (automatically)*'
            TabOrder = 2
          end
        end
        object GroupBox11: TGroupBox
          Left = 0
          Top = 146
          Width = 334
          Height = 46
          Align = alTop
          Caption = ' svSocket (package)** '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object cbRsvSocket_Connect: TCheckBox
            Left = 11
            Top = 19
            Width = 149
            Height = 17
            Caption = 'Connect (automatically)*'
            TabOrder = 0
          end
        end
        object GroupBox17: TGroupBox
          Left = 0
          Top = 192
          Width = 334
          Height = 129
          Align = alTop
          Caption = ' Library trees (.libPaths())* '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object mRLibPaths: TMemo
            Left = 8
            Top = 16
            Width = 317
            Height = 105
            BorderStyle = bsNone
            ReadOnly = True
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
      end
      object tbsAppOptionsRgui: TTabSheet
        Caption = 'Options (Rgui)'
        ImageIndex = 12
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbRguiReturnFocus: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 43
          Align = alTop
          Caption = ' Focus (after send/controlling) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object cbRguiReturnFocus: TCheckBox
            Left = 11
            Top = 18
            Width = 101
            Height = 18
            Caption = 'Return to Tinn-R'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object rgRguiTinnRDisposition: TRadioGroup
          Left = 0
          Top = 43
          Width = 334
          Height = 66
          Align = alTop
          Caption = ' Screen (arrangement) '
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            'Tinn-R on top'
            'Tinn-R on bottom'
            'Tinn-R on left'
            'Tinn-R on right')
          ParentCtl3D = False
          TabOrder = 1
          OnClick = rgRguiTinnRDispositionClick
        end
        object gbpRguiTinnRProportion: TGroupBox
          Left = 0
          Top = 109
          Width = 334
          Height = 196
          Align = alTop
          Caption = ' Screen (proportion used by Tinn-R) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object lblTinnRExpansion: TLabel
            Left = 180
            Top = 104
            Width = 62
            Height = 13
            Caption = 'Proportion: %'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object tbRguiTinnRProportion: TTrackBar
            Left = 9
            Top = 23
            Width = 160
            Height = 25
            Max = 70
            Min = 30
            PageSize = 1
            Frequency = 5
            Position = 50
            TabOrder = 0
            ThumbLength = 16
            OnChange = tbRguiTinnRProportionChange
          end
          object panScreen: TPanel
            Left = 15
            Top = 55
            Width = 147
            Height = 107
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = 16250871
            ParentBackground = False
            TabOrder = 1
            object panTinnR: TPanel
              Left = 0
              Top = 0
              Width = 145
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Caption = 'Tinn-R'
              Color = 16250871
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGreen
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
            end
            object panR: TPanel
              Left = 0
              Top = 41
              Width = 145
              Height = 64
              Align = alClient
              BevelOuter = bvNone
              BorderStyle = bsSingle
              Caption = 'Rgui'
              Color = 16250871
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
            end
          end
          object cbRguiOrganizeAutomatically: TCheckBox
            Left = 11
            Top = 170
            Width = 272
            Height = 18
            Caption = 'Organize automatically (only if Rgui is running)'
            TabOrder = 2
          end
        end
      end
      object tbsAppRecognitionRgui: TTabSheet
        Caption = 'Recognition (Rgui)'
        ImageIndex = 11
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label9: TLabel
          Left = 3
          Top = 160
          Width = 262
          Height = 13
          Caption = '* The more specific you are the faster the recognition!'
        end
        object Label26: TLabel
          Left = 0
          Top = 195
          Width = 262
          Height = 13
          Caption = '* The more specific you are the faster the recognition!'
        end
        object rdgRguiRecognitionCaption: TRadioGroup
          Left = 0
          Top = 0
          Width = 334
          Height = 140
          Align = alTop
          Caption = ' Window (caption)* '
          Ctl3D = False
          ItemIndex = 2
          Items.Strings = (
            'R Console (64-bit)   -> R 64 bit (SDI mode)'
            'R Console (32-bit)   -> R 32 bit (SDI mode)'
            'Both                         -> R 64/32 bit (SDI mode)'
            'Console                    -> JGR'
            'All')
          ParentCtl3D = False
          TabOrder = 0
        end
        object rdgRguiRecognitionType: TRadioGroup
          Left = 0
          Top = 140
          Width = 334
          Height = 49
          Align = alTop
          Caption = ' Type (caption search)* '
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            'Whole'
            'Partial')
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object tbsAppOptionsRterm: TTabSheet
        Caption = 'Options (Rterm)'
        ImageIndex = 14
        TabVisible = False
        object Label27: TLabel
          Left = 3
          Top = 89
          Width = 208
          Height = 13
          Caption = '* Valid only to: en, de, fr, es and po locale!'
        end
        object Label28: TLabel
          Left = 3
          Top = 316
          Width = 71
          Height = 13
          Caption = '* Recomended'
        end
        object gbpRtermDisposition: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 166
          Align = alTop
          Caption = ' IO and LOG (type, disposition and width) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object rdgRtermType: TRadioGroup
            Left = 7
            Top = 14
            Width = 319
            Height = 57
            Caption = ' Type '
            Ctl3D = False
            ItemIndex = 1
            Items.Strings = (
              'Single (both in same view)'
              'Multiple (distinct view)')
            ParentCtl3D = False
            TabOrder = 0
            OnClick = rdgRtermTypeClick
          end
          object rdgRtermDisposition: TRadioGroup
            Left = 7
            Top = 72
            Width = 319
            Height = 42
            Caption = ' Disposition '
            Columns = 2
            Ctl3D = False
            ItemIndex = 0
            Items.Strings = (
              'Horizontal'
              'Vertical')
            ParentCtl3D = False
            TabOrder = 1
          end
          object rdgRtermWidth: TRadioGroup
            Left = 7
            Top = 115
            Width = 319
            Height = 42
            Caption = ' Automatically adjust options (width)* '
            Columns = 2
            Ctl3D = False
            ItemIndex = 0
            Items.Strings = (
              'Yes'
              'no')
            ParentCtl3D = False
            TabOrder = 2
          end
        end
        object gbRtermSyntax: TGroupBox
          Left = 0
          Top = 166
          Width = 334
          Height = 106
          Align = alTop
          Caption = ' Syntax (highlighter) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object rdgRtermLogSyntax: TRadioGroup
            Left = 7
            Top = 59
            Width = 319
            Height = 41
            Caption = ' LOG (warnings and errors) '
            Columns = 2
            Ctl3D = False
            ItemIndex = 0
            Items.Strings = (
              'Text'
              'R')
            ParentCtl3D = False
            TabOrder = 0
          end
          object rdgRtermIOSyntax: TRadioGroup
            Left = 7
            Top = 15
            Width = 319
            Height = 44
            Caption = ' IO (input/output) '
            Columns = 2
            Ctl3D = False
            ItemIndex = 0
            Items.Strings = (
              'Text'
              'R')
            ParentCtl3D = False
            TabOrder = 1
          end
        end
        object rdgRtermClose: TRadioGroup
          Left = 0
          Top = 272
          Width = 334
          Height = 41
          Align = alTop
          Caption = ' Workspace image (close without ask for save) '
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            'Yes'
            'No')
          ParentCtl3D = False
          TabOrder = 2
        end
      end
      object tbsAppErrorRterm: TTabSheet
        Caption = 'Error (Rterm)'
        ImageIndex = 13
        TabVisible = False
        object Label1: TLabel
          Left = 2
          Top = 91
          Width = 208
          Height = 13
          Caption = '* Valid only to: en, de, fr, es and po locale!'
        end
        object rdgRtermFindError: TRadioGroup
          Left = 0
          Top = 0
          Width = 334
          Height = 44
          Align = alTop
          Caption = ' Trying to find errors (at the editor)* '
          Columns = 2
          Ctl3D = False
          ItemIndex = 1
          Items.Strings = (
            'Yes'
            'No')
          ParentCtl3D = False
          TabOrder = 0
        end
        object rdgRtermBeepOnError: TRadioGroup
          Left = 0
          Top = 44
          Width = 334
          Height = 44
          Align = alTop
          Caption = ' Beep on error (receiving from R)* '
          Columns = 2
          Ctl3D = False
          ItemIndex = 0
          Items.Strings = (
            'Yes'
            'No')
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object tbsAppFormatR: TTabSheet
        Caption = 'R (format)'
        ImageIndex = 6
        TabVisible = False
        object GroupBox13: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 91
          Align = alTop
          Caption = ' Arguments (no default to formatR/tidy_source) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edFormatR: TEditAlign
            Left = 7
            Top = 18
            Width = 318
            Height = 65
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object GroupBox14: TGroupBox
          Left = 0
          Top = 91
          Width = 334
          Height = 143
          Align = alTop
          Caption = ' Remember (default to formatR/tidy_source) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object memFormatR: TMemo
            Left = 7
            Top = 17
            Width = 319
            Height = 117
            BorderStyle = bsNone
            Ctl3D = False
            Lines.Strings = (
              'comment=getOption('#39'formatR.comment'#39',  TRUE),'
              'blank=getOption('#39'formatR.blank'#39', TRUE),'
              'arrow=getOption('#39'formatR.arrow'#39', FALSE),'
              'brace.newline=getOption('#39'formatR.brace.newline'#39', FALSE),'
              'indent=getOption('#39'formatR.indent'#39', 4),'
              'output=TRUE,'
              'text = NULL,'
              'width.cutoff=getOption('#39'width'#39')'
              '...')
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object GroupBox15: TGroupBox
          Left = 0
          Top = 234
          Width = 334
          Height = 68
          Align = alTop
          Caption = ' Option '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object rdgReformatRSplit: TRadioGroup
            Left = 7
            Top = 15
            Width = 318
            Height = 43
            Caption = ' Split the editor after reformatting (to compare) '
            Columns = 3
            Ctl3D = False
            ItemIndex = 1
            Items.Strings = (
              'Not split'
              'Vertical'
              'Horizontal')
            ParentCtl3D = False
            TabOrder = 0
          end
        end
      end
      object tbsAppFormatRd: TTabSheet
        Caption = 'Rd (format)'
        ImageIndex = 7
        TabVisible = False
        object GroupBox12: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 120
          Align = alTop
          Caption = ' Argument(s) no default (Rd2roxygen package) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edFormatRd: TEditAlign
            Left = 7
            Top = 18
            Width = 318
            Height = 94
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'This feature is not available yet!'
          end
        end
      end
      object tbsAppServerR: TTabSheet
        Caption = 'R server'
        ImageIndex = 15
        TabVisible = False
        object gpbRServerTCPIP: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 176
          Align = alTop
          Caption = ' TCP/IP '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object gpbRTCPIPParameter: TGroupBox
            Left = 125
            Top = 16
            Width = 195
            Height = 81
            Caption = ' Parameters (to connection) '
            TabOrder = 1
            object pgIP: TJvgPageControl
              Left = 1
              Top = 14
              Width = 193
              Height = 66
              ActivePage = tbsIPRemote
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              Style = tsFlatButtons
              TabHeight = 18
              TabOrder = 0
              TabStop = False
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
              object tbsIPLocal: TTabSheet
                Caption = 'Local'
                ExplicitLeft = 0
                ExplicitTop = 0
                ExplicitWidth = 0
                ExplicitHeight = 0
                object Label2: TLabel
                  Left = 5
                  Top = 3
                  Width = 39
                  Height = 13
                  Caption = 'Host IP:'
                end
                object Label7: TLabel
                  Left = 20
                  Top = 18
                  Width = 24
                  Height = 13
                  Caption = 'Port:'
                end
                object edtIPHostLocal: TEdit
                  Left = 50
                  Top = 2
                  Width = 116
                  Height = 15
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                end
                object edtIPPortLocal: TEdit
                  Left = 50
                  Top = 19
                  Width = 116
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
                object Label14: TLabel
                  Left = 5
                  Top = 3
                  Width = 39
                  Height = 13
                  Caption = 'Host IP:'
                end
                object Label15: TLabel
                  Left = 20
                  Top = 18
                  Width = 24
                  Height = 13
                  Caption = 'Port:'
                end
                object edtIPHostRemote: TEdit
                  Left = 50
                  Top = 2
                  Width = 116
                  Height = 15
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 0
                end
                object edtIPPortRemote: TEdit
                  Left = 50
                  Top = 19
                  Width = 116
                  Height = 15
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BorderStyle = bsNone
                  TabOrder = 1
                end
              end
            end
          end
          object gpbRTCPIPConsoleUse: TGroupBox
            Left = 13
            Top = 100
            Width = 307
            Height = 63
            Caption = ' Console use (remote connection only) '
            TabOrder = 2
            object cbRTCPIPConsoleEcho: TCheckBox
              Left = 12
              Top = 38
              Width = 147
              Height = 18
              Caption = 'Echo (sending/controlling)'
              TabOrder = 0
            end
            object cbRTCPIPConsoleUse: TCheckBox
              Left = 12
              Top = 19
              Width = 147
              Height = 17
              Caption = 'As interface (input/output)'
              TabOrder = 1
            end
          end
          object rdgRTCPIPType: TRadioGroup
            Left = 13
            Top = 16
            Width = 108
            Height = 81
            Caption = ' Connection (type ) '
            Items.Strings = (
              'Local'
              'Remote')
            TabOrder = 0
            OnClick = rdgRTCPIPTypeClick
          end
        end
      end
      object tbsAppDeplate: TTabSheet
        Caption = 'Deplate'
        ImageIndex = 15
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbParDeplate: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Parameters (options) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edParDeplate: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtParDeplate: TButton
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Restore default'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = bbtParDeplateClick
          end
        end
        object gpbIntPathDeplate: TGroupBox
          Left = 0
          Top = 92
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Interpreter (ruby.exe) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object edPathDeplate_Interpreter: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtIntPathDeplate: TBitBtn
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Search path'
            TabOrder = 1
            OnClick = bbtIntPathDeplateClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
        end
        object gpbConPathDeplate: TGroupBox
          Left = 0
          Top = 184
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Conversor (deplate ruby script) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object edPathDeplate_Converter: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtConPathDeplate: TBitBtn
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Search path'
            TabOrder = 1
            OnClick = bbtConPathDeplateClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
        end
      end
      object tbsAppPandoc: TTabSheet
        Caption = 'Pandoc'
        ImageIndex = 19
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbPathPandoc: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Conversor (pandoc.exe) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edPath_Pandoc: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtPathPandoc: TBitBtn
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Search path'
            TabOrder = 1
            OnClick = bbtPathPandocClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
        end
      end
      object tbsAppTxt2tags: TTabSheet
        Caption = 'Txt2tags'
        ImageIndex = 14
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbParTxt2tags: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Parameters (options) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object edParTxt2tags: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtParTxt2tags: TButton
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Restore default'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnClick = bbtParTxt2tagsClick
          end
        end
        object gpbIntPathTxt2tags: TGroupBox
          Left = 0
          Top = 92
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Interpreter (python.exe) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object edPathTxt2tags_Interpreter: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtIntPathTxt2tags: TBitBtn
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Search path'
            TabOrder = 1
            OnClick = bbtIntPathTxt2tagsClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
        end
        object gpbConPathTxt2tags: TGroupBox
          Left = 0
          Top = 184
          Width = 334
          Height = 92
          Align = alTop
          Caption = ' Conversor (txt2tags python script) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object edPathTxt2tags_Converter: TEditAlign
            Left = 12
            Top = 22
            Width = 307
            Height = 28
            MultiLine = True
            WordWrap = True
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object bbtConPathTxt2tags: TBitBtn
            Left = 12
            Top = 52
            Width = 307
            Height = 28
            Caption = 'Search path'
            TabOrder = 1
            OnClick = bbtConPathTxt2tagsClick
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880888800088
              8888880888800088888888088007B08000008808808777888888880880888888
              8888880800088888888888007F08000008888808777888888888880888888888
              8888880800088888888888007B08000008888808777888888888880888888888
              8888800088888888888807F08000008888888777888888888888}
          end
        end
      end
      object tbsAppMoreConversion: TTabSheet
        Caption = 'More (conversion)'
        ImageIndex = 16
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbConversionMore: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 60
          Align = alTop
          Caption = ' HTML conversion '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object cbHTMLOpenAlways: TCheckBox
            Left = 10
            Top = 24
            Width = 253
            Height = 18
            Caption = 'Always open files with browser after conversion'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
        end
      end
      object tbsAppDviLatex: TTabSheet
        Caption = 'DVI (latex)'
        ImageIndex = 18
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbDVIParameters: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 192
          Align = alTop
          Caption = ' Parameters (options) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object gpbDVIParametersSingle: TGroupBox
            Left = 10
            Top = 14
            Width = 313
            Height = 83
            Caption = ' Single compilation '
            TabOrder = 0
            object edParDVISingle: TEditAlign
              Left = 8
              Top = 18
              Width = 297
              Height = 28
              MultiLine = True
              WordWrap = True
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object bbtDVIParametersSingle: TButton
              Left = 8
              Top = 48
              Width = 297
              Height = 28
              Caption = 'Restore default'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = bbtDVIParametersSingleClick
            end
          end
          object gpbDVIParametersBibtex: TGroupBox
            Left = 10
            Top = 99
            Width = 313
            Height = 83
            Caption = ' Bibtex compilation '
            TabOrder = 1
            object edParDVIBibtex: TEditAlign
              Left = 8
              Top = 19
              Width = 297
              Height = 28
              MultiLine = True
              WordWrap = True
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object bbtDVIParametersBibtex: TButton
              Left = 8
              Top = 49
              Width = 297
              Height = 28
              Caption = 'Restore default'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = bbtDVIParametersBibtexClick
            end
          end
        end
      end
      object tbsAppPdfLatex: TTabSheet
        Caption = 'PDF (latex)'
        ImageIndex = 17
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbPDFParameters: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 192
          Align = alTop
          Caption = ' Parameters (options) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object gpbPDFParametersSingle: TGroupBox
            Left = 10
            Top = 14
            Width = 313
            Height = 83
            Caption = ' Single compilation '
            TabOrder = 0
            object edParPDFSingle: TEditAlign
              Left = 8
              Top = 18
              Width = 297
              Height = 28
              MultiLine = True
              WordWrap = True
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object bbtPDFParSingle: TButton
              Left = 8
              Top = 48
              Width = 297
              Height = 28
              Caption = 'Restore default'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = bbtPDFParSingleClick
            end
          end
          object gpbPDFParametersBibtex: TGroupBox
            Left = 10
            Top = 99
            Width = 313
            Height = 83
            Caption = ' Bibtex compilation '
            TabOrder = 1
            object edParPDFBibtex: TEditAlign
              Left = 8
              Top = 19
              Width = 297
              Height = 28
              MultiLine = True
              WordWrap = True
              BorderStyle = bsNone
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object bbtPDFParBibtex: TButton
              Left = 8
              Top = 49
              Width = 297
              Height = 28
              Caption = 'Restore default'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              OnClick = bbtPDFParBibtexClick
            end
          end
        end
      end
      object tbsAppMoreLatex: TTabSheet
        Caption = 'More (latex)'
        ImageIndex = 19
        TabVisible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object gpbLatexOptions: TGroupBox
          Left = 0
          Top = 0
          Width = 334
          Height = 55
          Align = alTop
          Caption = ' Latex edition (graphical interface ) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 0
          object cbLatexVisible: TCheckBox
            Left = 11
            Top = 24
            Width = 145
            Height = 18
            Caption = 'Visible'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object gbpLatexCloseViewer: TGroupBox
          Left = 0
          Top = 110
          Width = 334
          Height = 72
          Align = alTop
          Caption = ' Before compilation '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 1
          object cbCloseDVIViewer: TCheckBox
            Left = 11
            Top = 22
            Width = 302
            Height = 18
            Caption = 'Close DVI viewer instance (it is generally not necessary)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object cbClosePDFViewer: TCheckBox
            Left = 11
            Top = 42
            Width = 302
            Height = 18
            Caption = 'Close PDF viewer instance (we suggest Sumatra or Foxit)'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object gpbDOSOption: TGroupBox
          Left = 0
          Top = 55
          Width = 334
          Height = 55
          Align = alTop
          Caption = ' Compiling (console) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 2
          object cbDOSMinimizedAlways: TCheckBox
            Left = 11
            Top = 24
            Width = 138
            Height = 18
            Caption = 'Show minimized'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
        end
        object gpbPDFAfter: TGroupBox
          Left = 0
          Top = 182
          Width = 334
          Height = 72
          Align = alTop
          Caption = ' After compilation (action) '
          Ctl3D = False
          ParentCtl3D = False
          TabOrder = 3
          object cbPDFOpenAlways: TCheckBox
            Left = 11
            Top = 24
            Width = 107
            Height = 18
            Caption = 'PDF: open (*.pdf)'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
          end
          object cbDVIOpenAlways: TCheckBox
            Left = 11
            Top = 44
            Width = 107
            Height = 18
            Caption = 'DVI: open (*.dvi)'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 1
          end
        end
      end
    end
  end
  object bbHelp: TBitBtn
    Left = 323
    Top = 494
    Width = 75
    Height = 25
    Caption = '&Help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
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
  object odAppOptions: TOpenDialog
    Left = 3
    Top = 493
  end
  object pmAppOptions: TPopupMenu
    Left = 35
    Top = 493
    object None1: TMenuItem
      Tag = -1
      Caption = 'None'
      OnClick = pmColorClick
    end
    object Scrollbar1: TMenuItem
      Caption = 'Scrollbar'
      OnClick = pmColorClick
    end
    object Background1: TMenuItem
      Tag = 1
      Caption = 'Background'
      OnClick = pmColorClick
    end
    object ActiveCaption1: TMenuItem
      Tag = 2
      Caption = 'Active Caption'
      OnClick = pmColorClick
    end
    object InactiveCaption1: TMenuItem
      Tag = 3
      Caption = 'Inactive Caption'
      OnClick = pmColorClick
    end
    object Menu1: TMenuItem
      Tag = 4
      Caption = 'Menu'
      OnClick = pmColorClick
    end
    object Window1: TMenuItem
      Tag = 5
      Caption = 'Window'
      OnClick = pmColorClick
    end
    object WindowFrame1: TMenuItem
      Tag = 6
      Caption = 'Window Frame'
      OnClick = pmColorClick
    end
    object MEnu2: TMenuItem
      Tag = 7
      Caption = 'Menu Text'
      OnClick = pmColorClick
    end
    object WindowText1: TMenuItem
      Tag = 8
      Caption = 'Window Text'
      OnClick = pmColorClick
    end
    object CaptionText1: TMenuItem
      Tag = 9
      Caption = 'Caption Text'
      OnClick = pmColorClick
    end
    object ActiveBorder1: TMenuItem
      Tag = 10
      Caption = 'Active Border'
      OnClick = pmColorClick
    end
    object InactiveBorder1: TMenuItem
      Tag = 11
      Caption = 'Inactive Border'
      OnClick = pmColorClick
    end
    object ApplicationWorkspace1: TMenuItem
      Tag = 12
      Caption = 'Application Workspace'
      OnClick = pmColorClick
    end
    object Highlight1: TMenuItem
      Tag = 13
      Caption = 'Highlight'
      OnClick = pmColorClick
    end
    object HighlightText1: TMenuItem
      Tag = 14
      Caption = 'Highlight Text'
      OnClick = pmColorClick
    end
    object ButtonFace1: TMenuItem
      Tag = 15
      Caption = 'Button Face'
      OnClick = pmColorClick
    end
    object ButtonShadow1: TMenuItem
      Tag = 16
      Caption = 'Button Shadow'
      OnClick = pmColorClick
    end
    object GrayText1: TMenuItem
      Tag = 17
      Caption = 'Gray Text'
      OnClick = pmColorClick
    end
    object ButtonText1: TMenuItem
      Tag = 18
      Caption = 'Button Text'
      OnClick = pmColorClick
    end
    object InactiveCaptionText1: TMenuItem
      Tag = 19
      Caption = 'Inactive Caption Text'
      OnClick = pmColorClick
    end
    object Highlight2: TMenuItem
      Tag = 20
      Caption = 'Highlight'
      OnClick = pmColorClick
    end
    object N3dDarkShadow1: TMenuItem
      Tag = 21
      Caption = '3D Dark Shadow'
      OnClick = pmColorClick
    end
    object N3DLight1: TMenuItem
      Tag = 22
      Caption = '3D Light'
      OnClick = pmColorClick
    end
    object InfoTipText1: TMenuItem
      Tag = 23
      Caption = 'Info Tip Text'
      OnClick = pmColorClick
    end
    object InfoTipBackground1: TMenuItem
      Tag = 24
      Caption = 'Info Tip Background'
      OnClick = pmColorClick
    end
  end
  object imlAppOptions: TImageList
    Left = 67
    Top = 493
  end
  object fdAppOptions: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdTrueTypeOnly, fdFixedPitchOnly]
    Left = 99
    Top = 493
  end
end
