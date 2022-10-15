program list;

type
  itemptr = ^item;

  item = record
    data: integer;
    next: itemptr;
  end;

var
  s: integer;
  temp, first: itemptr;
begin
  first:= nil;

  while not SeekEof do
  begin
    new(temp);
    read(temp^.data);
    temp^.next:= first;
    first:= temp
  end;

  write('Search:');
  read(s);

  while first <> nil do
  begin
    temp:= first^.next;

    if first^.data = s then
      dispose(first)
    else
      writeln(first^.data);

    first:= temp
  end;
end.

