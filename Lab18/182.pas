PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Ch: CHAR;
  F: TEXT;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      Ch := '1';
      REWRITE(F);
      WHILE Ch <> ' '
      DO
        BEGIN
          READ(INPUT, Ch);
          WRITE(F, Ch);
        END;
      WRITELN(F);  
      WHILE WhichScore <= 4
      DO
        BEGIN
          READ(NextScore);
          IF NextScore > 100
          THEN
            BEGIN
              WRITE('Incorrect score, enter again ');
              READ(NextScore);
            END;
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1;
        END;
      READLN;
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(F);
      WHILE NOT EOLN(F)
      DO
        BEGIN
          READ(F, Ch);
          WRITE(OUTPUT, Ch);
        END;
      IF Ave MOD 10 >= 5
      THEN
        WRITELN('average score: ', Ave DIV 10 + 1)
      ELSE
        WRITELN('average score: ', Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}

