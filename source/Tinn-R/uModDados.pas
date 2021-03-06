(*
 Tinn is a ASCII file editor primarily intended as a better replacement
 of the default Notepad.exe under Windows.

 This software is distributed under the terms of the GNU General
 Public License, either Version 2, June 1991 or Version 3, June 2007.
 The terms of version 2 and of the license are in a folder called
 doc (licence_gpl2.txt and licence_gpl2.txt)
 which you should have received with this software.

 See http://www.opensource.org/licenses/gpl-license.html or
 http://www.fsf.org/copyleft/gpl.html for further information.

 Copyright
  Russell May - http://www.solarvoid.com

 Tinn-R is an extension of Tinn that provides additional tools to control R
 (http://cran.r-project.org). The project is coordened by Jos� Cl�udio Faria
 (joseclaudio.faria@gmail.com).

 As such, Tinn-R is a feature-rich replacement of the basic script editor
 provided with Rgui. It provides syntax-highlighting, submission of code in
 whole, or line-by-line, and many other useful tools to ease writting and
 debugging of R code.

 Copyright
  Tinn-R team - http://nbcgib.uesc.br/lec/software/editores/tinn-r/en

 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 and 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program; if not, write to the Free Software
 Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

unit uModDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBClient, DB, MidasLib, FMTBcd, SqlExpr, WideStrings,
  SynEditKeyCmds;

type
  TmodDados = class(TDataModule)
    cdCache: TClientDataSet;
    cdCacheCursor: TIntegerField;
    cdCacheCursorY: TIntegerField;
    cdCacheFile: TStringField;
    cdCacheMarks: TMemoField;
    cdCacheTop: TIntegerField;
    cdComments: TClientDataSet;
    cdCommentsBegin: TStringField;
    cdCommentsEnd: TStringField;
    cdCommentsLanguage: TStringField;
    cdCommentsLine: TStringField;
    cdCompletion: TClientDataSet;
    cdCompletionCompletion: TMemoField;
    cdCompletionFunction: TStringField;
    cdCompletionGroup: TStringField;
    cdCompletionTrigger: TStringField;
    cdRcard: TClientDataSet;
    cdRcardDescription: TMemoField;
    cdRcardFunction: TStringField;
    cdRcardGroup: TStringField;
    cdRmirrors: TClientDataSet;
    cdRmirrorsCity: TStringField;
    cdRmirrorsCode: TStringField;
    cdRmirrorsCountry: TStringField;
    cdRmirrorsHost: TStringField;
    cdRmirrorsName: TStringField;
    cdRmirrorsURL: TStringField;
    cdShortcuts_App: TClientDataSet;
    cdShortcuts_App_Caption: TStringField;
    cdShortcuts_App_Group: TStringField;
    cdShortcuts_App_Hint: TStringField;
    cdShortcuts_App_ImageIndex: TIntegerField;
    cdShortcuts_App_Index: TIntegerField;
    cdShortcuts_App_Shortcut: TStringField;
    dsCache: TDataSource;
    dsComments: TDataSource;
    dsCompletion: TDataSource;
    dsRcard: TDataSource;
    dsRmirrors: TDataSource;
    dsShortcuts_App: TDataSource;
    cdRH_Send: TClientDataSet;
    cdRH_Send_Index: TIntegerField;
    cdRH_Send_Group: TStringField;
    cdRH_Send_Caption: TStringField;
    dsRH_Send: TDataSource;
    cdRH_Control: TClientDataSet;
    cdRH_Control_Index: TIntegerField;
    cdRH_Control_Group: TStringField;
    cdRH_Control_Caption: TStringField;
    dsRH_Control: TDataSource;
    cdRH_Custom: TClientDataSet;
    cdRH_Custom_Index: TIntegerField;
    cdRH_Custom_Group: TStringField;
    cdRH_Custom_Caption: TStringField;
    dsRH_Custom: TDataSource;
    cdKeystrokes_Editor: TClientDataSet;
    dsKeystrokes_Editor: TDataSource;
    cdKeystrokes_Editor_Index: TSmallintField;
    cdKeystrokes_Editor_Group: TStringField;
    cdKeystrokes_Editor_Command: TStringField;
    cdKeystrokes_Editor_Key: TSmallintField;
    cdKeystrokes_Editor_Keystroke: TStringField;
    cdRH_Send_Hotkey: TStringField;
    cdRH_Control_Hotkey: TStringField;
    cdRH_Custom_Hotkey: TStringField;

    procedure cdCommentsAfterPost(DataSet: TDataSet);
    procedure cdCommentsAfterScroll(DataSet: TDataSet);
    procedure cdCommentsBeforeEdit(DataSet: TDataSet);
    procedure cdCommentsPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdCompletionAfterPost(DataSet: TDataSet);
    procedure cdCompletionAfterScroll(DataSet: TDataSet);
    procedure cdCompletionBeforeEdit(DataSet: TDataSet);
    procedure cdCompletionPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdRcardAfterPost(DataSet: TDataSet);
    procedure cdRcardAfterScroll(DataSet: TDataSet);
    procedure cdRcardBeforeEdit(DataSet: TDataSet);
    procedure cdRcardFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure cdRcardPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdRmirrorsAfterPost(DataSet: TDataSet);
    procedure cdRmirrorsAfterScroll(DataSet: TDataSet);
    procedure cdRmirrorsBeforeEdit(DataSet: TDataSet);
    procedure cdRmirrorsPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdRtipPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdShortcuts_AppAfterPost(DataSet: TDataSet);
    procedure cdShortcuts_AppAfterScroll(DataSet: TDataSet);
    procedure cdShortcuts_AppBeforeEdit(DataSet: TDataSet);
    procedure cdShortcuts_AppNewRecord(DataSet: TDataSet);
    procedure cdShortcuts_AppPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdRH_CustomNewRecord(DataSet: TDataSet);
    procedure cdRH_CustomPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure cdKeystrokes_EditorPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);

  private
    { Private declarations }

  public
    { Public declarations }
    slCompletion_Groups   : TStringList;  //Stores groups of Completion
    slRcard_Groups        : TStringList;  //Stores groups of R card
    slRmirrors_Countries  : TStringList;  //Stores countries of R mirrors
    slShortcuts_App_Groups: TStringList;  //Stores groups of Shortcuts

    function fActionlist_To_Dataset: boolean;
    function fCheck_Hotkey_RH_Control(sShortcut: string; var sBy: string; bShortcut_Clear: boolean = False): boolean;
    function fCheck_Hotkey_RH_Custom(sShortcut: string; var sBy: string; bShortcut_Clear: boolean = False): boolean;
    function fCheck_Hotkey_RH_Send(sShortcut: string; var sBy: string; bShortcut_Clear: boolean = False): boolean;
    function fCheck_keystroke_Editor(sKeystroke: string; var sBy: string; bShortcut_Clear: boolean = False): boolean;
    function fCheck_Shortcut_App(sShortcut: string; var sBy: string; bShortcut_Clear: boolean = False): boolean;
    function fGet_keystroke_Editor(Command: string): string;
    function fLoad_FileState(sFile: string; var sMarks: string; var iTopLine: integer; var iCaretX: integer; var iCaretY: integer): boolean;
    function fRmirrors_Update(sFile: string): boolean;
    function fSave_FileState(sFile, sMarks: string; iTopLine, iCaretX, iCaretY: integer): boolean;

    procedure pCompletionGroups_Filter(Sender: TObject);
    procedure pRcardGroups_Filter(Sender: TObject);
    procedure pRmirrorsCountries_Filter(Sender: TObject);
    procedure pSet_Current_Highlighter(sLanguage: string);
    procedure pShortcuts_Validation(sOldShortcutsFile, sNewShortcutsFile: string);
    procedure pShortcutsGroups_Filter(Sender: TObject);

  end;

var
  modDados: TmodDados;

implementation

uses
  ufrmMain,
  ufrmR_Card,
  ufrmCompletion,
  ufrmTools,
  Variants,
  Menus,
  ActnList,
  ufrmComments,
  trUtils,
  ufrmR_Mirrors,
  ufrmSKH_map;

{$R *.DFM}

procedure TmodDados.pSet_Current_Highlighter(sLanguage: string);
begin
  with cdComments do begin
    DisableControls;

    Locate('Language',
           sLanguage,
           []);

    EnableControls;
  end;
end;

function TmodDados.fCheck_Shortcut_App(sShortcut: string;
                                       var sBy: string;
                                       bShortcut_Clear: boolean = False): boolean;
var
  pTmp:  pointer;

  bFiltered: boolean;

  sTmp: string;

begin
  Result:= False;

  with cdShortcuts_App do begin
    pTmp:= GetBookmark;
    DisableControls;
    bFiltered:= Filtered;
    if bFiltered then
      Filtered:= False;

    sTmp:= StringReplace(sShortcut,
                         ' ',
                         '',
                         [rfReplaceAll]);

    if (Locate('Shortcut',
               sTmp,
               []) = True) then begin
      Result:= True;

      sBy:= FieldValues['Group'] +
            ' | ' +
            FieldValues['Caption'] +
            ' | ' +
            FieldValues['Hint'];

      if bShortcut_Clear then begin
         Edit;
         FieldByName('Shortcut').Value:= '';
         Post;
      end;
    end; //if (Locate('Shortcut'...

    Filtered:= bFiltered;

    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);

    EnableControls;
  end; //with cdShortcuts
end;

function TmodDados.fCheck_Hotkey_RH_Send(sShortcut: string;
                                         var sBy: string;
                                         bShortcut_Clear: boolean = False): boolean;
var
  pTmp:  pointer;

  bFiltered: boolean;

  sTmp: string;

begin
  Result:= False;

  with cdRH_Send do begin
    pTmp:= GetBookmark;
    DisableControls;
    bFiltered:= Filtered;
    if bFiltered then
      Filtered:= False;

    sTmp:= StringReplace(sShortcut,
                         ' ',
                         '',
                         [rfReplaceAll]);

    if (Locate('HotKey',
               sTmp,
               []) = True) then begin
      Result:= True;

      sBy:= FieldValues['Group'] +
            ' | ' +
            FieldValues['Caption'];

      if bShortcut_Clear then begin
         Edit;
         FieldByName('HotKey').Value:= '';
         Post;
      end;
    end; //if (Locate('HotKey'...

    Filtered:= bFiltered;

    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);

    EnableControls;
  end; //with cdRH_Send
end;

function TmodDados.fCheck_Hotkey_RH_Control(sShortcut: string;
                                            var sBy: string;
                                            bShortcut_Clear: boolean = False): boolean;
var
  pTmp:  pointer;

  bFiltered: boolean;

  sTmp: string;

begin
  Result:= False;

  with cdRH_Control do begin
    pTmp:= GetBookmark;
    DisableControls;
    bFiltered:= Filtered;
    if bFiltered then
      Filtered:= False;

    sTmp:= StringReplace(sShortcut,
                         ' ',
                         '',
                         [rfReplaceAll]);

    if (Locate('HotKey',
               sTmp,
               []) = True) then begin
      Result:= True;

      sBy:= FieldValues['Group'] +
            ' | ' +
            FieldValues['Caption'];

      if bShortcut_Clear then begin
         Edit;
         FieldByName('HotKey').Value:= '';
         Post;
      end;
    end; //if (Locate('HotKey'...

    Filtered:= bFiltered;

    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);

    EnableControls;
  end; //with cdRH_Control
end;

function TmodDados.fCheck_Hotkey_RH_Custom(sShortcut: string;
                                           var sBy: string;
                                           bShortcut_Clear: boolean = False): boolean;
var
  pTmp:  pointer;

  bFiltered: boolean;

  sTmp: string;

begin
  Result:= False;

  with cdRH_Custom do begin
    pTmp:= GetBookmark;
    DisableControls;
    bFiltered:= Filtered;
    if bFiltered then
      Filtered:= False;

    sTmp:= StringReplace(sShortcut,
                         ' ',
                         '',
                         [rfReplaceAll]);

    if (Locate('HotKey',
               sTmp,
               []) = True) then begin
      Result:= True;

      sBy:= FieldValues['Group'] +
            ' | ' +
            FieldValues['Caption'];

      if bShortcut_Clear then begin
         Edit;
         FieldByName('HotKey').Value:= '';
         Post;
      end;
    end; //if (Locate('HotKey'...

    Filtered:= bFiltered;

    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);

    EnableControls;
  end; //with cdRH_Custom
end;

function  TmodDados.fCheck_keystroke_Editor(sKeystroke: string;
                                            var sBy: string;
                                            bShortcut_Clear: boolean = False): boolean;
var
  pTmp:  pointer;

  bFiltered: boolean;

  sTmp: string;

begin
  Result:= False;

  with cdKeystrokes_Editor do begin
    pTmp:= GetBookmark;
    DisableControls;
    bFiltered:= Filtered;
    if bFiltered then
      Filtered:= False;

    sTmp:= StringReplace(sKeystroke,
                         ' ',
                         '',
                         [rfReplaceAll]);

    if (Locate('keystroke',
               sTmp,
               []) = True) then begin
      Result:= True;

      sBy:= 'Editor' +
            ' | ' +
            FieldValues['Command'];

      if bShortcut_Clear then begin
         Edit;
         FieldByName('keystroke').Value:= '';
         Post;
      end;
    end; //if (Locate('Shortcut'...

    Filtered:= bFiltered;

    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);

    EnableControls;
  end; //with cdEditor
end;

function  TmodDados.fGet_keystroke_Editor(Command: string): string;
var
  pTmp:  pointer;

  bFiltered: boolean;

begin
  with cdKeystrokes_Editor do begin
    pTmp:= GetBookmark;
    DisableControls;
    bFiltered:= Filtered;
    if bFiltered then
      Filtered:= False;

    if (Locate('Command',
               Command,
               []) = True) then
      Result:= FieldValues['Keystroke'];

    Filtered:= bFiltered;

    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);

    EnableControls;
  end; //with cdEditor
end;

function TmodDados.fSave_FileState(sFile,
                                    sMarks: string;
                                   iTopLine,
                                    iCaretX,
                                    iCaretY: integer): boolean;
begin
  try
    with cdCache do begin
      First;
      if Locate('File',
                sFile,
                [loCaseInsensitive]) then Edit
                                     else Append;
      Fields[0].AsString := sFile;
      Fields[1].AsString := sMarks;
      Fields[2].AsInteger:= iTopLine;
      Fields[3].AsInteger:= iCaretX;
      Fields[4].AsInteger:= iCaretY;
      Post;
      MergeChangeLog;
      SaveToFile();
    end;
  except
    //todo
  end;
  Result:= True
end;

function TmodDados.fLoad_FileState(sFile: string;
                                   var sMarks: string;
                                   var iTopLine: integer;
                                   var iCaretX: integer;
                                   var iCaretY: integer): boolean;
begin
  try
    with cdCache do begin
      First;
      if not Locate('File',
                    sFile,
                    [loCaseInsensitive]) then begin
        Result:= False;
        Exit;
      end;
      sMarks  := Fields[1].AsString;
      iTopLine:= Fields[2].AsInteger;
      iCaretX := Fields[3].AsInteger;
      iCaretY := Fields[4].AsInteger;
    end;
  except
    //todo
  end;
  Result:= True
end;

procedure TmodDados.pShortcuts_Validation(sOldShortcutsFile,
                                          sNewShortcutsFile: string);
var
  cdOld,
   cdNew: TClientDataSet;

  sGroupOld,
   sCaptionOld,
   sHintOld   : string;

begin
  try
    cdOld:= TClientDataSet.Create(Self);
    cdNew:= TClientDataSet.Create(Self);

    with cdOld do begin
      Active   := False;
      FileName := sOldShortcutsFile;
      Active   := True;
      IndexDefs.Clear;
      with IndexDefs.AddIndexDef do
      begin
        Name   := 'Shortcuts_Idx';
        Fields := 'Index';
        Options:= [ixPrimary, ixUnique];
      end;
      IndexName:= 'Shortcuts_Idx';
    end;

    with cdNew do begin
      DisableControls;
      Active   := False;
      FileName := sNewShortcutsFile;
      Active   := True;
      IndexDefs.Clear;
      with IndexDefs.AddIndexDef do
      begin
        Name   := 'Shortcuts_Idx';
        Fields := 'Index';
        Options:= [ixPrimary, ixUnique];
      end;
      IndexName:= 'Shortcuts_Idx';
    end;

    cdOld.First;
    while not cdOld.Eof do begin
      sGroupOld   := cdOld.FieldByName('Group').Value;
      sCaptionOld := cdOld.FieldByName('Caption').Value;
      sHintOld    := cdOld.FieldByName('Hint').Value;
      if cdNew.Locate('Group;Caption;Hint',
                      VarArrayOf([sGroupOld,sCaptionOld,sHintOld]),
                      []) then begin
        if (cdNew.FieldByName('Shortcut').Value <> cdOld.FieldByName('Shortcut').Value) then begin
           cdNew.Edit;
           cdNew.FieldByName('Shortcut').Value:= cdOld.FieldByName('Shortcut').Value;
           cdNew.Post;
        end;
      end;
      cdOld.Next;
    end;
    with cdNew do begin
      MergeChangeLog;
      SaveToFile();
    end;
  finally
    FreeAndNil(cdOld);
    FreeAndNil(cdNew);
  end;
end;

procedure TmodDados.pRcardGroups_Filter(Sender: TObject);
var
  i: integer;

  strTemp: string;

begin
  slRcard_Groups:= TStringList.Create;
  slRcard_Groups.CaseSensitive:= True;

  with cdRcard do begin
    DisableControls;
    First;
    for i:=1 to RecordCount do begin
      strTemp:= cdRcardGroup.Value;
      with slRcard_Groups do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
    EnableControls;
  end;
end;

procedure TmodDados.pCompletionGroups_Filter(Sender: TObject);
var
  i: integer;

  strTemp: string;

begin
  slCompletion_Groups:= TStringList.Create;
  slCompletion_Groups.CaseSensitive:= True;

  with cdCompletion do begin
    DisableControls;
    First;
    for i:=1 to RecordCount do begin
      strTemp:= cdCompletionGroup.Value;
      with slCompletion_Groups do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
    EnableControls;
  end;
end;

procedure TmodDados.pRmirrorsCountries_Filter(Sender: TObject);
var
  i: integer;

  strTemp: string;

begin
  if Assigned(slRmirrors_Countries) then
    FreeAndNil(slRmirrors_Countries);

  slRmirrors_Countries:= TStringList.Create;

  with cdRmirrors do begin
    DisableControls;
    First;
    for i:=1 to RecordCount do begin
      strTemp:= cdRmirrorsCountry.Value;
      with slRmirrors_Countries do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
    EnableControls;
  end;
end;

procedure TmodDados.pShortcutsGroups_Filter(Sender: TObject);
var
  i: integer;

  strTemp: string;

begin
  slShortcuts_App_Groups:= TStringList.Create;
  slShortcuts_App_Groups.CaseSensitive:= True;

  with cdShortcuts_App do begin
    DisableControls;
    First;
    for i:=1 to RecordCount do begin
      strTemp:= cdShortcuts_App_Group.Value;
      with slShortcuts_App_Groups do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
    EnableControls;
  end;
end;

procedure TmodDados.DataModuleCreate(Sender: TObject);
begin
  // R card
  with cdRcard do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\Rcard.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Rcard_Idx';
      Fields := 'Group;Function';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Rcard_Idx';
  end;

  // R Mirrors
  with cdRmirrors do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\Rmirrors.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Rmirrors_Idx';
      Fields := 'Country;Name;URL';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Rmirrors_Idx';
  end;

  // Completion
  with cdCompletion do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\Completion.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Completion_Idx';
      Fields := 'Trigger';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Completion_Idx';
  end;

  // Shortcuts
  with cdShortcuts_App do begin
    Active   := False;
    FileName := frmMain.sShortcuts_InUse;
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Shortcuts_Idx';
      Fields := 'Index';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Shortcuts_Idx';
  end;

  // Cache
  with cdCache do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\Cache.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Cache_Idx';
      Fields := 'File';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Cache_Idx';
  end;

  // Comments
  with cdComments do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\Comments.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Comments_Idx';
      Fields := 'Language';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Comments_Idx';
  end;

  // RH_Send
  with cdRH_Send do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\RH_Send.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'RH_Send_Idx';
      Fields := 'Index';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'RH_Send_Idx';
  end;

  // RH_Control
  with cdRH_Control do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\RH_Control.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'RH_Control_Idx';
      Fields := 'Index';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'RH_Control_Idx';
  end;

  // RH_Custom
  with cdRH_Custom do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\RH_Custom.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'RH_Custom_Idx';
      Fields := 'Caption;Index';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'RH_Custom_Idx';
  end;

  // Keystrokes_Editor
  with cdKeystrokes_Editor do begin
    Active   := False;
    FileName := frmMain.sPath_Data +
                '\Keystrokes_Editor.xml';
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'Editor_Idx';
      Fields := 'Command;Index';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'Editor_Idx';
  end;

  with frmMain do begin
    if not bDatabase_Restored then begin
      cdRcard.SavePoint            := iRcard_SavePoint;
      cdRmirrors.SavePoint         := iRmirrors_SavePoint;
      cdCompletion.SavePoint       := iCompletion_SavePoint;
      cdShortcuts_App.SavePoint    := iShortcuts_App_SavePoint;
      cdRH_Send.SavePoint          := iRH_Send_SavePoint;
      cdRH_Control.SavePoint       := iRH_Control_SavePoint;
      cdRH_Custom.SavePoint        := iRH_Custom_SavePoint;
      cdKeystrokes_Editor.SavePoint:= iKeystrokes_Editor_SavePoint;
    end
    else begin
      iRcard_SavePoint            := cdRcard.SavePoint;
      iRmirrors_SavePoint         := cdRmirrors.SavePoint;
      iCompletion_SavePoint       := cdCompletion.SavePoint;
      iShortcuts_App_SavePoint    := cdShortcuts_App.SavePoint;
      iRH_Send_SavePoint          := cdRH_Send.SavePoint;
      iRH_Control_SavePoint       := cdRH_Control.SavePoint;
      iRH_Custom_SavePoint        := cdRH_Custom.SavePoint;
      iKeystrokes_Editor_SavePoint:= cdKeystrokes_Editor.SavePoint;
      bDatabase_Restored          := False
    end;
  end;

  pRcardGroups_Filter(self);
  pCompletionGroups_Filter(self);
  pRmirrorsCountries_Filter(self);
  pShortcutsGroups_Filter(self);
end;

procedure TmodDados.DataModuleDestroy(Sender: TObject);
begin
  with cdRcard do
    Close; //Will also save to file whether any change was made!

  with cdRmirrors do
    Close; //Will also save to file whether any change was made!

  with cdCompletion do
    Close; //Will also save to file whether any change was made!

  with cdShortcuts_App do
    Close; //Will also save to file whether any change was made!

  with cdCache do
    Close; //Will also save to file whether any change was made!

  with cdComments do
    Close; //Will also save to file whether any change was made!

  with cdRH_Send do
    Close; //Will also save to file whether any change was made!

  with cdRH_Control do
    Close; //Will also save to file whether any change was made!

  with cdRH_Custom do
    Close; //Will also save to file whether any change was made!

  with cdKeystrokes_Editor do
    Close; //Will also save to file whether any change was made!

end;

procedure TmodDados.cdRcardPostError(DataSet: TDataSet;
                                     E: EDatabaseError;
                                     var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[0].Value +
             '  |  ' +
             DataSet.Fields.Fields[1].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdRH_CustomNewRecord(DataSet: TDataSet);
var
  i: integer;

begin
  i:= cdRH_Custom.RecordCount;
  cdRH_Custom_Index.AsInteger := i;
  cdRH_Custom_Group.AsString  := 'Custom';
  cdRH_Custom_Caption.AsString:= 'str(%s)';
  cdRH_Custom_Hotkey.AsString := '';

  with frmMain.dlgSKH_Map.dbeRH_Custom_Caption do begin
    SetFocus;
    SelectAll;
  end;
end;

procedure TmodDados.cdRH_CustomPostError(DataSet: TDataSet;
                                         E: EDatabaseError;
                                         var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[1].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdRmirrorsAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmR_Mirrors) then
    with frmR_Mirrors do begin
      stbRmirrors.Panels[0].Text:= 'Browse mode';
      frmR_Mirrors.bbtRmirrorsClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdRmirrorsAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmR_Mirrors) then
    with frmR_Mirrors.stbRmirrors do
      if Visible then Panels[0].Text:= 'Browse mode';
end;

procedure TmodDados.cdRmirrorsBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmR_Mirrors) then
    with frmR_Mirrors.stbRmirrors do
      Panels[0].Text:= 'Edit mode';
end;

procedure TmodDados.cdRmirrorsPostError(DataSet: TDataSet;
                                        E: EDatabaseError;
                                        var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[3].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdRtipPostError(DataSet: TDataSet;
                                    E: EDatabaseError;
                                    var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[0].Value + '  |  ' + DataSet.Fields.Fields[1].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdShortcuts_AppPostError(DataSet: TDataSet;
                                             E: EDatabaseError;
                                             var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[4].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdCompletionPostError(DataSet: TDataSet;
                                          E: EDatabaseError;
                                          var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[2].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdKeystrokes_EditorPostError(DataSet: TDataSet;
                                                 E: EDatabaseError;
                                                 var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[2].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdShortcuts_AppAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmMain.dlgSKH_Map) then
    with frmMain.dlgSKH_Map do begin
      stbShortcuts.Panels[0].Text:= 'Browse mode';
    end;
end;

procedure TmodDados.cdShortcuts_AppAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmMain.dlgSKH_Map) then
    with frmMain.dlgSKH_Map do begin
      imgShortcut.Picture.Bitmap:= nil;
      frmMain.imlTinnR.GetBitmap(cdShortcuts_App.FieldByName('Image').Value,
                                 imgShortcut.Picture.Bitmap);
      if Visible then stbShortcuts.Panels[0].Text:= 'Browse mode';
    end;

  with frmMain do
  if Assigned(dlgSKH_Map) then
    with dlgSKH_Map do begin
      imgShortcut.Picture.Bitmap:= nil;
      imlTinnR.GetBitmap(cdShortcuts_App.FieldByName('Image').Value,
                         imgShortcut.Picture.Bitmap);
      if Visible then stbShortcuts.Panels[0].Text:= 'Browse mode';
    end;

  if (cdShortcuts_App.State <> dsBrowse) then Exit;
  frmTools.imgShortcut.Picture.Bitmap:= nil;
  frmMain.imlTinnR.GetBitmap(cdShortcuts_App.FieldByName('Image').Value,
                             frmTools.imgShortcut.Picture.Bitmap);
end;

procedure TmodDados.cdShortcuts_AppBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmMain.dlgSKH_Map) then
    with frmMain.dlgSKH_Map.stbShortcuts do
      Panels[0].Text:= 'Edit mode';
end;

procedure TmodDados.cdShortcuts_AppNewRecord(DataSet: TDataSet);
var
  i: integer;

begin
  i:= cdShortcuts_App.RecordCount;
  cdShortcuts_App_Index.AsInteger:= i;
end;

procedure TmodDados.cdCommentsAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmComments) then
    with frmComments do begin
      stbComments.Panels[0].Text:= 'Browse mode';
      frmComments.bbtCommentsClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdCommentsAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmComments) then
    with frmComments.stbComments do
      if Visible then Panels[0].Text:= 'Browse mode';
end;

procedure TmodDados.cdCommentsBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmComments) then
    with frmComments.stbComments do
      Panels[0].Text:= 'Edit mode';
end;

procedure TmodDados.cdCommentsPostError(DataSet: TDataSet;
                                        E: EDatabaseError;
                                        var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[1].Value + #13 + #13 +
             'Key violation.' + #13 +
             'Latest insertion (or change) will be lost!',
             mtError,
             [MBOK],
             0);

  Dataset.Cancel;
  Action:= daAbort;
end;

procedure TmodDados.cdCompletionAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmCompletion) then
    with frmCompletion do begin
      stbCompletion.Panels[0].Text:= 'Browse mode';
      frmCompletion.bbtCompletionClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdCompletionAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmCompletion) then
    with frmCompletion.stbCompletion do
      if Visible then Panels[0].Text:= 'Browse mode';
end;

procedure TmodDados.cdCompletionBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmCompletion) then
    with frmCompletion.stbCompletion do
      Panels[0].Text:= 'Edit mode';
end;

procedure TmodDados.cdRcardAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmR_Card) then
    with frmR_Card do begin
      stbRcard.Panels[0].Text:= 'Browse mode';
      frmR_Card.bbtRcardClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdRcardAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmR_Card) then
    with frmR_Card.stbRcard do
      if Visible then Panels[0].Text:= 'Browse mode';
end;

procedure TmodDados.cdRcardBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmR_Card) then
    with frmR_Card.stbRcard do
      Panels[0].Text:= 'Edit mode';
end;

procedure TmodDados.cdRcardFilterRecord(DataSet: TDataSet;
                                        var Accept: Boolean);
var
  strTemp: string;

begin
  cdRcard.DisableControls;
  with frmMain do begin
    strTemp:= frmTools.lbRcard.Items[frmTools.lbRcard.ItemIndex];
    Accept :=(cdRcardGroup.AsString = strTemp);
  end;
  cdRcard.EnableControls;
end;

function TmodDados.fActionlist_To_Dataset: boolean;

  procedure pClientDataset_Structure(cdTmp: TClientDataset);
  begin
    with cdTmp do begin
      with FieldDefs.AddFieldDef do begin
        DataType:= ftInteger;
        Name    := 'Index';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 50;
        Name    := 'Group';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 50;
        Name    := 'Caption';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 80;
        Name    := 'Hint';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 50;
        Name    := 'Shortcut';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftInteger;
        Name    := 'Image';
      end;

      with IndexDefs.AddIndexDef do begin
        Name   := 'Shortcuts_Idx';
        Fields := 'Index';
        Options:= [ixPrimary, ixUnique];
      end;

      FileName:= frmMain.sPath_Data +
                 '\Shortcuts_App.xml';
      CreateDataSet;
    end;
  end;

var
  i,
   iImage: integer;

  sShortcut,
   sGroup,
   sCaption,
   sHint   : string;

  aTmp : TAction;
  cdTmp: TClientDataSet;

  procedure pUpdate_Dataset(i: integer;
                            sGroup,
                            sCaption,
                            sHint,
                            sShortcut: string;
                            iImage: integer);
  begin
    with cdTmp do begin
      Append;
      Fields[0].AsInteger:= i;
      Fields[1].AsString := sGroup;
      Fields[2].AsString := sCaption;
      Fields[3].AsString := sHint;
      Fields[4].AsString := sShortcut;
      Fields[5].AsInteger:= iImage;
      Post;
    end;
  end;
  
begin
  frmMain.alMain.State:= asSuspended;

  try
    try
      cdTmp:= TClientDataSet.Create(Self);
      pClientDataset_Structure(cdTmp);

      for i:= 0 to frmMain.alMain.ActionCount -1 do begin
        aTmp  := TAction(frmMain.alMain.Actions[i]);
        sGroup:= aTmp.Category;
        with aTmp do begin
          sCaption := Caption;
          sHint    := Hint;
          sShortcut:= ShortCutToText(Shortcut);
          iImage   := ImageIndex;
//          if (sShortCut = '') then sShortCut:= 'None';
        end;
        pUpdate_Dataset(i,
                        sGroup,
                        sCaption,
                        sHint,
                        sShortcut,
                        iImage);
      end;
      frmMain.alMain.State:= asNormal;
      
      with cdTmp do begin
        MergeChangeLog;
        SaveToFile();
      end;
    except
      //TODO
    end;
  finally
    Result:= True;
    FreeAndNil(cdTmp);
  end;
end;

function TmodDados.fRmirrors_Update(sFile: string): boolean;

  procedure pClientDataset_Structure(cdTmp: TClientDataset);
  begin
    with cdTmp do begin
      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 30;
        Name    := 'Name';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 20;
        Name    := 'Country';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 20;
        Name    := 'City';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 60;
        Name    := 'URL';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 80;
        Name    := 'Host';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 2;
        Name    := 'Code';
      end;

      with IndexDefs.AddIndexDef do begin
        Name   := 'Rtip_Idx';
        Fields := 'Country;Name;URL';
        Options:= [ixPrimary, ixUnique];
      end;

      FileName:= frmMain.sPath_Data +
                 '\Rmirrors.xml';

      CreateDataSet;
    end;
  end;

var
  i: integer;

  cdTmp : TClientDataSet;
  slTmp1: TStringList;
  slTmp2: TStringList;

begin
  try
    try
      cdTmp:= TClientDataSet.Create(Self);
      pClientDataset_Structure(cdTmp);

      slTmp1:= TStringList.Create;
      slTmp2:= TStringList.Create;
      slTmp1.LoadFromFile(sFile);

      pString_Split('|',
                    slTmp1.Text,
                    slTmp2);
      {
        // To debug only
      ShowMessage(slTmp1.Text);
      ShowMessage(slTmp2.Text);
      }

      cdRmirrors.Active:= False;

      i:= 0;
      repeat
        {
        // To debug only
        ShowMessage(slTmp2.Strings[i]   + #13 +
                    slTmp2.Strings[i+1] + #13 +
                    slTmp2.Strings[i+2] + #13 +
                    slTmp2.Strings[i+3] + #13 +
                    slTmp2.Strings[i+4] + #13 +
                    slTmp2.Strings[i+5]
                    );
        }
        with cdTmp do begin
          Append;
          {// Germany, Spain and Sweden?
          Fields[0].AsString:= Utf8ToAnsi(slTmp2.Strings[i]);
          Fields[1].AsString:= Utf8ToAnsi(slTmp2.Strings[i+1]);
          Fields[2].AsString:= Utf8ToAnsi(slTmp2.Strings[i+2]);
          Fields[3].AsString:= Utf8ToAnsi(slTmp2.Strings[i+3]);
          Fields[4].AsString:= Utf8ToAnsi(slTmp2.Strings[i+4]);
          Fields[5].AsString:= Utf8ToAnsi(slTmp2.Strings[i+5]);
          }
          Fields[0].AsString:= slTmp2.Strings[i];
          Fields[1].AsString:= slTmp2.Strings[i+1];
          Fields[2].AsString:= slTmp2.Strings[i+2];
          Fields[3].AsString:= slTmp2.Strings[i+3];
          Fields[4].AsString:= slTmp2.Strings[i+4];
          Fields[5].AsString:= slTmp2.Strings[i+5];
          Post;
        end;

        i:= i + 6;
      until (i = 6*slTmp1.Count);  // slTmp1.Count = Total of mirrors (lines of the file sFile = Rmirrors.txt)

      with cdTmp do begin
        MergeChangeLog;
        SaveToFile();
      end;

      Result:= True;
    except
      Result:= False;
    end;
  finally
    cdRmirrors.Active:= True;
    FreeAndNil(cdTmp);
    FreeAndNil(slTmp1);
    FreeAndNil(slTmp2);
  end;
end;

(*
if not FileExists(frmMain.sFileDataOrigin) then Exit;
try
  modDados.cdRmirrors.Active:= False;
  with frmMain.zipKit do begin
    FileName     := frmMain.sFileDataOrigin;
    BaseDirectory:= frmMain.sPath_Data;
    ExtractFiles('Rmirrors.xml');
    CloseArchive;
  end;
  modDados.cdRmirrors.Active:= True;
  frmMain.iRmirrorsBeforeChanges:= modDados.cdRmirrors.SavePoint;

  MessageDlg('The original ''Rmirrors.xml'' was successfully restored.',
             mtInformation,
             [MBOK],
             0);
except
  // todo!
end;
*)

(*
function TmodDados.RmirrorsToDataset(sFile: string): boolean;

  procedure ClientDatasetStructure(cdTmp: TClientDataset);
  begin
    with cdTmp do begin
      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 30;
        Name    := 'Name';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 20;
        Name    := 'Country';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 20;
        Name    := 'City';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 60;
        Name    := 'URL';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 60;
        Name    := 'Host';
      end;

      with FieldDefs.AddFieldDef do begin
        DataType:= ftString;
        Size    := 2;
        Name    := 'Code';
      end;

      with IndexDefs.AddIndexDef do begin
        Name   := 'RtipDefaultIndex';
        Fields := 'Country;Name;URL';
        Options:= [ixPrimary, ixUnique];
      end;

      FileName:= frmMain.sPath_Data +
                 '\Rmirrors_tmp.xml';
      CreateDataSet;
    end;
  end;

var
  i     : integer;
  cdTmp : TClientDataSet;
  slTmp1: TStringList;
  slTmp2: TStringList;

begin
  try
    try
      cdTmp:= TClientDataSet.Create(Self);
      ClientDatasetStructure(cdTmp);

      slTmp1:= TStringList.Create;
      slTmp2:= TStringList.Create;
      slTmp1.LoadFromFile(sFile);

      pStrSplit('|',
                slTmp1.Text,
                slTmp2);

      i:= 0;
      repeat
        { // To debug only
        ShowMessage(slTmp2.Strings[i]   + #13 +
                    slTmp2.Strings[i+1] + #13 +
                    slTmp2.Strings[i+2] + #13 +
                    slTmp2.Strings[i+3] + #13 +
                    slTmp2.Strings[i+4] + #13 +
                    slTmp2.Strings[i+5]
                    );
        *}
        with cdTmp do begin
          Append;
          Fields[0].AsString:= slTmp2.Strings[i];
          Fields[1].AsString:= slTmp2.Strings[i+1];
          Fields[2].AsString:= slTmp2.Strings[i+2];
          Fields[3].AsString:= slTmp2.Strings[i+3];
          Fields[4].AsString:= slTmp2.Strings[i+4];
          Fields[5].AsString:= slTmp2.Strings[i+5];
          Post;
        end;

        i:= i + 6;
      until (i = 6*slTmp1.Count);  // slTmp1.Count = Total of mirrors (lines of the file sFile = Rmirrors.txt)

      with cdTmp do begin
        MergeChangeLog;
        SaveToFile();
      end;
    except
      //TODO
    end;
  finally
    Result:= True;
    FreeAndNil(cdTmp);
    FreeAndNil(slTmp1);
    FreeAndNil(slTmp2);
  end;
end;
*)

end.


