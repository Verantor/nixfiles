{ outputs
, pkgs
, ...
}: {
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
      # allowBroken = true;
      permittedInsecurePackages = [
        # "electron"
        "nix-2.24.5"
      ];
    }; #
  };
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d --keep 3";
    flake = "/home/ver/.dotfiles";
  };
  nix = {
    package = pkgs.lix;
    optimise.automatic = true;
    optimise.dates = [ "18:00" ]; # Optional; allows customizing optimisation schedule
    # gc = {
    #   automatic = false; #nh aka nix helper is enabled
    #   dates = "weekly";
    #   options = "--delete-older-than 7d";
    # };
    #It is also possible to automatically run garbage collection whenever there is not enough space left.[cf. 5] For example, to free up to 1GiB whenever there is less than 100MiB left:
    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      builders-use-substitutes = true;
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://nixpkgs-unfree.cachix.org"
        "https://ai.cachix.org"
        "https://walker.cachix.org"
        "https://anyrun.cachix.org"
        "https://passivelemon.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc="
        "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
        "passivelemon.cachix.org-1:ScYjLCvvLi70S95SMMr8lMilpZHuafLP3CK/nZ9AaXM="
      ];
    };
  };
  system.stateVersion = "23.11"; # Did you read the comment?

  # system.autoUpgrade = {
  #   enable = true;
  #   flake = inputs.self.outPath;
  #   flags = [
  #     "--update-input"
  #     "nixpkgs"
  #     "-L"
  #   ];
  #   dates = "09:00";
  #   randomizedDelaySec = "45min";
  # };
}
