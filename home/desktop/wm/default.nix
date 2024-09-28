{ config
, lib
, ...
}: {
  imports = [
    ./hyprland
    ./waybar
    ./lock.nix
    ./anyrun
    ./wlogout
    ./swayosd.nix
    ./swaync
  ];
}
