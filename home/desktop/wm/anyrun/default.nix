{ pkgs
, inputs
, lib
, config
, ...
}:
let
  anyrunPkgs = inputs.anyrun.packages.${pkgs.system};
in
{
  home.packages = [
    (pkgs.writeShellScriptBin "anyrun-dmenu" ''
      anyrun --plugins "${anyrunPkgs.stdin}/lib/libstdin.so" --hide-plugin-info true --show-results-immediately true --max-entries 15
    '')
  ];

  programs.anyrun = lib.mkIf config.sys.hyprland.enable {
    enable = true;
    # enable = true;
    config = {
      plugins = with anyrunPkgs; [
        applications
        # randr
        rink
        websearch
        shell
        symbols
        stdin
      ];
      y.fraction = 0.2;
      width = { fraction = 0.5; };
      closeOnClick = true;
      hidePluginInfo = true;
      showResultsImmediately = true;
      maxEntries = 10;
    };
    extraConfigFiles = {
      "shell.ron".text =
        # rust
        ''
          Config(
              prefix: ">",
          )
        '';
      "applications.ron".text =
        # rust
        ''
          Config(
            max_entries: 10,
            terminal: Some("foot"),
          )
        '';
      "symbols.ron".text =
        # rust
        ''
          Config(
            // The prefix that the search needs to begin with to yield symbol results
            prefix: ":sy",

            // Custom user defined symbols to be included along the unicode symbols
            symbols: {
              // "name": "text to be copied"
              "shrug": "¯\\_(ツ)_/¯",
              "tableflip": "(╯°□°)╯︵ ┻━┻",
              "unflip": "┬─┬ノ( º _ ºノ)",
            },

            // The number of entries to be displayed
            max_entries: 3,
          )
        '';
      "websearch.ron".text =
        # rust
        ''
          Config(
            prefix: ":q",
            // Options: Google, Ecosia, Bing, DuckDuckGo, Custom
            //
            // Custom engines can be defined as such:
            // Custom(
            //   name: "Searx",
            //   url: "searx.be/?q={}",
            // )
            //
            // NOTE: `{}` is replaced by the search query and `https://` is automatically added in front.
            engines: [Google]
          )
        '';
    };
    extraCss = ''
      window {
        background: transparent;
      }

      #match,
      #entry,
      #plugin,
      #main {
        background: transparent;
        font-size: 1.1rem;
      }

      #match.activatable {
        padding: 12px 14px;
        border-radius: 12px;

        color: white;
        margin-top: 4px;
        border: 2px solid transparent;
        transition: all 0.3s ease;
      }

      #match.activatable:not(:first-child) {
        border-top-left-radius: 0;
        border-top-right-radius: 0;
        border-top: 2px solid rgba(255, 255, 255, 0.1);
      }

      #match.activatable #match-title {
        font-size: 1.3rem;
      }

      #match.activatable:hover {
        border: 2px solid rgba(255, 255, 255, 0.4);
      }

      #match-title, #match-desc {
        color: inherit;
      }

      #match.activatable:hover, #match.activatable:selected {
        border-top-left-radius: 12px;
        border-top-right-radius: 12px;
      }

      #match.activatable:selected + #match.activatable, #match.activatable:hover + #match.activatable {
        border-top: 2px solid transparent;
      }

      #match.activatable:selected, #match.activatable:hover:selected {
        background: rgba(255,255,255,0.1);
      }

      #match, #plugin {
        box-shadow: none;
      }

      #entry {
        color: white;
        box-shadow: none;
        border-radius: 12px;
      }

      box#main {
        background: rgba(36, 39, 58, 0.7);
        border-radius: 16px;
        padding: 8px;
        box-shadow: 0px 2px 33px -5px rgba(0, 0, 0, 0.4);
      }

      row:first-child {
        margin-top: 6px;
      }
    '';
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
