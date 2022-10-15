program strings;

var
  c: char;
begin
  
  while not eof do
  begin
    read(c);
    
    if (c >= '0') and (c <= '9') then
      write(c);
  end;
end.

