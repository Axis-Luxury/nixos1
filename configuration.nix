{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
#  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];   # Funciones experimentales
  
  time.timeZone = "America/Guayaquil";
  i18n.defaultLocale = "es_EC.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "es_EC.UTF-8";
    LC_IDENTIFICATION = "es_EC.UTF-8";
    LC_MEASUREMENT = "es_EC.UTF-8";
    LC_MONETARY = "es_EC.UTF-8";
    LC_NAME = "es_EC.UTF-8";
    LC_NUMERIC = "es_EC.UTF-8";
    LC_PAPER = "es_EC.UTF-8";
    LC_TELEPHONE = "es_EC.UTF-8";
    LC_TIME = "es_EC.UTF-8";
  };

  services.xserver.enable = true;   # Enable the X11 windowing system.
  services.displayManager.gdm.enable = true;   # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;

  services.xserver.xkb = {   # Configure keymap in X11
    layout = "latam";
    variant = "";
  };

  console.keyMap = "la-latin1";

  services.printing.enable = true;

  services.pulseaudio.enable = false;   # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  services.libinput.enable = true;   # Enable touchpad support (enabled default in most desktopManager).

  users.users.alexis = {
    isNormalUser = true;
    description = "alexis";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
    #  thunderbird
    ];
  };

  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "robbyrussell"; # simple y rápido
      plugins = [ "git" ];
    };

    promptInit = '' 
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    '';
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

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
  ];

  system.stateVersion = "25.11"; # Did you read the comment?

}
