{ config, lib, pkgs, ... }:

{
  # Headless, no X server
  services.xserver.enable = false;
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.allowUnfree = true;

  # NVIDIA driver setup (needs to be set even in container)
  hardware.nvidia = {
    open = true;
  };

}
