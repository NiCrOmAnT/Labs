PROGRAM abc(INPUT, OUTPUT);
VAR
  A, B, C, I: INTEGER;
  
PROCEDURE Division(VAR Dvd, Dvr, Result, I: INTEGER);   
BEGIN{Division}
  IF (Dvd DIV 10) > 10
  THEN
    BEGIN
      Division(Dvd, Dvr, Result, I);
    END
  ELSE
    BEGIN
      Result := Result * 10 + Dvd DIV Dvr;
      Dvd := Dvd MOD Dvr;
      IF (Dvd > 0) AND (I > 0) AND (Dvd < Dvr)
      THEN
        BEGIN
          Dvd := Dvd * 10;
          I := I - 1;
          Division(Dvd, Dvr, Result, I);             
        END;    
    END;    
END; {Division}

BEGIN
  READ(A,B);
  I := 2;
  C := 0;
  Division(A, B, C, I);
  WRITELN(C);
END.
