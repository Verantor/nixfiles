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
        vo = "gpu-next";
        profile = "gpu-hq";
        save-position-on-quit = "yes";
        background = "#00000000";
        alpha = "yes";
        osc = "no";
      };
      scripts = with pkgs.mpvScripts; [ mpris thumbnail sponsorblock ];
    };

    obs-studio = {
      enable = true;
      plugins = with pkgs.obs-studio-plugins; [ wlrobs ];
    };
  };
}
