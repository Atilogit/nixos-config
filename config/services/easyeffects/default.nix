{ lib, ... }:
{
  home-manager.users.atilo.services.easyeffects = {
    enable = true;
    preset = "default";
    extraPresets = {
      default = {
        output = (lib.importJSON ./ASH_AKG_K701_Bass.json).output;
        input = (lib.importJSON ./Mic-Filter.json).input;
      };
    };
  };
  home-manager.users.atilo.home.file.".config/easyeffects/irs/AKG_K701_Average_Variant_3_stereo.irs" =
    {
      enable = true;
      source = ./AKG_K701_Average_Variant_3_stereo.irs;
    };
}
