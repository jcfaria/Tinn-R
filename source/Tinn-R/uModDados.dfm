object modDados: TmodDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 326
  Width = 154
  object dsRcard: TDataSource
    DataSet = cdRcard
    Left = 89
    Top = 12
  end
  object cdRcard: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = cdRcardBeforeEdit
    AfterPost = cdRcardAfterPost
    AfterScroll = cdRcardAfterScroll
    OnFilterRecord = cdRcardFilterRecord
    OnPostError = cdRcardPostError
    Left = 22
    Top = 12
    object cdRcardGroup: TStringField
      FieldName = 'Group'
      Required = True
      Size = 50
    end
    object cdRcardFunction: TStringField
      FieldName = 'Function'
      Required = True
      Size = 50
    end
    object cdRcardDescription: TMemoField
      FieldName = 'Description'
      BlobType = ftMemo
    end
  end
  object cdCompletion: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = cdCompletionBeforeEdit
    AfterPost = cdCompletionAfterPost
    AfterScroll = cdCompletionAfterScroll
    OnPostError = cdCompletionPostError
    Left = 22
    Top = 67
    object cdCompletionGroup: TStringField
      FieldName = 'Group'
      Required = True
      Size = 50
    end
    object cdCompletionFunction: TStringField
      FieldName = 'Function'
      Required = True
      Size = 50
    end
    object cdCompletionTrigger: TStringField
      Alignment = taRightJustify
      FieldName = 'Trigger'
    end
    object cdCompletionCompletion: TMemoField
      FieldName = 'Completion'
      BlobType = ftMemo
    end
  end
  object dsCompletion: TDataSource
    DataSet = cdCompletion
    Left = 89
    Top = 67
  end
  object cdShortcuts: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = cdShortcutsBeforeEdit
    AfterPost = cdShortcutsAfterPost
    AfterScroll = cdShortcutsAfterScroll
    OnNewRecord = cdShortcutsNewRecord
    OnPostError = cdShortcutsPostError
    Left = 22
    Top = 117
    object cdShortcutsIndex: TIntegerField
      FieldName = 'Index'
      Required = True
    end
    object cdShortcutsGroup: TStringField
      FieldName = 'Group'
      Size = 50
    end
    object cdShortcutsCaption: TStringField
      FieldName = 'Caption'
      Size = 50
    end
    object cdShortcutsHint: TStringField
      FieldName = 'Hint'
      Size = 80
    end
    object cdShortcutsShortcut: TStringField
      Alignment = taRightJustify
      FieldName = 'Shortcut'
    end
    object cdShortcutsImageIndex: TIntegerField
      FieldName = 'Image'
    end
  end
  object dsShortcuts: TDataSource
    DataSet = cdShortcuts
    Left = 88
    Top = 115
  end
  object dsCache: TDataSource
    DataSet = cdCache
    Left = 89
    Top = 166
  end
  object cdCache: TClientDataSet
    Aggregates = <>
    Params = <>
    OnFilterRecord = cdRcardFilterRecord
    Left = 22
    Top = 166
    object cdCacheFile: TStringField
      FieldName = 'File'
      Required = True
      Size = 200
    end
    object cdCacheMarks: TMemoField
      FieldName = 'Marks'
      BlobType = ftMemo
    end
    object cdCacheTop: TIntegerField
      FieldName = 'TopLine'
    end
    object cdCacheCursor: TIntegerField
      FieldName = 'X'
    end
    object cdCacheCursorY: TIntegerField
      FieldName = 'Y'
    end
  end
  object cdComments: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = cdCommentsBeforeEdit
    AfterPost = cdCommentsAfterPost
    AfterScroll = cdCommentsAfterScroll
    OnPostError = cdCommentsPostError
    Left = 22
    Top = 215
    object cdCommentsLanguage: TStringField
      FieldName = 'Language'
      ReadOnly = True
      Required = True
    end
    object cdCommentsLine: TStringField
      Alignment = taCenter
      DisplayWidth = 5
      FieldName = 'Line'
      Size = 3
    end
    object cdCommentsBegin: TStringField
      Alignment = taCenter
      DisplayWidth = 5
      FieldName = 'Begin'
      Required = True
      Size = 4
    end
    object cdCommentsEnd: TStringField
      Alignment = taCenter
      DisplayWidth = 5
      FieldName = 'End'
      Required = True
      Size = 4
    end
  end
  object dsComments: TDataSource
    DataSet = cdComments
    Left = 89
    Top = 215
  end
  object cdRmirrors: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforeEdit = cdRmirrorsBeforeEdit
    AfterPost = cdRmirrorsAfterPost
    AfterScroll = cdRmirrorsAfterScroll
    OnPostError = cdRmirrorsPostError
    Left = 22
    Top = 264
    object cdRmirrorsName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object cdRmirrorsCountry: TStringField
      FieldName = 'Country'
    end
    object cdRmirrorsCity: TStringField
      FieldName = 'City'
    end
    object cdRmirrorsURL: TStringField
      FieldName = 'URL'
      Size = 60
    end
    object cdRmirrorsHost: TStringField
      FieldName = 'Host'
      Size = 60
    end
    object cdRmirrorsCode: TStringField
      FieldName = 'Code'
      Size = 2
    end
  end
  object dsRmirrors: TDataSource
    DataSet = cdRmirrors
    Left = 89
    Top = 264
  end
end
