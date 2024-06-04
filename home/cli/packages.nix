{ config
, pkgs
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
    loupe
    impression
    android-studio
    ffmpeg
  ];

  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };
  programs.zellij = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      on_force_close = "quit";
      simplified_ui = false;
      default_layout = "default";
      ui.pane_frames.rounded_corners = true;
    };
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [ "--cmd cdd" ];
  };
  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = true;
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source
      set PATH $PATH /home/ver/.local/bin
    '';

    shellAliases = {
      ls = "lsd";
      cat = "bat";
      cc = "clear";
      c = "z";
      syss = "sudo systemctl status";
      sysr = "sudo systemctl restart";
      jctl = "journalctl -u --follow";
    };
  };
  programs.lsd = {
    enable = true;
    settings = {
      date = "relative";
      ignore-globs = [
        #".git"
        #".hg"
      ];
    };
  };
  programs.nushell = {
    enable = true;
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
       show_banner: true,
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
       }}
    '';
  };
  # programs.carapace = {
  #   enableFishIntegration = true;
  #   enable = true;
  # };
  programs.fzf = {
    enable = true;
    #enableFishIntegration = true;
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    # custom settings
    settings = {
      add_newline = false;
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
