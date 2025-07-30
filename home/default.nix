{pkgs, ...}: {
  personal = {
    profiles = {
      dev = true;
      multimedia = true;
      social = true;
      syncing = true;
    };
    identities = {
      personal = true;
      work = true;
    };
  };

  accounts.email.accounts.personal.primary = true;

  home.packages = [pkgs.screen];

  personal.x.i3.devices = {
    wifi = "wlp2s0";
    eth = "enp0s31f6";
  };
}
