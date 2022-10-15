program hello;

uses crt;

const
  TOP     = -72;
  RIGHT   = -77;
  BOTTOM  = -80;
  LEFT    = -75;

  Message = 'Hello, world!';

procedure GetKey(var code: integer);
var
  c: char;
begin
  c:= ReadKey;  

  if c = #0 then
  begin
    c:= ReadKey;
    code:= -ord(c)
  end
  else
  begin
    code:= ord(c)
  end;
end;


procedure ShowMessage(x, y: integer; msg: string);
begin
  GotoXY(x, y);
  write(msg);
  GotoXY(1, 1);
end;

procedure HideMessage(x, y: integer; msg: string);
var
  len, i: integer;
begin
  len:= length(msg);
  GotoXY(x, y);

  for i:= 1 to len do
    write(' '); {write space symbol}

  GotoXY(1, 1);
end;

procedure MoveMessage(var x, y: integer; msg: string; dx, dy: integer);
begin
  HideMessage(x, y, msg);

  x:= x + dx;
  y:= y + dy;

  if (x <= 0) or (x > ScreenWidth) then
    x:= x - dx;

  if (y <= 0) or (y > ScreenHeight) then
    y:= y - dy;

  ShowMessage(x, y, msg);
end;

var
  CurX, CurY, c: integer;
begin
  clrscr;
  
  CurX:= (ScreenWidth - length(Message)) div 2;
  CurY:=  ScreenHeight div 2;

  ShowMessage(CurX, CurY, Message);

  while true do
  begin
    GetKey(c);

    if c > 0 then
      break;

    case c of
      TOP:    MoveMessage(CurX, CurY, Message,  0, -1);
      RIGHT:  MoveMessage(CurX, CurY, Message,  1,  0);
      BOTTOM: MoveMessage(CurX, CurY, Message,  0,  1);
      LEFT:   MoveMessage(CurX, CurY, Message, -1,  0);
    end;

  end;

  clrscr;
end.
