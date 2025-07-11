# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

XLIBRE_DRI=dri
XLIBRE_EAUTORECONF=yes

inherit linux-info xlibre flag-o-matic

if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="XLibre driver for Intel cards"
HOMEPAGE="https://github.com/X11Libre/xf86-video-intel"

IUSE="debug +sna tools +udev uxa valgrind xvmc"

REQUIRED_USE="
	|| ( sna uxa )
	uxa? ( dri )
"
RDEPEND="
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXScrnSaver
	>=x11-libs/pixman-0.27.1
	>=x11-libs/libdrm-2.4.52[video_cards_intel]
	x11-base/xlibre-server:=
	tools? (
		x11-libs/libX11
		x11-libs/libxcb
		x11-libs/libXcursor
		x11-libs/libXdamage
		x11-libs/libXinerama
		x11-libs/libXrandr
		x11-libs/libXrender
		x11-libs/libxshmfence
		x11-libs/libXtst
	)
	udev? (
		virtual/libudev:=
	)
	xvmc? (
		>=x11-libs/libXvMC-1.0.12-r1
		>=x11-libs/libxcb-1.5
		x11-libs/xcb-util
	)
"
DEPEND="
	${RDEPEND}
	x11-base/xorg-proto
	valgrind? ( dev-debug/valgrind )
"

pkg_setup() {
	linux-info_pkg_setup
	xlibre_pkg_setup
}

src_configure() {
	# bug #582910
	replace-flags -Os -O2
	# Uses the 'flatten' attribute which explodes with LTO (bug #864379)
	filter-lto

	local XLIBRE_CONFIGURE_OPTIONS=(
		--disable-dri1
		$(use_enable debug)
		$(use_enable dri)
		$(use_enable dri dri3)
		$(usex dri "--with-default-dri=3" "")
		$(use_enable sna)
		$(use_enable tools)
		$(use_enable udev)
		$(use_enable uxa)
		$(use_enable valgrind)
		$(use_enable xvmc)
	)
	xlibre_src_configure
}

pkg_postinst() {
	if linux_config_exists && \
		kernel_is -lt 4 3 && ! linux_chkconfig_present DRM_I915_KMS; then
		echo
		ewarn "This driver requires KMS support in your kernel"
		ewarn "  Device Drivers --->"
		ewarn "    Graphics support --->"
		ewarn "      Direct Rendering Manager (XFree86 4.1.0 and higher DRI support)  --->"
		ewarn "      <*>   Intel 830M, 845G, 852GM, 855GM, 865G (i915 driver)  --->"
		ewarn "	      i915 driver"
		ewarn "      [*]       Enable modesetting on intel by default"
		echo
	fi
}
