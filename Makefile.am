AUTOMAKE_OPTIONS = dist-bzip2 no-dist-gzip
EXTRA_DIST = autogen.bash tools
SUBDIRS = bash eselect doc

# Make our db dirs stick around no matter what.
userdbdir = $(localstatedir)/$(PACKAGE)/db/user
userdb_DATA = .keep

groupdbdir = $(localstatedir)/$(PACKAGE)/db/group
groupdb_DATA = .keep

.keep:
	touch $@

.PHONY : doc
doc : 
	$(MAKE) -C doc doc

CLEANFILES = *~ .keep done-check
MAINTAINERCLEANFILES = Makefile.in configure config/* aclocal.m4 \
	INSTALL COPYING
