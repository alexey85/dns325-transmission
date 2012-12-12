#!/bin/sh

#file=DNS-325_A1_FW_v1.00_GPL_v1.00_11102010.tgz
#if [ ! -f ${file} ]; then wget http://ftp.dlink.ru/pub/NAS/DNS-325/GPL/DNS-325_A1_FW_v1.00_GPL_v1.00_11102010.tgz; fi
#if [ -f ${file} ]; then tar zxf ${file}; fi
# wget
echo "downloding toolchain"
#wget -O - http://ftp.dlink.ru/pub/NAS/DNS-325/GPL/DNS-325_A1_FW_v1.00_GPL_v1.00_11102010.tgz | tar -xvzf -
#tar zxvf dns325_GPL/dns325_GPL.tgz

#todo replace "sudo cp ../ramdisk/uRamdisk ."  to "cp ../ramdisk/uRamdisk ."
cd dns325_GPL
./build_fw
cd ..


#file=ShareCenter%20Add-On%20SDK_v2.0_12192011.zip
#if [ ! -f ${file} ]; then wget http://ftp.dlink.ru/pub/NAS/DNS-325/GPL/${file}; fi
#if [ -f ${file} ]; then unzip ${file}; fi
echo "downloading plugin SDK"
wget -qO- -O tmp.zip http://ftp.dlink.ru/pub/NAS/DNS-325/GPL/ShareCenter%20Add-On%20SDK_v2.0_12192011.zip && unzip -o -u tmp.zip && rm -f tmp.zip

echo "downloading doc"
#file=NAS%20How-To%20Guide%20-%20ShareCenter%20Add-On%20SDK%20v1.0.docx
wget http://ftp.dlink.ru/pub/NAS/DNS-325/GPL/NAS%20How-To%20Guide%20-%20ShareCenter%20Add-On%20SDK%20v1.0.docx
