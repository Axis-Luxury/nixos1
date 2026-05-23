{
  imports = [
    ./alexis.nix
  ];

  users.users.alexis.hashedPasswordFile = "/etc/passwdfile";
}