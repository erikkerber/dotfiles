#!/bin/bash
# https://gist.github.com/kastiglione/39b9d63dd89976339f2c8fe72f4c24e2
# https://twitter.com/kastiglione

set -e

_xcrun() {
  DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer \
    xcrun -sdk iphonesimulator \
    "$@"
}

_xcrun swiftc \
  -target x86_64-apple-ios13.0-simulator \
  -o runme \
  "$@"

_xcrun simctl spawn -s "iPhone 8" ./runme
