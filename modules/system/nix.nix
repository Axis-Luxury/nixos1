{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];   # Funciones experimentales
#  nixpkgs.config.allowUnfree = true;

#  Cleanup ---------------------------------------------------------
  nix.gc.automatic = true;
  nix.gc.dates = "weekly";
  nix.gc.options = "--delete-older-than 10d";
  nix.settings.auto-optimise-store = true;

# Upgrades --------------------------------------------------------
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";
}