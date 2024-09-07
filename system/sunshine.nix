{pkgs, ...}: {
  services.sunshine = {
    enable = true;
    autoStart = false;
    capSysAdmin = true;
    openFirewall = true;
    settings = {
      sunshine_name = "nixos";
    };
  };
  security.wrappers.sunshine = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+p";
    source = "${pkgs.sunshine}/bin/sunshine";
  };

  services.avahi.publish.userServices = true;
  boot.kernelModules = ["uinput"];
}
