{ config
, pkgs
, inputs
, ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "ver";
  home.homeDirectory = "/home/ver";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [

    vesktop
    bottles
    firefox
    helix
    anki-bin
    mullvad-vpn
    blender-hip
    gnomeExtensions.gnome-40-ui-improvements
    #GNOME
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dash-to-dock
    gnomeExtensions.tiling-assistant
    gnomeExtensions.forge
    gnomeExtensions.valent
    gnomeExtensions.appindicator
    valent
    adw-gtk3
    gnome.gnome-tweaks

    #PLASMA
    discover

    #GAMING
    goverlay

    #NIX things
    nix-output-monitor

    #TOPS
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    #Tools: shit
    nmap
    #Tools: utils
    tio
    ouch
    partition-manager
    xwaylandvideobridge
    lapce
    alejandra
    libnotify
    obsidian
    nil
    qbittorrent-qt5
  ];
  programs.git = {
    enable = true;
    userName = "Verantor";
    userEmail = "verantor@protonmail.com";
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
  programs.mpv = {
    enable = true;
    scripts = [ pkgs.mpvScripts.mpris ];
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source 
    '';
    #    zoxide init fish | source

    shellAliases = {
      ls = "lsd";
      cd = "z";
    };
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.mangohud = {
    enable = true;
    enableSessionWide = true;
  };
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };
  programs.zoxide = {
    enable = true;
    #enableFishIntegration = true;
  };
  programs.lsd = {
    enable = true;
  };
  # Add Firefox GNOME theme directory
  home.file."firefox-gnome-theme" = {
    target = ".mozilla/firefox/default/chrome/firefox-gnome-theme";
    source = fetchTarball {
      url = "https://github.com/rafaelmardojai/firefox-gnome-theme/archive/master.tar.gz";
      sha256 = "1vbnsjs3sy4ipa2s47fy534bhhq7qr73wvydal63n2md664pvfa5";
    };

  };

  programs.firefox = {
    enable = true;
    profiles.default = {
      name = "Default";
      settings = {
        # For Firefox GNOME theme:
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;
      };
      userChrome = ''
        @import "firefox-gnome-theme/userChrome.css";
        @import "firefox-gnome-theme/theme/colors/dark.css"; 
      '';
    };
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  manual.html.enable = false;
  manual.manpages.enable = false;
  manual.json.enable = false;
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ver/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "hx";
    NIXOS_OZONE_WL = "1";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
