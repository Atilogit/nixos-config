{ ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    config = {
      init.defaultBranch = "main";
      user.name = "Yannick Wagner";
      user.email = "52137800+Atilogit@users.noreply.github.com";
    };
  };
}
