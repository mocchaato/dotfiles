{ config, pkgs, inputs, ... }:

{
  home.username = "moccha";
  home.homeDirectory = "/home/moccha";
  home.stateVersion = "25.05"; # Please read the comment before changing.

  imports = [
    ./theming/quickshell/quickshell.nix 
  ];
  xdg.configFile = {
    "qt5ct/qt5ct.conf".text = pkgs.lib.generators.toINI { } {
      Appearance = {
        icon_theme = "Papirus-Dark"; # Replace with your desired icon theme
      };
    };
  };
  home.packages = with pkgs; [
    gruvbox-kvantum
  ];

  home.file = {
    
  };
  
  home.sessionVariables = {
    
  };

  programs.home-manager.enable = true;
}
