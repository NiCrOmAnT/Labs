PROGRAM ReadNumber(INPUT, OUTPUT);
VAR
  N: INTEGER;
  IsDigit: BOOLEAN;  
  
PROCEDURE ReadDigit(VAR F: TEXT; VAR Digit: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  IF NOT EOLN(F)
  THEN
    READ(F, Ch);
  Digit := -1;
  IF (Ch >= '0') AND (Ch <= '9')
  THEN
  BEGIN
    IF (Ch = '0')
    THEN
      Digit := 0;
    IF (Ch = '1')
    THEN
      Digit := 1;
    IF (Ch = '2')
    THEN
      Digit := 2;
    IF (Ch = '3')
    THEN
      Digit := 3;
    IF (Ch = '4')
    THEN
      Digit := 4;
    IF (Ch = '5')
    THEN
      Digit := 5;
    IF (Ch = '6')
    THEN
      Digit := 6;
    IF (Ch = '7')
    THEN
      Digit := 7;
    IF (Ch = '8')
    THEN
      Digit := 8;
    IF (Ch = '9')
    THEN
      Digit := 9;
  END;
END; {ReadDigit}
  
PROCEDURE ReadNumber(VAR F: TEXT; VAR Num: INTEGER);
VAR
  I, Digit: INTEGER;
BEGIN{ReadNumber}
  Num := 0;
  I := 0;
  Digit := -1;
  WHILE Digit = -1
  DO
    ReadDigit(F, Digit);
  Num := Digit; 
  WHILE (Digit < 32767) AND (NOT EOLN) AND (Digit <> -1)
  DO
    BEGIN
      ReadDigit(F, Digit);
      IF (Digit <> -1) AND (I <= 4)
      THEN
        IF Num < 3276
        THEN
          BEGIN
            Num := Num * 10 + Digit;
            I := I + 1;
          END  
        ELSE
          BEGIN
            IF (Num = 3276) AND (Digit <= 7)
            THEN
              Num := Num * 10 + Digit
            ELSE
              Num := -1;  
          END;
    END;
END; {ReadNumber}

BEGIN
  ReadNumber(INPUT, N);
  WRITELN(N);      
END.
