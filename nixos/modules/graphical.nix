{ config, pkgs, ... }:

{
  # Enable SDDM and Wayland
  services.displayManager.sddm = {
  	enable = true;
	wayland.enable = true;
	theme = "sddm-sugar-dark";

	extraPackages = with pkgs; [
	    sddm-sugar-dark
	];
  };

  # Enable niri
  programs.niri = {
	enable = true;
  };
#  programs.niri.xwayland-satellite.enable = true;
  programs.xwayland.enable = true;
  systemd.user.services.xwayland-satellite = {
	  description = "XWayland Satellite";
	  wantedBy = [ "graphical-session.target" ];
	  partOf = [ "graphical-session.target" ];
	  serviceConfig = {
	    ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite";
	    Restart = "always";
	  };
	};

  # grahics
  #hardware.opengl.enable = true;
  hardware.graphics = {
	enable = true;
	extraPackages = with pkgs; [
		intel-media-driver
		intel-vaapi-driver
	];
  };

  environment.sessionVariables = {
	NIXOS_OZONE_WL = "1";
	MOZ_ENABLE_WAYLAND = "1";
	QT_QPA_PLATFORM = "wayland";
	SDL_VIDEODRIVER = "wayland";
	CLUTTER_BACKEND = "wayland";
	XDG_SESSION_TYPE = "wayland"; 
	XDG_TERMINAL_EMULATOR = "ghostty";
  };

  # setting untuk tema
  programs.dconf.enable = true;

  environment.variables = {
    ALSA_CONFIG_UCM2 = "${pkgs.alsa-ucm-conf}/share/alsa/ucm2";
        GTK_THEME = "Papirus";
      };
    
    	environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    	  [Settings]
    	  gtk-icon-theme-name=Papirus
    	'';
    
    	environment.etc."xdg/gtk-4.0/settings.ini".text = ''
    	  [Settings]
    	  gtk-icon-theme-name=Papirus
    	'';
    
    }
