# auth/compat.sh - "compat" backend functions
#
# $Id$

# Expects a valid groupid to have already been determined
groupmod -g "${groupid}" "${NEWGROUP}"
