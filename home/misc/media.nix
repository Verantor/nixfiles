{ pkgs, ... }: {
  programs = {
    mpv = {
      enable = true;
      bindings = {
        UP = "add volume +2";
        DOWN = "add volume -2";
      };
      # https://wiki.archlinux.org/title/mpv#Hardware_video_acceleration
      config = {
        hwdec = "auto-safe";
        gpu-context = "wayland";
        vo = "gpu";
        profile = "gpu-hq";
      };
      scripts = with pkgs.mpvScripts; [ mpris thumbnail sponsorblock ];
    };

    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [ wlrobs ];
    };
  };
}
