commonbackenddir = $(pkgdatadir)/common/
commonbackend_DATA = \
	config.bash \
	getent.bash \
	get_profiledirs.bash \
	load_config.bash \
	read_groupdata.bash \
	read_userdata.bash \
	functions.bash

# Some basic sanity checks.
TESTS_ENVIRONMENT = env \
	CREANDUS_SCRIPTDIR="$(top_builddir)/bash/" \
	CREANDUS_TESTDIR="$(srcdir)/test" \
	bash $(top_srcdir)/tools/run_test.bash
TESTS = getent_TEST.bash die_TEST.bash read_userdata_TEST.bash
XFAIL_TESTS = die_TEST.bash
check_SCRIPTS = $(top_srcdir)/tools/run_test.bash
check_PROGRAMS = 

EXTRA_DIST = $(commonbackend_DATA:%=%.in) $(TESTS:%=%.in) test

CLEANFILES = *~ $(commonbackend_DATA) $(TESTS)
MAINTAINERCLEANFILES = Makefile.in

# Do the proper substitutions in our scripts
dosed=@SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@BASH\@,@BASH@,g' \
	-e 's,\@PACKAGE\@,@PACKAGE@,g' \
	-e 's,\@CREANDUS_SCRIPTDIR\@,@CREANDUS_SCRIPTDIR@,g' \
	-e 's,\@CREANDUS_CONFDIR\@,@CREANDUS_CONFDIR@,g' \
	-e 's,\@localstatedir\@,@localstatedir@,g' \
	-e 's,\@sysconfdir\@,@sysconfdir@,g'

% : %.in
	@echo DOSED $@
	@$(dosed) $< > $@
