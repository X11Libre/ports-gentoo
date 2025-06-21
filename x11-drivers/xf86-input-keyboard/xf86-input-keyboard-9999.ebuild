# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xlibre

DESCRIPTION="Keyboard input driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~alpha amd64 arm arm64 ~hppa ~mips ppc ppc64 sparc x86 ~amd64-linux ~x86-linux"
fi

RDEPEND="x11-base/xlibre-server"
DEPEND="${RDEPEND}"
