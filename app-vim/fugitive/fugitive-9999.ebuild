# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/fugitive/fugitive-1.2.ebuild,v 1.3 2012/11/27 22:34:33 ulm Exp $

EAPI=5
VIM_PLUGIN_VIM_VERSION="7.3"

inherit vim-plugin

DESCRIPTION="vim plugin: a git wrapper for vim"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=2975"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tpope/vim-fugitive.git"
else
	SRC_URI="http://www.vim.org/scripts/download_script.php?src_id=15542 -> ${P}.zip"
	KEYWORDS="~amd64 ~x86 ~ppc-macos"
	S="${WORKDIR}"
fi

LICENSE="vim"
IUSE=""

VIM_PLUGIN_HELPFILES="fugitive.txt"

DEPEND="app-arch/unzip"
RDEPEND="dev-vcs/git"
