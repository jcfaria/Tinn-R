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
  DBClient, DB, MidasLib, FMTBcd, SqlExpr, WideStrings;

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
    cdShortcuts: TClientDataSet;
    cdShortcutsCaption: TStringField;
    cdShortcutsGroup: TStringField;
    cdShortcutsHint: TStringField;
    cdShortcutsImageIndex: TIntegerField;
    cdShortcutsIndex: TIntegerField;
    cdShortcutsShortcut: TStringField;
    dsCache: TDataSource;
    dsComments: TDataSource;
    dsCompletion: TDataSource;
    dsRcard: TDataSource;
    dsRmirrors: TDataSource;
    dsShortcuts: TDataSource;

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
    procedure cdShortcutsAfterPost(DataSet: TDataSet);
    procedure cdShortcutsAfterScroll(DataSet: TDataSet);
    procedure cdShortcutsBeforeEdit(DataSet: TDataSet);
    procedure cdShortcutsNewRecord(DataSet: TDataSet);
    procedure cdShortcutsPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    { Private declarations }

  public
    { Public declarations }
    slCompletion_Groups : TStringList;  //Stores groups of Completion
    slRcard_Groups      : TStringList;  //Stores groups of R card
    slRmirrors_Countries: TStringList;  //Stores countries of R mirrors
    slShortcuts_Groups  : TStringList;  //Stores groups of Shortcuts

    function fActionlist_To_Dataset: boolean;
    function fLoad_FileState(sFile: string; var sMarks: string; var iTopLine: integer; var iCaretX: integer; var iCaretY: integer): boolean;
    function fCheck_Hotkey_Use_App(sHotkey: string; var sBy: string; bHotkey_Clear: boolean = False): boolean;
    function fRmirrors_Update(sFile: string): boolean;
    function fSave_FileState(sFile, sMarks: string; iTopLine, iCaretX, iCaretY: integer): boolean;

    procedure pCompletionGroups_Filter(Sender: TObject);
    procedure pRcardGroups_Filter(Sender: TObject);
    procedure pRmirrorsCountries_Filter(Sender: TObject);
    procedure pSet_Current_Highlighter(sLanguage: string);
    procedure pShortcutsGroups_Filter(Sender: TObject);
    procedure pShortcuts_Validation(sOldShortcutsFile, sNewShortcutsFile: string);
//    procedure mtest;
  end;

var
  modDados: TmodDados;

implementation

uses
  ufrmMain,
  ufrmRcard,
  ufrmCompletion,
  ufrmTools,
  ufrmShortcuts,
  Variants,
  Menus,
  ActnList,
  ufrmHotKeys,
  ufrmComments,
  trUtils,
  ufrmRmirrors,
  ufrmSKH_map;

{$R *.DFM}

//procedure TmodDados.mtest;
//begin
//  //To tests
//end;

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

function TmodDados.fCheck_Hotkey_Use_App(sHotkey: string; var sBy: string; bHotkey_Clear: boolean = False): boolean;
var
  pTmp:  pointer;

  bFiltered: boolean;

  sTmp: string;

begin
  Result:= False;

  case frmMain.dlgSKH_Map.pgSH.ActivePageIndex of
    0: begin
         with cdShortcuts do begin
           pTmp:= GetBookmark;
           DisableControls;
           bFiltered:= Filtered;
           if bFiltered then
             Filtered:= False;

           sTmp:= StringReplace(sHotkey,
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

             if bHotkey_Clear then begin
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
       end; //0: begin
  end;
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
        Name   := 'ShortcutsDefaultIndex';
        Fields := 'Index';
        Options:= [ixPrimary, ixUnique];
      end;
      IndexName:= 'ShortcutsDefaultIndex';
    end;

    with cdNew do begin
      DisableControls;
      Active   := False;
      FileName := sNewShortcutsFile;
      Active   := True;
      IndexDefs.Clear;
      with IndexDefs.AddIndexDef do
      begin
        Name   := 'ShortcutsDefaultIndex';
        Fields := 'Index';
        Options:= [ixPrimary, ixUnique];
      end;
      IndexName:= 'ShortcutsDefaultIndex';
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
  //slRmirrors_Countries.CaseSensitive:= True;

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
  slShortcuts_Groups:= TStringList.Create;
  slShortcuts_Groups.CaseSensitive:= True;

  with cdShortcuts do begin
    DisableControls;
    First;
    for i:=1 to RecordCount do begin
      strTemp:= cdShortcutsGroup.Value;
      with slShortcuts_Groups do
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
      Name   := 'RcardDefaultIndex';
      Fields := 'Group;Function';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'RcardDefaultIndex';
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
      Name   := 'RmirrorsDefaultIndex';
      Fields := 'Country;Name;URL';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'RmirrorsDefaultIndex';
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
      Name   := 'CompletionDefaultIndex';
      Fields := 'Trigger';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'CompletionDefaultIndex';
  end;

  // Shortcuts
  with cdShortcuts do begin
    Active   := False;
    FileName := frmMain.sShortcutsInUse;
    Active   := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name   := 'ShortcutsDefaultIndex';
      Fields := 'Index';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'ShortcutsDefaultIndex';
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
      Name   := 'CacheDefaultIndex';
      Fields := 'File';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'CacheDefaultIndex';
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
      Name   := 'CommentsDefaultIndex';
      Fields := 'Language';
      Options:= [ixPrimary, ixUnique];
    end;
    IndexName:= 'CommentsDefaultIndex';
  end;

  with frmMain do begin
    if not bDatabaseRestored then begin
      cdRcard.SavePoint     := iRcardBeforeChanges;
      cdRmirrors.SavePoint  := iRmirrorsBeforeChanges;
      cdCompletion.SavePoint:= iCompletionBeforeChanges;
      cdShortcuts.SavePoint := iShortcutsBeforeChanges;
    end
    else begin
      iRcardBeforeChanges     := cdRcard.SavePoint;
      iRmirrorsBeforeChanges  := cdRmirrors.SavePoint;
      iCompletionBeforeChanges:= cdCompletion.SavePoint;
      iShortcutsBeforeChanges := cdShortcuts.SavePoint;
      bDatabaseRestored       := False
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

  with cdSHortcuts do
    Close; //Will also save to file whether any change was made!

  with cdCache do
    Close; //Will also save to file whether any change was made!

  with cdComments do
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

procedure TmodDados.cdRmirrorsAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmRmirrors) then
    with frmRmirrors do begin
      stbRmirrors.Panels[0].Text:= 'Browse mode';
      frmRmirrors.bbtRmirrorsClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdRmirrorsAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmRmirrors) then
    with frmRmirrors.stbRmirrors do
      if Visible then Panels[0].Text:= 'Browse mode';
end;

procedure TmodDados.cdRmirrorsBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmRmirrors) then
    with frmRmirrors.stbRmirrors do
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

procedure TmodDados.cdShortcutsPostError(DataSet: TDataSet;
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

procedure TmodDados.cdShortcutsAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmShortcuts) then
    with frmShortcuts do begin
      stbShortcuts.Panels[0].Text:= 'Browse mode';
      frmShortcuts.bbtShortcutsClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdShortcutsAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmShortcuts) then
    with frmShortcuts do begin
      if bLocating then Exit;
      eKeyShort.HotKey:= TextToShortcut(cdShortcuts.FieldByName('Shortcut').Value);
      imgShortcut.Picture.Bitmap:= nil;
      frmMain.imlTinnR.GetBitmap(cdShortcuts.FieldByName('Image').Value,
                                 imgShortcut.Picture.Bitmap);
      if Visible then stbShortcuts.Panels[0].Text:= 'Browse mode';
    end;

  with frmMain do
  if Assigned(dlgSKH_Map) then
    with dlgSKH_Map do begin
      //if bLocating then Exit;
      //eKeyShort.HotKey:= TextToShortcut(cdShortcuts.FieldByName('Shortcut').Value);
      imgShortcut.Picture.Bitmap:= nil;
      imlTinnR.GetBitmap(cdShortcuts.FieldByName('Image').Value,
                         imgShortcut.Picture.Bitmap);
      if Visible then stbShortcuts.Panels[0].Text:= 'Browse mode';
    end;

  if Assigned(frmHotkeys) then
    with frmHotkeys do
      if bLocating then Exit;
  if (cdShortcuts.State <> dsBrowse) then Exit;
  frmTools.imgShortcut.Picture.Bitmap:= nil;
  frmMain.imlTinnR.GetBitmap(cdShortcuts.FieldByName('Image').Value,
                             frmTools.imgShortcut.Picture.Bitmap);
end;

procedure TmodDados.cdShortcutsBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmShortcuts) then
    with frmShortcuts.stbShortcuts do
      Panels[0].Text:= 'Edit mode';
end;

procedure TmodDados.cdShortcutsNewRecord(DataSet: TDataSet);
var
  i: Integer;

begin
  i:= cdShortcuts.RecordCount;
  cdShortcutsIndex.AsInteger:= i;
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
  if Assigned(frmRcard) then
    with frmRcard do begin
      stbRcard.Panels[0].Text:= 'Browse mode';
      frmRcard.bbtRcardClose.Enabled:= True;
    end;
end;

procedure TmodDados.cdRcardAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmRcard) then
    with frmRcard.stbRcard do
      if Visible then Panels[0].Text:= 'Browse mode';
end;

procedure TmodDados.cdRcardBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmRcard) then
    with frmRcard.stbRcard do
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
        Name   := 'ShortcutsDefaultIndex';
        Fields := 'Index';
        Options:= [ixPrimary, ixUnique];
      end;

      FileName:= frmMain.sPath_Data +
                 '\Shortcuts.xml';
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
        Name   := 'RtipDefaultIndex';
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

end.

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
