# Install our files in the proper place
commonbackenddir = $(datadir)/$(PACKAGE)/common/
commonbackend_DATA = \
	config.bash \
	getent.bash \
	read_groupdata.bash \
	read_userdata.bash \
	functions.bash

# Some basic sanity checks.
TESTS_ENVIRONMENT = env \
	SCRIPTDIR="$(top_builddir)/bash/" \
	bash $(top_srcdir)/tools/run_test.bash
TESTS = getent_TEST.bash
check_SCRIPTS = $(top_srcdir)/tools/run_test.bash
check_PROGRAMS = 

EXTRA_DIST = $(foreach f, $(commonbackend_DATA), $(f).in) \
	$(TESTS)

CLEANFILES = *~ $(commonbackend_DATA)
MAINTAINERCLEANFILES = Makefile.in

# Our "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
