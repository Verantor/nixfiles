{ pkgs, ... }: {
  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
  ];
  environment.variables.AMD_VULKAN_ICD = "RADV";
  hardware.opengl = {
    # Mesa
    enable = true;

    # Vulkan
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr.icd
      rocm-opencl-icd
      amdvlk
    ];
  };
}
