# XLibre Overlay

This overlay is intended to enable building the [XLibre Xserver](https://github.com/X11Libre) project on [Gentoo Linux](https://www.gentoo.org/).

## How to install the overlay

Use [`eselect-repository`](https://wiki.gentoo.org/wiki/Eselect/Repository):

```
# eselect repository add xlibre git https://github.com/X11Libre/ports-gentoo
```

You may want to adjust the priority of the `xlibre` repository in [`/etc/portage/repos.conf`](https://wiki.gentoo.org/wiki//etc/portage/repos.conf) like so:

```
[xlibre]
...
priority = 100
...
```

Now you can use `emerge --sync xlibre` or `emaint sync -r xlibre` to sync this
repository.

The `x11-base/xlibre-server` package in this overlay causes file collisions with the
`x11-base/xorg-server::gentoo` package. When switching to this overlay first fetch
the XLibre Server package and then remove the X.Org Server and drivers packages before
installing `x11-base/xlibre-server` and the `x11-base/xorg-server::xlibre` dummy package:

```
# emerge -f x11-base/xlibre-server
# emerge -C x11-base/xorg-server
# emerge -C x11-base/xorg-drivers
# emerge -av1 x11-base/xlibre-server
# emerge @x11-module-rebuild
# emerge @preserved-rebuild
```

## Using the overlay

Right now there is no released version of XLibre DDX drivers. To use the them [live ebuilds](https://wiki.gentoo.org/wiki/Live_ebuilds), add the following line to your [`/etc/portage/package.accept_keywords`](https://wiki.gentoo.org/wiki//etc/portage/package.accept_keywords) file:

```
x11-drivers/*::xlibre **
```

**Or** for the individual packages:

```
x11-base/xlibre-drivers **
x11-base/xlibre-server **
x11-base/xorg-server **
x11-drivers/xf86-input-elographics **
x11-drivers/xf86-input-evdev **
x11-drivers/xf86-input-joystick **
x11-drivers/xf86-input-keyboard **
x11-drivers/xf86-input-libinput **
x11-drivers/xf86-input-mouse **
x11-drivers/xf86-input-synaptics **
x11-drivers/xf86-input-void **
x11-drivers/xf86-input-vmmouse **
x11-drivers/xf86-input-wacom **
x11-drivers/xf86-video-amdgpu **
x11-drivers/xf86-video-ast **
x11-drivers/xf86-video-ati **
x11-drivers/xf86-video-dummy **
x11-drivers/xf86-video-fbdev **
x11-drivers/xf86-video-geode **
x11-drivers/xf86-video-intel **
x11-drivers/xf86-video-mga **
x11-drivers/xf86-video-nouveau **
x11-drivers/xf86-video-qxl **
x11-drivers/xf86-video-r128 **
x11-drivers/xf86-video-siliconmotion **
x11-drivers/xf86-video-vesa **
x11-drivers/xf86-video-vmware **
```

As of writing this, the ddx drivers for Xorg, from the gentoo tree, also work with Xlibre, with the exception of xf86-video-intel.

To use that, you need to add `x11-drivers/xf86-video-intel **` to you package.accept_keywords.

The Xlibre X server has had multiple releases, but if you want the latest patches, you have to add it to package.accept_keyboards and use the live ebuild.

You can do that by adding the following lines to your package.accept_keywords:
```
x11-base/xlibre-drivers **
x11-base/xlibre-server **
x11-base/xorg-server **
```

If you want to use live ebuilds for everything in this overlay, you can do so by adding just this single line to your package.accept_keywords, ignoring everything above:
```
x11-drivers/*::xlibre **
```

If `/etc/portage/package.accept_keywords` is a directory, then create a file like `/etc/portage/package.accept_keywords/xlibre` containing one of the above blocks.

**WARNING:** The live ebuilds may break at any time. Use them only if you want to develop or alpha test XLibre. If in doubt, wait for the first release.

## List of X Drivers not in the Overlay

There are some older X drivers which are not packaged in Gentoo anymore.
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
* x11-drivers/xf86-video-nv
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

If you are using any hardware that requires one of the above drivers then don't hesitate and [open an issue](https://github.com/X11Libre/ports-gentoo/issues). We will see what we can do.

## Testing Third-Party Repositories Added as a Pull Request

To build pull requests from third-party repositories using the Git live ebuilds you can override the Git repo, branch and commit values set in the ebuild. Just provide one or more of the following variables on the command line:

```
EGIT_OVERRIDE_REPO_*
EGIT_OVERRIDE_BRANCH_*
EGIT_OVERRIDE_COMMIT_*
```

For example:

```
EGIT_OVERRIDE_REPO_X11LIBRE_XSERVER="https://github.com/probonopd/xserver" EGIT_OVERRIDE_BRANCH_X11LIBRE_XSERVER="patch-2"  emerge -1 x11-base/xlibre-server
```

where in this example `X11LIBRE` is the capitalized name of the Github project and `XSERVER` is the capitalized name of the Github repository of the live ebuild.

You will see the actual names of the variables specific to each ebuild when you unpack it, e.g.:

```
# ebuild xlibre-server-9999.ebuild unpack
```

For further reference of the override mechanism see the [`git-r3.eclass`](https://devmanual.gentoo.org/eclass-reference/git-r3.eclass/index.html) and its implementation.

## Using an Alternative udev Implementation

If you like to use XLibre with udev support but stay away from eudev/systemd you may want to consider [libudev-zero](https://github.com/illiliti/libudev-zero). There are ebuilds for it at [sys-libs/libudev-zero - Gentoo Portage Overlays](https://gpo.zugaina.org/sys-libs/libudev-zero).
