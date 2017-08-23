      * erzeugt Mittwoch, 23. August 2017 16:02
      * (C) 2017 von Leander Jedamus
      * modifiziert Mittwoch, 23. August 2017 16:24 von Leander Jedamus

       IDENTIFICATION DIVISION.
       PROGRAM-ID. haupt.
       AUTHOR. Leander Jedamus.
       DATE-WRITTEN. Mittwoch, 23. August 2017 16:02.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT AUSGABE-DATEI
           ASSIGN TO DISPLAY
           ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.
       FD AUSGABE-DATEI
          LABEL RECORDS OMITTED.
       01 AUSGABESATZ            PIC X(80).
       
       WORKING-STORAGE SECTION.
       77 EINGABE                PIC X(80).
       77 AUSGABE                PIC X(80).
       
       LOCAL-STORAGE SECTION.
       
       LINKAGE SECTION.
       
       SCREEN SECTION.
       
      *
       PROCEDURE DIVISION.
       MAIN.
         MOVE "Hallo" TO EINGABE.
         OPEN OUTPUT AUSGABE-DATEI.
           MOVE EINGABE TO AUSGABESATZ.
           WRITE AUSGABESATZ.
           CALL "unter" USING EINGABE AUSGABE;
           MOVE AUSGABE TO AUSGABESATZ.
           WRITE AUSGABESATZ.
         CLOSE AUSGABE-DATEI.
         
       
       END PROGRAM haupt.
       
      * vim:ai sw=4 sts=4 expandtab

