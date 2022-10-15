program random_data;

uses crt;

const
  digest = '0123456789ABCDEF';

procedure PrintHex(data: byte);
begin
  write(digest[data shr 4 + 1], digest[data and $0F + 1]);
end;

var
  i, r: integer;
begin
  randomize;
  clrscr;

  for i:= 1 to 256 do
  begin
    r:= random(256);
    PrintHex(byte(r));

    if (i mod 16) = 0 then
      writeln
    else
      write(':');
  end;

  clrscr
end.
