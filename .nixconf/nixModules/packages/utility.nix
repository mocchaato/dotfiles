{ config, pkgs, lib, ... }:

{
  programs.fish.enable = true;
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    bat
    fzf
    btop
    neovim
    discord
    fastfetch
    lsd
    kdePackages.dolphin
    kdePackages.ark
    font-manager
    qt6ct
    killall
  ];
}
