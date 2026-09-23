{ ... }:
{
  flake.nixosModules.mission-center =
    { pkgs, lib, ... }:
    {
      environment.systemPackages = with pkgs; [
        mission-center
        nethogs
        lm_sensors
      ];

      security.wrappers.nethogs = {
        source = lib.getExe pkgs.nethogs;
        owner = "root";
        group = "root";
        capabilities = "cap_net_admin,cap_net_raw,cap_dac_read_search,cap_sys_ptrace+ep";
      };
      systemd.tmpfiles.rules = [
        "z /sys/class/powercap/intel-rapl:0/energy_uj 0444 root root -"
        "z /sys/class/powercap/intel-rapl:0:0/energy_uj 0444 root root -"
      ];
    };
}
