{ config, pkgs, ... }:

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
