{ pkgs, ... }:
{
    systemd.user.services.nvim-config = {
        description = "Clone Neovim config if missing";

        serviceConfig = {
            Type = "oneshot";
        };

        script = ''
            if [ ! -d "$HOME/.config/nvim" ]; then
                mkdir -p "$HOME/.config"
                    ${pkgs.git}/bin/git clone \
                    https://github.com/svenhendrikx/okay-nvim-conf.git \
                    "$HOME/.config/nvim"
                    fi
                    '';

        wantedBy = [ "default.target" ];
    };
}
