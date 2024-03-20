# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ config
, pkgs
, inputs
, ...
}: {
  imports = [
    # Include the results of the hardware scan.
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
  networking.networkmanager.enable = true;

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma6.enable = true;
  #services.xserver.displayManager.defaultSession = "plasma";
  #services.xserver.displayManager.sddm.wayland.enable = true;
  services.mullvad-vpn.enable = true;
  services.printing.enable = true;
  services.flatpak.enable = true;
  services.flatpak.packages = [
    "com.spotify.Client"
    "com.prusa3d.PrusaSlicer"
   # "md.obsidian.Obsidian"
    "codes.merritt.Nyrna"
    "org.pipewire.Helvum"
    "org.freecadweb.FreeCAD"
    "org.raspberrypi.rpi-imager"
  ];
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  networking.interfaces.eth0.wakeOnLan.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  # services.openssh.enable = true;

  # Configure keymap in X11

  # Configure console keymap
  console.keyMap = "us";

  # Enable CUPS to print documents.
  hardware.bluetooth.enable = true;
  # Enable sound with pipewire.

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ver = {
    isNormalUser = true;
    description = "ver";
    extraGroups = [ "networkmanager" "wheel" "adbusers" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };
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
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    jetbrains-mono
  ];
  environment.variables.AMD_VULKAN_ICD = "RADV";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  #services.ollama.enable = true;
  #services.ollama.acceleration = "rocm";
  programs.steam.gamescopeSession.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    git
    sunshine
    nixpkgs-fmt
    gamescope
    mangohud
    gamemode
    wine
    vulkan-tools
    just
    tio
    vesktop
    bottles
    cargo
    rustc
    rust-analyzer
    #ollama
    alvr
    obsidian
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        skellock.just
        enkia.tokyo-night
        usernamehw.errorlens
      ];
    })
  ];
  programs.adb.enable = true;
  programs.virt-manager.enable = true;
  programs.fish.enable = true;
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          gamescope
        ];
    };
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged
    # programs here, NOT in environment.systemPackages
  ];

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

  virtualisation.libvirtd.enable = true;



  security.wrappers.sunshine = {
    owner = "root";
    group = "root";
    capabilities = "cap_sys_admin+p";
    source = "${pkgs.sunshine}/bin/sunshine";
  };
  services.avahi.publish.userServices = true;
  boot.kernelModules = [ "uinput" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

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

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  boot.loader.systemd-boot.configurationLimit = 10;
  # boot.loader.grub.configurationLimit = 10;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  nix.settings.auto-optimise-store = true;
}
