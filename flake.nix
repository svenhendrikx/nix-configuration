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
        /etc/nixos/configuration.nix

        ./modules/base.nix
        ./modules/users.nix
        ./modules/networking.nix
        ./modules/packages.nix
        ./modules/programs.nix
        ./modules/aliases.nix

        # Toggle if needed
        # ./modules/nvidia-driver.nix
        # ./modules/nvidia-runtime.nix
        # ./modules/incus.nix
        # ./modules/docker.nix
        # ./modules/neovim-config.nix
      ];
    };
  };
}
