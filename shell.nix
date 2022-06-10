{ pkgs ? import <nixpkgs> { } }: with pkgs;

# let
#   myglib = callPackage nix/pkgs/glib/default.nix { util-linuxMinimal = glib; };
# in
mkShell {

  buildInputs = [
    nix-prefetch-git
    figlet
    nim
    gcc
    avro-c
    rdkafka
    libserdes
  ];

  shellHook = ''
    figlet " c2nim_wappers  - A collection of Nim wrappers of C libs"

  '';
}