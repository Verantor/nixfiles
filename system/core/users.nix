{ config, ... }: {
  services.openssh = {
    enable = true;
    openFirewall = true;
    startWhenNeeded = true;
  };
  users = {
    mutableUsers = false;
    users = {
      ver = {
        hashedPasswordFile = config.sops.secrets.userPasswordHashed.path;
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
          "openrazer"
        ];
        uid = 1000;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMSLJdX3c3bgudmooK2+W6iKCFNvMhS/PdBvRntgXRo maxj-rothe@web.de"
        ];
      };

      root.openssh.authorizedKeys.keys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBMSLJdX3c3bgudmooK2+W6iKCFNvMhS/PdBvRntgXRo maxj-rothe@web.de"
      ];
    };
  };
}
