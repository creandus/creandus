# auth/compat.sh - "compat" backend functions
#
# $Id$

# adduser_compat() - adds a user to the system using the "compat" backend.
#
# Expects the following variables to already be set:
#
# NEWUSER: the username to be added
# 
adduser_compat() {
    # TODO: Add code to determine a free UID here

    # For plain-old Gentoo/Linux
    echo We\'d be doing: useradd -d \"${userhome}\" -G \"${usergroups}\" -s \"${usershell}\" -u \"${userid}\" -c \"${usercomment}\" \"${NEWUSER}\"
}
