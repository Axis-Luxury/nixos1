{
    security.sudo.extraConfig = "Defaults env_reset,pwfeedback";
  virtualisation.virtualbox.guest.enable = true;
  hardware.graphics.enable = true;
  services.printing.enable = true;
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;   # Enable sound with pipewire.
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.libinput.enable = true;   # Enable touchpad support (enabled default in most desktopManager).
}