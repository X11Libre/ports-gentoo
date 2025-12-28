# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="Elographics input driver"
HOMEPAGE="https://github.com/X11Libre/xf86-input-elographics"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~loong ppc ppc64 ~sparc x86"
	KEYWORDS="~amd64 ~arm64"
fi
