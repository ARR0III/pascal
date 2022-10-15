program arifmetic;

const
  Max = 32;

type
  data = array[1..Max] of char;

procedure WriteArray(var temp: data);
var
  i: integer;
begin
  i:= 1;
  
  while temp[i] <> #0 do
  begin
    write(temp[i]);
    i:= i + 1;
  end;
end;

var
  d: data;
begin
  d:= 'Hello, moto!';

  WriteArray(d);
end.
