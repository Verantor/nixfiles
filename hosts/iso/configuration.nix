{ pkgs, modulesPath, config, ... }: {

  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    git
    helix


  ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix = {
    extraOptions = ''
      !include ${config.sops.secrets.githubAccesstoken.path}
    '';
    sops.secrets.githubAccesstoken = {
      mode = "0440";
      group = config.users.groups.keys.name;
    };
  };

}
