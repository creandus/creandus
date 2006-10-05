dnl vim: set sw=4 sts=4 ts=4 noet ft=config foldmethod=marker foldmarker={{{,}}} :

dnl {{{ program, version
AC_INIT([creandus], [0.5.0], [pioto@gentoo.org])
AC_PREREQ([2.59])
AC_CONFIG_SRCDIR([bash/adduser.bash.in])
AC_CONFIG_AUX_DIR([config])
AM_INIT_AUTOMAKE([1.9])
dnl }}}

dnl {{{ basic toolchain checks
AC_PROG_INSTALL
AC_PROG_MAKE_SET
dnl }}}

dnl {{{ check for docutils
AC_MSG_CHECKING([whether to enable docutils])
AC_ARG_ENABLE([docutils],
			  [  --enable-docutils       Enable 'make doc' (developer docs)],
			  [HAVE_DOCUTILS=$enableval
			   AC_MSG_RESULT([$enableval])],
			  [AC_MSG_RESULT([autodetect])
			   AC_CHECK_PROG(HAVE_DOCUTILS, [rst2html.py], [yes], [no])])
AC_SUBST([HAVE_DOCUTILS])
AM_CONDITIONAL([HAVE_DOCUTILS], test "x$HAVE_DOCUTILS" = "xyes")
dnl }}}

dnl {{{ bash checks, stolen from eselect
unset BASH
AC_PATH_PROGS(BASH, bash)
if test x$BASH = "x" ; then
    AC_MSG_ERROR([bash is required])
fi
dnl }}}

dnl {{{ check for sed
unset SED
AC_PATH_PROGS(SED, sed)
if test x$SED = "x" ; then
	AC_MSG_ERROR([sed is required])
fi
dnl }}}

dnl {{{ substitution macros
CREANDUS_SCRIPTDIR="${datadir}/creandus"
AC_SUBST(CREANDUS_SCRIPTDIR)
CREANDUS_CONFDIR="${sysconfdir}/creandus"
AC_SUBST(CREANDUS_CONFDIR)
dnl }}}

dnl {{{ Generate our Makefiles
AC_OUTPUT(
	Makefile
	bash/Makefile
	bash/auth/Makefile
	bash/common/Makefile
	doc/Makefile
	eselect/Makefile
	)
dnl }}}
