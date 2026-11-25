{
  description = "packwiz devshell";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }: {
        perSystem = { pkgs, ... }: {
          devShells = {
            default = pkgs.mkShell {
              packages = with pkgs; [
                packwiz
              ];
            };
          };
        };
        # flake = {
        #   manifest = inputs.fetch-packwiz.lib.mkManifest ./pack.toml;
        #   pack = inputs.fetch-packwiz.lib.mkPackwizPack {
        #     inherit (self) manifest;
        #   };
        # };
        systems = lib.systems.flakeExposed;
      }
    );
}
