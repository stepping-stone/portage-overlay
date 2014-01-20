# Copyright 1999-2012 FOSS-Group, Germany
# Copyright 2014      stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="FOSS-Cloud miscellaneous scripts"
HOMEPAGE="http://www.foss-cloud.org/"
SRC_URI="http://github.com/stepping-stone/${PN#fc-}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=">=dev-libs/sst-bash-libs-1.0.2"

S="${WORKDIR}/${P#fc-}"

src_install() {
	exeinto /usr/libexec/foss-cloud
	doexe usr/libexec/foss-cloud/*.sh

	exeinto /usr/libexec/ucarp-hooks
	doexe usr/libexec/ucarp-hooks/ucarp-hook-dispatcher.sh

	exeinto /usr/libexec/ucarp-hooks/available
	doexe usr/libexec/ucarp-hooks/available/*.sh

	insinto /usr/libexec/ucarp-hooks/active
	doins -r usr/libexec/ucarp-hooks/active/*

	insinto /etc
	doins -r etc/{foss-cloud,local.d}

	exeinto /etc/portage/postsync.d
	doexe etc/portage/postsync.d/sync-overlays

	insinto /usr/share
	doins -r usr/share/foss-cloud
}
