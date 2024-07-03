{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader.sytstemd-boot.enable = true;
  };
}
