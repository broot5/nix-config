{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      if uwsm check may-start; and uwsm select
        exec systemd-cat -t uwsm_start uwsm start default
      end
    '';
    shellAliases = {
      sd = "shutdown -h now";
      nv = "nvim";
      ll = "eza";
      tree = "eza --tree";
      nswitch = "sudo nixos-rebuild switch --flake /etc/nixos";
      nsgc = "sudo nix-store --gc";
      ngc = "sudo nix-collect-garbage -d";
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
