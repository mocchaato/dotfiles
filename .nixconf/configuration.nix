# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, inputs, ... }:

{
  imports = [ 
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Nix Module Handling
    ./nixModules/default.nix

    # Home Manager
    inputs.home-manager.nixosModules.default
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "moccha" = import ./homeManagerModules/home.nix;
    };
  };

  fileSystems."/home/moccha/Gamedisk" = {
    device = "/dev/disk/by-uuid/7474D01974CFDC4C";
    fsType = "ntfs";
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
