{ config, libs, pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;

  services.printing.enable = true;
  
  security.polkit.enable = true;

  services.upower.enable = true;
}
