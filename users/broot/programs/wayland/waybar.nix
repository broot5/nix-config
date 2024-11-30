{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 40;
      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "group/system"
        "custom/wlogout"
      ];
      "group-system" = {
        orientation = "horizontal";
        modules = [
          "wireplumber"
          "tray"
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
        format = "<span foreground=\"#A7C080\"> </span> {}";
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
      "wireplumber" = {
        format = "<span foreground=\"#3D484D\">|</span> <span foreground=\"#A7C080\">{icon}</span> {volume}% ";
        format-muted = "<span foreground=\"#3D484D\">|</span> <span foreground=\"#A7C080\"></span> ";
        format-icons = [
          ""
          ""
          ""
        ];
        on-click = "helvum";
      };
      "tray" = {
        icon-size = 20;
        spacing = 10;
      };
      "custom/wlogout" = {
        format = "";
        on-click = "wlogout";
        tooltip = false;
      };
    };
    style = ''
      * {
        font-family: 'Iosevka Nerd Font', sans-serif;
        font-size: 16px;
        min-height: 0;
      }

      window#waybar {
          background: rgba(45, 53, 59, 0.9);
          border: 2px solid rgba(61, 72, 77, 0.9);
          color: #D3C6AA;
      }

      #window, #clock, #system, #hardware {
          margin: 5px;
          padding: 0 10px;
          background-color: #272E33;
          border: 2px solid #3D484D;
          border-radius: 15px;
      }

      #window {
          font-weight: bold;
      }

      #clock {
          background-color: #A7C080;
          border: 2px solid #2D353B;
          color: #2D353B;
          font-weight: bold;
      }

      #workspaces {
          margin-right: 10px;
          font-weight: bold;
      }

      #workspaces button {
          border: none;
          border-radius: 0;
          color: #D3C6AA;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
          background-color: #A7C080;
          color: #2D353B;
          transition: all 0.3s ease-in-out;
      }

      #workspaces button.focused {
          background-color: #A7C080;
      }

      #workspaces button:hover {
          box-shadow: inherit;
          text-shadow: inherit;
          background: #3D484D;
          border: none;
          color: #D3C6AA;
      }

      #custom-wlogout {
          margin-left: 7px;
          padding: 0 15px;
          background-color: #A7C080;
          color: #2D353B;
      }
    '';
  };
}
