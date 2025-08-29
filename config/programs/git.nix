{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "Yannick Wagner";
      user.email = "52137800+Atilogit@users.noreply.github.com";
      credential.helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
      credential.credentialStore = "cache";
      credential.cacheOptions = "--timeout 1000000000";
    };
  };
  environment.systemPackages = with pkgs; [
    git-credential-manager
  ];

  home-manager.users.atilo.programs.gitui.enable = true;
}
