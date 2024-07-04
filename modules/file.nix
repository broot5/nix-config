{ pkgs, ... }: {
  services.udisks2.enable = true;
  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-archive-plugin
    ];
  };
  environment.systemPackages = with pkgs; [
    cryptsetup
  ];
}
