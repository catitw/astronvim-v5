{
  description = "My Neovim Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [
          ];

          buildInputs = with pkgs; [
            gnumake
          ];

          # [marksman issue](https://stackoverflow.com/a/69685330)
          DOTNET_SYSTEM_GLOBALIZATION_INVARIANT = 1;
        };
      }
    );
}
