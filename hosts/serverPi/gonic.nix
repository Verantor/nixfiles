{ config, pkgs, ... }:
{
  services.gonic = {
    enable = true;
    settings = {
      cache-path = "/var/cache/gonic";
      listen-addr = "0.0.0.0:4747";
      #tls-cert = null;
      #tls-key = null;
      music-path = "/data/music";
      playlists-path = "/data/playlists";
      podcast-path = "/data/podcasts";
      #jukebox-enabled = "true";
      #jukebox-mpv-extra-args = "--audio-device=alsa/default:CARD=AMP";
    };

  };
}
