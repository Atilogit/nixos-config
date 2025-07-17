{ ... }:
{
  programs.starship = {
    enable = true;
    presets = [
      "nerd-font-symbols"
    ];

    settings = {
      add_newline = false;
      directory.before_repo_root_style = "cyan";
      directory.repo_root_style = "bold cyan";
      directory.truncation_length = 5;
      directory.fish_style_pwd_dir_length = 1;
      status.disabled = false;
    };
  };
}
