{ pkgs, ... }: {
  home.packages = with pkgs; [
    stable.blender-hip
    darktable
    rawtherapee
    digikam
    # davinci-resolve
  ];
}
