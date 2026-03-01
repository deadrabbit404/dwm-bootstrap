#!/bin/sh
# script to install the dwm-bootstap

set -eu

YELLOW='\033[1;33m'
RESET='\033[0m'

# detect privilege tool
if command -v doas >/dev/null 2>&1; then
  PRIV=doas
elif command -v sudo >/dev/null 2>&1; then
  PRIV=sudo
else
  PRIV="" # assume user is root
fi

# list of packages
pkgs="dwm dmenu slstatus"

# === pass 1: build all components ===
for pkg in $pkgs; do
  printf "${YELLOW}==> Building %s\n${RESET}" "$pkg"
  (cd "$pkg" && make clean && make)
done

# === pass 2: install all components ===
for pkg in $pkgs; do
  printf "\n${YELLOW}==> Installing %s\n${RESET}" $pkg
  (cd "$pkg" && $PRIV make install)
done

# install slstatus scripts
if [ -d "slstatus/scripts" ]; then
  printf "\n${YELLOW}==> Installing slstatus scripts to /usr/local/bin\n${RESET}"
  $PRIV install -vDm755 slstatus/scripts/* /usr/local/bin
fi

printf "\n${YELLOW}All components installed successfully.${RESET}\n"
