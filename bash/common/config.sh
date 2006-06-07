# config.sh - loads the basic configuration, e.g. which authentication
# system to use.
#
# $Id$

# NSSWITCH_CONF: The nsswitch.conf file, which contains the
# configuration of which backends to use. See nsswitch.conf(5) for
# more info.
NSSWITCH_CONF="/etc/nsswitch.conf"

# DATADIR: The directory where the user and group data is contained.
# In reality this should be the "accounts" directory of their portage
# profile, at least in Gentoo. Other distros would use an appropriate
# directory here.
DATADIR="../data"

# Get a list of the backend databases we're going to use
## TODO: Make these regexps better, more general
PASSWD_BACKENDS=$(grep ^passwd: "${NSSWITCH_CONF}" |cut -d: -f2)
SHADOW_BACKENDS=$(grep ^shadow: "${NSSWITCH_CONF}" |cut -d: -f2)
GROUP_BACKENDS=$(grep ^group: "${NSSWITCH_CONF}" |cut -d: -f2)
