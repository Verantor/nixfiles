{ pkgs, ... }: {
  home.packages = with pkgs; [
    goverlay
  ];

  programs.mangohud = {
    enable = true;
    enableSessionWide = false;
  };
  stylix.targets.mangohud.enable = false;
}
