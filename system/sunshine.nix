 {pkgs, ...}: {
 
  security.wrappers.sunshine = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+p";
    source = "${pkgs.sunshine}/bin/sunshine";
  };
  services.avahi.publish.userServices = true;
  boot.kernelModules = [ "uinput" ];
}

