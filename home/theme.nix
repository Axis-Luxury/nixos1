{ pkgs, ... }:

let
  # ── Cursor: material-dark ──────────────────────────────────────────
  # material-dark-cursors = pkgs.stdenvNoCC.mkDerivation {
  #   pname = "material-dark-cursors";
  #   version = "unstable";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "varlesh";
  #     repo = "material-cursors";
  #     rev = "2a5f302fefe04678c421473bed636b4d87774b4a";
  #     hash = "sha256-uC2qx3jF4d2tGLPnXEpogm0vyC053MvDVVdVXX8AZ60=";
  #   };
  #   dontBuild = true;
  #   installPhase = ''
  #     mkdir -p $out/share/icons
  #     cp -r src/material_dark_cursors $out/share/icons/
  #   '';
  # };

  # ── Iconos: kora ───────────────────────────────────────────────────
  kora-icons = pkgs.stdenvNoCC.mkDerivation {
    pname = "kora-icons";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "bikass";
      repo = "kora";
      rev = "bf4442f6f9fca5193b9db9d70bf67c9bbff5f62d";
      hash = "sha256-PK+TNsaGqd2u9ShtPr48PyVVMcxplhR2rDLvC0nadM0=";
    };
    nativeBuildInputs = [ pkgs.gtk3 ];
    installPhase = ''
      mkdir -p $out/share/icons
      cp -r kora $out/share/icons/
      for theme in $out/share/icons/*/; do
        gtk-update-icon-cache "$theme" || true
      done
    '';
  };

  # ── Fuentes: SF Pro ────────────────────────────────────────────────
  sf-pro-fonts = pkgs.stdenvNoCC.mkDerivation {
    pname = "sf-pro-fonts";
    version = "unstable";
    src = pkgs.fetchFromGitHub {
      owner = "sahibjotsaggu";
      repo = "San-Francisco-Pro-Fonts";
      rev = "8bfea09aa6f1139479f80358b2e1e5c6dc991a58";
      hash = "sha256-mAXExj8n8gFHq19HfGy4UOJYKVGPYgarGd/04kUIqX4=";
    };
    installPhase = ''
      mkdir -p $out/share/fonts/truetype/sf-pro
      cp *.ttf $out/share/fonts/truetype/sf-pro/
    '';
  };

in
{
  # ── Paquetes ───────────────────────────────────────────────────────
  home.packages = [
    pkgs.bibata-cursors
    kora-icons
    sf-pro-fonts
  ];

  # ── Cursor ─────────────────────────────────────────────────────────
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # ── GTK (iconos) ───────────────────────────────────────────────────
  gtk = {
    enable = true;
    iconTheme = {
      package = kora-icons;
      name = "kora";
    };
    font = {
      name = "SF Pro";
      size = 11;
    };
  };

  # ── Fuentes ────────────────────────────────────────────────────────
  fonts.fontconfig.enable = true;
}