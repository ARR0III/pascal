program list2;

type
  itemptr = ^item;

  item = record
    data: integer;
    next: itemptr;
  end;

var
  i: integer;
  first, last, temp: itemptr;
begin
  first := nil;
  last  := nil;

  while not SeekEof do
  begin
    if first = nil then
    begin
      new(first);
      last:= first
    end
    else
    begin
      new(last^.next);
      last:= last^.next
    end;

    read(last^.data);
    last^.next:= nil
  end;

  temp:= first;

  for i:= 1 to 2 do
  begin

    while first <> nil do
    begin
      writeln(first^.data);
      first:= first^.next
    end;

    first:= temp;
  end
end.

