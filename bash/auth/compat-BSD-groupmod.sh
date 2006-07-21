# auth/compat.sh - "compat" backend functions
#
# $Id$

# Expects a valid groupid to have already been determined
pw groupmod -g "${groupid}" "${NEWGROUP}"
