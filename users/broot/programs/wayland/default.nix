{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    hyprpaper
  ];

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "20x20";
      };
    };
  };

  services.mako = {
    enable = true;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
    };
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
