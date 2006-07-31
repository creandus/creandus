MAINTAINERCLEANFILES = Makefile.in addgroup.bash adduser.sh db.sh add.sh \
	install_fail.bash
CLEANFILES = *~
SUBDIRS = . auth common

installbackenddir = $(datadir)/$(PACKAGE)/

installbackend_SCRIPTS = \
	addgroup.bash \
	adduser.bash \
	db.bash \
	add.bash \
	install_fail.bash

EXTRA_DIST = \
	addgroup.bash.in \
	adduser.bash.in \
	db.bash.in \
	add.bash.in \
	install_fail.bash.in
