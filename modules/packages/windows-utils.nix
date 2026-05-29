{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    baobab                 # WinDirStat
#    libwacom              # Wacom (config en Ajustes → Tableta de lápiz)
#    rclone                # Google Drive sync
  ];

}