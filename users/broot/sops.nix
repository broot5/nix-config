{ inputs, config, ... }:
let
  secretsPath = builtins.toString inputs.nix-secrets;
in
{
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets/secrets.yaml";

    age.sshKeyPaths = [ "/home/broot/.ssh/id_ed25519" ];

    secrets = {
      "private_keys/broot" = {
        path = "/home/broot/.ssh/id_ed25519";
      };
    };
  };
}
