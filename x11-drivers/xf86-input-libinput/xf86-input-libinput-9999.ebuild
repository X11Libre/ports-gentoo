# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit linux-info xlibre

DESCRIPTION="XLibre input driver based on libinput"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"
fi

RDEPEND=">=dev-libs/libinput-1.23.0:0="
DEPEND="${RDEPEND}
	>=x11-base/xorg-proto-2021.5"

DOCS=( "README.md" )

pkg_pretend() {
	CONFIG_CHECK="~TIMERFD"
	check_extra_config
}
