{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = "40";
      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "clock"
      ];
      modules-right = [
        "group/system"
        "group/hardware"
        "custom/wlogout"
      ];
      "group-system" = {
        orientation = "horizontal";
        modules = [
          "wireplumber"
          "tray"
        ];
      };
      "group-hardware" = {
        orientation = "horizontal";
        modules = [
          "disk"
          "cpu"
          "memory"
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
          "focused" = "";
          "default" = "";
        };
        sort-by = "number";
      };
      "hyprland/window" = {
        format = " {}";
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
      "wireplumber" = {
        format = "{icon} {volume}%";
        format-muted = "";
        format-icons = [ "", "", "" ];
        on-click = "helvum";
      };
      "tray" = {
        spaceing = 10;
      };
      "disk" = {
        format = "{path} {used}";
        path = "/";
      };
      "cpu" = {
        foramt = " {usage}";
      };
      "memory" = {
        format = " {used}";
      };
      "custom/wlogout" = {
        format = "";
        on-click = "wlogout";
      };
    };
  };
}

