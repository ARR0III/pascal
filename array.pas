program array1;

const
  MaxString  = 24;
  MaxElement = 80;

type
  element = array [1..MaxElement] of byte;
  table   = array [1..MaxString]  of element;

var
  db: table;
  i, j: integer;

begin
  for i:= 1 to MaxString do
    for j:= 1 to MaxElement do
      db[i, j]:= 65;

  for i:= 1 to MaxString do
  begin
    for j:= 1 to MaxElement do
      write(db[i, j] + 1);

    writeln;  
  end;

  
end.