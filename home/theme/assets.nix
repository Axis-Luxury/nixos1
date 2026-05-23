{ pkgs, ... }:

{
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

  material-cursors = pkgs.material-cursors;

  jetbrains-mono = pkgs.nerd-fonts.jetbrains-mono;
}