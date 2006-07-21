# auth/files.sh - "files" backend functions
#
# $Id$

# This expects ${groupid} and ${NEWGROUP} to be set properly
groupadd -g "${groupid}" "${NEWGROUP}"
