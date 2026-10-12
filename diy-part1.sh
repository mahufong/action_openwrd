#!/bin/bash
set -e

# Keep Lean's default feeds intact. It already provides packages/luci/routing/
# telephony/helloworld with branches matched to the current LEDE tree.
# Only add OpenClash as an extra feed.
if ! grep -q '^src-git openclash ' feeds.conf.default; then
  echo 'src-git openclash https://github.com/vernesong/OpenClash' >> feeds.conf.default
fi
