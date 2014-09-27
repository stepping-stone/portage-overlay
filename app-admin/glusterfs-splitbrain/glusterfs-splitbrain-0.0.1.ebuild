# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit distutils-r1

DESCRIPTION="Admin tool to aid in the recovery of split-brain file entries"
HOMEPAGE="https://github.com/joejulian/glusterfs-splitbrain
	http://joejulian.name/blog/glusterfs-split-brain-recovery-made-easy/"
SRC_URI="https://github.com/joejulian/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=""
