{
  description = "A set of simple applications to make robot life easier";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);

      system = "x86_64-linux";
    in
    {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs { inherit system; };
        in
        {
          onshape-to-robot = pkgs.callPackage ./onshape-to-robot.nix { };
          mjcf-urdf-simple-converter = pkgs.callPackage ./mjcf-urdf-simple-converter.nix { };
        }
      );

      devShells = forAllSystems (system: 
        let
          pkgs = import nixpkgs {inherit system;};
        in {

          default = pkgs.mkShell {
            # Use the 'self' reference to access your package
            packages = [
              self.packages.${system}.onshape-to-robot
              # self.packages.${system}.rabault-onshape-to-robot
              self.packages.${system}.mjcf-urdf-simple-converter
              # Add other standard packages as needed
            ];
          };
        }
      );
    };
}
