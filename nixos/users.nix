{config, ...}: {
  personal.user = {
    enable = true;
    name = "qaristote";
    homeManager.enable = true;
  };

  home-manager.extraSpecialArgs.osConfig = config;
}
