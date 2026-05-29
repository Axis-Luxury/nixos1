{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    gnome-tweaks       # Retoques
    gnome-extension-manager
#    gnome-browser-connector
  ];
}