#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# add terra repo
sed 's/enabled=0/enabled=1/g' /etc/yum.repos.d/terra.repo
dnf5 --refresh upgrade
#dnf5 install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# setup niri
dnf5 -y install					\
	niri						\
	alacritty					\
	kitty						\
	xdg-desktop-portal-gtk		\
	xdg-desktop-portal-gnome	\
	gnome-keyring				\
	fuzzel						\
	noctalia-shell				\
	swayidle					\
	swaylock					\
	polkit-kde					\
	xwayland-satellite			

systemctl enable podman.socket
systemctl --global add-wants niri.service swayidle.service
systemctl --global add-wants niri.service plasma-polkit-agent.service
