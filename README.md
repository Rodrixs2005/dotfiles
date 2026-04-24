# 🐧 Dotfiles

Hello! These are my personal configuration files for Arch Linux (btw ☝️🤓), managed with **GNU Stow** and automated scripts for package installation.

>[!WARNING]
>This setup is a work in progress, expect frequent changes and improvement

## Features
* Hyprland (Wayland compositor)
* Waybar (custom status bar)
* Fish shell
* Kitty terminal
* Fastfetch
* Rofi
* Hyprlock

## 📂 Repository Structure

* `.config/`: Configuration files (Hyprland, Waybar, Fish, Kitty, etc.)
* `.pkgScripts/`: Installation scripts and package lists.
* `README.md`: This documentation.
* `screenshots`: Preview of the setup

---

## 🚀 Setup

To replicate this environment on a clean Arch (btw ☝️🤓) installation:

### 1. ​🪞​ Clone the repository
```bash
git clone [https://github.com/Rodrixs2005/dotfiles.git](https://github.com/Rodrixs2005/dotfiles.git) ~/dotfiles
cd ~/dotfiles

```
>[!CAUTION]
>Make sure to make backups before applying any change into your configuration

### 2. ​​⚙️​ Run installation scripts (Optional)

You can automatically install all my packages by running these scripts. The AUR script will install `yay` for you if it's not already there.

```bash
# Make scripts executable
chmod +x .pkgScripts/*.sh

# Install official and AUR packages
./.pkgScripts/pacman-pkg.sh
./.pkgScripts/aur-pkg.sh

```

> [!NOTE]
> You can manually edit the `.txt` files in `.pkgScripts` to add or remove packages before running the scripts.

### 3. ​​​🖇️​ Manage symlinks with GNU Stow

Instead of copying files, we use **GNU Stow** to create symbolic links. This keeps your home directory clean and your dotfiles organized.

```bash
# Install Stow if you haven't already
sudo pacman -S --needed stow

cd ~/dotfiles
stow .

```
>[!NOTE]
>This will symplink configs into your home directory

### 4. ​🏗️​ Maintenance: Update your package lists

If you install new programs and want to keep your own repository up to date, run the following commands to refresh the lists:

```bash
# Update Official packages list (filtering out AUR packages)
pacman -Qe | grep -v "$(pacman -Qm | cut -d' ' -f1)" | cut -d' ' -f1 > .pkgScripts/pacman-pkg.txt

# Update AUR packages list
pacman -Qm | cut -d' ' -f1 > .pkgScripts/aur-pkg.txt

```

### 5. ​🤩​ Enjoy!

If you followed these steps, you are all set! Feel free to customize it further. If you have any suggestions or find a bug, don't hesitate to open an issue or a pull request.
