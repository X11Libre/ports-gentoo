# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_DRI="always"

inherit xlibre

if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64 ~arm64 ~loong ~ppc64 ~riscv ~x86"
fi

DESCRIPTION="Accelerated Open Source driver for AMDGPU cards"

IUSE="udev"

RDEPEND=">=x11-libs/libdrm-2.4.89[video_cards_amdgpu]
	x11-base/xlibre-server[-minimal]
	udev? ( virtual/libudev:= )"
DEPEND="${RDEPEND}"

src_configure() {
	local XLIBRE_CONFIGURE_OPTIONS=(
		--enable-glamor
		$(use_enable udev)
	)
	xlibre_src_configure
}
