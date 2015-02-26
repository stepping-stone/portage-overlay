# Copyright 1999-2013 FOSS-Group, Germany
#                2015 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="virtual package to pull in stoney-cloud packages"
HOMEPAGE="http://www.stoney-cloud.org/"

LICENSE="EUPL"
SLOT="0"
KEYWORDS="amd64"
IUSE="+cifs +ipmi +zabbix"

DEPEND=""
RDEPEND="cifs? ( net-fs/cifs-utils )
	ipmi? ( sys-apps/ipmitool )
	zabbix? ( net-analyzer/zabbix[agent] app-admin/sudo )
	sys-block/nbd
	www-servers/apache[ldap]
	www-apache/mod_umask
	net-nds/openldap
	net-nds/phpldapadmin
	net-dns/pdns-recursor
	app-emulation/ksm
	net-misc/dhcpcd
	net-misc/dhcp
	sys-process/htop
	>=sys-fs/xfsprogs-3.2.2
	>=sys-cluster/glusterfs-3.5.2
	>=app-emulation/qemu-2.1.3
	>=app-emulation/libvirt-1.2.12
	>=net-misc/ucarp-1.5.2-r3
	>=sys-apps/haveged-1.7a
	>=sys-apps/irqbalance-1.0.7
	>=sys-apps/smartmontools-6.1
	>=sys-apps/lm_sensors-3.3.4
	mail-mta/postfix
	>=app-misc/fc-misc-scripts-1.3.0
	~net-nds/sst-ldap-schemas-1.2.16
	>=sys-apps/fc-node-integration-1.2.18.11
	>=sys-apps/fc-prov-backup-kvm-1.0.11.6
	~x11-themes/fc-artwork-1.0.4
	>=www-apps/vm-manager-1.2.18.20
	>=sys-apps/fc-configuration-1.2.16.18
	>=sys-kernel/foss-cloud-bin-3.10.69
	>=net-firewall/sst-netfilter-scripts-0.1.0
"

S="${WORKDIR}"

src_compile() {
	echo "${PV}" > "stoney-cloud_version"

	cat > "os-release" << EOF
NAME=stoney-cloud
VERSION="${PV}"
ID=stoney-cloud
EOF

	echo 'CONFIG_PROTECT_MASK="/etc/os-release /etc/stoney-cloud_version"' > 99stoney-cloud
}

src_install() {
	insinto /etc
	doins stoney-cloud_version os-release
	dosym stoney-cloud_version /etc/foss-cloud_version
	doenvd 99stoney-cloud
}
