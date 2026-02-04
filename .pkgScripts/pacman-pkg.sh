#!/bin/bash
set -e

echo "Installing packages..."
sudo pacman -Syu --needed --noconfirm - < pkglist.txt
