# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
# $Id: $

# This is a collection of functions for use in these scripts. Things like
# die(), etc.

## The following is taken from paludis :: ebuild/ebuild.bash.
## Copyright (c) 2006 Ciaran McCreesh <ciaran.mccreesh@blueyonder.co.uk>
## And also from eselect :: libs/core.bash.
## Copyright 2005 Gentoo Foundation.

DYNUSERS_KILL_PID=$$
alias die='diefunc "$FUNCNAME" "$LINENO"'
alias assert='_pipestatus="${PIPESTATUS[*]}"; [[ -z "${_pipestatus//[ 0]/}" ]] || diefunc "$FUNCNAME" "$LINENO" "$_pipestatus"'
trap 'echo "die trap: exiting with error." 1>&2 ; exit 250' 15

export DYNUSERS_PROGRAM_NAME="$0"

diefunc() {
    local func="$1" line="$2" quiet=""
    shift 2
    echo 1>&2
    echo "!!! Error in ${func:-?} at line ${line:-?}" 1>&2
    echo "!!! ${*:-(no message provided)}" 1>&2
    echo 1>&2

    echo "!!! Call stack:" 1>&2
    for (( n = 1 ; n < ${#FUNCNAME[@]} ; ++n )) ; do
        funcname=${FUNCNAME[${n}]}
        sourcefile=${BASH_SOURCE[${n}]}
        lineno=${BASH_LINENO[$(( n - 1 ))]}
        echo "!!!    * ${funcname} (${sourcefile}:${lineno})" 1>&2
    done
    echo 1>&2

    kill ${DYNUSERS_KILL_PID}
    exit 249
}

## END code from paludis
