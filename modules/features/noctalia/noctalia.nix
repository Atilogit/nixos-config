{ self, inputs, ... }:
{
  # noctalia-shell ipc call state all > ~/nix-new/modules/features/noctalia/state.json
  flake.nixosModules.noctalia =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia.nixosModules.default
      ];
      programs.noctalia = {
        enable = true;
        systemd.enable = true;
        recommendedServices.enable = true;
      };
    };
  # perSystem =
  #   { pkgs, ... }:
  #   {
  #     packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
  #       inherit pkgs;
  #       settings = (builtins.fromJSON (builtins.readFile ./state.json)).settings;
  #     };
  #   };
}
