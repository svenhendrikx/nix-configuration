{ config, lib, pkgs, ... }:

{
  # NVIDIA driver setup, needs nvidia-runtime.nix to be enabled as well
  hardware.nvidia = {
    # package = pkgs.linuxPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    # powerManagement.enable = false;
    # powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.nvidia-container-toolkit.enable = true;
}
