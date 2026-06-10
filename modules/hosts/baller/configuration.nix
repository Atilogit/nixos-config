{ self, inputs, ... }:
{
  flake.nixosConfigurations.baller = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      commonConfig
      ballerConfig

      # Features
      nvidia-gpu
      ollama-nvidia
      noctalia
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
