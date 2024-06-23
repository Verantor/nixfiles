{pkgs, ...}: {
  services.xserver.videoDrivers = ["amdgpu"];

  environment.systemPackages = with pkgs; [
    vulkan-loader
    vulkan-validation-layers
    vulkan-tools
    radeon-profile
    nvtopPackages.amd
  ];
  environment.variables = {
    AMD_VULKAN_ICD = "RADV";
    RADV_VIDEO_DECODE = "1";
  };
  programs.corectrl = {
    enable = true;
    gpuOverclock = {
      ppfeaturemask = "0xffffffff";
      enable = true;
    };
  };
  hardware.graphics = {
    enable = true;
    enabke32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr.icd
      rocm-opencl-icd
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
  hardware.opengl = {
    # Mesa
    enable = true;

    # Vulkan
    # driSupport = true;
    # driSupport32Bit = true;
    extraPackages = with pkgs; [
      vaapiVdpau
      libvdpau-va-gl
      rocmPackages.clr.icd
      rocm-opencl-icd
      amdvlk
    ];
    extraPackages32 = with pkgs; [
      driversi686Linux.amdvlk
    ];
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
    		if ((action.id == "org.corectrl.helper.init" ||
    		action.id == "org.corectrl.helperkiller.init") &&
    		subject.local == true &&
    		subject.active == true &&
    		subject.isInGroup("users")) {
    			return polkit.Result.YES;
    	}
    });
  '';

  #TODO rcom make problems with gamescope
}
