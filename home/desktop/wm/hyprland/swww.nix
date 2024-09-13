{ theme
, pkgs
, ...
}: {
  home.packages = with pkgs; [
    swww
    (writeShellScriptBin "select-wall" ''
      #!/bin/sh
      NEW_WALL=$(ls ${theme.wallpaper} |  anyrun-dmenu)
      echo ${theme.wallpaper}/$NEW_WALL
      swww img ${theme.wallpaper}/$NEW_WALL --transition-type grow
    '')
  ];
}
