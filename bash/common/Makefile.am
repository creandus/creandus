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
TESTS = getent_TEST.bash die_TEST.bash
XFAIL_TESTS = die_TEST.bash
check_SCRIPTS = $(top_srcdir)/tools/run_test.bash
check_PROGRAMS = 

EXTRA_DIST = $(foreach f, $(commonbackend_DATA) $(TESTS), $(f).in)

CLEANFILES = *~ $(commonbackend_DATA) $(TESTS)
MAINTAINERCLEANFILES = Makefile.in

# Do the proper substitutions in our scripts
dosed=@SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@BASH\@,@BASH@,g' \
	-e 's,\@PACKAGE\@,@PACKAGE@,g' \
	-e 's,\@SCRIPTDIR\@,@SCRIPTDIR@,g' \
	-e 's,\@localstatedir\@,@localstatedir@,g' \
	-e 's,\@sysconfdir\@,@sysconfdir@,g'

% : %.in
	$(dosed) $< > $@
