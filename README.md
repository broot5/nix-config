```bash
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko/latest -- \
    --mode disko \
    --arg rawdisk1 "/dev/nvme0n1" \
    --flake github:broot5/nix-config#standard
```

```bash
sudo nixos-install --flake github:broot5/nix-config#hostname
```