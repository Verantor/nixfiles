_: {
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
    settings = {
      sunshine_name = "nixos";
    };
  };

  services.avahi.publish.userServices = true;
  boot.kernelModules = [ "uinput" ];
}
