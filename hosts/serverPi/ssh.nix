{ ... }: {
  services.openssh = {
    enable = true;
    startWhenNeeded = true;
    settings = {
      #PermitRootLogin = "no";
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };
}
