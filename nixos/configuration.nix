# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/system.nix
      ./modules/bootloader.nix
      ./modules/graphical.nix
      ./modules/sound.nix
      ./modules/packages.nix
      ./modules/services.nix
      ./modules/user.nix
      ./modules/power.nix
      ./modules/fonts.nix
      ./modules/security.nix
    ];
}