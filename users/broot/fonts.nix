{ pkgs, ... }: {
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = [
        "Iosevka Nerd Font"
        "Iosevka"
        "JetBrainsMono Nerd Font"
        "JetBrains Mono"
      ];
      sansSerif = [ "Pretendard JP" ];
    };
  };
  home.packages = with pkgs; [
    pretendard-jp
    jetbrains-mono
    iosevka
    (nerdfonts.override {
      fonts = [ "Jetbrains Mono" "Iosevka" ];
    })
  ];
}
