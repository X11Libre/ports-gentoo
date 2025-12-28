# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="Silicon Motion video driver"
HOMEPAGE="https://github.com/X11Libre/xf86-video-siliconmotion"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="amd64 ~mips x86"
	KEYWORDS="~amd64"
fi
