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

    nixpkgs-fmt

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

  services.udiskie.enable = true;
}
