program tetris;
uses crt;

const
  PauseDelay = 5000;
  HelloMsg   = 'Hello, world!';
  PS         = 'You not must trust me...';

procedure GetKey(var code: integer);
var
  c: char;
begin
  c:= ReadKey;

  if c = #0 then
  begin
    c:= ReadKey;
    code:= -ord(c);
  endt
  else
  begin
    code:= ord(c);
  end;
end;

var
  SP, data, x, y: integer;
begin
  SP:= ord(' ');
  clrscr;

  repeat
    GotoXY(ScreenWidth div 2, ScreenHeight div 2);
    GetKey(data);
    writeln(data);
  until data = SP;

  clrscr;
end.