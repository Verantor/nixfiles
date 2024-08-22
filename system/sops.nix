{ inputs, ... }: {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = /home/ver/.config/sops/age/keys.txt;

  sops.secrets.userPasswordHashed.neededForUsers = true;
}
