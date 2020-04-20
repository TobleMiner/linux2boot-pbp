#!/usr/bin/env bash

set -e

cd "$(dirname "$(readlink -f "$0")")"

if [[ "$EUID" -eq 0 ]]; then
	pacman --noconfirm -Syu
	pacman --noconfirm -S base-devel arm-none-eabi-gcc cpio bc git rsync perl python sudo mtd-utils unzip wget mtools dosfstools
	sed -i "s/#\?MAKEFLAGS=.*/MAKEFLAGS=\"-j$(nproc --all)\"/g" /etc/makepkg.conf
	useradd build
	chown -R build:build .
	sudo -u build ./build.sh
else
	makepkg
	sha256sum *.tar.xz > SHA256SUMS
	cp SHA256SUMS release_info.txt
fi
