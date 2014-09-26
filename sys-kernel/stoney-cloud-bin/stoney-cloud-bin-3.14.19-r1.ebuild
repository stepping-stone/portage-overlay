# Copyright 1999-2014 stepping stone GmbH, Switzerland
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit mount-boot versionator

MY_P="stoney-cloud-${PV}"

G_V="$(get_version_component_range 4)"
SUFFIX="x86_64-$(get_version_component_range 1-3)-gentoo${G_V:+-r${G_V}}"

DESCRIPTION="stoney cloud kernel, modules and initramfs binaries."
HOMEPAGE="https://www.stoney-cloud.org.org/"
SRC_URI="http://packages.stoney-cloud.org/distfiles/stoney-cloud-kernel-${PVR}.tbz2
	http://packages.stoney-cloud.org/distfiles/stoney-cloud-modules-${PVR}.tbz2"

LICENSE="GPL-2"
SLOT="${PV}"
KEYWORDS="amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_install() {
	insinto /boot
	for i in config initramfs kernel System.map ; do
		newins "${i}-"* "${i}-stoney-cloud-${SUFFIX}"
	done

	insinto /lib
	doins -r lib/modules 
}

pkg_postinst() {
	# remove old symlinks
	rm -f /boot/{initramfs,kernel,System.map,config}.old

	# rename current symlinks to old and add new ones
	for f in initramfs kernel System.map config ; do
		[ -h "/boot/${f}" ] && mv "/boot/${f}" "/boot/${f}.old"
		ln -sf "${f}-stoney-cloud-${SUFFIX}" /boot/${f}
	done

	mount-boot_pkg_postinst
}
