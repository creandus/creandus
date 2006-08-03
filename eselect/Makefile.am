MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~ users.eselect
SUBDIRS = .

installeselectdir = $(datadir)/eselect/modules/

installeselect_SCRIPTS = \
	users.eselect

EXTRA_DIST = users.eselect.in

SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
