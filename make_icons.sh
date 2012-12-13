#!/bin/sh
#for using svg image install librsvg2-bin
#sudo apt-get install librsvg2-bin
#
WORKDIR=$(pwd)
WORKDIR_TMPL="$WORKDIR/plugin-icons"
LOGO_IMG="$WORKDIR_TMPL/logo.png"
LOGO_SHADOW_IMG="$WORKDIR_TMPL/logo_with_shadow.png"
WORKDIR_OUT="$WORKDIR/plugin"
TMPL_ON="$WORKDIR/bg_template_on.png"
TMPL_OFF="$WORKDIR/bg_template_off.png"
OUT_ON="$WORKDIR_OUT/Transmission_on.png"
OUT_OFF="$WORKDIR_OUT/Transmission_off.png"
OUT_DISP="$WORKDIR_OUT/Transmission_display.png"

wget https://trac.transmissionbt.com/export/12106/trunk/gtk/icons/hicolor_apps_256x256_transmission.png -O $LOGO_IMG
convert $LOGO_IMG -trim -resize 100 -matte \( +clone -background black -shadow 60x2+5+5 \) +swap -background none -mosaic -trim  $LOGO_SHADOW_IMG
composite -gravity center $LOGO_SHADOW_IMG $TMPL_ON $OUT_ON
composite -gravity center $LOGO_SHADOW_IMG $TMPL_OFF $OUT_OFF
convert -colorspace Gray $OUT_OFF $OUT_DISP