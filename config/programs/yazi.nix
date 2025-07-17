{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    settings.yazi = {
      mgr = {
        show_hidden = true;
        linemode = "size";
      };
    };
    initLua = builtins.toFile "init.lua" ''
      require("starship"):setup()
      require("duckdb"):setup()
      require("git"):setup()
    '';
    plugins = with pkgs.yaziPlugins; {
      inherit
        starship
        duckdb # preview csv, tsv, json, or parquet
        git
        mediainfo
        ;
    };
  };
  environment.systemPackages = with pkgs.yaziPlugins; [
    starship
    duckdb
    git
    mediainfo
  ];
}

# https://github.com/yazi-rs/plugins/tree/main/piper.yazi
# https://github.com/Lil-Dank/lazygit.yazi
