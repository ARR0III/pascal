program test;

type
  CharCounters = array [0..255] of integer;

procedure PrintHex(bt: byte);
var
  digest: array [0..15] of char = ('0','1','2','3','4','5','6','7',
                                   '8','9','A','B','C','D','E','F');
begin
  write(digest[bt shr 4], digest[bt and $0F]);
end;

var
  data: CharCounters;
  c: char;
  i, b: integer;
begin
  for i:= 0 to 255 do
    data[i]:= 0;

  while not eof do
  begin
    read(c);
    b:= ord(c);
    data[b]:= data[b] + 1;
  end;
  
  writeln('|  int | hex|  count |');

  for i:= 0 to 255 do
  begin
    if (data[i] > 0) then
    begin
      write('| ', i:4, ' | ');
      PrintHex(i);
      writeln(' | ',  data[i]:6, ' |');
    end;
  end;
end.
