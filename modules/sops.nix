{ inputs, ... }:
let
  secretsPath = builtins.toString inputs.nix-secrets;
in
{
  imports = [ inputs.sops-nix.nixosModules.sops ];

  sops = {
    defaultSopsFile = "${secretsPath}/secrets/secrets.yaml";

    age = {
      sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets = {
      "user_passwords/broot" = {
        neededForUsers = true;
      };
    };
  };
}
