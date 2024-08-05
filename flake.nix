{
  description = "Raizel's NixOS install";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { self, nixpkgs, impermanence }: {
    nixosConfigurations = {
      mu = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          impermanence.nixosModules.impermanence
        ];
      };
    };
  };
}
