#!/bin/bash
set -e

if ! command -v yay &>/dev/null; then
  echo "Installing yay..."
  sudo pacman -S --needed --noconfirm base-devel git
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
fi

echo "Installing AUR packages..."
sed 's/#.*//' aur-pkg.txt | xargs -r sudo pacman -Syu --needed --noconfirm
