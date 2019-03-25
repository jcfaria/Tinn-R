object frmPrintPreview: TfrmPrintPreview
  Left = 341
  Top = 266
  AlphaBlend = True
  AlphaBlendValue = 200
  Caption = 'Print preview'
  ClientHeight = 238
  ClientWidth = 576
  Color = 16250871
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object synPP: TSynEditPrintPreview
    Left = 0
    Top = 30
    Width = 576
    Height = 208
    BorderStyle = bsNone
    ScalePercent = 90
    OnPreviewPage = synPPPreviewPage
  end
  object ControlBar1: TControlBar
    Left = 0
    Top = 0
    Width = 576
    Height = 30
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object tbPrintPreview: TToolBar
      Left = 11
      Top = 2
      Width = 471
      Height = 22
      AutoSize = True
      DragMode = dmAutomatic
      EdgeInner = esLowered
      Images = frmMain.imlTinnR
      TabOrder = 0
      Transparent = True
      Wrapable = False
      object panPage: TPanel
        Left = 0
        Top = 0
        Width = 73
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
      end
      object ToolButton1: TToolButton
        Left = 73
        Top = 0
        Width = 8
        Caption = 'ToolButton1'
        ImageIndex = 156
        Style = tbsSeparator
      end
      object tbFirstPage: TToolButton
        Left = 81
        Top = 0
        Hint = 'First page (Ctrl+PgUp)'
        ImageIndex = 132
        ParentShowHint = False
        ShowHint = True
        OnClick = tbFirstPageClick
      end
      object tbNextPage: TToolButton
        Left = 104
        Top = 0
        Hint = 'Prior page (PgUp)'
        ImageIndex = 133
        ParentShowHint = False
        ShowHint = True
        OnClick = tbNextPageClick
      end
      object tbPriorPage: TToolButton
        Left = 127
        Top = 0
        Hint = 'Next page (PgDn)'
        ImageIndex = 134
        ParentShowHint = False
        ShowHint = True
        OnClick = tbPriorPageClick
      end
      object tbLastPage: TToolButton
        Left = 150
        Top = 0
        Hint = 'Last page (Ctrl+PgDn)'
        ImageIndex = 135
        ParentShowHint = False
        ShowHint = True
        OnClick = tbLastPageClick
      end
      object ToolButton11: TToolButton
        Left = 173
        Top = 0
        Width = 8
        Caption = 'ToolButton11'
        ImageIndex = 2
        Style = tbsSeparator
      end
      object tbZoom: TToolButton
        Left = 181
        Top = 0
        Hint = 'Zoom'
        DropdownMenu = popZoom
        ImageIndex = 136
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
      end
      object udZoom: TUpDown
        Left = 219
        Top = 0
        Width = 16
        Height = 22
        Min = 30
        Max = 200
        Increment = 10
        ParentShowHint = False
        Position = 90
        ShowHint = True
        TabOrder = 1
        Thousands = False
        OnMouseDown = udZoomMouseDown
      end
      object ToolButton2: TToolButton
        Left = 235
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 0
        Style = tbsSeparator
      end
      object tbLineNumber: TToolButton
        Left = 243
        Top = 0
        Action = frmConfigurePrint.actLineNumber
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object tbWordWrap: TToolButton
        Left = 266
        Top = 0
        Action = frmConfigurePrint.actLineWrap
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object tbSyntaxColor: TToolButton
        Left = 289
        Top = 0
        Action = frmConfigurePrint.actSyntaxColor
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object tbImpressionColored: TToolButton
        Left = 312
        Top = 0
        Action = frmConfigurePrint.actImpressionColored
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Left = 335
        Top = 0
        Width = 8
        Caption = 'ToolButton4'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object tbImpressionFontIncrease: TToolButton
        Left = 343
        Top = 0
        Hint = 'Font (increase)'
        Caption = 'Font (increase)'
        ImageIndex = 261
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImpressionFontIncreaseClick
      end
      object tbImpressionFontDecrease: TToolButton
        Left = 366
        Top = 0
        Hint = 'Font (decrease)'
        Caption = 'Font (decrease)'
        ImageIndex = 262
        ParentShowHint = False
        ShowHint = True
        OnClick = tbImpressionFontDecreaseClick
      end
      object ToolButton5: TToolButton
        Left = 389
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 156
        Style = tbsSeparator
      end
      object tbPrintConfigure: TToolButton
        Left = 397
        Top = 0
        Action = frmConfigurePrint.actPrintConfig
        ParentShowHint = False
        ShowHint = True
      end
      object tbPrint: TToolButton
        Left = 420
        Top = 0
        Action = frmConfigurePrint.actPrint
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton9: TToolButton
        Left = 443
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 31
        Style = tbsSeparator
      end
      object tbClose: TToolButton
        Left = 451
        Top = 0
        Hint = 'Exit'
        ImageIndex = 155
        ParentShowHint = False
        ShowHint = True
        OnClick = tbCloseClick
      end
    end
  end
  object popZoom: TPopupMenu
    Images = frmMain.imlTinnR
    Left = 48
    Top = 44
    object Pagewidth1: TMenuItem
      Action = actZoomPageWidth
    end
    object Pageheight1: TMenuItem
      Action = actZoomPageHeight
    end
  end
  object alPrintPreview: TActionList
    Images = frmMain.imlTinnR
    Left = 48
    Top = 77
    object actZoomPageWidth: TAction
      Caption = 'Page width'
      ImageIndex = 136
      OnExecute = actZoomPageWidthExecute
    end
    object actZoomPageHeight: TAction
      Caption = 'Page height'
      ImageIndex = 137
      OnExecute = actZoomPageHeightExecute
    end
  end
end
