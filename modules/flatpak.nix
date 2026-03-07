{inputs, ...}: {
  flake-file.inputs.nix-flatpak = {
    url = "github:gmodena/nix-flatpak";
  };

  flake.nixosModules.flatpak = {pkgs, ...}: {
    imports = [inputs.nix-flatpak.nixosModules.nix-flatpak];

    services.flatpak = {
      enable = true;
    };

    systemd.services.flatpak-repo = {
      wantedBy = ["multi-user.target"];
      path = [pkgs.flatpak];
      script = ''
        flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
