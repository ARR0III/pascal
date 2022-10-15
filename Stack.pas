program StackPushPop;

type
  datatype = longint; { change type data? }
  stackptr = ^stack;
  
  stack = record
    data: datatype;
    next: stackptr;
  end;

procedure StackInit(var ptr: stackptr);
begin
  ptr:= nil;
end;

function StackEmpty(var ptr: stackptr): boolean;
begin
    StackEmpty:= (ptr = nil);
end;

procedure StackPop(var ptr: stackptr; var data: datatype);
var
  temp: stackptr;
begin
  data:= ptr^.data;
  temp:= ptr^.next;

  dispose(ptr);

  ptr:= temp;
end;

procedure StackPush(var ptr: stackptr; data: datatype);
var
  temp: stackptr;
begin
  new(temp);
  temp^.data:= data;
  temp^.next:= ptr;
  ptr:= temp;
end;

procedure StackDelete(var ptr: stackptr);
var
  pp : ^stackptr;
  tmp: stackptr;
begin
  pp:= @ptr; { pointer first }

  while pp^ <> nil do
  begin
    if pp^^.data < 0 then { first^.data }
    begin
      tmp := pp^;
      pp^ := pp^^.next;
      dispose(tmp);
    end
    else
      pp:= @(pp^^.next); { pointer first^.next }
  end;
end;

var
  tmp: datatype;
  first: stackptr;
begin
  StackInit(first);

  while not SeekEof do
  begin
    read(tmp);
    StackPush(first, tmp);
  end;

  StackDelete(first);

  while not StackEmpty(first) do
  begin
    StackPop(first, tmp);
    Writeln(tmp);
  end;
end.

