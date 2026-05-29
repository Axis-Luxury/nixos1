{pkgs,...}:
{
  environment.systemPackages = with pkgs; [
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