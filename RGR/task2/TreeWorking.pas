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
    IsEqual: BOOLEAN;
  BEGIN {MergeTree}
    IF (Ptr <> NIL)
    THEN
      BEGIN
        MergeTree(FTempIn, FTempOut, Ptr^.LLink, TreeWord, FileWord, TreeAmount, FileAmount);
        IsEqual := FALSE;
        TreeWord := Ptr^.Wd;
        TreeAmount := Ptr^.Amount;
        WHILE (FileWord < TreeWord) AND (NOT EOF(FTempIn))
        DO
          BEGIN
            WRITELN(FTempOut, FileWord, ' ', FileAmount);
            GetWord(FTempIn, FileWord);
            READLN(FTempIn, FileAmount);  
          END;
        IF FileWord < TreeWord
        THEN  
          WRITELN(FTempOut, FileWord, ' ', FileAmount);          
        IF FileWord = TreeWord
        THEN
          BEGIN
            WRITELN(FTempOut, FileWord, ' ', FileAmount + TreeAmount);
            GetWord(FTempIn, FileWord);    
            READLN(FTempIn, FileAmount);
            IsEqual := TRUE;
          END;
        IF (TreeWord < FileWord) AND (NOT IsEqual) 
        THEN
          BEGIN
            WRITELN(FTempOut, TreeWord, ' ', TreeAmount);
          END;       
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
    WHILE NOT EOF(FTempIn)
    DO
      BEGIN
        WRITELN(FTempOut, FileWord, ' ', FileAmount);
        GetWord(FTempIn, FileWord); 
        READLN(FTempIn, FileAmount);
      END;
    WRITELN(FTempOut, FileWord, ' ', FileAmount); 
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

