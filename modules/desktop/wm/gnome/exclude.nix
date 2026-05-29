{pkgs, ...}:
{
  services.gnome.games.enable = false; # juegos de GNOME
  services.gnome.core-apps.enable = true; # aplicaciones principales de GNOME
  services.gnome.core-developer-tools.enable = false; # herramientas de desarrollo de GNOME
  environment.gnome.excludePackages = with pkgs; [
    gnome-contacts
    gnome-maps
    gnome-music
    gnome-photos
    gnome-videos
    gnome-weather
  ];
}