# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/airline/airline-9999.ebuild,v 1.2 2013/09/11 04:57:36 radhermit Exp $

EAPI=5
inherit vim-plugin

if [[ ${PV} != 9999* ]] ; then
	MY_PN=vim-${PN}
	MY_P=${MY_PN}-${PV}
	SRC_URI="https://github.com/airblade/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S=${WORKDIR}/${MY_P}
else
	inherit git-r3
	EGIT_REPO_URI="git://github.com/airblade/vim-gitgutter.git"
fi

DESCRIPTION="A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks."
HOMEPAGE="https://github.com/airblade/vim-gitgutter"
LICENSE="MIT"
VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	# remove unwanted files
	rm -rf screenshot.png
}
