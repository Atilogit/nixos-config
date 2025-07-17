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
    };
  };
  environment.systemPackages = with pkgs; [
    git-credential-manager
  ];
}
