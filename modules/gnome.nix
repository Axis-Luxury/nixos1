{
  services.xserver.enable = true;   # Enable the X11 windowing system.
  services.displayManager.gdm.enable = true;   # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.xserver.xkb = {   # Configure keymap in X11
    layout = "latam";
    variant = "";
  };
}  
