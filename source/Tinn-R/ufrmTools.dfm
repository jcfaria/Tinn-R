object frmTools: TfrmTools
  Left = 411
  Top = 150
  AlphaBlend = True
  AlphaBlendValue = 200
  Caption = 'Tools'
  ClientHeight = 565
  ClientWidth = 388
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
  OnActivate = FormActivate
  OnHide = FormHide
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvPoweredByJCL1: TJvPoweredByJCL
    Left = 136
    Top = 24
    Width = 1
    Height = 33
    URL = 'http://homepages.codegear.com/jedi/jcl/'
  end
  object pgTools: TJvgPageControl
    Left = 0
    Top = 0
    Width = 388
    Height = 565
    ActivePage = tbsDatabase
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Style = tsFlatButtons
    TabHeight = 18
    TabOrder = 0
    TabStop = False
    OnChange = pgToolsChange
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
    object tbsMisc: TTabSheet
      Caption = 'Misc'
      object pgMisc: TJvgPageControl
        Left = 0
        Top = 0
        Width = 380
        Height = 537
        ActivePage = tbsWinExplorer
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabHeight = 18
        TabOrder = 0
        TabStop = False
        OnChange = pgMiscChange
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
        object tbsWinExplorer: TTabSheet
          Caption = 'Windows expl.'
          object splWindows: TSplitter
            Left = 0
            Top = 130
            Width = 372
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveCaption
            ParentColor = False
            ExplicitWidth = 350
          end
          object panWinExplorer: TPanel
            Left = 0
            Top = 51
            Width = 372
            Height = 79
            Align = alTop
            TabOrder = 0
            object jvdcWinExplorer: TJvDriveCombo
              Left = 1
              Top = 1
              Width = 370
              Height = 22
              Align = alTop
              BevelInner = bvNone
              BevelOuter = bvNone
              DriveTypes = [dtUnknown, dtRemovable, dtFixed, dtRemote, dtCDROM, dtRamDisk]
              Offset = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Constraints.MinHeight = 22
            end
            object jvdlbWinExplorer: TJvDirectoryListBox
              Left = 1
              Top = 23
              Width = 370
              Height = 55
              Align = alClient
              BorderStyle = bsNone
              BevelInner = bvNone
              BevelOuter = bvNone
              Directory = 'C:\'
              FileList = jvflbWinExplorer
              DriveCombo = jvdcWinExplorer
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 17
              ParentFont = False
              PopupMenu = frmMain.pmenWinExplorerFolders
              ShowAllFolders = True
              ScrollBars = ssBoth
              TabOrder = 1
              Constraints.MinHeight = 22
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 134
            Width = 372
            Height = 375
            Align = alClient
            Constraints.MinHeight = 40
            TabOrder = 1
            object Panel7: TPanel
              Left = 1
              Top = 1
              Width = 370
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 0
              object bbtWinExplorerFilterRefresh: TBitBtn
                Left = 3
                Top = 0
                Width = 25
                Height = 21
                Hint = 'Win explorer: file (refresh list)'
                TabOrder = 0
                OnClick = bbtWinExplorerFilterRefreshClick
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B3580026B3580026B3
                  580026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656560056565600565656005656
                  560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Margin = 1
              end
              object edWinExplorerFilter: TEdit
                Left = 29
                Top = 1
                Width = 100
                Height = 19
                BevelInner = bvNone
                BevelOuter = bvNone
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                Text = '*.*'
                OnKeyDown = edWinExplorerFilterKeyDown
              end
            end
            object jvflbWinExplorer: TJvFileListBox
              Left = 1
              Top = 23
              Width = 370
              Height = 336
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              Constraints.MinHeight = 30
              DragMode = dmAutomatic
              FileType = [ftReadOnly, ftHidden, ftSystem, ftVolumeID, ftArchive, ftNormal]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              IntegralHeight = True
              ItemHeight = 16
              ParentFont = False
              PopupMenu = frmMain.pmenWinExplorerFiles
              ShowGlyphs = True
              TabOrder = 1
              OnDblClick = jvflbWinExplorerDblClick
              OnEndDrag = jvflbWinExplorerEndDrag
              OnKeyDown = jvflbWinExplorerKeyDown
              OnStartDrag = jvflbWinExplorerStartDrag
              ForceFileExtensions = True
              BorderStyle = bsNone
            end
          end
          object panWinExplorer1: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 51
            Align = alTop
            TabOrder = 2
            object Panel8: TPanel
              Left = 1
              Top = 1
              Width = 370
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                370
                25)
              object bbtExplorerAddFavorites: TBitBtn
                Left = 3
                Top = 3
                Width = 25
                Height = 22
                Hint = 'Windows explorer: folder (add favorite)'
                TabOrder = 0
                OnClick = bbtExplorerAddFavoritesClick
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00B2E8F800CDF0FA00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00ACE6F7001FBBEA00C2EDF900FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF0052E74100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00B2E8F80014B8E9001CBBEA00B7E9F800FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF0052E74100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00BAEAF90014B8E90014B8E90017B9E900A9E5F700FFFF
                  FF0052E7410052E7410052E7410052E7410052E74100FFFFFF00E6F7FD00D0F1
                  FB00D0F1FB00D0F1FB009EE2F60014B8E90014B8E90014B8E90014B8E90099E0
                  F500FFFFFF00FFFFFF0052E74100FFFFFF00FFFFFF00FFFFFF00C5EDFA0014B8
                  E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E9008BDCF400FFFFFF0052E74100FFFFFF00FFFFFF00FFFFFF00FFFFFF0040C5
                  ED0014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E90014B8E9007AD7F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9E5
                  F70014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90085DA
                  F400A1E3F600A1E3F600E1F6FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FD
                  FE002DC0EB0014B8E90014B8E90014B8E90014B8E90014B8E90014B8E9006FD4
                  F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF0093DEF50014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90017B9
                  E900E1F6FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00F1FBFE001FBBEA0014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E9006CD3F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0078D6F20014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E90017B9E900DBF4FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00DEF5FC0017B9E90014B8E90014B8E90014B8E90014B8E90014B8
                  E90014B8E90064D0F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF005CCEF00014B8E90014B8E90014B8E90014B8E90014B8
                  E90014B8E90017B9E900D6F2FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00ECF9FD00D0F1FB00D0F1FB00D0F1FB00D0F1FB00D0F1
                  FB00D0F1FB00A4E3F600CDF0FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Margin = 1
              end
              object bbtExplorerRemoveFavorites: TBitBtn
                Left = 29
                Top = 3
                Width = 25
                Height = 22
                Hint = 'Windows explorer: folder (remove favorite)'
                TabOrder = 1
                OnClick = bbtExplorerRemoveFavoritesClick
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00B2E8F800CDF0FA00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00ACE6F7001FBBEA00C2EDF900FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00B2E8F80014B8E9001CBBEA00B7E9F800FFFFFF00FFFF
                  FF002626E6002626E6002626E6002626E6002626E600FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00BAEAF90014B8E90014B8E90017B9E900A9E5F700FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E6F7FD00D0F1
                  FB00D0F1FB00D0F1FB009EE2F60014B8E90014B8E90014B8E90014B8E90099E0
                  F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5EDFA0014B8
                  E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E9008BDCF400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0040C5
                  ED0014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E90014B8E9007AD7F300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A9E5
                  F70014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90085DA
                  F400A1E3F600A1E3F600E1F6FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9FD
                  FE002DC0EB0014B8E90014B8E90014B8E90014B8E90014B8E90014B8E9006FD4
                  F200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF0093DEF50014B8E90014B8E90014B8E90014B8E90014B8E90014B8E90017B9
                  E900E1F6FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00F1FBFE001FBBEA0014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E9006CD3F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0078D6F20014B8E90014B8E90014B8E90014B8E90014B8E90014B8
                  E90017B9E900DBF4FC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00DEF5FC0017B9E90014B8E90014B8E90014B8E90014B8E90014B8
                  E90014B8E90064D0F100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF005CCEF00014B8E90014B8E90014B8E90014B8E90014B8
                  E90014B8E90017B9E900D6F2FB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00ECF9FD00D0F1FB00D0F1FB00D0F1FB00D0F1FB00D0F1
                  FB00D0F1FB00A4E3F600CDF0FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Margin = 1
              end
              object cbExplorerFavorites: TComboBox
                Left = 55
                Top = 3
                Width = 313
                Height = 21
                Hint = 'Windows explorer: folder (choice)'
                BevelInner = bvSpace
                BevelKind = bkSoft
                BevelOuter = bvRaised
                Style = csDropDownList
                Anchors = [akLeft, akRight]
                Ctl3D = False
                DropDownCount = 10
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
                ParentCtl3D = False
                ParentFont = False
                Sorted = True
                TabOrder = 2
                OnChange = cbExplorerFavoritesChange
              end
            end
            object pan: TPanel
              Left = 1
              Top = 26
              Width = 370
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 1
              DesignSize = (
                370
                22)
              object bbtWinExplorerRefresh: TBitBtn
                Left = 3
                Top = 1
                Width = 25
                Height = 21
                Hint = 'Windows explorer: file (refresh list)'
                TabOrder = 0
                OnClick = bbtWinExplorerRefreshClick
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B3580026B3580026B3
                  580026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656560056565600565656005656
                  560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Margin = 1
              end
              object fcbbToolsWinExplorer: TFilterComboBox
                Left = 29
                Top = 1
                Width = 339
                Height = 21
                Hint = 'Windows explorer: filter (choice)'
                Anchors = [akLeft, akRight]
                AutoComplete = False
                AutoDropDown = True
                BevelInner = bvSpace
                BevelKind = bkSoft
                BevelOuter = bvRaised
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnChange = fcbbToolsWinExplorerChange
              end
            end
          end
        end
        object tbsWorkExplorer: TTabSheet
          Caption = 'Work expl.'
          ImageIndex = 1
          object splWork: TSplitter
            Left = 0
            Top = 103
            Width = 372
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveCaption
            ParentColor = False
            ExplicitTop = 0
            ExplicitWidth = 352
          end
          object panWorkExplorer3: TPanel
            Left = 0
            Top = 107
            Width = 372
            Height = 402
            Align = alClient
            Constraints.MinHeight = 40
            TabOrder = 0
            object panWorkExplorer2: TPanel
              Left = 1
              Top = 1
              Width = 370
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 0
              object bbtWorkExplorerFileterRefresh: TBitBtn
                Left = 3
                Top = 0
                Width = 25
                Height = 21
                Hint = 'Work explorer: file (refresh list)'
                TabOrder = 0
                OnClick = bbtWorkExplorerFileterRefreshClick
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B3580026B3580026B3
                  580026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656560056565600565656005656
                  560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Margin = 1
              end
              object edWorkExplorerFilter: TEdit
                Left = 29
                Top = 1
                Width = 100
                Height = 19
                BevelInner = bvNone
                BevelOuter = bvNone
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                Text = '*.*'
                OnKeyDown = edWorkExplorerFilterKeyDown
              end
            end
            object jvflbWorkExplorer: TJvFileListBox
              Left = 1
              Top = 23
              Width = 370
              Height = 368
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              Constraints.MinHeight = 30
              DragMode = dmAutomatic
              FileType = [ftReadOnly, ftHidden, ftSystem, ftVolumeID, ftArchive, ftNormal]
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              IntegralHeight = True
              ItemHeight = 16
              ParentFont = False
              PopupMenu = frmMain.pmenWorkExplorerFiles
              ShowGlyphs = True
              TabOrder = 1
              OnDblClick = jvflbWorkExplorerDblClick
              OnEndDrag = jvflbWorkExplorerEndDrag
              OnKeyDown = jvflbWorkExplorerKeyDown
              OnStartDrag = jvflbWorkExplorerStartDrag
              ForceFileExtensions = True
              BorderStyle = bsNone
            end
          end
          object panWorkExplorer: TPanel
            Left = 0
            Top = 24
            Width = 372
            Height = 79
            Align = alTop
            TabOrder = 1
            object jvdcWorkExplorer: TJvDriveCombo
              Left = 1
              Top = 1
              Width = 370
              Height = 22
              Align = alTop
              BevelInner = bvNone
              BevelOuter = bvNone
              DriveTypes = [dtUnknown, dtRemovable, dtFixed, dtRemote, dtCDROM, dtRamDisk]
              Offset = 1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Constraints.MinHeight = 22
            end
            object jvdlbWorkExplorer: TJvDirectoryListBox
              Left = 1
              Top = 23
              Width = 370
              Height = 55
              Align = alClient
              BorderStyle = bsNone
              BevelInner = bvNone
              BevelOuter = bvNone
              Directory = 'C:\'
              FileList = jvflbWorkExplorer
              DriveCombo = jvdcWorkExplorer
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 17
              ParentFont = False
              PopupMenu = frmMain.pmenWorkExplorerFolders
              ShowAllFolders = True
              ScrollBars = ssBoth
              TabOrder = 1
              Constraints.MinHeight = 22
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 24
            Align = alTop
            AutoSize = True
            TabOrder = 2
            object Panel10: TPanel
              Left = 1
              Top = 1
              Width = 370
              Height = 22
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 0
              DesignSize = (
                370
                22)
              object bbtWorkExplorerRefresh: TBitBtn
                Left = 3
                Top = 0
                Width = 25
                Height = 21
                Hint = 'Work explorer: file (refresh list)'
                TabOrder = 0
                OnClick = bbtWorkExplorerRefreshClick
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  20000000000000040000120B0000120B00000000000000000000FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B3580026B3580026B3
                  580026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B3580026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0026B35800FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF0026B35800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF0056565600FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005656560056565600565656005656
                  560056565600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00565656005656
                  5600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0056565600FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
                  FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
                Margin = 1
              end
              object fcbbToolsWorkExplorer: TFilterComboBox
                Left = 29
                Top = 0
                Width = 341
                Height = 21
                Hint = 'Work explorer: filter (choice)'
                Anchors = [akLeft, akRight]
                AutoComplete = False
                AutoDropDown = True
                BevelInner = bvSpace
                BevelKind = bkSoft
                BevelOuter = bvRaised
                Ctl3D = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentCtl3D = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnChange = fcbbToolsWorkExplorerChange
              end
            end
          end
        end
        object tbsProject: TTabSheet
          Caption = 'Project'
          ImageIndex = 2
          object tvProject: TTreeView
            Left = 0
            Top = 30
            Width = 372
            Height = 460
            Align = alClient
            Anchors = [akLeft, akRight, akBottom]
            BevelInner = bvNone
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            BorderStyle = bsNone
            Ctl3D = False
            DragMode = dmAutomatic
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Images = frmMain.imlProject
            Indent = 19
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentFont = False
            PopupMenu = frmMain.pmenProjects
            ReadOnly = True
            RightClickSelect = True
            TabOrder = 0
            OnAddition = tvProjectAddition
            OnChange = tvProjectChange
            OnDblClick = tvProjectDblClick
            OnDeletion = tvProjectDeletion
            OnDragDrop = tvProjectDragDrop
            OnDragOver = tvProjectDragOver
            OnEndDrag = tvProjectEndDrag
            OnKeyDown = tvProjectKeyDown
            OnStartDrag = tvProjectStartDrag
          end
          object panProject: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 30
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            BorderWidth = 2
            Color = 16250871
            ParentBackground = False
            TabOrder = 1
            object TBDProject: TTBDock
              Left = 2
              Top = 2
              Width = 368
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBProject: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBControlItem1: TTBControlItem
                  Control = tbRecentBar
                end
                object TBSeparatorItem9: TTBSeparatorItem
                end
                object pmenProject: TTBSubmenuItem
                  Caption = 'Project'
                  Hint = 'Project: project'
                  ImageIndex = 65
                  object pmenProjNew: TTBItem
                    Action = frmMain.actProjectNew
                  end
                  object pmenProjOpen: TTBItem
                    Action = frmMain.actProjectOpen
                  end
                  object pmenProjOpenDemo: TTBItem
                    Action = frmMain.actProjectOpenDemo
                  end
                  object N102: TTBSeparatorItem
                  end
                  object pmenProjectSave: TTBItem
                    Action = frmMain.actProjectSave
                  end
                  object pmenProjectSaveAs: TTBItem
                    Action = frmMain.actProjectSaveAs
                  end
                  object N44: TTBSeparatorItem
                  end
                  object pmenProjectClose: TTBItem
                    Action = frmMain.actProjectClose
                  end
                  object N37: TTBSeparatorItem
                  end
                  object pmenProjectDeleteCurrent: TTBItem
                    Action = frmMain.actProjectDeleteCurrent
                  end
                end
                object N59: TTBSeparatorItem
                end
                object pmenGroup: TTBSubmenuItem
                  Caption = 'Group'
                  Hint = 'Project: group'
                  ImageIndex = 70
                  object pmenGroupNew: TTBItem
                    Action = frmMain.actGrouptNew
                  end
                  object N43: TTBSeparatorItem
                  end
                  object pmenGroupRename: TTBItem
                    Action = frmMain.actGroupRename
                  end
                  object N34: TTBSeparatorItem
                  end
                  object pmenGroupDeleteCurrent: TTBItem
                    Action = frmMain.actGroupDeleteCurrent
                  end
                  object pmenGroupDeleteAll: TTBItem
                    Action = frmMain.actGroupDeleteAll
                  end
                end
                object TBItem2: TTBItem
                  Action = frmMain.actGroupExpandAll
                end
                object TBItem1: TTBItem
                  Action = frmMain.actGroupCollapseAll
                end
                object N56: TTBSeparatorItem
                end
                object pmenFiles: TTBSubmenuItem
                  Caption = 'File'
                  Hint = 'Project: file'
                  ImageIndex = 49
                  object pmenFilesOpenAll: TTBItem
                    Action = frmMain.actFilesOpenAll
                  end
                  object pmenFilesCloseAll: TTBItem
                    Action = frmMain.actFilesCloseAll
                  end
                  object N47: TTBSeparatorItem
                  end
                  object pmenFilesOpenAllOfGroup: TTBItem
                    Action = frmMain.actFilesOpenAllOfGroup
                  end
                  object pmenFilesCloseAllOfGroup: TTBItem
                    Action = frmMain.actFilesCloseAllOfGroup
                  end
                  object n45: TTBSeparatorItem
                  end
                  object pmenFilesAdd: TTBItem
                    Action = frmMain.actFilesAdd
                  end
                  object pmenFilesAddCurrent: TTBItem
                    Action = frmMain.actFilesAddCurrent
                  end
                  object N38: TTBSeparatorItem
                  end
                  object pmenFilesDeleteAllOfProject: TTBItem
                    Action = frmMain.actFilesRemoveAllOfProject
                  end
                  object pmenFilesDeleteAllOfGroup: TTBItem
                    Action = frmMain.actFilesRemoveAllOfGroup
                  end
                  object pmenFilesDeleteCurrent: TTBItem
                    Action = frmMain.actFilesRemove
                  end
                  object TBSeparatorItem26: TTBSeparatorItem
                  end
                  object TBSubmenuItem11: TTBSubmenuItem
                    Caption = 'Copy full path to clipboard'
                    object TBItem46: TTBItem
                      Action = frmMain.actFilesFullPathUnix
                    end
                    object TBItem47: TTBItem
                      Action = frmMain.actFilesFullPathWindows
                    end
                  end
                end
                object TBSeparatorItem14: TTBSeparatorItem
                end
                object TBEditProject: TTBItem
                  Action = frmMain.actProjectEdit
                end
                object TBReloadProject: TTBItem
                  Action = frmMain.actProjectReload
                end
                object TBSeparatorItem4: TTBSeparatorItem
                end
                object TBItem23: TTBItem
                  Action = frmMain.actProjectOpenNode
                end
                object tbRecentBar: TToolBar
                  Left = 0
                  Top = 0
                  Width = 38
                  Height = 22
                  Align = alNone
                  AutoSize = True
                  EdgeInner = esLowered
                  Images = frmMain.imlTinnR
                  TabOrder = 0
                  Transparent = True
                  Wrapable = False
                  object tbRecent: TToolButton
                    Left = 0
                    Top = 0
                    Hint = 'Project: open'
                    Caption = 'Recent Files'
                    DropdownMenu = frmMain.pmenProjectMRU
                    ImageIndex = 66
                    Style = tbsDropDown
                    OnClick = tbRecentClick
                  end
                end
              end
            end
          end
          object stbProject: TStatusBar
            Left = 0
            Top = 490
            Width = 372
            Height = 19
            Color = 16250871
            Panels = <
              item
                Bevel = pbNone
                Text = 'Total:'
                Width = 29
              end
              item
                Width = 40
              end
              item
                Bevel = pbNone
                Text = 'Index:'
                Width = 35
              end
              item
                Width = 40
              end
              item
                Bevel = pbNone
                Text = 'Sel:'
                Width = 21
              end
              item
                Width = 50
              end>
          end
        end
      end
    end
    object tbsMarkup: TTabSheet
      Caption = 'Markup'
      ImageIndex = 3
      object pgMarkup: TJvgPageControl
        Left = 0
        Top = 0
        Width = 380
        Height = 537
        ActivePage = tbsTxt2tags
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MultiLine = True
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
        object tbsTxt2tags: TTabSheet
          Caption = 'Txt2tags'
          object pgTxt2tags: TJvgPageControl
            Left = 0
            Top = 0
            Width = 372
            Height = 509
            ActivePage = tbsTxt2tagsSettings
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
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
            object tbsTxt2tagsMarks: TTabSheet
              Caption = 'Marks'
              object Label1: TLabel
                Tag = 1
                Left = 8
                Top = 9
                Width = 29
                Height = 13
                Caption = 'Title 1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label2: TLabel
                Tag = 2
                Left = 8
                Top = 25
                Width = 29
                Height = 13
                Caption = 'Title 2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label3: TLabel
                Tag = 3
                Left = 8
                Top = 42
                Width = 29
                Height = 13
                Caption = 'Title 3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label4: TLabel
                Tag = 4
                Left = 8
                Top = 59
                Width = 29
                Height = 13
                Caption = 'Title 4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label5: TLabel
                Tag = 5
                Left = 8
                Top = 76
                Width = 29
                Height = 13
                Caption = 'Title 5'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label6: TLabel
                Tag = 6
                Left = 8
                Top = 93
                Width = 55
                Height = 13
                Caption = 'Title num. 1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label7: TLabel
                Tag = 7
                Left = 8
                Top = 110
                Width = 55
                Height = 13
                Caption = 'Title num. 2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label8: TLabel
                Tag = 8
                Left = 8
                Top = 127
                Width = 55
                Height = 13
                Caption = 'Title num. 3'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label9: TLabel
                Tag = 9
                Left = 8
                Top = 144
                Width = 55
                Height = 13
                Caption = 'Title num. 4'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label10: TLabel
                Tag = 10
                Left = 8
                Top = 161
                Width = 55
                Height = 13
                Caption = 'Title num. 5'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label11: TLabel
                Tag = 11
                Left = 95
                Top = 9
                Width = 21
                Height = 13
                Caption = 'Bold'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label12: TLabel
                Tag = 12
                Left = 95
                Top = 25
                Width = 22
                Height = 13
                Caption = 'Italic'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label13: TLabel
                Tag = 13
                Left = 95
                Top = 42
                Width = 45
                Height = 13
                Caption = 'Underline'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label14: TLabel
                Tag = 14
                Left = 95
                Top = 59
                Width = 27
                Height = 13
                Caption = 'Mono'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label15: TLabel
                Tag = 15
                Left = 95
                Top = 76
                Width = 29
                Height = 13
                Caption = 'Quote'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label16: TLabel
                Tag = 16
                Left = 95
                Top = 93
                Width = 16
                Height = 13
                Caption = 'List'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label17: TLabel
                Tag = 17
                Left = 95
                Top = 110
                Width = 42
                Height = 13
                Caption = 'List num.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label18: TLabel
                Tag = 18
                Left = 95
                Top = 127
                Width = 37
                Height = 13
                Caption = 'List def.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label19: TLabel
                Tag = 19
                Left = 95
                Top = 144
                Width = 20
                Height = 13
                Caption = 'Link'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label20: TLabel
                Tag = 20
                Left = 95
                Top = 161
                Width = 34
                Height = 13
                Caption = 'Anchor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label21: TLabel
                Tag = 21
                Left = 166
                Top = 9
                Width = 60
                Height = 13
                Caption = 'Verbatim line'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label22: TLabel
                Tag = 22
                Left = 166
                Top = 25
                Width = 65
                Height = 13
                Caption = 'Verbatim area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label23: TLabel
                Tag = 23
                Left = 166
                Top = 42
                Width = 42
                Height = 13
                Caption = 'Raw text'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label24: TLabel
                Tag = 24
                Left = 166
                Top = 59
                Width = 41
                Height = 13
                Caption = 'Raw line'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label25: TLabel
                Tag = 25
                Left = 166
                Top = 76
                Width = 46
                Height = 13
                Caption = 'Raw area'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label26: TLabel
                Tag = 26
                Left = 166
                Top = 93
                Width = 29
                Height = 13
                Caption = 'Image'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label27: TLabel
                Tag = 27
                Left = 166
                Top = 110
                Width = 49
                Height = 13
                Caption = 'Comments'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label28: TLabel
                Tag = 28
                Left = 166
                Top = 127
                Width = 27
                Height = 13
                Caption = 'Table'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label29: TLabel
                Tag = 29
                Left = 166
                Top = 144
                Width = 73
                Height = 13
                Caption = 'Line sep. single'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label30: TLabel
                Tag = 30
                Left = 166
                Top = 161
                Width = 78
                Height = 13
                Caption = 'Line sep. double'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
            end
            object tbsTxt2tagsMacros: TTabSheet
              Caption = 'Macros'
              ImageIndex = 1
              object Label31: TLabel
                Tag = 31
                Left = 8
                Top = 9
                Width = 23
                Height = 13
                Caption = 'Date'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label32: TLabel
                Tag = 32
                Left = 8
                Top = 25
                Width = 79
                Height = 13
                Caption = 'Modification time'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label33: TLabel
                Tag = 33
                Left = 133
                Top = 9
                Width = 57
                Height = 13
                Caption = 'Path source'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label34: TLabel
                Tag = 34
                Left = 133
                Top = 25
                Width = 76
                Height = 13
                Caption = 'Path destination'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label35: TLabel
                Tag = 35
                Left = 8
                Top = 43
                Width = 83
                Height = 13
                Caption = 'Table of contents'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label36: TLabel
                Tag = 36
                Left = 133
                Top = 43
                Width = 68
                Height = 13
                Caption = 'Document title'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
            end
            object tbsTxt2tagsSettings: TTabSheet
              Caption = 'Settings'
              ImageIndex = 2
              object Label37: TLabel
                Tag = 37
                Left = 8
                Top = 9
                Width = 31
                Height = 13
                Caption = 'Target'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label38: TLabel
                Tag = 38
                Left = 8
                Top = 25
                Width = 36
                Height = 13
                Caption = 'Options'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label39: TLabel
                Tag = 39
                Left = 81
                Top = 9
                Width = 65
                Height = 13
                Caption = 'Pre processor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label40: TLabel
                Tag = 40
                Left = 81
                Top = 25
                Width = 70
                Height = 13
                Caption = 'Post processor'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label41: TLabel
                Tag = 41
                Left = 182
                Top = 9
                Width = 45
                Height = 13
                Caption = 'Encoding'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
              object Label42: TLabel
                Tag = 42
                Left = 182
                Top = 25
                Width = 23
                Height = 13
                Caption = 'Style'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clMenuText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Transparent = True
                OnClick = LabelClick
                OnMouseEnter = LabelMouseEnter
                OnMouseLeave = LabelMouseLeave
              end
            end
          end
        end
        object tbsLatex: TTabSheet
          Caption = 'LaTeX'
          ImageIndex = 1
          object pgLatex: TJvgPageControl
            Left = 0
            Top = 26
            Width = 372
            Height = 483
            ActivePage = tbsLatexBracket
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
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
            object tbsLatexAccent: TTabSheet
              Caption = 'Accent'
              object jvivAccents: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexAccents
              end
            end
            object tbsLatexArrow: TTabSheet
              Caption = 'Arrow'
              ImageIndex = 1
              object ScrollBox3: TScrollBox
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                object GroupBox21: TGroupBox
                  Left = 0
                  Top = 236
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Sloped '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object jvivArrowSloped: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox22: TGroupBox
                  Left = 0
                  Top = 186
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Up '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object jvivArrowUp: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox23: TGroupBox
                  Left = 0
                  Top = 136
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Left '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 2
                  object jvivArrowLeft: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox24: TGroupBox
                  Left = 0
                  Top = 86
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Down '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 3
                  object jvivArrowDown: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox25: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 364
                  Height = 86
                  Align = alTop
                  Caption = ' Right '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 4
                  object jvivArrowRight: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 71
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox20: TGroupBox
                  Left = 0
                  Top = 336
                  Width = 364
                  Height = 119
                  Align = alClient
                  Caption = ' Box '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 5
                  object jvivArrowBox: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 104
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox19: TGroupBox
                  Left = 0
                  Top = 286
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Both '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 6
                  object jvivArrowBoth: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
              end
            end
            object tbsLatexBar: TTabSheet
              Caption = 'Bar'
              ImageIndex = 2
              object jvivBar: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexBracket: TTabSheet
              Caption = 'Bracket'
              ImageIndex = 3
              object jvivBracket: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexDot: TTabSheet
              Caption = 'Dot'
              ImageIndex = 4
              object jvivDot: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexGeometry: TTabSheet
              Caption = 'Geometry'
              ImageIndex = 8
              object ScrollBox1: TScrollBox
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                object GroupBox18: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Line '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object jvivGeometryLine: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox17: TGroupBox
                  Left = 0
                  Top = 50
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Angle '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object jvivGeometryAngle: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox16: TGroupBox
                  Left = 0
                  Top = 100
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Triangle '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 2
                  object jvivGeometryTriangle: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox15: TGroupBox
                  Left = 0
                  Top = 150
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Star '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 3
                  object jvivGeometryStar: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox14: TGroupBox
                  Left = 0
                  Top = 200
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Box '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 4
                  object jvivGeometryBox: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox13: TGroupBox
                  Left = 0
                  Top = 250
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Diamond '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 5
                  object jvivGeometryDiamond: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox12: TGroupBox
                  Left = 0
                  Top = 300
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Circle '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 6
                  object jvivGeometryCircle: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox11: TGroupBox
                  Left = 0
                  Top = 350
                  Width = 364
                  Height = 105
                  Align = alClient
                  Caption = ' Var '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 7
                  object jvivGeometryVar: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 90
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                  end
                end
                object GroupBox10: TGroupBox
                  Left = 0
                  Top = 350
                  Width = 364
                  Height = 105
                  Align = alClient
                  Caption = ' Misc '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 8
                  object jvivGeometryMisc: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 90
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
              end
            end
            object tbsLatexGreek: TTabSheet
              Caption = 'Greek'
              ImageIndex = 9
              object ScrollBox2: TScrollBox
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                object GroupBox4: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 364
                  Height = 86
                  Align = alTop
                  Caption = ' Lower '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object jvivGreekLower: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 71
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox3: TGroupBox
                  Left = 0
                  Top = 86
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Upper '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object jvivGreekUpper: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox2: TGroupBox
                  Left = 0
                  Top = 136
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Var '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 2
                  object jvivGreekVar: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox1: TGroupBox
                  Left = 0
                  Top = 186
                  Width = 364
                  Height = 269
                  Align = alClient
                  Caption = ' Misc '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 3
                  object jvivGreekMisc: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 254
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
              end
            end
            object tbsLatexMath: TTabSheet
              Caption = 'Math'
              ImageIndex = 10
              object ScrollBox5: TScrollBox
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                object GroupBox9: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Function '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object jvivMathFunction: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox8: TGroupBox
                  Left = 0
                  Top = 50
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Logical '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object jvivMathLogical: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox7: TGroupBox
                  Left = 0
                  Top = 100
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Set '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 2
                  object jvivMathSet: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox6: TGroupBox
                  Left = 0
                  Top = 150
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Var '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 3
                  object jvivMathVar: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox5: TGroupBox
                  Left = 0
                  Top = 200
                  Width = 364
                  Height = 255
                  Align = alClient
                  Caption = ' Misc '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 4
                  object jvivMathMisc: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 240
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
              end
            end
            object tbsLatexMisc: TTabSheet
              Caption = 'Misc'
              ImageIndex = 11
              object jvivMisc: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexNegation: TTabSheet
              Caption = 'Negation'
              ImageIndex = 12
              object jvivNegation: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexOperator: TTabSheet
              Caption = 'Operator'
              ImageIndex = 5
              object jvivOperator: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexRelation: TTabSheet
              Caption = 'Relation'
              ImageIndex = 6
              object jvivRelation: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object tbsLatexSky: TTabSheet
              Caption = 'Sky'
              ImageIndex = 7
              object ScrollBox4: TScrollBox
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                Align = alClient
                BevelInner = bvNone
                BevelOuter = bvNone
                BorderStyle = bsNone
                TabOrder = 0
                object GroupBox26: TGroupBox
                  Left = 0
                  Top = 100
                  Width = 364
                  Height = 355
                  Align = alClient
                  Caption = ' Var '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 0
                  object jvivSkyVar: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 340
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox27: TGroupBox
                  Left = 0
                  Top = 50
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Astrology '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 1
                  object jvivSkyAstrology: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
                object GroupBox28: TGroupBox
                  Left = 0
                  Top = 0
                  Width = 364
                  Height = 50
                  Align = alTop
                  Caption = ' Solar '
                  Ctl3D = False
                  ParentCtl3D = False
                  TabOrder = 2
                  object jvivSkySolar: TJvImagesViewer
                    Left = 1
                    Top = 14
                    Width = 362
                    Height = 35
                    HorzScrollBar.Range = 31
                    HorzScrollBar.Tracking = True
                    HorzScrollBar.Visible = False
                    VertScrollBar.Range = 31
                    VertScrollBar.Tracking = True
                    FileMask = 
                      '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                      'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                      'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                      'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                      '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                    Options.AutoCenter = False
                    Options.Alignment = taLeftJustify
                    Options.FrameColor = clNone
                    Options.Height = 30
                    Options.HorzSpacing = 1
                    Options.HotTrack = False
                    Options.ImagePadding = 1
                    Options.MultiSelect = False
                    Options.ReduceMemoryUsage = True
                    Options.Transparent = True
                    Options.ShowCaptions = False
                    Options.VertSpacing = 1
                    Options.Width = 30
                    SelectedIndex = -1
                    OnItemHint = LatexHint
                    Align = alClient
                    TabOrder = 0
                    TabStop = True
                    OnMouseMove = LatexMouseMove
                    OnMouseUp = LatexSymbol
                  end
                end
              end
            end
            object tbsLatexUserCustom: TTabSheet
              Caption = 'User custom'
              ImageIndex = 13
              object jvivUserCustom: TJvImagesViewer
                Left = 0
                Top = 0
                Width = 364
                Height = 455
                HorzScrollBar.Range = 31
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
          end
          object TBDLatex: TTBDock
            Left = 0
            Top = 0
            Width = 372
            Height = 26
            BackgroundOnToolbars = False
            Color = 16250871
            object TBTLatex: TTBToolbar
              Left = 0
              Top = 0
              BorderStyle = bsNone
              Caption = 'TBProject'
              ChevronMoveItems = False
              Color = 16250871
              DockMode = dmCannotFloatOrChangeDocks
              DockPos = 0
              Images = frmMain.imlTinnR
              TabOrder = 0
              object TBSubmenuItem16: TTBSubmenuItem
                Caption = 'Math'
                Hint = 'LaTeX: math'
                ImageIndex = 97
                object TBItem59: TTBItem
                  Action = frmMain.actLatexDimensional
                end
                object TBSeparatorItem30: TTBSeparatorItem
                end
                object TBItem71: TTBItem
                  Action = frmMain.actLatexAlgebricFrac
                end
                object TBItem70: TTBItem
                  Action = frmMain.actLatexAlgebricSqrt
                end
                object TBItem69: TTBItem
                  Action = frmMain.actLatexAlgebricSqrtN
                end
              end
              object TBSeparatorItem41: TTBSeparatorItem
              end
              object TBSubmenuItem13: TTBSubmenuItem
                Caption = 'Header'
                Hint = 'LaTeX: header'
                ImageIndex = 214
                object tbiHeader: TTBItem
                  Action = frmMain.actLatexHeaderPart
                end
                object TBItem60: TTBItem
                  Action = frmMain.actLatexHeaderChapter
                end
                object TBItem61: TTBItem
                  Action = frmMain.actLatexHeaderSection
                end
                object TBItem62: TTBItem
                  Action = frmMain.actLatexHeaderSubSection
                end
                object TBItem63: TTBItem
                  Action = frmMain.actLatexHeaderSubSubSection
                end
                object TBItem64: TTBItem
                  Action = frmMain.actLatexHeaderParagraph
                end
                object TBItem66: TTBItem
                  Action = frmMain.actLatexHeaderSubParagraph
                end
              end
              object TBSubmenuItem14: TTBSubmenuItem
                Caption = 'Format'
                Hint = 'LaTeX: format'
                ImageIndex = 217
                object tbiFormat: TTBItem
                  Action = frmMain.actLatexFormatItemization
                end
                object TBItem67: TTBItem
                  Action = frmMain.actLatexFormatEnumeration
                end
                object TBSeparatorItem34: TTBSeparatorItem
                end
                object TBItem68: TTBItem
                  Action = frmMain.actLatexFormatLeft
                end
                object TBItem73: TTBItem
                  Action = frmMain.actLatexFormatCenter
                end
                object TBItem74: TTBItem
                  Action = frmMain.actLatexFormatRight
                end
              end
              object TBSubmenuItem15: TTBSubmenuItem
                Caption = 'Font'
                Hint = 'LaTeX: font'
                ImageIndex = 221
                object tbiFont: TTBItem
                  Action = frmMain.actLatexFontEnphase
                end
                object TBItem72: TTBItem
                  Action = frmMain.actLatexFontBold
                end
                object TBItem78: TTBItem
                  Action = frmMain.actLatexFontItalic
                end
                object TBItem77: TTBItem
                  Action = frmMain.actLatexFontSlatend
                end
                object TBItem76: TTBItem
                  Action = frmMain.actLatexFontTypewriter
                end
                object TBItem75: TTBItem
                  Action = frmMain.actLatexFontSmallcaps
                end
                object TBSeparatorItem31: TTBSeparatorItem
                end
                object TBItem88: TTBItem
                  Action = frmMain.actLatexFontTiny
                end
                object TBItem87: TTBItem
                  Action = frmMain.actLatexFontScript
                end
                object TBItem86: TTBItem
                  Action = frmMain.actLatexFontFootnote
                end
                object TBItem85: TTBItem
                  Action = frmMain.actLatexFontSmall
                end
                object TBItem84: TTBItem
                  Action = frmMain.actLatexFontNormal
                end
                object TBItem83: TTBItem
                  Action = frmMain.actLatexFontLarge
                end
                object TBItem82: TTBItem
                  Action = frmMain.actLatexFontLarger
                end
                object TBItem81: TTBItem
                  Action = frmMain.actLatexFontLargest
                end
                object TBItem80: TTBItem
                  Action = frmMain.actLatexFontHuge
                end
                object TBItem79: TTBItem
                  Action = frmMain.actLatexFontHuger
                end
              end
              object TBSeparatorItem29: TTBSeparatorItem
              end
              object TBItem65: TTBItem
                Action = frmMain.actReloadLatexSymbols
              end
            end
          end
        end
      end
    end
    object tbsResults: TTabSheet
      Caption = 'Results'
      ImageIndex = 1
      object pgResults: TJvgPageControl
        Left = 0
        Top = 0
        Width = 380
        Height = 537
        ActivePage = tbsSearch
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabHeight = 18
        TabOrder = 0
        TabStop = False
        OnChange = pgResultsChange
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
        object tbsIniLog: TTabSheet
          Caption = 'Ini log'
          object memIniLog: TMemo
            Left = 0
            Top = 0
            Width = 372
            Height = 509
            Align = alClient
            BorderStyle = bsNone
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBackground
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            HideSelection = False
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
          end
        end
        object tbsSearch: TTabSheet
          Caption = 'Search'
          ImageIndex = 1
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 30
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            BorderWidth = 2
            Color = 16250871
            ParentBackground = False
            TabOrder = 0
            object TBDSearch: TTBDock
              Left = 2
              Top = 2
              Width = 368
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBToolbar1: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                object Expand: TTBSubmenuItem
                  Hint = 'Search: expand'
                  ImageIndex = 71
                  object TBItem97: TTBItem
                    Action = frmMain.actSearchExpandOne
                  end
                  object TBItem106: TTBItem
                    Action = frmMain.actSearchExpandAll
                  end
                end
                object Collapse: TTBSubmenuItem
                  Hint = 'Search: collapse'
                  ImageIndex = 72
                  object TBItem99: TTBItem
                    Action = frmMain.actSearchCollapseOne
                  end
                  object TBItem107: TTBItem
                    Action = frmMain.actSearchCollapseAll
                  end
                end
              end
            end
          end
          object tvSearch: TTreeView
            Left = 0
            Top = 30
            Width = 372
            Height = 460
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            BorderStyle = bsNone
            Ctl3D = False
            DragMode = dmAutomatic
            Images = frmMain.imlSearch
            Indent = 19
            ParentBiDiMode = False
            ParentCtl3D = False
            PopupMenu = frmMain.pmenSearch
            ReadOnly = True
            RightClickSelect = True
            TabOrder = 1
            OnChange = tvSearchChange
            OnDblClick = tvSearchDblClick
            OnDragOver = tvSearchDragOver
            OnEndDrag = tvSearchEndDrag
            OnStartDrag = tvSearchStartDrag
          end
          object stbSearch: TStatusBar
            Left = 0
            Top = 490
            Width = 372
            Height = 19
            Color = 16250871
            Panels = <
              item
                Bevel = pbNone
                Text = 'Total:'
                Width = 32
              end
              item
                Width = 50
              end
              item
                Bevel = pbNone
                Text = 'Index:'
                Width = 35
              end
              item
                Width = 50
              end
              item
                Bevel = pbNone
                Text = 'Selected:'
                Width = 51
              end
              item
                Width = 50
              end>
          end
        end
        object tbsHexViewer: TTabSheet
          Caption = 'Hex viewer'
          ImageIndex = 2
          object ATBinHex: TATBinHex
            Left = 0
            Top = 52
            Width = 372
            Height = 457
            Cursor = crIBeam
            Align = alClient
            BevelEdges = []
            BevelOuter = bvNone
            BorderStyle = bsSingle
            Color = clWindow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Courier New'
            Font.Style = []
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
            FontOEM.Charset = ANSI_CHARSET
            FontOEM.Color = clWindowText
            FontOEM.Height = -12
            FontOEM.Name = 'Terminal'
            FontOEM.Style = []
            FontFooter.Charset = DEFAULT_CHARSET
            FontFooter.Color = clBlack
            FontFooter.Height = -12
            FontFooter.Name = 'Arial'
            FontFooter.Style = []
            FontGutter.Charset = DEFAULT_CHARSET
            FontGutter.Color = clBlack
            FontGutter.Height = -12
            FontGutter.Name = 'Courier New'
            FontGutter.Style = []
            TextGutter = True
          end
          object rgHexViewerMode: TRadioGroup
            Left = 0
            Top = 0
            Width = 372
            Height = 52
            Align = alTop
            Caption = ' Mode '
            Columns = 3
            Items.Strings = (
              'Text'
              'Binary'
              'Hex'
              'Unicode'
              'Unicode/Hex')
            TabOrder = 1
            OnClick = rgHexViewerModeClick
          end
        end
      end
    end
    object tbsSpell: TTabSheet
      Caption = 'Spell'
      ImageIndex = 3
      object memSpell: TMemo
        Left = 0
        Top = 0
        Width = 380
        Height = 537
        Align = alClient
        BorderStyle = bsNone
        Color = clWhite
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        HideSelection = False
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = frmMain.pmenSpell
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
    object tbsDatabase: TTabSheet
      Caption = 'Database'
      ImageIndex = 6
      object pgDatabase: TJvgPageControl
        Left = 0
        Top = 0
        Width = 380
        Height = 537
        ActivePage = tbsComments
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Style = tsFlatButtons
        TabHeight = 18
        TabOrder = 0
        TabStop = False
        OnChange = pgDatabaseChange
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
        object tbsShortcuts: TTabSheet
          Caption = 'Shortcuts'
          ImageIndex = 3
          object splShortcuts: TSplitter
            Left = 0
            Top = 113
            Width = 372
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveCaption
            ParentColor = False
            ExplicitWidth = 350
          end
          object Panel13: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            Color = 16250871
            ParentBackground = False
            TabOrder = 0
            object TBDShortcuts: TTBDock
              Left = 0
              Top = 0
              Width = 372
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBToolbar2: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBItem24: TTBItem
                  Action = frmMain.actShortcutsHelp
                end
                object TBSeparatorItem6: TTBSeparatorItem
                end
                object TBItem28: TTBItem
                  Action = frmMain.actShortcutsEdit
                end
              end
            end
          end
          object panShortcuts: TPanel
            Left = 0
            Top = 26
            Width = 372
            Height = 87
            Align = alTop
            BevelOuter = bvNone
            Color = 16250871
            Constraints.MinHeight = 15
            ParentBackground = False
            TabOrder = 1
            object lbShortcuts: TListBox
              Left = 0
              Top = 0
              Width = 372
              Height = 87
              AutoComplete = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              ItemHeight = 13
              ParentCtl3D = False
              PopupMenu = frmMain.pmenFontGeneric
              Sorted = True
              TabOrder = 0
              OnClick = lbShortcutsClick
            end
          end
          object Panel11: TPanel
            Left = 0
            Top = 117
            Width = 372
            Height = 392
            Align = alClient
            BevelOuter = bvNone
            Color = 16250871
            ParentBackground = False
            TabOrder = 2
            object dbShortcutsMemo: TDBMemo
              Left = 0
              Top = 360
              Width = 372
              Height = 32
              HelpType = htKeyword
              Align = alBottom
              BevelInner = bvNone
              BevelOuter = bvNone
              Constraints.MaxHeight = 120
              Ctl3D = False
              DataField = 'Hint'
              DataSource = modDados.dsShortcuts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              ReadOnly = True
              ScrollBars = ssVertical
              ShowHint = False
              TabOrder = 0
              WantReturns = False
            end
            object dbgShortcuts: TDBGrid
              Left = 0
              Top = 18
              Width = 372
              Height = 342
              Align = alClient
              BorderStyle = bsNone
              Ctl3D = False
              DataSource = modDados.dsShortcuts
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentCtl3D = False
              ParentFont = False
              PopupMenu = frmMain.pmenShortcuts
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = dbgShortcutsDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Caption'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Shortcut'
                  Title.Alignment = taRightJustify
                  Width = 50
                  Visible = True
                end>
            end
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 372
              Height = 18
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 2
              object imgShortcut: TImage
                Left = 0
                Top = 0
                Width = 18
                Height = 18
                Hint = 'Shortcuts: Image'
                Align = alLeft
                Center = True
                Transparent = True
              end
              object JvDBNavigator2: TJvDBNavigator
                Left = 18
                Top = 0
                Width = 354
                Height = 18
                DataSource = modDados.dsShortcuts
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alClient
                Flat = True
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
              end
            end
          end
        end
        object tbsCompletion: TTabSheet
          Caption = 'Completion'
          object splCompletion: TSplitter
            Left = 0
            Top = 113
            Width = 372
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveCaption
            ParentColor = False
            ExplicitTop = 157
            ExplicitWidth = 345
          end
          object panCompletion: TPanel
            Left = 0
            Top = 26
            Width = 372
            Height = 87
            Align = alTop
            BevelOuter = bvNone
            Constraints.MinHeight = 15
            TabOrder = 0
            object lbCompletion: TListBox
              Left = 0
              Top = 0
              Width = 372
              Height = 87
              AutoComplete = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              ItemHeight = 13
              ParentCtl3D = False
              PopupMenu = frmMain.pmenFontGeneric
              TabOrder = 0
              OnClick = lbCompletionClick
            end
          end
          object panCompletion4: TPanel
            Left = 0
            Top = 117
            Width = 372
            Height = 392
            Align = alClient
            BevelOuter = bvNone
            Color = 16250871
            ParentBackground = False
            TabOrder = 1
            object dbCompletionMemo: TDBMemo
              Left = 0
              Top = 312
              Width = 372
              Height = 80
              HelpType = htKeyword
              Align = alBottom
              BevelInner = bvNone
              BevelOuter = bvNone
              Constraints.MaxHeight = 120
              Ctl3D = False
              DataField = 'Completion'
              DataSource = modDados.dsCompletion
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              PopupMenu = frmMain.pmenCompletionMemo
              ReadOnly = True
              ScrollBars = ssVertical
              ShowHint = False
              TabOrder = 0
              WantReturns = False
            end
            object dbgCompletion: TDBGrid
              Left = 0
              Top = 18
              Width = 372
              Height = 294
              Align = alClient
              BorderStyle = bsNone
              DataSource = modDados.dsCompletion
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = frmMain.pmenCompletion
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = dbgCompletionDblClick
              OnKeyDown = dbgCompletionKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Function'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Trigger'
                  Title.Alignment = taRightJustify
                  Width = 50
                  Visible = True
                end>
            end
            object panCompletion3: TPanel
              Left = 0
              Top = 0
              Width = 372
              Height = 18
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 2
              object JvDBNavigator1: TJvDBNavigator
                Left = 0
                Top = 0
                Width = 372
                Height = 18
                DataSource = modDados.dsCompletion
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alClient
                Flat = True
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
              end
            end
          end
          object panCompletion1: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object TBDCompletion: TTBDock
              Left = 0
              Top = 0
              Width = 372
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBCompletion: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBItemCompletion23: TTBItem
                  Action = frmMain.actCompletionHelp
                end
                object TBSeparatorItem18: TTBSeparatorItem
                end
                object TBItem35: TTBItem
                  Action = frmMain.actCompletionHelpSelected
                end
                object TBItem21: TTBItem
                  Action = frmMain.actCompletionExampleSelected
                end
                object TBSeparatorItemCompletion21: TTBSeparatorItem
                end
                object TBSubmenuItem5: TTBSubmenuItem
                  Caption = 'Copy'
                  Hint = 'Completion: copy'
                  ImageIndex = 50
                  object TBItem37: TTBItem
                    Action = frmMain.actCompletionCopyFunction
                  end
                  object TBItem38: TTBItem
                    Action = frmMain.actCompletionCopyDescrition
                  end
                end
                object TBSeparatorItem17: TTBSeparatorItem
                end
                object TBItemCompletion26: TTBItem
                  Action = frmMain.actCompletionEdit
                end
                object TBSeparatorItem3: TTBSeparatorItem
                end
                object TBItem36: TTBItem
                  Action = frmMain.actCompletion
                end
              end
            end
          end
        end
        object tbsComments: TTabSheet
          Caption = 'Comments'
          ImageIndex = 3
          object Panel9: TPanel
            Left = 0
            Top = 88
            Width = 372
            Height = 421
            Align = alClient
            BevelOuter = bvNone
            Color = 16250871
            ParentBackground = False
            TabOrder = 0
            object dbgComments: TDBGrid
              Left = 0
              Top = 18
              Width = 372
              Height = 403
              Align = alClient
              BorderStyle = bsNone
              DataSource = modDados.dsComments
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = frmMain.pmenComments
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = dbgCommentsDblClick
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Language'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Line'
                  Title.Alignment = taCenter
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Begin'
                  Title.Alignment = taCenter
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'End'
                  Title.Alignment = taCenter
                  Width = 40
                  Visible = True
                end>
            end
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 372
              Height = 18
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 1
              object JvDBNavigator3: TJvDBNavigator
                Left = 0
                Top = 0
                Width = 372
                Height = 18
                DataSource = modDados.dsComments
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alClient
                Flat = True
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
              end
            end
          end
          object Panel15: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 88
            Align = alTop
            BevelOuter = bvNone
            Color = 16250871
            ParentBackground = False
            TabOrder = 1
            object TBDock1: TTBDock
              Left = 0
              Top = 0
              Width = 372
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBToolbar3: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBItem9: TTBItem
                  Action = frmMain.actCommentsHelp
                end
                object TBSeparatorItem7: TTBSeparatorItem
                end
                object TBItem25: TTBItem
                  Action = frmMain.actCommentsEdit
                end
              end
            end
            object GroupBox29: TGroupBox
              Left = 0
              Top = 26
              Width = 372
              Height = 62
              Align = alClient
              Caption = ' Options '
              Color = 16250871
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Microsoft Sans Serif'
              Font.Style = []
              ParentBackground = False
              ParentColor = False
              ParentFont = False
              TabOrder = 1
              object cbComAutoDetect_Language: TCheckBox
                Left = 9
                Top = 19
                Width = 203
                Height = 17
                Caption = 'Auto detect language (recommended)'
                TabOrder = 0
              end
              object cbComPriority_Line: TCheckBox
                Left = 9
                Top = 39
                Width = 190
                Height = 17
                Caption = 'When both available priority to line'
                TabOrder = 1
              end
            end
          end
        end
      end
    end
    object tbsR: TTabSheet
      Caption = 'R'
      ImageIndex = 4
      object pgR: TJvgPageControl
        Left = 0
        Top = 0
        Width = 380
        Height = 537
        ActivePage = tbsRMirrors
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
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
        object tbsRExplorer: TTabSheet
          Caption = 'Explorer'
          ImageIndex = 1
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 78
            Align = alTop
            BevelOuter = bvNone
            BorderWidth = 2
            Color = 16250871
            ParentBackground = False
            TabOrder = 0
            object Panel5: TPanel
              Left = 2
              Top = 51
              Width = 368
              Height = 27
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object splRExplorer: TSplitter
                Left = 138
                Top = 0
                Height = 27
                Beveled = True
                Color = clBackground
                ParentColor = False
                OnMoved = splRExplorerMoved
                OnPaint = splRExplorerPaint
              end
              object panRExplorer: TPanel
                Left = 0
                Top = 0
                Width = 138
                Height = 27
                Align = alLeft
                BevelOuter = bvNone
                Color = 16250871
                ParentBackground = False
                TabOrder = 0
                DesignSize = (
                  138
                  27)
                object cbbToolsRExplorer: TComboBox
                  Left = 28
                  Top = 1
                  Width = 108
                  Height = 19
                  Hint = 'Set R object type'
                  BevelInner = bvSpace
                  BevelKind = bkSoft
                  BevelOuter = bvRaised
                  Style = csOwnerDrawVariable
                  Anchors = [akLeft, akRight]
                  Ctl3D = False
                  DropDownCount = 15
                  ItemHeight = 13
                  ParentCtl3D = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 0
                  OnChange = cbbToolsRExplorerChange
                  OnDrawItem = cbbToolsRExplorerDrawItem
                  OnKeyDown = cbbToolsRExplorerKeyDown
                  OnMeasureItem = cbbToolsRExplorerMeasureItem
                  OnSelect = cbbToolsRExplorerSelect
                end
                object bbtRExplorerRefresh: TBitBtn
                  Left = 2
                  Top = 0
                  Width = 25
                  Height = 21
                  Action = frmMain.actRExplorerRefresh
                  Caption = 'Refresh explorer'
                  TabOrder = 1
                  Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B35800FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B35800FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B3580026B3580026B3
                    580026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B35800FF00
                    FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B35800FF00
                    FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF0056565600FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF00565656005656
                    5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF005656560056565600565656005656
                    560056565600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00565656005656
                    5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0056565600FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                  Margin = 1
                end
              end
              object panRFilter: TPanel
                Left = 141
                Top = 0
                Width = 227
                Height = 27
                Align = alClient
                BevelOuter = bvNone
                Color = 16250871
                ParentBackground = False
                TabOrder = 1
                DesignSize = (
                  227
                  27)
                object edToolsRExplorerFilter: TEdit
                  Left = 29
                  Top = 1
                  Width = 198
                  Height = 22
                  Anchors = [akLeft, akRight]
                  AutoSize = False
                  BevelInner = bvNone
                  BevelOuter = bvNone
                  BiDiMode = bdLeftToRight
                  Ctl3D = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clRed
                  Font.Height = -12
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentBiDiMode = False
                  ParentCtl3D = False
                  ParentFont = False
                  TabOrder = 0
                  OnKeyDown = edToolsRExplorerFilterKeyDown
                end
                object bbtRFilterRefresh: TBitBtn
                  Left = 3
                  Top = 1
                  Width = 25
                  Height = 21
                  Action = frmMain.actRFilterRefresh
                  Caption = 'Refresh filter'
                  TabOrder = 1
                  Glyph.Data = {
                    36040000424D3604000000000000360000002800000010000000100000000100
                    2000000000000004000000000000000000000000000000000000FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B35800FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B35800FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B3580026B3580026B3
                    580026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B35800FF00
                    FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B35800FF00
                    FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF0056565600FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF00565656005656
                    5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF005656560056565600565656005656
                    560056565600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00565656005656
                    5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0056565600FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                    FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                  Margin = 1
                end
              end
            end
            object TBDRexplorer: TTBDock
              Left = 2
              Top = 2
              Width = 368
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBRexplorer: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBItem13: TTBItem
                  Action = frmMain.actRExplorerHelp
                end
                object TBSeparatorItem20: TTBSeparatorItem
                end
                object TBItem39: TTBItem
                  Action = frmMain.actRExplorerHelpSelected
                end
                object TBItem14: TTBItem
                  Action = frmMain.actRExplorerExampleSelected
                end
                object TBItem16: TTBItem
                  Action = frmMain.actRExplorerOpenExampleSelected
                end
                object TBSeparatorItem19: TTBSeparatorItem
                end
                object Basic: TTBSubmenuItem
                  Action = frmMain.actRExplorerBasic
                  object TBItem3: TTBItem
                    Action = frmMain.actRExplorerSummary
                  end
                  object TBSeparatorItem15: TTBSeparatorItem
                  end
                  object TBItem10: TTBItem
                    Action = frmMain.actRExplorerRemove
                  end
                  object TBItem22: TTBItem
                    Action = frmMain.actRExplorerRemoveAllObjects
                  end
                end
                object TBItem15: TTBItem
                  Action = frmMain.actRExplorerContent
                end
                object TBItem100: TTBItem
                  Action = frmMain.actRExplorerPlot
                end
                object TBItem5: TTBItem
                  Action = frmMain.actRExplorerNames
                end
                object TBItem4: TTBItem
                  Action = frmMain.actRExplorerStructure
                end
                object TBItem7: TTBItem
                  Action = frmMain.actRExplorerEdit
                end
                object TBItem6: TTBItem
                  Action = frmMain.actRExplorerFix
                end
                object TBSeparatorItem8: TTBSeparatorItem
                end
                object TBSubmenuItem1: TTBSubmenuItem
                  Caption = 'Name'
                  Hint = 'Explorer (R): name'
                  ImageIndex = 195
                  object TBItem12: TTBItem
                    Action = frmMain.actRExplorerSendNameToEditor
                  end
                  object TBItem11: TTBItem
                    Action = frmMain.actRExplorerSendNameToClipboard
                  end
                end
                object TBSubmenuItem4: TTBSubmenuItem
                  Caption = 'Content'
                  Hint = 'Explorer (R): content'
                  ImageIndex = 196
                  object TBItem19: TTBItem
                    Action = frmMain.actRExplorerExpRaw
                  end
                  object TBItem18: TTBItem
                    Action = frmMain.actRExplorerExpASCII
                  end
                end
                object TBItem20: TTBItem
                  Action = frmMain.actRExplorerStyle
                end
              end
            end
            object Panel6: TPanel
              Left = 2
              Top = 28
              Width = 368
              Height = 23
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 2
              DesignSize = (
                368
                23)
              object cbbToolsREnvironment: TComboBox
                Left = 28
                Top = 0
                Width = 340
                Height = 21
                Hint = 'Set R environment'
                BevelInner = bvSpace
                BevelKind = bkSoft
                BevelOuter = bvRaised
                Style = csDropDownList
                Anchors = [akLeft, akRight]
                Ctl3D = False
                DropDownCount = 25
                ItemHeight = 13
                ItemIndex = 0
                ParentCtl3D = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                Text = '.GlobalEnv'
                OnKeyDown = cbbToolsREnvironmentKeyDown
                OnSelect = cbbToolsREnvironmentSelect
                Items.Strings = (
                  '.GlobalEnv')
              end
              object bbtREnvironmentRefresh: TBitBtn
                Left = 2
                Top = 0
                Width = 25
                Height = 21
                Action = frmMain.actREnvironmentRefresh
                Caption = 'Refresh environment'
                TabOrder = 1
                Glyph.Data = {
                  36040000424D3604000000000000360000002800000010000000100000000100
                  2000000000000004000000000000000000000000000000000000FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B35800FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B35800FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B3580026B3580026B3
                  580026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B3580026B35800FF00
                  FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0026B35800FF00
                  FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF0026B35800FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF0056565600FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF0056565600FF00FF00FF00FF00565656005656
                  5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF005656560056565600565656005656
                  560056565600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00565656005656
                  5600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0056565600FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
                  FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
                Margin = 1
              end
            end
          end
          object stbRexplorer: TStatusBar
            Left = 0
            Top = 490
            Width = 372
            Height = 19
            Color = 16250871
            Panels = <
              item
                Bevel = pbNone
                Text = 'Total:'
                Width = 29
              end
              item
                Width = 40
              end
              item
                Bevel = pbNone
                Text = 'Index:'
                Width = 35
              end
              item
                Width = 40
              end
              item
                Bevel = pbNone
                Text = 'Sel:'
                Width = 21
              end
              item
                Width = 50
              end>
          end
          object lvRexplorer: TListView
            Left = 0
            Top = 78
            Width = 372
            Height = 412
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            BorderStyle = bsNone
            Columns = <
              item
                AutoSize = True
                Caption = 'Name'
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = 'Dim'
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = 'Group'
              end
              item
                Alignment = taRightJustify
                AutoSize = True
                Caption = 'Class'
              end>
            ColumnClick = False
            DragMode = dmAutomatic
            IconOptions.Arrangement = iaLeft
            IconOptions.AutoArrange = True
            LargeImages = frmMain.imlRexplorer
            ReadOnly = True
            RowSelect = True
            ParentBiDiMode = False
            ParentShowHint = False
            PopupMenu = frmMain.pmenRExplorer
            ShowHint = False
            SmallImages = frmMain.imlRexplorer
            SortType = stBoth
            StateImages = frmMain.imlRexplorer
            TabOrder = 2
            ViewStyle = vsList
            OnDblClick = lvRexplorerDblClick
            OnKeyDown = lvRexplorerKeyDown
            OnKeyUp = lvRexplorerKeyUp
            OnSelectItem = lvRexplorerSelectItem
            OnStartDrag = lvRexplorerStartDrag
          end
        end
        object tbsRCard: TTabSheet
          Caption = 'Card'
          object splRCard: TSplitter
            Left = 0
            Top = 113
            Width = 372
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveCaption
            ParentColor = False
            ExplicitTop = 157
            ExplicitWidth = 345
          end
          object panRCard: TPanel
            Left = 0
            Top = 26
            Width = 372
            Height = 87
            Align = alTop
            BevelOuter = bvNone
            Constraints.MinHeight = 15
            TabOrder = 0
            object lbRcard: TListBox
              Left = 0
              Top = 0
              Width = 372
              Height = 87
              AutoComplete = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              ItemHeight = 13
              ParentCtl3D = False
              PopupMenu = frmMain.pmenFontGeneric
              TabOrder = 0
              OnClick = lbRcardClick
            end
          end
          object panRCard4: TPanel
            Left = 0
            Top = 117
            Width = 372
            Height = 392
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object dbRCardMemo: TDBMemo
              Left = 0
              Top = 312
              Width = 372
              Height = 80
              HelpType = htKeyword
              Align = alBottom
              BevelInner = bvNone
              BevelOuter = bvNone
              Constraints.MaxHeight = 80
              Ctl3D = False
              DataField = 'Description'
              DataSource = modDados.dsRcard
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentCtl3D = False
              ParentFont = False
              ParentShowHint = False
              PopupMenu = frmMain.pmenRCardMemo
              ReadOnly = True
              ScrollBars = ssVertical
              ShowHint = False
              TabOrder = 0
              WantReturns = False
            end
            object dbgRCard: TDBGrid
              Left = 0
              Top = 18
              Width = 372
              Height = 294
              Align = alClient
              BorderStyle = bsNone
              DataSource = modDados.dsRcard
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgIndicator, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = frmMain.pmenRcard
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              OnDblClick = dbgRCardDblClick
              OnKeyDown = dbgRCardKeyDown
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Function'
                  Width = 390
                  Visible = True
                end>
            end
            object panRCard3: TPanel
              Left = 0
              Top = 0
              Width = 372
              Height = 18
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 2
              object JvDBNavigator4: TJvDBNavigator
                Left = 0
                Top = 0
                Width = 372
                Height = 18
                DataSource = modDados.dsRcard
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alClient
                Flat = True
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
              end
            end
          end
          object panRCard1: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 2
            object TBDRcard: TTBDock
              Left = 0
              Top = 0
              Width = 372
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBRcard: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBItemRCard23: TTBItem
                  Action = frmMain.actRCardHelp
                end
                object TBSeparatorItemRCard18: TTBSeparatorItem
                end
                object TBItem40: TTBItem
                  Action = frmMain.actRCardHelpSelected
                end
                object TBItemRCard24: TTBItem
                  Action = frmMain.actRCardExampleSelected
                end
                object TBItem17: TTBItem
                  Action = frmMain.actRCardOpenExampleSelected
                end
                object TBSeparatorItemRCard20: TTBSeparatorItem
                end
                object TBSubmenuItemRCard2: TTBSubmenuItem
                  Caption = 'Copy'
                  Hint = 'Card (R): copy'
                  ImageIndex = 50
                  object TBItemRCard25: TTBItem
                    Action = frmMain.actRCardCopyFunction
                  end
                  object TBItemRCard27: TTBItem
                    Action = frmMain.actRCardCopyDescrition
                  end
                end
                object TBSeparatorItemRCard21: TTBSeparatorItem
                end
                object TBItemRCard26: TTBItem
                  Action = frmMain.actRCardEdit
                end
                object TBSeparatorItem1: TTBSeparatorItem
                end
                object TBItem8: TTBItem
                  Action = frmMain.actRcardInsert
                end
              end
            end
          end
        end
        object tbsRMirrors: TTabSheet
          Caption = 'Mirrors'
          ImageIndex = 4
          object Splitter1: TSplitter
            Left = 0
            Top = 113
            Width = 372
            Height = 4
            Cursor = crVSplit
            Align = alTop
            Beveled = True
            Color = clActiveCaption
            ParentColor = False
            ExplicitWidth = 304
          end
          object Panel16: TPanel
            Left = 0
            Top = 0
            Width = 372
            Height = 26
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object TBDock2: TTBDock
              Left = 0
              Top = 0
              Width = 372
              Height = 26
              BackgroundOnToolbars = False
              Color = 16250871
              object TBToolbar4: TTBToolbar
                Left = 0
                Top = 0
                BorderStyle = bsNone
                Caption = 'TBProject'
                ChevronMoveItems = False
                Color = 16250871
                DockMode = dmCannotFloatOrChangeDocks
                DockPos = 0
                Images = frmMain.imlTinnR
                TabOrder = 0
                object TBItem26: TTBItem
                  Action = frmMain.actRmirrorsHelp
                end
                object TBSeparatorItem16: TTBSeparatorItem
                end
                object TBItem27: TTBItem
                  Action = frmMain.actRmirrorsUpdate
                end
                object TBSeparatorItem11: TTBSeparatorItem
                end
                object TBSubmenuItem3: TTBSubmenuItem
                  Caption = 'URL'
                  Hint = 'Mirrors (R): open URL'
                  ImageIndex = 288
                  object TBItem33: TTBItem
                    Action = frmMain.actRmirrorsOpenURLCurrent
                  end
                  object TBItem34: TTBItem
                    Action = frmMain.actRmirrorsOpenURLDefault
                  end
                end
                object TBSubmenuItem2: TTBSubmenuItem
                  Caption = 'Copy'
                  Hint = 'Mirrors (R): copy'
                  ImageIndex = 50
                  object TBItem29: TTBItem
                    Action = frmMain.actRmirrorsCopyHost
                  end
                  object TBItem30: TTBItem
                    Action = frmMain.actRmirrorsCopyURL
                  end
                end
                object TBSeparatorItem12: TTBSeparatorItem
                end
                object TBItem31: TTBItem
                  Action = frmMain.actRmirrorsEdit
                end
                object TBSeparatorItem13: TTBSeparatorItem
                end
                object TBItem32: TTBItem
                  Action = frmMain.actRmirrorsSetRepos
                end
              end
            end
          end
          object panCountries: TPanel
            Left = 0
            Top = 26
            Width = 372
            Height = 87
            Align = alTop
            BevelOuter = bvNone
            Constraints.MinHeight = 15
            TabOrder = 1
            object lbCountries: TListBox
              Left = 0
              Top = 0
              Width = 372
              Height = 87
              AutoComplete = False
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              BorderStyle = bsNone
              Ctl3D = False
              ItemHeight = 13
              ParentCtl3D = False
              PopupMenu = frmMain.pmenFontGeneric
              TabOrder = 0
              OnClick = lbCountriesClick
            end
          end
          object Panel18: TPanel
            Left = 0
            Top = 117
            Width = 372
            Height = 313
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object dbgRmirrors: TDBGrid
              Left = 0
              Top = 18
              Width = 372
              Height = 295
              Align = alClient
              BorderStyle = bsNone
              DataSource = modDados.dsRmirrors
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              PopupMenu = frmMain.pmenRmirrors
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Name'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'City'
                  Visible = True
                end>
            end
            object Panel19: TPanel
              Left = 0
              Top = 0
              Width = 372
              Height = 18
              Align = alTop
              BevelOuter = bvNone
              Color = 16250871
              ParentBackground = False
              TabOrder = 1
              object JvDBNavigator5: TJvDBNavigator
                Left = 0
                Top = 0
                Width = 372
                Height = 18
                DataSource = modDados.dsRmirrors
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Align = alClient
                Flat = True
                Ctl3D = False
                ParentCtl3D = False
                TabOrder = 0
              end
            end
          end
          object Panel20: TPanel
            Left = 0
            Top = 430
            Width = 372
            Height = 60
            Align = alBottom
            TabOrder = 3
            object dbeRmirrorsURL: TDBEdit
              Left = 1
              Top = 20
              Width = 370
              Height = 19
              Align = alTop
              DataField = 'URL'
              DataSource = modDados.dsRmirrors
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBtnText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnClick = dbeRmirrorsURLClick
              OnMouseMove = dbeRmirrorsURLMouseMove
            end
            object dbeRmirrorsCode: TDBEdit
              Left = 1
              Top = 39
              Width = 370
              Height = 19
              Align = alTop
              DataField = 'Code'
              DataSource = modDados.dsRmirrors
              TabOrder = 1
            end
            object dbeRmirrorsHost: TDBEdit
              Left = 1
              Top = 1
              Width = 370
              Height = 19
              Align = alTop
              DataField = 'Host'
              DataSource = modDados.dsRmirrors
              TabOrder = 2
            end
          end
          object stbRMirrors: TStatusBar
            Left = 0
            Top = 490
            Width = 372
            Height = 19
            Color = 16250871
            Panels = <
              item
                Bevel = pbNone
                Style = psOwnerDraw
                Text = 'Default:'
                Width = 42
              end
              item
                Style = psOwnerDraw
                Width = 40
              end>
            OnClick = stbRMirrorsClick
            OnMouseMove = stbRMirrorsMouseMove
            OnDrawPanel = stbRMirrorsDrawPanel
          end
        end
      end
    end
  end
  object JvDockClientTools: TJvDockClient
    DirectDrag = False
    DockStyle = frmMain.JvDockVSNetStyle
    Left = 136
    Top = 311
  end
end
