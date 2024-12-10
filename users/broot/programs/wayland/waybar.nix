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
        tooltip-format = "{calendar}";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
        };
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
        background: transparent;
        border: none;
        border-radius: 0;
        margin: 1px 0;
        padding: 0 2px;
      }
    '';
  };
}
