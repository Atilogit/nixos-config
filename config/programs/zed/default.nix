{ pkgs, lib, ... }:
{
  home-manager.users.atilo.programs.zed-editor = {
    enable = true;
    extensions = [
      # Theme
      "jetbrains-new-ui-icons"
      "one-dark-pro"
      "rainbow-csv"

      # Languages
      "assembly"
      "csharp"
      "docker-compose"
      "dockerfile"
      "emmet"
      "git-firefly" # git syntax highlighting
      "glsl"
      "hlsl"
      "html"
      "hyprland"
      "ini"
      "java"
      "log"
      "lua"
      "make"
      "nix"
      "nu"
      "ocaml"
      "pest"
      "ron"
      "slint"
      "sql"
      "toml"
      "typst"
      "wgsl"
      "xml"
      "zig"
      "scss"
      "kotlin"
      "proto"
      "cargo-tom" # Cargo.toml suggestions
      "scala"
      "just"
      "gdscript"
      "scheme"
      "powershell"
      "marksman"
      "nim"
      "mermaid"
      "ssh-config"
      "kdl"
    ];
    userKeymaps = lib.importJSON ./keymap.json;
    userSettings = lib.importJSON ./settings.json;
  };
  environment.systemPackages = with pkgs; [
    package-version-server

    # LSP
    nil
    nixd
    hyprls
    marksman
    clang-tools
    kdePackages.qtdeclarative # qmlls
  ];
}
