# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_COMMIT="f4a7b10971"

inherit git-2

DESCRIPTION=" Make reports in PDF, ODT, and DOC formats using an ODT template file."
HOMEPAGE="https://github.com/IvanGuardado/PHP-Easy-Report"
EGIT_REPO_URI="https://github.com/IvanGuardado/PHP-Easy-Report.git"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

DEPEND=""
RDEPEND="dev-lang/php[zip]
	app-office/unoconv"

src_install() {
	insinto "/usr/share/php/${PN}"
	doins -r src/*

	dodoc README.md
	use examples && dodoc -r demo
}
