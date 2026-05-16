{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vscode
    brave
  ];
}