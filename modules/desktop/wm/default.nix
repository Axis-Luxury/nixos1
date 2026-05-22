{
  imports = [
    ./gnome
  ];
  services.xserver = {
    displayManager.gdm.enable = true; # inicio de sesion
  };
}