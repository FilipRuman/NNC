{
  flake.nixosModules.auto_mount = {
    services.udisks2.enable = true;

  };

  flake.homeModules.general =
    { pkgs, ... }:
    {
      services.udiskie = {
        enable = true;
        settings = {
          # workaround for
          # https://github.com/nix-community/home-manager/issues/632
          program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.kdePackages.dolphin}/bin/dolphin";
          };
        };
      };
    };
}
