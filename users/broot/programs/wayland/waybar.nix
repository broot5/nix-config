{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      position = "top";
      height = 40;
      modules-left = [
        "hyprland/workspaces"
        "hyprland/submap"
        "hyprland/window"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "tray"
        "pulseaudio"
        "backlight"
        "battery"
        "custom/notification"
      ];
      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
        };
        sort-by = "number";
      };
      "hyprland/window" = {
        format = "{}";
        max-length = 100;
      };
      clock = {
        format = "{:%H:%M}";
        format-alt = "{:%F %H:%M}";
        tooltip-format = ''
          <big>{:%Y %B}</big>
          <tt><small>{calendar}</small></tt>
        '';
      };
      tray = {
        icon-size = 20;
        spacing = 10;
      };
      pulseaudio = {
        format-source = "󰍬 {volume}%";
        format-source-muted = "󰍭 0%";
        format = "{icon} {volume}% {format_source}";
        format-muted = "󰸈 0% {format_source}";
        format-icons = {
          default = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };
        on-click = lib.getExe pkgs.pavucontrol;
      };
      backlight = {
        format = " {percent}%";
        on-scroll-up = "${lib.getExe pkgs.brightnessctl} set +10%";
        on-scroll-down = "${lib.getExe pkgs.brightnessctl} set -10%";
      };
      battery = {
        format-icons = [
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
        format = "{icon} {capacity}%";
        format-charging = "󰂄 {capacity}%";
      };
      "custom/notification" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          "notification" = "<span foreground=${config.lib.stylix.colors.red}><sup></sup></span>";
          "none" = "";
          "dnd-notification" = "<span foreground=${config.lib.stylix.colors.red}><sup></sup></span>";
          "dnd-none" = "";
          "inhibited-notification" = "<span foreground=${config.lib.stylix.colors.red}><sup></sup></span>";
          "inhibited-none" = "";
          "dnd-inhibited-notification" = "<span foreground=${config.lib.stylix.colors.red}><sup></sup></span>";
          "dnd-inhibited-none" = "";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
    };
    style = ''
      * {
        margin: 0 0.5em;
      }
      #tray {
        color: ${config.lib.stylix.colors.base05}
      }
    '';
  };
}
