{inputs, ...}: {
  flake-file.inputs.nix-flatpak = {
    url = "github:gmodena/nix-flatpak";
  };

  flake.nixosModules.flatpak = {
    pkgs,
    lib,
    config,
    ...
  }: {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    options = {
      flatpak.packages = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [];
        example = ["org.gimp.GIMP"];
        description = "Flatpak application IDs to install system-wide.";
      };
    };
    config = {
      services.flatpak = {
        enable = true;
        packages = config.flatpak.packages;
      };

      systemd.services.flatpak-repo = {
        wantedBy = ["multi-user.target"];
        path = [pkgs.flatpak];
        script = ''
          flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
        '';
      };
    };
  };
}
