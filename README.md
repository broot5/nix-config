```bash
git clone https://github.com/broot5/nix-config.git

sudo nix run github:nix-community/nixos-anywhere -- \
    --generate-hardware-config nixos-generate-config nix-config/hosts/<hostname>/hardware-configuration.nix \
    --flake nix-config#<hostname> root@<ip address>
```