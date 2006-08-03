#!/bin/bash
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Substitutes any @foo@ type words in the given file with the proper shell
# variable.
#
# $Id: $

main() {
	local top_srcdir=${1} infile=${2} outfile=${3} tmpfile=`mktemp`
	local macros=$("${top_srcdir}/tools/get_autoconf_macros.sed" ${infile})
	local x val_of_x

	# Read the various variables we'll be using from config.log
	local confvars=`mktemp`
	# Get the top and bottom lines of our range:
	local topline=$(grep -n '^## Output variables. ##$' \
		"${top_srcdir}/config.log" |cut -d: -f1)
	local bottomline=$(grep -n '^## confdefs.h. ##$' \
		"${top_srcdir}/config.log" |cut -d: -f1)
	bottomline=$((${bottomline}-2))

	# About this sed mess:
        # This will take only the part of the config.log which has the output
        # variables in it, then replace the "'"s around every variable
        # definition with '"'s, so that we actually evaluate all the variables
        # in there when we source it. Then, we cut out any lines with $(foo)
        # style statements, since we don't wanna actually run anything
        # (although, really, we should just replace the ()s with {}s, since the
        # only place i see the $() syntax used it seems to refer to another
        # variable (probably it is just that way to match Makefile syntax).
	sed -n -e ${topline},${bottomline}p\
		"${top_srcdir}/config.log" \
		| sed s/\'/\"/g \
		| grep -v '$[(]' \
		>"${confvars}" || exit 1
	. "${confvars}" || exit 1
	rm "${confvars}"

	cp "${infile}" "${tmpfile}"

	for x in ${macros} ; do
		# This eval is 'safe' since the value of x is guaranteed to
		# contain nothing but [[:alnum:]]*
		eval val_of_x='$'${x}
		sed -i -e "s,@${x}@,${val_of_x},g" "${tmpfile}" || exit 1
	done

	mv "${tmpfile}" "${outfile}"
}

if [[ "${1}" == "--test" ]] ; then
	echo "Syntax OK."
	exit 0
fi

main $@
