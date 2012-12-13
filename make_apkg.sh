#!/bin/sh

#building environment
WORKDIR=$(pwd)
export WORKDIR

export TOOLCHAIN_DIR=${WORKDIR}/dns325_GPL
export MKAPKG_DIR="$WORKDIR/ShareCenter Add-On SDK_v2.0_12192011"

export WORKDIR_LIB="$WORKDIR/lib"
if [ ! -d ${WORKDIR_LIB} ]; then mkdir ${WORKDIR_LIB} ; fi
export WORKDIR_INC="$WORKDIR/include"
if [ ! -d ${WORKDIR_INC} ]; then mkdir ${WORKDIR_INC} ; fi
export WORKDIR_OUT="$WORKDIR/transmission"
if [ ! -d ${WORKDIR_OUT} ]; then mkdir ${WORKDIR_OUT} ; fi

export MKAPKG="$MKAPKG_DIR/mkapkg"
chmod +x "$MKAPKG"
cd ${WORKDIR_OUT}
"$MKAPKG" -m DNS-325
