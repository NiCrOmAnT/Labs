PROGRAM CountWords(INPUT, OUTPUT);
USES
  TreeWorking,
  WordWorking;

CONST
  MaxNodes = 25000;
    
PROCEDURE GetStatistic(VAR FIn, FOut: TEXT);
VAR
  Wd: STRING;
  Root: Tree;
  Nodes, TreeCounter: INTEGER;
  FTemp1, FTemp2: TEXT;
BEGIN {GetStatistic}
  RESET(FIn);
  Nodes := 0;
  TreeCounter := 0;
  IF NOT EOF(FIn)
  THEN
    BEGIN
      Root := NIL;
      WHILE NOT EOF(FIn)
      DO  
        BEGIN
          GetWord(FIn, Wd);
          IF Wd <> ''
          THEN
            InsertWord(Wd, Root, Nodes);
          IF Nodes > MaxNodes
          THEN
            BEGIN
              IF TreeCounter = 0
              THEN
                BEGIN
                  REWRITE(FTemp1);
                  PrintTree(Root, FTemp1)
                END              
              ELSE
                BEGIN
                  RESET(FTemp1);
                  REWRITE(FTemp2);
                  Merge(FTemp1, FTemp2, Root);
                  CopyFile(FTemp2, FTemp1);
                END;
              ClearTree(Root);
              TreeCounter := TreeCounter + 1;
              Nodes := 0;
            END;      
        END;   
      IF TreeCounter = 0 
      THEN
        PrintTree(Root, FOut)
      ELSE
        BEGIN   
          RESET(FTemp1);
          Merge(FTemp1, FOut, Root);    
        END;
      ClearTree(Root);       
    END
  ELSE  
    WRITELN(Fout);
END;  {GetStatistic}
  
BEGIN {CountWords}
  ASSIGN(INPUT, 'input.txt');
  ASSIGN(OUTPUT, 'output.txt');
  REWRITE(OUTPUT);
  GetStatistic(INPUT, OUTPUT);
END.  {CountWords}  
