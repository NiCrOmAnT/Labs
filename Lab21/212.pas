PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  StrLen: 1..Len;
  I: 0..Len;
  ChiperFile: TEXT;
  Error: Boolean;
 
PROCEDURE Initialize(VAR Code: Chiper);
VAR
  CodeSymbol, CurrentSymbol, Ch: CHAR;
  UsedSymbols: SET OF CHAR;
  CodedSymbols: SET OF CHAR;
{Присвоить Code шифр замены}
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
          Code[CurrentSymbol] := CodeSymbol;
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
 
PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO StrLen
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(' ')
      ELSE
        WRITE(S[Index]);       
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(ChiperFile, 'Chiper.txt');
  Initialize(Code);
  IF NOT Error
  THEN
    WHILE NOT EOF
    DO
      BEGIN
        {читать строку в Msg и распечатать ее}
        I := 0;
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
        {распечатать кодированное сообщение}
        Encode(Msg)
      END
  ELSE
    WRITELN('Ошибка в файле кодировки');      
END.  {Encryption}

