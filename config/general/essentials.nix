{
  pkgs,
  lib,
  config,
  ...
}: {
  options.nixConf.essentials.enable = lib.mkEnableOption "";
  config = lib.mkIf config.nixConf.essentials.enable {
    environment.systemPackages = with pkgs; [
      steam-run
      btop
      appimage-run
    ];
    programs.git.enable = true;
  };
}
