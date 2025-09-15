{ ... }:
{
  users.users.atilo = {
    isNormalUser = true;
    extraGroups = [
      "wheel" # Enable ‘sudo’ for the user.
      "audio" # Pipewire rtprio and memlock
      "libvirtd" # VMs
      "kvm" # Looking glass kvmfr
    ];
    packages = [ ];
  };
}
