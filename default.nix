{ pkgs ? import <nixpkgs> { } }:

pkgs.stdenv.mkDerivation {
  name = "bwmenu";
  unpackPhase = "true";
  installPhase = ''
    mkdir -p $out/bin
    cp ${./lib-bwmenu} $out/bin/lib-bwmenu
    cp ${./bwmenu} $out/bin/bwmenu
    chmod +x $out/bin/bwmenu
  '';
}
