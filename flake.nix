{
  description = "A dmenu wrapper over bitwarden cli";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in rec {
        packages =
          flake-utils.lib.flattenTree { bwmenu = import ./. { inherit pkgs; }; };
        defaultPackage = packages.bwmenu;
        apps.bwmenu = flake-utils.lib.mkApp { drv = packages.bwmenu; };
        defaultApp = apps.bwmenu;
      });
}
