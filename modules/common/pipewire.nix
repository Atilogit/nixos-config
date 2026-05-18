{ ... }:
{
  flake.nixosModules.pipewire =
    { ... }:
    {
      services.pipewire = {
        enable = true;
        jack.enable = true;
        alsa.enable = true;
      };
      security.pam.loginLimits = [
        {
          domain = "@audio";
          type = "-";
          item = "rtprio";
          value = 95;
        }
        {
          domain = "@audio";
          type = "-";
          item = "memlock";
          value = "unlimited";
        }
      ];
      services.playerctld.enable = true; # Audio controls
    };
}
