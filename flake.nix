{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nvf.url = "github:notashelf/nvf";
  };

  outputs = { nixpkgs, nvf, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      configModule = import ./config;

      customNeovim = nvf.lib.neovimConfiguration {
        modules = [ configModule ];
        inherit pkgs;
      };
    in { packages.${system}.default = customNeovim.neovim; };
}

