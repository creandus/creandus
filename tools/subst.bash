#!/bin/bash
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Substitutes any @foo@ type words in the given file with the proper shell
# variable.
#
# $Id$

main() {
	local top_srcdir=${1} top_builddir=${2} infile=${3} outfile=${4}
	local tmpfile=`mktemp`
	local macros=$("${top_srcdir}/tools/get_autoconf_macros.sed" ${infile}\
		|grep '@[A-Za-z0-9_]*@' |sed s/@//g |sort -u)
	local x val_of_x

	# Read the various variables we'll be using from config.log
	local confvars=`mktemp`
	# Get the top and bottom lines of our range:
	local topline=$(grep -n '^## Output variables. ##$' \
		"${top_builddir}/config.log" |cut -d: -f1)
	local bottomline=$(grep -n '^## confdefs.h. ##$' \
		"${top_builddir}/config.log" |cut -d: -f1)
	bottomline=$((${bottomline}-2))

	# About this sed mess:
	# This will take only the part of the config.log which has the output
	# variables in it, then replace the "'"s around every variable
	# definition with '"'s, so that we actually evaluate all the variables
	# in there when we source it. Then, we replace the ()s with {}s, since
	# the only place i see the $() syntax used it seems to refer to another
	# variable (probably it is just that way to match Makefile syntax).
	sed -n -e ${topline},${bottomline}p\
		"${top_builddir}/config.log" \
		|sed -e s/\'/\"/g \
		|sed -e 's/\$[(]\([^)]*\)[)]/${\1}/g' \
		>"${confvars}" || exit 1
	# Why 5 passes here? To be sure we totally figure out any variables.
	. "${confvars}" || exit 1
	. "${confvars}" || exit 1
	. "${confvars}" || exit 1
	. "${confvars}" || exit 1
	. "${confvars}" || exit 1
	rm "${confvars}"

	cp "${infile}" "${tmpfile}"

	for x in ${macros} ; do
		# This eval is 'safe' since the value of x is guaranteed to
		# contain nothing but [[:alnum:]]*
		eval val_of_x='$'${x}
		val_of_x=`echo ${val_of_x} |sed 's/\//\\\\\//g'` || exit 1
		sed -i -e "s/@${x}@/${val_of_x}/g" "${tmpfile}" || exit 1
	done

	mv "${tmpfile}" "${outfile}"
}

if [[ "${1}" == "--test" ]] ; then
	echo "Syntax OK."
	exit 0
fi

main $@
# vim: ts=4 :
