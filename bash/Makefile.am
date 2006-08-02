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
	install_fail.bash \
	delgroup.bash \
	deluser.bash

TESTS_ENVIRONMENT = env \
	bash $(top_srcdir)/bash/run_test.bash

TESTS = $(installbackend_SCRIPTS)

check_SCRIPTS = run_test.bash
check_PROGRAMS = 

EXTRA_DIST = \
	addgroup.bash.in \
	adduser.bash.in \
	db.bash.in \
	add.bash.in \
	install_fail.bash.in \
	run_test.bash \
	delgroup.bash.in \
	deluser.bash.in
