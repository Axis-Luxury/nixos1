{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    stylix
  ];
}