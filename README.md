# XLibre Overlay

This overlay is intended to enable building the [XLibre](https://github.com/X11Libre) project on [Gentoo Linux](https://www.gentoo.org/).

## How To Install the Overlay

Use [`eselect-repository`](https://wiki.gentoo.org/wiki/Eselect/Repository):

```
eselect repository enable xlibre
```

You may want to adjust the priority of the `xlibre` repository in [`/etc/portage/repos.conf`](https://wiki.gentoo.org/wiki//etc/portage/repos.conf) like so:

```
[xlibre]
...
priority = 100
...
```

Now you can use `emerge --sync xlibre` or `emaint sync -r xlibre` to sync this repository.

The `x11-base/xlibre-server` package in this overlay causes file collisions with the
`x11-base/xorg-server::gentoo` package. When switching to this overlay, first fetch
the XLibre Server package and then remove the X.Org Server and drivers packages before
installing `x11-base/xlibre-server` and the `x11-base/xorg-server::xlibre` dummy package:

```
emerge -f x11-base/xlibre-server
emerge -C x11-base/xorg-server
emerge -C x11-base/xorg-drivers
emerge -av1 x11-base/xlibre-server
emerge @x11-module-rebuild
emerge @preserved-rebuild
```

## Using the Overlay

Since commit [c52d817a](https://github.com/X11Libre/ports-gentoo/commit/c52d817a6bb9f4c36a6690f47cc41250be73ae8a), this repository contains the released versions of the packaged drivers as well as the XLibre Xserver. You can use the ebuilds just straight away by accepting [~ARCH system-wide](https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords#.7EARCH_system-wide) or adding the following lines to your [`/etc/portage/package.accept_keywords`](https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords) file where `ARCH` is either `amd64` or `arm64`:

```
*/*::xlibre ~ARCH
```

If you use an ARCH other than `amd64` or `arm64` and are willing to help in testing, then please tell us by creating an issue at [Issues · X11Libre/ports-gentoo](https://github.com/X11Libre/ports-gentoo/issues).

To use the XLibre [live ebuilds](https://wiki.gentoo.org/wiki/Live_ebuilds), add the following lines to your [`/etc/portage/package.accept_keywords`](https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords) file:

```
*/*::xlibre **
```

If `/etc/portage/package.accept_keywords` is a directory, then create a file like `/etc/portage/package.accept_keywords/xlibre` containing one of the above blocks.

**WARNING:** The live ebuilds may break at any time. Use them only if you want to develop or alpha test XLibre.

## Using The Proprietary Nvidia Driver With XLibre

To use the proprietary Nvidia driver, please add the following to your X configuration, e.g., `xorg.conf`:

``` config
Section "ServerFlags"
    Option "IgnoreABI" "1"
EndSection
```

This forces the Nvidia driver to be loaded, even if it was compiled for a different ABI version, which is the case with XLibre. For more information, please see the [Nvidia proprietary driver](https://github.com/X11Libre/xserver/wiki/Compatibility-of-XLibre#nvidia-proprietary-driver) section of [Compatibility of XLibre · X11Libre/xserver Wiki](https://github.com/X11Libre/xserver/wiki/Compatibility-of-XLibre).

## List of X Drivers Not in the Overlay

There are some older X drivers that are not packaged in Gentoo anymore.
Some of them aren't packaged here as well, as we started with the Gentoo packages.

These packages are:

* xf86-video-apm
* xf86-video-ark
* xf86-video-chips
* xf86-video-cirrus
* xf86-video-freedreno
* xf86-video-i128
* xf86-video-i740
* xf86-video-mach64
* xf86-video-neomagic
* xf86-video-nested
* xf86-video-nv
* xf86-video-omap
* xf86-video-rendition
* xf86-video-s3virge
* xf86-video-savage
* xf86-video-sis
* xf86-video-sisusb
* xf86-video-suncg14
* xf86-video-suncg3
* xf86-video-suncg6
* xf86-video-sunffb
* xf86-video-sunleo
* xf86-video-suntcx
* xf86-video-tdfx
* xf86-video-trident
* xf86-video-v4l
* xf86-video-vbox
* xf86-video-voodoo
* xf86-video-wsfb
* xf86-video-xgi

If you are using any hardware that requires one of the above drivers, then don't hesitate and [open an issue](https://github.com/X11Libre/ports-gentoo/issues). We will see what we can do.

## Testing Third-Party Repositories Added as a Pull Request

To build pull requests from third-party repositories using the Git live ebuilds you can override the Git repo, branch, and commit values set in the ebuild. Just provide one or more of the following variables on the command line:

```
EGIT_OVERRIDE_REPO_*
EGIT_OVERRIDE_BRANCH_*
EGIT_OVERRIDE_COMMIT_*
```

For example:

```
EGIT_OVERRIDE_REPO_X11LIBRE_XSERVER="https://github.com/probonopd/xserver" EGIT_OVERRIDE_BRANCH_X11LIBRE_XSERVER="patch-2"  emerge -1 x11-base/xlibre-server
```

where in this example `X11LIBRE` is the capitalized name of the GitHub project and `XSERVER` is the capitalized name of the GitHub repository of the live ebuild.

You will see the actual names of the variables specific to each ebuild when you unpack it, e.g.:

```
ebuild xlibre-server-9999.ebuild unpack
```

For further reference of the override mechanism, see the [`git-r3.eclass`](https://devmanual.gentoo.org/eclass-reference/git-r3.eclass/index.html) and its implementation.

## Using an Alternative Udev Implementation

If you like to use XLibre with udev support but stay away from eudev/systemd you may want to consider [libudev-zero](https://github.com/illiliti/libudev-zero). There are ebuilds for it at [sys-libs/libudev-zero - Gentoo Portage Overlays](https://gpo.zugaina.org/sys-libs/libudev-zero).

## Contact

[XLibre topics at Gentoo Forums](https://forums.gentoo.org/search.php?mode=results&search_keywords=xlibre&show_results=topics) | [@x11dev channel at Telegram](https://t.me/x11dev) | [#xlibre room at Matrix](https://matrix.to/#/#xlibre:matrix.org)
