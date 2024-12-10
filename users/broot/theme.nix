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
    url = "https://w.wallhaven.cc/full/ox/wallhaven-oxkdd9.png";
    sha256 = "19d94hpr0i9dbh31qc4i6935nddvivpnznbij97cwyg982cacjqy";
  };
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
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
}
