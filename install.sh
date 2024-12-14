#!/usr/bin/env bash

hostname=${HOSTNAME:-default-hostname}
remote_user=${REMOTE_USER:-root}
remote_ip_address=${REMOTE_IP_ADDRESS:-0.0.0.0}

temp=$(mktemp -d)

cleanup() {
  rm -rf "$temp"
}
trap cleanup EXIT

install -d -m755 "$temp/home/broot/.ssh"

cp ~/.ssh/id_ed25519 "$temp/home/broot/.ssh/id_ed25519"

chmod 600 "$temp/home/broot/.ssh/id_ed25519"

git clone https://github.com/broot5/nix-config.git

nix --extra-experimental-features "nix-command flakes" \
    run github:nix-community/nixos-anywhere -- \
    --generate-hardware-config nixos-generate-config nix-config/hosts/$hostname/hardware-configuration.nix \
    --extra-files "$temp" \
    --flake ./nix-config#$hostname \
    --target-host $remote_user@$remote_ip_address
