{ inputs, lib, config, pkgs, ... }: {
  imports = [
    ./programs
    ./fonts.nix
    ./locale.nix
    ./shell.nix
    ./theme.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredictate = _: true;
  };

  home.username = "broot";
  home.homeDirectory = "/home/broot";

  programs.home-manager.enable = true;

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
