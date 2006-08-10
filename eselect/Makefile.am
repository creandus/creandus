# Install our scripts in the proper place
installeselectdir = $(datadir)/eselect/modules/
installeselect_DATA = \
	users.eselect

EXTRA_DIST = $(foreach f, $(installeselect_DATA), $(f).in)

CLEANFILES = *~ $(installeselect_DATA)
MAINTAINERCLEANFILES = Makefile.in

# Our "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@

# Create a users-update symlink to eselect
install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	cd $(DESTDIR)$(bindir) ; ln -s eselect users-update
