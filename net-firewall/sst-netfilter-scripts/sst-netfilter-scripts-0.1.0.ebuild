# Copyright 2013 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="stepping stone netfilter generator scripts"
HOMEPAGE="http://www.stepping-stone.ch"
SRC_URI=""

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=net-firewall/iptables-1.4.16.3"

S="${WORKDIR}"

# At the moment only an init-script will be installed, which loads the firewall
# framework and the rules required by the node. In a later step, this ebuild
# will also install the actual rule generator scripts.
src_install() {
	newinitd "${FILESDIR}/sst-firewall.init.d" "sst-firewall"
	newconfd "${FILESDIR}/sst-firewall.conf.d" "sst-firewall"
}
