all : html

docs = API

html : $(foreach f,$(docs),$(f).html)

%.html : %.txt
	rst2html.py $< > $@

clean :
	rm -f *~ *.html || true
