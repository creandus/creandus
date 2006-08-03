MAINTAINERCLEANFILES = Makefile.in
CLEANFILES = *~ config.bash
SUBDIRS = .

installcommonbackenddir = $(datadir)/$(PACKAGE)/common/

installcommonbackend_SCRIPTS = \
	config.bash \
	getent.bash \
	read_groupdata.bash \
	read_userdata.bash \
	functions.bash

TESTS_ENVIRONMENT = env \
	SCRIPTDIR="$(top_builddir)/bash/" \
	bash $(top_srcdir)/tools/run_test.bash

TESTS = getent_TEST.bash

EXTRA_DIST = \
	getent.bash \
	read_groupdata.bash \
	read_userdata.bash \
	config.bash.in \
	functions.bash \
	$(TESTS)

check_SCRIPTS = $(top_srcdir)/tools/run_test.bash
check_PROGRAMS = 

SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $< $@
