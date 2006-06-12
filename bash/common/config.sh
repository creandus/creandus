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
#DATADIR="/etc/make.profile"
DATADIR="../../data"

# DBDIR: The directory which contains the database of auto-added users. 
# It is made up of a list of files in 2 subdirs, users and groups, named 
# for the added user or group. Each line of the file contains the full 
# package name and version as given by the package management system. 
# When a package is uninstalled, it should be removed from any of these 
# files. Then, the userspace update-users [or similar] script can 
# properly know when a dynamically-added user can be removed from the 
# system.
#DBDIR="/var/db/dynusers"
DBDIR="../../db"

# Get a list of the backend databases we're going to use
## TODO: Make these regexps better, more general
PASSWD_BACKENDS=$(grep ^passwd: "${NSSWITCH_CONF}" |cut -d: -f2)
SHADOW_BACKENDS=$(grep ^shadow: "${NSSWITCH_CONF}" |cut -d: -f2)
GROUP_BACKENDS=$(grep ^group: "${NSSWITCH_CONF}" |cut -d: -f2)
