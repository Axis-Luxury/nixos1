{ pkgs, ... }:

let
  assets = import ./assets.nix { inherit pkgs; };
in
{
  imports = [
    ./stylix.nix
  ];

  gtk = {
    enable = true;

    iconTheme = {
      package = assets.kora;
      name = "kora";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = assets.material-cursors;
    name = "material_dark_cursors";
    size = 24;
  };

  home.packages = [
    assets.sf-pro
    assets.jetbrains-mono
  ];
}