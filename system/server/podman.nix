{ ... }:
let
in {
  # Runtime
  virtualisation.podman = {
    enable = true;
    autoPrune.enable = true;
    dockerCompat = true;
    defaultNetwork.settings = {
      # Required for container networking to be able to use names.
      dns_enabled = true;
    };
  };
  virtualisation.oci-containers.backend = "podman";
  # services.immich = {
  #   enable = true;
  #   environment.IMMICH_MACHINE_LEARNING_URL = "http://localhost:3003";
  # };
  # users.users.immich.extraGroups = ["video" "render"];
}
