{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix

    inputs.nixos-hardware.nixosModules.common-hidpi
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    # inputs.nixos-hardware.nixosModules.common-cpu-amd-raphael-igpu
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    # inputs.nixos-hardware.nixosModules.common-gpu-nvidia-sync
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../../modules

    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "c6sff";

  nixpkgs.config.allowUnfree = true;

  boot.kernelParams = [ "nvidia-drm.fbdev=1" ];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaSettings = true;
    open = false;
  };

  hardware.nvidia.prime = {
    offload.enable = lib.mkForce false;
    # nvidiaBusId = "PCI:1:0:0";
    # amdgpuBusId = "PCI:16:0:0";
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
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.broot = import ../../users/broot;
  };

  system.stateVersion = "24.11";
}
