{pkgs,...}:
{
  gtk = {
    enable = true;

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };


    theme = {
      name = "Tokyonight-Dark";
      package = pkgs.tokyo-night-gtk;
    };

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    cursorTheme = {
      name = "WinSur-white-cursors";
      package = pkgs.winsur-white-cursors;
      size = 24;
    };

    font = {
      name = "Geist";
      size = 11;
    };
  };

  fonts.packages = with pkgs; [
    geist-font
  ];
}