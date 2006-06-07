# auth/compat.sh - "compat" backend functions
#
# $Id$

# We make use of egetent:
. common/getent.sh

# adduser_compat() - adds a user to the system using the "compat" backend.
#
# Expects the following variables to already be set:
#
# NEWUSER: the username to be added
# 
adduser_compat() {
	# See if the user already exists
	if [[ ${NEWUSER} == $(egetent passwd "${NEWUSER}" | cut -d: -f1) ]] ;
	then
		# TODO: If there needs to be some change made, note it
		# properly, for the user to take care of later with
		# the eselect tool
		return 0
	fi

	# TODO: Add code to determine a free UID here
	uidmin=${userid%-*}
	uidmax=${userid#*-}

	if [[ -z $(egetent passwd ${uidmin}) ]] ; then
		userid=${uidmin}
	else
		userid=$(( ${usermin} + 1))
		for i in $( seq ${userid} ${uidmax} ) ; do
			[[ -z $(egetent passwd ${i}) ]] && userid=${i} && break
		done
	fi

	# For plain-old Gentoo/Linux
	echo We\'d be doing: useradd -d \"${userhome}\" -G \
	\"${usergroups}\" -s \"${usershell}\" -u \"${userid}\" -c \
	\"${usercomment}\" \"${NEWUSER}\"
}
