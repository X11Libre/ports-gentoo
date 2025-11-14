# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XLIBRE_DRI=always
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="VMware SVGA video driver"
HOMEPAGE="https://github.com/X11Libre/xf86-video-vmware"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="amd64 ~arm64 x86"
	KEYWORDS="~amd64 ~arm64"
fi

RDEPEND="
	kernel_linux? (
		>=x11-libs/libdrm-2.4.96[video_cards_vmware]
		media-libs/mesa[xa]
	)"
DEPEND="${RDEPEND}"
