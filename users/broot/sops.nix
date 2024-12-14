{ inputs, ... }:
let
  secretsPath = builtins.toString inputs.nix-secrets;
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets/secrets.yaml";

    age.keyFile = "/home/broot/.config/sops/age/keys.txt";

    secerts = {
      "private_keys/broot" = {
        path = "/home/broot/.ssh/id_ed25519";
      };
    };
  };
}
