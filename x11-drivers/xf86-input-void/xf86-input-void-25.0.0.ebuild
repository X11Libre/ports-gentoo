# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit xlibre

DESCRIPTION="null input driver"
HOMEPAGE="https://github.com/X11Libre/xf86-input-void"

if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="~alpha amd64 arm ~arm64 ~hppa ~loong ~m68k ppc ppc64 ~s390 ~sparc x86 ~amd64-linux ~x86-linux"
	KEYWORDS="~amd64 ~arm64"
fi
