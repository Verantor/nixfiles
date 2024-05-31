{ pkgs
, lib
, ...
}: {

  programs.kitty = {
    enable = true;
    extraConfig = import ./kitty.nix;
  };
  programs.foot = {
    enable = true;
    settings = import ./foot.nix;
  };

}
