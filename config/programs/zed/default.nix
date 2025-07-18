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
      "cargotom" # Cargo.toml suggestions
      "scala"
      "just"
      "gdscript"
      "scheme"
      "powershell"
      "marksman"
      "nim"
      "mermaid"
      "ssh-config"
    ];
    extraPackages = with pkgs; [
      package-version-server

      # LSP
      nil
      nixd
      hyprls
      marksman
      clang-tools
    ];
    userKeymaps = lib.importJSON ./keymap.json;
    userSettings = lib.importJSON ./settings.json;
  };
}
