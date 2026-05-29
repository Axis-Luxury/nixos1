{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    gnome-tweaks       # Retoques
    gnome-extension-manager
#    gnome-browser-connector
    gnome-calendar      # Calendario
    gnome-characters    # Selector de caracteres/emojis
    gnome-clocks        # Relojes/Alarma
    gnome-font-viewer   # Visor de fuentes tipográficas
    gnome-console
    gnome-bluetooth
    gnome-backgrounds
    gnome-control-center
    gnome-disk-utility
  ];
}