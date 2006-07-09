CLEANFILES = *~ done-check gmon.out *.gcov *.gcno *.gcda
MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
			config.h config.h.in INSTALL COPYING
AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
EXTRA_DIST = autogen.bash
SUBDIRS = . bash eselect

install-data-local:
	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/$(PACKAGE)/users
	$(mkinstalldirs) $(DESTDIR)$(localstatedir)/$(PACKAGE)/groups
