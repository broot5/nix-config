{ pkgs, ... }:
{
  imports = [
    ./hyprland.nix
    ./waybar.nix
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
    };
  };

  programs.foot = {
    enable = true;
    settings = {
      main = {
        pad = "20x20";
      };
    };
  };

  services.swaync = {
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
