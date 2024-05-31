{ ... }: {
  services.borgbackup.jobs."borgbase" = {
    paths = [
      "/home/ver/Documents/"
      "/home/ver/coding/"
    ];
    exclude = [
      # very large paths
      "/var/lib/docker"
      "/var/lib/systemd"
      "/var/lib/libvirt"

      # temporary files created by cargo and `go build`
      "**/target"
      "/home/*/go/bin"
      "/home/*/go/pkg"
    ];
    repo = "nq58mw6d@nq58mw6d.repo.borgbase.com:repo";
    encryption = {
      mode = "repokey-blake2";
      passCommand = "cat /borgbackup/passphrase";
    };
    environment.BORG_RSH = "ssh -i /home/ver/.ssh/id_ed25519";
    compression = "auto,lzma";
    startAt = "daily";
  };
}
