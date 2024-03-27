{ pkgs, ... }: {
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
}
