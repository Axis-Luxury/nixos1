{pkgs,...}:
{
  programs.zsh = {
    shellAliases = {
      ls = "eza --icons";
      ll = "eza -lah --icons --git";
      tree = "eza --tree --icons";
      nfs = "sudo nixos-rebuild switch --flake . --show-trace";
      nrs = "sudo nixos-rebuild switch --show-trace";
      neg = "sudo nix-env --delete-generations +2 --profile /nix/var/nix/profiles/system";
      nsg = "sudo nix-store --gc";
      ncg = "sudo nix-collect-garbage";
    };
  };

  environment.systemPackages = with pkgs; [
    eza
  ];
}