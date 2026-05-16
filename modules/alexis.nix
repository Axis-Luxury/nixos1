{ pkgs, ... }:
{
  users.users.alexis = {
    isNormalUser = true;
    description = "alexis";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
}  
