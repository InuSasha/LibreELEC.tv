################################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="kodi-theme-ConfluenceInuSasha"
PKG_VERSION="4.0.0.i1"
PKG_SITE="https://github.com/InuSasha/skin.confluence"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="skin.confluence-$PKG_VERSION"

make_target() {
  :
}

makeinstall_target() {
  SKINDIR="$INSTALL/usr/share/kodi/addons/skin.ConfluenceInuSasha"
  mkdir -p $SKINDIR
  cp -PR $ROOT/$PKG_BUILD/* $SKINDIR

  sed -e "s|skin.confluence|skin.ConfluenceInuSasha|g" \
      -e "s|name=\"Confluence\"|name=\"ConfluenceInuSasha\"|g" \
      -i $SKINDIR/addon.xml

  sed -e "/<screenshot>.*<\/screenshot>/d" \
      -i $SKINDIR/addon.xml
  rm -f $SKINDIR/resources/screenshot-*
}
