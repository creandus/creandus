#!/bin/bash
# Copyright 2006 Mike Kelly
# Distributed under the terms of the GNU General Public License v2
#
# Runs tests on all the frontend scripts, mainly intending to catch syntax
# errors.
#
# $Id: $

echo "Testing \"${1}\":"
bash ${1} --test
