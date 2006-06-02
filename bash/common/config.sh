#!/bin/bash
#
# config.sh - loads the basic configuration, e.g. which authentication
# system to use.
#
# $Id$

# NSSWITCH_CONF: The nsswitch.conf file, which contains the
# configuration of which backends to use. See nsswitch.conf(5) for
# more info.

#NSSWITCH_CONF="/etc/nsswitch.conf"
NSSWITCH_CONF="./foo"

# Get a list of the backend databases we're going to use
PASSWD_BACKENDS=`grep ^passwd "${NSSWITCH_CONF}" |cut -d: -f2`
SHADOW_BACKENDS=`grep ^shadow "${NSSWITCH_CONF}" |cut -d: -f2`

echo -n "PASSWD backends:"
for i in ${PASSWD_BACKENDS}; do
  echo -n " \"${i}\"" ;
done
echo

echo -n "SHADOW backends:"
for i in ${SHADOW_BACKENDS}; do
  echo -n " \"${i}\"" ;
done
echo
