UNIT WordWorking;
INTERFACE
CONST
  Letters: SET OF CHAR = ['A'..'Z', 'a'..'z', '�'..'�', '�', '�', '�'..'�'];
  UpperRusLetters: SET OF CHAR = ['�'..'�', 'A'..'Z'];
  WordLength = 60;
  LetterDist = 32;

PROCEDURE GetWord(VAR FIn: TEXT; VAR Wd: STRING); //��������� ������ ����� �� �������� �����

IMPLEMENTATION
  PROCEDURE LowCase(VAR Symbol: CHAR);
  BEGIN {LowCase}
    IF Symbol IN UpperRusLetters
    THEN
      Symbol := CHR(ORD(Symbol) + LetterDist);
    IF Symbol IN ['�', '�']
    THEN
      Symbol := '�';      
  END;  {LowCase}
  
  PROCEDURE GetWord(VAR FIn: TEXT; VAR Wd: STRING);
  VAR
    Ch: CHAR;  
  BEGIN {GetWord}
    Wd := '';
    READ(FIn, Ch);
    IF Ch IN Letters
    THEN
      BEGIN
        WHILE (Ch IN Letters) AND (NOT EOF(FIn))
        DO
          BEGIN
            LowCase(Ch);
            Wd := Wd + Ch;
            READ(FIn, Ch);
          END;
        IF (EOF(FIn)) AND (Ch IN Letters)
        THEN
        BEGIN
          LowCase(Ch);
          Wd := Wd + Ch;
        END;           
      END;      
  END;  {GetWord}
        
BEGIN                                                
END.
