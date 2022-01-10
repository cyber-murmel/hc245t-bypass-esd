{
  pkgs ?
  # nixpkgs 21.11, deterministic. Last updated: 2022-01-01.
  import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/8a053bc.tar.gz")) {}
}:

with pkgs;
let
  kicad6-git = kicad-unstable.override {
    srcs = {
      kicadVersion = "2021-11-23";
      kicad = fetchFromGitLab {
        group = "kicad";
        owner = "code";
        repo = "kicad";
        # 6.99 on 2022-01-09
        rev = "76368af7";
        sha256 = "1zlfp2bj0gaw5wljk3kmmfrs2rb17ca72h37k4i6fp7vdb26xr2y";
      };
    };
  };
in
mkShell {
  buildInputs = [
    kicad6-git
    zip
  ];
}

