{ pkgs, ... }: {
  imports = [
    ./wayland
    ./git.nix
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

    imv
    mpv
    helvum
    zathura
    yt-dlp
    upscayl

    spotify
    firefox-bin
    vscode
    telegram-desktop
  ];
}
