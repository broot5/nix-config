{
  inputs,
  lib,
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./programs
    ./locale.nix
    ./shell.nix
    ./theme.nix
  ];

  home.username = "broot";
  home.homeDirectory = "/home/broot";

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.11";
}
