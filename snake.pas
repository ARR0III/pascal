program snake;

uses crt;

const
  WelcomeMessage = 'Press Left or Right for start, Esc for exit;';

  DelayDuration = 100;

  {NORMAL SYMBOLS}
  ESCAPE        =  27;
  SPACE         =  32;

  {SPECIAL SYMBOLS}
  TOP           = -72;
  RIGHT         = -77;
  BOTTOM        = -80;
  LEFT          = -75;

type
  star = record
    CurX, CurY, dx, dy: integer;
    welcome: boolean;
  end;



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

procedure ShowStar(var s: star);
begin
  GotoXY(s.CurX, s.CurY);
  write('*');
  GotoXY(1, 1);
end;

procedure HideStar(var s: star);
begin
  GotoXY(s.CurX, s.CurY);
  write(' ');
  GotoXY(1, 1);
end;

procedure MoveStar(var s: star);
begin
  {HideStar(s);}

  s.CurX:= s.CurX + s.dx;

  if s.CurX > ScreenWidth then
    s.CurX:= 1
  else
  if s.CurX < 1 then
    s.CurX:= ScreenWidth;

  s.CurY:= s.CurY + s.dy;

  if s.CurY > ScreenHeight then
    s.CurY:= 1
  else
  if s.CurY < 1 then
    s.CurY:= ScreenHeight;

  ShowStar(s)
end;

procedure SetDirection(var s: star; dx, dy: integer);
begin
  s.dx:= dx;
  s.dy:= dy
end;

procedure WriteWelcomeMessage;
begin
  GotoXY(1, ScreenHeight);
  write(WelcomeMessage);
  GotoXY(1, 1);
end;

procedure ClearWelcomeMessage;
var
  i, len: integer;
begin
  len:= length(WelcomeMessage);

  GotoXY(1, ScreenHeight);

  for i:= 1 to len do
    write(' ');

  GotoXY(1, 1);
end;

var
  s: star;
  c: integer;
begin
  clrscr;

  s.CurX:= ScreenWidth div 2;
  s.CurY:= ScreenHeight div 2;
  
  s.dx:= 0;
  s.dy:= 0;

  s.welcome:= true;

  WriteWelcomeMessage;

  ShowStar(s);

  while true do
  begin

    if not KeyPressed then
    begin
      MoveStar(s);
      delay(DelayDuration);
      continue;
    end;

    if s.welcome then
    begin
      ClearWelcomeMessage;
      s.welcome:= false;
    end;

    GetKey(c);

    case c of
      LEFT:   SetDirection(s, -1,  0);
      RIGHT:  SetDirection(s,  1,  0);
      TOP:    SetDirection(s,  0, -1);
      BOTTOM: SetDirection(s,  0,  1);
      SPACE:  SetDirection(s,  0,  0);
      ESCAPE: break
    end;
  end;

  clrscr
end.









