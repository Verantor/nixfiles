{ config
, pkgs
, lib
, ...
}:
let
  interface = "wlan0";
in
{
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    wireless = {
      enable = true;
      # networks."${SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
  };
  sops.secrets."wireless.env" = { };
  networking.wireless.environmentFile = config.sops.secrets."wireless.env".path;
  networking.wireless.networks = {
    "@home_uuid@" = {
      psk = "@home_psk@";
    };
  };
  environment.systemPackages = with pkgs; [ vim ];

  hardware.enableRedistributableFirmware = true;
  system.stateVersion = "23.11";
}
