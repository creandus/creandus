#!/bin/bash
#
# adduser.sh - intelligently adds a new user for the system package
# manager.
#
# $Id$

# Load the basic configuration.
. common/config.sh

# Read the command line arguments.

# The only options recognized now are the user to be added and the 
# package which is doing the adding.
NEWUSER="${1}"
PKGNAME="${2}"

###

# Read the proper data file for the desired user
. common/read_userdata.sh

# Now, we verify this information against our database, and if there
# isn't a match (either some value has changed, or there is no entry
# at all), we take appropriate action

if [[ -f "${DBDIR}/users/${NEWUSER}" ]] ; then
	# So, we know this user already exists. At the end of this 
	# script, we need to be sure to add the current package to this 
	# file.

	# TODO: We need to see if the user matches what it should. If 
	# not, inform the operator of what changes must be made.
	echo "User already exists. Doing nothing [for now]"
else
	# Finally, we take take the necessary action, either via usermod 
	# or useradd [or it's comparable friends]

	## TODO: Add code for knowing when we are modifying, not adding

	for i in ${PASSWD_BACKENDS}; do
		case ${i} in
			compat)
				. "auth/${i}.sh"
				adduser_compat
				;;
			*)
				echo -n "ERROR: Auth mechanism \"${i}\""
				echo	" not supported by this script."
				return 1
				;;
		esac
	done
fi

# Properly update the dynamic users database
echo "${PKGNAME}" >> "${DBDIR}/users/${NEWUSER}"
