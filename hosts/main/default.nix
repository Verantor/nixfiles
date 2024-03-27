{ pkgs, ... }: {
  imports = [ ./hardware-configuration.nix ];


  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="pci", DRIVER=="pcieport", ATTR{power/wakeup}="disabled"
        KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"
  '';

  services.mullvad-vpn.enable = true;
  services.flatpak.enable = true;


  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  boot.kernelPackages = pkgs.linuxPackages_zen;

  #TODO clean up and move to separate file
  programs.fish.enable = true;
  users.users.ver.shell = pkgs.fish;
  users.users.ver.useDefaultShell = true;

  #TODO clean up and move to separate file
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
  #TODO clean up and move to separate file

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
  #TODO clean up and move to separate file
  environment.systemPackages = with pkgs; [
    fish
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

    sops #TODO find better place for this

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
      ];
    })
  ];

  programs = {
    adb.enable = true;
  };
}
