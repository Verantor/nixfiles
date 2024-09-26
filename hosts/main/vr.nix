{ pkgs
, inputs
, ...
}: {
  imports = [
 ./../../modules/wivrn.nix 
  ];
  programs.envision = {
    enable = true;
    openFirewall = true;
  };
  # services.monado = {
  #   enable = true;
  #   defaultRuntime = true; # Register as default OpenXR runtime
  # };
  # systemd.user.services.monado.environment = {
  #   STEAMVR_LH_ENABLE = "1";
  #   XRT_COMPOSITOR_COMPUTE = "1";
  # };
  environment.systemPackages = with pkgs; [
    wlx-overlay-s
  ];
  #
  # services.wivrn = {
  #   enable = true;
  #   package = inputs.lemonake.packages.${pkgs.system}.wivrn-git;
  #   openFirewall = false;
  #   defaultRuntime = true;
  #   autoStart = true;
  #   monadoEnvironment = {
  #     XRT_LOG = "warning";
  #     XRT_COMPOSITOR_LOG = "warning";
  #     XRT_PRINT_OPTIONS = "off";
  #     PROBER_LOG = "warning";
  #   };
  #   extraPackages = [
  #     # pkgs.linuxKernel.packages.linux_zen.nvidia_x11
  #     pkgs.procps
  #     pkgs.bash
  #   ];
  #   config = {
  #     enable = true;
  #     json = {
  #       scale = 0.5;
  #       bitrate = 100000000;
  #       encoders = [
  #         {
  #           encoder = "vaapi";
  #           codec = "h265";
  #           width = 0.5;
  #           height = 1.0;
  #           offset_x = 0.0;
  #           offset_y = 0.0;
  #           group = 0;
  #         }
  #         {
  #           encoder = "vaapi";
  #           codec = "h265";
  #           width = 0.5;
  #           height = 1.0;
  #           offset_x = 0.5;
  #           offset_y = 0.0;
  #           group = 0;
  #         }
  #       ];
  #       application = pkgs.wlx-overlay-s;
  #       tcp_only = true;
  #     };
  #   };
  # };
}
