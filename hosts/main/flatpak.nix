{ lib, ... }: {
  services = {
    flatpak = {
      remotes = lib.mkOptionDefault [
        {
          name = "flathub-beta";
          location = "https://flathub.org/beta-repo/flathub-beta.flatpakrepo";
        }
      ];
      packages = [
        "io.bassi.Amberol"
        "dev.bragefuglseth.Keypunch"
        "org.freecadweb.FreeCAD"
        "org.gnome.gitlab.YaLTeR.Identity"
        "org.localsend.localsend_app"
        "org.nickvision.tubeconverter"
        "org.upscayl.Upscayl"
        "org.surge_synth_team.surge-xt"
        "org.hydrogenmusic.Hydrogen"
        "com.prusa3d.PrusaSlicer"
        "org.beeref.BeeRef"
      ];
      uninstallUnmanaged = true;
    };
  };
}
