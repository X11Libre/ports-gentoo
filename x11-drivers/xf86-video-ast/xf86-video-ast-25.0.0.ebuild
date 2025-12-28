# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="XLibre driver for ASpeedTech cards"
HOMEPAGE="https://github.com/X11Libre/xf86-video-ast"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="amd64 ~loong ~ppc ppc64 x86"
	KEYWORDS="~amd64"
fi
