      * erzeugt Mittwoch, 23. August 2017 11:23
      * (C) 2017 von Leander Jedamus
      * modifiziert Mittwoch, 23. August 2017 11:23 von Leander Jedamus

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

