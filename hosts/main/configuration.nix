# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config
, pkgs
, inputs
, ...
}: {
  imports = [
  ];

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
        KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "who"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  console.keyMap = "us";



  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma6.enable = true;
  #services.xserver.displayManager.defaultSession = "plasma";
  #services.xserver.displayManager.sddm.wayland.enable = true;
  services.mullvad-vpn.enable = true;
  services.flatpak.enable = true;


  networking.networkmanager.enable = true;
  networking.interfaces.eth0.wakeOnLan.enable = true;
  services.printing.enable = true;
  hardware.bluetooth.enable = true;
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.ver = {
    isNormalUser = true;
    description = "ver";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.fish;
    ignoreShellProgramCheck = true;
    #packages = with pkgs; [
    #];
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
  #services.ollama.enable = true;
  #services.ollama.acceleration = "rocm";
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  #programms
  services.flatpak.packages = [
    "com.spotify.Client"
    "com.prusa3d.PrusaSlicer"
    "codes.merritt.Nyrna"
    "org.pipewire.Helvum"
    "org.freecadweb.FreeCAD"
    "org.raspberrypi.rpi-imager"
    "io.github.finefindus.Hieroglyphic"
    "com.github.Darazaki.Spedread"
  ];
  environment.systemPackages = with pkgs; [

    git
    sunshine
    nixpkgs-fmt
    gamescope

    gamemode
    wine
    vulkan-tools
    just


    cargo
    rustc
    rust-analyzer

    alvr


    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        skellock.just
        enkia.tokyo-night
        usernamehw.errorlens
        rust-lang.rust-analyzer
        arrterian.nix-env-selector
        github.copilot
      ];
    })
  ];
  #programs.fish.enable = true;


  #android
  programs.adb.enable = true;

  #virtualisation
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  #system
  environment.variables.AMD_VULKAN_ICD = "RADV";
  hardware.opengl = {
    # Mesa
    enable = true;

    # Vulkan
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr.icd
      rocm-opencl-icd
      amdvlk
    ];
  };

  #Games
  programs.steam.gamescopeSession.enable = true;
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          gamescope
        ];
    };
  };

  programs.gnupg.agent.enable = true;

  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # programs here, NOT in environment.systemPackages
  ];





  #SUNSHINE TODO: move to file
  security.wrappers.sunshine = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+p";
    source = "${pkgs.sunshine}/bin/sunshine";
  };
  services.avahi.publish.userServices = true;
  boot.kernelModules = [ "uinput" ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [
    47984
    47989
    48010
    {
      from = 1714;
      to = 1764;
    }
    57621
  ];
  networking.firewall.allowedUDPPorts = [
    {
      from = 47998;
      to = 48000;
    }
    48002
    48010
    {
      from = 1714;
      to = 1764;
    }
    5353
  ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;


  system.autoUpgrade = {
    enable = true;
    flake = inputs.self.outPath;
    flags = [
      "--update-input"
      "nixpkgs"
      "-L"
    ];
    dates = "09:00";
    randomizedDelaySec = "45min";
  };

  boot.loader.systemd-boot.configurationLimit = 10;
  #boot.loader.grub.configurationLimit = 10;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings.auto-optimise-store = true;


  system.stateVersion = "23.11"; # Did you read the comment?
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
