{ pkgs, ... }: {
  services.klipper = {
    enable = true;
    configFile = ./printer.cfg;
    # mutableConfig = true;
    firmwares = {
      mcu = {
        enable = true;
        # Run klipper-genconf to generate this
        configFile = ./printerBoard.cfg;
        # Serial port connected to the microcontroller
        serial = "/dev/serial/by-id/usb-Silicon_Labs_CP2102_USB_to_UART_Bridge_Controller_0001-if00-port0";
      };
    };
  };
  security.polkit.enable = true;
  services.moonraker = {
    user = "root";
    enable = true;
    address = "0.0.0.0";
    port = 7125;
    allowSystemControl = true;
    settings = {
      authorization = {
        cors_domains = [
          "*"
        ];
        trusted_clients = [
          "0.0.0.0/0"
          "192.168.178.190"
          "192.168.178.192"
          "127.0.0.1"
          "0.0.0.0/24"
          "10.0.0.0/8"
          "127.0.0.0/8"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "192.168.178.0/24"
          "FE80::/10"
          "::1/128"
        ];
      };
    };
  };
  services.fluidd = {
    enable = true;
    nginx.locations."/webcam".proxyPass = "http://127.0.0.1:8080/stream";
  };
  services.nginx.clientMaxBodySize = "1000m";

  systemd.services.ustreamer = {
    wantedBy = [ "multi-user.target" ];
    description = "uStreamer for video0";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.ustreamer}/bin/ustreamer --encoder=HW --persistent --drop-same-frames=30 --host=0.0.0.0 --port=8080 --device=/dev/video0'';
    };
  };
}
