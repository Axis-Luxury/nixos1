{pkgsx,...}:
{
  environment.systemPackages = with pkgsx; [
    easyeffects           # Nahimic
  ];
    # PipeWire (necesario para EasyEffects)
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
}