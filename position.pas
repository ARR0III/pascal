program position;

const
  REWRITE   = 2;
  WRITEONLY = 1;
  READONLY  = 0;

  filename  = 'point.dat';

type
  NamedPoint = record
    x, y: real;
    name: string[15];
  end;

var
  f1: file of NamedPoint;
  point: NamedPoint;
begin
  {$I-}

  assign(f1, filename);
  filemode:= REWRITE;
  reset(f1);

  if IOResult <> 0 then
  begin
    writeln('Error create file: ', filename);
    halt(1);
  end;
  
  point.x:= 5.0092;
  point.y:= 0.325;
  point.name:= 'leeder_9;';

  write(f1, point);
    
  if IOResult <> 0 then
    writeln('Error write of file: ', filename);

  close(f1);
end.
