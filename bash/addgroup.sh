#!/bin/bash
#
# addgroup.sh - intelligently adds a new group for the system package
# manager.
#
# $Id$

# Load the basic configuration.
# TODO: Fix this path with autotools.
. common/config.sh

# Read the command line arguments.

# The only options recognized now are the group to be added, the 
# package which is asking for the adding, and the userspace type (e.g. 
# GNU, fbsd, etc)
NEWGROUP="${1}"
PKGNAME="${2}"
USERSPACE="${3}"

if [[ -z "${3}" || -z "${2}" || -z "${1}" ]] ; then
	echo "Script expects 3 arguments: groupname pkgname userspace" >&2
	exit 1
fi

# Set our default action. Will be either "add" or "mod" by the end.
ACTION="add"

###

# Read the proper data file for the desired group
# TODO: Fix this path with autotools.
. common/read_groupdata.sh

# Determine a free uid
# We make use of egetent:
# TODO: Fix this path with autotools.
. common/getent.sh

# TODO: allow for more sophisticated range specifications
gidmin=${groupid%-*}
gidmax=${groupid#*-}

groupid=${gidmin}
for i in $( seq ${groupid} ${gidmax} ) ; do
	[[ -z $(egetent group ${i}) ]] && groupid=${i} && break
done

# Now, we verify this information against our database, and if there
# isn't a match (either some value has changed, or there is no entry
# at all), we take appropriate action

# See if the group already exists
if [[ ${NEWGROUP} == $(egetent group "${NEWGROUP}" | cut -d: -f1) ]] ;
then
	# TODO: If there needs to be some change made, note it
	# properly, for the group to take care of later with
	# the eselect tool
	getentinfo=$(egetent group "${NEWGROUP}")
	
	currgid=$(echo ${getentinfo} | cut -d: -f3)
	if [[ ${currgid} -ne ${groupid} ]] ; then
		echo "The group ${NEWGROUP} needs some values changed."
		echo "We're doing so now."
		ACTION="mod"
	else
		# Now, since we've made the proper arrangements for any 
		# possible changes, we now add the current package name 
		# to the database and call it quits
		echo -n "We already have a group named ${NEWGROUP}." >&2
		echo " Nothing to do." >&2

		echo "${PKGNAME}" >> "${DBDIR}/groups/${NEWGROUP}"
		exit 0
	fi
fi

if [[ -f "${DBDIR}/groups/${NEWGROUP}" ]] ; then
	echo "Group ${NEWGROUP} was previously added by this script," >&2
	echo "but it no longer exists on the system. We'll re-add" >&2
	echo "them now, but you should have used the users-config" >&2
	echo "tool to cleanly remove it." >&2
	echo >&2
fi

# Finally, we take take the necessary action, either via groupmod 
# or groupadd [or it's comparable friends]
for i in ${GROUP_BACKENDS}; do
	# TODO: Fix this path with autotools.
	if [[ -e "auth/${i}-${USERSPACE}-group${ACTION}.sh" ]] ; then
		echo "Running ${i}-${USERSPACE}-group${ACTION}..."
		. "auth/${i}-${USERSPACE}-group${ACTION}.sh"
	else
		echo -n "Auth backend ${i} with " >&2
		echo -n "userspace ${USERSPACE} " >&2
		echo "not supported by this script." >&2
	fi
done

# Properly update the dynamic groups database
echo "${PKGNAME}" >> "${DBDIR}/groups/${NEWGROUP}"
