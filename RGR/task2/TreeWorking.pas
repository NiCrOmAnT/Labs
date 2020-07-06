UNIT TreeWorking;
INTERFACE
USES WordWorking;
CONST
  WordLength = 60;
  
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Wd: STRING;
               Amount: INTEGER;
               LLink, RLink: Tree;
             END;
    
  PROCEDURE InsertWord(VAR Data: STRING; VAR Ptr: Tree; VAR Nodes: INTEGER);           //Добавление нового слова в узел дерева
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);              //Вывод отсортированного дерева в выходной файл
  PROCEDURE ClearTree(VAR Ptr: Tree);                              //Очистка дерева
  PROCEDURE Merge(VAR FTempIn, FTempOut: TEXT; VAR Ptr: Tree);     //Слияние дерева с файлом
  PROCEDURE CopyFile(VAR FIn, FOut: TEXT);
           
IMPLEMENTATION

  PROCEDURE MergeTree(VAR FTempIn, FTempOut: TEXT; VAR Ptr: Tree; VAR TreeWord, FileWord: STRING; VAR TreeAmount, FileAmount: INTEGER);
  VAR
    IsMore, IsLess, IsEqual, Flag: BOOLEAN;
  BEGIN {MergeTree}
    IF (Ptr <> NIL)
    THEN
      BEGIN
        MergeTree(FTempIn, FTempOut, Ptr^.LLink, TreeWord, FileWord, TreeAmount, FileAmount);
        IsEqual := FALSE;
        IsLess := FALSE;
        TreeWord := Ptr^.Wd;
        TreeAmount := Ptr^.Amount;
        IF (FileWord < TreeWord) AND (FileWord <> 'EOF')
        THEN
          BEGIN  
            WRITELN(FTempOut, FileWord, ' ', FileAmount);
            IF EOF(FTempIn)
            THEN
              FileWord := 'EOF';
          END
        ELSE 
          IF (FileWord = TreeWord) AND (NOT EOF(FTempIn))
          THEN
            BEGIN
              WRITELN(FTempOut, FileWord, ' ', FileAmount + TreeAmount);
              IsEqual := TRUE;      
            END
          ELSE
            IsLess := TRUE;  
        WHILE (NOT IsLess) AND (NOT EOF(FTempIn))
        DO
          BEGIN
            GetWord(FTempIn, FileWord);
            READLN(FTempIn, FileAmount);
            IF FileWord < TreeWord
            THEN
              BEGIN  
                WRITELN(FTempOut, FileWord, ' ', FileAmount);
                IF EOF(FTempIn)
                THEN
                  FileWord := 'EOF'
              END  
            ELSE 
              IF FileWord = TreeWord 
              THEN
                BEGIN
                  WRITELN(FTempOut, FileWord, ' ', FileAmount + TreeAmount);
                  IsEqual := TRUE;
                END
              ELSE
                IsLess := TRUE;               
          END; 
        IF NOT IsEqual
        THEN        
          WRITELN(FTempOut, TreeWord, ' ', TreeAmount);       
        MergeTree(FTempIn, FTempOut, Ptr^.RLink, TreeWord, FileWord, TreeAmount, FileAmount);      
      END;   
  END;  {MergeTree}
          
  PROCEDURE Merge(VAR FTempIn, FTempOut: TEXT; VAR Ptr: Tree);
  VAR
    TreeWord, FileWord: STRING;  
    TreeAmount, FileAmount: INTEGER;
    Ch: CHAR;
  BEGIN {Merge}
    GetWord(FTempIn, FileWord);
    READ(FTempIn, FileAmount);
    TreeWord := '';
    TreeAmount := 0;
    READLN(FTempIN);
    MergeTree(FTempIn, FTempOut, Ptr, TreeWord, FileWord, TreeAmount, FileAmount);  
    IF FileWord <> 'EOF'
    THEN
      WRITELN(FTempOut, FileWord, ' ', FileAmount);
    WHILE NOT EOF(FTempIn)
    DO
      BEGIN
        GetWord(FTempIn, FileWord); 
        READLN(FTempIn, FileAmount);
        WRITELN(FTempOut, FileWord, ' ', FileAmount);
      END;  
  END;  {Merge}
  
 
  PROCEDURE InsertWord(VAR Data: STRING; VAR Ptr: Tree; VAR Nodes: INTEGER);
  BEGIN {InsertWord} 
    IF Ptr = NIL
    THEN 
      BEGIN 
        NEW(Ptr);
        Ptr^.Wd := Data;
        Nodes := Nodes + 1;
        Ptr^.Amount := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL;
      END
    ELSE
      IF Ptr^.Wd = Data
      THEN
        Ptr^.Amount := Ptr^.Amount + 1
      ELSE  
        IF Data <= Ptr^.Wd
        THEN
          InsertWord(Data, Ptr^.LLink, Nodes)
        ELSE
          InsertWord(Data, Ptr^.RLink, Nodes)
  END;  {InsertWord}
  
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);
  BEGIN {PrintTree}
    IF Ptr <> NIL
    THEN
      BEGIN
        PrintTree(Ptr^.LLink, FOut);
        WRITELN(FOut, Ptr^.Wd, ' ', Ptr^.Amount);
        PrintTree(Ptr^.RLink, FOut);
      END;
  END;  {PrintTree}
  
  PROCEDURE ClearTree(VAR Ptr: Tree);
  BEGIN {ClearTree}
    IF Ptr <> NIL
      THEN
        BEGIN
          ClearTree(Ptr^.LLink);
          ClearTree(Ptr^.RLink);
          DISPOSE(Ptr);
          Ptr := NIL;
        END;  
  END;  {ClearTree}
  
  PROCEDURE CopyFile(VAR FIn, FOut: TEXT);
  VAR 
    Ch: CHAR;
  BEGIN {CopyFile}
    RESET(FIn);
    REWRITE(FOut);
    WHILE NOT EOF(FIn)
    DO
      BEGIN
        WHILE NOT EOLN(FIn)
        DO
          BEGIN
            READ(FIn, Ch);
            WRITE(FOut, Ch);
          END;
        WRITELN(FOut);
        READLN(FIn);  
      END;
  END;  {CopyFile}
  
BEGIN                                              
END.

