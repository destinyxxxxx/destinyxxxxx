#! /bin/bash

if [ ! -d build ];then
    mkdir build
else
    rm -rf build/*
fi

if [ ! -d output ];then
    mkdir output
else
    rm -rf output/*
fi

cd build

../configure \
	-prefix ../output \
	-opensource \
	-confirm-license \
	-release \
	-force-debug-info \
	-separate-debug-info \
	-make libs \
	-platform macx-clang \
	-sql-sqlite \
	-framework \
	-pch \
	-no-opengl \
	-no-openssl \
	-no-dbus \
	-no-icu \
	-no-cups \
	-system-zlib \
	-qt-libjpeg \
	-qt-libpng \
	-qt-freetype \
	-qt-pcre \
	-qt-harfbuzz \
	-skip qtconnectivity \
	-skip qtdeclarative \
	-skip qtmultimedia \
	-skip qtwebengine \
	-skip qt3d \
	-skip qtwebchannel \
	-skip qtwebsockets \
	-skip qtserialport \
	-skip qtscript \
	-skip qtandroidextras \
	-skip qtactiveqt \
	-skip qtcanvas3d \
	-skip qtgamepad \
	-skip qtlocation \
	-skip qtscxml \
	-skip qtsensors \
	-skip qtspeech \
	-skip qtdoc \
	-nomake examples \
    -nomake tools \
	-nomake tests \
	-recheck-all

make -j$(sysctl -n hw.ncpu)
make install
