{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    baobab          # WinDirStat
    nemo                  # OneCommander
    eyedropper            # Color Picker
    easyeffects           # Nahimic
    # libwacom              # Wacom (config en Ajustes → Tableta de lápiz)
    rclone                # Google Drive sync
  ];

  # Lenovo LOQ (LenovoLegionLinux)
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