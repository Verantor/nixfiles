{ pkgs, ... }: {
  #RADV_PERFTEST=sam,nggc,gpl VKD3D_CONFIG=dxr
  # chaotic.mesa-git.enable = true;

  # nixpkgs.config.allowUnfree
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    # localNetworkGameTransfers.openFirewall = true;
    # extest.enable = true;
    # protontricks.enable = true;
    # package = pkgs.steam.override {
    #   extraPkgs = pkgs:
    #     with pkgs; [
    #       xorg.libXcursor
    #       xorg.libXi
    #       xorg.libXinerama
    #       xorg.libXScrnSaver
    #       libpng
    #       libpulseaudio
    #       libvorbis
    #       stdenv.cc.cc.lib
    #       libkrb5
    #       keyutils
    #     ];
    # };
  };
  #Enable Gamescope
  programs.gamescope = {
    enable = true;
    capSysNice = false; #TODO when this is fixed, remove this line
    # args = [ "--prefer-vk-device 1002:73ff" ];
    # env = {
    #   "__GLX_VENDOR_LIBRARY_NAME" = "amd";
    #   "DRI_PRIME" = "1";
    #   "MESA_VK_DEVICE_SELECT" = "pci:1002:73ff";
    #   "__VK_LAYER_MESA_OVERLAY_CONFIG" = "ld.so.preload";
    #   "DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1" = "1";
    # };
  };
  # security.wrappers.gamescope = {
  #   owner = "root";
  #   group = "root";
  #   source = "${pkgs.gamescope}/bin/gamescope";
  #   capabilities = "cap_sys_nice+pie";
  # };
  programs.gamemode = {
    enable = true;
    enableRenice = true;
    settings = {
      general = {
        renice = 10;
      };

      # Warning: GPU optimisations have the potential to damage hardware
      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
        gpu_device = 0;
        amd_performance_level = "high";
      };
      custom = {
        start = ''
          notify-send "GameMode started"
          sudo /root/scripts/start_game.sh
        '';
        end = ''
          notify-send "GameMode stopped"
          sudo /root/scripts/stop_game.sh
        '';
      };
    };
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
    lutris

    # (lutris.override {
    #   extraLibraries = pkgs: [
    #     # List library dependencies here
    #     jansson
    #   ];
    #   extraPkgs = pkgs: [
    #     # List package dependencies here
    #     jansson
    #   ];
    # })
  ];
}
