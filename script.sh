#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
curl -sSL -O https://s3.amazonaws.com/rust-lang-ci/rust-ci-mirror/openssl-1.0.2k.tar.gz &&
tar xf openssl-1.0.2k.tar.gz &&
cd openssl-1.0.2k &&
sed -i 's/Never mind.*$/\0\n\texit 1/g' crypto/cmac/Makefile &&
./Configure no-dso no-ssl2 no-ssl3 darwin64-x86_64-cc &&
make
