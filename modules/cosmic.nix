{config, pkgs, ...}:
{
  services.displayManager.cosmic-greeterenable = true;   # Enable the COSMIC login manager
  services.desktopManager.cosmic.enable = true;   # Enable the COSMIC desktop environment
}