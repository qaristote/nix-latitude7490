{ config, pkgs, ... }:

{
  networking.hostName = "latitude-7490";

  # NetworkManager
  environment.systemPackages = with pkgs; [ networkmanager ];
  networking.networkmanager = {
    enable = true;
  };

  # Hosts
  networking.hosts = {
  };

  # DHCP
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp2s0.useDHCP = true;

  # Firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [
      # Syncthing
      22000
    ];
    allowedTCPPortRanges = [
      # KDEConnect
      {
        from = 1714;
        to = 1764;
      }
    ];
    allowedUDPPorts = [
      # Syncthing
      22000
      21027
    ];
    allowedUDPPortRanges = [
      # KDE Connect
      {
        from = 1714;
        to = 1764;
      }
    ];
  };
}
