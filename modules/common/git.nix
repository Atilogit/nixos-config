{ ... }:
{
  flake.nixosModules.git =
    { pkgs, lib, ... }:
    {
      programs.git = {
        enable = true;
        lfs.enable = true;
        config = {
          init.defaultBranch = "main";
          user.name = "Yannick Wagner";
          user.email = "52137800+Atilogit@users.noreply.github.com";
          credential.helper = lib.getExe pkgs.git-credential-manager;
          credential.credentialStore = "cache";
          credential.cacheOptions = "--timeout 1000000000";
        };
      };
      environment.systemPackages = with pkgs; [
        git-credential-manager
      ];
    };
}
