#!/bin/sh
# cross compilation vars
export TARGET_HOST="arm-none-linux-gnueabi"
export BUILD_HOST=$(uname  -m)
export CROSS_COMPILE=${TARGET_HOST}-

#building environment
WORKDIR=$(pwd)
export WORKDIR

export TOOLCHAIN_DIR=${WORKDIR}/dns325_GPL
export MKAPFG_DIR=${WORKDIR}/"ShareCenter Add-On SDK_v2.0_12192011"

PATH=${TOOLCHAIN_DIR}/${CROSS_COMPILE}6xxx/bin:$PATH
export PATH

export WORKDIR_LIB="$WORKDIR/lib"
if [ ! -d ${WORKDIR_LIB} ]; then mkdir ${WORKDIR_LIB} ; fi
export WORKDIR_INC="$WORKDIR/include"
if [ ! -d ${WORKDIR_INC} ]; then mkdir ${WORKDIR_INC} ; fi
export WORKDIR_OUT="$WORKDIR/transmission"
if [ ! -d ${WORKDIR_OUT} ]; then mkdir ${WORKDIR_OUT} ; fi

# compile environment
CC=${CROSS_COMPILE}gcc
CXX=${CROSS_COMPILE}g++
RANLIB=${CROSS_COMPILE}ranlib
LD=${CROSS_COMPILE}ld
STRIP=${CROSS_COMPILE}strip
export CC
export CXX
export RANLIB
export LD
export STRIP
export LDFLAGS="-L$WORKDIR_LIB"

file=libiconv-1.9.2 && \
echo "building $file" && \
cd ${TOOLCHAIN_DIR} && \
tar zxf ${file}.tgz && \
chmod -R +rw ${file} && \
cd ${file} && \
./configure --host="$TARGET_HOST" --build="$BUILD_HOST" --prefix="$WORKDIR"  && \
make clean && \
make && \
make install && \
if [ $? -ne 0 ]; then echo"fail build $file" && exit; fi


file=zlib-1.2.3 && \
echo "building $file" && \
cd ${TOOLCHAIN_DIR} && \
tar zxf ${file}.tgz && \
chmod -R +rw ${file} && \
cd ${file} && \
./configure --prefix="$WORKDIR"  && \
make clean && \
make && \
make install && \
if [ $? -ne 0 ]; then echo"fail build $file" && exit; fi


file=openssl-0.9.7 && \
echo "building $file" && \
cd ${TOOLCHAIN_DIR} && \
tar zxf ${file}.tgz && \
chmod -R +rw ${file} && \
cd ${file} && \
./Configure --prefix="$WORKDIR" no-static no-threads no-dso no-zlib shared linux-elf-arm:${CC} && \
make clean && \
make depend && \
make && \
make install && \
if [ $? -ne 0 ]; then echo"fail build $file" && exit; fi


file=curl-7.19.7 && \
echo "building $file" && \
cd ${TOOLCHAIN_DIR} && \
tar zxf ${file}.tgz && \
chmod -R +rw ${file} && \
cd ${file} && \
./configure --host="$TARGET_HOST" --build="$BUILD_HOST" --with-zlib="$WORKDIR" --with-ssl="$WORKDIR" \
--prefix="$WORKDIR" --without-random --disable-static --enable-shared && \
make clean && \
make && \
make install && \
if [ $? -ne 0 ]; then echo"fail build $file" && exit; fi


file=libevent-2.0.21-stable && \
echo "building $file" && \
cd ${TOOLCHAIN_DIR} && \
if [ ! -f ${file}.tar.gz ]; then wget https://github.com/downloads/libevent/libevent/${file}.tar.gz ; fi  && \
tar zxf ${file}.tar.gz  && \
cd ${file}  && \
./configure --host="$TARGET_HOST" --build="$BUILD_HOST" --prefix="$WORKDIR" --enable-static --disable-shared  && \
make clean && \
make && \
make install && \
if [ $? -ne 0 ]; then echo"fail build $file" && exit; fi


file=transmission-2.75 && \
echo "building $file" && \
cd ${TOOLCHAIN_DIR} && \
if [ ! -f ${file}.tar.bz2 ]; then wget http://download.transmissionbt.com/files/${file}.tar.bz2 ; fi && \
tar xjf ${file}.tar.bz2  && \
cd ${file}  && \
./configure \
LIBEVENT_LIBS="-L$WORKDIR_LIB -levent -liconv"  \
LIBEVENT_CFLAGS="-I$WORKDIR_INC"  \
OPENSSL_LIBS="-L$WORKDIR_LIB -lcrypto -lssl -liconv" \
OPENSSL_CFLAGS="-I$WORKDIR_INC" \
LIBCURL_LIBS="-L$WORKDIR_LIB -lcurl -liconv" \
LIBCURL_CFLAGS="-I$WORKDIR_INC" \
--with-zlib="$WORKDIR" --enable-lightweight --prefix="$WORKDIR_OUT" --host="$TARGET_HOST" \
--build="$BUILD_HOST" --disable-nls --enable-daemon --without-gtk && \
make clean && \
make && \
make install && \
$STRIP "$WORKDIR_OUT"/bin/transmission-*  && \
if [ $? -ne 0 ]; then echo"fail build $file" && exit; fi