{ pkgs, ... }:{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/nix".neededForBoot = true;
  environment.persistence."/nix/persist" = {
    enable = true;
    hideMounts = true;
    directories = [
      "/home"
      "/etc/nixos"
      "/etc/ssh"
      "/etc/NetworkManager"
      "/var/lib/nixos"
      "/var/log"
    ];
  };

  users.users.light = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialHashedPassword = "$y$j9T$y2pdRRvDEkM6O24XYVEYE1$7JbyqwK9y9qzBz./eqvTiUM8VQepgnzuGt6ezHnMAI/";
  };

  system.stateVersion = "24.05";
}