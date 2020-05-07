PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
VAR
  I, CurNum, PrimeNumber: INTEGER;
  IsPrime: BOOLEAN;
  NumberPool : SET  OF 0..Max;
BEGIN {Prime}
  NumberPool := [Min..Max];
  I := Min;
  WRITELN('Простые числа в диапазоне от 2 до ', Max, ': ');
  WHILE I <= Max
  DO
    BEGIN
      CurNum := I;
      IF CurNum IN NumberPool
      THEN
        BEGIN
          WRITE(I, ', ');
          WHILE CurNum <= Max
          DO
          BEGIN
            NumberPool := NumberPool - [CurNum];
            CurNum := CurNum + I;
          END;
        END;
      I := I + 1;
    END;
  WRITELN;  
END. {Prime}
