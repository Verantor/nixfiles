_: {
  services = {
    # LAN discovery
    avahi = {
      enable = true;
      nssmdns4 = true;
    };
    # services.ollama = {
    #   enable = true;
    #   #package = pkgs.stable.ollama;
    #   acceleration = "rocm";
    #   environmentVariables = {
    #     HSA_OVERRIDE_GFX_VERSION = "10.3.0 HCC_AMDGPU_TARGET=gfx1030";
    #   };
    # };
    devmon.enable = true;

    udisks2.enable = true;
  };
}
