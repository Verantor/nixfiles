{ pkgs
, config
, ...
}: {
  xdg.configFile."openxr/1/active_runtime.json".text = ''
      {
        "file_format_version": "1.0.0",
        "runtime": {
            "name": "Monado",
            "library_path": "${pkgs.callPackage ../../pkgs/package.nix {}}/lib/wivrn/libopenxr_wivrn.so",
            "MND_libmonado_path": "${pkgs.callPackage ../../pkgs/package.nix {}}/lib/wivrn/libmonado.so"
        }
    }  '';
  xdg.configFile."openvr/openvrpaths.vrpath".text = ''
    {
      "config" :
      [
        "${config.xdg.dataHome}/Steam/config"
      ],
      "external_drivers" : null,
      "jsonid" : "vrpathreg",
      "log" :
      [
        "${config.xdg.dataHome}/Steam/logs"
      ],
      "runtime" :
      [
        "${pkgs.opencomposite}/lib/opencomposite"
      ],
      "version" : 1
    }
  '';
}
