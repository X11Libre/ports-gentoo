# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XLIBRE_DRI=always

inherit xlibre

DESCRIPTION="VMware SVGA video driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

RDEPEND="
	kernel_linux? (
		>=x11-libs/libdrm-2.4.96[video_cards_vmware]
		media-libs/mesa
	)"
DEPEND="${RDEPEND}"
