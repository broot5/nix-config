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

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lcok-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };
      listener = [
        {
          timeout = 300;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 600;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 900;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
