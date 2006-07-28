MAINTAINERCLEANFILES = Makefile.in addgroup.sh adduser.sh db.sh add.sh \
	install_fail.sh
CLEANFILES = *~
SUBDIRS = . auth common

installbackenddir = $(datadir)/$(PACKAGE)/

installbackend_SCRIPTS = \
	addgroup.sh \
	adduser.sh \
	db.sh \
	add.sh \
	install_fail.sh

EXTRA_DIST = \
	addgroup.sh.in \
	adduser.sh.in \
	db.sh.in \
	add.sh.in \
	install_fail.sh.in
