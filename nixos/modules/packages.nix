{ config, pkgs, ... }:

{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
	xwayland
	xwayland-satellite
    	sddm-sugar-dark
	libsForQt5.qt5.qtgraphicaleffects
	libsForQt5.qt5.qtquickcontrols2
	libsForQt5.qt5.qtsvg
	vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	neovim
    	wget
	git
	auto-cpufreq
	kitty
	onlyoffice-desktopeditors

	gemini-cli


	#theme
	papirus-icon-theme
        tela-icon-theme
        numix-icon-theme
	nwg-look
	brightnessctl

	avahi
	gutenprint
	hplip
	
	ntfs3g

	sof-firmware
	alsa-firmware
	alsa-utils
	pavucontrol
	pulsemixer
	alsa-ucm-conf
	easyeffects
	nh
  ];
}
