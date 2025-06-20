# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
X11LIBRE_PACKAGE_NAME="xf86-input-vmmouse"
inherit udev xlibre

DESCRIPTION="VMWare mouse input driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64"
fi

DEPEND="x11-base/xorg-proto"

src_configure() {
	local X11LIBRE_CONFIGURE_OPTIONS=(
		--with-udev-rules-dir=$(get_udevdir)/rules.d
	)
	xlibre_src_configure
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
