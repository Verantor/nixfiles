{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "nixrb" ''
      pushd ~/.dotfiles
            nixpkgs-fmt .
            git diff -U0 '*.nix'
            sudo echo "NixOS Rebuilding..."
             FLAKE=~/.dotfiles/ nh os switch -D "nvd diff"
            git commit -am "NixOS Rebuilt"
            notify-send -e "NixOS Rebuilt OK!" --icon=software-update-available
      popd
    '')
    (writeShellScriptBin "nixup" ''

      pushd ~/.dotfiles
             nixpkgs-fmt .
             git diff -U0 '*.nix'
             sudo nix flake update
             sudo echo "NixOS Updating..."
            FLAKE=~/.dotfiles/ nh os switch -D "nvd diff" -u
             git commit -am "NixOS Update"
             notify-send -e "NixOS Update OK!" --icon=software-update-available
            popd
    '')
    (writeShellScriptBin "nixof" ''
      sudo nixos-rebuild switch --offline --upgrade --flake .#main
    '')
    (writeShellScriptBin "disk-usage" ''
      cd /
      sudo ${pkgs.gdu}/bin/gdu
    '')
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
    (
      writeShellScriptBin "setaudio" (builtins.readFile ../scripts/setaudio.sh)
    )
    (
      writeShellScriptBin "nixbr" ''
        nixos-rebuild --target-host root@192.168.178.190 switch --flake .#orca  --log-format internal-json -v |& nom --json
      ''
    )
    (
      writeShellScriptBin "qPortforward" (builtins.readFile ../scripts/qPortforward.sh)
    )
    (
      writeShellScriptBin "selectCommands" ''
        # Path to the file containing the commands
        COMMANDS_FILE="${../scripts/commands.txt}"

        # Check if the commands file exists
        if [[ ! -f "$COMMANDS_FILE" ]]; then
          echo "Commands file not found: $COMMANDS_FILE"
          exit 1
        fi

        # Use rofi in dmenu mode to select a command
        selected_command=$(cat "$COMMANDS_FILE" |  anyrun-dmenu)

        # Check if a command was selected
        if [[ -n "$selected_command" ]]; then
          # Execute the selected command
          eval "$selected_command"
        else
          echo "No command selected"
        fi
      ''
    )
  ];
}
