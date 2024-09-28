{ config
, lib
, ...
}: {
  imports = [
    ./hyprland
    ./waybar
    ./lock.nix
    ./wofi
    ./wlogout
    ./swayosd.nix
    ./swaync
  ];
}
