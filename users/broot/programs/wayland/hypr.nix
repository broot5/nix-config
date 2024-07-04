{ pkgs, ... }: {
  home.packages = with pkgs; [
    tofi
    swww
    wlogout
    networkmanagerapplet
    #blueman-applet
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
    defaultTimeout = 4;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$mainMod" = "SUPER";
      "$terminal" = "foot";
      "$fileManager" = "thunar";
      "$menu" = "tofi-drun --drun-launch=true";
      monitor = [
        ", preferred, auto, 2"
      ];
      exec-once = [
        "waybar"
        "lxqt-policykit-agent"
        "mako"
        "swww-daemon"
        "swww-restore"
        "nm-applet"
        "blueman-applet"
      ];
      env = [
        "XCURSOR_SIZE,72"
        "HYPRCURSOR_SIZE,72"
      ];
      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        "col.active_border" = "rgba(a7c080ff)";
        "col.inactive_border" = "rgba(3d484dff)";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };
      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 1.0;

        drop_shadow = true;
        shadow_range = 15;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 10;
          passes = 3;

          ignore_opacity = true;
        };
      };
      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      master = {
        new_status = "master";
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = false;
      };
      input = {
        kb_layout = "us";
        kb_options = "caps:swapescape, korean:ralt_hangul, korean:rctrl_hanja";

        follow_mouse = 1;

        sensitivity = 0;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$mainMod SHIFT, Q, killactive"
        "$mainMod SHIFT, E, exit"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, D, exec, $menu"
        "$mainMod, F, fullscreen"

        "$mainMod, H, movefocus, l"
        "$mainMod, J, movefocus, d"
        "$mainMod, K, movefocus, u"
        "$mainMod, L, movefocus, r"

        "$mainMod ALT, H, resizeactive, -30 0"
        "$mainMod ALT, J, resizeactive, 0 30"
        "$mainMod ALT, K, resizeactive, 0 -30"
        "$mainMod ALT, L, resizeactive, 30 0"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      windowrulev2 = [
        "suppressevent maxmize, class:.*"
        "opacity 0.85, class:^(foot)$"
        "opacity 0.85, initialTitle:^(Visual Studio Code|Spotify Free)$"
      ];
    };
  };
}
