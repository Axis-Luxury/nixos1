{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    baobab          # WinDirStat
    nemo                  # OneCommander
    eyedropper            # Color Picker
    # libwacom              # Wacom (config en Ajustes → Tableta de lápiz)
    rclone                # Google Drive sync
  ];

}