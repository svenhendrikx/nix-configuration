{ ... }:
{
    networking.firewall.allowedTCPPorts = [ 22 80 443 8000 8069 9000 ];
    networking.firewall.trustedInterfaces = [
        "incusbr0"
    ];
    networking.hostName = "nixos"
    # networking.firewall.allowedUDPPorts = [ 51820 ];
    # networking.firewall.interfaces."wg0".allowedTCPPorts = [ 22 ];
}
