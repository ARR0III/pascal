program Queue;

type
  datatype = longint;
  itemptr  = ^item;
  where    = (first, last);
  
  item = record
    data: datatype;
    next: itemptr;
  end;
  
  itemflp = record
    first, last: itemptr;
  end;

procedure QueueInit(var ptr: itemflp);
begin
 ptr.first := nil;
 ptr.last  := nil
end;

procedure QueuePut(var ptr: itemflp; data: datatype);
begin
  if ptr.first = nil then
  begin
    new(ptr.first);
    ptr.last:= ptr.first
  end
  else
  begin
    new(ptr.last^.next);
    ptr.last:= ptr.last^.next
  end;
  
  ptr.last^.data:= data;
  ptr.last^.next:= nil
end;

procedure QueueSortPut(var ptr: itemflp; data: datatype);
var
  pp: ^itemptr;
  tmp: itemptr;
begin
  pp:= @(ptr.first);

  while (pp^ <> nil) and (pp^^.data < data) do
    pp:= @(pp^^.next);

  new(tmp);
  tmp^.data:= data;
  tmp^.next:= pp^;
  pp^:= tmp
end;

procedure QueueDelete(var ptr: itemflp; data: datatype);
var
  pp: ^itemptr; { pointer to item pointer }
  tmp: itemptr;
begin
  pp:= @(ptr.first);
  
  while pp^ <> nil do
  begin
    if pp^^.data = data then
    begin
      tmp:= pp^;
      pp^:= pp^^.next;
      dispose(tmp);
    end
    else
      pp:= @(pp^^.next);
  end
end;

procedure QueueGet(var ptr: itemflp; var data: datatype);
var
  tmp: itemptr;
begin
  data:= ptr.first^.data;
  tmp:= ptr.first;
  ptr.first:= ptr.first^.next;
  dispose(tmp);
  
  if ptr.first = nil then
    ptr.last:= nil
end;

procedure QueueInsert(var ptr: itemflp; data: datatype; w: where);
var
  tmp: itemptr;
begin
  new(tmp);
  tmp^.data:= data;
  
  if w = first then { insert in first }
  begin
    tmp^.next:= ptr.first;
    ptr.first:= tmp
  end
  else
  if w = last then  { insert in last }
  begin
    ptr.last^.next:= tmp;
    ptr.last:= tmp;
    tmp^.next:= nil
  end
end;

procedure QueueClear(var ptr: itemflp);
var
  tmp: itemptr;
begin
  while ptr.first <> nil do
  begin
    tmp:= ptr.first^.next;
    dispose(ptr.first);
    ptr.first:= tmp
  end
end;

function QueueEmpty(var ptr: itemflp): boolean;
begin
  QueueEmpty:= ptr.first = nil
end;

var
  s, d: datatype;
  list: itemflp;
begin
  {$I-}
  QueueInit(list);
  
  while not SeekEof do
  begin
    read(d);
    QueuePut(list, d)
  end;
  
  write('Search:');
  read(s);
  
  if IOResult <> 0 then
  begin
    QueueClear(list);
    halt(1)
  end;
  
  QueueSortPut(list, (s div 2) + 1);
  QueueInsert(list, s * s, first);
  QueueInsert(list, s * s, last);
  
  while not QueueEmpty(list) do
  begin
    QueueDelete(list, s); { search number for delete }
    QueueGet(list, d);    { get number for writing }
    writeln(d)
  end
end.

