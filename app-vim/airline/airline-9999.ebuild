# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/airline/airline-0.4.ebuild,v 1.1 2013/08/26 18:46:05 radhermit Exp $

EAPI=5
inherit vim-plugin

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/bling/vim-airline.git"
	RESTRICT=mirror
else
	MY_PN=vim-${PN}
	MY_P=${MY_PN}-${PV}
	SRC_URI="https://github.com/bling/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
	S=${WORKDIR}/${MY_P}
fi

DESCRIPTION="vim plugin: lean & mean statusline for vim that's light as air"
HOMEPAGE="https://github.com/bling/vim-airline/ http://www.vim.org/scripts/script.php?script_id=4661"
LICENSE="MIT"

VIM_PLUGIN_HELPFILES="${PN}.txt"

src_prepare() {
	[[ ${PV} != 9999 ]] && { rm LICENSE README* || die; }
}
