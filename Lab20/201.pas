PROGRAM PrintSymbol(INPUT, OUTPUT);
CONST
  Row = 5;
  Col = 5;
  Max = Col * Row;
  
TYPE
  Display = SET OF 1..Max;  
  
VAR
  I, J: INTEGER;
  Ch: CHAR;
  Matrix: Display;
  CorrectSymbol: Boolean;
  
PROCEDURE DefineSymbol(VAR Symbol: CHAR; VAR Matrix: Display);
BEGIN
  CASE Symbol OF
    'A': Matrix := [5, 9, 10, 13, 15, 17, 18, 19, 20, 21, 25];
    'B': Matrix := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': Matrix := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': Matrix := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': Matrix := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': Matrix := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': Matrix := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': Matrix := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': Matrix := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': Matrix := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': Matrix := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': Matrix := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': Matrix := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': Matrix := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': Matrix := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': Matrix := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': Matrix := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': Matrix := [1, 2, 6, 8, 11, 12, 16, 18, 21, 24];
    'S': Matrix := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': Matrix := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': Matrix := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': Matrix := [1, 5, 6, 10, 12, 14, 17, 19, 23];
    'W': Matrix := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': Matrix := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': Matrix := [1, 5, 7, 9, 13, 18, 23];
    'Z': Matrix := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25]
    ELSE CorrectSymbol := FALSE;        
  END;
END;

BEGIN
  IF NOT EOLN
  THEN
    READ(Ch);
  CorrectSymbol := TRUE;
  DefineSymbol(Ch, Matrix);
  IF CorrectSymbol
  THEN
    FOR I := 0 TO (Col - 1)  
    DO
      BEGIN
        FOR J := 1 TO ROW
        DO
          BEGIN
            IF (I * Col + J) IN Matrix
            THEN
              WRITE('X')
            ELSE
              WRITE(' ');              
          END;
        WRITELN;      
      END
  ELSE
    WRITE('Incorrect symbol');
  WRITELN;        
END.  

