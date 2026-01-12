{
  pkgs,
  lib,
  config,
  ...
}: {
  options = {
    nixConf.vm.enable = lib.mkEnableOption "enables qemu vm software";
  };
  config = lib.mkIf config.nixConf.vm.enable {
    environment.systemPackages = with pkgs; [
      quickemu
      qemu
    ];
  };
}
