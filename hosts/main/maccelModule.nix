{ pkgs ? import <nixpkgs> { } }:
let
  stdenv = pkgs.stdenv;
  lib = pkgs.lib;
  fetchFromGitHub = pkgs.fetchFromGitHub;
  kernel = pkgs.linuxPackages_zen.kernel;
  kmod = pkgs.kmod;
in
stdenv.mkDerivation rec {
  name = "maccel-${version}-${kernel.version}";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "Gnarus-G";
    repo = "maccel";
    rev = "v${version}";
    sha256 = "sha256-Unrv2GKvndGZauYyNvjDvqHI+r6zO51aZTG0xmMhrng=";
  };

  # sourceRoot = "./driver/";
  hardeningDisable = [ "pic" "format" ]; # 1
  nativeBuildInputs = kernel.moduleBuildDependencies; # 2

  # makeFlags = [
  #   "KERNELRELEASE=${kernel.modDirVersion}" # 3
  #   "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" # 4
  #   "MODULEDIR=$(out)/modules/${kernel.modDirVersion}/build/kernel/drivers/usb"
  #   "INSTALL_MOD_PATH=$(out)" # 5
  # ];
  buildPhase = ''
    make -C "${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" modules "M=$(pwd -P)/driver"
  '';

  # KERNELRELEASE = "${kernel.modDirVersion}";
  # MODULEDIR = "$(out)/lib/modules/${kernel.modDirVersion}/build/kernel/drivers/usb";
  # # DRIVERDIR = "$(out)/modules/";
  installPhase = ''
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/build/kernel/drivers/usb

    cp -v ./driver/*.ko  $out/lib/modules/${kernel.modDirVersion}/build/kernel/drivers/usb

    # ${pkgs.kmod}/bin/insmod $out/lib/modules/${kernel.modDirVersion}/build/kernel/drivers/usb/*.ko

    # groupadd -f maccel

     # chown -v :maccel /sys/module/maccel/parameters/*

    # ls -l /sys/module/maccel/parameters/*

  '';
  meta = with lib; {
    description = "A mouse acceleration driver for Linux";
    homepage = "https://github.com/Gnarus-G/maccel";
    license = licenses.gpl2;
    maintainers = [ maintainers.Verantor ];
    platforms = platforms.linux;
  };
}
