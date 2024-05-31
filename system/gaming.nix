{ pkgs, ... }:
let
  myLutrisPkg =
    let
      hackedPkgs = pkgs.extend (final: prev: {
        buildFHSEnv = args:
          prev.buildFHSEnv (args // {
            extraBwrapArgs = (args.extraBwrapArgs or [ ]) ++ [ "--cap-add ALL" ];
          });
      });
    in
    hackedPkgs.lutris;
in
{
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
  };
  #Enable Gamescope
  programs.gamescope = {
    enable = true;
    capSysNice = true; #TODO when this is fixed, remove this line
    args = [ "--prefer-vk-device 1002:73ff" ];
    env = {
      "__GLX_VENDOR_LIBRARY_NAME" = "amd";
      "DRI_PRIME" = "1";
      "MESA_VK_DEVICE_SELECT" = "pci:1002:73ff";
      "__VK_LAYER_MESA_OVERLAY_CONFIG" = "ld.so.preload";
      "DISABLE_LAYER_AMD_SWITCHABLE_GRAPHICS_1" = "1";
    };
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
        softrealtime = "auto";
        renice = 10;
      };
      custom = {
        start = "notify-send -a 'Gamemode' 'Optimizations activated'";
        end = "notify-send -a 'Gamemode' 'Optimizations deactivated'";
      };
    };
  };
  #programs.steam.package = pkgs.steam.override { privateTmp = false; };
  nixpkgs.config.packageOverrides = pkgs: {
    steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    protonup-qt
    myLutrisPkg
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

