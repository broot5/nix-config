{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  home.packages = with pkgs; [
    base16-schemes

    pretendard-jp
    jetbrains-mono
    iosevka
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
  ];

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

  stylix.enable = true;
  stylix.autoEnable = true;

  stylix.image = pkgs.fetchurl {
    url = "https://github.com/danihek/dh-wallpapers/blob/main/artwork-anime-landscape-painting-wallpaper-8b962c8d7321cf3955046b39ddaccc80.jpg?raw=true";
    sha256 = "1byqfrx71j0kd6ym14csw05gxni8v8zd68anwgpk36z5ac1cim43";
  };
  # stylix.polarity = "dark";

  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

  stylix.fonts = {
    serif = config.stylix.fonts.sansSerif;
    sansSerif = {
      package = pkgs.pretendard-jp;
      name = "Pretendard JP";
    };
    monospace = {
      package = pkgs.nerd-fonts.iosevka;
      name = "Iosevka Nerd Font";
    };
  };

  stylix.iconTheme = {
    enable = true;
    package = pkgs.papirus-icon-theme;
    light = "Papirus-Light";
    dark = "Papirus-Dark";
  };
}
