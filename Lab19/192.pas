PROGRAM SortDate(INPUT, OUTPUT);
USES
  DateWorking;
  
TYPE
  Month = (NoMonth, Jan, Feb, Mar, Apr, May, Jun,
                    Jul, Aug, Sep, Oct, Nov, Dec);
  DayNum = 1..31;
  Date   = RECORD
             Mo : Month;
             Day: DayNum
           END;
  FileOfDate = FILE OF Date;
VAR
  Copying: BOOLEAN;
  D, VarDate: Date;
  TFile, DateFile: FileOfDate;
  FInput: TEXT;
 
BEGIN{SortDate}
  ASSIGN(DateFile, 'DF.DAT');
  ASSIGN(TFile, 'TF.DAT');
  ASSIGN(FInput, 'FI.TXT');
  REWRITE(DateFile);
  RESET(FInput);
  ReadDate(FInput, VarDate);
  READLN(FInput);
  WRITE(DateFile, VarDate);
  RESET(DateFile);
  WHILE NOT EOF(FInput)
  DO
    BEGIN
      ReadDate(FInput,D);
      READLN(FInput);
      IF (D.Mo <> NoMonth)
      THEN
        BEGIN
          {�������� �������� �������, ��� D �� DateFile � TFile}
          REWRITE(TFile);
          Copying := TRUE;
          WHILE NOT EOF(DateFile) AND Copying
          DO
            BEGIN
              READ(DateFile, VarDate);
              IF Less(VarDate,D)
              THEN
                WRITE(TFile, VarDate)
              ELSE
                Copying := FALSE
            END;
           {�������� D � TFile}
          WRITE(TFile, D);
          {�������� ������� DateFile � TFile}
          WHILE NOT EOF(DateFile)
          DO
            BEGIN
              READ(DateFile, VarDate);
              WRITE(TFile, VarDate);
            END;
          {�������� TFile � DateFile}
          RESET(TFile);
          REWRITE(DateFile);
          WHILE NOT EOF(TFile)
          DO
            BEGIN
              READ(TFile, VarDate);
              WRITE(DateFile, VarDate);
            END;
        END;
    END;
  {�������� DateFile � OUTPUT}
  RESET(DateFile);
  CopyOut(DateFile);
END.{SortDate}
 
