#!/bin/bash
#
# adduser.sh - intelligently adds a new user for the system package
# manager.
#
# $Id$

# Load the basic configuration.
. common/config.sh

# Read the command line arguments.

# The only option recognized now is the user to be added.
NEWUSER="${1}"
###

# Read the proper data file for the desired user
. "${DATADIR}/user/${NEWUSER}"

