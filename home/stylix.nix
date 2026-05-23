{ pkgs, ... }:

let
  kora = pkgs.stdenv.mkDerivation {
    pname = "kora-icons";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "bikass";
      repo = "kora";
      rev = "master";
      sha256 = "";
    };

    installPhase = ''
      mkdir -p $out/share/icons

      cp -r kora $out/share/icons/
      cp -r kora-light $out/share/icons/
      cp -r kora-pgrey $out/share/icons/
    '';
  };

  sf-pro = pkgs.stdenv.mkDerivation {
    pname = "sf-pro";
    version = "latest";

    src = pkgs.fetchFromGitHub {
      owner = "sahibjotsaggu";
      repo = "San-Francisco-Pro-Fonts";
      rev = "master";
      sha256 = "";
    };

    installPhase = ''
      mkdir -p $out/share/fonts/opentype

      find . \( -name "*.otf" -o -name "*.ttf" \) \
        -exec cp {} $out/share/fonts/opentype/ \;
    '';
  };
in
{
  stylix = {
    enable = true;

    image = ./wallpaper.jpg;

    polarity = "dark";

    base16Scheme =
      "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    cursor = {
      package = pkgs.material-cursors;
      name = "material_dark_cursors";
      size = 24;
    };

    icons = {
      package = kora;
      dark = "kora";
    };

    fonts = {
      sansSerif = {
        package = sf-pro;
        name = "SF Pro Display";
      };

      serif = {
        package = sf-pro;
        name = "SF Pro Text";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 11;
        desktop = 11;
        popups = 11;
        terminal = 12;
      };
    };
  };

  fonts.packages = [
    sf-pro
    pkgs.nerd-fonts.jetbrains-mono
    pkgs.noto-fonts-emoji
  ];

  gtk = {
    enable = true;

    iconTheme = {
      package = kora;
      name = "kora";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.material-cursors;
    name = "material_dark_cursors";
    size = 24;
  };
}