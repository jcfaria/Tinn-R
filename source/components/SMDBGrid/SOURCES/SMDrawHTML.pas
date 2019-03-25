{ Copyright (C) 1998-2004, written by Mike Shkolnik, Scalabium Software
  E-Mail:  mshkolnik@scalabium.com
           mshkolnik@yahoo.com
  WEB: http://www.scalabium.com

Samples:

DrawSMHTML(PaintBox1.Canvas, PaintBox1.ClientRect, '<valign=center><b>1234567890</b>1234<i>56789<u>0</u></i></valign>')

}
unit SMDrawHTML;

interface

uses
  Classes, Windows, Graphics;

procedure DrawSMHTML(ACanvas: TCanvas; ARect: TRect; HTML: string
                     {$IFDEF SMDelphi4}
                     , ABiDiMode: TABiDiMode;
                     {$ENDIF}
                     );

implementation

uses SysUtils;

procedure ReplaceHTMLChars(var Value: string);
var
  i, j, intLen: Integer;
  strOld, strNew: string;
begin
  intLen := Length(Value);
  repeat
    i := Pos('&', Value);
    if (i > 0) then
    begin
      j := i+1;
      while (j <= intLen) and (Value[j] <> ';') do
        Inc(j);
      strOld := Copy(value, i, j-i);
      if (strOld = '&brvbar') then
        strNew := '|'
      else
      if (strOld = '&deg') then
        strNew := 'ø'
      else
      if (strOld = '&plusmn') then
        strNew := '+'
      else
      if (strOld = '&para') then
        strNew := '¶'
      else
      if (strOld = '&amp') then
        strNew := '&'
      else
      if (strOld = '&lt') then
        strNew := '<'
      else
      if (strOld = '&gt') then
        strNew := '>'
      else
      if (strOld = '&copy') then
        strNew := 'c'
      else
      if (strOld = '&quot') then
        strNew := '"'
      else
      if (strOld = '&apos') then
        strNew := ''''
      else
      if (strOld = '&trade') then
        strNew := 'T'
      else
      if (strOld = '&nbsp') then
        strNew := ''
      else
      if (strOld = '&car') then
        strNew := #10
      else
      if (strOld = '&ret') then
        strNew := #13
      else
        break;//continue;

//      Insert(Value, i, j-i, strOld, strNew)
      Delete(Value, i, j-i+1); //to delete ';' also
      if strNew <> '' then
        Insert(strNew, Value, i);

    end;
  until (i <= 0);
end;

type
  TSMVAlignment = (vaTop, vaCenter, vaBottom);

procedure DrawSMHTML(ACanvas: TCanvas; ARect: TRect; HTML: string
                     {$IFDEF SMDelphi4}
                     , ABiDiMode: TABiDiMode;
                     {$ENDIF}
                     );

{$IFDEF SMDelphi4}
  function IsRightToLeft: Boolean;
  begin
    Result := SysLocale.MiddleEast and (ABiDiMode <> bdLeftToRight);
  end;
{$ENDIF}

  procedure RemoveQuotes(var Value: string);
  begin
    if (Value = '') then exit;

    if (Value[1] = '"') then
      Delete(Value, 1, 1);
    if (Value[Length(Value)] = '"') then
      Delete(Value, Length(Value), 1);
    if (Value[Length(Value)] = '>') then
      Delete(Value, Length(Value), 1);
   end;

   function Hex2Color(s: string): TColor;
   var
     r, g, b: Integer;
   begin
     Delete(s, 1, 1);
     s := UpperCase(s);
     r := StrToInt('$' + Copy(s, 1, 2));
     g := StrToInt('$' + Copy(s, 3, 2));
     b := StrToInt('$' + Copy(s, 5, 2));
     Result := TColor(b*256*256+g*256+r);
   end;

const
  AlignHFlags: array [TAlignment] of Integer =
     (DT_LEFT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_RIGHT or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX,
      DT_CENTER or DT_WORDBREAK or DT_EXPANDTABS or DT_NOPREFIX);
  AlignVFlags: array [TSMVAlignment] of Integer =
     (DT_TOP, DT_VCENTER or DT_SINGLELINE, DT_BOTTOM or DT_SINGLELINE);

{$IFDEF SMDelphi4}
  RTL: array [Boolean] of Integer = (0, DT_RTLREADING);
{$ENDIF}

var
  intTagBegin, intTagEnd, intSpacePos: Integer;
  strValue, strPureTag, strTagName: string;
  curHAlignment: TAlignment;
  curVAlignment: TSMVAlignment;
  IsFontTag, IsTagEnd: Boolean;
begin
  if (HTML = '') then exit;
  if not Assigned(ACanvas) then
    raise Exception.Create('Canvas not defined.');

  curHAlignment := taLeftJustify;
  curVAlignment := vaTop;
  while (HTML <> '') do
  begin
    intTagBegin := Pos('<', HTML);
    intTagEnd := Pos('>', HTML);

    if ((intTagBegin = 0) and (intTagEnd > 0)) or
       ((intTagBegin > 0) and (intTagEnd = 0)) then
      raise Exception.Create('Incorrect html-formatting.');

    if ((intTagBegin = 0) and (intTagEnd = 0)) then
    begin
      intTagBegin := Length(HTML)+1;
      intTagEnd := intTagBegin
    end;

    {draw text before begin-tag}
    if (intTagBegin > 1) then
    begin
      strValue := Copy(HTML, 1, intTagBegin-1);
      {normalize string (convert all &-strings before draw}
      ReplaceHTMLChars(strValue);
      DrawText(ACanvas.Handle, PChar(strValue), -1, ARect,
               AlignHFlags[curHAlignment] or AlignVFlags[curVAlignment]
               {$IFDEF SMDelphi4} or RTL[IsRightToLeft(ABiDiMode)] {$ENDIF});
      ARect.Left := ARect.Left + ACanvas.TextWidth(strValue)
    end;

    {process the tag}
    strValue := LowerCase(Copy(HTML, intTagBegin+1, intTagEnd-intTagBegin));
    IsFontTag := False;
    IsTagEnd := (strValue <> '') and (strValue[1]='/');
    if IsTagEnd then
      Delete(strValue, 1, 1);
    repeat
      intSpacePos := Pos(' ', strValue);

      if (intSpacePos = 0) then
        strPureTag := strValue
      else
      begin
        strPureTag := Copy(strValue, 1, intSpacePos-1);
        Delete(strValue, 1, intSpacePos);
      end;

      if (strPureTag <> '') then
      begin
        strTagName := 'align=';
        if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
        begin
          Delete(strPureTag, 1, Length(strTagName));
          RemoveQuotes(strPureTag);
          if (strPureTag <> '') then
          begin
            if (strPureTag = 'left') then
              curHAlignment := taLeftJustify
            else
            if (strPureTag = 'right') then
              curHAlignment := taRightJustify
            else
            if (strPureTag = 'center') then
              curHAlignment := taCenter
          end;
        end
        else
        begin
          strTagName := 'valign=';
          if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
          begin
            Delete(strPureTag, 1, Length(strTagName));
            RemoveQuotes(strPureTag);
            if (strPureTag <> '') then
            begin
              if (strPureTag = 'top') then
                curVAlignment := vaTop
              else
              if (strPureTag = 'bottom') then
                curVAlignment := vaBottom
              else
              if (strPureTag = 'center') then
                curVAlignment := vaCenter
            end;
          end
          else
          begin
            strTagName := 'font';
            if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
              IsFontTag := True
            else
            begin
              strTagName := 'size';
              if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
              begin
                Delete(strPureTag, 1, Length(strTagName));
                RemoveQuotes(strPureTag);
                if (strPureTag <> '') then
                  ACanvas.Font.Size := StrToIntDef(strPureTag, ACanvas.Font.Size)
              end
              else
              begin
                strTagName := 'face';
                if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
                begin
                  Delete(strPureTag, 1, Length(strTagName));
                  RemoveQuotes(strPureTag);
                  if (strPureTag <> '') then
                    ACanvas.Font.Name := strPureTag
                end
                else
                begin
                  strTagName := 'color';
                  if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
                  begin
                    Delete(strPureTag, 1, Length(strTagName));
                    RemoveQuotes(strPureTag);
                    if (strPureTag <> '') then
                    begin
                      if (Copy(strPureTag, 1, 2) = 'cl') then
                        ACanvas.Font.Color := StringToColor(strPureTag)
                      else
                      if (strPureTag[1] = '#') then
                        ACanvas.Font.Color := Hex2Color(strPureTag)
                    end
                  end
                  else
                  begin
                    strTagName := 'bgcolor';
                    if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
                    begin
                      Delete(strPureTag, 1, Length(strTagName));
                      RemoveQuotes(strPureTag);
                      if (strPureTag <> '') then
                      begin
                        if (Copy(strPureTag, 1, 2) = 'cl') then
                          ACanvas.Brush.Color := StringToColor(strPureTag)
                        else
                        if (strPureTag[1] = '#') then
                          ACanvas.Brush.Color := Hex2Color(strPureTag)
                      end
                    end
                    else
                    begin
                      strTagName := 'strong';
                      if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
                      begin
                        Delete(strPureTag, 1, Length(strTagName));
                        if IsTagEnd then
                          ACanvas.Font.Style := ACanvas.Font.Style - [fsBold]
                        else
                          ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]
                      end
                      else
                      begin
                        if (strPureTag[1] = 'b') then
                        begin
                          Delete(strPureTag, 1, 1);
                          if IsTagEnd then
                            ACanvas.Font.Style := ACanvas.Font.Style - [fsBold]
                          else
                            ACanvas.Font.Style := ACanvas.Font.Style + [fsBold]
                        end
                        else
                        begin
                          if (strPureTag[1] = 'i') then
                          begin
                            Delete(strPureTag, 1, 1);
                            if IsTagEnd then
                              ACanvas.Font.Style := ACanvas.Font.Style - [fsItalic]
                            else
                              ACanvas.Font.Style := ACanvas.Font.Style + [fsItalic]
                          end
                          else
                          begin
                            strTagName := 'strikeout';
                            if (Copy(strPureTag, 1, Length(strTagName)) = strTagName) then
                            begin
                              Delete(strPureTag, 1, Length(strTagName));
                              if IsTagEnd then
                                ACanvas.Font.Style := ACanvas.Font.Style - [fsStrikeOut]
                              else
                                ACanvas.Font.Style := ACanvas.Font.Style + [fsStrikeOut]
                            end
                            else
                            begin
                              if (strPureTag[1] = 'u') then
                              begin
                                Delete(strPureTag, 1, 1);
                                if IsTagEnd then
                                  ACanvas.Font.Style := ACanvas.Font.Style - [fsUnderline]
                                else
                                  ACanvas.Font.Style := ACanvas.Font.Style + [fsUnderline]
                              end
                              else
                              begin

                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end;
        end
      end
    until (intSpacePos = 0);
    Delete(HTML, 1, intTagEnd);

  end;

end;

end.
