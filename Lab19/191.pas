PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
VAR
  I, Counter, PrimeNumber: INTEGER;
  IsPrime: BOOLEAN;
  NumberPool : SET  OF 0..Max;
BEGIN {Prime}
  NumberPool := [2..Max];
  Counter := 0;
  WRITELN('Простые числа в диапазоне от 2 до ', Max, ': ');
  WHILE (NumberPool <> [])
  DO
    BEGIN
      I := 2 + Counter;
      IsPrime := TRUE;
      WHILE I <= Max
      DO
        BEGIN
          IF I IN NumberPool
          THEN
            BEGIN
              IF IsPrime
              THEN
                BEGIN
                  WRITE(I, ', ');
                  PrimeNumber := I;
                  NumberPool := NumberPool - [I];
                  IsPrime := FALSE
                END
              ELSE
                BEGIN
                  IF (I MOD PrimeNumber = 0)
                  THEN
                    NumberPool := NumberPool - [I];
                END;   
            END;
          I := I + 1;
        END;
      Counter := Counter + 1;  
    END;
END. {Prime}
