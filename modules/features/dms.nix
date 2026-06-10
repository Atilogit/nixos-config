{ ... }:
{
  flake.nixosModules.dms =
    { pkgs, ... }:
    {
      programs.dms-shell = {
        enable = true;
        enableVPN = false;
        plugins = {
          EmojiLauncher = {
            src = pkgs.fetchFromGitHub {
              owner = "devnullvoid";
              repo = "dms-emoji-launcher";
              rev = "bd2df8723d417d11dc0ce6ddc225d25f707ce2f5";
              sha256 = "sha256-HNtGdR1bZypspIBJpnLRfGGFTBJRP8pTBc0WZR9b0sQ=";
            };
          };
          WebSearch = {
            src = pkgs.fetchFromGitHub {
              owner = "devnullvoid";
              repo = "dms-web-search";
              rev = "a119cf7cbac27c4070bd95a91dce2b99568eef29";
              sha256 = "sha256-IKEnmT+b3u0S01GabJ+3PkYHErDrLmIClvuwP8pajhI=";
            };
          };
          Calculator = {
            src = pkgs.fetchFromGitHub {
              owner = "rochacbruno";
              repo = "DankCalculator";
              rev = "de6dbd59b7630e897a50e107f704c1cd4a131128";
              sha256 = "sha256-Vq+E2F2Ym5JdzjpCusRMDXd6uuAhhjAehyD/tO3omdY=";
            };
          };
        };
      };
    };
}
