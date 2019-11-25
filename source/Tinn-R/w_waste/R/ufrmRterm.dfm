object frmR_Term: TfrmR_Term
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  Caption = 'Rterm'
  ClientHeight = 359
  ClientWidth = 408
  Color = 16250871
  Ctl3D = False
  DockSite = True
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgRterm: TJvgPageControl
    Left = 0
    Top = 26
    Width = 408
    Height = 333
    ActivePage = tbsIO
    Align = alClient
    Anchors = []
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabHeight = 18
    TabOrder = 0
    TabStop = False
    OnResize = pgRtermResize
    TabStyle.Borders = []
    TabStyle.BevelInner = bvNone
    TabStyle.BevelOuter = bvNone
    TabStyle.Bold = False
    TabStyle.BackgrColor = clBtnFace
    TabStyle.Font.Charset = DEFAULT_CHARSET
    TabStyle.Font.Color = clBtnText
    TabStyle.Font.Height = -12
    TabStyle.Font.Name = 'MS Sans Serif'
    TabStyle.Font.Style = []
    TabStyle.CaptionHAlign = fhaCenter
    TabStyle.GlyphHAlign = fhaCenter
    TabStyle.Gradient.Active = False
    TabStyle.Gradient.Orientation = fgdHorizontal
    TabSelectedStyle.Borders = []
    TabSelectedStyle.BevelInner = bvNone
    TabSelectedStyle.BevelOuter = bvNone
    TabSelectedStyle.Bold = False
    TabSelectedStyle.BackgrColor = clGray
    TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
    TabSelectedStyle.Font.Color = clBtnText
    TabSelectedStyle.Font.Height = -12
    TabSelectedStyle.Font.Name = 'MS Sans Serif'
    TabSelectedStyle.Font.Style = []
    TabSelectedStyle.CaptionHAlign = fhaCenter
    TabSelectedStyle.Gradient.Active = False
    TabSelectedStyle.Gradient.Orientation = fgdHorizontal
    Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
    object tbsIO: TTabSheet
      Caption = 'IO'
      object synIO: TSynEdit
        Left = 0
        Top = 0
        Width = 400
        Height = 305
        Align = alClient
        Constraints.MinHeight = 20
        Constraints.MinWidth = 50
        Ctl3D = False
        ParentCtl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        PopupMenu = frmMain.pmenIO
        TabOrder = 0
        OnEnter = synIOEnter
        OnKeyDown = synIOKeyDown
        OnKeyPress = synIOKeyPress
        OnKeyUp = synIOKeyUp
        OnMouseUp = synIOMouseUp
        BorderStyle = bsNone
        Gutter.BorderStyle = gbsNone
        Gutter.DigitCount = 2
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.Width = 15
        Options = []
        RightEdge = 0
        RightEdgeColor = clWindow
        ScrollHintColor = clSkyBlue
        SelectedColor.Background = clActiveCaption
        SelectedColor.Foreground = clWindow
        FontSmoothing = fsmNone
        RemovedKeystrokes = <
          item
            Command = ecUp
            ShortCut = 38
          end
          item
            Command = ecSelUp
            ShortCut = 8230
          end
          item
            Command = ecScrollUp
            ShortCut = 16422
          end
          item
            Command = ecDown
            ShortCut = 40
          end
          item
            Command = ecSelDown
            ShortCut = 8232
          end
          item
            Command = ecScrollDown
            ShortCut = 16424
          end
          item
            Command = ecLeft
            ShortCut = 37
          end
          item
            Command = ecSelLeft
            ShortCut = 8229
          end
          item
            Command = ecWordLeft
            ShortCut = 16421
          end
          item
            Command = ecSelWordLeft
            ShortCut = 24613
          end
          item
            Command = ecRight
            ShortCut = 39
          end
          item
            Command = ecSelRight
            ShortCut = 8231
          end
          item
            Command = ecWordRight
            ShortCut = 16423
          end
          item
            Command = ecSelWordRight
            ShortCut = 24615
          end
          item
            Command = ecPageDown
            ShortCut = 34
          end
          item
            Command = ecSelPageDown
            ShortCut = 8226
          end
          item
            Command = ecPageBottom
            ShortCut = 16418
          end
          item
            Command = ecSelPageBottom
            ShortCut = 24610
          end
          item
            Command = ecPageUp
            ShortCut = 33
          end
          item
            Command = ecSelPageUp
            ShortCut = 8225
          end
          item
            Command = ecPageTop
            ShortCut = 16417
          end
          item
            Command = ecSelPageTop
            ShortCut = 24609
          end
          item
            Command = ecLineStart
            ShortCut = 36
          end
          item
            Command = ecSelLineStart
            ShortCut = 8228
          end
          item
            Command = ecEditorTop
            ShortCut = 16420
          end
          item
            Command = ecSelEditorTop
            ShortCut = 24612
          end
          item
            Command = ecLineEnd
            ShortCut = 35
          end
          item
            Command = ecSelLineEnd
            ShortCut = 8227
          end
          item
            Command = ecEditorBottom
            ShortCut = 16419
          end
          item
            Command = ecSelEditorBottom
            ShortCut = 24611
          end
          item
            Command = ecToggleMode
            ShortCut = 45
          end
          item
            Command = ecCopy
            ShortCut = 16429
          end
          item
            Command = ecCut
            ShortCut = 8238
          end
          item
            Command = ecPaste
            ShortCut = 8237
          end
          item
            Command = ecDeleteChar
            ShortCut = 46
          end
          item
            Command = ecDeleteLastChar
            ShortCut = 8
          end
          item
            Command = ecDeleteLastChar
            ShortCut = 8200
          end
          item
            Command = ecDeleteLastWord
            ShortCut = 16392
          end
          item
            Command = ecUndo
            ShortCut = 32776
          end
          item
            Command = ecRedo
            ShortCut = 40968
          end
          item
            Command = ecLineBreak
            ShortCut = 13
          end
          item
            Command = ecLineBreak
            ShortCut = 8205
          end
          item
            Command = ecTab
            ShortCut = 9
          end
          item
            Command = ecShiftTab
            ShortCut = 8201
          end
          item
            Command = ecContextHelp
            ShortCut = 112
          end
          item
            Command = ecSelectAll
            ShortCut = 16449
          end
          item
            Command = ecCopy
            ShortCut = 16451
          end
          item
            Command = ecPaste
            ShortCut = 16470
          end
          item
            Command = ecCut
            ShortCut = 16472
          end
          item
            Command = ecBlockIndent
            ShortCut = 24649
          end
          item
            Command = ecBlockUnindent
            ShortCut = 24661
          end
          item
            Command = ecLineBreak
            ShortCut = 16461
          end
          item
            Command = ecInsertLine
            ShortCut = 16462
          end
          item
            Command = ecDeleteWord
            ShortCut = 16468
          end
          item
            Command = ecDeleteLine
            ShortCut = 16473
          end
          item
            Command = ecDeleteEOL
            ShortCut = 24665
          end
          item
            Command = ecUndo
            ShortCut = 16474
          end
          item
            Command = ecRedo
            ShortCut = 24666
          end
          item
            Command = ecGotoMarker0
            ShortCut = 16432
          end
          item
            Command = ecGotoMarker1
            ShortCut = 16433
          end
          item
            Command = ecGotoMarker2
            ShortCut = 16434
          end
          item
            Command = ecGotoMarker3
            ShortCut = 16435
          end
          item
            Command = ecGotoMarker4
            ShortCut = 16436
          end
          item
            Command = ecGotoMarker5
            ShortCut = 16437
          end
          item
            Command = ecGotoMarker6
            ShortCut = 16438
          end
          item
            Command = ecGotoMarker7
            ShortCut = 16439
          end
          item
            Command = ecGotoMarker8
            ShortCut = 16440
          end
          item
            Command = ecGotoMarker9
            ShortCut = 16441
          end
          item
            Command = ecSetMarker0
            ShortCut = 24624
          end
          item
            Command = ecSetMarker1
            ShortCut = 24625
          end
          item
            Command = ecSetMarker2
            ShortCut = 24626
          end
          item
            Command = ecSetMarker3
            ShortCut = 24627
          end
          item
            Command = ecSetMarker4
            ShortCut = 24628
          end
          item
            Command = ecSetMarker5
            ShortCut = 24629
          end
          item
            Command = ecSetMarker6
            ShortCut = 24630
          end
          item
            Command = ecSetMarker7
            ShortCut = 24631
          end
          item
            Command = ecSetMarker8
            ShortCut = 24632
          end
          item
            Command = ecSetMarker9
            ShortCut = 24633
          end
          item
            Command = ecNormalSelect
            ShortCut = 24654
          end
          item
            Command = ecColumnSelect
            ShortCut = 24643
          end
          item
            Command = ecLineSelect
            ShortCut = 24652
          end
          item
            Command = ecMatchBracket
            ShortCut = 24642
          end>
        AddedKeystrokes = <>
      end
    end
    object tbsLog: TTabSheet
      Caption = 'LOG'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object synLog: TSynEdit
        Left = 0
        Top = 0
        Width = 400
        Height = 305
        Align = alClient
        Anchors = []
        Ctl3D = False
        ParentCtl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        PopupMenu = frmMain.pmenLOG
        TabOrder = 0
        OnEnter = synLogEnter
        OnKeyDown = synLogKeyDown
        OnKeyPress = synLogKeyPress
        OnKeyUp = synLogKeyUp
        OnMouseUp = synLogMouseUp
        BorderStyle = bsNone
        Gutter.BorderStyle = gbsNone
        Gutter.BorderColor = clNone
        Gutter.DigitCount = 2
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -11
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.Width = 15
        Options = []
        RightEdge = 0
        RightEdgeColor = clWindow
        ScrollHintColor = clSkyBlue
        SelectedColor.Background = clActiveCaption
        SelectedColor.Foreground = clWindow
        FontSmoothing = fsmNone
        RemovedKeystrokes = <
          item
            Command = ecUp
            ShortCut = 38
          end
          item
            Command = ecSelUp
            ShortCut = 8230
          end
          item
            Command = ecScrollUp
            ShortCut = 16422
          end
          item
            Command = ecDown
            ShortCut = 40
          end
          item
            Command = ecSelDown
            ShortCut = 8232
          end
          item
            Command = ecScrollDown
            ShortCut = 16424
          end
          item
            Command = ecLeft
            ShortCut = 37
          end
          item
            Command = ecSelLeft
            ShortCut = 8229
          end
          item
            Command = ecWordLeft
            ShortCut = 16421
          end
          item
            Command = ecSelWordLeft
            ShortCut = 24613
          end
          item
            Command = ecRight
            ShortCut = 39
          end
          item
            Command = ecSelRight
            ShortCut = 8231
          end
          item
            Command = ecWordRight
            ShortCut = 16423
          end
          item
            Command = ecSelWordRight
            ShortCut = 24615
          end
          item
            Command = ecPageDown
            ShortCut = 34
          end
          item
            Command = ecSelPageDown
            ShortCut = 8226
          end
          item
            Command = ecPageBottom
            ShortCut = 16418
          end
          item
            Command = ecSelPageBottom
            ShortCut = 24610
          end
          item
            Command = ecPageUp
            ShortCut = 33
          end
          item
            Command = ecSelPageUp
            ShortCut = 8225
          end
          item
            Command = ecPageTop
            ShortCut = 16417
          end
          item
            Command = ecSelPageTop
            ShortCut = 24609
          end
          item
            Command = ecLineStart
            ShortCut = 36
          end
          item
            Command = ecSelLineStart
            ShortCut = 8228
          end
          item
            Command = ecEditorTop
            ShortCut = 16420
          end
          item
            Command = ecSelEditorTop
            ShortCut = 24612
          end
          item
            Command = ecLineEnd
            ShortCut = 35
          end
          item
            Command = ecSelLineEnd
            ShortCut = 8227
          end
          item
            Command = ecEditorBottom
            ShortCut = 16419
          end
          item
            Command = ecSelEditorBottom
            ShortCut = 24611
          end
          item
            Command = ecToggleMode
            ShortCut = 45
          end
          item
            Command = ecCopy
            ShortCut = 16429
          end
          item
            Command = ecCut
            ShortCut = 8238
          end
          item
            Command = ecPaste
            ShortCut = 8237
          end
          item
            Command = ecDeleteChar
            ShortCut = 46
          end
          item
            Command = ecDeleteLastChar
            ShortCut = 8
          end
          item
            Command = ecDeleteLastChar
            ShortCut = 8200
          end
          item
            Command = ecDeleteLastWord
            ShortCut = 16392
          end
          item
            Command = ecUndo
            ShortCut = 32776
          end
          item
            Command = ecRedo
            ShortCut = 40968
          end
          item
            Command = ecLineBreak
            ShortCut = 13
          end
          item
            Command = ecLineBreak
            ShortCut = 8205
          end
          item
            Command = ecTab
            ShortCut = 9
          end
          item
            Command = ecShiftTab
            ShortCut = 8201
          end
          item
            Command = ecContextHelp
            ShortCut = 112
          end
          item
            Command = ecSelectAll
            ShortCut = 16449
          end
          item
            Command = ecCopy
            ShortCut = 16451
          end
          item
            Command = ecPaste
            ShortCut = 16470
          end
          item
            Command = ecCut
            ShortCut = 16472
          end
          item
            Command = ecBlockIndent
            ShortCut = 24649
          end
          item
            Command = ecBlockUnindent
            ShortCut = 24661
          end
          item
            Command = ecLineBreak
            ShortCut = 16461
          end
          item
            Command = ecInsertLine
            ShortCut = 16462
          end
          item
            Command = ecDeleteWord
            ShortCut = 16468
          end
          item
            Command = ecDeleteLine
            ShortCut = 16473
          end
          item
            Command = ecDeleteEOL
            ShortCut = 24665
          end
          item
            Command = ecUndo
            ShortCut = 16474
          end
          item
            Command = ecRedo
            ShortCut = 24666
          end
          item
            Command = ecGotoMarker0
            ShortCut = 16432
          end
          item
            Command = ecGotoMarker1
            ShortCut = 16433
          end
          item
            Command = ecGotoMarker2
            ShortCut = 16434
          end
          item
            Command = ecGotoMarker3
            ShortCut = 16435
          end
          item
            Command = ecGotoMarker4
            ShortCut = 16436
          end
          item
            Command = ecGotoMarker5
            ShortCut = 16437
          end
          item
            Command = ecGotoMarker6
            ShortCut = 16438
          end
          item
            Command = ecGotoMarker7
            ShortCut = 16439
          end
          item
            Command = ecGotoMarker8
            ShortCut = 16440
          end
          item
            Command = ecGotoMarker9
            ShortCut = 16441
          end
          item
            Command = ecSetMarker0
            ShortCut = 24624
          end
          item
            Command = ecSetMarker1
            ShortCut = 24625
          end
          item
            Command = ecSetMarker2
            ShortCut = 24626
          end
          item
            Command = ecSetMarker3
            ShortCut = 24627
          end
          item
            Command = ecSetMarker4
            ShortCut = 24628
          end
          item
            Command = ecSetMarker5
            ShortCut = 24629
          end
          item
            Command = ecSetMarker6
            ShortCut = 24630
          end
          item
            Command = ecSetMarker7
            ShortCut = 24631
          end
          item
            Command = ecSetMarker8
            ShortCut = 24632
          end
          item
            Command = ecSetMarker9
            ShortCut = 24633
          end
          item
            Command = ecNormalSelect
            ShortCut = 24654
          end
          item
            Command = ecColumnSelect
            ShortCut = 24643
          end
          item
            Command = ecLineSelect
            ShortCut = 24652
          end
          item
            Command = ecMatchBracket
            ShortCut = 24642
          end>
        AddedKeystrokes = <>
      end
    end
  end
  object TBDock1: TTBDock
    Left = 0
    Top = 0
    Width = 408
    Height = 26
    object TBToolbarRterm: TTBToolbar
      Left = 0
      Top = 0
      Align = alClient
      BorderStyle = bsNone
      Caption = 'TBToolbarRterm'
      ChevronMoveItems = False
      Color = 16250871
      DockMode = dmCannotFloatOrChangeDocks
      Images = frmMain.imlTinnR
      TabOrder = 0
      object TBItem7: TTBItem
        Action = frmMain.actRCont_TermStartClose
      end
      object TBSeparatorItem5: TTBSeparatorItem
      end
      object TBItem41: TTBItem
        Action = frmMain.actRCont_HelpSelectedWord
      end
      object TBItem40: TTBItem
        Action = frmMain.actRCont_ExampleSelectedWord
      end
      object TBItem43: TTBItem
        Action = frmMain.actRCont_OpenExampleSelectedWord
      end
      object TBItem42: TTBItem
        Action = frmMain.actRCont_Help
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object TBSubmenuItem10: TTBSubmenuItem
        Caption = 'Edit'
        ImageIndex = 276
        object TBItem29: TTBItem
        end
        object TBItem28: TTBItem
        end
        object TBSeparatorItem4: TTBSeparatorItem
        end
        object TBItem32: TTBItem
        end
        object TBItem31: TTBItem
        end
        object TBItem30: TTBItem
        end
        object TBSeparatorItem8: TTBSeparatorItem
        end
        object TBItem33: TTBItem
        end
      end
      object TBSubmenuItem11: TTBSubmenuItem
        Caption = 'File'
        ImageIndex = 32
        object TBSubmenuItem13: TTBSubmenuItem
          Caption = 'IO'
          ImageIndex = 244
          object TBItem1: TTBItem
            Action = frmMain.actRtermIOSave
          end
          object TBItem2: TTBItem
            Action = frmMain.actRtermIOSaveAs
          end
          object TBItem6: TTBItem
            Action = frmMain.actRtermIOPrint
          end
        end
        object TBSubmenuItem12: TTBSubmenuItem
          Caption = 'LOG'
          ImageIndex = 252
          object TBItem37: TTBItem
            Action = frmMain.actRtermLOGSave
          end
          object TBItem36: TTBItem
            Action = frmMain.actRtermLOGSaveAs
          end
          object TBItem35: TTBItem
            Action = frmMain.actRtermLOGPrint
          end
        end
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBSubmenuItem9: TTBSubmenuItem
        Caption = 'Clear'
        ImageIndex = 20
        object TBItem24: TTBItem
          Action = frmMain.actRtermIOClear
        end
        object TBItem34: TTBItem
          Action = frmMain.actRtermLOGClear
        end
        object TBItem8: TTBItem
          Action = frmMain.actRtermIOandLOGClear
        end
      end
      object TBSubmenuItem8: TTBSubmenuItem
        Caption = 'Focus'
        ImageIndex = 274
        object TBItem27: TTBItem
          Action = frmMain.actRtermEditorSetFocus
        end
        object TBItem26: TTBItem
          Action = frmMain.actRtermIOSetFocus
        end
        object TBItem25: TTBItem
          Action = frmMain.actRtermLOGSetFocus
        end
      end
      object TBSubmenuItem2: TTBSubmenuItem
        Caption = 'Visualization: size'
        ImageIndex = 248
        object TBItem13: TTBItem
          Action = frmMain.actRtermMaximize
        end
        object TBItem12: TTBItem
          Action = frmMain.actRtermDivide
        end
        object TBItem11: TTBItem
          Action = frmMain.actRtermMinimize
        end
      end
      object TBSubmenuItem1: TTBSubmenuItem
        Caption = 'Visualization: split'
        ImageIndex = 255
        object TBItem10: TTBItem
          Action = frmMain.actRtermIOSplitHorizontal
        end
        object TBItem9: TTBItem
          Action = frmMain.actRtermIOSplitVertical
        end
        object TBSeparatorItem3: TTBSeparatorItem
        end
        object TBItem3: TTBItem
          Action = frmMain.actRtermIOSplitRemove
        end
      end
      object TBSubmenuItem4: TTBSubmenuItem
        Caption = 'Visualization: highlighter'
        ImageIndex = 163
        object TBSubmenuItem15: TTBSubmenuItem
          Caption = 'IO'
          ImageIndex = 244
          object TBItem17: TTBItem
            Action = frmMain.actRtermIO_Text
          end
          object TBItem44: TTBItem
            Action = frmMain.actRtermIO_Text_nML
          end
          object TBItem16: TTBItem
            Action = frmMain.actRtermIO_R
          end
          object TBItem45: TTBItem
            Action = frmMain.actRtermIO_R_nML
          end
        end
        object TBSubmenuItem14: TTBSubmenuItem
          Caption = 'LOG'
          ImageIndex = 252
          object TBItem39: TTBItem
            Action = frmMain.actRtermLOG_Text
          end
          object TBItem46: TTBItem
            Action = frmMain.actRtermLOG_Text_nML
          end
          object TBItem38: TTBItem
            Action = frmMain.actRtermLOG_R
          end
          object TBItem47: TTBItem
            Action = frmMain.actRtermLOG_R_nML
          end
        end
      end
      object TBSubmenuItem3: TTBSubmenuItem
        Caption = 'Visualization: line wrap'
        ImageIndex = 101
        object TBItem15: TTBItem
          Action = frmMain.actRtermIOLineWrap
        end
        object TBItem14: TTBItem
          Action = frmMain.actRtermLOGLineWrap
        end
      end
      object TBSeparatorItem7: TTBSeparatorItem
      end
      object TBSubmenuItem6: TTBSubmenuItem
        Caption = 'IO: history'
        ImageIndex = 272
        object TBItem21: TTBItem
          Action = frmMain.actRtermSaveHistory
        end
        object TBItem20: TTBItem
          Action = frmMain.actRtermLoadHistory
        end
        object TBSeparatorItem6: TTBSeparatorItem
        end
        object TBItem19: TTBItem
          Action = frmMain.actRtermIOHistoryPrior
        end
        object TBItem18: TTBItem
          Action = frmMain.actRtermIOHistoryNext
        end
      end
      object TBSubmenuItem5: TTBSubmenuItem
        Caption = 'IO: workspace'
        ImageIndex = 273
        object TBItem22: TTBItem
          Action = frmMain.actRtermSaveWorkspace
        end
        object TBItem23: TTBItem
          Action = frmMain.actRtermLoadWorkspace
        end
      end
      object TBSeparatorItem9: TTBSeparatorItem
      end
      object TBSubmenuItem7: TTBSubmenuItem
        Caption = 'Visualization: font (not permanent)'
        ImageIndex = 260
        object TBItem5: TTBItem
          Action = frmMain.actFontIncrease
        end
        object TBItem4: TTBItem
          Action = frmMain.actFontDecrease
        end
      end
    end
  end
  object JvDockClientRterm: TJvDockClient
    DirectDrag = False
    DockStyle = frmMain.JvDockVSNetStyle
    Left = 15
    Top = 88
  end
  object cRTerm: TConsoleIO
    OnReceiveOutput = cRTermReceiveOutput
    OnReceiveError = cRTermReceiveError
    OnError = cRTermError
    OnProcessStatusChange = cRTermProcessStatusChange
    TerminateCommand = 'quit'
    SplitSend = False
    Left = 14
    Top = 56
  end
end
