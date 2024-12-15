{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./wayland
    ./git.nix
    ./spotify.nix

    "${builtins.toString inputs.nix-secrets}/pkgs.nix"
  ];

  home.packages =
    let
      withPkgs = with pkgs; [
        bash
        wget
        unzip
        eza
        bat
        fzf
        yazi
        fastfetch
        btop
        neovim
        gh

        networkmanagerapplet
        hyprpolkitagent
        brightnessctl
        pwvucontrol
        playerctl

        nixfmt-rfc-style

        imv
        mpv
        helvum
        zathura
        yt-dlp
        upscayl

        firefox-bin
        vscode
        telegram-desktop
        syncthingtray
      ];
      withoutPkgs = [
        inputs.zen-browser.packages.x86_64-linux.specific
      ];
    in
    withPkgs ++ withoutPkgs;

  services.udiskie.enable = true;
}
