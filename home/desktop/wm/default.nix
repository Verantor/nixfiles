{ config
, lib
, ...
}: {
  imports = [
    ./hyprland
    ./waybar
    ./lock.nix
    ./dunst.nix
    ./wofi
    ./wlogout
    ./swayosd.nix
    ./swaync
  ];
}
