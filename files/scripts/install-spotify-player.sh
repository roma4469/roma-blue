#!/usr/bin/env bash
set -ouex pipefail

dnf5 install -y \
  cargo \
  rust \
  openssl-devel \
  dbus-devel \
  pulseaudio-libs-devel \
  pkgconf-pkg-config

cargo install spotify_player \
  --locked \
  --root /usr/local \
  --no-default-features \
  --features pulseaudio-backend,media-control,notify,image

dnf5 remove -y cargo rust || true
dnf5 autoremove -y || true
