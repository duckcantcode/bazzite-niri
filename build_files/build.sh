#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

dnf5 -y install https://repos.fyralabs.com/terra43/noctalia-qs-0%3A0.0.12-3.fc43.x86_64.rpm

# setup niri
dnf5 -y install					\
	niri						\
	alacritty					\
	kitty						\
	xdg-desktop-portal-gtk		\
	xdg-desktop-portal-gnome	\
	gnome-keyring				\
	fuzzel						\
	https://repos.fyralabs.com/terra43/noctalia-shell-0%3A4.7.6-1.fc43.x86_64.rpm				\
	swayidle					\
	swaylock					\
	polkit-kde					\
	xwayland-satellite			

systemctl enable podman.socket
systemctl --global add-wants niri.service swayidle.service
systemctl --global add-wants niri.service plasma-polkit-agent.service
