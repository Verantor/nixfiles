# just is a command runner, Justfile is very similar to Makefile, but simpler.

# use nushell for shell commands
set shell := ["bash", "-c"]

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################


up:
  sudo nixos-rebuild switch --upgrade --flake .#who |& nom

# Update specific input
# Usage: just upp nixpkgs

history:
  nix profile history --profile /nix/var/nix/profiles/system

rb:
  sudo nixos-rebuild switch --flake .#main |& nom

iso:
  nix build .#nixosConfigurations.iso.config.system.build.isoImage

clean:
  # remove all generations older than 7 days
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old

gitgc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now






fmt:
  # format the nix files in this repo
  nixpkgs-fmt .

path:
   $env.PATH | split row ":"



