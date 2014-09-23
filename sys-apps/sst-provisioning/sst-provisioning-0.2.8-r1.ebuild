# Copyright 1999-2014 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit perl-module

MY_PN="Provisioning"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="stepping stone GmbH Provisioning scripts"
HOMEPAGE="http://www.stepping-stone.ch/"
SRC_URI="http://github.com/stepping-stone/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE="kvm-backup ox"

DEPEND=""
RDEPEND="virtual/perl-Sys-Syslog
	virtual/perl-Getopt-Long
	virtual/perl-Module-Load
	virtual/perl-File-Path
	dev-perl/Config-IniFiles
	dev-perl/LockFile-Simple
	dev-perl/perl-ldap
	dev-perl/Net-SMTPS
	dev-perl/Net-OpenSSH
	dev-perl/Text-CSV-Encoded
	dev-perl/IO-String
	dev-perl/Switch
	kvm-backup? ( dev-perl/Sys-Virt )
	ox? ( dev-perl/Crypt-GeneratePassword )"

S="${WORKDIR}/${MY_P}"

# TODO:
# * Crypt-GeneratePassword dependency missing for Provisioning/lib/Provisioning/Groupware/OX/OXAccount.pm

src_install() {
	insinto ${VENDOR_LIB}
	doins -r lib/Provisioning

	dobin bin/*.pl

	insopts -m0640
	insinto /etc
	doins -r etc/Provisioning

	dodoc README.md
}
