PROGRAM Decryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
  � �������� ����� ������� � OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  Spaces, StrLen: 1..Len;
  I: 0..Len;
  ChiperFile: TEXT;
  Error, InvalidMsg: Boolean;
  UsedSymbols : SET OF CHAR;
  CodedSymbols : SET OF CHAR;
 
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  CodeSymbol, CurrentSymbol, Ch: CHAR;
{��������� Code ���� ������}
BEGIN {Initialize}
  RESET(ChiperFile);
  WHILE NOT EOF(ChiperFile) AND NOT Error
  DO
    BEGIN
      IF NOT EOLN(ChiperFile)
      THEN
        READ(ChiperFile, CurrentSymbol)
      ELSE
        Error := TRUE;
      IF (NOT EOLN(ChiperFile)) AND (CurrentSymbol IN ['A' .. 'Z'])
      THEN
        READ(ChiperFile, Ch)
      ELSE
        Error := TRUE;  
      IF (NOT EOLN(ChiperFile)) AND (Ch = '-') AND (NOT Error)
      THEN
        BEGIN
          READ(ChiperFile, CodeSymbol);
          Code[CodeSymbol] := CurrentSymbol;
          UsedSymbols := UsedSymbols + [CodeSymbol];
          CodedSymbols := CodedSymbols + [CurrentSymbol];
        END  
      ELSE
        Error := TRUE;      
      IF NOT Error
      THEN
        READLN(ChiperFile);      
    END;   
END;  {Initialize}
 
PROCEDURE Decode(VAR S: Str);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
  Ch: 'A' .. 'Z';
BEGIN {Decode}
  FOR Index := 1 TO StrLen
  DO
    IF S[Index] IN UsedSymbols
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(' ')
      ELSE
        WRITE(S[Index]);
  WRITELN
END;  {Decode}
 
BEGIN {Decryption}
  {���������������� Code}
  Error := FALSE;
  InvalidMsg := FALSE;
  ASSIGN(ChiperFile, 'Chiper.txt');
  Initialize(Code);
  IF NOT Error
  THEN
    WHILE NOT EOF
    DO
      BEGIN
        {������ ������ � Msg � ����������� ��}
        I := 0;
        Spaces := 1;
        WHILE NOT EOLN AND (I < Len)
        DO
          BEGIN
            I := I + 1;
            READ(Msg[I]);
            WRITE(Msg[I])
          END;
        StrLen := I;  
        READLN;
        WRITELN;
        {����������� ������������ ���������}
        Decode(Msg) 
      END
  ELSE
    WRITELN('������ � ����� ���������');
          
END.  {Decryption}

