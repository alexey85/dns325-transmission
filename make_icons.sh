#!/bin/sh
#for using svg image install librsvg2-bin
#sudo apt-get install librsvg2-bin
#
WORKDIR=$(pwd)
WORKDIR_TMPL="$WORKDIR/plugin-icons"
LOGO_IMG="$WORKDIR_TMPL/logo.png"
LOGO_SHADOW_IMG="$WORKDIR_TMPL/logo_with_shadow.png"
TMPL_ON="$WORKDIR_TMPL/bg_template_on.png"
TMPL_OFF="$WORKDIR_TMPL/bg_template_off.png"

WORKDIR_OUT="$WORKDIR/transmission/web"
APP_NAME="transmission"
OUT_ON="$WORKDIR_OUT/${APP_NAME}_on.png"
OUT_OFF="$WORKDIR_OUT/${APP_NAME}_off.png"
OUT_DISP="$WORKDIR_OUT/${APP_NAME}_display.png"

wget https://trac.transmissionbt.com/export/12106/trunk/gtk/icons/hicolor_apps_256x256_transmission.png -O $LOGO_IMG
convert $LOGO_IMG -trim -resize 64 -matte \( +clone -background black -shadow 60x2+5+5 \) +swap -background none -mosaic -trim  $LOGO_SHADOW_IMG
composite -gravity center $LOGO_SHADOW_IMG $TMPL_ON $OUT_ON
composite -gravity center $LOGO_SHADOW_IMG $TMPL_OFF $OUT_OFF
convert -colorspace Gray $OUT_OFF $OUT_DISP