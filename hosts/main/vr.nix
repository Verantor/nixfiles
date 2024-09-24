{ pkgs, ... }: {
  programs.envision = {
    enable = true;
    openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    wlx-overlay-s
  ];
}
