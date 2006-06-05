#!/bin/bash
#
# adduser.sh - intelligently adds a new user for the system package
# manager.
#
# $Id$

# Load the basic configuration.
. common/config.sh

# Read the command line arguments.

# The only option recognized now is the user to be added.
NEWUSER="${1}"
###

# Read the proper data file for the desired user

# In the full implementation, should go through all the cascading
# profiles in proper order, but for now we're just parsing these 2
# config files

# TODO: Build USERFILE dynamically based upon the currently selected profile.
# Work from the profile up to its parents, etc, to build this list.
USERFILE="${DATADIR}/user/${NEWUSER} ${DATADIR}/accounts"

for i in ${USERFILE}; do
    userid_=$(grep ^uid: ${i} |cut -d: -f2)
    userid_=${userid_## }
    userid=${userid:-${userid_}}

    usershell_=$(grep ^shell: "${i}" |cut -d: -f2)
    usershell_=${usershell_## }
    usershell=${usershell:-${usershell_}}

    userhome_=$(grep ^home: "${i}" |cut -d: -f2)
    userhome_=${userhome_## }
    userhome=${userhome:-${userhome_}}

    usergroups_=$(grep ^groups: "${i}" |cut -d: -f2)
    usergroups_=${usergroups_## }
    usergroups=${usergroups:-${usergroups_}}

    usercomment_=$(grep ^comment: "${i}" |cut -d: -f2)
    usercomment_=${usercomment_## }
    usercomment=${usercomment:-${usercomment_}}

    unset userid_ usershell_ userhome_ usergroups_ usercomment_
done

# Now, we would verify this information against our database, and if
# there isn't a match [either some value has changed, or there is no
# entry at all], we take appropriate action

## TODO: Insert database checking code here

# Finally, we take take the necessary action, either via usermod or
# useradd [or it's comparable friends]

## TODO: Add code for knowing when we are modifying, not adding

for i in ${PASSWD_BACKENDS}; do
    case ${i} in
	compat)
	    . "auth/${i}.sh"
	    adduser_compat
	    ;;
	*)
	    echo "ERROR: Auth mechanism \"${i}\" not supported by this script."
	    return 1
	    ;;
    esac
done

