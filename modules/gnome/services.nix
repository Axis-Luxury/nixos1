{pkgs, ...}:
{
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    
    xkb = {
      layout = "latam";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    extension-manager
    gnome-browser-connector
  ];
}