DOCFLAGS=-g -d -t -s

docs = API auth_modules datafiles

txtfiles=$(foreach f,$(docs),$(f).txt)
htmlfiles=$(foreach f,$(docs),$(f).html)

EXTRA_DIST = $(txtfiles) \
	API_flowchart.dia API_flowchart.png \
	API_flowchart2.dia API_flowchart2.png

if HAVE_DOCUTILS

doc : $(htmlfiles)

else

doc : 
	@echo "You don't have docutils installed!"
	exit 1

endif

%.html : %.txt
	rst2html.py $(DOCFLAGS) $< $@

CLEANFILES = *~ $(htmlfiles)
