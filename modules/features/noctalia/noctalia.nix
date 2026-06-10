{ self, inputs, ... }:
{
  # noctalia-shell ipc call state all > ~/nix-new/modules/features/noctalia/state.json
  flake.nixosModules.noctalia =
    { pkgs, ... }:
    {
      imports = [
        inputs.noctalia.nixosModules.default
      ];
      services.noctalia-shell = {
        enable = true;
        package = self.packages.${pkgs.stdenv.hostPlatform.system}.noctalia;
      };
    };
  perSystem =
    { pkgs, ... }:
    {
      packages.noctalia = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
        inherit pkgs;
        settings = (builtins.fromJSON (builtins.readFile ./state.json)).settings;
      };
    };
}
