DOCFLAGS=-g -d -t -s

docs = API auth_modules datafiles

txtfiles=$(foreach f,$(docs),$(f).txt)
htmlfiles=$(foreach f,$(docs),$(f).html)

EXTRA_DIST = $(txtfiles)

doc : $(htmlfiles)

%.html : %.txt
	rst2html.py $(DOCFLAGS) $< $@

CLEANFILES = *~ $(htmlfiles)
