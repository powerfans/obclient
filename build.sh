#!/bin/bash
function clean()
{
  rm -rf CMakeFiles CMakeCache.txt
}
clean

TOP_DIR=$(cd "$(dirname "$0")";pwd)
DEP_DIR=${TOP_DIR}/deps/3rd/usr/local/oceanbase/deps/devel

cmake . \
-DCMAKE_INSTALL_PREFIX=/app/mariadb \
-DMYSQL_DATADIR=/data/mariadb \
-DSYSCONFDIR=/etc \
-DMYSQL_USER=mysql \
-DWITH_INNOBASE_STORAGE_ENGINE=1 \
-DWITH_ARCHIVE_STORAGE_ENGINE=1 \
-DWITH_BLACKHOLE_STORAGE_ENGINE=1 \
-DWITH_PARTITION_STORAGE_ENGINE=1 \
-DWITHOUT_MROONGA_STORAGE_ENGINE=1 \
-DWITH_DEBUG=0 \
-DWITH_READLINE=1 \
-DWITH_SSL=$DEP_DIR \
-DOPENSSL_ROOT_DIR=$DEP_DIR \
-DOPENSSL_INCLUDE_DIR=$DEP_DIR/include \
-DOPENSSL_SSL_LIBRARY=$DEP_DIR/lib/libssl.a \
-DOPENSSL_CRYPTO_LIBRARY=$DEP_DIR/lib/libcrypto.a \
-DCURSES_CURSES_H_PATH=$DEP_DIR/include \
-DCURSES_CURSES_LIBRARY=$DEP_DIR/lib/libcurses.a \
-DCURSES_FORM_LIBRARY=$DEP_DIR/lib/libform.a \
-DCURSES_HAVE_CURSES_H=$DEP_DIR/include/curses.h \
-DCURSES_INCLUDE_PATH=$DEP_DIR/include \
-DCURSES_LIBRARY=$DEP_DIR/lib/libcurses.a \
-DCURSES_NCURSES_LIBRARY=$DEP_DIR/lib/libncurses.a \
-DWITH_ZLIB=system \
-DWITH_LIBWRAP=0 \
-DENABLED_LOCAL_INFILE=1 \
-DMYSQL_UNIX_ADDR=/app/mariadb/mysql.sock \
-DDEFAULT_CHARSET=utf8 \
-DDEFAULT_COLLATION=utf8_general_ci \
-DWITHOUT_TOKUDB=1 

make -j `cat /proc/cpuinfo | grep processor| wc -l`