{ config, pkgs, ... }:

{
  networking.hostName = "thinkpad-x1";

  # NetworkManager
  environment.systemPackages = with pkgs; [ networkmanager ];
  networking.networkmanager = {
    enable = true;
  };

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
