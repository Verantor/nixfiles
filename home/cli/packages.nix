{ config
, pkgs
, inputs
, lib
, ...
}: {
  home.packages = with pkgs; [
    nix-output-monitor
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    whois
    nmap
    tio
    ouch
    nil
    gping
    tealdeer
    glow
    catimg
    wget
    fd
    hcxdumptool
    hashcat
    fd
    fzf
    nnn
    pipx
    netscanner
    dua
    lazygit
    #android-studio
    ffmpeg
    ripgrep
    apacheHttpd
  ];

  programs.tmux = {
    enable = false;
    clock24 = true;
    mouse = true;
  };
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;
    settings = {
      on_force_close = "quit";
      default-shell = "zsh";
      simplified_ui = true;
      copy_command = lib.getExe' pkgs.wl-clipboard "wl-copy";
      pane_frames = false;
      default_layout = "compact";
      copy_on_select = false;
      hide_session_name = true;
      session_serialization = true;
      ui.pane_frames = {
        hide_session_name = true;
        rounded_corners = true;
      };
      plugins = [ "compact-bar" "session-manager" "filepicker" "welcome-screen" ];
      theme = lib.mkForce "tokyonight_storm";
      themes.tokyonight_storm = {
        fg = "#c0caf5";
        bg = "#292e42";
        black = "#1d202f";
        red = "#f7768e";
        green = "#9ece6a";
        yellow = "#e0af68";
        blue = "#7aa2f7";
        magenta = "#bb9af7";
        cyan = "#7dcfff";
        white = "#a9b1d6";
        orange = "#ff9e64";
      };
    };
  };
  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd c" ];
  };
  # programs.eza = {
  #   enable = true;
  #   enableFishIntegration = true;
  #   icons = true;
  # };
  programs.fish = {
    enable = true;
    interactiveShellInit =
      /*
      fish
      */
      ''
        function fish_greeting
            echo Hello friend!
            echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
        end
              starship init fish | source
              set PATH $PATH /home/ver/.local/bin
      '';

    shellAliases = {
      ls = "eza";
      ll = "eza -l";
      cat = "bat";
      cc = "clear";
      c = "z";
      nv = "nvim";
      zj = "zellij";
      za = "zellij a";
      syss = "sudo systemctl status";
      sysr = "sudo systemctl restart";
      jctl = "journalctl -u --follow";
    };
  };
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
    icons = true;
  };
  programs.nushell = {
    enable = false;
    shellAliases = {
      lss = "eza";
      cdd = "z";
      cat = "bat";
    };
    extraConfig = ''
      let carapace_completer = {|spans|
      carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
       show_banner: false,
       completions: {
       case_sensitive: false # case-sensitive completions
       quick: true    # set to false to prevent auto-selecting completions
       partial: true    # set to false to prevent partial filling of the prompt
       algorithm: "fuzzy"    # prefix or fuzzy
       external: {
       # set to false to prevent nushell looking into $env.PATH to find more suggestions
           enable: true
       # set to lower can improve completion performance at the cost of omitting some options
           max_results: 100
           completer: $carapace_completer # check 'carapace_completer'
         }
       }
      }
      $env.PATH = ($env.PATH |
      split row (char esep) |
      prepend /home/myuser/.apps |
      append /usr/bin/env
      )
    '';
  };
  programs.carapace = {
    enableNushellIntegration = true;
    enable = false;
  };
  programs.fzf = {
    enable = true;
    #enableFishIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # interactiveOnly = true;
    # custom settings
    settings = {
      # add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };
  programs.git = {
    enable = true;
    userName = "Verantor";
    userEmail = "verantor@protonmail.com";
  };
  programs.yazi = {
    enable = true;
    package = pkgs.yazi;
    enableFishIntegration = true;
    settings = {
      manager = {
        ratio = [ 1 3 3 ];
        sort_by = "natural";
        sort_reverse = false;
        sort_dir_first = true;
        show_hidden = true;
        show_symlink = true;
        linemode = "size";
      };
      preview = {
        cache_dir = "${config.xdg.cacheHome}";
        max_height = 900;
        max_width = 600;
      };
      log.enable = false;
    };
  };
  programs.bat = {
    enable = true;
    config = {
      pager = "--RAW-CONTROL-CHARS --quit-if-one-screen --mouse";
      style = "plain";
    };
  };
}
