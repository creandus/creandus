DOCFLAGS=-g -d -t -s

all : html

docs = API auth_modules

html : $(foreach f,$(docs),$(f).html)

%.html : %.txt
	rst2html.py $(DOCFLAGS) $< $@

clean :
	rm -f *~ *.html || true
