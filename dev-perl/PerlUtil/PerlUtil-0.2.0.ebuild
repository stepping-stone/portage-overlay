# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit perl-module

DESCRIPTION="Some helpful basic perl libraries"
HOMEPAGE="https://github.com/stepping-stone/perl-utils"
SRC_URI="http://github.com/stepping-stone/perl-utils/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL-1.1"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

RDEPEND="virtual/perl-Switch
	virtual/perl-Sys-Syslog
	dev-perl/perl-ldap"
DEPEND=""

RESTRICT="fetch"

S="${WORKDIR}/perl-utils-${PV}"

src_install() {
	insinto "${VENDOR_LIB}"
	doins -r lib/PerlUtil

	dodoc README.md
}
