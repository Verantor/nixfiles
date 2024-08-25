{ pkgs
, inputs
, ...
}: {
  environment.systemPackages = with pkgs; [
    (import ./../../pkgs/nix-orca.nix)
    fish
    nushell
    git
    nixpkgs-fmt
    virt-manager
    powertop
    # wine
    winetricks
    wineWowPackages.stable
    wineWowPackages.waylandFull
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
    dua
    gnumake
    linuxHeaders
    gimp
    ffmpegthumbnailer
    nufraw-thumbnailer
    libheif
    gnome-epub-thumbnailer
    # alvr
    nvd
    glib
    glibc
    dwarfs
    f3d
    nixos-generators
    fuse-overlayfs
    sops
    comma
    deadnix
    nix-fast-build
    distrobox
    inputs.nixvimConfig.packages.${system}.default
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        jnoortheen.nix-ide
        skellock.just
        enkia.tokyo-night
        usernamehw.errorlens
        rust-lang.rust-analyzer
        arrterian.nix-env-selector
        github.copilot
        github.copilot-chat
        gruntfuggly.todo-tree
        charliermarsh.ruff
        ms-python.python
        dart-code.flutter
        vscodevim.vim
        golang.go
      ];
    })
  ];
}
