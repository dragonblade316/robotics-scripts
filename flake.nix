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
          asyncqt = pkgs.callPackage ./asyncqt.nix { };
          moteus = pkgs.callPackage ./moteus.nix { };
        in
        {
          onshape-to-robot = pkgs.callPackage ./onshape-to-robot.nix { };
          mjcf-urdf-simple-converter = pkgs.callPackage ./mjcf-urdf-simple-converter.nix { };
          asyncqt = pkgs.callPackage ./asyncqt.nix { };
          moteus = pkgs.callPackage ./moteus.nix { };
          moteus-gui = pkgs.callPackage ./moteus-gui.nix { inherit asyncqt moteus; };
        }
      );

      apps = forAllSystems (system: {
        default = {
          type = "app";
          program = "${self.packages.${system}.moteus-gui}/bin/tview";
        };
        moteus-gui = {
          type = "app";
          program = "${self.packages.${system}.moteus-gui}/bin/tview";
        };
        moteus-tool = {
          type = "app";
          program = "${self.packages.${system}.moteus}/bin/moteus_tool";
        };
      });

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
              self.packages.${system}.asyncqt
              self.packages.${system}.moteus
              self.packages.${system}.moteus-gui
              # Add other standard packages as needed
            ];
          };
        }
      );
    };
}
