{pkgs, pkgsUnstable, ...}:
{
  environment.systemPackages = with pkgs; [
    pkgsUnstable.vscode
    pkgsUnstable.brave
  ];
}