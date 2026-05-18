{ ... }:
{
  flake.nixosModules.nvidia-gpu =
    { ... }:
    {
      boot.blacklistedKernelModules = [ "nouveau" ];
      services.xserver.videoDrivers = [ "nvidia" ];
      hardware.graphics.enable = true;
      hardware.nvidia.open = true;
      hardware.nvidia.powerManagement.enable = true;
    };
}
