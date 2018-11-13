if [ ! -d "zlib-1.2.11" ]; then
	curl -fsSL "https://zlib.net/zlib-1.2.11.tar.gz" | tar zxvf -
	cd zlib-1.2.11
	./configure --prefix=$PWD/install
	make -j$(nproc)
	make install
	cd ..
fi


if [ ! -d "libevent-2.1.8-stable" ]; then
    curl -fsSL "https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz" | tar zxvf -
    cd libevent-2.1.8-stable
    ./configure --prefix=$PWD/install \
            --disable-shared \
            --enable-static \
            --with-pic
    make -j$(nproc)
    make install
    cd ..
fi


if [ ! -d "openssl-1.0.2m" ]; then
    curl -fsSL "https://www.openssl.org/source/openssl-1.0.2m.tar.gz" | tar zxvf -
    cd openssl-1.0.2m
    ./config --prefix=$PWD/install no-shared no-dso
    make -j$(nproc)
    make install
    cd ..
fi

if [ ! -d "tor-0.3.4.9" ]; then
    curl -fsSL "https://dist.torproject.org/tor-0.3.4.9.tar.gz" | tar zxvf -
fi

cd tor-0.3.4.9
./configure --prefix=$PWD/install \
            --disable-system-torrc \
            --enable-static-tor \
            --with-libevent-dir=$PWD/../libevent-2.1.8-stable/install \
            --with-openssl-dir=$PWD/../openssl-1.0.2m/install \
            --with-zlib-dir=$PWD/../zlib-1.2.11/install
make -j$(nproc)
make install
cd ..

#[ ! -d "/build" ] && mkdir /build
#cp tor-0.3.4.9/src/or/tor /build
