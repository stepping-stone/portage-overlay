# Copyright 1999-2014 stepping stone GmbH, Switzerland
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
	>=dev-libs/sst-bash-libs-1.1.0
	>=net-firewall/iptables-1.4.16.3"

S="${WORKDIR}/${P#sst-}"

src_install() {
	diropts -m0750
	insopts -m0640
	exeopts -m0750

	dodir /etc/libvirt/hooks
	exeinto /etc/libvirt/hooks
	doexe etc/libvirt/hooks/{daemon,lxc,qemu}

	dodir /etc/libvirt/hooks-conf.d

	insinto /etc/libvirt/hooks-conf.d
	newins etc/libvirt/hooks-conf.d/10_firewall.conf.example 10_firewall.conf

	dodir /usr/libexec/libvirt-hooks/{daemon.d,lxc.d,qemu.d}

	exeinto /usr/libexec/libvirt-hooks/qemu.d
	doexe usr/libexec/libvirt-hooks/qemu.d/10_firewall.sh

	dodoc README.md
}
