{ ... }: {
  # convert rrggbb hex to #rrggbb


  stylix.base16Scheme = {
    base00 = "282828";
    base01 = "3c3836";
    base02 = "504945";
    base03 = "665c54";
    base04 = "bdae93";
    base05 = "d5c4a1";
    base06 = "ebdbb2";
    base07 = "fbf1c7";
    base08 = "fb4934";
    base09 = "fe8019";
    base0A = "fabd2f";
    base0B = "b8bb26";
    base0C = "8ec07c";
    base0D = "83a598";
    base0E = "d3869b";
    base0F = "d65d0e";
  };
  stylix.image = ./wallpapers/wall2.png;

  x = c: "#${c}";

  # colors = rec {
  #   rosewater = "f2d5cf";
  #   flamingo = "eebebe";
  #   pink = "f4b8e4";
  #   mauve = "ca9ee6";
  #   red = "e78284";
  #   maroon = "ea999c";
  #   peach = "ef9f76";
  #   yellow = "e5c890";
  #   green = "a6d189";
  #   teal = "81c8be";
  #   sky = "99d1db";
  #   sapphire = "85c1dc";
  #   blue = "8caaee";
  #   lavender = "babbf1";
  #   text = "c6d0f5";
  #   subtext1 = "b5bfe2";
  #   subtext0 = "a5adce";
  #   overlay2 = "949cbb";
  #   overlay1 = "838ba7";
  #   overlay0 = "737994";
  #   surface2 = "626880";
  #   surface1 = "51576d";
  #   surface0 = "414559";
  #   base = "303446";
  #   mantle = "292c3c";
  #   crust = "232634";

  #   accent = pink;
  # };

  wallpaper = ./wallpapers;

  font = "FiraCode Nerd Font Mono"; #"JetBrainsMono Nerd Font Mono";
}
