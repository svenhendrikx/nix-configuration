{ ... }:
{
    networking.firewall.allowedTCPPorts = [ 22 53 80 443 8000 8053 8069 8080 8443 9000 ];
    networking.firewall.trustedInterfaces = [
        "incusbr0"
    ];
    networking.wireguard.enable = true;
    networking.firewall.allowedUDPPorts = [ 53 51820 ];
    # networking.firewall.interfaces."wg0".allowedTCPPorts = [ 22 ];
}
