# Copyright 1999-2013 FOSS-Group, Germany
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

MY_P="selfcare-${PV}"
YII_PV="1.1.13"

DESCRIPTION="stepping stone Selfcare Webinterface"
HOMEPAGE="https://github.com/stepping-stone/selfcare"
SRC_URI="https://github.com/stepping-stone/selfcare/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND="virtual/httpd-php
	dev-lang/php:5.4
	dev-php/yii:${YII_PV}"

RESTRICT="fetch"

S="${WORKDIR}/${MY_P}"

src_configure() {
	sed -i \
		-e "s|^\$yii=.*|\$yii='/usr/share/php/yii-${YII_PV}/framework/yii.php';|" \
		index.php || die "sed failed"

#	declare -A parameter
#
#	parameter[server]="'ldaps://<FOSS-CLOUD-LDAP-HOSTNAME>/'"
#	parameter[bind_rdn]="'cn=Manager,dc=foss-cloud,dc=org'"
#	parameter[bind_pwd]="'<FOSS-CLOUD-LDAP-PASSWORD>'"
#	parameter[base_dn]="'dc=foss-cloud,dc=org'"
#
#	for k in ${!parameter[@]} ; do
#		sed -i \
#			-e "s|\('${k}' =>\) '.*'|\1 ${parameter[${k}]}|" \
#			vm_config.php || die "sed failed for ${k}"
#	done
#
#	sed -i \
#		-e "s|\('port' =>\) [0-9]*|\1 636|" \
#		vm_config.php || die "sed failed"
}

src_install() {
	dodoc README.md
	rm -rf .gitignore .gitmodules .git
	
	insinto "/var/www/selfcare/htdocs"
    doins -r .

#	fperms 640 "/var/www/localhost/htdocs/vm-manager/vm_config.php"
#	fowners root:apache "/var/www/localhost/htdocs/vm-manager/vm_config.php"

	keepdir /var/www/selfcare/htdocs/{assets,protected/runtime}
	fperms 770 /var/www/selfcare/htdocs/{assets,protected/runtime}
	fowners root:apache /var/www/selfcare/htdocs/{assets,protected/runtime}

#	echo 'CONFIG_PROTECT="/var/www/selfcare/htdocs/vm_config.php"' > "${T}/99${PN}"
#	doenvd "${T}/99${PN}"
}
