#!/bin/bash
set -e

echo "Installing packages..."
sudo pacman -Syu --needed --noconfirm - < pacman-pkg.txt
