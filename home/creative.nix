{ pkgs, ... }: {
  home.packages = with pkgs; [
    blender-hip
    darktable
    rawtherapee
    digikam
    davinci-resolve
  ];
}
