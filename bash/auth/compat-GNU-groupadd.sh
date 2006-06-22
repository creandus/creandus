# auth/compat.sh - "compat" backend functions
#
# $Id$

# This expects ${groupid} and ${NEWGROUP} to be set properly
echo We\'d be doing: groupadd -g \"${groupid}\" \"${NEWGROUP}\"
