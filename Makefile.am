CLEANFILES = *~ done-check
MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
			INSTALL COPYING
AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
EXTRA_DIST = autogen.bash
SUBDIRS = . bash eselect

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/$(PACKAGE)/db/users
	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/$(PACKAGE)/db/groups
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	cd $(DESTDIR)$(bindir) ; ln -s eselect users-update
