{ ... }:
{
  flake.nixosModules.modrinth =
    { pkgs-stable, ... }:
    {
      # https://github.com/NixOS/nixpkgs/issues/359820
      # https://github.com/tauri-apps/tauri/issues/9394
      environment.systemPackages = with pkgs-stable; [
        (modrinth-app.overrideAttrs (oldAttrs: {
          buildCommand = ''
            					gappsWrapperArgs+=(
            						--set __NV_DISABLE_EXPLICIT_SYNC 1
            					)
            				''
          + oldAttrs.buildCommand;
        }))
      ];
    };
}
