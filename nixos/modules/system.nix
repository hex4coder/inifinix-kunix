{ config, pkgs, ... }:

{
  # automate garbage collection
  nix.gc = {
  	automatic = true;                  # Enable automatic GC
  	dates = "weekly";                  # Run weekly (or e.g., "daily", "03:15" for a specific time)
  	options = "--delete-older-than 30d";  # Common: delete paths older than 30 days
  };

  # ambil kernel terbaru
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "snd_sof_intel_hda_common.dmic_num=2" "snd_intel_dspcfg.dsp_driver=3" "snd_soc_sof_8336.quirk=0x04"];
  hardware.enableAllFirmware = true;
  hardware.cpu.intel.updateMicrocode = true;

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Makassar";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable zram
  zramSwap.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Set zsh as the default shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
}
