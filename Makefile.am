CLEANFILES = *~ .keep done-check
MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
	INSTALL COPYING
AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
EXTRA_DIST = autogen.bash doc
SUBDIRS = . bash eselect

userdbdir = $(localstatedir)/$(PACKAGE)/db/user
userdb_DATA = .keep

groupdbdir = $(localstatedir)/$(PACKAGE)/db/group
userdb_DATA = .keep

.keep :
	touch $@

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/$(PACKAGE)/db/user
	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/$(PACKAGE)/db/group
	$(mkinstalldirs) $(DESTDIR)$(bindir)
	cd $(DESTDIR)$(bindir) ; ln -s eselect users-update
