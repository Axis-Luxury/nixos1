{pkgsUnstable, ...}:
{
  environment.systemPackages = with pkgsUnstable; [
    vscode
    brave
  ];
}