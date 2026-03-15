{ config, pkgs, ... }:

{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 5;
  boot.loader.timeout = 1;

	#  boot.loader.grub = {
	# enable = true;
	# device = "nodev";
	# efiSupport = true;
	# useOSProber = true;
	# gfxmodeEfi = "1920x1080";
	#  };
  boot.loader.efi.canTouchEfiVariables = true;
}
