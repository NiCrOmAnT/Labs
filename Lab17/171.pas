PROGRAM SumStr(INPUT, OUTPUT);
VAR
  Digit, Sum: INTEGER;
PROCEDURE ReadDigit(VAR F: TEXT; VAR Num: INTEGER);
VAR
  Ch: CHAR;
BEGIN{ReadDigit}
  IF NOT EOLN(F)
  THEN
    READ(F, Ch);
  Num := -1;
  IF (Ch >= '0') AND (Ch <= '9')
  THEN
  BEGIN
    IF (Ch = '0') THEN Digit := 0;
    IF (Ch = '1') THEN Digit := 1;
    IF (Ch = '2') THEN Digit := 2;
    IF (Ch = '3') THEN Digit := 3;
    IF (Ch = '4') THEN Digit := 4;
    IF (Ch = '5') THEN Digit := 5;
    IF (Ch = '6') THEN Digit := 6;
    IF (Ch = '7') THEN Digit := 7;
    IF (Ch = '8') THEN Digit := 8;
    IF (Ch = '9') THEN Digit := 9;
  END;
END;{ReadDigit}
BEGIN
  Sum := 0;
  WHILE NOT EOLN
  DO
    BEGIN  
      ReadDigit(INPUT, Digit);
      IF Digit <> -1
      THEN
        Sum := Sum + Digit
    END;
  WRITELN(Sum)
END.
