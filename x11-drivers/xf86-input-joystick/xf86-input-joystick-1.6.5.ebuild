# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="XLibre driver for joystick input devices"
HOMEPAGE="https://github.com/X11Libre/xf86-input-joystick"

if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~loong ~m68k ppc ppc64 ~sparc x86"
	KEYWORDS="~amd64 ~arm64"
fi

src_install() {
	xlibre_src_install

	insinto /usr/share/X11/xorg.conf.d
	doins config/50-joystick-all.conf
}
