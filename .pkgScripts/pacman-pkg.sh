#!/bin/bash
set -e

echo "Installing packages..."
sed 's/#.*//' pacman-pkg.txt | xargs -r sudo pacman -Syu --needed --noconfirm
