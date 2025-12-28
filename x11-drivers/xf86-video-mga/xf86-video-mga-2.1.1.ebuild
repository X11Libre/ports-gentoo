# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="Matrox video driver"
HOMEPAGE="https://github.com/X11Libre/xf86-video-mga"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="~alpha amd64 ~loong ppc ppc64 ~sparc x86 ~amd64-linux ~x86-linux"
	KEYWORDS="~amd64"
fi

src_configure() {
	local XLIBRE_CONFIGURE_OPTIONS=(
		--disable-dri
	)
	xlibre_src_configure
}
