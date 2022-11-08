program deque_source;

type
  datatype = longint;

  dequeptr = ^deque;

  deque = record
    data: datatype;
    prev, next: dequeptr;
  end;

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

function DequeInsert(var ptr: fls; data: datatype): boolean; {???}
var
  insert: boolean;
  tmp, new_el: dequeptr;
begin
  insert:= false;
  tmp:= ptr.first;

  while tmp <> nil do
  begin
    if tmp^.data = data then
    begin
      new(new_el);

      new_el^.data:= data;
      new_el^.next:= tmp^.next; {next data or nil pointer}
      new_el^.prev:= tmp;

      if tmp^.next <> nil then
        tmp^.next^.prev:= new_el
      else
        ptr.last:= new_el;

      tmp^.next:= new_el;
      tmp:= new_el^.next;

      if insert = false then
        insert:= true;
    end
    else
      tmp:= tmp^.next
  end;

  DequeInsert:= insert
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
  d, search: datatype;
  list: fls;
begin
  while not SeekEof do
  begin
    read(d);
    DequePushFront(list, d)
  end;

  write('Enter number for inserting:');
  read(search);

  if DequeInsert(list, search) = true then
    writeln('Number ', search, ' inserted in deque!');

  while not DequeEmpty(list) do
  begin
    DequePopFront(list, d);
    writeln(d)
  end;
end.


