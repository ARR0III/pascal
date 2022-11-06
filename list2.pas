program pointers;

type
  itemptr = ^item;

  item = record
    data: integer;
    next: itemptr;
  end;

var
  temp, first, last: itemptr;
begin
  first := nil;
  last  := nil;

  while not eof do
  begin
    new(temp);

  end;
end.



