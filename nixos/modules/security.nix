{ config, pkgs, ... }:

{
  # Enable the firewall.
  networking.firewall.enable = true;

  # Allow SSH.
  networking.firewall.allowedTCPPorts = [ 22 ];
}
