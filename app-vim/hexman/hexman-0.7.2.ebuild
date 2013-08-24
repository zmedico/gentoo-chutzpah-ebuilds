# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-vim/undotree/undotree-4.3.ebuild,v 1.1 2013/02/21 07:39:35 radhermit Exp $

EAPI=5

inherit vim-plugin

MY_PN="${PN}.vim"
EXTRA_VER="d332b71"

DESCRIPTION="vim plugin: Simpler Hex viewing and editing"
HOMEPAGE="http://www.vim.org/scripts/script.php?script_id=666"
SRC_URI="https://github.com/vim-scripts/${MY_PN}/tarball/${PV} -> ${P}.tar.gz"
LICENSE="as-is"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/vim-scripts-${MY_PN}-${EXTRA_VER}"
