{ config, pkgs, inputs, ... }:

{
  # Home-manager state version.
  home.stateVersion = "25.11";

  # Packages for the user.
  home.packages = with pkgs; [
    #  thunderbird
	google-chrome
	brave
	udiskie
	nautilus
	fuzzel
	signal-desktop
	zoom-us
	ghostty
  ];

  # Enable home-manager.
  programs.home-manager.enable = true;

  xdg.configFile."niri/config.kdl" = {
    source = inputs.self + "/nixos/config/niri/config.kdl";
    force = true;
  };

  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri = {
    enable = true;
    # Niri configuration will be placed here
  };

  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];

  programs.zsh.shellAliases = {
    # Git aliases
    g = "git";
    ga = "git add";
    gb = "git branch";
    gc = "git commit";
    gco = "git checkout";
    gd = "git diff";
    gs = "git status";
    gp = "git push";
    gl = "git pull";
    
    # NixOS aliases
    nos = "nh os switch .#nixos";
    "n-clean" = "nh clean -k 5";
  };
}
