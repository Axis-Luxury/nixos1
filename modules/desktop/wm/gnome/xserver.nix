{pkgs, ...}:
{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true; # Enable GNOME desktop environment
    
    xkb = { # Keyboard configuration
      layout = "latam";
      variant = "";
    };
  };
}