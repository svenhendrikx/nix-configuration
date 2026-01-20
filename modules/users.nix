{ pkgs, ... }:
{
    users.users.sven = {
        isNormalUser = true;
        home = "/home/sven";
        description = "sven";
        extraGroups = [ "wheel" "networkmanager" "docker" ];
        openssh.authorizedKeys.keys = [
            "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICYSpOHFy/h/UscZO4/Hna3YBDnYoVRSg9+nTee4jzK/"
        ];
        shell = pkgs.zsh;
    };
}
