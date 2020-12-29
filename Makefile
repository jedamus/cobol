# erzeugt Samstag, 04. Juli 2015 14:04 (C) 2015 von Leander Jedamus
# modifiziert Mittwoch, 23. August 2017 17:16 von Leander Jedamus
# modifiziert Mittwoch, 24. Februar 2016 13:05 von Leander Jedamus
# modifiziert Dienstag, 16. Februar 2016 09:17 von Leander Jedamus
# modifiziert Montag, 08. Februar 2016 15:26 von Leander Jedamus
# modifiziert Freitag, 23. Oktober 2015 12:39 von Leander Jedamus
# modifiziert Montag, 21. September 2015 12:41 von Leander Jedamus
# modifiziert Mittwoch, 02. September 2015 14:44 von Leander Jedamus
# modifiziert Dienstag, 01. September 2015 18:11 von Leander Jedamus
# modifiziert Samstag, 15. August 2015 12:35 von Leander Jedamus
# modifiziert Mittwoch, 29. Juli 2015 13:28 von Leander Jedamus
# modifiziert Freitag, 17. Juli 2015 20:37 von Leander Jedamus
# modifiziert Dienstag, 14. Juli 2015 17:19 von Leander Jedamus
# modifiziert Mittwoch, 08. Juli 2015 15:20 von Leander Jedamus
# modifiziert Samstag, 04. Juli 2015 14:11 von Leander Jedamus

SUFFIXES	:= .out .a .o .c .cc .C .y .l .s .S .h .dvi .tex .latex .ps .w .ch .sh .noweb .mf .ind .sgml .f .cob .1 .odt .html .pdf .ps .tfm
.SUFFIXES	:= .out .a .o .c .cc .C .y .l .s .S .h .dvi .tex .latex .ps .w .ch .sh .noweb .mf .ind .sgml .f .cob .1 .odt .html .pdf .ps .tfm

#include Makefile.c_and_c++
#include Makefile.latex
#include Makefile.flex_and_bison
#include Makefile.cweb_and_noweb
#include Makefile.documentation
include Makefile.cobol
#include Makefile.FORTRAN

DEBUGGER	= gdb
RM		= rm -f
GENERATE	= ./generate2
PRINT		= print
TOUCH		= touch

CFLAGS		= #
CPPFLAGS	= -Wall -g
CPPFLAGS	+= # -O2
CPPFLAGS	+= # -ansi
CPPFLAGS	+= # -traditional
CPPFLAGS	+= # -funroll-loops -fomit-frame-pointer
CXXFLAGS	= # -felide-constructors -fmemoize-lookups
DFLAGS		= -DINLINE=inline
DFLAGS		+= -DCONST=const
LDFLAGS		= # -s
LDLIBS		= -lm
# LDLIBS		+= -lefence
LDLIBS		+= # -lvga
LDLIBS		+= # -ly
LDLIBS		+= # -ltermcap
LDLIBS		+= -ll # lex
LDLIBS		+= -ly # yacc
CLEAN		= #

define debug
$(DEBUGGER)
endef

define generate
$(GENERATE) $<
endef

define print
$(PRINT) $<
endef

OBJS		= #
FILES		= Makefile
COBFILES1	= beisp13.cob
COBFILES2	= kopier.cob
COBFILES3	= mystdinout.cob
PROGRAMS        += beisp13 kopier mystdinout
CLEAN		+= beisp13 kopier mystdinout
FILES		+= $(COBFILES1) $(COBFILES2) $(COBFILES3)

MAINCOBFILE4	= haupt.cob
MAINCOBOBJ4	= $(MAINCOBFILE4:%.cob=%.o)
COBFILES4	= unter.cob
COBOBJ4		= $(COBFILES4:%.cob=%.o)
CLEAN		+= $(MAINCOBOBJ4) $(COBOBJ4) programm
FILES		+= $(MAINCOBFILE4) $(COBFILES4)
PROGRAMS	+= programm

.PHONY:		all
all::		$(PROGRAMS)
		@echo done.

beisp13:	$(COBFILES1)
		$(COMPILE.cob) -x $(COBFILES1) -o $@

kopier:		$(COBFILES2)
		$(COMPILE.cob) -x $(COBFILES2) -o $@

mystdinout:	$(COBFILES3)
		$(COMPILE.cob) -x $(COBFILES3) -o $@

programm:	$(MAINCOBOBJ4) $(COBOBJ4)
		$(COMPILE.cob) -x $(MAINCOBOBJ4) $(COBOBJ4) -o $@

.PHONY:		clean
clean:
		$(RM) $(CLEAN)
ifeq ($(machtype),MacOS)
		$(RM) -r check.dSYM
endif

print:		$(FILES)
		$(PRINT) $?
		$(TOUCH) print

.PHONY:		dummy
dummy:

$(MAINCOBOBJ4):	    $(MAINCOBFILE4)
		    $(COMPILE.cob) -x -c $(MAINCOBFILE4)

#
# include a dependency file if one exists
#
ifeq (.depend,$(wildcard .depend))
include .depend
endif
# vim:ai sw=2

