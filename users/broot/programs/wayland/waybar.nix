{ config, ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "hyprland/window" ];
      modules-right = [
        "group/system"
        "clock"
        "custom/notification"
      ];
      "group/system" = {
        orientation = "horizontal";
        modules = [
          "tray"
          "wireplumber"
          "backlight"
        ];
      };
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
      "clock" = {
        format = "{:%H:%M}";
        format-alt = "{:%F %H:%M}";
      };
      "tray" = {
        icon-size = 20;
        spacing = 10;
      };
      "wireplumber" = {
        format = "{volume}%";
        format-muted = "";
        format-icons = [
          ""
          ""
          ""
        ];
        on-click = "helvum";
      };
      "backlight" = {
        format = "{percent}%";
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
          "dnd-inhibited-notification" =
            "<span foreground=${config.lib.stylix.colors.red}><sup></sup></span>";
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
    style = '''';
  };
}
