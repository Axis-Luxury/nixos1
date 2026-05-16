{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];   # Funciones experimentales
  nixpkgs.config.allowUnfree = true;
}