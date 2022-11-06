PROGRAM ADDXY;

PROCEDURE READLONGINT(VAR OK: BOOLEAN; VAR N: LONGINT);
VAR
  C        : CHAR;
  RESULT   : LONGINT;
  POSITION : INTEGER;
  I        : INTEGER;
BEGIN
  RESULT   := 0;
  POSITION := 0;
  OK       := FALSE;

  REPEAT
    READ(C);
    POSITION:= POSITION + 1;
  UNTIL (C <> ' ') AND (C <> #10);

  WHILE (C <> ' ') AND (C <> #10) DO
  BEGIN
    IF (C < '0') OR (C > '9') THEN
    BEGIN
      WRITE('NOT NUMBER');

      FOR I:= 1 TO 5 DO
        WRITE(' ');
      FOR I:= 1 TO (POSITION-1) DO
        WRITE('-');

      WRITELN('^');
      READLN;
      EXIT;
    END;

    RESULT:= (RESULT * 10) + ORD(C) - ORD('0');
    
    READ(C);
    POSITION:= POSITION + 1;
  END;

  N:= RESULT;
  OK:= TRUE;
END;

VAR
  OK   : BOOLEAN;
  X, Y : LONGINT;
BEGIN
  REPEAT
    WRITE('ENTER NUMBER X:');
    READLONGINT(OK, X);
  UNTIL OK;

  REPEAT
    WRITE('ENTER NUMBER Y:');
    READLONGINT(OK, Y);
  UNTIL OK;

  WRITELN('X * Y = ', X * Y);
END.