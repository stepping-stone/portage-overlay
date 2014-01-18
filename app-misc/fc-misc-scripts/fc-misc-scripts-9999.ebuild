# Copyright 1999-2012 FOSS-Group, Germany
# Copyright 2014      stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

DESCRIPTION="FOSS-Cloud miscellaneous scripts"
HOMEPAGE="http://www.foss-cloud.org/"
EGIT_REPO_URI="https://github.com/stepping-stone/misc-scripts.git"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

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
