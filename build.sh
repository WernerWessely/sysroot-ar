#! /bin/bash

set -e

export RUSTC_BOOTSTRAP=1
export SSL_CERT_FILE=/workspaces/rust/cargo.pem

TARGET=i686-br-ar
HOST=$(rustc -vV | grep host: | cut -d ' ' -f 2)
LIB=lib/rustlib/${TARGET}/lib
HOSTLIB=lib/rustlib/${HOST}/lib

cargo -v build --target=../${TARGET}.json -p std

rm -rf lib

mkdir -p ${LIB}
cp -a target/${TARGET}/debug/deps/. ${LIB}

mkdir -p ${HOSTLIB}
cp -a target/debug/deps/. ${HOSTLIB}



