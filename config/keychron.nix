{ ... }:
{
  # Allow keychron keyboards to be recognized by keychron launcher
  services.udev.extraRules = ''
    KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{idVendor}=="3434", MODE="0660", GROUP="users", TAG+="uaccess"
    SUBSYSTEM=="usb",  ATTRS{idVendor}=="3434", ATTRS{idProduct}=="0b10", MODE="0660", GROUP="users", TAG+="uaccess"
  '';
}
