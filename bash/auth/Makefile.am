MAINTAINERCLEANFILES = Makefile.in
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

CLEANFILES = *~ $(installauth_SCRIPTS)

EXTRA_DIST = \
	compat-BSD-FreeBSD-groupadd.bash.in \
	compat-BSD-FreeBSD-groupmod.bash.in \
	compat-BSD-FreeBSD-useradd.bash.in \
	compat-BSD-FreeBSD-usermod.bash.in \
	compat-GNU-glibc-groupadd.bash.in \
	compat-GNU-glibc-groupmod.bash.in \
	compat-GNU-glibc-useradd.bash.in \
	compat-GNU-glibc-usermod.bash.in \
	files-GNU-glibc-groupadd.bash.in \
	files-GNU-glibc-groupmod.bash.in \
	files-GNU-glibc-useradd.bash.in \
	files-GNU-glibc-usermod.bash.in

SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
