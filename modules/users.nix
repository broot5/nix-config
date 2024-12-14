{
  inputs,
  config,
  pkgs,
  ...
}:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
  ];

  users.mutableUsers = false;

  users.users.broot = {
    isNormalUser = true;
    home = "/home/broot";
    hashedPasswordFile = config.sops.secrets."user_passwords/broot".path;
    extraGroups = [ "wheel" ];
    uid = 1000;
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    users.broot = import ../users/broot;
  };
}
