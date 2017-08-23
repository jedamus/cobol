      * erzeugt Mittwoch, 23. August 2017 16:16
      * (C) 2017 von Leander Jedamus
      * modifiziert Mittwoch, 23. August 2017 16:23 von Leander Jedamus

       IDENTIFICATION DIVISION.
       PROGRAM-ID. unter.
       AUTHOR. Leander Jedamus.
       DATE-WRITTEN. Mittwoch, 23. August 2017 16:16.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       INPUT-OUTPUT SECTION.
       
       DATA DIVISION.
       
       WORKING-STORAGE SECTION.
       
       LOCAL-STORAGE SECTION.
       
       LINKAGE SECTION.
       77 EINGABE             PIC X(80).
       77 AUSGABE             PIC X(80).
       
       SCREEN SECTION.
       
      *
       PROCEDURE DIVISION USING EINGABE AUSGABE.
       UNTER.
         MOVE "Ausgabe" TO AUSGABE.
         EXIT PROGRAM.
       
       END PROGRAM unter.
       
      * vim:ai sw=4 sts=4 expandtab

