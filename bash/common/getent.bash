# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Based upon the egetent function from eutils.eclass
# Small wrapper for getent (Linux), nidump (Mac OS X),
# and pw (FreeBSD) used in enewuser()/enewgroup()
# Joe Jezak <josejx@gmail.com> and usata@gentoo.org
# FBSD stuff: Aaron Walker <ka0ttic@gentoo.org>
#
# egetent(database, key)
egetent() {
	case ${MACHTYPE} in
	*-darwin*)
		case "$2" in
		*[!0-9]*) # Non numeric
			nidump $1 . | awk -F":" "{ if (\$1 ~ /^$2$/) {print \$0;exit;} }"
			;;
		*)	# Numeric
			nidump $1 . | awk -F":" "{ if (\$3 == $2) {print \$0;exit;} }"
			;;
		esac
		;;
	*-freebsd*|*-dragonfly*)
		local opts action="user"
		[[ $1 == "passwd" ]] || action="group"

		# lookup by uid/gid
		if [[ $2 == [[:digit:]]* ]] ; then
			[[ ${action} == "user" ]] && opts="-u" || opts="-g"
		fi

		pw show ${action} ${opts} "$2" -q
		;;
	*-netbsd*|*-openbsd*)
		grep "$2:\*:" /etc/$1
		;;
	*)
		type -p nscd >& /dev/null && nscd -i "$1"
		getent "$1" "$2"
		;;
	esac
}

