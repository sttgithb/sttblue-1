#!/bin/bash

set -ouex pipefail

dnf5 install -y distrobox gnome-themes-extra gnome-tweaks virt-install virt-manager
dnf5 remove -y firefox firefox-langpacks

for drv in qemu interface network nodedev nwfilter secret storage; do \
    systemctl enable virt${drv}d.service; \
    systemctl enable virt${drv}d{,-ro,-admin}.socket; \
    done

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install --noninteractive flathub com.brave.Browser
