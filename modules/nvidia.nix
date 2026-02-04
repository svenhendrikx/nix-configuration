{ config, lib, pkgs, ... }:

{
  # Headless, no X server
  services.xserver.enable = false;
  services.xserver.videoDrivers = [ "nvidia" ];
  nixpkgs.config.allowUnfree = true;

  # NVIDIA driver setup
  hardware.nvidia = {
    # package = pkgs.linuxPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    open = true;
    # powerManagement.enable = false;
    # powerManagement.finegrained = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  hardware.nvidia-container-toolkit.enable = true;
  # virtualisation.incus.package = pkgs.incus;
  systemd.services.incus.environment.INCUS_LXC_HOOK = "${config.virtualisation.incus.lxcPackage}/share/lxc/hooks";


}
