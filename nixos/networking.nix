{...}: {
  personal.networking = {
    enable = true;
    bluetooth.enable = true;
    networkmanager.enable = true;
    firewall = {
      syncthing = true;
      kdeconnect = true;
    };
  };

  networking = {
    hostName = "latitude-7490";
    hosts = {
      "10.3.141.1" = ["raspberrypi.local"];
      "192.168.1.10" = ["dionysos.local"];
      # "10.233.1.2" = [ "searx.aristote.fr" "quentin.aristote.fr" "aristote.fr" ];
    };

    interfaces = {
      enp0s31f6.useDHCP = true;
      wlp2s0.useDHCP = true;
    };
  };

  # NAT
  boot.kernel.sysctl = {"net.ipv4.ip_forward" = 1;};
  networking = {
    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "wlp2s0";
    };
  };
}
