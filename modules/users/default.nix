{
  imports = [
    ./alexis.nix
    ./theme.nix
  ];

  users.users.alexis.hashedPasswordFile = "/etc/passwdfile";
}