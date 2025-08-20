{ config, pkgs, libs, ... }:

{
  users.users.moccha = {
    isNormalUser = true;
    description = "moccha";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
    shell = pkgs.fish;
  };
}
