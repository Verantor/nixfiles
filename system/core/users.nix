{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;
  services.openssh = {
    enable = true;
    openFirewall = true;
    # hostKeys = [
    #   {
    #     bits = 4096;
    #     path = "/etc/ssh/ssh_host_rsa_key";
    #     type = "rsa";
    #   }
    #   {
    #     path = "/etc/ssh/ssh_host_ed25519_key";
    #     type = "ed25519";
    #   }
    # ];
  };
  users = {
    mutableUsers = false;
    users = {
      ver = {
        isNormalUser = true;
        extraGroups = [
          "wheel"
          "docker"
          "systemd-journal"
          "vboxusers"
          "audio"
          "plugdev"
          "wireshark"
          "video"
          "input"
          "lp"
          "networkmanager"
          "nix"
          "adbusers"
        ];
        uid = 1000;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMSLJdX3c3bgudmooK2+W6iKCFNvMhS/PdBvRntgXRo maxj-rothe@web.de"
        ];
      };

      root.
        openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMSLJdX3c3bgudmooK2+W6iKCFNvMhS/PdBvRntgXRo maxj-rothe@wev.de"
      ];
    };
  };
}
