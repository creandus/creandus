# auth/files.sh - "files" backend functions
#
# $Id$

# adduser_files() - adds a user to the system using the "files" backend.
#
# Expects the following variables to already be set:
#
# NEWUSER: the username to be added
# 
# Expects a valid userid to have already been determined
echo We\'d be doing: useradd -d \"${userhome}\" -G \
\"${usergroups}\" -s \"${usershell}\" -u \"${userid}\" -c \
\"${usercomment}\" \"${NEWUSER}\"
