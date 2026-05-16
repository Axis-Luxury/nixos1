{pkgs}:
{
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    neofetch 
    fzf # buscador de terminal
    vscode # Editor de código
    brave #Navegador
    zsh #shell
    oh-my-zsh #zsh plugin 
    zsh-autosuggestions #zsh plugin
    zsh-syntax-highlighting #zsh plugin
    libinput # Touchpad support
    eza # ls mejorado
    bat # cat mejorado
    zoxide # cd mejorado
    pkgs.nixd 
    nh
    nix-search-tv
    nix-tree
    nix-index
  ];
} 
  