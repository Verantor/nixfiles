{ pkgs

, ...
}: {
  home.packages = with pkgs; [
    nix-output-monitor
    btop # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
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
  ];




  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
  programs.lsd = {
    enable = true;
  };
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      starship init fish | source 
      zoxide init fish | source
    '';


    shellAliases = {
      ls = "lsd";
      #cd = "z";
    };
  };
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
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
}
