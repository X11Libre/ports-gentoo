# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XLIBRE_DRI="always"
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="Accelerated Open Source driver for nVidia cards"
HOMEPAGE="
	https://nouveau.freedesktop.org/
	https://github.com/X11Libre/xf86-video-nouveau
"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="amd64 ~arm64 ~loong ppc ppc64 ~riscv x86"
	KEYWORDS="~amd64 ~arm64"
fi

RDEPEND=">=x11-libs/libdrm-2.4.60[video_cards_nouveau]
	virtual/libudev:="
DEPEND="${RDEPEND}"
