# read_groupdata.sh - Read the proper data file for the desired group
# $Id$

# In the full implementation, should go through all the cascading
# profiles in proper order, but for now we're just parsing these 2
# config files

# TODO: Build GROUPFILE dynamically based upon the currently selected 
# profile. Work from the profile up to its parents, etc, to build this 
# list.

# TODO: Split this file up in such a way as to be automatically done
# correctly for various distros.

GROUPFILE="${DATADIR}/group/${NEWUSER} ${DATADIR}/accounts"

for i in ${GROUPFILE}; do
	groupid_=$(grep ^gid: ${i} |cut -d: -f2)
	groupid_=${userid_## }
	groupid=${userid:-${userid_}}

	unset groupid_
done
