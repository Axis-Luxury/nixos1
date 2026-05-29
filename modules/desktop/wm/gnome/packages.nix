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
  ];
}