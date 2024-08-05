{ config, lib, pkgs, modulesPath, ... }:{
  imports = [];

  boot.initrd.availableKernelModules = ["ata_piix" "ohci_pci" "ehci_pci" "ahci" "sd_mod" "sr_mod"];

  fileSystems."/" = {
    device = "nil";
    fsType = "tmpfs";
    options = [ "rw" "noatime" "size=64G" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/12CE-A600";
    fsType = "vfat";
    options = [ "fmask=0022" "dmask=0022" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/acce7651-1456-4a00-a267-9e2c396cb860";
    fsType = "ext4";
    options = [ "rw" "noatime" ];
  };

  swapDevices = [];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}