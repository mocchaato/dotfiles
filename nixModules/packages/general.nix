{ config, libs, pkgs, ... }:

{
  imports = [
    ./hyprland.nix
    ./utility.nix
    ./gaming.nix
  ];

  nixpkgs.config.allowUnfree = true;
  

  services.gvfs.enable = true;
  # Dependencies/System Packages
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    wget
    git
    lxqt.lxqt-policykit
    nodejs_24
    gcc
    kdePackages.kio-admin
    kdePackages.qtsvg
    sass
    upower
    lm_sensors
    gnome-disk-utility
    ntfs3g
  ];
}
