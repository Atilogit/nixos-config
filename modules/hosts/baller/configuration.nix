{ self, inputs, ... }:
{
  flake.nixosConfigurations.baller = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      commonConfig
      ballerConfig

      # Features
      nvidia-gpu

      # niri
      # noctalia

      plasma
    ];
  };

  flake.nixosModules.ballerConfig =
    { pkgs, ... }:
    {
      imports = [
        ./hardware-configuration.nix
      ];

      networking.hostName = "baller";

      # Kernel
      nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.default ];
      boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-bore-lto-zen4;

      boot.kernelModules = [ "ntsync" ];

      # Suspend
      # cat /proc/acpi/wakeup
      # sudo cat /sys/kernel/debug/wakeup_sources
      services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="pci", KERNEL=="0000:6d:00.3", ATTR{power/wakeup}="disabled"
      '';
      boot.kernelParams = [
        "nvme_core.default_ps_max_latency_us=0"
        "nvme_core.mpoll=0"
        "acpi_enforce_resources=lax"
      ];

      powerManagement = {
        enable = true;
        cpuFreqGovernor = "performance";
      };
      # Disable integrated graphics
      boot.blacklistedKernelModules = [ "amdgpu" ];

      # First version installed on this machine
      # DO NOT CHANGE
      system.stateVersion = "25.05";
    };
}
