# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils toolchain-funcs

DESCRIPTION="Kobo Desktop application for syncing with the Kobo eReader"
HOMEPAGE="http://www.koboereader.com"
SRC_URI="http://dl.dropbox.com/u/2183775/kobo-desktop.deb
	http://dev.gentoo.org/~chutzpah/libzip-0.9-bin32.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="strip"

RDEPEND="x86? (
		dev-libs/expat
		x11-libs/libSM
		x11-libs/libxcb
		x11-libs/libXrender
		x11-libs/libXau
		x11-libs/libX11
		x11-libs/libICE
		x11-libs/libXext
		x11-libs/libXdmcp
		dev-libs/libzip
		media-libs/freetype
		media-libs/fontconfig
		>=sys-devel/gcc-4.4
	)
	amd64? (
		app-emulation/emul-linux-x86-baselibs
		app-emulation/emul-linux-x86-xlibs
		>=sys-devel/gcc-4.4[multilib]
	)"

DEPEND="${RDEPEND}
	sys-apps/debianutils"

src_unpack() {
	unpack ${A}
	unpack ./data.tar.gz
	rm -f control.tar.gz data.tar.gz debian-binary
}

src_install() {
	dodir "/opt/Kobo/lib"
	dodir "/opt/Kobo/bin"

	cp -Pr "${WORKDIR}"/usr/lib32/* "${D}"/opt/Kobo/lib
	cp -Pr "${WORKDIR}"/usr/local/Kobo/* "${D}"/opt/Kobo/lib
	cp -Pr "${WORKDIR}"/usr/local/Trolltech/Qt-*/lib/* "${D}"/opt/Kobo/lib
	cp -Pr "${WORKDIR}"/usr/local/Trolltech/Qt-*/plugins/ "${D}"/opt/Kobo/lib/qt-plugins
	rm -f "${D}"/opt/Kobo/lib/{Kobo,Kobo.png}

	cp -Pr "${WORKDIR}"/usr/local/Kobo/Kobo "${D}"/opt/Kobo/bin

	insinto "/usr/share/pixmaps"
	newins usr/local/Kobo/Kobo.png kobo-icon.png

	insinto "/etc/udev/rules.d"
	newins etc/udev/rules.d/99-kobo.rules

	newbin "${FILESDIR}"/kobo-1 kobo

	make_desktop_entry /usr/bin/kobo "Kobo Desktop eReader" kobo-icon "Multimedia;"
}

pkg_postinst() {
	if [[ $(gcc-major-version) -eq 4 && $(gcc-minor-version) -lt 4 ]]; then
		ewarn "Your gcc profile must be at least 4.4 for ${PN} to work properly."
		ewarn "Please use \"gcc-config\" to set your gcc profile to gcc 4.4 or"
		ewarn "higher."
	fi
}
