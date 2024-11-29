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
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-acpi_call
    inputs.nixos-hardware.nixosModules.common-pc-ssd

    ../../modules

    inputs.home-manager.nixosModules.home-manager
  ];

  networking.hostName = "book4";

  nixpkgs.config.allowUnfree = true;

  hardware.intelgpu = {
    driver = lib.mkIf (lib.versionAtLeast config.boot.kernelPackages.kernel.version "6.8") "xe";
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
