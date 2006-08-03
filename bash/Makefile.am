MAINTAINERCLEANFILES = Makefile.in
SUBDIRS = auth common .

installbackenddir = $(datadir)/$(PACKAGE)/

installbackend_SCRIPTS = \
	addgroup.bash \
	adduser.bash \
	db.bash \
	add.bash \
	install_fail.bash \
	delgroup.bash \
	deluser.bash

CLEANFILES = *~ $(installbackend_SCRIPTS)

TESTS_ENVIRONMENT = env \
	SCRIPTDIR="$(top_builddir)/bash/" \
	bash $(top_srcdir)/tools/run_test.bash

TESTS = $(installbackend_SCRIPTS)

check_SCRIPTS = $(top_srcdir)/tools/run_test.bash
check_PROGRAMS = 

EXTRA_DIST = \
	addgroup.bash.in \
	adduser.bash.in \
	db.bash.in \
	add.bash.in \
	install_fail.bash.in \
	delgroup.bash.in \
	deluser.bash.in

SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
