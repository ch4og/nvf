{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf = {
      url = "github:notashelf/nvf";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    nvf,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
      configModule = import ./config;

      customNeovim = nvf.lib.neovimConfiguration {
        modules = [configModule];
        inherit pkgs;
      };
    in {
      packages = {
        neovim = customNeovim.neovim;
        default = customNeovim.neovim;
      };
    });
}
