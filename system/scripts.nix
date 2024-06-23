{ pkgs
, theme
, ...
}: {
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "nixrb" ''
      nixpkgs-fmt .
      git diff -U0 '*.nix'
      sudo echo "NixOS Rebuilding..."
      sudo nixos-rebuild switch --flake .#main |& nom
      git commit -am "NixOS Rebuilt"
      notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
    '')
    (writeShellScriptBin "nixup" ''
      nixpkgs-fmt .
      git diff -U0 '*.nix'
      sudo nix flake update
      sudo echo "NixOS Updating..."
      sudo nixos-rebuild switch --upgrade --flake .#main |& nom
      git commit -am "NixOS Update"
      notify-send -e "NixOS Update OK!" --icon=software-update-availableb
    '')
    (writeShellScriptBin "nixof" ''
      sudo nixos-rebuild switch --offline --upgrade --flake .#main
    '')
    # (writeShellScriptBin "waybar-kde-connect.sh" ''
    #   get_status() {
    #       for device in $(qdbus --literal org.kde.kdeconnect /modules/kdeconnect org.kde.kdeconnect.daemon.devices); do
    #           deviceid=$(echo "$device" | awk -F'["|"]' '{print $2}')
    #           isreach="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid" org.kde.kdeconnect.device.isReachable)"
    #       if [ "$isreach" = "true" ]
    #           then
    #               battery="$(qdbus org.kde.kdeconnect "/modules/kdeconnect/devices/$deviceid/battery" org.kde.kdeconnect.device.battery.charge)󰏰"
    #               icon="󰄜"
    #               devices+="$icon $battery"
    #               conn+=connected
    #       else
    #           devices+="󰥍"
    #           conn+=disconnected
    #           fi
    #       done
    #       echo -e "$devices\nKDE Connect\n$conn"
    #   }

    #   option="''${1}"
    #       case "''${option}" in
    #           battery) get_status
    #               ;;
    #           *) echo "Use with ./custom-kdeconnect.sh battery"
    #               ;;
    #       esac

    #   exit 0
    # '')
    # (writeShellScriptBin "nixiso" ''
    #   sudo nixos-generate -f iso --flake ".#serverPi" --system aarch64-linux
    # '')
    # (
    #   pkgs.writers.writePython3Bin "microphone_changer.py"
    #     {
    #       flakeIgnore = [ "E265" "E225" "E501" "W292" "W293" "E305" "E302" ];
    #     }
    #     (builtins.readFile ../scripts/microphone_changer.py)
    # )
    # (
    #   pkgs.writers.writePython3Bin "audio_changer.py"
    #     {
    #       flakeIgnore = [ "E265" "E225" "E501" "W292" "W293" "E305" "E302" ];
    #     }
    #     (builtins.readFile ../scripts/audio_changer.py)
    # )
    # (
    #   writeShellScriptBin "nixbr" ''
    #     nixos-rebuild --target-host root@192.168.178.190 switch --flake .#serverPi |& nom
    #   ''
    # )
    (
      writeShellScriptBin "pvpnPortforwarding" (builtins.readFile ../scripts/pvpnPortforwarding.sh)
    )
  ];
}
