# Copyright 2013 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

# The base directory of the firewall scripts
SST_FIREWALL_BASE_DIR="/usr/local/scripts/netfilter"

# The "chains" directory of the firewall scripts
SST_FIREWALL_CHAINS_DIR="${SST_FIREWALL_BASE_DIR}/local/chains"

# The path to the initial rule set script
SST_FIREWALL_INIT_RULESET_SCRIPT="${SST_FIREWALL_BASE_DIR}/init-ruleset.sh"

# The path to the script which loads all the chain scripts of this node
SST_FIREWALL_ALL_CHAINS_SCRIPT="${SST_FIREWALL_CHAINS_DIR}/$( /bin/hostname )/all_chains.sh"

# The logger command to which the output of the above scripts will be piped to
SST_FIREWALL_LOGGER_CMD="/usr/bin/logger --tag sst-firewall"
