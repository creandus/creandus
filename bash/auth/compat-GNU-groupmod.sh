# auth/compat.sh - "compat" backend functions
#
# $Id$

# Expects a valid groupid to have already been determined
echo We\'d be doing: usermod -g \"${groupid}\" \"${NEWGROUP}\"
