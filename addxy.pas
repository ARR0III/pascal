program addxy;

type
  S32 = longint;
  S16 = integer;

procedure ReadLongint(var ok: boolean; var n: S32);
var
  c        : char;
  result   : S32;
  position : S16;
  i        : S16;
begin
  result   := 0;
  position := 0;
  ok       := false;

  repeat
    read(c);
    position:= position + 1;
  until (c <> ' ') and (c <> #10);

  while (c <> ' ') and (c <> #10) do
  begin
    if (c < '0') or (c > '9') then
    begin
      write('not number');

      for i:= 1 to 5 do
        write(' ');
      for i:= 1 to (position-1) do
        write('-');

      writeln('^');
      readln;
      exit;
    end;

    result:= (result * 10) + ord(c) - ord('0');
    
    read(c);
    position:= position + 1;
  end;

  n:= result;
  ok:= true;
end;

var
  ok   : boolean;
  x, y : S32;
begin
  repeat
    write('Enter number x:');
    ReadLongint(ok, x);
  until ok;

  repeat
    write('Enter number y:');
    ReadLongint(ok, y);
  until ok;

  writeln('x * y = ', x * y);
end.


