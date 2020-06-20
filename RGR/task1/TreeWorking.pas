UNIT TreeWorking;
INTERFACE
CONST
  WordLength = 60;
  
TYPE
  Tree = ^NodeType;
  NodeType = RECORD
               Wd: STRING;
               Amount: INTEGER;
               LLink, RLink: Tree;
             END;
    
  PROCEDURE InsertWord(VAR Data: STRING; VAR Ptr: Tree);           //Добавление нового слова в узел дерева
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR FOut: TEXT);              //Вывод отсортированного дерева в выходной файл
//  PROCEDURE ClearTree(VAR Ptr: Tree);                            //Очистка дерева
IMPLEMENTATION
 
  PROCEDURE InsertWord(VAR Data: STRING; VAR Ptr: Tree);
  BEGIN {InsertWord} 
    IF Ptr = NIL
    THEN 
      BEGIN 
        NEW(Ptr);
        Ptr^.Wd := Data;
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
          InsertWord(Data, Ptr^.LLink)
        ELSE
          InsertWord(Data, Ptr^.RLink)
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
  
//  PROCEDURE ClearTree(VAR Ptr: Tree);
//  BEGIN {ClearTree}
//    ClearTree(Ptr^.LLink);
//    Ptr^.LLink := NIL;
//    Ptr^.Wd := '';
//    Ptr^.Amount := 0;
//    ClearTree(Ptr^.RLink);
//    Ptr^.RLink := NIL;
//  END;  {ClearTree}
BEGIN                                                
END.
