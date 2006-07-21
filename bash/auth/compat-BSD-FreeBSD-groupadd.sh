# auth/compat.sh - "compat" backend functions
#
# $Id$

# XXX Get this to work with non-/ ROOTs
#pw -V ${ROOT}/etc groupadd -g "${groupid}" "${NEWGROUP}"
pw groupadd "${NEWGROUP} "-g "${groupid}"
