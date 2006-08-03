# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
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

# read_groupdata()
# Inputs:
#  $1 - name of group to be added
# Outputs:
#  $groupid - 
read_groupdata() {
	local groupfile="${DATADIR}/group/${1} ${DATADIR}/accounts"
	local groupid_=
	export groupid=

	for i in ${groupfile}; do
		groupid_=$(grep ^gid: ${i} |cut -d: -f2)
		groupid_=${userid_## }
		groupid=${userid:-${userid_}}
	done
}
