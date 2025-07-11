# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-info xlibre

DESCRIPTION="Driver for Synaptics touchpads"
HOMEPAGE="https://github.com/X11Libre/xf86-input-synaptics"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~x86"
fi

RDEPEND="
	x11-base/xlibre-server:=
	x11-libs/libX11
	>=x11-libs/libXi-1.2
	>=x11-libs/libXtst-1.1.0
	kernel_linux? ( >=dev-libs/libevdev-0.4 )"
DEPEND="
	${RDEPEND}
	>=sys-kernel/linux-headers-2.6.37
	x11-base/xorg-proto"

check_reqs() {
	linux-info_pkg_setup

	# Just a friendly warning
	if ! linux_config_exists \
			|| ! linux_chkconfig_present INPUT_EVDEV; then
		ewarn
		ewarn "This driver requires event interface support in your kernel"
		ewarn "  Device Drivers --->"
		ewarn "    Input device support --->"
		ewarn "      <*>     Event interface"
		ewarn
	fi
}

pkg_pretend() {
	check_reqs
}

pkg_setup() {
	check_reqs
}
