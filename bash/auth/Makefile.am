MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~
SUBDIRS = .

installauthdir = $(datadir)/$(PACKAGE)/auth/

installauth_SCRIPTS = \
	compat-BSD-FreeBSD-groupadd.bash \
	compat-BSD-FreeBSD-groupmod.bash \
	compat-BSD-FreeBSD-useradd.bash \
	compat-BSD-FreeBSD-usermod.bash \
	compat-GNU-glibc-groupadd.bash \
	compat-GNU-glibc-groupmod.bash \
	compat-GNU-glibc-useradd.bash \
	compat-GNU-glibc-usermod.bash \
	files-GNU-glibc-groupadd.bash \
	files-GNU-glibc-groupmod.bash \
	files-GNU-glibc-useradd.bash \
	files-GNU-glibc-usermod.bash

EXTRA_DIST = $(installauth_SCRIPTS)

SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $< $@
