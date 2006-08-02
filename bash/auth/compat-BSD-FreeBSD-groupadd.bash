# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# auth/compat.sh - "compat" backend functions
#
# $Id$

# XXX Get this to work with non-/ ROOTs
#pw -V ${ROOT}/etc groupadd -g "${groupid}" "${NEWGROUP}"
pw groupadd "${NEWGROUP}" -g "${groupid}"
