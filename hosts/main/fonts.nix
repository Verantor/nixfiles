{ pkgs, ... }: {
  fonts.packages = with pkgs; [
    material-icons
    material-design-icons
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
}
