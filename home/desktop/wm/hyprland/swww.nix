{ theme
, pkgs
, ...
}:

{

  home.packages = with pkgs;

    [
      swww
      (writeShellScriptBin "select-wall.sh" ''
        #!/bin/sh
        NEW_WALL=$(ls ${theme.wallpaper} | wofi --dmenu --allow-images true)
        echo ${theme.wallpaper}/$NEW_WALL
        swww img ${theme.wallpaper}/$NEW_WALL --transition-type grow
      '')
    ];
}
    
