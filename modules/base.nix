{ ... }:
{
    time.timeZone = "Europe/Amsterdam";
    i18n.defaultLocale = "en_US.UTF-8";

    services.openssh.enable = true;

    security.sudo.enable = true;
    security.sudo.wheelNeedsPassword = false;
}
