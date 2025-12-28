# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
XLIBRE_EAUTORECONF=yes

inherit linux-info xlibre

DESCRIPTION="Generic VESA video driver"
HOMEPAGE="https://github.com/X11Libre/xf86-video-vesa"
if [[ ${PV} != 9999* ]]; then
	#KEYWORDS="-* ~alpha amd64 x86"
	KEYWORDS="-* ~amd64"
fi

pkg_pretend() {
	linux-info_pkg_setup

	if ! linux_config_exists || ! linux_chkconfig_present DEVMEM; then
		echo
		ewarn "This driver requires /dev/mem support in your kernel"
		ewarn "  Device Drivers --->"
		ewarn "    Character devices  --->"
		ewarn "      [*] /dev/mem virtual device support"
		echo
	fi
}
