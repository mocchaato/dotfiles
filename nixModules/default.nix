{ config, pkgs, lib, ... }:

# Redirect file to all sub-categories
{
  imports = [
    # General system handling
    ./system/general.nix

    # General package handling
    ./packages/general.nix

    # General theme handling
    ./theming/main.nix
  ];
}
