program l2b;

var
  c: char;
begin
  while not SeekEof do
  begin
    read(c);

    if (c >= 'a') and (c <= 'z') then
      c:= char(ord(c) - 32); {if little convert to big symbol}

    write(c);
  end;
end.
