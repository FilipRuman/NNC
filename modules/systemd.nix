{
  flake.nixosModules.systemdBoot = {
    boot.loader.systemd-boot.enable = true;
  };
}
