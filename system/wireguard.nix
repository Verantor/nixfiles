{ pkgs, config, ... }: {
  networking.wg-quick.interfaces =
    let
      server_ip = "179.43.189.66";
    in
    {
      # wg0 = {
      #   # IP address of this machine in the *tunnel network*
      #   address = [
      #     "10.67.68.85/32"
      #     "fc00:bbbb:bbbb:bb01::4:4454/128"
      #   ];

      #   # To match firewall allowedUDPPorts (without this wg
      #   # uses random port numbers).
      #   listenPort = 51820;

      #   # Path to the private key file.
      #   privateKeyFile = config.sops.secrets.userPasswordHashed.path;

      #   peers = [{
      #     publicKey = "66NPINP4+1AlojLP0J6O9GxdloiegNnGMV4Yit9Kzg0=";
      #     allowedIPs = [ "0.0.0.0/0" ];
      #     endpoint = "${server_ip}:51820";
      #     persistentKeepalive = 25;
      #   }];

      #   # postUp = ''
      #   #   # Mark packets on the wg0 interface
      #   #   wg set wg0 fwmark 51820

      #   #   # Forbid anything else which doesn't go through wireguard VPN on
      #   #   # ipV4 and ipV6
      #   #   ${pkgs.iptables}/bin/iptables -A OUTPUT \
      #   #     ! -d 192.168.0.0/16 \
      #   #     ! -o wg0 \
      #   #     -m mark ! --mark $(wg show wg0 fwmark) \
      #   #     -m addrtype ! --dst-type LOCAL \
      #   #     -j REJECT
      #   #   ${pkgs.iptables}/bin/ip6tables -A OUTPUT \
      #   #     ! -o wg0 \
      #   #     -m mark ! --mark $(wg show wg0 fwmark) \
      #   #     -m addrtype ! --dst-type LOCAL \
      #   #     -j REJECT
      #   # '';
      #   # postDown = ''
      #   #   ${pkgs.iptables}/bin/iptables -D OUTPUT \
      #   #     ! -o wg0 \
      #   #     -m mark ! --mark $(wg show wg0 fwmark) \
      #   #     -m addrtype ! --dst-type LOCAL \
      #   #     -j REJECT
      #   #   ${pkgs.iptables}/bin/ip6tables -D OUTPUT \
      #   #     ! -o wg0 -m mark \
      #   #     ! --mark $(wg show wg0 fwmark) \
      #   #     -m addrtype ! --dst-type LOCAL \
      #   #     -j REJECT
      #   # '';

      # };
    };
}
