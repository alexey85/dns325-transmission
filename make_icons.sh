#!/bin/sh
#for using svg image install librsvg2-bin
#sudo apt-get install librsvg2-bin
#
PLUGIN_NAME=transmission
WORKDIR=$(dirname $0)

TOOLCHAIN_DIR=${WORKDIR}/dns325_GPL

MKAPKG_DIR=${WORKDIR}/"ShareCenter Add-On SDK_v2.0_12192011"
MKAPKG="$MKAPKG_DIR/mkapkg"

WORKDIR_LIB="$WORKDIR/lib"
WORKDIR_INC="$WORKDIR/include"
WORKDIR_OUT="$WORKDIR/$PLUGIN_NAME"
WORKDIR_TMPL="$WORKDIR/templates"
if [ -x "$MKAPKG" ]; then chmod +x "$MKAPKG"; fi

IDIR="$WORKDIR_TMPL/icons"

LOGO_IMG="$IDIR/logo.png"
LOGO_SHADOW_IMG="$IDIR/logo_with_shadow.png"
TMPL_ON="$IDIR/bg_template_on.png"
TMPL_OFF="$IDIR/bg_template_off.png"

OUT_TMPL="$WORKDIR_OUT/web/$PLUGIN_NAME"
OUT_ON="${OUT_TMPL}_on.png"
OUT_OFF="${OUT_TMPL}_off.png"
OUT_DISP="${OUT_TMPL}_display.png"

if [ ! -f $LOGO_IMG ]; then wget https://trac.transmissionbt.com/export/12106/trunk/gtk/icons/hicolor_apps_256x256_transmission.png -O $LOGO_IMG; fi
convert $LOGO_IMG -trim -resize 64 -matte \( +clone -background black -shadow 60x2+5+5 \) +swap -background none -mosaic -trim  $LOGO_SHADOW_IMG
composite -gravity center $LOGO_SHADOW_IMG $TMPL_ON $OUT_ON
composite -gravity center $LOGO_SHADOW_IMG $TMPL_OFF $OUT_OFF
convert -colorspace Gray $OUT_OFF $OUT_DISP