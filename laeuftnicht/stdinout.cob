      * erzeugt Mittwoch, 23. August 2017 11:21
      * (C) 2017 von Leander Jedamus
      * modifiziert Mittwoch, 23. August 2017 11:26 von Leander Jedamus

       identification division.
       program-id. rot13-sample.

       REPLACE ==LRECL-MAGIC-NUMBER== BY ==32768==.

       environment division.
       configuration section.
       repository.
           function all intrinsic
           function rot13.

       input-output section.
       file-control.
           select standard-input assign to keyboard status in-status.
           select standard-output assign to display status out-status.

       data division.
       file section.
       fd standard-input.
           01 stdin-record     pic x(LRECL-MAGIC-NUMBER).
       fd standard-output.
           01 stdout-record    pic x(LRECL-MAGIC-NUMBER).

       working-storage section.
       01  in-status.
           88 end-of-file             value high-value
              when set to false is          low-value.
           05 in-status-one    pic x.
           05 in-status-two    pic x.
       01  out-status          pic xx.

      *> ***************************************************************
       procedure division.
       open output standard-output
       if out-status not equal to zero then
           display "Sorry, unable to open standard out" end-display
           stop run returning 1
       end-if

       open input standard-input
       if in-status-one not equal to zero then
           display "Sorry, unable to open standard in" end-display
           stop run returning 1
       end-if

       read standard-input end-read 
       perform until in-status-one not equal zero
           move function rot13(trim(stdin-record)) to stdout-record
           write stdout-record end-write
           read standard-input end-read
       end-perform 

       close standard-input standard-output

       display trim(function rot13("Unir tbbq, rirelbar")) end-display

       goback.
       end program rot13-sample.

       identification division.
       FUNCTION-ID. rot13.

       data division.
       linkage section.
       01 in-string            pic x any length.
       01 out-string           pic x(LRECL-MAGIC-NUMBER).

       procedure division using in-string returning out-string.
       move in-string to out-string
       inspect out-string converting
            "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
                 to
            "NOPQRSTUVWXYZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm"
       goback.
       end function rot13.

      * vim:ai sw=4 sts=4 expandtab


      * vim:ai sw=4 sts=4 expandtab

