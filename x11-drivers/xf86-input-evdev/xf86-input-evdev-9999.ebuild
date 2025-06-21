# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8


inherit linux-info xlibre

DESCRIPTION="Generic Linux input driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
fi

RDEPEND="
	x11-base/xlibre-server[udev]
	dev-libs/libevdev
	sys-libs/mtdev
	virtual/libudev:="
DEPEND="
	${RDEPEND}
	>=sys-kernel/linux-headers-2.6
	x11-base/xorg-proto"

pkg_pretend() {
	if use kernel_linux ; then
		CONFIG_CHECK="~INPUT_EVDEV"
	fi
	check_extra_config
}
