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
	SCRIPTDIR="$(top_builddir)/bash/" \
	bash $(top_srcdir)/tools/run_test.bash
TESTS = $(backend_SCRIPTS)
check_SCRIPTS = $(top_srcdir)/tools/run_test.bash

EXTRA_DIST = $(foreach f, $(backend_SCRIPTS), $(f).in)

CLEANFILES = *~ $(backend_SCRIPTS)
MAINTAINERCLEANFILES = Makefile.in

# The script "compiler"
SUBST = $(top_srcdir)/tools/subst.bash

% : %.in
	$(SUBST) $(top_srcdir) $(top_builddir) $< $@
