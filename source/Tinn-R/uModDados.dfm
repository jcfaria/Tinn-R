object modDados: TmodDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 530
  Width = 272
  object dsRcard: TDataSource
    DataSet = cdRcard
    Left = 173
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
    Left = 59
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
    Left = 59
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
    Left = 173
    Top = 67
  end
  object cdApp_Shortcuts: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\App_Shortcuts.xml'
    Params = <>
    BeforeEdit = cdApp_ShortcutsBeforeEdit
    AfterPost = cdApp_ShortcutsAfterPost
    AfterScroll = cdApp_ShortcutsAfterScroll
    OnNewRecord = cdApp_ShortcutsNewRecord
    OnPostError = cdApp_ShortcutsPostError
    Left = 59
    Top = 117
    object cdApp_ShortcutsIndex: TIntegerField
      FieldName = 'Index'
      Required = True
    end
    object cdApp_ShortcutsGroup: TStringField
      FieldName = 'Group'
      Size = 50
    end
    object cdApp_ShortcutsCaption: TStringField
      FieldName = 'Caption'
      Size = 50
    end
    object cdApp_ShortcutsHint: TStringField
      FieldName = 'Hint'
      Size = 80
    end
    object cdApp_ShortcutsShortcut: TStringField
      Alignment = taRightJustify
      FieldName = 'Shortcut'
    end
    object cdApp_ShortcutsImageIndex: TIntegerField
      FieldName = 'Image'
    end
  end
  object dsApp_Shortcuts: TDataSource
    DataSet = cdApp_Shortcuts
    Left = 172
    Top = 115
  end
  object dsCache: TDataSource
    DataSet = cdCache
    Left = 173
    Top = 166
  end
  object cdCache: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Cache.xml'
    Params = <>
    OnFilterRecord = cdRcardFilterRecord
    Left = 59
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
    Left = 59
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
    Left = 173
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
    Left = 59
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
    Left = 173
    Top = 264
  end
  object cdRH_Send: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\RH_Send.xml'
    Params = <>
    Left = 59
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
    Left = 172
    Top = 315
  end
  object cdRH_Control: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\RH_Control.xml'
    Params = <>
    Left = 59
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
    Left = 172
    Top = 367
  end
  object cdRH_Custom: TClientDataSet
    Aggregates = <>
    FileName = 'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\RH_Custom.xml'
    Params = <>
    OnNewRecord = cdRH_CustomNewRecord
    OnPostError = cdRH_CustomPostError
    Left = 59
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
    Left = 172
    Top = 422
  end
  object cdEditor_Keystrokes: TClientDataSet
    Aggregates = <>
    FileName = 
      'C:\Users\jcfaria\Documents\GitHub\Tinn-R\data\Editor_Keystrokes.' +
      'xml'
    Params = <>
    OnPostError = cdEditor_KeystrokesPostError
    Left = 59
    Top = 472
    object cdEditor_Keystrokes_Index: TSmallintField
      FieldName = 'Index'
    end
    object cdEditor_Keystrokes_Group: TStringField
      FieldName = 'Group'
    end
    object cdEditor_Keystrokes_Command: TStringField
      FieldName = 'Command'
      Size = 50
    end
    object cdEditor_Keystrokes_Key: TSmallintField
      FieldName = 'Key'
    end
    object cdEditor_Keystrokes_Keystroke: TStringField
      FieldName = 'Keystroke'
    end
  end
  object dsEditor_Keystrokes: TDataSource
    DataSet = cdEditor_Keystrokes
    Left = 172
    Top = 472
  end
end
