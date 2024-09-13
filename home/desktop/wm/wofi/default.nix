{ pkgs
, inputs
, ...
}: {
  home.packages = with pkgs; [
    walker
  ];
  programs.wofi = {
    enable = true;
    # style = import ./style.nix;
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
  # programs.rofi = {
  #   enable = true;
  #   location = "center";
  #   package = pkgs.rofi-wayland-unwrapped;
  #   terminal = "foot";
  # };
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        # font = "${theme.font}";
        terminal = "${pkgs.foot}/bin/foot";
        layer = "overlay";
        width = 60;
        line-height = 50;
        lines = 5;
        fields = "filename,name,generic,keywords";
      };
      # colors = {
      #   background = "1e1e2edd";
      #   text = "cdd6f4ff";
      #   match = "f38ba8ff";
      #   selection = "585b70ff";
      #   selection-match = "f38ba8ff";
      #   selection-text = "cdd6f4ff";
      #   border = "b4befeff";
      # };
    };
  };
  programs.anyrun = {
    enable = true;
    config = {
      plugins = [
        inputs.anyrun.packages.${pkgs.system}.applications
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.3; };
      width = { fraction = 0.3; };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = false;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;
    };
  };

  # programs.walker = {
  #   enable = true;
  #   runAsService = true;
  #
  #   # All options from the config.json can be used here.
  #   config = {
  #     search.placeholder = "Example";
  #     fullscreen = true;
  #     list = {
  #       height = 200;
  #     };
  #     websearch.prefix = "?";
  #     switcher.prefix = "/";
  #   };
  #
  #   # If this is not set the default styling is used.
  #   style = ''
  #     * {
  #       color: #dcd7ba;
  #     }
  #   '';
  # };
}
