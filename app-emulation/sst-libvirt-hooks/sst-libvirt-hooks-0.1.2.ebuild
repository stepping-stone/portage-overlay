# Copyright 1999-2013 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="stepping stone libvirt-hook scripts"
HOMEPAGE="https://github.com/stepping-stone/libvirt-hooks"
SRC_URI="http://github.com/stepping-stone/${PN#sst-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=app-emulation/libvirt-0.8.0
	>=dev-libs/sst-bash-libs-0.1.1
	>=net-firewall/iptables-1.4.16.3"

S="${WORKDIR}/${P#sst-}"

src_install() {
	doins -r etc
	fperms 0750 /etc/libvirt/hooks/{daemon,lxc,qemu}

	dodir /usr/libexec/libvirt-hooks/{daemon.d,lxc.d,qemu.d}

	exeinto /usr/libexec/libvirt-hooks/qemu.d
	doexe usr/libexec/libvirt-hooks/qemu.d/10_firewall.sh

	dodoc README.md
}
