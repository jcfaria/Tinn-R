object modDados: TmodDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 530
  Width = 183
  object dsRcard: TDataSource
    DataSet = cdRcard
    Left = 118
    Top = 12
  end
  object cdRcard: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Rcard.xml'
    Params = <>
    BeforeEdit = cdRcardBeforeEdit
    AfterPost = cdRcardAfterPost
    AfterScroll = cdRcardAfterScroll
    OnFilterRecord = cdRcardFilterRecord
    OnPostError = cdRcardPostError
    Left = 31
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
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Completion.xml'
    Params = <>
    BeforeEdit = cdCompletionBeforeEdit
    AfterPost = cdCompletionAfterPost
    AfterScroll = cdCompletionAfterScroll
    OnPostError = cdCompletionPostError
    Left = 31
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
    Left = 118
    Top = 67
  end
  object cdShortcuts: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Shortcuts.xml'
    Params = <>
    BeforeEdit = cdShortcutsBeforeEdit
    AfterPost = cdShortcutsAfterPost
    AfterScroll = cdShortcutsAfterScroll
    OnNewRecord = cdShortcutsNewRecord
    OnPostError = cdShortcutsPostError
    Left = 31
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
    Left = 117
    Top = 115
  end
  object dsCache: TDataSource
    DataSet = cdCache
    Left = 118
    Top = 166
  end
  object cdCache: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Cache.xml'
    Params = <>
    OnFilterRecord = cdRcardFilterRecord
    Left = 31
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
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Comments.xml'
    Params = <>
    BeforeEdit = cdCommentsBeforeEdit
    AfterPost = cdCommentsAfterPost
    AfterScroll = cdCommentsAfterScroll
    OnPostError = cdCommentsPostError
    Left = 31
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
    Left = 118
    Top = 215
  end
  object cdRmirrors: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Rmirrors.xml'
    Params = <>
    BeforeEdit = cdRmirrorsBeforeEdit
    AfterPost = cdRmirrorsAfterPost
    AfterScroll = cdRmirrorsAfterScroll
    OnPostError = cdRmirrorsPostError
    Left = 31
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
    Left = 118
    Top = 264
  end
  object cdRH_Send: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\RH_Send.xml'
    Params = <>
    Left = 31
    Top = 315
    object cdRH_Send_Index: TIntegerField
      FieldName = 'Index'
      Required = True
    end
    object cdRH_Send_Group: TStringField
      FieldName = 'Group'
      Size = 50
    end
    object cdRH_Send_Caption: TStringField
      FieldName = 'Caption'
      Size = 50
    end
    object cdRH_Send_Hotkey: TStringField
      Alignment = taRightJustify
      FieldName = 'Hotkey'
      Size = 50
    end
  end
  object dsRH_Send: TDataSource
    DataSet = cdRH_Send
    Left = 117
    Top = 315
  end
  object cdRH_Control: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\RH_Control.xml'
    Params = <>
    Left = 31
    Top = 367
    object cdRH_Control_Index: TIntegerField
      FieldName = 'Index'
      Required = True
    end
    object cdRH_Control_Group: TStringField
      FieldName = 'Group'
      Size = 50
    end
    object cdRH_Control_Caption: TStringField
      FieldName = 'Caption'
      Size = 50
    end
    object cdRH_Control_Hotkey: TStringField
      Alignment = taRightJustify
      FieldName = 'Hotkey'
      Size = 50
    end
  end
  object dsRH_Control: TDataSource
    DataSet = cdRH_Control
    Left = 117
    Top = 367
  end
  object cdRH_Custom: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\RH_Custom.xml'
    Params = <>
    OnNewRecord = cdRH_CustomNewRecord
    OnPostError = cdRH_CustomPostError
    Left = 31
    Top = 422
    object cdRH_Custom_Index: TIntegerField
      FieldName = 'Index'
      Required = True
    end
    object cdRH_Custom_Group: TStringField
      FieldName = 'Group'
      Size = 50
    end
    object cdRH_Custom_Caption: TStringField
      FieldName = 'Caption'
      Size = 100
    end
    object cdRH_Custom_Hotkey: TStringField
      Alignment = taRightJustify
      FieldName = 'Hotkey'
      Size = 50
    end
  end
  object dsRH_Custom: TDataSource
    DataSet = cdRH_Custom
    Left = 117
    Top = 422
  end
  object cdKeys_Editor: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Editor.xml'
    Params = <>
    OnPostError = cdKeys_EditorPostError
    Left = 31
    Top = 472
    object cdKeys_Editor_Index: TSmallintField
      FieldName = 'Index'
    end
    object cdKeys_Editor_Group: TStringField
      FieldName = 'Group'
    end
    object cdKeys_Editor_Command: TStringField
      FieldName = 'Command'
      Size = 50
    end
    object cdKeys_Editor_Key: TSmallintField
      FieldName = 'Key'
    end
    object cdKeys_Editor_Keystroke: TStringField
      FieldName = 'Keystroke'
    end
  end
  object dsKeys_Editor: TDataSource
    DataSet = cdKeys_Editor
    Left = 117
    Top = 472
  end
end
