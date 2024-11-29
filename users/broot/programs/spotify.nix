{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplayMod
        hidePodcasts
        adblock
      ];
      theme = spicePkgs.themes.comfy;
      colorScheme = "Everforest";
    };
}
