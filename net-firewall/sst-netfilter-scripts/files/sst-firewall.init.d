#!/sbin/runscript
# Copyright 2013 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

name="sst-firewall"
description="stepping stone netfilter initialization"


required_dirs="${SST_FIREWALL_BASE_DIR} ${SST_FIREWALL_CHAINS_DIR}"

required_files="${SST_FIREWALL_INIT_RULESET_SCRIPT}
                ${SST_FIREWALL_ALL_CHAINS_SCRIPT}"

depend() {
	need localmount
	use logger
	before net
}

start() {
	ebegin "Starting ${RC_SVCNAME}"
	
	einfo "Loading initial rule set of ${RC_SVCNAME}"
	${SST_FIREWALL_INIT_RULESET_SCRIPT} 2>&1 | ${SST_FIREWALL_LOGGER_CMD}
	eend ${PIPESTATUS[0]} \
		"Loading failed, check your syslog for details" || return 1

	einfo "Loading all local chains of ${RC_SVCNAME}"
	${SST_FIREWALL_ALL_CHAINS_SCRIPT} 2>&1 | ${SST_FIREWALL_LOGGER_CMD}
	eend ${PIPESTATUS[0]} "Loading failed, check your syslog for details"
}

stop() {
	# We have no need/support for unloading the rules at the moment.
	eerror "Stopping ${RC_SVCNAME} is not supported"
}
