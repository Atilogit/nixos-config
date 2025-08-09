{ ... }:
{
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
  services.pipewire.enable = true; # Audio
  services.playerctld.enable = true; # Audio controls
  services.printing.enable = true; # CUPS
}
