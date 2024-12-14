{ inputs, ... }:
let
  secretsPath = builtins.toString inputs.nix-secrets;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets/secrets.yaml";

    age.sshKeyPaths = [ "/home/broot/.ssh/id_ed25519" ];

    secrets = {
      "user_passwords/broot" = {
        neededForUsers = true;
      };
    };
  };
}
