{ pkgs, ... }:
{
  imports = [
    ./wayland
    ./git.nix
    ./spotify.nix
  ];

  home.packages = with pkgs; [
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
    sparrow
  ];

  services.udiskie.enable = true;
}
