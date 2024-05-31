{ pkgs
, lib
, ...
}:
{
  programs.wofi = {
    enable = true;
    style = import ./style.nix;
    settings = {
      hide_scroll = true;
      show = "drun";
      width = "30%";
      lines = "8";
      line_wrap = "word";
      term = "foot";
      allow_markup = true;
      always_parse_args = false;
      show_all = true;
      print_command = true;
      layer = "overlay";
      allow_images = true;
      sort_order = "alphabetical";
      gtk_dark = true;
      prompt = "";
      image_size = 20;
      display_generic = false;
      location = "center";
      key_expand = "Tab";
      insensitive = false;

    };

  };
  programs.rofi = {
    enable = true;
    location = "center";
    package = pkgs.rofi-wayland-unwrapped;
    terminal = "foot";
  };
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrains Mono Nerd Font Mono";
        terminal = "foot"; #${pkgs.kitty}/bin/kitty
        layer = "overlay";
        width = 60;
        line-height = 50;
        lines = 5;
      };
      colors = {
        background = "1e1e2edd";
        text = "cdd6f4ff";
        match = "f38ba8ff";
        selection = "585b70ff";
        selection-match = "f38ba8ff";
        selection-text = "cdd6f4ff";
        border = "b4befeff";
      };
    };
  };
}

# home.packages = with pkgs; [
#   rofi-wayland-unwrapped
# ];

