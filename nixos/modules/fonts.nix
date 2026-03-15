{ config, pkgs, ... }:

{
  # fonts
  fonts.packages = with pkgs; [
	corefonts
	nerd-fonts.jetbrains-mono
	noto-fonts
	noto-fonts-color-emoji
	font-awesome
  ];
}
