      * erzeugt Mittwoch, 23. August 2017 10:26
      * (C) 2017 von Leander Jedamus
      * modifiziert Mittwoch, 23. August 2017 11:17 von Leander Jedamus

       IDENTIFICATION DIVISION.
       PROGRAM-ID. beisp13.
       AUTHOR. Leander Jedamus.
       DATE-WRITTEN. Mittwoch, 23. August 2017 10:26.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ZEILENAUSGABE-DATEI
           ASSIGN TO DISPLAY
           ORGANIZATION IS LINE SEQUENTIAL.
      *    .
       
       DATA DIVISION.
       FILE SECTION.
       FD ZEILENAUSGABE-DATEI
          LABEL RECORDS ARE OMITTED.
           01 ZEILEN-SATZ                 PICTURE X(26).
       
       WORKING-STORAGE SECTION.
       
       LOCAL-STORAGE SECTION.
       
       LINKAGE SECTION.
       
       SCREEN SECTION.
       
      *
       PROCEDURE DIVISION.
       A000-AUSGABE-NAME-UND-ADRESSE.
         OPEN OUTPUT ZEILENAUSGABE-DATEI.
         MOVE "DONALD G. GOLDEN"           TO ZEILEN-SATZ.
         WRITE ZEILEN-SATZ.
         MOVE "CIS DEPARTMENT"             TO ZEILEN-SATZ.
         WRITE ZEILEN-SATZ.
         MOVE "CLEVELAND STATE UNIVERSITY" TO ZEILEN-SATZ.
         WRITE ZEILEN-SATZ.
         MOVE "CLEVELAND, OHIO 44115"      TO ZEILEN-SATZ.
         WRITE ZEILEN-SATZ.
         CLOSE ZEILENAUSGABE-DATEI.
         STOP RUN.
       
       END PROGRAM beisp13.
       
      * vim:ai sw=4 sts=4 expandtab

