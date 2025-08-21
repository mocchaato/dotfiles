{ config, pkgs, lib, ... }:

{
  imports = 
  [
    ./fonts.nix
    ./nvidia.nix
    ./user.nix
    ./network.nix
    ./locale.nix
    ./kernelboot.nix
    ./sound.nix
    ./display.nix
  ];
}
