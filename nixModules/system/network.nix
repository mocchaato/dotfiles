{ config, pkgs, lib, ... }:

{
  networking.hostName = "mocaccino"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.dhcpcd.enable = true;

  services.openssh.enable = true;
}
