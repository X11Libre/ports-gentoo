# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LICENSE="metapackage"

HOMEPAGE="https://github.com/X11Libre"

DESCRIPTION="dummy package for x11-base/xlibre-server"
SLOT="0/${PV}"
if [[ ${PV} != 9999* ]]; then
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux"
fi

IUSE_SERVERS="xephyr xnest xorg xvfb"
IUSE="${IUSE_SERVERS} debug +elogind minimal selinux suid systemd test +udev unwind xcsecurity xinerama"
RESTRICT="!test? ( test )"

DEPEND="x11-base/xlibre-server:${SLOT}[xephyr=,xnest=,xorg=,xvfb=,debug=,elogind=,minimal=,selinux=,suid=,systemd=,test=,udev=,unwind=,xcsecurity=,xinerama=]"
