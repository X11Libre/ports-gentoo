# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit udev xlibre

DESCRIPTION="VMWare mouse input driver"
HOMEPAGE="https://github.com/X11Libre/xf86-input-vmmouse"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="~amd64 ~x86"
	KEYWORDS="~amd64"
fi

DEPEND="x11-base/xorg-proto"

src_configure() {
	local XLIBRE_CONFIGURE_OPTIONS=(
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
