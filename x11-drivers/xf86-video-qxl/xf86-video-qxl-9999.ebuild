# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

inherit python-single-r1 xlibre

DESCRIPTION="QEMU QXL paravirt video driver"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64 ~loong ~x86"
fi
IUSE="xspice"
REQUIRED_USE="xspice? ( ${PYTHON_REQUIRED_USE} )"

RDEPEND="
	xspice? (
		app-emulation/spice
		${PYTHON_DEPS}
	)
	x11-base/xlibre-server[-minimal]
	>=x11-libs/libdrm-2.4.46"
DEPEND="
	${RDEPEND}
	>=app-emulation/spice-protocol-0.12.0
	x11-base/xorg-proto"
BDEPEND="virtual/pkgconfig"

pkg_setup() {
	use xspice && python-single-r1_pkg_setup
	xlibre_pkg_setup
}

src_prepare() {
	xlibre_src_prepare

	use xspice && python_fix_shebang scripts
}

src_configure() {
	local XLIBRE_CONFIGURE_OPTIONS=(
		$(use_enable xspice)
	)
	xlibre_src_configure
}
