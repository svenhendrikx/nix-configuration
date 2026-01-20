{
  description = "Sven's NixOS configuration";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

  outputs = { self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
  in {
    nixosConfigurations.incus = nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        /etc/nixos/configuration.nix   # Incus-generated root

        ./modules/base.nix
        ./modules/networking.nix
        ./modules/users.nix
        ./modules/docker.nix
        ./modules/packages.nix
        ./modules/programs.nix
        ./modules/aliases.nix
        ./modules/neovim-config.nix
      ];
    };
  };
}
