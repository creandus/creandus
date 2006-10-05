SUBDIRS = auth common .

# Install our scripts in the proper place
backenddir = $(datadir)/$(PACKAGE)/
backend_SCRIPTS = \
	addgroup.bash \
	adduser.bash \
	db.bash \
	add.bash \
	install_fail.bash \
	delgroup.bash \
	deluser.bash \
	cleanup.bash

# Some basic tests, mostly just syntax verification at the moment
TESTS_ENVIRONMENT = env \
	CREANDUS_SCRIPTDIR="$(top_builddir)/bash/" \
	bash $(top_srcdir)/tools/run_test.bash
TESTS = $(backend_SCRIPTS)
check_SCRIPTS = $(top_srcdir)/tools/run_test.bash

EXTRA_DIST = $(foreach f, $(backend_SCRIPTS), $(f).in)

CLEANFILES = *~ $(backend_SCRIPTS)
MAINTAINERCLEANFILES = Makefile.in

# Do the proper substitutions in our scripts
dosed=@SED@ \
	-e 's,\@SED\@,@SED@,g' \
	-e 's,\@BASH\@,@BASH@,g' \
	-e 's,\@PACKAGE\@,@PACKAGE@,g' \
	-e 's,\@CREANDUS_SCRIPTDIR\@,@CREANDUS_SCRIPTDIR@,g' \
	-e 's,\@localstatedir\@,@localstatedir@,g' \
	-e 's,\@sysconfdir\@,@sysconfdir@,g'

% : %.in
	@echo DOSED $@
	@$(dosed) $< > $@
