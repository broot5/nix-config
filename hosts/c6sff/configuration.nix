{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    inputs.nixos-hardware.nixosModules.common-hidpi
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-cpu-amd-raphael-igpu
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../../modules/autoUpgrade.nix
    ../../modules/bluetooh.nix
    ../../modules/boot.nix
    ../../modules/gc.nix
    ../../modules/mount.nix
    ../../modules/networking.nix
    ../../modules/nix.nix
    ../../modules/pipewire.nix
    ../../modules/polkit.nix
    ../../modules/swap.nix
    ../../modules/time.nix
    ../../modules/virtualization.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "c6sff";

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.broot = import ../../users/broot;
  };
}
