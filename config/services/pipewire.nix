{ ... }:
{
  services.pipewire = {
    enable = true;
    jack.enable = true;
    alsa.enable = true;
  };
}
