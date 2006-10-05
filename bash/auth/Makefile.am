# Install our files in the proper place
authbackenddir = $(datadir)/$(PACKAGE)/auth/
authbackend_DATA = \
	compat-BSD-FreeBSD-groupadd.bash \
	compat-BSD-FreeBSD-groupmod.bash \
	compat-BSD-FreeBSD-useradd.bash \
	compat-BSD-FreeBSD-usermod.bash \
	compat-GNU-glibc-groupadd.bash \
	compat-GNU-glibc-groupmod.bash \
	compat-GNU-glibc-useradd.bash \
	compat-GNU-glibc-usermod.bash \
	files-GNU-glibc-groupadd.bash \
	files-GNU-glibc-groupmod.bash \
	files-GNU-glibc-useradd.bash \
	files-GNU-glibc-usermod.bash

EXTRA_DIST = $(foreach f, $(authbackend_DATA), $(f).in)

CLEANFILES = *~ $(authbackend_DATA)
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
