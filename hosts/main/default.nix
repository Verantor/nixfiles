{ pkgs
, inputs
, config
, ...
}:
let
  # maccelModule = config.boot.kernelPackages.callPackage ./maccelModule.nix { };
in
{
  # boot.extraModulePackages = [ maccelModule ];
  imports = [
    ./hardware-configuration.nix
    ./regreet.nix
    ./programs.nix
    ./services.nix
  ];
  virtualisation.containers.enable = true;
  chaotic.nyx.cache.enable = true;
  services.udev.extraRules = ''
    # Motherboard buggy when sleeeeep
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
    KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"

    # PS5 DualSense controller over USB hidraw
    KERNEL=="hidraw*", ATTRS{idVendor}=="054c", ATTRS{idProduct}=="0ce6", MODE="0660", TAG+="uaccess"

    # PS5 DualSense controller over bluetooth hidraw
    KERNEL=="hidraw*", KERNELS=="*054C:0CE6*", MODE="0660", TAG+="uaccess"
  '';
  # boot.plymouth = {
  #   enable = true;
  #   themePackages = [
  #     (pkgs.catppuccin-plymouth.override {
  #       variant = "mocha";
  #     })
  #   ];
  #   theme = "catppuccin-mocha";
  #   logo = "${pkgs.nixos-icons}/share/icons/hicolor/48x48/apps/nix-snowflake-white.png";
  # };

  services.flatpak.enable = true;

  # nix = {
  #   extraOptions = ''
  #     !include ${config.sops.secrets.githubAccesstoken.path}
  #   '';
  #   sops.secrets.githubAccesstoken = {
  #     mode = "0440";
  #     group = config.users.groups.keys.name;
  #   };
  # };

  services.devmon.enable = true;

  services.gvfs.enable = true;
  services.udisks2.enable = true;

  environment.pathsToLink = [ "share/thumbnailers" ];

  services.xserver.enable = true;
  # services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # services.xserver.desktopManager.plasma6.enable = true;
  # xdg.portal = {
  #   enable = true;
  #   extraPortals = with pkgs; [
  #     xdg-desktop-portal-gtk
  #     #pkgs.xdg-desktop-portal-hyprland
  #     #inputs.xdg-portal-hyprland.packages.${pkgs.system}.default
  #   ];
  #   config = {
  #     common.default = "*";
  #   };
  # };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  security.pam.services.hyprlock = { };
  security.sudo.extraConfig = "Defaults pwfeedback";
  programs.dconf.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  #TODO clean up and move to separate file
  users.users.ver.shell = pkgs.fish;
  users.users.ver.useDefaultShell = true;
  programs.fish.enable = true;

  #TODO clean up and move to separate file and homemanager
  fonts.packages = with pkgs; [
    material-icons
    material-design-icons
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];

  # services.power-profiles-daemon.enable = true;

  security.pam.services.login.enableGnomeKeyring = true;

  boot.binfmt.emulatedSystems = [ "aarch64-linux" ];

  #TODO clean up and move to separate file



  environment.systemPackages = with pkgs; [
    # ./cli.nix
    fish
    nushell
    git
    nixpkgs-fmt
    virt-manager
    powertop
    wine
    vulkan-tools
    just
    lshw
    cargo
    rustc
    rust-analyzer
    parallel-disk-usage
    protonvpn-gui
    libnatpmp
    protonvpn-cli_2
    #lxqt.lxqt-policykit
    dua
    gnumake
    linuxHeaders
    gimp
    ffmpegthumbnailer
    #thud
    nufraw-thumbnailer
    libheif
    gnome-epub-thumbnailer
    jamesdsp
    #super-slicer
    alvr
    # piper-tts
    nvd #nixversiondiff
    glib
    glibc
    dwarfs
    aria2
    f3d
    nixos-generators
    fuse-overlayfs
    sops #TODO find better place for this like sops.nix
    comma
    deadnix
    razergenie
    openrazer-daemon
    polychromatic
    # davinci-resolve
    evhz
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        skellock.just
        enkia.tokyo-night
        usernamehw.errorlens
        rust-lang.rust-analyzer
        arrterian.nix-env-selector
        github.copilot
        gruntfuggly.todo-tree
        charliermarsh.ruff
        ms-python.python
        dart-code.flutter
        vscodevim.vim
        golang.go
      ];
      # ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      #   {
      #     name = "zmk-tools";
      #     publisher = "spadin";
      #     version = "1.4.0";
      #     sha256 = "7faeee39d7d94c674818d550b8bb85e9278566a2aa06fe39e4620b8f7e9b672f";
      #   }
      # ];
    })
  ];
}
