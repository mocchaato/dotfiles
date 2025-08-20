{ config, libs, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    #basic fonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols

    #nerd fonts
    nerd-fonts.departure-mono
  ];
}
