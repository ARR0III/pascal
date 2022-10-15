program colors;

uses crt;

const
  DelayTimeMs  = 50;
  ColorCount   = 16;
  BGColorCount =  8;

var
  AllColors: array [1..ColorCount] of word =
  (
    Black, Blue, Green, Cyan,
    Red, Magenta, Brown, LightGray,
    DarkGray, LightBlue, LightGreen, LightCyan,
    LightGreen, LightMagenta, Yellow, White 
  );

var
  x, y, col, bgcol: integer;
begin
  randomize;
  clrscr;

  while not KeyPressed do
  begin
    x:= random(ScreenWidth)  + 1;
    y:= random(ScreenHeight) + 1;

    if (x = ScreenWidth) and (y = ScreenHeight) then
      continue;

    col   := random(ColorCount) + 1;
    bgcol := random(BGColorCount) + 1;

    if (col = bgcol) then
      if (col > 0) and (col < ColorCount) then
        col:= (col div 2) + 1;

    GotoXY(x, y);
    TextColor(AllColors[col]);
    TextBackground(AllColors[bgcol]);
    write('*');
    delay(DelayTimeMs);
  end;
  
  write(#27'[0m');
  clrscr
end.
