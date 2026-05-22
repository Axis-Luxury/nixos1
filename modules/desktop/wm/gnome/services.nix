{pkgs, ...}:
{
  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    
    xkb = {
      layout = "latam";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
    gnome-browser-connector
  ];
}