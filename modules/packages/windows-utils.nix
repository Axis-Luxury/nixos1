{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    gnome.baobab          # WinDirStat
    nemo                  # OneCommander
    eyedropper            # Color Picker
    easyeffects           # Nahimic
    libwacom              # Wacom (config en Ajustes → Tableta de lápiz)
    rclone                # Google Drive sync
  ];

  # Extensiones GNOME
  services.gnome.gnome-browser-connector.enable = true;
  environment.systemPackages = environment.systemPackages ++ [
    pkgs.gnomeExtensions.caffeine   # Awake
  ];

  # Lenovo LOQ (LenovoLegionLinux)
  boot.extraModulePackages = with config.boot.kernelPackages; [
    lenovoLegionLinux
  ];
  boot.kernelModules = [ "legion_laptop" ];
  services.hardware.openrgb.enable = true;  # si usas RGB

  # PipeWire (necesario para EasyEffects)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}