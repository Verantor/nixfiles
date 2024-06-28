{ stdenv, lib, fetchFromGitHub, kernel, kmod }:

stdenv.mkDerivation rec {
  name = "maccel-${version}-${kernel.version}";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "Verantor";
    repo = "maccel";
    rev = "v${version}";
    sha256 = "1d9qpnmqa3pfwsrpjnxdz76ipk4w37bbxyrazchh4vslnfc886fx";
  };

  sourceRoot = "driver";
  hardeningDisable = [ "pic" "format" ]; # 1
  nativeBuildInputs = kernel.moduleBuildDependencies; # 2

  makeFlags = [
    "KERNELRELEASE=${kernel.modDirVersion}" # 3
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build" # 4
    "MODULEDIR?=${kernel.dev}/lib/modules/${kernel.modDirVersion}/kernel/drivers/usb"
    "INSTALL_MOD_PATH=$(out)" # 5
  ];
  installPhase = ''
    	mkdir -p $(MODULEDIR)
    	sudo cp -v $(DRIVERDIR)/*.ko $(MODULEDIR);
    	sudo chown -v root:root $(MODULEDIR)/*.ko;
    	sudo insmod $(MODULEDIR)/*.ko;
    	sudo groupadd -f maccel;
    	sudo depmod; 
    	sudo chown -v :maccel /sys/module/maccel/parameters/*;
    	ls -l /sys/module/maccel/parameters/*
    	echo '[Recommended] Add yourself to the "maccel" group'
    	echo '[Recommended] usermod -aG maccel $$USER'
  '';
  meta = with lib; {
    description = "A mouse acceleration driver for Linux";
    homepage = "https://github.com/Gnarus-G/maccel";
    license = licenses.gpl2;
    maintainers = [ maintainers.Verantor ];
    platforms = platforms.linux;
  };
}
