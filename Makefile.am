## guile-basexx --- base16/32/64 support for GNU Guile
## Copyright © 2023 Raven Hallsby <karl@hallsby.com>
##
## This file is part of guile-basexx.
##
## guile-basexx is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## guile-basexx is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with guile-basexx.  If not, see <http://www.gnu.org/licenses/>.

SOURCES =                \
  basexx/base16.scm      \
  basexx/base32.scm      \
  basexx/base64.scm

EXTRA_DIST =            \
  README                \
  bootstrap             \
  pre-inst-env.in       \
  guix.scm

moddir=$(prefix)/share/guile/site/$(GUILE_EFFECTIVE_VERSION)
godir=$(libdir)/guile/$(GUILE_EFFECTIVE_VERSION)/site-ccache

GOBJECTS = $(SOURCES:%.scm=%.go)

nobase_mod_DATA = $(SOURCES) $(NOCOMP_SOURCES)
nobase_go_DATA = $(GOBJECTS)

# Make sure source files are installed first, so that the mtime of
# installed compiled files is greater than that of installed source
# files.  See
# <http://lists.gnu.org/archive/html/guile-devel/2010-07/msg00125.html>
# for details.
guile_install_go_files = install-nobase_goDATA
$(guile_install_go_files): install-nobase_modDATA

TESTS =                \
  tests/base16.scm     \
  tests/base32.scm     \
  tests/base64.scm

TEST_EXTENSIONS = .scm
SCM_LOG_COMPILER = $(top_builddir)/pre-inst-env $(GUILE)
AM_SCM_LOG_FLAGS = --no-auto-compile -L "$(top_srcdir)"

EXTRA_DIST += $(SOURCES) $(NOCOMP_SOURCES) $(TESTS)
GUILE_WARNINGS = -Wunbound-variable -Warity-mismatch -Wformat
SUFFIXES = .scm .go
.scm.go:
	$(AM_V_GEN)$(top_builddir)/pre-inst-env $(GUILE_TOOLS) compile $(GUILE_WARNINGS) -o "$@" "$<"

CLEANFILES =                                    \
  $(GOBJECTS)                                   \
  $(TESTS:tests/%.scm=%.log)

include doc/local.mk
