{ self, inputs, ... }:
{
  flake.nixosConfigurations.baller = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      commonConfig
      ballerConfig

      # Features
      nvidia-gpu
      ollama-nvidia
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
      boot.kernelModules = [ "ntsync" ];
      boot.kernelPackages = pkgs.linuxKernel.packages.linux_zen;
      powerManagement = {
        enable = true;
        cpuFreqGovernor = "performance";
      };
      # Disable integrated graphics
      boot.blacklistedKernelModules = [ "amdgpu" ];

      # First version installed on this machine
      # DO NOT CHANGE
      system.stateVersion = "25.05";
      # home-manager.sharedModules.home.stateVersion = "25.05"; # TODO
    };
}
