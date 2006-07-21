MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~
SUBDIRS = .

installauthdir = $(datadir)/$(PACKAGE)/auth/

installauth_SCRIPTS = \
	compat-BSD-FreeBSD-groupadd.sh \
	compat-BSD-FreeBSD-groupmod.sh \
	compat-BSD-FreeBSD-useradd.sh \
	compat-BSD-FreeBSD-usermod.sh \
	compat-GNU-glibc-groupadd.sh \
	compat-GNU-glibc-groupmod.sh \
	compat-GNU-glibc-useradd.sh \
	compat-GNU-glibc-usermod.sh \
	files-GNU-glibc-groupadd.sh \
	files-GNU-glibc-groupmod.sh \
	files-GNU-glibc-useradd.sh \
	files-GNU-glibc-usermod.sh

EXTRA_DIST = $(installauth_SCRIPTS)
