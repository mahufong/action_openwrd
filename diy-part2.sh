#!/bin/bash
set -e

# Keep the existing LAN address used by this router.
sed -i 's/192.168.1.1/192.168.10.252/g' package/base-files/files/bin/config_generate

# Lean's packages feed currently carries ZeroTier 1.16.0. Pin the package recipe
# to upstream OpenWrt's 1.16.2 release so a firmware upgrade does not downgrade
# the already deployed ZeroTier version.
ZT_MAKEFILE="feeds/packages/net/zerotier/Makefile"
if [ -f "$ZT_MAKEFILE" ]; then
  sed -i 's/^PKG_VERSION:=.*/PKG_VERSION:=1.16.2/' "$ZT_MAKEFILE"
  sed -i 's/^PKG_RELEASE:=.*/PKG_RELEASE:=1/' "$ZT_MAKEFILE"
  sed -i 's/^PKG_HASH:=.*/PKG_HASH:=2c607f573c6e38815433af289d364a689a203b18b51125f06c4472014d0657f0/' "$ZT_MAKEFILE"
fi
