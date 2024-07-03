{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix

    inputs.nixos-hardware.nixosModules.common-hidpi
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    inputs.nixos-hardware.nixosModules.common-cpu-amd-raphael-igpu
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia-sync
    inputs.nixos-hardware.nixosModules.common-pc
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../../modules/autoUpgrade.nix
    ../../modules/bluetooth.nix
    ../../modules/boot.nix
    ../../modules/file.nix
    ../../modules/gc.nix
    ../../modules/networking.nix
    ../../modules/nix.nix
    ../../modules/pipewire.nix
    ../../modules/polkit.nix
    ../../modules/swap.nix
    ../../modules/time.nix
    ../../modules/virtualisation.nix

    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "c6sff";

  hardware.nvidia.prime = {
    offload.enable = lib.mkForce false;
    nvidiaBusId = "PCI:1:0:0";
    amdgpuBusId = "PCI:16:0:0";
  };

  users.users.broot = {
    isNormalUser = true;
    home = "/home/broot";
    initialPassword = "password";
    extraGroups = [ "wheel" ];
    uid = 1000;
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.broot = import ../../users/broot;
  };

  system.stateVersion = "24.05";
}
