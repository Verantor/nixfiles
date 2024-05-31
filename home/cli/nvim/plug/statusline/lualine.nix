{ config, ... }:
{
  plugins.lualine = {
    enable = true;
    iconsEnabled = true;
    globalstatus = true;
    alwaysDivideMiddle = true;
    sections = {
      lualine_a = [ "mode" ];
      lualine_z = [ "location" ];
    };
    # Disable the section separators.
    # sectionSeparators = {
    #   left = "";
    #   right = "";
    # };
  };
}
