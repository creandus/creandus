#!/bin/bash
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Finds all occurances of @foo@ in the source tree. Only of use to the
# package maintainer.
#
# $Id: $

for x in `find -type f -name "*.in" -not -name "*.svn*"` ; do
	sed -n 's/@[^@ ]*@/\n&\n/gp' ${x} |grep '@[A-Za-z0-9]*@'
done |sort -u
# vim: ts=4 :
