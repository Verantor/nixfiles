{ pkgs
, inputs
, ...
}: {
  imports = [
    ./../../modules/wivrn.nix
  ];
  # programs.envision = {
  #   enable = true;
  #   openFirewall = true;
  # };
  # services.monado = {
  #   enable = true;
  #   defaultRuntime = true; # Register as default OpenXR runtime
  # };
  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };
  environment.systemPackages = with pkgs; [
    wlx-overlay-s
  ];

  services.wivrn = {
    enable = true;
    openFirewall = true;
    defaultRuntime = true;
    autoStart = false;
    package = pkgs.callPackage ../../pkgs/package.nix { };
    monadoEnvironment = {
      XRT_COMPOSITOR_LOG = "debug";
      XRT_PRINT_OPTIONS = "on";
      IPC_EXIT_ON_DISCONNECT = "off";
    };

    config = {
      enable = true;
      json = {
        scale = 0.5;
        bitrate = 100000000;
        encoders = [
          {
            encoder = "vaapi";
            codec = "h265";
            width = 0.5;
            height = 1.0;
            offset_x = 0.0;
            offset_y = 0.0;
            group = 0;
          }
          {
            encoder = "vaapi";
            codec = "h265";
            width = 0.5;
            height = 1.0;
            offset_x = 0.5;
            offset_y = 0.0;
            group = 0;
          }
        ];
        application = pkgs.wlx-overlay-s;
        tcp_only = true;
      };
    };
  };
}
