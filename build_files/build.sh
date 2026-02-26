#!/bin/bash

set -ouex pipefail

dnf5 install -y distrobox gnome-themes-extra gnome-tweaks virt-install virt-manager

for drv in qemu interface network nodedev nwfilter secret storage; do \
    systemctl enable virt${drv}d.service; \
    systemctl enable virt${drv}d{,-ro,-admin}.socket; \
    done
