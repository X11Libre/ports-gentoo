# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit xlibre

DESCRIPTION="AMD Geode GX and LX graphics driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~x86"
fi
IUSE="ztv"

DEPEND="
	ztv? (
		sys-kernel/linux-headers
	)
"

src_configure() {
	local XLIBRE_CONFIGURE_OPTIONS=(
		$(use_enable ztv)
	)
	xlibre_src_configure
}
