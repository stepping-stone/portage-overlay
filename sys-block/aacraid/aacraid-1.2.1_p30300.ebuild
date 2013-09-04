# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit linux-mod rpm

MY_PV="${PV/_p/-}"
MY_P="aacraid-${MY_PV}"

DESCRIPTION="aacraid driver for Adaptec RAID controllers"
HOMEPAGE="http://www.adaptec.com/en-us/downloads/linux_source/linux_source_code/productid=sas-7805&dn=adaptec+raid+7805.html"
SRC_URI="aacraid-linux-src-${MY_PV}.tgz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RESTRICT="mirror"

DEPEND="virtual/linux-sources"
RDEPEND=""

S="${WORKDIR}"

MODULE_NAMES="aacraid(scsi)"

src_unpack() {
	unpack ${A}
	cd "${WORKDIR}"
	srcrpm_unpack ./${MY_P}.src.rpm

	# force compilation of the module for out-of-tree build
	sed -i -e 's|$(CONFIG_SCSI_AACRAID)|m|' Makefile || die "sed failed"

	# Update the module to recent kernels (?)
	sed -i \
		-e 's|__devinitdata||' \
		-e 's|__devexit_p||' \
		-e 's|__devinit||' \
		-e 's|__devexit||' \
		-e '/proc_info/d' \
		linit.c || die "sed failed"

}

pkg_setup() {
	linux-mod_pkg_setup
	BUILD_PARAMS="-C ${KV_DIR} M=${S}"
	BUILD_TARGETS="aacraid.ko"
}
