program conio;

{$APPTYPE CONSOLE}

uses SysUtils;

var
  Cmd: string;

begin
  repeat
    ReadLn(Cmd);
    if UpperCase(Cmd) = 'QUIT' then Exit;
    WriteLn('Received: ' + Cmd);
    Flush(Output);
  until False;
end.