      * erzeugt Mittwoch, 23. August 2017 11:32
      * (C) 2017 von Leander Jedamus
      * modifiziert Mittwoch, 23. August 2017 11:38 von Leander Jedamus

       IDENTIFICATION DIVISION.
       PROGRAM-ID. mystsdinout.
       AUTHOR. Leander Jedamus.
       DATE-WRITTEN. Mittwoch, 23. August 2017 11:32.
       
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SYSIN
           ASSIGN TO KEYBOARD
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT SYSOUT
           ASSIGN TO DISPLAY
           ORGANIZATION IS LINE SEQUENTIAL.
       
       DATA DIVISION.
       FILE SECTION.

       FD SYSIN.
       01 ln PIC X(255).
         88  EOF VALUE HIGH-VALUES.
       
       WORKING-STORAGE SECTION.
       
       LOCAL-STORAGE SECTION.
       
       LINKAGE SECTION.
       
       SCREEN SECTION.
       
      *
       PROCEDURE DIVISION.

       OPEN INPUT SYSIN
       READ SYSIN
         AT END SET EOF TO TRUE
       END-READ
       PERFORM UNTIL EOF
         DISPLAY ln
         READ SYSIN
           AT END SET EOF TO TRUE
         END-READ
       END-PERFORM
       CLOSE SYSIN
       STOP RUN.
       
       GOBACK.
       END PROGRAM mystsdinout.
       
      * vim:ai sw=4 sts=4 expandtab

