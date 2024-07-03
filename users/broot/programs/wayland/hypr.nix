{ pkgs, ... }: {
  home.packages = with pkgs; [
    foot
    tofi
    swww
    wlogout
    networkmanagerapplet
    #blueman-applet
  ];

  services.mako = {
    enable = true;
    defaultTimeout = 4;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$terminal" = "foot";
      "$fileManager" = "thunar";
      "$menu" = "tofi-drun --drun-launch=true";
      exec-once = [
        "waybar"
        "lxqt-policykit-agent"
        "mako"
        "swww-daemon"
        "swww-restore"
        "nm-applet"
        "blueman-applet"
      ];
      monitor = [
        ", preferred, auto, 2"
      ];
      decoraton = {
        blur = {
          enabled = true;
          size = 10;
          passes = 3;
          ignore_opacity = true;
        };
      };
      input = {
        kb_options = [ "caps:swapescape" ];
      };
      windowrulev2 = [
        "opacity 0.85, class:^(foot)$"
        "opacity 0.85, initialTitle:^(Visual Studio Code|Spotify Free)$"
      ];
    };
  };
}
