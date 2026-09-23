{ ... }:
{
  flake.nixosModules.yazi =
    { ... }:
    {
      programs.yazi = {
        enable = true;
        settings.yazi = {
          mgr = {
            show_hidden = true;
            linemode = "size";
          };
        };
      };
      programs.bash.interactiveShellInit = ''
        function y() {
         	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
         	command yazi "$@" --cwd-file="$tmp"
         	IFS= read -r -d \'\' cwd < "$tmp"
         	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
         	command rm -f -- "$tmp"
        }
      '';
    };
}
