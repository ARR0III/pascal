program mv; {source code mv.pas}

const
  RE_WRITE   = 2;
  WRITE_ONLY = 1;
  READ_ONLY  = 0;

  BlockSize = 4096;

type
  buffer_byte = array [1..BlockSize] of byte;

var
  src, dest: file;
  data: buffer_byte;
  ReadRes, WriteRes: longint;
begin
  {$I-}

  if ParamCount <> 2 then
  begin
    writeln(ErrOutput, 'Incorrect arguments!');
    writeln(ErrOutput, 'Enter: ', ParamStr(0), ' [input] [output]');
    halt(1)
  end;

  assign(src,  ParamStr(1));
  filemode:= READ_ONLY;
  reset(src, 1);

  if IOResult <> 0 then
  begin
    writeln(ErrOutput, 'Error openned file: ', ParamStr(1));
    halt(1)
  end;

  assign(dest, ParamStr(2));
  filemode:= WRITE_ONLY;
  rewrite(dest, 1);

  if IOResult <> 0 then
  begin
    writeln(ErrOutput, 'Error make file: ', ParamStr(2));
    halt(1)
  end;

  while true do
  begin
    BlockRead(src, data, BlockSize, ReadRes);

    if ReadRes = 0 then
      break;

    BlockWrite(dest, data, ReadRes, WriteRes);

    if WriteRes <> ReadRes then
    begin
       writeln(ErrOutput, 'Error writing for file: ', ParamStr(2));
       break
    end
  end;

  close(src);
  close(dest)
end.
