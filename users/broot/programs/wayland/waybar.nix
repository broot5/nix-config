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
      layer = "top";
      position = "top";
      height = 40;
      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [ "clock" ];
      modules-right = [
        "privacy"
        "tray"
        "wireplumber"
        "backlight"
        "battery"
        "custom/swaync"
      ];
      "hyprland/workspaces" = {
        show-special = true;
        special-visible-only = true;
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
      };
      "hyprland/window" = {
        format = "{title}";
        max-length = 50;
        icon = true;
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
        spacing = 5;
      };
      wireplumber = {
        format = "{icon} {volume}%";
        format-muted = "󰝟";
        format-icons = [
          "󰕿"
          "󰖀"
          "󰕾"
        ];
        on-click = lib.getExe pkgs.pwvucontrol;
      };
      backlight = {
        format = "{icon} {percent}%";
        format-icons = [
          "󱩎"
          "󱩏"
          "󱩐"
          "󱩑"
          "󱩒"
          "󱩓"
          "󱩔"
          "󱩕"
          "󱩖"
          "󰛨"
        ];
        on-scroll-up = "${lib.getExe pkgs.brightnessctl} set +1%";
        on-scroll-down = "${lib.getExe pkgs.brightnessctl} set 1%-";
      };
      battery = {
        format = "{icon} {capacity}%";
        format-charging = "󱐋 {capacity}%";
        format-plugged = " {capacity}%";
        format-alt = "{icon} {time}";
        format-icons = [
          ""
          ""
          ""
          ""
          ""
        ];
      };
      "custom/swaync" = {
        tooltip = false;
        format = "{icon}";
        format-icons = {
          notification = "󱅫";
          none = "󰂚";
          dnd-notification = "󰂛";
          dnd-none = "󰂛";
          inhibited-notification = "󰂛";
          inhibited-none = "󰂛";
          dnd-inhibited-notification = "󰂛";
          dnd-inhibited-none = "󰂛";
        };
        return-type = "json";
        exec-if = "which swaync-client";
        exec = "swaync-client -swb";
        on-click = "swaync-client -t -sw";
        on-click-right = "swaync-client -d -sw";
        escape = true;
      };
    };
    style =
      let
        rounding = "5";
      in
      with config.lib.stylix.colors.withHashtag;
      ''
        @define-color base00 ${base00};
        @define-color base01 ${base01};
        @define-color base02 ${base02};
        @define-color base03 ${base03};
        @define-color base04 ${base04};
        @define-color base05 ${base05};
        @define-color base06 ${base06};
        @define-color base07 ${base07};
        @define-color base08 ${base08};
        @define-color base09 ${base09};
        @define-color base0A ${base0A};
        @define-color base0B ${base0B};
        @define-color base0C ${base0C};
        @define-color base0D ${base0D};
        @define-color base0E ${base0E};
        @define-color base0F ${base0F};

        * {
          padding: 0;
          margin: 0;
        }

        window#waybar {
          background: alpha(@base00, ${builtins.toString (config.stylix.opacity.desktop - 2.0e-2)});
          transition: all 0.3s ease-in-out;
        }

        .module {
          color: @base05;
          background: transparent;
          border-radius: 15px;

          padding: 0.2em 0.5em;
          margin: 0.4em 0.2em;
        }

        .modules-left:first-child {
          margin-left: 0.2em;
        }

        .modules-right:last-child {
          margin-right: 0.2em;
        }

        tooltip {
          background: @base00;
          border: 3px solid @base0D;
          border-radius: ${rounding}px;
        }

        tooltip label {
          color: @base05;

          padding: 0.2em 0.5em;
        }

        #workspaces {
          background: @base01;
        }

        #workspaces button {
          color: @base05;
          border-radius: ${rounding}px;

          padding: 0.05em;
          margin: 0.2em 0.3em;
          transition: all 0.3s ease-in-out;
        }

        #workspace button:first-child {
          margin: 0.2em 0.3em 0.2em 0px;
        }

        #workspace button:last-child {
          margin: 0.2em 0px 0.2em 0.3em;
        }

        #workspaces button.active {
          color: @base00;
          background: @base0D;

          min-width: 3em;
        }

        #workspaces button.special {
          color: @base00;
          background: @base0D;
        }

        window#waybar.empty #window {
          background: transparent;
        }

        #mpris {
          color: @base00;
          background: @base0C;
        }

        #mpris.paused {
          color: @base05;
          background: @base01;
        }

        #privacy {
          /* Because waybar does not set the module class */
          color: @base05;
          background: transparent;
          border-radius: 15px;

          padding: 0.2em 0.5em;
          margin: 0.4em 0.2em;
        }

        #backlight {
          background: @base01;
        }

        #wireplumber {
          background: @base01;
        }

        #wireplumber.muted {
          color: @base00;
          background: @base0A;
        }

        #battery {
          background: @base01;
        }

        #battery.warning {
          color: @base00;
          background: @base0A;
        }

        #battery.charging,
        #battery.plugged {
          color: @base00;
          background: @base0B;
        }

        @keyframes blink {
          to {
            color: @base05;
            background: @base01;
          }
        }

        #battery.critical:not(.charging) {
          background-color: @base08;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
        }

        #tray {
          background: @base02;
        }

        #tray menu,
        #tray menuitem {
          padding: 0.25em;
          margin: 0.1em;
        }

        #tray > .passive {
          -gtk-icon-effect: dim;
        }

        #tray > .needs-attention {
          -gtk-icon-effect: highlight;
          background-color: @base0A;
        }

        #custom-swaync {
          background: @base01;
        }

        #custom-swaync.dnd-notification,
        #custom-swaync.dnd-inhibited-notification {
          background: @base02;
        }

        #custom-swaync.notification,
        #custom-swaync.inhibited-notification {
          color: @base00;
          background: @base0A;
        }
      '';
  };
}
