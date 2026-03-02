{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.vm.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.vm.enable {
    environment.systemPackages = with pkgs; [
      quickemu
      qemu
    ];
  };
}
