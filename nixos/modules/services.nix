{ config, pkgs, ... }:

{
  # Enable CUPS to print documents.
  services.printing = {
	enable = true;
	listenAddresses = [ "*:631" ];
	allowFrom = [ "all" "@LOCAL" ];
	defaultShared = true;
	browsing = true;
	openFirewall = true;
	drivers = with pkgs; [
		epson-escpr
		epson-201401w
		gutenprint
	];
  };
 
  services.avahi = {
	enable = true;
	nssmdns4 = true;
	openFirewall = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # enable disk
  services.udisks2.enable = true;
  services.gvfs.enable = true;

  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs.xfce; [
	thunar-archive-plugin
	thunar-volman
  ];

  security.polkit.enable = true;
  services.upower.enable = true;
  hardware.alsa.enablePersistence = true;

}
