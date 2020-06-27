PROGRAM CountWords(INPUT, OUTPUT);
USES
  TreeWorking,
  WordWorking;  
  
PROCEDURE GetStatistic(VAR FIn, FOut: TEXT);
VAR
  Wd: STRING;
  Root: Tree;
  Overflow: BOOL
BEGIN {GetStatistic}
  RESET(FIn);
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
            InsertWord(Wd, Root);  
        END;
      PrintTree(Root, FOut); 
      ClearTree(Root);      
    END;
  WRITELN(Fout);
END;  {GetStatistic}
  
BEGIN {CountWords}
  ASSIGN(INPUT, 'input.txt');
  ASSIGN(OUTPUT, 'output.txt');
  REWRITE(OUTPUT);
  GetStatistic(INPUT, OUTPUT);
END.  {CountWords}  
