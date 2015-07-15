object frmRterm: TfrmRterm
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  Caption = 'Rterm'
  ClientHeight = 359
  ClientWidth = 408
  Color = 16250871
  Ctl3D = False
  DefaultMonitor = dmDesktop
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
  Position = poMainFormCenter
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
    ActivePage = tbsLog
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
        PopupMenu = frmTinnMain.pmenIO
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
      end
    end
    object tbsLog: TTabSheet
      Caption = 'LOG'
      ImageIndex = 1
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
        PopupMenu = frmTinnMain.pmenLog
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
      Images = frmTinnMain.imlTinnR
      TabOrder = 0
      object TBItem7: TTBItem
        Action = frmTinnMain.actRContTermStartClose
      end
      object TBSeparatorItem5: TTBSeparatorItem
      end
      object TBItem41: TTBItem
        Action = frmTinnMain.actRContHelpSelectedWord
      end
      object TBItem40: TTBItem
        Action = frmTinnMain.actRContExampleSelectedWord
      end
      object TBItem42: TTBItem
        Action = frmTinnMain.actRContHelp
      end
      object TBSeparatorItem2: TTBSeparatorItem
      end
      object TBSubmenuItem10: TTBSubmenuItem
        Caption = 'Edit'
        ImageIndex = 276
        object TBItem29: TTBItem
          Action = frmTinnMain.actEditUndo
        end
        object TBItem28: TTBItem
          Action = frmTinnMain.actEditRedo
        end
        object TBSeparatorItem4: TTBSeparatorItem
        end
        object TBItem32: TTBItem
          Action = frmTinnMain.actEditCopy
        end
        object TBItem31: TTBItem
          Action = frmTinnMain.actEditCut
        end
        object TBItem30: TTBItem
          Action = frmTinnMain.actEditPaste
        end
        object TBSeparatorItem8: TTBSeparatorItem
        end
        object TBItem33: TTBItem
          Action = frmTinnMain.actEditSelectAll
        end
      end
      object TBSubmenuItem11: TTBSubmenuItem
        Caption = 'File'
        ImageIndex = 32
        object TBSubmenuItem13: TTBSubmenuItem
          Caption = 'IO'
          ImageIndex = 244
          object TBItem1: TTBItem
            Action = frmTinnMain.actRtermIOSave
          end
          object TBItem2: TTBItem
            Action = frmTinnMain.actRtermIOSaveAs
          end
          object TBItem6: TTBItem
            Action = frmTinnMain.actRtermIOPrint
          end
        end
        object TBSubmenuItem12: TTBSubmenuItem
          Caption = 'LOG'
          ImageIndex = 252
          object TBItem37: TTBItem
            Action = frmTinnMain.actRtermLOGSave
          end
          object TBItem36: TTBItem
            Action = frmTinnMain.actRtermLOGSaveAs
          end
          object TBItem35: TTBItem
            Action = frmTinnMain.actRtermLOGPrint
          end
        end
      end
      object TBSeparatorItem1: TTBSeparatorItem
      end
      object TBSubmenuItem9: TTBSubmenuItem
        Caption = 'Clear'
        ImageIndex = 20
        object TBItem24: TTBItem
          Action = frmTinnMain.actRtermIOClear
        end
        object TBItem34: TTBItem
          Action = frmTinnMain.actRtermLOGClear
        end
        object TBItem8: TTBItem
          Action = frmTinnMain.actRtermIOandLOGClear
        end
      end
      object TBSubmenuItem8: TTBSubmenuItem
        Caption = 'Focus'
        ImageIndex = 274
        object TBItem27: TTBItem
          Action = frmTinnMain.actRtermEditorSetFocus
        end
        object TBItem26: TTBItem
          Action = frmTinnMain.actRtermIOSetFocus
        end
        object TBItem25: TTBItem
          Action = frmTinnMain.actRtermLOGSetFocus
        end
      end
      object TBSubmenuItem2: TTBSubmenuItem
        Caption = 'Visualization: size'
        ImageIndex = 248
        object TBItem13: TTBItem
          Action = frmTinnMain.actRtermMaximize
        end
        object TBItem12: TTBItem
          Action = frmTinnMain.actRtermDivide
        end
        object TBItem11: TTBItem
          Action = frmTinnMain.actRtermMinimize
        end
      end
      object TBSubmenuItem1: TTBSubmenuItem
        Caption = 'Visualization: split'
        ImageIndex = 255
        object TBItem10: TTBItem
          Action = frmTinnMain.actRtermIOSplitHorizontal
        end
        object TBItem9: TTBItem
          Action = frmTinnMain.actRtermIOSplitVertical
        end
        object TBSeparatorItem3: TTBSeparatorItem
        end
        object TBItem3: TTBItem
          Action = frmTinnMain.actRtermIOSplitRemove
        end
      end
      object TBSubmenuItem4: TTBSubmenuItem
        Caption = 'Visualization: highlighter'
        ImageIndex = 163
        object TBSubmenuItem15: TTBSubmenuItem
          Caption = 'IO'
          ImageIndex = 244
          object TBItem17: TTBItem
            Action = frmTinnMain.actRtermSetIOSyntaxToText
          end
          object TBItem16: TTBItem
            Action = frmTinnMain.actRtermSetIOSyntaxToR
          end
        end
        object TBSubmenuItem14: TTBSubmenuItem
          Caption = 'LOG'
          ImageIndex = 252
          object TBItem39: TTBItem
            Action = frmTinnMain.actRtermSetLOGSyntaxToText
          end
          object TBItem38: TTBItem
            Action = frmTinnMain.actRtermSetLOGSyntaxToR
          end
        end
      end
      object TBSubmenuItem3: TTBSubmenuItem
        Caption = 'Visualization: line wrap'
        ImageIndex = 101
        object TBItem15: TTBItem
          Action = frmTinnMain.actRtermIOLineWrap
        end
        object TBItem14: TTBItem
          Action = frmTinnMain.actRtermLOGLineWrap
        end
      end
      object TBSeparatorItem7: TTBSeparatorItem
      end
      object TBSubmenuItem6: TTBSubmenuItem
        Caption = 'IO: history'
        ImageIndex = 272
        object TBItem21: TTBItem
          Action = frmTinnMain.actRtermSaveHistory
        end
        object TBItem20: TTBItem
          Action = frmTinnMain.actRtermLoadHistory
        end
        object TBSeparatorItem6: TTBSeparatorItem
        end
        object TBItem19: TTBItem
          Action = frmTinnMain.actRtermIOHistoryPrior
        end
        object TBItem18: TTBItem
          Action = frmTinnMain.actRtermIOHistoryNext
        end
      end
      object TBSubmenuItem5: TTBSubmenuItem
        Caption = 'IO: workspace'
        ImageIndex = 273
        object TBItem22: TTBItem
          Action = frmTinnMain.actRtermSaveWorkspace
        end
        object TBItem23: TTBItem
          Action = frmTinnMain.actRtermLoadWorkspace
        end
      end
      object TBSeparatorItem9: TTBSeparatorItem
      end
      object TBSubmenuItem7: TTBSubmenuItem
        Caption = 'Visualization: font (not permanent)'
        ImageIndex = 260
        object TBItem5: TTBItem
          Action = frmTinnMain.actFontIncrease
        end
        object TBItem4: TTBItem
          Action = frmTinnMain.actFontDecrease
        end
      end
    end
  end
  object JvDockClientRterm: TJvDockClient
    DirectDrag = False
    DockStyle = frmTinnMain.JvDockVSNetStyle
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
