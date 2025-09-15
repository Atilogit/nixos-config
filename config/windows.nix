# https://schneegans.de/windows/unattend-generator/?LanguageMode=Unattended&UILanguage=en-US&Locale=en-DE&Keyboard=00000409&GeoLocation=94&ProcessorArchitecture=amd64&BypassRequirementsCheck=true&ComputerNameMode=Random&CompactOsMode=Default&TimeZoneMode=Implicit&PartitionMode=Unattended&PartitionLayout=GPT&EspSize=300&RecoveryMode=Partition&RecoverySize=1000&DiskAssertionMode=Skip&WindowsEditionMode=Generic&WindowsEdition=pro&InstallFromMode=Automatic&PEMode=Generated&Disable8Dot3Names=true&UserAccountMode=Unattended&AccountName0=Admin&AccountDisplayName0=&AccountPassword0=admin&AccountGroup0=Administrators&AccountName1=User&AccountDisplayName1=&AccountPassword1=user&AccountGroup1=Users&AutoLogonMode=Own&PasswordExpirationMode=Unlimited&LockoutMode=Default&HideFiles=HiddenSystem&ShowFileExtensions=true&ClassicContextMenu=true&LaunchToThisPC=true&ShowEndTask=true&TaskbarSearch=Hide&TaskbarIconsMode=Default&DisableWidgets=true&HideTaskViewButton=true&ShowAllTrayIcons=true&DisableBingResults=true&StartTilesMode=Default&StartPinsMode=Empty&DisableWindowsUpdate=true&DisableSmartScreen=true&EnableLongPaths=true&PreventAutomaticReboot=true&DisableAppSuggestions=true&PreventDeviceEncryption=true&HideEdgeFre=true&DisableEdgeStartupBoost=true&DisablePointerPrecision=true&EffectsMode=Performance&DesktopIconsMode=Custom&StartFoldersMode=Custom&StartFolderPersonalFolder=true&StartFolderSettings=true&WifiMode=Skip&ExpressSettings=DisableAll&LockKeysMode=Skip&StickyKeysMode=Disabled&ColorMode=Custom&SystemColorTheme=Dark&AppsColorTheme=Dark&AccentColor=%230078d4&WallpaperMode=Solid&WallpaperColor=%23000000&LockScreenMode=Default&Remove3DViewer=true&RemoveBingSearch=true&RemoveCamera=true&RemoveClipchamp=true&RemoveCopilot=true&RemoveCortana=true&RemoveDevHome=true&RemoveWindowsHello=true&RemoveFamily=true&RemoveFeedbackHub=true&RemoveGameAssist=true&RemoveGetHelp=true&RemoveHandwriting=true&RemoveInternetExplorer=true&RemoveMailCalendar=true&RemoveMaps=true&RemoveMathInputPanel=true&RemoveMediaFeatures=true&RemoveMixedReality=true&RemoveZuneVideo=true&RemoveNews=true&RemoveOffice365=true&RemoveOneDrive=true&RemoveOneNote=true&RemoveOneSync=true&RemoveOutlook=true&RemovePaint3D=true&RemovePeople=true&RemovePowerAutomate=true&RemovePowerShell2=true&RemovePowerShellISE=true&RemoveQuickAssist=true&RemoveRecall=true&RemoveRdpClient=true&RemoveSkype=true&RemoveSolitaire=true&RemoveSpeech=true&RemoveStepsRecorder=true&RemoveStickyNotes=true&RemoveTeams=true&RemoveGetStarted=true&RemoveToDo=true&RemoveVoiceRecorder=true&RemoveWallet=true&RemoveWeather=true&RemoveWindowsMediaPlayer=true&RemoveZuneMusic=true&RemoveWordPad=true&RemoveYourPhone=true&FirstLogonScript0=irm+https%3A%2F%2Fget.activated.win+%7C+iex&FirstLogonScriptType0=Ps1&WdacMode=Skip

{
  pkgs,
  lib,
  config,
  ...
}:
let
  # RTX 3080
  gpuIDs = [
    "10de:2206" # Graphics
    "10de:1aef" # Audio
  ];
in
{
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # GPU Passthrough
  boot.initrd.kernelModules = [
    "vfio_pci"
    "vfio"
    "vfio_iommu_type1"
  ];
  boot.kernelParams = [
    ("vfio-pci.ids=" + lib.concatStringsSep "," gpuIDs)
    "kvmfr.static_size_mb=64"
  ];

  # Looking glass
  environment.systemPackages = with pkgs; [
    looking-glass-client
  ];
  boot.extraModulePackages = [
    config.boot.kernelPackages.kvmfr
  ];
  boot.kernelModules = [ "kvmfr" ];
  services.udev.extraRules = ''
    SUBSYSTEM=="kvmfr", OWNER="root", GROUP="kvm", MODE="0660"
  '';
  virtualisation.libvirtd.qemu.verbatimConfig = ''
    cgroup_device_acl = [
      "/dev/null", "/dev/full", "/dev/zero",
      "/dev/random", "/dev/urandom",
      "/dev/ptmx", "/dev/kvm", "/dev/kqemu",
      "/dev/rtc","/dev/hpet", "/dev/vfio/vfio",
      "/dev/net/tun", "/dev/vfio/1",

      "/dev/kvmfr0",
    ]
  '';
  home-manager.users.atilo.home.file.".config/looking-glass/client.ini" = {
    enable = true;
    text = ''
      [spice]
      enable = no
    '';
  };
}
