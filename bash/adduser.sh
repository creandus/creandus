#!/bin/bash
#
# adduser.sh - intelligently adds a new user for the system package
# manager.
#
# $Id$

# Load the basic configuration.
. common/config.sh

# Read the command line arguments.

# The only options recognized now are the user to be added, the 
# package which is asking for the adding, and the userspace type (e.g. 
# GNU, fbsd, etc)
NEWUSER="${1}"
PKGNAME="${2}"
USERSPACE="${3}"

###

# Read the proper data file for the desired user
. common/read_userdata.sh

# Now, we verify this information against our database, and if there
# isn't a match (either some value has changed, or there is no entry
# at all), we take appropriate action

# We make use of egetent:
. common/getent.sh

# See if the user already exists
if [[ ${NEWUSER} == $(egetent passwd "${NEWUSER}" | cut -d: -f1) ]] ;
then
	# TODO: If there needs to be some change made, note it
	# properly, for the user to take care of later with
	# the eselect tool

	# Now, since we've made the proper arrangements for any possible 
	# changes, we now add the current package name to the database 
	# and call it quits
	echo -n "We already have a user named ${NEWUSER}." >&2
	echo " Doing nothing, for now." >&2
	
	echo "${PKGNAME}" >> "${DBDIR}/users/${NEWUSER}"
	exit 0
fi
# TODO: Add code to determine a free UID here
uidmin=${userid%-*}
uidmax=${userid#*-}

if [[ -z $(egetent passwd ${uidmin}) ]] ; then
	userid=${uidmin}
else
	userid=$(( ${usermin} + 1))
	for i in $( seq ${userid} ${uidmax} ) ; do
		[[ -z $(egetent passwd ${i}) ]] && userid=${i} && break
	done
fi

if [[ -f "${DBDIR}/users/${NEWUSER}" ]] ; then
	# So, we know this user already exists. At the end of this 
	# script, we need to be sure to add the current package to this 
	# file.

	# TODO: We need to see if the user matches what it should. If 
	# not, inform the operator of what changes must be made.
	echo "User already exists. Doing nothing [for now]" >&2
else
	# Finally, we take take the necessary action, either via usermod 
	# or useradd [or it's comparable friends]

	for i in ${PASSWD_BACKENDS}; do
		if [[ -e "auth/${i}-linux-user.sh" ]] ; then
			echo "Running ${i}..."
			. "auth/${i}-${USERSPACE}-user.sh"
		else
			echo -n "Auth backend ${i} not " >&2
			echo "supported by this script." >&2
		fi
	done
fi

# Properly update the dynamic users database
echo "${PKGNAME}" >> "${DBDIR}/users/${NEWUSER}"
