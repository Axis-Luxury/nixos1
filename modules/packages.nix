{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neofetch 
    fzf # buscador de terminal
    libinput # Touchpad support
    eza # ls mejorado
    bat # cat mejorado
    zoxide # cd mejorado
    pkgs.nixd 
    nh
    nix-search-tv
    nix-tree
    nix-index
    ranger
    yazi
    zsh-completions
    tree
  ];
} 
  