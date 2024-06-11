{ pkgs
, lib
, theme
, ...
}: {

  programs.kitty = {
    enable = true;
    extraConfig = import ./kitty.nix;
  };
  programs.foot = {
    enable = true;
    settings = ''  
  main = {
    font = "${theme.font}:size=15";
    dpi-aware = "yes";
    pad = "5x5 center";
  };
  cursor = {
    style = "beam";
    unfocused-style = "hollow";
  };
  colors = {
    alpha = 0.4;
    background = "24283b";
    foreground = "c0caf5";
    regular0 = "1D202F";
    regular1 = "f7768e";
    regular2 = "9ece6a";
    regular3 = "e0af68";
    regular4 = "7aa2f7";
    regular5 = "bb9af7";
    regular6 = "7dcfff";
    regular7 = "a9b1d6";
    bright0 = "414868";
    bright1 = "f7768e";
    bright2 = "9ece6a";
    bright3 = "e0af68";
    bright4 = "7aa2f7";
    bright5 = "bb9af7";
    bright6 = "7dcfff";
    bright7 = "c0caf5";
  };
    '';
  };

}

