{-------------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: SynEdit.pas, released 2000-04-07.
The Original Code is based on mwCustomEdit.pas by Martin Waldenburg, part of
the mwEdit component suite.
Portions created by Martin Waldenburg are Copyright (C) 1998 Martin Waldenburg.
This file was adapted for use in Tinn-R by José Cláudio Faria 2013/10/05

All Rights Reserved.

Contributors to the SynEdit and mwEdit projects are listed in the
Contributors.txt file.

Alternatively, the contents of this file may be used under the terms of the
GNU General Public License Version 2 or later (the "GPL"), in which case
the provisions of the GPL are applicable instead of those above.
If you wish to allow use of your version of this file only under the terms
of the GPL and not to allow others to use your version of this file
under the MPL, indicate your decision by deleting the provisions above and
replace them with the notice and other provisions required by the GPL.
If you do not delete the provisions above, a recipient may use your version
of this file under either the MPL or the GPL.

$Id: SynEditOptionsDialog.pas,v 1.23 2004/10/13 02:45:46 etrusco Exp $
$Id: SynEditOC.pas,v 1.24 2013/10/05 20:15 J.C.Faria Exp $

You may retrieve the latest version of this file at the SynEdit home page,
located at http://SynEdit.SourceForge.net

Known Issues:
-------------------------------------------------------------------------------}
unit SynEditOC;

{$I SynEdit.inc}

interface

uses
  Windows, Messages, Classes, Graphics,
  SynEdit, SynEditMiscClasses, SynEditKeyCmds;

type
  TSynEditorOC = class;

  TSynEditorOptionsAllUserCommands = procedure(ACommands: TStrings) of object;

  TSynEditorOptionsUserCommand = procedure(AUserCommand: Integer;
                                           var ADescription: string) of object;

  // This class is assignable to a SynEdit without modifying key properties that affect function
  TSynEditorOC = class(TComponent)
  private
    FHideSelection: Boolean;
    FWantTabs: Boolean;
    FMaxUndo: Integer;
    FExtraLineSpacing: Integer;
    FTabWidth: Integer;
    FMaxScrollWidth: Integer;
    FRightEdge: Integer;
    FSelectedColor: TSynSelectedColor;
    FRightEdgeColor: TColor;
    FFont: TFont;
    FBookmarks: TSynBookMarkOpt;
    FOverwriteCaret: TSynEditCaretType;
    FInsertCaret: TSynEditCaretType;
    FKeystrokes: TSynEditKeyStrokes;
    FOptions: TSynEditorOptions;
    FSynGutter: TSynGutter;
    FWordBreakChars: String;
    FColor: TColor;

    procedure SetBookMarks(const Value: TSynBookMarkOpt);
    procedure SetFont(const Value: TFont);
    procedure SetKeystrokes(const Value: TSynEditKeyStrokes);
    procedure SetOptions(const Value: TSynEditorOptions);
    procedure SetSynGutter(const Value: TSynGutter);

  public
    FAllUserCommands: TSynEditorOptionsAllUserCommands;
    FUserCommand: TSynEditorOptionsUserCommand;

    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure AssignTo(Dest: TPersistent); override;

    property GetUserCommandNames: TSynEditorOptionsUserCommand read FUserCommand
                                                               write FUserCommand;

    property GetAllUserCommands: TSynEditorOptionsAllUserCommands read FAllUserCommands
                                                                  write FAllUserCommands;

  published
    property Options: TSynEditorOptions read FOptions
                                        write SetOptions;

    property BookMarkOptions : TSynBookMarkOpt read FBookmarks
                                               write SetBookMarks;

    property Color: TColor read FColor
                           write FColor;

    property Font: TFont read FFont
                         write SetFont;

    property ExtraLineSpacing: Integer read FExtraLineSpacing
                                       write FExtraLineSpacing;

    property Gutter: TSynGutter read FSynGutter
                                write SetSynGutter;

    property RightEdge: Integer read FRightEdge
                                write FRightEdge;

    property RightEdgeColor: TColor read FRightEdgeColor
                                    write FRightEdgeColor;

    property WantTabs: Boolean read FWantTabs
                               write FWantTabs;

    property InsertCaret: TSynEditCaretType read FInsertCaret
                                            write FInsertCaret;

    property OverwriteCaret: TSynEditCaretType read FOverwriteCaret
                                               write FOverwriteCaret;

    property HideSelection: Boolean read FHideSelection
                                    write FHideSelection;

    property MaxScrollWidth: Integer read FMaxScrollWidth
                                     write FMaxScrollWidth;

    property MaxUndo: Integer read FMaxUndo
                              write FMaxUndo;

    property SelectedColor: TSynSelectedColor read FSelectedColor
                                              write FSelectedColor;

    property TabWidth: Integer read FTabWidth
                               write FTabWidth;

    property WordBreakChars: String read FWordBreakChars
                                    write FWordBreakChars;

    property Keystrokes: TSynEditKeyStrokes read FKeystrokes
                                            write SetKeystrokes;
  end;

implementation
procedure TSynEditorOC.Assign(Source: TPersistent);
begin
  if Assigned(Source) and
    (Source is TCustomSynEdit) then begin
    Self.Font.Assign(TCustomSynEdit(Source).Font);
    Self.BookmarkOptions.Assign(TCustomSynEdit(Source).BookmarkOptions);
    Self.Gutter.Assign(TCustomSynEdit(Source).Gutter);
    Self.Keystrokes.Assign(TCustomSynEdit(Source).Keystrokes);
    Self.SelectedColor.Assign(TCustomSynEdit(Source).SelectedColor);
    Self.Color           := TCustomSynEdit(Source).Color;
    Self.Options         := TCustomSynEdit(Source).Options;
    Self.ExtraLineSpacing:= TCustomSynEdit(Source).ExtraLineSpacing;
    Self.HideSelection   := TCustomSynEdit(Source).HideSelection;
    Self.InsertCaret     := TCustomSynEdit(Source).InsertCaret;
    Self.OverwriteCaret  := TCustomSynEdit(Source).OverwriteCaret;
    Self.MaxScrollWidth  := TCustomSynEdit(Source).MaxScrollWidth;
    Self.MaxUndo         := TCustomSynEdit(Source).MaxUndo;
    Self.RightEdge       := TCustomSynEdit(Source).RightEdge;
    Self.RightEdgeColor  := TCustomSynEdit(Source).RightEdgeColor;
    Self.TabWidth        := TCustomSynEdit(Source).TabWidth;
    Self.WantTabs        := TCustomSynEdit(Source).WantTabs;
  end
  else inherited;
end;

procedure TSynEditorOC.AssignTo(Dest: TPersistent);
begin
  if Assigned(Dest) and
    (Dest is TCustomSynEdit) then begin
    TCustomSynEdit(Dest).Font.Assign(Self.Font);
    TCustomSynEdit(Dest).BookmarkOptions.Assign(Self.BookmarkOptions);
    TCustomSynEdit(Dest).Gutter.Assign(Self.Gutter);


    TCustomSynEdit(Dest).Keystrokes.Assign(Self.Keystrokes);
    TCustomSynEdit(Dest).SelectedColor.Assign(Self.SelectedColor);
    TCustomSynEdit(Dest).Color           := Self.Color;
    TCustomSynEdit(Dest).Options         := Self.Options;
    TCustomSynEdit(Dest).ExtraLineSpacing:= Self.ExtraLineSpacing;
    TCustomSynEdit(Dest).HideSelection   := Self.HideSelection;
    TCustomSynEdit(Dest).InsertCaret     := Self.InsertCaret;
    TCustomSynEdit(Dest).OverwriteCaret  := Self.OverwriteCaret;
    TCustomSynEdit(Dest).MaxScrollWidth  := Self.MaxScrollWidth;
    TCustomSynEdit(Dest).MaxUndo         := Self.MaxUndo;
    TCustomSynEdit(Dest).RightEdge       := Self.RightEdge;
    TCustomSynEdit(Dest).RightEdgeColor  := Self.RightEdgeColor;
    TCustomSynEdit(Dest).TabWidth        := Self.TabWidth;
    TCustomSynEdit(Dest).WantTabs        := Self.WantTabs;
  end
  else inherited;
end;

constructor TSynEditorOC.Create(AOwner: TComponent);
begin
  inherited;
  FBookmarks    := TSynBookMarkOpt.Create(Self);
  FKeystrokes   := TSynEditKeyStrokes.Create(Self);
  FSynGutter    := TSynGutter.Create;
  FSelectedColor:= TSynSelectedColor.Create;
  FSelectedColor.Foreground:= clHighlightText;
  FSelectedColor.Background:= clHighlight;
  FFont           := TFont.Create;
  FFont.Name      := 'Consolas';
  FFont.Size      := 11;
  Color           := clWhite;
  Options         := SYNEDIT_DEFAULT_OPTIONS;
  ExtraLineSpacing:= 0;
  HideSelection   := False;
  InsertCaret     := ctVerticalLine;
  MaxScrollWidth  := 1024;
  MaxUndo         := 1024;
  OverwriteCaret  := ctBlock;
  RightEdge       := 80;
  RightEdgeColor  := clSilver;
  TabWidth        := 8;
  WantTabs        := True;

  Keystrokes.ResetDefaults;
end;

destructor TSynEditorOC.Destroy;
begin
  FBookMarks.Free;
  FKeyStrokes.Free;
  FSynGutter.Free;
  FSelectedColor.Free;
  FFont.Free;
  inherited;
end;

procedure TSynEditorOC.SetBookMarks(const Value: TSynBookMarkOpt);
begin
  FBookmarks.Assign(Value);
end;

procedure TSynEditorOC.SetFont(const Value: TFont);
begin
  FFont.Assign(Value);
end;

procedure TSynEditorOC.SetKeystrokes(const Value: TSynEditKeyStrokes);
begin
  FKeystrokes.Assign(Value);
end;

procedure TSynEditorOC.SetOptions(const Value: TSynEditorOptions);
begin
  FOptions:= Value;
end;

procedure TSynEditorOC.SetSynGutter(const Value: TSynGutter);
begin
  FSynGutter.Assign(Value);
end;

end.
