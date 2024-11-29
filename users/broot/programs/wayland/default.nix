{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
  ];

  home.packages = with pkgs; [
    swww
  ];

  programs.tofi = {
    enable = true;
    settings = {
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      font = "sanserif";
      background-color = "#000A";
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Iosevka Nerd Font:size=16";
        dpi-aware = "yes";
        pad = "20x20";
      };
    };
  };

  services.mako = {
    enable = true;
    defaultTimeout = 5;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
