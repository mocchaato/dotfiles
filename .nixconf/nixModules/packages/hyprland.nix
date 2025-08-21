{ config, pkgs, lib, ... }:

{
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprlock
    hyprpaper
    rofi
    wlogout
    kitty
    quickshell
    material-icons
    hyprshot
    hypridle
  ];
}
