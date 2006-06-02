# auth/compat.sh - "compat" backend functions
#
# $Id$

# adduser_compat() - adds a user to the system using the "compat" backend
# all arguments are required
adduser_compat() {
}

# Adapted from enewuser, by vapier@gentoo.org
#
# adduser_compat(username, uid, shell, homedir, groups, extra options)
#
# Default values if you do not specify any:
# username:	REQUIRED !
# uid:		next available (see useradd(8))
#		note: pass -1 to get default behavior
# shell:	/bin/false
# homedir:	/dev/null
# groups:	none
# extra:	comment of 'added by portage for ${PN}'
adduser_compat() {
	# get the username
	local euser=$1; shift
	if [[ -z ${euser} ]] ; then
		eerror "No username specified !"
		die "Cannot call enewuser without a username"
	fi

	# lets see if the username already exists
	if [[ ${euser} == $(egetent passwd "${euser}" | cut -d: -f1) ]] ; then
		return 0
	fi
	einfo "Adding user '${euser}' to your system ..."

	# options to pass to useradd
	local opts=

	# handle uid
	local euid=$1; shift
	if [[ ! -z ${euid} ]] && [[ ${euid} != "-1" ]] ; then
		if [[ ${euid} -gt 0 ]] ; then
			if [[ ! -z $(egetent passwd ${euid}) ]] ; then
				euid="next"
			fi
		else
			eerror "Userid given but is not greater than 0 !"
			die "${euid} is not a valid UID"
		fi
	else
		euid="next"
	fi
	if [[ ${euid} == "next" ]] ; then
		for euid in $(seq 101 999) ; do
			[[ -z $(egetent passwd ${euid}) ]] && break
		done
	fi
	opts="${opts} -u ${euid}"
	einfo " - Userid: ${euid}"

	# handle shell
	local eshell=$1; shift
	if [[ ! -z ${eshell} ]] && [[ ${eshell} != "-1" ]] ; then
		if [[ ! -e ${ROOT}${eshell} ]] ; then
			eerror "A shell was specified but it does not exist !"
			die "${eshell} does not exist in ${ROOT}"
		fi
		if [[ ${eshell} == */false || ${eshell} == */nologin ]] ; then
			eerror "Do not specify ${eshell} yourself, use -1"
			die "Pass '-1' as the shell parameter"
		fi
	else
		for shell in /sbin/nologin /usr/sbin/nologin /bin/false /usr/bin/false /dev/null ; do
			[[ -x ${ROOT}${shell} ]] && break
		done

		if [[ ${shell} == "/dev/null" ]] ; then
			eerror "Unable to identify the shell to use"
			die "Unable to identify the shell to use"
		fi

		eshell=${shell}
	fi
	einfo " - Shell: ${eshell}"
	opts="${opts} -s ${eshell}"

	# handle homedir
	local ehome=$1; shift
	if [[ -z ${ehome} ]] || [[ ${ehome} == "-1" ]] ; then
		ehome="/dev/null"
	fi
	einfo " - Home: ${ehome}"
	opts="${opts} -d ${ehome}"

	# handle groups
	local egroups=$1; shift
	if [[ ! -z ${egroups} ]] ; then
		local oldifs=${IFS}
		local defgroup="" exgroups=""

		export IFS=","
		for g in ${egroups} ; do
			export IFS=${oldifs}
			if [[ -z $(egetent group "${g}") ]] ; then
				eerror "You must add group ${g} to the system first"
				die "${g} is not a valid GID"
			fi
			if [[ -z ${defgroup} ]] ; then
				defgroup=${g}
			else
				exgroups="${exgroups},${g}"
			fi
			export IFS=","
		done
		export IFS=${oldifs}

		opts="${opts} -g ${defgroup}"
		if [[ ! -z ${exgroups} ]] ; then
			opts="${opts} -G ${exgroups:1}"
		fi
	else
		egroups="(none)"
	fi
	einfo " - Groups: ${egroups}"

	# handle extra and add the user
	local oldsandbox=${SANDBOX_ON}
	export SANDBOX_ON="0"
	case ${CHOST} in
	*-darwin*)
		### Make the user
		if [[ -z $@ ]] ; then
			dscl . create /users/${euser} uid ${euid}
			dscl . create /users/${euser} shell ${eshell}
			dscl . create /users/${euser} home ${ehome}
			dscl . create /users/${euser} realname "added by portage for ${PN}"
			### Add the user to the groups specified
			local oldifs=${IFS}
			export IFS=","
			for g in ${egroups} ; do
				dscl . merge /groups/${g} users ${euser}
			done
			export IFS=${oldifs}
		else
			einfo "Extra options are not supported on Darwin yet"
			einfo "Please report the ebuild along with the info below"
			einfo "eextra: $@"
			die "Required function missing"
		fi
		;;
	*-freebsd*|*-dragonfly*)
		if [[ -z $@ ]] ; then
			pw useradd ${euser} ${opts} \
				-c "added by portage for ${PN}" \
				die "enewuser failed"
		else
			einfo " - Extra: $@"
			pw useradd ${euser} ${opts} \
				"$@" || die "enewuser failed"
		fi
		;;

	*-netbsd*)
		if [[ -z $@ ]] ; then
			useradd ${opts} ${euser} || die "enewuser failed"
		else
			einfo " - Extra: $@"
			useradd ${opts} ${euser} "$@" || die "enewuser failed"
		fi
		;;

	*-openbsd*)
		if [[ -z $@ ]] ; then
			useradd -u ${euid} -s ${eshell} \
				-d ${ehome} -c "Added by portage for ${PN}" \
				-g ${egroups} ${euser} || die "enewuser failed"
		else
			einfo " - Extra: $@"
			useradd -u ${euid} -s ${eshell} \
				-d ${ehome} -c "Added by portage for ${PN}" \
				-g ${egroups} ${euser} "$@" || die "enewuser failed"
		fi
		;;

	*)
		if [[ -z $@ ]] ; then
			useradd ${opts} ${euser} \
				-c "added by portage for ${PN}" \
				|| die "enewuser failed"
		else
			einfo " - Extra: $@"
			useradd ${opts} ${euser} "$@" \
				|| die "enewuser failed"
		fi
		;;
	esac

	if [[ ! -e ${ROOT}/${ehome} ]] ; then
		einfo " - Creating ${ehome} in ${ROOT}"
		mkdir -p "${ROOT}/${ehome}"
		chown ${euser} "${ROOT}/${ehome}"
		chmod 755 "${ROOT}/${ehome}"
	fi

	export SANDBOX_ON=${oldsandbox}
}
