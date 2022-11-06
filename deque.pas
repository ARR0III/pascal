program deque_source;

type
  datatype =  longint;
  dequeptr = ^deque;

  deque = record
    data: datatype;
    prev, next: dequeptr;
  end;

  where = (first, last);

  fls = record
    first, last: dequeptr;
  end;

procedure DequeInit(var ptr: fls);
begin
  ptr.first:= nil;
  ptr.last := nil
end;

function DequeEmpty(ptr: fls): boolean; {correct}
begin
  DequeEmpty:= ptr.first = nil
end;

procedure DequePushBack(var ptr: fls; data: datatype); {correct}
var
  tmp: dequeptr;
begin
  new(tmp);

  tmp^.data:= data;
  tmp^.next := nil;

  if ptr.first = nil then
  begin
    tmp^.prev := nil;
    ptr.first := tmp
  end
  else
  begin
    tmp^.prev := ptr.last;
    ptr.last^.next:= tmp
  end;

  ptr.last:= tmp
end;

procedure DequePushFront(var ptr: fls; data: datatype); {correct}
var
  tmp: dequeptr;
begin
  new(tmp);

  tmp^.data:= data;
  tmp^.prev := nil;

  if ptr.first = nil then
  begin
    tmp^.next := nil;
    ptr.last  := tmp
  end
  else
  begin
    tmp^.next := ptr.first;
    ptr.first^.prev:= tmp
  end;

  ptr.first:= tmp
end;

procedure DequePopBack(var ptr: fls; var data: datatype); {correct}
var
  tmp: dequeptr;
begin
  data:= ptr.last^.data;

  tmp:= ptr.last^.prev;

  if tmp <> nil then
    tmp^.next:= nil
  else
    ptr.first:= tmp;

  dispose(ptr.last);
  ptr.last:= tmp
end;

procedure DequePopFront(var ptr: fls; var data: datatype); {correct}
var
  tmp: dequeptr;
begin
  data:= ptr.first^.data;

  tmp:= ptr.first^.next;

  if tmp <> nil then
    tmp^.prev:= nil
  else
    ptr.last:= tmp;

  dispose(ptr.first);
  ptr.first:= tmp
end;

var
  d: datatype;
  list: fls;
begin
  while not SeekEof do
  begin
    read(d);
    DequePushFront(list, d)
  end;

  while not DequeEmpty(list) do
  begin
    DequePopFront(list, d);
    writeln(d)
  end;  
end.


