{pkgs, ...}:
{
  services.gnome.games.enable = false; # Deshabilitar juegos de GNOME
  services.gnome.core-apps.enable = true; # Deshabilitar aplicaciones principales de GNOME
  services.gnome.core-developer-tools.enable = false; # Deshabilitar herramientas de desarrollo de GNOME
  environment.gnome.excludePackages = with pkgs; [
    xterm
    gnome-contacts
    gnome-documents
    gnome-maps
    gnome-music
    gnome-photos
    gnome-videos
    gnome-weather
  ];
}