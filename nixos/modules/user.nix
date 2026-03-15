{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kunix = {
    isNormalUser = true;
    description = "kunix";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "plugdev" "lpadmin" ];
  };
}
