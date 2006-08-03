MAINTAINERCLEANFILES = Makefile.in
SUBDIRS = .

installcommonbackenddir = $(datadir)/$(PACKAGE)/common/

installcommonbackend_SCRIPTS = \
	config.bash \
	getent.bash \
	read_groupdata.bash \
	read_userdata.bash \
	functions.bash

CLEANFILES = *~ $(installcommonbackend_SCRIPTS)

TESTS_ENVIRONMENT = env \
	SCRIPTDIR="$(top_builddir)/bash/" \
	bash $(top_srcdir)/tools/run_test.bash

TESTS = getent_TEST.bash

EXTRA_DIST = \
	getent.bash.in \
	read_groupdata.bash.in \
	read_userdata.bash.in \
	config.bash.in \
	functions.bash.in \
	$(TESTS)

check_SCRIPTS = $(top_srcdir)/tools/run_test.bash
check_PROGRAMS = 

SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
