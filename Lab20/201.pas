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
  
FUNCTION DefineSymbol(VAR Symbol: CHAR): Display;
BEGIN
  CASE Symbol OF
    'A': DefineSymbol := [5, 9, 10, 13, 15, 17, 18, 19, 20, 21, 25];
    'B': DefineSymbol := [1, 2, 3, 4, 6, 10, 11, 12, 13, 14, 16, 20, 21, 22, 23, 24];
    'C': DefineSymbol := [2, 3, 4, 5, 6, 11, 16, 22, 23, 24, 25];
    'D': DefineSymbol := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24];
    'E': DefineSymbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 21, 22, 23, 24, 25];
    'F': DefineSymbol := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21];
    'G': DefineSymbol := [2, 3, 4, 6, 11, 13, 14, 15, 16, 20, 22, 23, 24];
    'H': DefineSymbol := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];
    'I': DefineSymbol := [2, 3, 4, 8, 13, 18, 22, 23, 24];
    'J': DefineSymbol := [1, 2, 3, 4, 5, 8, 13, 16, 18, 22];
    'K': DefineSymbol := [1, 4, 6, 8, 11, 12, 16, 18, 21, 24];
    'L': DefineSymbol := [1, 6, 11, 16, 21, 22, 23, 24, 25];
    'M': DefineSymbol := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
    'N': DefineSymbol := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];
    'O': DefineSymbol := [2, 3, 4, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'P': DefineSymbol := [1, 2, 3, 6, 9, 11, 12, 13, 16, 21];
    'Q': DefineSymbol := [2, 3, 4, 6, 10, 11, 15, 16, 19, 22, 23, 25];
    'R': DefineSymbol := [1, 2, 6, 8, 11, 12, 16, 18, 21, 24];
    'S': DefineSymbol := [2, 3, 4, 5, 6, 12, 13, 14, 20, 21, 22, 23, 24];
    'T': DefineSymbol := [1, 2, 3, 4, 5, 8, 13, 18, 23];
    'U': DefineSymbol := [1, 5, 6, 10, 11, 15, 16, 20, 22, 23, 24];
    'V': DefineSymbol := [1, 5, 6, 10, 12, 14, 17, 19, 23];
    'W': DefineSymbol := [1, 5, 6, 10, 11, 13, 15, 16, 18, 20, 22, 24];
    'X': DefineSymbol := [1, 5, 7, 9, 13, 17, 19, 21, 25];
    'Y': DefineSymbol := [1, 5, 7, 9, 13, 18, 23];
    'Z': DefineSymbol := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25]        
  END;
END;

BEGIN
  IF NOT EOLN
  THEN
  BEGIN
    READ(Ch);
    Matrix := DefineSymbol(Ch);
    IF Ch IN ['A' .. 'Z']
    THEN
      BEGIN
        Matrix := DefineSymbol(Ch);
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
      END  
    ELSE
      WRITE('Incorrect symbol');
  END;    
  WRITELN;        
END.  

