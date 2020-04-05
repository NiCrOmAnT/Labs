PROGRAM abc(INPUT, OUTPUT);
VAR
  A, B, C, D, I: INTEGER;
  
PROCEDURE Division(VAR Dvd, Dvr, ResultD, ResultM, I: INTEGER);   
BEGIN{Division}
  IF (Dvd DIV 10) > 10
  THEN
    BEGIN
      Division(Dvd, Dvr, ResultD, ResultM, I);
    END
  ELSE
    BEGIN
      IF I = 2 
      THEN
        ResultD := ResultD * 10 + Dvd DIV Dvr
      ELSE
        ResultM := ResultM * 10 + Dvd DIV Dvr;
      Dvd := Dvd MOD Dvr;
      IF (Dvd > 0) AND (I > 0) AND (Dvd < Dvr)
      THEN
        BEGIN
          Dvd := Dvd * 10;
          I := I - 1;
          Division(Dvd, Dvr, ResultD, ResultM, I);             
        END;    
    END;    
END; {Division}

BEGIN
  READ(A,B);
  I := 2;
  C := 0;
  Division(A, B, C, D, I);
  WRITELN(C,' ', D);
END.
