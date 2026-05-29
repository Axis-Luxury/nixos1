{pkgs,...}:
{
  security.sudo.extraConfig = "Defaults env_reset,pwfeedback"; # **** sudo password input
  virtualisation.virtualbox.guest.enable = true; # virtualbox
  hardware.graphics.enable = true; # drivers graficos
  services.printing.enable = true; # impresoras
  security.rtkit.enable = true; # Real-time kernel
  services.pulseaudio.enable = false;   # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.libinput.enable = true;   # touchpad
  
  environment.systemPackages = with pkgs; [
    libinput # Touchpad support
  ];
}